package com.metro.model.pojos;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Getter
@AllArgsConstructor
@NoArgsConstructor

public class Card {
    private int cardId;
    private String cardType;
    private int balance;
    private Timestamp activeSince;

    public Card(String cardType, int balance) {
        this.cardType = cardType;
        this.balance = balance;

    }

}
