package pl.coderslab.finalproject;

import org.springframework.data.jpa.repository.JpaRepository;

public interface TeamRepository extends JpaRepository<Team, Long> {
    Ranking findById(long id);
}
