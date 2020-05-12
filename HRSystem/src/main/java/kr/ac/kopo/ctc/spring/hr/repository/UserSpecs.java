package kr.ac.kopo.ctc.spring.hr.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.Predicate;

import org.springframework.data.jpa.domain.Specification;

import kr.ac.kopo.ctc.spring.hr.domain.User;

public class UserSpecs {
	public static Specification<User> search(Map<String, Object> filter) {
		return (root, query, builder) -> {
			List<Predicate> predicates = new ArrayList<>();
			filter.forEach((key, value) -> {
				String likeValue = "%" + value + "%";
				predicates.add(builder.like(root.get(key).as(String.class), likeValue));
				
			});
			return builder.and(predicates.toArray(new Predicate[0]));
		};
	}
}