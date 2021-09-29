package com.metro.model.pojos;


import lombok.*;

import javax.validation.constraints.NotNull;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SelectedStation {

    @NotNull(message = "Station Cannot Be Blank!")
    private String selectedStationId;
}
