package Com.models;



import Com.validators.InvalidValues;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "vehicles")
@NamedQuery(name = "Vehicle.findAllVehiclesUsingNamedQuery",
        query = "SELECT v FROM Vehicle v WHERE upper(v.name) LIKE upper(:phrase) or upper(v.model) LIKE upper(:phrase) or upper(v.vehicleType.name) LIKE upper(:phrase)")
@Getter
@Setter
@AllArgsConstructor
public class Vehicle {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;


    @Size(min = 1, max = 20)
    @NotBlank
    @Column(name = "model", nullable = false)
    private String model;


    @NotBlank
    @Length(min = 2, max = 30)
    @InvalidValues(ignoreCase = true, values = {"XXX", "YYY"})
    @Column(name = "name", nullable = false)
    private String name;


    @Past
    @Temporal(value = TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "production_date", nullable = false)
    private Date productionDate;


    @Positive
    @Max(10000000)
    @Column(name = "price", nullable = false)
    private BigDecimal price;


    @Valid
    @ManyToOne(fetch = FetchType.EAGER)//EAGER powoduje zaciągnięcie obiektu VehicleType wraz z obiektem Vehicle.
    @JoinColumn(name="type_id", nullable = false)
    private VehicleType vehicleType;



    @ManyToMany(fetch = FetchType.LAZY)//LAZY powoduje dociągnięcie tych elementów dopiero wtedy, gdy są używane
    private List<Accessory> accessories;

    @Column(name="created_date", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;


    public Vehicle() {
        this.createdDate = new Date();
        this.vehicleType = new VehicleType();
        accessories = new ArrayList<Accessory>();
    }

}
