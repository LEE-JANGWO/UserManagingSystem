package kr.ac.kopo.ctc.spring.hr.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kr.ac.kopo.ctc.spring.hr.domain.User;

@Service
public interface UserService {

	public List<User> getList(User user);
	
	public Page<User> getList(Pageable pageable);
	
	public User getOne(User user);
	
	public void registerUser(User user);
	
	public void modifyUser(User user);
	
	public void deleteUser(User user);

	
}
