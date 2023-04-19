package pl.coderslab.finalproject;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String firstName;
    private String lastName;
    private String nickName;
    private String email;
    private String password;
    @Column(columnDefinition = "boolean default false")
    private boolean isBlocked;
    @Column(columnDefinition = "boolean default false")
    private boolean isAdmin;
}

