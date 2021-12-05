package com.jp.fms.dto;

public class FileIssueRequest {

    private Long fileId;
    private Long requesterId;
    private Integer returnDays;
    private String approvedBy;
    private String requesterPurpose;
    private String through;

    public Integer getReturnDays() {
        return returnDays;
    }

    public void setReturnDays(Integer returnDays) {
        this.returnDays = returnDays;
    }

    public String getThrough() {
        return through;
    }

    public void setThrough(String through) {
        this.through = through;
    }

    public Long getFileId() {
        return fileId;
    }

    public void setFileId(Long fileId) {
        this.fileId = fileId;
    }

    public Long getRequesterId() {
        return requesterId;
    }

    public void setRequesterId(Long requesterId) {
        this.requesterId = requesterId;
    }

    public String getApprovedBy() {
        return approvedBy;
    }

    public void setApprovedBy(String approvedBy) {
        this.approvedBy = approvedBy;
    }

    public String getRequesterPurpose() {
        return requesterPurpose;
    }

    public void setRequesterPurpose(String requesterPurpose) {
        this.requesterPurpose = requesterPurpose;
    }

}
