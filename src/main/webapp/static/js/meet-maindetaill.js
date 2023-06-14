/* 
 * USER DEtaill 페이지
 * 유저가 (guest)가 찜 클릭 찜 취소 참여 user정보까지 보여주는 페이지
*/
	
	document.addEventListener('DOMContentLoaded', () => {
		
		// 부트스트랩 Collapse 객체를 생성 - 초기 상태는 화면에서 안보이는 상태
	    const bsCollapse = new bootstrap.Collapse('div#replyToggleDiv', {toggle: false});
	    
	    // 버튼 아이콘 이미지
	    const toggleBtnIcon = document.querySelector('img#toggleBtnIcon');
		
		
		// 목록 보이기/숨기기 토글 버튼에 이벤트 리스너를 등록
	    const btnToggleReply = document.querySelector('button#btnToggleReply');
	    btnToggleReply.addEventListener('click', () => {
	        bsCollapse.toggle();
	        
	        if (toggleBtnIcon.alt === 'toggle-off') {
	             toggleBtnIcon.src = '../static/images/sample/toggle-on.png';
	             toggleBtnIcon.alt = 'toggle-on';
	             
	             
	        } else {
	            toggleBtnIcon.src = '../static/images/sample/toggle-off.png';
	            toggleBtnIcon.alt = 'toggle-off';
	        
	        }
	    
	    });
		
	
	

	
	/*// 찜 클릭
	const btnLike = document.querySelector('button#like');
		let isLiked = false; // 초기 상태는 찜 클릭이 아닌 경우
			btnLike.addEventListener('click', () => {
	  		if (isLiked) {
				
	    	// 이미 찜 완료 상태인 경우
	    	btnLike.innerHTML = '찜 클릭 ♥';
	    	isLiked = false;
	      } else {
	    	// 찜 완료 상태가 아닌 경우
	    	btnLike.innerHTML = '찜 완료';
	    	isLiked = true;	
	    }
	});
	*/
	/*let isjoined = false; // 초기 상태는 참여하기가 아닌 경우*/
	
	// 참여 클릭
	// const btnjoin = document.querySelector('button#join');
	/*	let isjoined = false; // 초기 상태는 참여하기가 아닌 경우*/
		// 참여 완료되면 화면에서 보여줌
		const goToDetail = function(mtid) {
			window.location.href = `/shape/meet/maindetail?mtid=${mtid}`;
		}	
	/*
	axios.get(`/shape/meet/maindetail`, mtid)
	.then((res) =>{
		console.log(res);
	})
	.catch((err) => {
		console.log(err);
	})
	*/

		const meetJoin = (e) => {
			const mtid = document.querySelector('input#mtid').value;
			const prtcp_id = document.querySelector('input#id').value;
			const name = document.querySelector('input#name').value;
			const gender = document.querySelector('input#gender').value;
			const phone = document.querySelector('input#phone').value;
			const email = document.querySelector('input#email').value;

			console.log(mtid, prtcp_id, name, gender, phone, email);

			const data = { mtid, prtcp_id, name, gender, phone, email };

			axios.post('/shape/meet', data)
				.then((response) => {
					alert('참여완료 했습니다.');
					if(response.data) {
						goToDetail(mtid);
					} else {
						console.log('없든듸');
					}			
				})
				.catch((error) => {
					console.log(error);
				});

		};
		 $('button#join').click(function(e) {
			meetJoin(e);
		});
		 //btnjoin.addEventListener('click', meetJoin);
		
		// 참여 취소
		$('button#delete').click(function(e) {
			deletemeetjoin(e);
		});
		// const btndelete = document.querySelector('button#delete');		
		// btndelete.addEventListener('click', deletemeetjoin);
		const deletemeetjoin = (e) => {
			e.preventDefault();
			
			console.log(e.target);
			if (!confirm('삭제?')) {
				return;
			}
			const mtid = e.target.getAttribute('data-id');
			const id = e.target.getAttribute('data-login');
			const reqUrl = `/shape/meet/${mtid}/${id}`;

			axios.delete(reqUrl)
				.then((response) => {
					console.log(response);
					
					if(response.data) {
						goToDetail(mtid);
					} else {
						console.log('없든듸');
					}
				})
				.catch((error) => {
					console.log(error);
				});
		};

		/*if (isjoined) {
			btnjoin.innerHTML = '참여완료';
			btnjoin.addEventListener('click', deletemeetjoin);
		} else {
			btnjoin.innerHTML = '참여하기';
			btnjoin.addEventListener('click', meetJoin);
		}*/


// document	
});
	

	
	




	

	
    
    