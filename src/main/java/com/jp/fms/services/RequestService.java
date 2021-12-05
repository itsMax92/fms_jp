package com.jp.fms.services;

import com.jp.fms.dto.FileIssueRequest;
import com.jp.fms.model.FileRequest;

public interface RequestService {

	public FileRequest issueFile(FileIssueRequest request);
}
