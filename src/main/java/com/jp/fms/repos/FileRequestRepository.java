package com.jp.fms.repos;

import com.jp.fms.model.FileRequest;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface FileRequestRepository extends JpaRepository<FileRequest, Long> {

	List<FileRequest> findAllByStatus(String string);
	
	List<FileRequest> findAllByStatusAndRequester_id(String string, Long id);

	List<FileRequest> findAllByStatusOrderByIdDesc(String string);

	List<FileRequest> findAllByStatusStartsWith(String string);

	void findAllByStatusAndIssuedDateStartsWith(String string, String string2);

	FileRequest findAllByStatusAndFile(String string, String string2);

	FileRequest findAllByStatusAndFile_unitName(String string, String unitName);
	FileRequest findAllByStatusAndFile_unitNameAndFile_fileType(String string, String unitName, String fileType);

    FileRequest findAllByFile_unitName(String unitName);
}
