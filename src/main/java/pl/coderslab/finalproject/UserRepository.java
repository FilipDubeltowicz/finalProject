package pl.coderslab.finalproject;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    //    boolean authenticateUser(String nickName, String password);
    User getUserByNickName(String nickName);

    default boolean isValid(String nickName, String password) {
        User user = getUserByNickName(nickName);
        if (user == null) {
            return false;
        }
        return user.getPassword().equals(password);
    }
}