package pl.coderslab.finalproject.user;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pl.coderslab.finalproject.team.Team;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotEmpty
    @Size(min = 3, max = 20)
    private String firstName;
    @NotEmpty
    @Size(min = 3, max = 20)
    private String lastName;
    @NotEmpty
    @Pattern(regexp = "^[a-zA-Z0-9]+$", message = "Nickname can only contain letters and numbers")
    private String nickName;
    @NotEmpty
    @Email
    private String email;
    @NotEmpty
    private String password;
    private boolean isBlocked;
    private boolean isAdmin;
    @ManyToOne
    private Team team;

    public Long getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getNickName() {
        return nickName;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public boolean isBlocked() {
        return isBlocked;
    }

    // getter modified for correct picking in app-leftnav.jsp
    public boolean getisAdmin() {
        return isAdmin;
    }

    public Team getTeam() {
        return team;
    }
}