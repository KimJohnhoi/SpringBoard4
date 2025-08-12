package com.board.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.BoardDTO;
import com.board.mapper.BoardMapper;
import com.board.menus.domain.MenuDTO;
import com.board.menus.mapper.MenuMapper;

@Controller
public class BoardController {
	
	@Autowired
	private MenuMapper menuMapper;
	
	@Autowired
	private BoardMapper boardMapper;
		
	@RequestMapping("/Board/List")
	public ModelAndView list(MenuDTO menuDTO) {
		
		// 메뉴 리스트
		List<MenuDTO> menuList = menuMapper.getMenuList();
		
		// 게시물 목록 처리
		List<BoardDTO> boardList = boardMapper.getBoardList(menuDTO);

		// 상단 메뉴이름 가져오기
		menuDTO = menuMapper.getMenu(menuDTO);
			
		ModelAndView mv = new ModelAndView();
		mv.addObject("menuList", menuList);
		mv.addObject("menuName", menuDTO);
		mv.addObject("boardList", boardList);
		mv.setViewName("board/list");
		return mv;
	}
	
	@RequestMapping("/Board/WriteForm")
	public ModelAndView writeForm(MenuDTO menuDTO) {
		List<MenuDTO> menuList = menuMapper.getMenuList();
		
		menuDTO = menuMapper.getMenu(menuDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("menuList", menuList);
		mv.addObject("menu", menuDTO);
		mv.setViewName("board/write");
		return mv;
	}
	
	@RequestMapping("/Board/Write")
	public ModelAndView write(BoardDTO boardDTO) {
		boardMapper.insertBoard(boardDTO);		
		String menu_id = boardDTO.getMenu_id();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Board/List?menu_id="+menu_id);
		return mv;
	}
	
	@RequestMapping("/Board/View")
	public ModelAndView view(BoardDTO boardDTO, MenuDTO menuDTO) {
		
		// 메뉴 리스트
		List<MenuDTO> menuList = menuMapper.getMenuList();
		
		// 조회수 업데이트하기
		boardMapper.updateHit(boardDTO);
		
		// 게시판 내용 가져오기
		boardDTO = boardMapper.getBoard(boardDTO);
		
		// 게시판 이름 가져오기
		menuDTO = menuMapper.getMenu(menuDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("menuList", menuList);
		mv.addObject("menu", menuDTO);
		mv.addObject("view", boardDTO);
		mv.setViewName("board/view");		
		return mv;
	}
	
	@RequestMapping("/Board/UpdateForm")
	public ModelAndView updateForm(BoardDTO boardDTO, MenuDTO menuDTO) {
		
		// 메뉴 리스트
		List<MenuDTO> menuList = menuMapper.getMenuList();
		
		// 게시판 내용 가져오기
		boardDTO = boardMapper.getBoard(boardDTO);
		
		// 게시판 이름 가져오기
		menuDTO = menuMapper.getMenu(menuDTO);
				
		ModelAndView mv = new ModelAndView();
		mv.addObject("menuList", menuList);
		mv.addObject("menuName", menuDTO);
		mv.addObject("view", boardDTO);
		mv.setViewName("board/updateForm");
		return mv;
	}
	
	@RequestMapping("/Board/Update")
	public ModelAndView update(BoardDTO boardDTO) {
		boardMapper.updateBoard(boardDTO);		
		String menu_id = boardDTO.getMenu_id();
		
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("redirect:/Board/List?menu_id="+menu_id);
		return mv;
	}
	
	@RequestMapping("/Board/Delete")
	public ModelAndView delete(BoardDTO boardDTO) {
		BoardDTO board = boardMapper.getBoard(boardDTO);
		String menu_id = board.getMenu_id();
		
		boardMapper.delBoard(boardDTO);

		ModelAndView mv = new ModelAndView();		
		mv.setViewName("redirect:/Board/List?menu_id="+menu_id);
		return mv;
	}
	
}