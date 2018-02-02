package Com.models;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

@Table(name = "vehicle_types")
@Entity
@Getter
@Setter
@NoArgsConstructor
public class VehicleType {
    
    @Min(0)
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true)
    private int id;


    @Column(name = "name", nullable = false)
    private String name;


    public VehicleType(String name) {
        this.name = name;
    }
}
