package pl.coderslab.finalproject.user;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {
    User getUserByNickName(String nickName);

    User getUserByEmail(String email);

    User getUserById(Long id);

    List<User> findAll();

    default boolean isValid(String email, String password) {
        User user = getUserByEmail(email);
        if (user == null) {
            return false;
        }
        return user.getPassword().equals(password);
    }
}