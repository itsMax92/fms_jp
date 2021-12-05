package com.jp.fms.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.jp.fms.model.File;

public interface FileRepository extends JpaRepository<File, Long> {

	List<File> findByUnitName(String unitName);

	List<File> findByUnitNameAndStatus(String unitName, String status);
	List<File> findByUnitNameAndStatusAndFileType(String unitName, String status, String fileType);

	List<File> findByStatus(String status);

	List<File> findByUnitNameStartsWithAndStatus(String unitName, String string);

	List<File> findByGreenNumberAndFileType(String number, String fileType);
}
