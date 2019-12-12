// 자주 사용되는 사용자 자바스크립트 함수의 모임
/**

 * 스크립트 기반 POST 전송

 * @param action - URL

 * @param params - JSON

 * @returns

 * 호출 : sendPost('list.jsp',{"p":1,"b":10,"s":10});

 */

function sendPost(action, params) {

	var form = document.createElement('form');

	form.setAttribute('method', 'post');

	form.setAttribute('action', action);

	document.charset = "utf-8";

	for ( var key in params) {

		var hiddenField = document.createElement('input');

		hiddenField.setAttribute('type', 'hidden');

		hiddenField.setAttribute('name', key);

		hiddenField.setAttribute('value', params[key]);

		form.appendChild(hiddenField);

	}

	document.body.appendChild(form);

	form.submit();

}

// 이메일 유효성 검사
function validateEmail(email) {
	var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return re.test(email);
}    	

// 핸드폰 유효성 검사
function validatePhone(phone) {
	var re = /^\d{2,3}-\d{3,4}-\d{4}$/;
	return re.test(phone);
}



// 이름 유효성검사
function validateName(name) {
	var re = /^[가-힣]{2,10}$/;
	return re.test(name);
}

//특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
function validatePassword(password) {
	var re = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	return re.test(password);
}
