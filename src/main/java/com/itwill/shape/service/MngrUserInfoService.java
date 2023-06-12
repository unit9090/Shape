package com.itwill.shape.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.shape.domain.UserInfo;
import com.itwill.shape.dto.MngrUserInfoSearchListDto;
import com.itwill.shape.dto.MngrUserInfoSelectDto;
import com.itwill.shape.dto.UserInfoSelectByIdDto;
import com.itwill.shape.repository.UserInfoRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MngrUserInfoService {
	
	private final UserInfoRepository userInfoRepository;
	
	/**
	 * 하지윤
	 * 관리자 - 모든 사용자 조회
	 * 
	 * @return
	 */
	public List<MngrUserInfoSelectDto> selectAllUser() {
		log.info("selectAllUser()");
		
		List<UserInfo> list = userInfoRepository.selectAllUser();
		
		return list.stream().map(MngrUserInfoSelectDto::fromEntity).toList();
	}
	
	/**
	 * 하지윤
	 * 관리자 - 사용자 상세보기
	 * 
	 * @param id
	 * @return
	 */
	public UserInfoSelectByIdDto selectUserDetail(String id) {
		log.info("selectUserDetail(id = {})", id);
		
		return UserInfoSelectByIdDto.fromEntity(userInfoRepository.readUserInfoById(id));
	}
	
	public List<MngrUserInfoSelectDto> selectByKeyword(MngrUserInfoSearchListDto dto) {
		log.info("selectByKeyword(dto = {})", dto);
		
		List<UserInfo> list = userInfoRepository.selectByKeyword(dto);
		
		return list.stream().map(MngrUserInfoSelectDto::fromEntity).toList();
	}

}