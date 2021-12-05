package com.jp.fms.controllers;

import java.time.LocalDate;
import java.util.*;

import com.jp.fms.dto.FileIssueRequest;
import com.jp.fms.model.FileRequest;
import com.jp.fms.services.RequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import com.jp.fms.model.File;
import com.jp.fms.model.Requester;
import com.jp.fms.repos.FileRepository;
import com.jp.fms.repos.FileRequestRepository;
import com.jp.fms.repos.RequesterRepository;

import javax.validation.ConstraintViolationException;

@Controller
public class FIleController {

    @Autowired
    FileRepository fileRepository;
    @Autowired
    RequestService requestService;
    @Autowired
    FileRequestRepository fileRequestRepository;
    @Autowired
    RequesterRepository requesterRepository;

    @RequestMapping("/showIssueFilesYellow")
    public String showDisplayFilesPageYellow() {
        return "findRequesterPageYellow";
    }

    @RequestMapping("/showIssueFilesGreen")
    public String showDisplayFilesPageGreen() {
        return "findRequesterPageGreen";
    }

    @RequestMapping("/showGreenNumber")
    public String showDisplayPageGreenNumber() {
        return "findGreenNumberPage";
    }

    @RequestMapping("/showReIssueFiles")
    public String showReIssueFilesPage() {
        return "reIssueFilesPage";
    }

    @RequestMapping("/showSearchPendingFileYellow")
    public String showSearchPendingFileYellow() {
        return "displayPendingFileByUnitNameYellow";
    }

    @RequestMapping("/showSearchPendingFileGreen")
    public String showSearchPendingFileGreen() {
        return "displayPendingFileByUnitNameGreen";
    }

    @GetMapping("/showDateExtend")
    public String showDateExtend() {
        return "displayDateExtend";
    }

    @RequestMapping("/pendingall")
    public List<File> pendingall(@RequestParam(value = "status", defaultValue = "pending") String status) {
        return fileRepository.findByStatus(status);

    }

    @RequestMapping("/pendingR")
    public List<File> pendingR() {
        return fileRepository.findAll();

    }

    @PostMapping(value = "/extendDate")
    public String dateExtend(@RequestParam(name = "unitNames") String unitNames,
                             @RequestParam(name = "extendDays") int extendDays, ModelMap modelMap) {

        Map<String, String> unitNameVsDueDate = new HashMap<>();

        LocalDate newDueDate = LocalDate.now().plusDays(extendDays);

        List<String> unitNameList = Arrays.asList(unitNames.split(" "));
        try {
            unitNameList.stream().forEach(s -> {
                FileRequest fileRequest = fileRequestRepository.findAllByStatusAndFile_unitName("File Issued", s);
                fileRequest.setDueDate(newDueDate.toString());
                fileRequestRepository.save(fileRequest);
                unitNameVsDueDate.put(s, newDueDate.toString());
            });
            modelMap.addAttribute("msg", "Date Extended Successfully");
        } catch (Exception e) {
            System.err.println(e.getMessage());
            modelMap.addAttribute("msg", "Something went wrong");
        }
        modelMap.addAttribute("unitNameVsDueDate", unitNameVsDueDate);
        return "displayDateExtend";
    }

    @RequestMapping(value = "/issue", method = RequestMethod.POST)
    public String search(@RequestParam(name = "unitNames") String unitNames,
                         @RequestParam(name = "requesterId") Long requesterId,
                         @RequestParam(name = "fileType") String fileType,
                         @RequestParam(name = "returnDays") int returnDays,
                         @RequestParam(value = "approvedBy", required = false) String approvedBy,
                         @RequestParam(value = "requesterPurpose", required = false) String requesterPurpose,
                         @RequestParam(value = "through", required = false) String through, ModelMap modelMap) {

        Requester requester = requesterRepository.findById(requesterId).get();
        String requesterName = requester.getRequesterName();
        List<String> unitNameList = Arrays.asList(unitNames.split(" "));

        LocalDate dueDate = LocalDate.now().plusDays(returnDays);

        Map<String, String> unitNameVsIssue = new HashMap<>();

        for (String unitName : unitNameList) {

//            List<File> files = fileRepository.findByUnitNameAndStatus(unitName, "available");
            List<File> files = fileRepository.findByUnitNameAndStatusAndFileType(unitName, "available", fileType);
            if (!files.isEmpty()) {

                for (File file : files) {
                    long fileId = file.getId();
                    FileIssueRequest fileIssueRequest = new FileIssueRequest();
                    fileIssueRequest.setFileId(fileId);
                    fileIssueRequest.setReturnDays(returnDays);
                    fileIssueRequest.setApprovedBy(approvedBy);
                    fileIssueRequest.setRequesterPurpose(requesterPurpose);
                    fileIssueRequest.setThrough(through);
                    fileIssueRequest.setRequesterId(requesterId);
                    FileRequest issueFile = requestService.issueFile(fileIssueRequest);
                    if (issueFile != null) {
                        unitNameVsIssue.put(unitName, "File Issued Successfully");
                    } else {
                        unitNameVsIssue.put(unitName, "File Issued Failed");
                    }
                }
            } else {
                List<File> issued = fileRepository.findByUnitNameAndStatusAndFileType(unitName, "issued", fileType);
                if (issued.isEmpty()) {
                    unitNameVsIssue.put(unitName, "File Not Created");
                } else {
                    unitNameVsIssue.put(unitName, "File Already Issued");
                }
            }
        }
        modelMap.addAttribute("approvedBy", approvedBy);
        modelMap.addAttribute("dueDate", dueDate);
        modelMap.addAttribute("requesterPurpose", requesterPurpose);
        modelMap.addAttribute("through", through);
        modelMap.addAttribute("requesterId", requesterId);
        modelMap.addAttribute("unitNameVsIssue", unitNameVsIssue);
        modelMap.addAttribute("requesterName", requesterName);
//        modelMap.addAttribute("msg", "File Issued Successfully");
        return "requestConfirmation";
    }

    /*
     * @RequestMapping("/showHomePage") public String showDisplayAddFilesPage() {
     * return "homePage"; }
     */

    @RequestMapping("/showAddFiles")
    public String showAddFilesPage() {
        return "addFilePage";
    }

    @RequestMapping(value = "/addFile", method = RequestMethod.POST)
    public String addFile(File newFile, ModelMap modelMap) {
        File file = new File();
        file.setUnitName(newFile.getUnitName());
        file.setCustomerName(newFile.getCustomerName());
        file.setFileType(newFile.getFileType());
        file.setLocationCode(newFile.getLocationCode());
        file.setStatus(newFile.getStatus());
        try {
            fileRepository.save(file);
            modelMap.addAttribute("msg", "File Added Successfully ");
        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.err.println("addFile::Unit Name already in FMS");
            modelMap.addAttribute("msg", "File already in FMS ");
        }
        return "requestConfirmation";
    }

    @RequestMapping("/showEditFiles")
    public String showEditFiles() {
        return "updateFilePage";
    }

    @RequestMapping(value = "/searchFiles", method = RequestMethod.POST)
    public String searchFiles(@RequestParam(name = "unitName") String unitName, ModelMap modelMap) {
        List<File> filesToUpdate = fileRepository.findByUnitName(unitName);
        if (!filesToUpdate.isEmpty()) {
            modelMap.addAttribute("filesToUpdate", filesToUpdate);
            return "updateFilePage";
        } else {
            modelMap.addAttribute("msg", "File Not Created");
            return "updateFilePage";
        }
    }

    @RequestMapping("/editFile")
    public String editFile(@RequestParam("fileId") long fileId, ModelMap modelMap) {
        File fileToUpdate = fileRepository.findById(fileId).get();
        modelMap.addAttribute("fileToUpdate", fileToUpdate);
        return "editFilePage";

    }

    @RequestMapping("/updateFile")
    public String updateFile(@ModelAttribute("file") File file, ModelMap modelMap) {
        File fileToUpdate = fileRepository.findById(file.getId()).get();
        fileToUpdate.setCustomerName(file.getCustomerName());
        fileToUpdate.setFileType(file.getFileType());
        fileToUpdate.setLocationCode(file.getLocationCode());
        fileRepository.save(fileToUpdate);
        modelMap.addAttribute("msg", "File Updated Successfully");
        return "updateFilePage";

    }


}
