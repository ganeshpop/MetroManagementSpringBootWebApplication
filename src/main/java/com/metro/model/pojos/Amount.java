package com.metro.model.pojos;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Amount {

    @Min(value = 1, message = "Must Be Equal or Greater than 1")
    @Max(value = 1000, message = "Must Be Equal or Less Than 1000")
    private int amount;

}
