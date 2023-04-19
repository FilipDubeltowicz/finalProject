package pl.coderslab.finalproject.ranking;

import lombok.*;
import pl.coderslab.finalproject.game.Game;
import pl.coderslab.finalproject.user.User;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Table(name = "rankings")
public class Ranking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;
    @ManyToOne(fetch = FetchType.LAZY)
    private Game game;
    private LocalDate Date;
    private int points;
}

