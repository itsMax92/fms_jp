package com.jp.fms.controllers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jp.fms.model.File;
import com.jp.fms.model.Requester;
import com.jp.fms.repos.FileRepository;
import com.jp.fms.repos.RequesterRepository;

@Controller
public class RequesterController {
	@Autowired
	RequesterRepository requesterRepository;
	@Autowired
	FileRepository fileRepository;

	@RequestMapping("/showRequesters")
	public String showRequesters() {
		return "displayAllRequestersPage";
	}

	@RequestMapping("/showRequestersNew")
	public String showRequesters(ModelMap modelMap) {
		List<Requester> requesters = requesterRepository.findAll();
		Gson gsonBuilder = new GsonBuilder().create();
		String Json = gsonBuilder.toJson(requesters);
//		System.out.println(Json);
		modelMap.addAttribute("Json", Json);
		return "displayAllRequestersPage2";

	}

	@RequestMapping("/showSearchRequester")
	public String showSearchRequester() {
		return "updateRequesterPage";
	}

	@RequestMapping(value = "/searchRequester", method = RequestMethod.POST)
	public String searchRequester(@RequestParam("requesterName") String requesterName, ModelMap modelMap) {
		List<Requester> requesters = requesterRepository.findByRequesterNameStartsWith(requesterName);
		if (!requesters.isEmpty()) {
			modelMap.addAttribute("requesters", requesters);
			return "updateRequesterPage";
		} else {
			modelMap.addAttribute("msg", "Requester Not Created");
			return "updateRequesterPage";
		}

	}

	@RequestMapping("/editRequester")
	public String editRequester(@RequestParam("requesterId") long requesterId, ModelMap modelMap) {
		Requester requesterToUpdate = requesterRepository.findById(requesterId).get();
		modelMap.addAttribute("requesterToUpdate", requesterToUpdate);
		return "editRequesterPage";

	}

	@RequestMapping("/updateRequester")
	public String updateRequester(@ModelAttribute("requester") Requester requester, ModelMap modelMap) {
		Requester fileToRequester = requesterRepository.findById(requester.getId()).get();
		fileToRequester.setRequesterName(requester.getRequesterName());
		fileToRequester.setEmail(requester.getEmail());
		fileToRequester.setDepartment(requester.getDepartment());
		fileToRequester.setPhone(requester.getPhone());
		requesterRepository.save(fileToRequester);
		modelMap.addAttribute("msg", "Requester Updated Successfully");
		return "updateRequesterPage";

	}

	@RequestMapping("/deleteRequester")
	public String deleteRequester(@RequestParam("requesterId") long requesterId, ModelMap modelMap) {
		requesterRepository.deleteById(requesterId);
		modelMap.addAttribute("msg", "Requester Deleted Successfully");
		return "updateRequesterPage";

	}

	@RequestMapping(value = "/requestersearchyellow", method = RequestMethod.POST)
	public String searchYellow(@RequestParam(name = "name") String name, ModelMap modelMap) {
		List<Requester> requesters = requesterRepository.findByRequesterNameStartsWith(name);
		if (!requesters.isEmpty()) {
			modelMap.addAttribute("requesters", requesters);
			return "findRequesterPageYellow";
		} else {
			modelMap.addAttribute("msg", "Requester Not Created");
			return "findRequesterPageYellow";
		}
	}

	@RequestMapping(value = "/requestersearchgreen", method = RequestMethod.POST)
	public String searchGreen(@RequestParam(name = "name") String name, ModelMap modelMap) {
		List<Requester> requesters = requesterRepository.findByRequesterNameStartsWith(name);
		if (!requesters.isEmpty()) {
			modelMap.addAttribute("requesters", requesters);
			return "findRequesterPageGreen";
		} else {
			modelMap.addAttribute("msg", "Requester Not Created");
			return "findRequesterPageGreen";
		}
	}

	@RequestMapping(value = "/greennumbersearch", method = RequestMethod.POST)
	public String searchGreenNumber(@RequestParam(name = "numbers") String numbers, ModelMap modelMap) {
		try{
			List<String> list = Arrays.asList(numbers.split(" "));
			List<File> fileList = new ArrayList<>();
			for (String number : list) {
				List<File> green = fileRepository.findByGreenNumberAndFileType(number, "GREEN");
				fileList.addAll(green);
			}
			if (!fileList.isEmpty()) {
				modelMap.addAttribute("fileList", fileList);
				return "findGreenNumberPage";
			} else {
				modelMap.addAttribute("msg", "Green File Not Created");
				return "findGreenNumberPage";
			}
		}catch (Exception e) {
			System.err.println(e.getMessage());
			modelMap.addAttribute("msg", "Something went wrong");
		}
		modelMap.addAttribute("msg", "Something went wrong");
		return "findGreenNumberPage";
	}

	@RequestMapping("/showAddRequester")
	public String showAddRequester() {
		return "addRequesterPage";
	}

	@RequestMapping(value = "/addRequester", method = RequestMethod.POST)
	public String addFile(Requester newRequester, ModelMap modelMap) {
		Requester requester = new Requester();
		requester.setRequesterName(newRequester.getRequesterName());
		requester.setEmail(newRequester.getEmail());
		requester.setDepartment(newRequester.getDepartment());
		requester.setPhone(newRequester.getPhone());
		requesterRepository.save(requester);
		modelMap.addAttribute("msg", "Requester Added Successfully ");
		return "requestConfirmation";
	}

}
