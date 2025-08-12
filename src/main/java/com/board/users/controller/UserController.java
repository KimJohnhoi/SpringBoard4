package com.board.users.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.users.domain.UserDTO;
import com.board.users.mapper.UserMapper;

@Controller
@RequestMapping("/Users")
public class UserController {
	
	@Autowired
	private  UserMapper  userMapper;
	
	// /Users/List
	@RequestMapping("/List")
	public  String  list( Model   model ) {		
		List<UserDTO> userList =  userMapper.getUserList();
				
		model.addAttribute("userList", userList);
		return "users/list";
	}

	// /Users/WriteForm
	@RequestMapping("/WriteForm")
	public  String  writerForm() {		
		return "users/write";
	}
	
	// /Users/Write
	@RequestMapping("/Write")
	public  String  write( UserDTO userDTO ) {
		userMapper.insertUser( userDTO );
		return "redirect:/Users/List";
	}
	
	// http://localhost:9090/Users/Delete?userid=sky
	@RequestMapping("/Delete")
	public  String   delete( UserDTO  userDTO  ) {
		userMapper.deleteUser( userDTO );
		return "redirect:/Users/List";
	}
	
	// http://localhost:9090/Users/UpdateForm?userid=skysky3
	@RequestMapping("/UpdateForm")
	public  String   updateForm( UserDTO  userDTO , Model model ) {
		// 수정할 정보를 조회한다
		UserDTO  user  =   userMapper.getUser( userDTO  );
		
		// 조회한 정보를 모델에 담는다
	    model.addAttribute("user", user);		
		return "users/update";
	}
	
	// http://localhost:9090/Users/Update
	@RequestMapping("/Update")
	public  String   update( UserDTO userDTO ) {
		// 수정하기
		userMapper.updateUser( userDTO );
		return "redirect:/Users/List";
	}
	
}