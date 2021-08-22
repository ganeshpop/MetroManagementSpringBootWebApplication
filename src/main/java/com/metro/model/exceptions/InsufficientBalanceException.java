package com.metro.model.exceptions;


public class InsufficientBalanceException extends Exception {
    public InsufficientBalanceException() {
        super("Your Card has Insufficient Balance Please Recharge Your Card ");
    }

    public InsufficientBalanceException(String message) {
        super(message);
    }
}
