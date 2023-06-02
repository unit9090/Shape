<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<!-- 반응형 웹 페이지 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- css -->
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
			crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
		<!-- <link rel="stylesheet" href="../static/css/common.css"/> -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/common.css"/>
		<!-- icon -->
		<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/static/images/common/favicon.ico">
		<title>Shape</title>
	</head>
	<body>
		<div id="wrap">
			<header class="header">
				<div class="inner-wrap">
					<h1 class="logo"><a href="/" title="홈페이지">메인페이지</a></h1>
				</div>
				<div class="header-wrap">
					<div class="util">
						<!-- 로그인 전 -->
						<div class="before">
							<c:url value="/member/customLogin" var="login"></c:url>
							<a href="${ login }" title="login">로그인</a>
							<c:url value="/member/signUp" var="signUp"></c:url>
							<a href="${ signUp }" title="signUp">회원가입</a>
							<c:url value="/user/guide" var="guide"/>
							<a href="${ guide }" title="guide">가이드</a>
							<c:url value="/member/logout" var="logout"/>
							<a href="${ logout }" title="logout">로그아웃</a>
						</div>
					</div>
				</div>
				<nav>
					<ul class="gnb">
						<li>
							<a href="">기업개요</a>
						</li>
						<li>
							<a href="">모임</a>
							<ul class="sub_menu">
								<li><a href="">모임만들기</a></li>
								<li><a href="">모임 찾기</a></li>
							</ul>
						</li>
						<li>
							<a href="">게시판</a>
							<ul class="sub_menu">
								<li><a href="">게시판</a></li>
								<li><a href="">글쓰기</a></li>
							</ul>
						</li>
						<li>
							<a href="">도움말</a>
							<ul class="sub_menu">
								<li><a href="/info/notice">공지사항</a></li>
								<c:url value="/info/faq" var="faq"></c:url>
								<li><a href="${ faq }">FAQ</a></li>
								<c:url value="/info/qna" var="qna"></c:url>
								<li><a href="${ qna }">Q&amp;A</a></li>
							</ul>
						</li>
						<!-- 로그인 후 -->
						<li class="profile">
							<a href=""><i class="bi bi-person after-login"></i></a>
							<ul class="sub_menu">
								<li>
									<c:url value="/myprofile" var="myPage"></c:url>
									<a href="${ myPage }">마이페이지</a>
								</li>
								<li><a href="">로그아웃</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</header>