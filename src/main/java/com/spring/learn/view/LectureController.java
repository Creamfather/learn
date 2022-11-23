package com.spring.learn.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.learn.lecture.LectureService;

@Controller					// 단 현재 위치(클래스)에서만 유효
@SessionAttributes({"lecture"}) // lecture라는 이름의 Model객체가 있으면 세션에 저장
@RequestMapping("/lecture")
public class LectureController {

	@Autowired
	private LectureService lectureService;
	
	
	public LectureController() {
		System.out.println(">> LectureController() 생성");
	}
	

	
}
