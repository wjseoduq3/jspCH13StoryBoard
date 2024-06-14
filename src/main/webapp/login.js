/**
 * 
 */

  function loginCheck() {
	if(document.loginForm.userID.value.length == 0) {
		alert("아이디는 입력해주세요.");
		document.loginForm.adminID.focus();
		return false; 
	}
	if(document.loginForm.userPW.value.length < 6) {
		alert("비밀번호는 6자 이상이어야 합니다.");
		document.loginForm.adminPW.focus();
		return false; 
	}
	
	return true;
  }

  