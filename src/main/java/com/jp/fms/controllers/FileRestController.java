package com.jp.fms.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.jp.fms.model.File;
import com.jp.fms.model.FileRequest;
import com.jp.fms.repos.FileRepository;
import com.jp.fms.repos.FileRequestRepository;

@RestController
public class FileRestController {

	@Autowired
	private FileRepository fileRepository;
	@Autowired
	private FileRequestRepository fileRequestRepository;

	@RequestMapping("files")
	public List<File> getAllFiles() {
		List<File> files = fileRepository.findAll();
		return files;
	}

	@RequestMapping("files/{id}")
	public File getFile(@PathVariable("id") long id) {
		return fileRepository.findById(id).get();

	}

	@RequestMapping(method = RequestMethod.POST, value = "/files")
	public void addFile(@RequestBody File file) {
		fileRepository.save(file);
	}

	@RequestMapping(method = RequestMethod.PUT, value = "files/{id}")
	public void updateFile(@RequestBody File file, @PathVariable long id) {
		File fileToUpdate = fileRepository.findById(id).get();
		fileToUpdate.setCustomerName(file.getCustomerName());
		fileToUpdate.setFileType(file.getFileType());
		fileToUpdate.setStatus(file.getStatus());
		fileToUpdate.setUnitName(file.getUnitName());
		fileRepository.save(fileToUpdate);
	}

	@RequestMapping(method = RequestMethod.DELETE, value = "files/{id}")
	public void deleteFile(@PathVariable("id") long id) {
		fileRepository.deleteById(id);

	}

	@RequestMapping("/pending")
	public List<FileRequest> pending() {
		return fileRequestRepository.findAll();

	}
	@RequestMapping("/allFiles")
	public List<File> allFiles() {
		return fileRepository.findAll();

	}
	
}
