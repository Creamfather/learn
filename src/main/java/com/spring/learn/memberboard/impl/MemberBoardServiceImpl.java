package com.spring.learn.memberboard.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.learn.board.BoardService;
import com.spring.learn.memberboard.CallcenterCommentVO;
import com.spring.learn.memberboard.MemberBoardService;
import com.spring.learn.memberboard.MemberBoardVO;

// UserService
@Service("memberBoardService")
public class MemberBoardServiceImpl implements MemberBoardService {
	
	@Autowired
	private MemberBoardDAO memberBoardDAO;

	public MemberBoardServiceImpl() {
		System.out.println(">> BoardServiceImple 생성");
	}

	@Override
	public void insertBoard(MemberBoardVO vo) {
		memberBoardDAO.insertBoard(vo);
	}

	@Override
	public void updateBoard(MemberBoardVO vo) {
		memberBoardDAO.updateBoard(vo);
	}

	@Override
	public void deleteBoard(MemberBoardVO vo) {
		memberBoardDAO.deleteBoard(vo);
	}

	@Override
	public MemberBoardVO getBoard(MemberBoardVO vo) {		
		return memberBoardDAO.getBoard(vo);
	}


	@Override
	public List<MemberBoardVO> getBoardList(Map<String, String> map) {
		return memberBoardDAO.getBoardList(map);
	}
	
	@Override
	public int countBoard(MemberBoardVO vo) {
		return memberBoardDAO.countBoard(vo);
	}

	@Override
	public void addCallcenterComment(CallcenterCommentVO cvo) {
		memberBoardDAO.addCallcenterComment(cvo);		
	}

	@Override
	public List<CallcenterCommentVO> getCallcenterComment(MemberBoardVO bvo) {
		return memberBoardDAO.getCallcenterComment(bvo);
	}

	@Override
	public void delCallcenterComment(CallcenterCommentVO cvo) {
		memberBoardDAO.delCallcenterComment(cvo);
	}

  
}
