package org.debugroom.mynavi.sample.ecs.backendforfront.app.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestOperations;

import org.debugroom.mynavi.sample.ecs.backendforfront.app.model.User;

@Controller
public class BackendForFrontController {

	@Autowired
	RestOperations restOperations; //Backendサービスを呼び出すために利用

	@RequestMapping(method = RequestMethod.GET, value="users")
	public String getUsers(Model model) {
		String service = "/backend/api/v1/users";
		model.addAttribute("users",
				restOperations.getForObject(service, User[].class));
		return "users";
		
	}
		
	
}
