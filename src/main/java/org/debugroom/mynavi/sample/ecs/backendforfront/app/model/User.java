package org.debugroom.mynavi.sample.ecs.backendforfront.app.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class User {

    String userId;
    String userName;

}