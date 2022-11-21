package com.spring.learn.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.learn.board.BoardService;

@Controller					// �� ���� ��ġ(Ŭ����)������ ��ȿ
@SessionAttributes("board") // board��� �̸��� Model��ü�� ������ ���ǿ� ����
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	public BoardController() {
		System.out.println(">> BoardController() ������");
	}
	
	

	
	
}
