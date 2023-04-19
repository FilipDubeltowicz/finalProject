package pl.coderslab.finalproject.team;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.finalproject.ranking.Ranking;

public interface TeamRepository extends JpaRepository<Team, Long> {
    Ranking findById(long id);
}
