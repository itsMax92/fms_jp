package com.jp.fms.controllers;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jp.fms.model.FileRequest;
import com.jp.fms.repos.FileRepository;
import com.jp.fms.repos.FileRequestRepository;
import com.jp.fms.services.RequestService;

@RestController
public class FileRequestRestController {

	@Autowired
	FileRepository fileRepository;
	@Autowired
	RequestService requestService;
	@Autowired
	FileRequestRepository fileRequestRepository;

	@GetMapping("/showMvmtHistory")
	public List<FileRequest> showMovementHistory(ModelMap modelMap) {
		List<FileRequest> allRequests = fileRequestRepository.findAllByStatusStartsWith("File Received");
		if (!allRequests.isEmpty()) {
			return allRequests;
		} else {
			modelMap.addAttribute("msg", "History not available ");
			return null;
		}
	}

	@RequestMapping("/showPendingFilesJson")
	public List<FileRequest> showPendingFiles() {
		List<FileRequest> allRequests = fileRequestRepository.findAllByStatus("File Issued");
		if (!allRequests.isEmpty()) {
			return allRequests;
		} else {
			allRequests.add(null);
			return allRequests;
		}

	}
	
	@RequestMapping("/lastIssuedFiles")
	public List<Long> lastIssuedFiles() {
		List<FileRequest> allRequests = fileRequestRepository.findAllByStatus("File Issued");
		List<Long> lastIssuedFiles = new ArrayList<Long>();
		for (int i = 0; i <= 10; i++) {
			LocalDate date = LocalDate.now().minusDays(i);
			long files = 0;
			for (FileRequest fileRequest : allRequests) {
				if (fileRequest.getIssuedDate().startsWith(date.toString())) {
					files++;
				}
			}
			lastIssuedFiles.add(files);
		}
		return lastIssuedFiles;
	}

}
