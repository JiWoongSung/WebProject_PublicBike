<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert data here</title>
<link rel="stylesheet" type="text/css" href="../css/regi.css">
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"></link>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js">
</script>

<script type="text/javascript">
//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
var idCheck = 0;

$(function() {
    //idck 버튼을 클릭했을 때 
    $("#idchck").click(function() {  	
        
        //userid 를 param.
        var userid = $("#loginID").val(); 
        
        $.ajax({
            type : 'POST',
            url : "/Arrange/idCheck?loginID="+userid,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data : userid,
            dataType : "json",
            success : function(data) {
            	//alert("성공입니다." + data.result);
            	
            	if(data.result==0){
            		alert("사용가능한 아이디입니다!");
            		idCheck = 1;

            	} else if(data.result==1){
            		alert("이미 등록된 아이디입니다.");
            		idCheck = 0;
            	}
            	else{
            		alert("아이디를 입력해주세요.");
            	}           
              
            },
            error : function(error) {
                
                alert("error2 : " + error);
            }
        });
    });
});
 
 
</script>


<script>
    $(document).ready(function() {
 
        $("#btnAdd").click(function() { //버튼 클릭이벤트
 
            var loginID = $("#loginID").val(); //태그입력값
            var password = $("#password").val();
            var name = $("#name").val();
            var gender = $('input[name="gender"]:checked').val();
 			var date = $("#birth").val();
 			var email = $("#email").val();

 			 
            if (loginID == "") { //빈값이면
                alert("ID 입력하세요");
                $("#loginID").focus(); //입력포커스 이동
                return; //함수 종료
            }
 			if (password == ""){
 				alert("비밀번호를 입력하세요");
                $("#password").focus(); //입력포커스 이동
                return; //함수 종료
 			}
 			if ($("#password").val() != $("#password2").val()){
 				alert("비밀번호를 재확인 해주세요.");
                $("#password2").focus(); //입력포커스 이동
                return; //함수 종료
 			}
            if (name == "") {
 
                alert("이름을 입력하세요");
                $("#name").focus();
                return;
 
            }
 
            if (gender == "") {
 
                alert("성별을 M/W 입력하세요");
                $("#gender").focus();
                return;
 
            }
            if (date == "") {
            	 
                alert("생년월일을 입력하세요");
                $("#birth").focus();
                return;
            }
            
            if (email1 == ""|| email2=="default") {
                alert("이메일 입력하세요");
                $("#email").focus();
                return;
            }
            
 
            /* 폼에 입력한 데이터를 서버로 전송 */
            if(idCheck==0){
            	alert("아이디 중복확인을 해주세요.");
            }
            else if(idCheck==1){
                document.form1.submit();
            }            
        });
 
    });
</script>

 
</head>
<body>
    <!-- request.getContextPath() = 컨택스트 페스를 리턴함 -->
    <!-- ction ="/컨텍스트/가상디렉토리 / 서블릿 url" -->
    <!-- id 는 jsp에서 쓸 것이고 name은 서블릿에서 사용할 것이다. -->
  
	<header>
		<h1>회원정보등록</h1>
	</header>
	<hr>
 	<div class="container">
	 	<div class="divClass col-md-offset-3 col-md-6">
		    <form name="form1"method="post" action="<%=request.getContextPath()%>/DataInsert">
		    	<div class="form-group">
		    		<label>아이디</label>
		 			<input type="text" class="form-control"name="loginID" id="loginID" autocomplete=off placeholder="아이디">
		       		<input type="button" class="btn btn-default" name="idChck" id="idchck" value="중복확인" >
		       	</div>
		       	<div class="form-group">
		    		<label>비밀번호</label>
		 			<input type="password" class="form-control"name="password" id="password" autocomplete=off placeholder="비밀번호">
		       	</div>
		       	<div class="form-group">
		    		<label>비밀번호 재확인</label>
		 			<input type="password" class="form-control"name="password2" id="password2" autocomplete=off placeholder="비밀번호 재확인">
		       	</div>
		       	<div class="form-group">
		       		<label>이름</label>
		        	<input type="text" class="form-control" name="name" id="name" autocomplete=off placeholder="이름">
		        </div>
		        <div class="form-group">
		    		<label>카드아이디</label>
		 			<input type="text" class="form-control"name="cardID" id="cardID" autocomplete=off placeholder="카드아이디">
		       	</div>
		  <!--      	<div class="form-group">
		    	<label>이메일주소</label>
		 			<input type="email" class="form-control"name="email" id="email" autocomplete=off placeholder="이메일주소">
		       	</div>  -->
				<div class="form-group">
		    		<label>이메일주소</label>
		    		<br>
		    		<input type="text" id="email1" name="email1" autocomplete=off placeholder="이메일">
			    		@
					  	<select id="email2" name="email2">
	               			<option value="default">- - - - 선택 - - - -</option>
	               			<option value="naver.com">naver.com</option>
	               			<option value="hanmail.com">hanmail.com</option>
	               			<option value="nate.com">nate.com</option>
	               			<option value="gmail.com">gmail.com</option>
	               			<option value="yahoo.co.kr">yahoo.co.kr</option>
	            		</select>       
  				</div> 
		       	    	 
		        <div class="form-group">
		        	<label>성별</label>
			        <div class="radio">
			        	<label>
			        	<input type="radio" name="gender" value="M" checked required>남자
			        	</label>
			        	<label>
			        	<input type="radio" name="gender" value="W" required>여자
			        	</label>
			        </div>
		        </div>
		       	<div class="form-group">
			       	<label>생년월일</label>
			       	<br>
			        <input type="date" name="birth" id="birth" autocomplete=off>
		        </div>
		        <input type="button" class="btn btn-primary" id="btnAdd" value="확인">
		        <input type="reset" class="btn btn-default" value="취소" onclick="location.href='login.jsp'">
		        
		    </form>
		    
	    </div>
 	</div>
</body>
</html>

