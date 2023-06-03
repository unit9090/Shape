<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shape</title>
</head>
<body>
	<div>
		<div>
			<!-- 작성 -->
			<div>
				<div>
					<div>
						<h3>모임 만들기</h3>
						<div>
							<p>
							" 필수 입력 "
							<strong>*</strong>
							<br>
							" 모임 분야, 모임 장소, 모집 기간, 모임 인원은 수정할 수 없습니다. "
							</p>
						</div>
						<form action="" method="post">
							<dl>
								<dt>
								"모임 제목"
									<span>*</span>
								</dt>
								<dd>
									<div>
										<label for="title">
											<input type="text" id="title" name="title" class="input-default"
											placeholder="모임의 제목을 입력하세요." value required>
										</label>	
									</div>
								</dd>	
								<dt>
								"모임 분류"
									<span>*</span>
								</dt>
								<dd>
									<div>
										<label>
											<select>
												<option value>카테고리를 선택하세요.</option>
												<option value="1">운동·액티비티</option>
												<option value="2">음식·음료</option>
												<option value="3">취미</option>
												<option value="4">여행·동행</option>
												<option value="5">자기계발·교육</option>
												<option value="6">동네·친목</option>
												<option value="7">문화·예술</option>
												<option value="8">기타</option>
											</select>
										</label>
									</div>
								</dd>
								<dt>
								"모임 장소"
								<span>*</span>
								</dt>
								<dd>
									<div>
										<div>
											<label> <!-- 셀렉트 박스 내용은 js에서 처리 -->
												<select name="sido" id="sido"></select>
											</label>
										</div>
										<div>
											<label> <!-- 셀렉트 박스 내용은 js에서 처리 -->
												<select name="gugun" id="gugun"></select>
											</label>
										</div>
									</div>
									<div>
										<label>
											<input type="text" id="location" name="location" class="input-default"
											placeholder="상세주소 및 장소명을 입력해주세요." value>
										</label>
									</div>
								</dd>
								<dt id="mt_schedule">
								"모임 일정"
								<span>*</span>
								</dt>
								<dd id="mt_schedule_detail">
									<div>
										<div>
											<label>
												<i></i>
												<input type="date" id="start_date" name="start_date" class="input-date" 
												placeholder="날짜" value>
											</label>
										</div>
										<div>
											<label>
												<i></i>
												<input type="time" id="start_time" name="start_time" class="input-default"
												placeholder="시간" value>
											</label>
										</div>
									</div>
								</dd>
								<dt id="rcrt_prd">
								"모집 기간"
								<span>*</span>
								</dt>
								<dd id="rcrt_prd_detail">
									<div>
										<div>
											<label for="rcrt_str_date">
												<i></i>
												<input type="date" id="rcrt_str_date" name="rcrt_str_date" class="input-date" 
												placeholder="시작날짜" value>
											</label>
										</div>
										<div>
											<label for="rcrt_end_date">
												<i></i>
												<input type="date" id="rcrt_end_date" name="rcrt_end_date" class="input-default"
												placeholder="종료날짜" value>
											</label>
										</div>
									</div>
								</dd>
								<dt>
								"모임 인원"
								<span>*</span>
								</dt>
								<dd>
									<div>
										<div>
											<label for="nm_ppl">
												<input type="number" id="nm_ppl" name="nm_ppl" class="input-default"
												placeholder="인원 수를 입력하세요. (숫자만 입력)">
											</label>
										</div>
									</div>
								</dd>
								<dt id="mt_cost">
								"참가비용(원)"
								<span>*</span>
								</dt>
								<dd id="mt_cost_detail">
									<div>
										<div>
											<label for="mt_cost">
												<input type="number" id="mt_cost" class="input-default"
												placeholder="참가비용을 입력하세요. 예) 5000(숫자만 입력)" value>
											</label>
										</div>
										<div>
											<label for="mt_cost_info">
												<select id="mt_cost_info" name="mt_cost_info" class="select-default">
													<option value="none">---참가비 없음---</option>
													<option value="snack">다과비</option>
													<option value="material">재료비</option>
													<option value="rental">대관료</option>
													<option value="operation">운영비</option>
													<option value="noshow">노쇼방지</option>
													<option value="etc">기타</option>
												</select>
											</label>
										</div>
									</div>
								</dd>
								<dt>
								"모임 사진"
								</dt>
								<dd>
									<div>
										<div class="filebox">
											<label for="mt_img_upload">
											이미지 파일 업로드
											</label>
											<input type="file" id="mt_img_upload" name="mt_img_upload" accept="image/*">
										</div>
									</div>
								</dd>
								<dt>
								"모임 상세 내용"
								</dt>
								<dd>
									<div>
										<div>
											<label>
												<textarea placeholder="모임을 소개해주세요."></textarea>
											</label>
										</div>
									</div>
								</dd>	
							</dl>
							<div>
								<div>
									<div>
										<button type="button" class="btn-cancel">취소</button>
									</div>
									<div>
										<button type="button" class="btn-create">모임 만들기</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>