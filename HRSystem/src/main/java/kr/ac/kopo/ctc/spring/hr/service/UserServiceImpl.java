package kr.ac.kopo.ctc.spring.hr.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kr.ac.kopo.ctc.spring.hr.domain.User;
import kr.ac.kopo.ctc.spring.hr.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepository userRepository;
	
	
	@Override
	public Page<User> getList(Pageable pageable) {
		
		return userRepository.findAll(pageable);
	}
	
	
	@Override
	public List<User> getList(User user) {
		
		return userRepository.findAll();
	}
	
	@Override
	public User getOne(User user) {
		
		return userRepository.findById(user.getId()).get();
	}

	@Override
	public void registerUser(User user) {
		
		
		user.setJoindate(new Date());
		
		userRepository.save(user);
		
		
	}


	@Override
	public void modifyUser(User user) {
		
		User oneUser = userRepository.findById(user.getId()).get();
		
		oneUser.setEmail(user.getEmail());
		oneUser.setUsername(user.getUsername());
		oneUser.setPhone(user.getPhone());
		oneUser.setBirth(user.getBirth());
		oneUser.setSex(user.isSex());
		
		userRepository.save(oneUser);
	}

	
	 public void deleteUser(User user) {                                
	        User userOne =  userRepository.findById(user.getId()).get();
	        userRepository.delete(userOne);
	    }

}
