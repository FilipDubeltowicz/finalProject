package pl.coderslab.finalproject;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RankingRepository extends JpaRepository<Ranking, Long> {

    Ranking findById(long id);
    List<Ranking> findTop5ByGameIdOrderByPointsDesc(Long gameId);
}
