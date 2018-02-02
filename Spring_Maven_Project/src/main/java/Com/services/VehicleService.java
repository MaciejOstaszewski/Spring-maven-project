package Com.services;

import Com.controllers.commands.VehicleFilter;
import Com.models.Accessory;
import Com.models.VehicleType;
import Com.models.Vehicle;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface VehicleService {

    List<Accessory> getAllAccessories();

    List<VehicleType> getAllTypes();

    Page<Vehicle> getAllVehicles(VehicleFilter filter, Pageable pageable);

    Vehicle getVehicle(Long id);

    void deleteVehicle(Long id);

    void saveVehicle(Vehicle vehicle);
}
