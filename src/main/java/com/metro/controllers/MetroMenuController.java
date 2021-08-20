package com.metro.controllers;

import com.metro.model.exceptions.InsufficientBalanceException;
import com.metro.model.exceptions.InvalidStationException;
import com.metro.model.exceptions.InvalidSwipeInException;
import com.metro.model.exceptions.InvalidSwipeOutException;
import com.metro.model.pojos.Amount;
import com.metro.model.pojos.Card;
import com.metro.model.pojos.Password;
import com.metro.model.pojos.Transaction;
import com.metro.model.service.card.CardService;
import com.metro.model.service.card.CardServiceInterface;
import com.metro.model.service.station.StationService;
import com.metro.model.service.station.StationServiceInterface;
import com.metro.model.service.transaction.TransactionService;
import com.metro.model.service.transaction.TransactionServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@SessionAttributes("card")
public class MetroMenuController {
    CardServiceInterface cardService;
    TransactionServiceInterface transactionService;
    StationServiceInterface stationService;

    @ModelAttribute("card")
    public Card setSession(Card card) {
        return card;
    }

    @Autowired
    @Qualifier("stationService")
    public void setStationService(StationService stationService) {
        this.stationService = stationService;
    }

    @Autowired
    @Qualifier("transactionService")
    public void setTransactionService(TransactionService transactionService) {
        this.transactionService = transactionService;
    }

    @Autowired
    @Qualifier("cardService")
    public void setCardService(CardService cardService) {
        this.cardService = cardService;
    }


    @RequestMapping("menu")
    public ModelAndView menuController(@ModelAttribute("card") Card card, HttpSession session) {
        return new ModelAndView("metroMenu", "card", session.getAttribute("card"));
    }

    @RequestMapping("getCard")
    public ModelAndView cardController(HttpSession session) {
        return new ModelAndView("cardDetails", "card", cardService.getCardDetails(((Card) session.getAttribute("card")).getCardId()));
    }

    @RequestMapping("getTransactions")
    public ModelAndView transactionController(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("metroTransactions", "card", session.getAttribute("card"));
        modelAndView.addObject("transactions", transactionService.getAllTransactions(((Card) session.getAttribute("card")).getCardId()));
        return modelAndView;
    }

    @RequestMapping("rechargeCard")
    public ModelAndView rechargeController(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("cardRecharge", "card", cardService.getCardDetails(((Card) session.getAttribute("card")).getCardId()));
        return modelAndView.addObject("amount", new Amount());

    }


    @RequestMapping("passwordChange")
    public ModelAndView passwordChangeController(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("metroChangePassword", "card", cardService.getCardDetails(((Card) session.getAttribute("card")).getCardId()));
        return modelAndView.addObject("password", new Password());

    }

    @RequestMapping("topUpCard")
    public ModelAndView topUpController(@Valid @ModelAttribute("amount") Amount amount, BindingResult result, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("cardRechargeOutput", "card", session.getAttribute("card"));
        if (result.hasErrors()) {
            return new ModelAndView("cardRecharge", "command", new Amount());
        }
        int intAmount = amount.getAmount();
        if (0 < intAmount && intAmount <= 1000) {
            if (cardService.rechargeCard(((Card) session.getAttribute("card")).getCardId(), intAmount)) {
                setSession(cardService.getCardDetails(((Card) session.getAttribute("card")).getCardId()));
                modelAndView.addObject("message", " Recharge Successful, Current Balance is :" + cardService.getBalance(((Card) session.getAttribute("card")).getCardId()));
            } else modelAndView.addObject("message", "Recharge Failed, Try Again");
        } else modelAndView.addObject("message", "Invalid Range, Permitted Range [1 to 1000]");
        return modelAndView;
    }

    @RequestMapping("swipeIn")
    public ModelAndView swipeInController(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("metroSwipeIn", "card", session.getAttribute("card"));
        modelAndView.addObject("card", cardService.getCardDetails(((Card) session.getAttribute("card")).getCardId()));
        modelAndView.addObject("stations", stationService.getAllStations());
        return modelAndView;
    }


    @RequestMapping("cardSwipeIn")
    public ModelAndView cardSwipeInController(@RequestParam("swipeInStation") int swipeInStation, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("metroSwipeInOutput", "card", session.getAttribute("card"));
        try {
            String sourceStation = transactionService.swipeIn(((Card) session.getAttribute("card")).getCardId(), swipeInStation);
            if (sourceStation != null)
                modelAndView.addObject("message", " Swipe In Successful At Station " + sourceStation);
            else modelAndView.addObject("message", "Swipe In Failed, Try Again");
            return modelAndView;
        } catch (InsufficientBalanceException | InvalidStationException | InvalidSwipeInException e) {
            modelAndView.addObject("message", e.getMessage());
            return modelAndView;
        }
    }


    @RequestMapping("swipeOut")
    public ModelAndView swipeOutController(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("metroSwipeOut", "card", session.getAttribute("card"));
        modelAndView.addObject("card", cardService.getCardDetails(((Card) session.getAttribute("card")).getCardId()));
        modelAndView.addObject("stations", stationService.getAllStations());
        return modelAndView;
    }

    @RequestMapping("changePassword")
    public ModelAndView passwordController(@Valid @ModelAttribute("password") Password password, BindingResult result, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("metroPasswordChangeOutput", "card", session.getAttribute("card"));
        if (result.hasErrors()) {
            return new ModelAndView("metroChangePassword", "command", new Password());
        }
        if (cardService.validatePassword(((Card) session.getAttribute("card")).getCardId(), password.getOldPassword())) {
            if (password.getNewPasswordOne().equals(password.getNewPasswordTwo())) {
                if (cardService.setPassword(((Card) session.getAttribute("card")).getCardId(), password.getNewPasswordOne()))
                    modelAndView.addObject("message", "Password Updated Successfully");
            } else modelAndView.addObject("message", "Passwords Didn't Match, Try Again");
        } else modelAndView.addObject("message", "You Have Entered a Wrong Password");
        return modelAndView;
    }


    @RequestMapping("cardSwipeOut")
    public ModelAndView cardSwipeOutController(@RequestParam("swipeOutStation") String swipeOutStation, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("metroSwipeOutOutput", "card", session.getAttribute("card"));
        try {
            Transaction transaction = transactionService.swipeOut(((Card) session.getAttribute("card")).getCardId(), Integer.parseInt(swipeOutStation));
            if (transaction != null) {
                modelAndView.addObject("message", " Swipe Out Successful  ");
                modelAndView.addObject("transaction", transaction);
                setSession(cardService.getCardDetails(((Card) session.getAttribute("card")).getCardId()));
            } else modelAndView.addObject("message", "Swipe Out Failed, Try Again");
            return modelAndView;
        } catch (InvalidStationException | InvalidSwipeOutException e) {
            modelAndView.addObject("message", e.getMessage());
            return modelAndView;
        }
    }

}
