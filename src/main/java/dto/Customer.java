package dto;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import lombok.Data;

@Entity
@Data
public class Customer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String fullName;
	private String email;
	private long mobile;
	private String password;
	private String gender;
	private LocalDate dob;
	@Lob
	private byte[] picture;
	private int age;
	private String country;

	@OneToOne(cascade = CascadeType.ALL)
	Cart cart;

	@OneToMany(cascade = CascadeType.ALL)
	List<CustomerOrder> customerOrders;

}
