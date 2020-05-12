package kr.ac.kopo.ctc.spring.hr;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;


@SpringBootApplication
//@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class}) //데이터 베이스 설정 무효화 제거
public class HrSystemApplication extends ServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(HrSystemApplication.class, args);
	}
	
	@Override protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) { return builder.sources(HrSystemApplication.class); }



}
