package kr.ac.kopo.ctc.spring.hr.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {

	@RequestMapping(value = "/hi")					//	http://localhost:8080/HRSystem/hello 요청시  src/main/webapp/WEB-INF/views/hello.jsp 페이지를 돌려준다
	public String helloSpringBoot(Model model) {
		model.addAttribute("name", "홍길동");				// model를 통해 name 이라는 key에 홍길동이라는 값을 보내준다.
		return "hi";									// src/main/webapp/WEB-INF/views/hello.jsp 리턴
	}

}
