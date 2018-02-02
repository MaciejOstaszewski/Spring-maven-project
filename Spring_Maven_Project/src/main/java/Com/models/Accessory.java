package Com.models;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;


import javax.persistence.*;



@Data
@NoArgsConstructor
@Entity
@Table(name = "accessories")
public class Accessory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true)
    public long id;


    @Column(name = "name", nullable = false)
    private String name;

    public Accessory(String name){
        this.name = name;
    }

}
