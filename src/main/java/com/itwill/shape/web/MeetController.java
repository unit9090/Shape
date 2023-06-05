package com.itwill.shape.web;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.shape.domain.MeetPrtcp;
import com.itwill.shape.dto.MeetInfoCreateDto;
import com.itwill.shape.dto.MeetInfoUpdateDto;
import com.itwill.shape.dto.MeetListCountDto;
import com.itwill.shape.dto.MeetMainDetailDto;
import com.itwill.shape.dto.PostDetailDto;
import com.itwill.shape.service.MeetDetailService;
import com.itwill.shape.service.MeetInfoService;
import com.itwill.shape.service.MeetListService;

import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/meet")
@Controller
public class MeetController {
	
	private final MeetInfoService meetInfoService;
	private final MeetListService meetListService;
	private final MeetDetailService meetDetailService; // 상세보기 서비스 다시 만들었습니다.
	
	@GetMapping("/create")
	public void create() {
		log.info("GET: create()");
	}
	
	/**
	 * 0604 정지언
	 * 모임 만들기(모임 등록)
	 * @param dto
	 * @return
	 */
	@PostMapping("/create")
	public String create(MeetInfoCreateDto dto) {
		log.info("POST: create({})", dto);
		
		int result = meetInfoService.create(dto);
		log.info("모임 만들기 결과 = {}", result);
		
		return "redirect:/meet/list";
		
		// 여기에 blob에 저장하기 위해 url을 byte로 변환하는 코드를 넣어야하는 지?
	}
	
	/**
	 * 0604 정지언
	 * 수정할 모임의 정보를 불러옴.
	 * @param mtid
	 * @param model
	 */
	@GetMapping("/modify")
	public void modify(long mtid, Model model) {
		log.info("modify(mtid={})", mtid);
		
		MeetMainDetailDto dto = meetDetailService.read(mtid);
		model.addAttribute("meet", dto);
		
	}
	
	/**
	 * 0604 정지언
	 * 모임 수정(모임 업데이트)
	 * @param dto
	 * @return
	 */
	@PostMapping("/update")
	public String update(MeetInfoUpdateDto dto) {
		log.info("update(dto={})", dto);
		
		int result = meetInfoService.update(dto);
		log.info("모임 수정 결과 = {}", result);
		
		return "redirect:/meet/maindetail";
	}
	
	/**
	 * 0604 정지언
	 * 모임 삭제
	 * @param mtid
	 * @return
	 */
	@PostMapping("/delete")
	public String delete(long mtid) {
		log.info("delete(mtid={})", mtid);
		
		int result = meetInfoService.delete(mtid);
		log.info("모임 삭제 결과 = {}", result);
		
		return "redirect:/meet/list";
		
	}
	
	/**
	 * 0604 김지민
	 * 최신순(basic) 정렬
	 * @param model
	 */
	@GetMapping("/list")
	public void readBasic(Model model) {
		log.info("readBasic");

		List<MeetListCountDto> dto = meetListService.readByCreateTime();

		// 뷰에 PostDetailDto를 전달.
		model.addAttribute("listCount", dto);

	}
	
	/**
	 * 0604 배선영
	 * 상세보기 페이지
	 * @param mtid, model
	 */
		@GetMapping("/maindetail") // mtid로 경로 변수 이름 수정
		public void maindetail(long id, Model model) {
		    log.info("maindetail(id = {})", id);

		    // 서비스 계층에 메서드 호출해서 화면에 보여줄 MeetDetaildto를 가져옴.
		    List<MeetMainDetailDto> list = meetDetailService.detailByMtid(id);

		    // 뷰에 MeetDetaildto를 전달.
		    model.addAttribute("meetmaindetail" , list);
		}

		
	}
	
