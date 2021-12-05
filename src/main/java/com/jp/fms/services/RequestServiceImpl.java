package com.jp.fms.services;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.jp.fms.dto.FileIssueRequest;
import com.jp.fms.model.File;
import com.jp.fms.model.FileRequest;
import com.jp.fms.model.Requester;
import com.jp.fms.repos.FileRepository;
import com.jp.fms.repos.FileRequestRepository;
import com.jp.fms.repos.RequesterRepository;

@Service
public class RequestServiceImpl implements RequestService {

	@Autowired
	FileRepository fileRepository;
	@Autowired
	RequesterRepository requesterRepository;
	@Autowired
	FileRequestRepository fileRequestRepository;

	@Override
	public FileRequest issueFile(FileIssueRequest request) {

		Long fileId = request.getFileId();
		File file = fileRepository.findById(fileId).get();

		Long requesterId = request.getRequesterId();
		Requester requester = requesterRepository.findById(requesterId).get();

		LocalDateTime dateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String formatDateTime = dateTime.format(formatter);
		LocalDate date = LocalDate.now();
		LocalDate dueDate = LocalDate.now().plusDays(request.getReturnDays());
		
		//to retrieve the currently authenticated user's name
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentUserName = authentication.getName();

		FileRequest fileRequest = new FileRequest();
		fileRequest.setFile(file);
		fileRequest.setRequester(requester);
		fileRequest.setIssuedBy(currentUserName);
		fileRequest.setIssuedDate(date.toString());
		fileRequest.setDueDate(dueDate.toString());
		fileRequest.setStatus("File Issued");
		fileRequest.setApprovedBy(request.getApprovedBy());
		fileRequest.setRemarks(request.getRequesterPurpose());
		fileRequest.setThrough(request.getThrough());

		file.setStatus("issued");
		file.setRequesterId(requester.getId());

		FileRequest savedFileRequest = fileRequestRepository.save(fileRequest);

		return savedFileRequest;

	}

}
