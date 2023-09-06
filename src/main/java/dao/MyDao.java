package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import dto.Cart;
import dto.Customer;
import dto.CustomerFoodItem;
import dto.FoodItem;

public class MyDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("dev");
	EntityManager manager = factory.createEntityManager();
	EntityTransaction transaction = manager.getTransaction();

	public void save(Customer customer) {
		transaction.begin();
		manager.persist(customer);
		transaction.commit();
	}
	
	public void save(FoodItem item) {
		transaction.begin();
		manager.persist(item);
		transaction.commit();
	}

	public Customer fetchByEmail(String email) {

		List<Customer> list = manager.createQuery("select x from Customer x where email=?1").setParameter(1, email)
				.getResultList();
		if (list.isEmpty())
			return null;
		else
			return list.get(0);
	}

	public Customer fetchByMobile(long mobile) {
		List<Customer> list = manager.createQuery("select x from Customer x where mobile=?1").setParameter(1, mobile)
				.getResultList();
		if (list.isEmpty())
			return null;
		else
			return list.get(0);
	}
	
	public List<FoodItem> fetchAllFoodItem()
	{
		return manager.createQuery("select x from FoodItem x").getResultList();
	}
	
	public FoodItem find(int id)
	{
		return manager.find(FoodItem.class, id);
	}
	
	public void delete(FoodItem item)
	{
		transaction.begin();
		manager.remove(item);
		transaction.commit();
	}

	public void update(FoodItem item) {
		transaction.begin();
		manager.merge(item);
		transaction.commit();
	}
	
	public void update(Customer customer) {
		transaction.begin();
		manager.merge(customer);
		transaction.commit();
	}
	
	public void update(Cart cart) {
		transaction.begin();
		manager.merge(cart);
		transaction.commit();
	}
	
	public void update(CustomerFoodItem foodItem) {
		transaction.begin();
		manager.merge(foodItem);
		transaction.commit();
	}
     
	public List<Customer> fetchAllCustomer() {
		return manager.createQuery("select x from Customer x").getResultList();
	}

	public Customer findCustomer(int id) {
		return manager.find(Customer.class, id);
	}

	public void delete(Customer customer) {
		transaction.begin();
		manager.remove(customer);
		transaction.commit();
	}
}
