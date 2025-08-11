package com.board.menus.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.board.menus.domain.MenuDTO;
import com.board.menus.mapper.MenuMapper;


@Controller
public class MenuController {
	
	@Autowired
	private MenuMapper menuMapper;
	
	@RequestMapping("/Menus/List")
	public String list(Model model) {
		
		List<MenuDTO> menuList = menuMapper.getMenuList();
		//System.out.println(menuList);
		
		//					key(jstl), value	
		model.addAttribute("menuList", menuList);
		return "menus/list";
	}
	
	@RequestMapping("/Menus/WriteForm")
	public String writeForm() {
		return "menus/write";
	}
	
	@RequestMapping("/Menus/WriteForm2")
	public String writeForm2() {
		return "menus/write2";
	}
	
	@RequestMapping("/Menus/Write")
	public String write(MenuDTO menuDTO) {
		
		menuMapper.insertMenu(menuDTO);
			
		//return "menus/list";
		return "redirect:/Menus/List"; //response.sendRedirect()
	}
	
	@RequestMapping("/Menus/Write2")
	public String write2(MenuDTO menuDTO) {
		
		//System.out.println(menuDTO); 넘어온 menu_name
		menuMapper.insertMenu2(menuDTO);
		
		return "redirect:/Menus/List";	
	}
		
	@RequestMapping("/Menus/Delete")
	public String delete(MenuDTO menuDTO) {
		
		//System.out.println(menuDTO);		
		menuMapper.deleteMenu(menuDTO);
		return "redirect:/Menus/List";
	}
	
	@RequestMapping("/Menus/UpdateForm")
	public String updateForm(MenuDTO menuDTO, Model model) {
		
		//System.out.println(menuDTO);	넘어온 menu_id를 받아옴
		MenuDTO menu = menuMapper.getMenu(menuDTO);
		//System.out.println(menu); 조회한 정보
		model.addAttribute("upMenu", menu);
		return "menus/update";
	}
	
	@RequestMapping("/Menus/Update")
	public String update(MenuDTO menuDTO) {
		//System.out.println(menuDTO); 넘어온 정보확인
		menuMapper.updateMenu(menuDTO);
		return "redirect:/Menus/List";
	}	
}
