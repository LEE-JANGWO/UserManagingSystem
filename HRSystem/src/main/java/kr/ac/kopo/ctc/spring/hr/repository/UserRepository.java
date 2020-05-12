package kr.ac.kopo.ctc.spring.hr.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.ctc.spring.hr.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>, JpaSpecificationExecutor<User>, PagingAndSortingRepository<User, Long> {

		User findByUserId(String userId);
		 
		// 페이지 처리
		List<User> findAll(Sort sort);
		Page<User> findAll(Pageable pageable);
		Page<User> findAllByOrderByIdDesc(Pageable pageable);
		Page<User> findAllByuserId(String userId, Pageable pageable);
		
		@Query("select u from User u where content like concat('%', :searchString , '%')")
		Page<User> findAllSearch(@Param("searchString") String searchString, Pageable pageable);
}
