package kr.ac.kopo.ctc.spring.hr.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.kopo.ctc.spring.hr.domain.User;
import kr.ac.kopo.ctc.spring.hr.repository.UserRepository;
import kr.ac.kopo.ctc.spring.hr.repository.UserSpecs;
import kr.ac.kopo.ctc.spring.hr.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	UserService userService;
	
	// 리스트 페이지
	@RequestMapping(value = "/list/pageNum={page}")
	public String list(Model model,User user, @PathVariable("page") int page) {
		
		PageRequest pageable = PageRequest.of(page-1, 10);
		
		List<User> userList =  userService.getList(pageable).getContent();
		
		Page<User> users = userRepository.findAll(pageable);
		
		int totalPage = users.getTotalPages();
//		int totalPage = ((total/10) == 0? (total/10) : (total/10) + 1);
		int paging = 5;
		
		int fin = totalPage;
		
		int pageBegin = (((page-1)/5) * paging) + 1;		// before page  
		if(pageBegin < 1) {
			pageBegin = 1;
		}
		
		int pageEnd = pageBegin + 4; //  next 페이지 5페이지씩 출력
		if(pageEnd > fin) {
			pageEnd = fin;
		}
		
		int before = (page - 5);
		 if( before < 1) {
			 before = 1;
		 }
		 
		 int next = page + 5;
		 if(next > fin) {
			 next = fin;
		 }
		 
		 model.addAttribute("userList", userList);		
		 model.addAttribute("totalPage", totalPage);
		 model.addAttribute("paging", paging);
		 model.addAttribute("fin", fin);
		 model.addAttribute("pageBegin", pageBegin);
		 model.addAttribute("pageEnd", pageEnd);
		 model.addAttribute("before", before);
		 model.addAttribute("next", next);
		return "list";		// findAll() 은 모든 Entity를 조회한다
	}
	
	// 상세보기
	@RequestMapping(value = "/oneView/{userId}", method = RequestMethod.GET)
	public String getOne(Model model, @PathVariable("userId") String userId) {
		
		
		model.addAttribute("user", userService.getOne(userRepository.findByUserId(userId)));  // model로 oneView.jsp에 뿌려준다
		
		return "oneView";
	}
	
	//회원등록 화면
	@RequestMapping(value = "/register")	// 회원등록화면
	public String register() {
		
		return "register";
	}
	
	//회원등록저장
	@RequestMapping(value = "/register_ok", method = RequestMethod.POST) 				//회원등록하기
	public String register_ok(User user) {
		

		userService.registerUser(user);
			
		return "redirect:list/pageNum=1";
		
	}
	
	// 회원등록 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST) 
	public String modify(User user) {
		
		userService.modifyUser(user);
			
		return "redirect:http://localhost:8080/HRSystem/user/list/pageNum=1";	
	}
	
	// 회원삭제
	@RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
	public String delete(User user) {
		userService.deleteUser(user);
		
		return "redirect:http://localhost:8080/HRSystem/user/list/pageNum=1";
	}
	
	
	/* pagable
	 *  pageable 사용은 컨트롤러 메소드를 호출하는 쪽에서 page, size, sort등을 파라미터로 던지기만 하면 된다
	 *  Pageable 인터페이스를 위한 RequestParameter는 다음과 같다
	 *  page : 검색을 원하는 페이지 번호(0부터 시작)
	 *  size : 한 페이지의 갯수
	 *  sort : 정렬방식(sort=name, asc&sort=sal, desc)
	 *  localhost:8080/HRSystem/user/list?page=0&size=10&sort=id,descs
	 */
	
	// 체크박스 선택삭제
	@RequestMapping(value = "/delChk", method = RequestMethod.POST)
	public String chkDel(Model model, @RequestParam(value = "chkBox") List<Long> chkBox, HttpServletResponse response) throws Exception {
		logger.info("delCheck 실행행");
//		if(chkBox == null) {
//			
//			return "<script>alert('하나 이상을 선택해야 합니다.'); location.href='http://localhost:8080/HRSystem/user/list/pageNum=1';</script>";
//		} else {
		
		
		for(Long delete : chkBox)  {      //delete 체크가 된 리스트를 받아서 그 리스트에 담긴 id와 일치하는 user객체를 모두 삭제
	         userRepository.deleteById(userRepository.findById(delete).get().getId());
	      }
	
	      return "redirect:http://localhost:8080/HRSystem/user/list/pageNum=1"; 
//	     }
	}


	
	//조건검색시 리스트
	@RequestMapping(value = "list/search")
	 public String search(@RequestParam("search") String search
             , @RequestParam("keyword")String keyword,
             Model model) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put(search, keyword);
		Pageable pageable = PageRequest.of(0, 10, Sort.by("id").descending());
		Page<User> userList = userRepository.findAll(UserSpecs.search(map), pageable);
	
	
		
		int totalPage = userList.getTotalPages();
		
//		int totalPage = ((total/10) == 0? (total/10) : (total/10) + 1);
		int paging = 5;
		
		int fin = totalPage;
		
		int pageBegin = (((userList.getNumber())/5) * paging) + 1;		// before page  
		if(pageBegin < 1) {
			pageBegin = 1;
		}
		
		int pageEnd = pageBegin + 4; //  next 페이지 5페이지씩 출력
		if(pageEnd > fin) {
			pageEnd = fin;
		}
		
		int before = ((userList.getNumber()) - 5);
		 if( before < 1) {
			 before = 1;
		 }
		 
		 int next = (userList.getNumber()) + 5;
		 if(next > fin) {
			 next = fin;
		 }
		 
		 model.addAttribute("userList", userList.getContent());	
		 model.addAttribute("totalPage", totalPage);
		 model.addAttribute("paging", paging);
		 model.addAttribute("fin", fin);
		 model.addAttribute("pageBegin", pageBegin);
		 model.addAttribute("pageEnd", pageEnd);
		 model.addAttribute("before", before);
		 model.addAttribute("next", next);
		
		
		return "list";
	}
	
	
}
