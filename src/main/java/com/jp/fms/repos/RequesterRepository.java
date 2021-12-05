package com.jp.fms.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jp.fms.model.File;
import com.jp.fms.model.Requester;

public interface RequesterRepository extends JpaRepository<Requester, Long>{

	List<Requester> findByRequesterName(String name);

	List<Requester> findByRequesterNameLike(String name);

	List<Requester> findByRequesterNameStartsWith(String name);

	

	}
