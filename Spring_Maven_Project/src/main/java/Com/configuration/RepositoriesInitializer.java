package Com.configuration;

import Com.models.Accessory;
import Com.models.Role;
import Com.models.User;
import Com.models.VehicleType;
import Com.repositories.*;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Arrays;
import java.util.HashSet;

@Configuration
public class RepositoriesInitializer {

    @Autowired
    private VehicleRepository vehicleRepository;
    @Autowired
    private VehicleTypeRepository vehicleTypeRepository;
    @Autowired
    private AccessoryRepository accessoryRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Bean
    InitializingBean init() {

        return () -> {

            if (vehicleTypeRepository.findAll().isEmpty()) { //przyjmijmy, że jeśli repozytorium typów jest puste, to trzeba zainicjalizować bazę danych
                vehicleTypeRepository.save(new VehicleType("Osobowy"));
                vehicleTypeRepository.save(new VehicleType("Ciężarowy"));
                vehicleTypeRepository.save(new VehicleType("Bus"));
                vehicleTypeRepository.save(new VehicleType("Sportowy"));
                vehicleTypeRepository.save(new VehicleType("Pick-up"));

            }

            if (accessoryRepository.findAll().isEmpty()) { //przyjmijmy, że jeśli repozytorium typów jest puste, to trzeba zainicjalizować bazę danych
                accessoryRepository.save(new Accessory("Klimatyzacja"));
                accessoryRepository.save(new Accessory("Wycieraczki"));
                accessoryRepository.save(new Accessory("Radio"));
                accessoryRepository.save(new Accessory("Kamera Cofania"));
                accessoryRepository.save(new Accessory("Dywaniki"));

            }
            if (roleRepository.findAll().isEmpty()) {
                try {
                    Role roleUser = roleRepository.save(new Role(Role.Types.ROLE_USER));
                    Role roleAdmin = roleRepository.save(new Role(Role.Types.ROLE_ADMIN));

                    User user = new User("user", true);
                    user.setRoles(new HashSet<>(Arrays.asList(roleUser)));
                    user.setPassword(passwordEncoder.encode("user"));

                    User admin = new User("admin", true);
                    admin.setRoles(new HashSet<>(Arrays.asList(roleAdmin)));
                    admin.setPassword(passwordEncoder.encode("admin"));

                    User test = new User("test", true);
                    test.setRoles(new HashSet<>(Arrays.asList(roleAdmin, roleUser)));
                    test.setPassword(passwordEncoder.encode("test"));

                    userRepository.save(user);
                    userRepository.save(admin);
                    userRepository.save(test);
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
        };
    }

}