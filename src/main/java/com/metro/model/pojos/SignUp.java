package com.metro.model.pojos;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SignUp {
    @NotBlank(message = "Name Cannot Be Blank")
    private String userName;
    @Min(value = 100, message = "Must Be Equal or Greater than 100")
    @Max(value = 1000, message = "Must Be Equal or Less Than 1000")
    private int balance;
    @Size(min = 5, message = "Password Should Have Minimum 5 Characters")
    private String passwordOne;
    @Size(min = 5, message = "Password Should Have Minimum 5 Characters")
    private String passwordTwo;

}
