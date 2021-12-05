package com.jp.fms.controllers;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jp.fms.dto.FileIssueRequest;
import com.jp.fms.model.File;
import com.jp.fms.model.FileRequest;
import com.jp.fms.model.Requester;
import com.jp.fms.repos.FileRepository;
import com.jp.fms.repos.FileRequestRepository;
import com.jp.fms.repos.RequesterRepository;
import com.jp.fms.services.RequestService;

@Controller
public class FileRequestController {

    @Autowired
    FileRepository fileRepository;
    @Autowired
    RequestService requestService;
    @Autowired
    FileRequestRepository fileRequestRepository;
    @Autowired
    RequesterRepository requesterRepository;

    @RequestMapping(value = "/mvmthistory", method = RequestMethod.GET)
    public String mvmthistory() {
        return "mvmthistory";
    }

    @RequestMapping("/showCompleteRequest")
    public String showCompleteRequest(@RequestParam("requesterId") Long requesterId,
                                      @RequestParam("fileType") String fileType,
                                      @RequestParam(value = "returnDays", required = false, defaultValue = "10") Integer returnDays,
                                      @RequestParam(value = "approvedBy", required = false) String approvedBy,
                                      @RequestParam(value = "requesterPurpose", required = false) String requesterPurpose,
                                      @RequestParam(value = "through", required = false) String through, ModelMap modelMap) {
        List<FileRequest> findAllByRequester_id = fileRequestRepository.findAllByStatusAndRequester_id("File Issued", requesterId);
        for (FileRequest fileRequest : findAllByRequester_id) {
            LocalDate date = LocalDate.now();

            // convert String to LocalDate
            LocalDate dueDate = LocalDate.parse(fileRequest.getDueDate());

            if (dueDate.isBefore(date)) {
                modelMap.addAttribute("msg", "Cannot Issue New File, Kindly Return Over Due Date Pending Files");
                return "requestConfirmation";
            }
        }
        Requester requester = requesterRepository.findById(requesterId).get();
        modelMap.addAttribute("requester", requester);
        modelMap.addAttribute("fileType", fileType);
        modelMap.addAttribute("approvedBy", approvedBy);
        modelMap.addAttribute("requesterPurpose", requesterPurpose);
        modelMap.addAttribute("through", through);
        modelMap.addAttribute("returnDays", returnDays);
        return "findFiles";
    }

    @RequestMapping("/newCompleteRequest")
    public String newCompleteRequest(@RequestParam("fileId") Long fileId, @RequestParam("requesterId") Long requesterId,
                                     ModelMap modelMap) {
        File file = fileRepository.findById(fileId).get();
        Requester requester = requesterRepository.findById(requesterId).get();

        modelMap.addAttribute("requester", requester);
        modelMap.addAttribute("file", file);
        return "completeRequestPage";
    }

    @RequestMapping("/completeRequest")
    public String completeRequest(@RequestParam("fileId") Long fileId, @RequestParam("requesterId") Long requesterId,
                                  @RequestParam(value = "approvedBy", required = false) String approvedBy,
                                  @RequestParam(value = "requesterPurpose", required = false) String requesterPurpose,
                                  @RequestParam(value = "through", required = false) String through, ModelMap modelMap) {
//		public String completeRequest(FileIssueRequest request, ModelMap modelMap) {
        FileIssueRequest fileIssueRequest = new FileIssueRequest();
        fileIssueRequest.setApprovedBy(approvedBy);
        fileIssueRequest.setFileId(fileId);
        fileIssueRequest.setRequesterId(requesterId);
        fileIssueRequest.setRequesterPurpose(requesterPurpose);
        fileIssueRequest.setThrough(through);
        File file = fileRepository.findById(fileId).get();
        if (file.getStatus().equals("available")) {
            FileRequest issueFile = requestService.issueFile(fileIssueRequest);
            if (issueFile != null) {
                modelMap.addAttribute("msg", "File Issued Successfully");
                return "requestConfirmation";
            } else {
                modelMap.addAttribute("msg", "File Issued Failed");
                return "requestConfirmation";
            }
        }
        modelMap.addAttribute("msg", "File Already Issued");
        return "requestConfirmation";
    }

    @RequestMapping("/showMovementHistory")
    public String showMovementHistory(ModelMap modelMap) {
        List<FileRequest> allRequests = fileRequestRepository.findAllByStatusOrderByIdDesc("File Received");
        if (!allRequests.isEmpty()) {
            modelMap.addAttribute("allRequests", allRequests);
            return "displayMovementHistory";
        } else {
            modelMap.addAttribute("msg", "File History Not Available");
            return "displayMovementHistory";
        }
    }

    @RequestMapping(value = "/showSearchMovementHistory", method = RequestMethod.POST)
    public String showSearchMovementHistory(@RequestParam(value = "unitName", required = false) String unitName,
                                            ModelMap modelMap) {
        List<FileRequest> allRequests = fileRequestRepository.findAllByStatusOrderByIdDesc("File Received");
        List<FileRequest> requests = new ArrayList<FileRequest>();
        for (FileRequest fileRequest : allRequests) {
            String unitName2 = fileRequest.getFile().getUnitName();
            if (unitName2.equalsIgnoreCase(unitName)) {
                requests.add(fileRequest);
            }
        }
        if (!requests.isEmpty()) {
            modelMap.addAttribute("requests", requests);
            return "displayMovementHistoryByUnitName";
        } else {
            modelMap.addAttribute("msg", "File Not Issued for " + unitName);
            return "displayMovementHistoryByUnitName";
        }
    }

    @RequestMapping("/showOverDueFiles")
    public String overDueFiles(ModelMap modelMap) {
        List<FileRequest> allRequests = fileRequestRepository.findAllByStatus("File Issued");
        List<FileRequest> requests = new ArrayList<FileRequest>();

        for (FileRequest fileRequest : allRequests) {
            LocalDate date = LocalDate.now();

            // convert String to LocalDate
            LocalDate dueDate = LocalDate.parse(fileRequest.getDueDate());

            if (dueDate.isBefore(date)) {
                requests.add(fileRequest);
            }
        }
        modelMap.addAttribute("requests", requests);
        return "displayOverDueFiles";

    }

    @RequestMapping("/showPendingFiles")
    public String showPendingFiles(ModelMap modelMap) {
        List<FileRequest> allRequests = fileRequestRepository.findAllByStatus("File Issued");
        modelMap.addAttribute("allRequests", allRequests);
        return "displayPendingFiles";

    }

    @RequestMapping(value = "/showSearchPendingFilePage")
    public String PendingFile() {
        return "displaySearchPendingFilePage";

    }

    @RequestMapping(value = "/searchPendingFileByRequesterName")
    public String searchPendingFileByRequesterName(
            @RequestParam(value = "requesterName", required = false) String requesterName, ModelMap modelMap) {
        List<FileRequest> allRequests = fileRequestRepository.findAllByStatus("File Issued");

        List<FileRequest> requests = new ArrayList<FileRequest>();

        for (FileRequest fileRequest : allRequests) {
            String requesterName2 = fileRequest.getRequester().getRequesterName();

            if (requesterName2.equalsIgnoreCase(requesterName)) {
                requests.add(fileRequest);
            }
        }
        if (!requests.isEmpty()) {
            modelMap.addAttribute("requests", requests);
            return "displayPendingFileByRequesterName";
        } else {
            modelMap.addAttribute("msg", "File Not Issued or Not Created");
            return "displayPendingFileByRequesterName";
        }

    }

    @RequestMapping(value = "/searchPendingFile")
    public String showPendingFileByUnitName(@RequestParam(value = "unitNames", required = false) String unitNames,
                                            @RequestParam(value = "fileType") String fileType,
                                            ModelMap modelMap) {
        List<String> unitNameList = Arrays.asList(unitNames.split(" "));
        Map<String, String> unitNameVsIssue = new HashMap<>();

        for (String unitName : unitNameList) {

            FileRequest fileRequest = fileRequestRepository.findAllByStatusAndFile_unitNameAndFile_fileType("File Issued", unitName, fileType);
            if (fileRequest != null) {

                long fileId = fileRequest.getFile().getId();
//		to retrieve the currently authenticated user's name
                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                String currentUserName = authentication.getName();

                fileRequest.setStatus("File received by " + currentUserName);
                LocalDateTime date = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                String formatDateTime = date.format(formatter);
                fileRequest.setReceivedDate(formatDateTime);


                File file = fileRepository.findById(fileId).get();
                file.setRequesterId(0);
                file.setStatus("available");
                fileRepository.save(file);

                unitNameVsIssue.put(unitName, "File Received Successfully");
            } else {
                unitNameVsIssue.put(unitName, "File Not Issued or Not Created");
            }

        }
//        List<FileRequest> allRequests = fileRequestRepository.findAllByStatus("File Issued");
//
//        List<FileRequest> requests = new ArrayList<FileRequest>();
//        if (unitName != null) {
//            for (FileRequest fileRequest : allRequests) {
//                String unitName2 = fileRequest.getFile().getUnitName();
//
//                if (unitName2.startsWith(unitName.toUpperCase())) {
//                    requests.add(fileRequest);
//                }
//            }
//        }
//        if (!requests.isEmpty()) {
//            modelMap.addAttribute("requests", requests);
//            return "displayPendingFileByUnitName";
//        } else {
//            modelMap.addAttribute("msg", "File Not Issued or Not Created");
//            return "displayPendingFileByUnitName";
//        }
        modelMap.addAttribute("unitNameVsIssue", unitNameVsIssue);
        modelMap.addAttribute("msg", "File Received Successfully");
        return "requestConfirmation";
    }

    @RequestMapping("/receiveFile")
    public String showReceiveFile(@RequestParam(value = "fileId", required = false) Long fileId,
                                  @RequestParam(value = "requestId", required = false) Long requestId, ModelMap modelMap) {
        FileRequest fileRequest = fileRequestRepository.findById(requestId).get();

//		to retrieve the currently authenticated user's name
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentUserName = authentication.getName();

        fileRequest.setStatus("File received by " + currentUserName);
        LocalDateTime date = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formatDateTime = date.format(formatter);
        fileRequest.setReceivedDate(formatDateTime.toString());

        File file = fileRepository.findById(fileId).get();
        file.setRequesterId(0);
        file.setStatus("available");
        fileRepository.save(file);

        modelMap.addAttribute("msg", "File Received Successfully");
        return "requestConfirmation";
    }

    @RequestMapping("/showIssuedFile")
    public String showIssuedFile(@RequestParam(value = "unitName", required = false) String unitName,
                                 ModelMap modelMap) {
        System.out.println(unitName);
        FileRequest fileRequest = fileRequestRepository.findAllByStatusAndFile_unitName("File Issued", unitName);
        LocalDateTime date = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String reIssueDate = date.format(formatter);
        modelMap.addAttribute("fileRequest", fileRequest);
        modelMap.addAttribute("reIssueDate", reIssueDate);
        return "reIssueFilesPage";

    }

    @RequestMapping("/updateFileRequest")
    public String updateFileRequest(@ModelAttribute("fileRequest") FileRequest fileRequest, ModelMap modelMap) {
        System.out.println(fileRequest.getId());
        FileRequest fileRequestToUpdate = fileRequestRepository.findById(fileRequest.getId()).get();
        fileRequestToUpdate.setInTransitIssuerNameAndDate(fileRequest.getInTransitIssuerNameAndDate());
        fileRequestToUpdate.setReApprovedBy(fileRequest.getReApprovedBy());
        fileRequestToUpdate.setDueDate(fileRequest.getDueDate());
        fileRequestRepository.save(fileRequestToUpdate);
        modelMap.addAttribute("fileRequest", fileRequestToUpdate);
        modelMap.addAttribute("msg", "File Request Updated Successfully");
        return "reIssueFilesPage";

    }

}
