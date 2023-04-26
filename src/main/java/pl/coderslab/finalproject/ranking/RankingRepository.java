package pl.coderslab.finalproject.ranking;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface RankingRepository extends JpaRepository<Ranking, Long> {

    Ranking findById(long id);

    List<Ranking> findTop5ByGameIdOrderByPointsDesc(Long gameId);

    //should select and count only top 5 scores from each game, now is not
    @Query("SELECT r.user, SUM(r.points) AS totalPoints FROM Ranking r GROUP BY r.user ORDER BY totalPoints DESC")
    List<Object[]> generalRanking();
}
