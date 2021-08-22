package com.metro.model.exceptions;


public class InvalidSwipeOutException extends Exception {

    public InvalidSwipeOutException() {
        super( "You Have not Swiped In at any Station");
    }

    public InvalidSwipeOutException(String message) {
        super(message);
    }


}
