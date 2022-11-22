package com.spring.learn.memberboard;

import java.util.List;

public interface MemberBoardService {
	void insertBoard(MemberBoardVO vo);
	void updateBoard(MemberBoardVO vo);
	void deleteBoard(MemberBoardVO vo);
	MemberBoardVO getBoard(MemberBoardVO vo); // 1���� ������ ��ȸ
	List<MemberBoardVO> getBoardList(MemberBoardVO vo); // ��ü�� ��ȸ
	List<MemberBoardVO> resolvedCBoardList(MemberBoardVO vo);
	List<MemberBoardVO> unResolvedCBoardList(MemberBoardVO vo);
	
	
	
}