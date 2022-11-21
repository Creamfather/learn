package com.spring.learn.board.impl;

import java.util.List;

import com.spring.learn.board.BoardVO;

public interface BoardDAO {
	// �޼ҵ���� Mapper ������ id������ ���
	void insertBoard(BoardVO vo);
	void updateBoard(BoardVO vo);
	void deleteBoard(BoardVO vo);
	BoardVO getBoard(BoardVO vo);
	List<BoardVO> getBoardList(BoardVO vo);
}





