package com.jp.fms.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "file_request")
public class FileRequest {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@Column(name = "issued_by")
	private String issuedBy;
	@Column(name = "issued_date")
	private String issuedDate;
	@Column(name = "due_date")
	private String dueDate;
	@Column(name = "received_date")
	private String receivedDate;
	@Column(name = "remarks")
	private String remarks;
	@Column(name = "status")
	private String status;
	@Column(name = "through")
	private String through;
	@Column(name = "approved_by")
	private String approvedBy;
	@Column(name = "re_approved_by")
	private String reApprovedBy;
	@Column(name = "re_issue_date")
	private String inTransitIssuerNameAndDate;
	@OneToOne
	private File file;
	@OneToOne
	private Requester requester;
	
	public String getReApprovedBy() {
		return reApprovedBy;
	}

	public void setReApprovedBy(String reApprovedBy) {
		this.reApprovedBy = reApprovedBy;
	}

	public String getInTransitIssuerNameAndDate() {
		return inTransitIssuerNameAndDate;
	}

	public void setInTransitIssuerNameAndDate(String inTransitIssuerNameAndDate) {
		this.inTransitIssuerNameAndDate = inTransitIssuerNameAndDate;
	}

	public String getReceivedDate() {
		return receivedDate;
	}

	public void setReceivedDate(String receivedDate) {
		this.receivedDate = receivedDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getIssuedBy() {
		return issuedBy;
	}

	public void setIssuedBy(String issuedBy) {
		this.issuedBy = issuedBy;
	}

	public String getIssuedDate() {
		return issuedDate;
	}

	public void setIssuedDate(String issuedDate) {
		this.issuedDate = issuedDate;
	}

	public String getDueDate() {
		return dueDate;
	}

	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public Requester getRequester() {
		return requester;
	}

	public void setRequester(Requester requester) {
		this.requester = requester;
	}

	public String getThrough() {
		return through;
	}

	public void setThrough(String through) {
		this.through = through;
	}

	public String getApprovedBy() {
		return approvedBy;
	}

	public void setApprovedBy(String approvedBy) {
		this.approvedBy = approvedBy;
	}

}
