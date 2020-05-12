package kr.ac.kopo.ctc.spring.hr.repository;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import kr.ac.kopo.ctc.spring.hr.domain.User;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UserRepositoryTest {

	@Autowired
	UserRepository userRepository;
	
//	@Test
//	public void create() {
//		
//		User user = new User();
//		user.setId(1L);
//		user.setUserId("kopo16");
//		System.out.println(user.getUserId());
//		user.setUsername("이장우");
//		user.setEmail("ggg@gggg.com");
//		user.setPhone("010-2222-2222");
//		user.setBirth(LocalDate.now());
//		user.setSex(true);
//		user.setJoindate(LocalDateTime.now());
//		User newUser = userRepository.save(user);
//		System.out.println(newUser);
//		
//		user.getBirth();
//		user.getEmail();
//		user.getId();
//		user.getJoindate();
//		user.getPhone();
//		user.getUserId();
//		user.getUsername();
//		user.isSex();
		
//		System.out.println("완료");
//	}
	
//	@Test
//	public void insertDummy() {
//		
//		IntStream.range(1,101).forEach(i -> {
//			User user = new User();
//			user.setEmail("email" + i);
//			user.setUsername("username"+i);
//			userRepository.save(user);
//		});
//	}
	
	@Test
	@Transactional
	public void getOne() {
		
		
		User user = userRepository.getOne(1L);
	
		System.out.println("유저" + user);
		
	}
	
//	@Test
//	public void read() {
//		Optional<User> user = userRepository.findById(1L);
//		
//		user.ifPresent(selectUser -> {
//			System.out.println("user: " + selectUser);
//		});
//	}
//	
//	@Test
//	public void update() {
//		
//		Optional<User> user = userRepository.findById(2L);
//		
//		user.ifPresent(selectUser ->{
//			selectUser.setEmail("aaaa@aaaa.com");
//			selectUser.setPhone("010-1111-2222");
//			User newUser = userRepository.save(selectUser);
//			System.out.println(newUser);
//			
//		});
//	}
//	
//	@Test
//	public void delete() {
//		Optional<User> user = userRepository.findById(1L);
//		
//		Assert.assertTrue(user.isPresent());
//		user.ifPresent(selectUser ->{
//			userRepository.delete(selectUser);
//		});
//		
//		Optional<User> deleteUser = userRepository.findById(1L);
//		
//		Assert.assertFalse(deleteUser.isPresent());
//	}
//	
//	
//	@Test
//	@Transactional
//	public void oneToMany_OneWay() {
//	// 미리 아이템 100개를 적재
//	for(int i = 0 ; i < 100; i++){
//	User user = new User();
//	user.setUsername(dummyString());
//	if( i % 3 == 0 ){
//	user.setUserId("first");
//	}
//	else if( i % 3 == 1 ) {
//	user.setUserId("second");
//	}
//	else {
//	user.setUserId("third");
//	}
//	userRepository.save(user);
//	}
//
//	// 한 페이지 아이템 10개, 0번째 페이지 호출
//	Page<User> page = userRepository.findAll(PageRequest.of(0, 10));
//	printPageData("simple", page);
//
//	// 한 페이지 아이템 10개, 글번호 내림차순으로, 0번째 페이지 호출
//	page = userRepository.findAllByOrderByIdDesc(PageRequest.of(0, 10));
//	printPageData("sort_seq_desc", page);
//
//	// 한 페이지에 아이템 10개, 글번호 내림차순으로, 2번째 페이지 호출
//	page = userRepository.findAll(PageRequest.of(2, 10, Sort.Direction.DESC,"id"));
//	printPageData("sort", page);
//
//	// 한페이지에 아이템 10개, 글작성자 "first", 0번째 페이지 호출
//	page = userRepository.findAllByuserId("first", PageRequest.of(0, 10));
//	printPageData("sort_author", page);
//
//	// 한페이지 아이템 10개, 작성자 내림차순으로, 2번째 페이지 호출
//	page = userRepository.findAll(PageRequest.of(2, 10, Sort.Direction.DESC, "userId"));
//	printPageData("sort_author_desc", page);
//
//	// 한페이지 아이템 10개, 검색어 중, 글번호 내림차순으로, 2번째 페이지 호출
//	page = userRepository.findAllSearch("bc", PageRequest.of(2, 10, Sort.Direction.DESC, "id"));
//	printPageData("sort_search_desc", page);
//	}
//
//	// 페이지 데이터 출력
//	private void printPageData(String label, Page<User> page){
//	if( page == null || page.getSize() <= 0 ) return;
//
//	for( int i = 0 ; i < page.getSize(); i++ ){
//	User user = page.getContent().get(i);
//	System.out.println("["+label+"] "+ user.getId() + " " + user.getUserId() + " " + user.getUsername());
//	}
//	}
//
//	// 더미 문자열 반환
//	private String dummyString(){
//
//	String [] dummy = {"abc", "bcd", "cde", "def"};
//	int rand = (int)(System.currentTimeMillis() % dummy.length);
//
//	return dummy[rand];
//	}

}
