package com.metro.model.pojos;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Login {
    private int cardId;
    @NotBlank(message = "Password Cannot Be Blank")
    private String password;
}
