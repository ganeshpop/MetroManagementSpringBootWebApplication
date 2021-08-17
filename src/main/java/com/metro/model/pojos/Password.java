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
public class Password {
    @NotBlank(message = "Old Password Cannot Be Blank")
    private String oldPassword;
    @NotBlank(message = "New Password Cannot Be Blank")
    private String newPasswordOne;
    @NotBlank(message = "New Password Cannot Be Blank")
    private String newPasswordTwo;
}
