package com.metro.controllers;

import com.metro.model.pojos.Card;
import com.metro.model.pojos.Login;
import com.metro.model.pojos.SignUp;
import com.metro.model.service.card.CardService;
import com.metro.model.service.logger.UserLogProducer;
import com.metro.model.service.transaction.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;


@Controller
@SessionAttributes("card")
public class MetroSessionController {
    CardService cardService;
    TransactionService transactionService;
    UserLogProducer userLogProducer;

    @Autowired
    public void setUserLogProducer(UserLogProducer userLogProducer) {
        this.userLogProducer = userLogProducer;
    }


    @ModelAttribute("card")
    public Card setSession(Card card) {
        return card;
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

    @RequestMapping("login")
    public ModelAndView loginController() {
        return new ModelAndView("metroLogin", "login", new Login());
    }

    @RequestMapping("signup")
    public ModelAndView signupController() {
        return new ModelAndView("metroSignUp", "signup", new SignUp());
    }

    @RequestMapping("logout")
    public ModelAndView logoutController(HttpSession session) {
        session.invalidate();
        return new ModelAndView("metroLogin", "login", new Login());
    }


    @RequestMapping("verifyCard")
    public ModelAndView verifyController(@Valid @ModelAttribute("login") Login login, BindingResult result) {
        ModelAndView modelAndView = new ModelAndView();
        if (result.hasErrors()) {
            return new ModelAndView("metroLogin", "command", new Login());
        }
        if (cardService.isACard(login.getCardId())) {
            if (cardService.validatePassword(login.getCardId(), login.getPassword())) {
                Card card = cardService.getCardDetails(login.getCardId());
                modelAndView.addObject("message", "You Are Now Logged In");
                modelAndView.addObject("card", card);
                modelAndView.setViewName("metroMenu");
                setSession(card);
                userLogProducer.sendMessage("Successful Login Attempt From Card ID - " + login.getCardId());
                return modelAndView;
            } else {
                userLogProducer.sendMessage("Login Attempt From Invalid Card ID - " + login.getCardId());
                return new ModelAndView("metroLoginOutput", "message", "Invalid Password, Try Again");
            }
        } else {
            userLogProducer.sendMessage("Failed Login Attempt From Card ID - " + login.getCardId());
            return new ModelAndView("metroLoginOutput", "message", "Invalid Card");
        }

    }


    @RequestMapping("createCard")
    public ModelAndView createController(@Valid @ModelAttribute("signup") SignUp signUp, BindingResult result) {
        ModelAndView modelAndView = new ModelAndView();
        if (result.hasErrors()) {
            return new ModelAndView("metroSignUp", "command", new SignUp());
        }
        if (signUp.getPasswordOne().equals(signUp.getPasswordTwo())) {
            int intCardId = cardService.addCard(new Card("Basic", signUp.getBalance()));
            if (intCardId > 0) {
                if (cardService.setPassword(intCardId, signUp.getPasswordOne())) {
                    modelAndView.addObject("message", "Congratulations, " + signUp.getUserName() + " you have been assigned a metro card, Please remember your Card ID for future.");
                    modelAndView.addObject("card", cardService.getCardDetails(intCardId));
                    setSession(cardService.getCardDetails(intCardId));
                    modelAndView.setViewName("metroMenu");
                    userLogProducer.sendMessage("Successful SignUp Attempt, Created Card ID - " + intCardId);
                }
                return modelAndView;
            } else {
                userLogProducer.sendMessage("Failed SignUp Attempt");
                return new ModelAndView("createCardOutput", "message", "Card Creation Failed");
            }
        } else {
            userLogProducer.sendMessage("Failed SignUp Attempt");
            return new ModelAndView("createCardOutput", "message", "Passwords Didnt Match, Try Again");
        }
    }


}
