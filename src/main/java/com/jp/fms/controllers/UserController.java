package com.jp.fms.controllers;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jp.fms.model.FileRequest;
import com.jp.fms.model.User;
import com.jp.fms.repos.FileRepository;
import com.jp.fms.repos.FileRequestRepository;
import com.jp.fms.repos.RequesterRepository;
import com.jp.fms.repos.UserRepository;

@Controller
public class UserController {

	@Autowired
	private UserRepository userRepository;
	@Autowired
	private FileRepository fileRepository;
	@Autowired
	private FileRequestRepository fileRequestRepository;
	@Autowired
	private RequesterRepository requesterRepository;
	@Value("${chart.url}")
	private String postUrl;

	@RequestMapping(value = "/username", method = RequestMethod.GET)
	@ResponseBody
	public Object currentUserDetails(Authentication authentication) {
		String s = authentication.getName();
		System.out.println(s);
		System.out.println(authentication);
		return authentication;
	}

	@GetMapping({ "/", "/showHomePage" })
	public String home(ModelMap modelMap) {
		long totalRequesters = requesterRepository.count();
		long totalFiles = fileRepository.count();
		List<FileRequest> findAllByStatus = fileRequestRepository.findAllByStatus("File Issued");
		int totalPendingFiles = findAllByStatus.size();
		{
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
			int totalOverDueFiles = requests.size();
			modelMap.addAttribute("totalOverDueFiles", totalOverDueFiles);
		}
		List<FileRequest> allRequests = fileRequestRepository.findAllByStatus("File Issued");
		List<Long> dailyIssuedFiles = new ArrayList<Long>();
		for (int i = 0; i <= 10; i++) {
			LocalDate date = LocalDate.now().minusDays(i);
			long files = 0;
			for (FileRequest fileRequest : allRequests) {
				if (fileRequest.getIssuedDate().startsWith(date.toString())) {
					files++;
				}
			}
			dailyIssuedFiles.add(files);
		}
		modelMap.addAttribute("dailyIssuedFiles", dailyIssuedFiles);
		modelMap.addAttribute("totalRequesters", totalRequesters);
		modelMap.addAttribute("totalFiles", totalFiles);
		modelMap.addAttribute("totalPendingFiles", totalPendingFiles);
//		modelMap.addAttribute("postUrl", postUrl);
		return "homePage";
	}

	@RequestMapping("/showReg")
	public String showRegistrationPage() {
		return "login/registerUser";
	}

	@RequestMapping("/showLogin")
	public String showLoginPage() {
		return "login/login";
	}

	@RequestMapping(method = RequestMethod.POST, value = "registerUser")
	public String register(@ModelAttribute("user") User user) {
		userRepository.save(user);
		return "login/login";

	}

	@RequestMapping(method = RequestMethod.POST, value = "/login")
	public String login(@RequestParam("email") String email, @RequestParam("password") String password,
			ModelMap modelMap) {
		User user = userRepository.findByEmail(email);

		if (user.getPassword().equals(password)) {
			return "homePage";
		} else {
			modelMap.addAttribute("msg", "wrong password, please try again");
			return "login/login";
		}
	}
}
