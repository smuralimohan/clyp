package com.omnium.clyp;

import java.util.List;
import java.util.Optional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import com.omnium.clyp.model.Country;
import com.omnium.clyp.repository.CountryRepository;

@RunWith(SpringRunner.class)
@SpringBootTest
@WebMvcTest
@AutoConfigureMockMvc
public class Country_CRUD {

	@Autowired
	private CountryRepository countryRepository;
	
	@Autowired
	private MockMvc mockMvc;
	
	//@Test
	public void contextLoads() {
	}

	@Test
	public void findOne() {
		Optional<Country> country =  countryRepository.findByIso("IN");
		System.out.println(country.get().toString());	
	}

	@Test
	public void findAll() {
		List<Country> countries=  countryRepository.findAll();
		for (Country country: countries) {
			System.out.println(country.toString());
		}
	}
	
	@Test
	public void save() {
		Country country = new Country("ZZ", "Test Country ABC", "ZZZ", 9999);
		Country newCountry =  countryRepository.save(country);
		System.out.println(newCountry.toString());
	}
	
}
