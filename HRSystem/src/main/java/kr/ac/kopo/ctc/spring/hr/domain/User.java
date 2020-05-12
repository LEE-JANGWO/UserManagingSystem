package kr.ac.kopo.ctc.spring.hr.domain;

import java.time.LocalDate;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "tbl_user")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class User {

	@Id
	@GeneratedValue
	@Column
	private Long id;

	@Column(unique = true, updatable=false)
	private String userId; // 회원 아아디

	@Column
	private String username;

	@Column(unique = true)
	private String email;

	@Column(unique = true)
	private String phone;

	@Column
	@DateTimeFormat(pattern ="yyyy-MM-dd")
	private LocalDate birth;

	@Column
	private boolean sex;

	@Column
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date joindate;
	
	@Column(updatable=false)
	private String passwd;

}
