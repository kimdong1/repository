<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 헬스장 로그인</title>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->
	
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> 
<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Josefin+Sans:100,300,400,600,700');
	
	.login{
	   font-family: 'Josefin Sans', sans-serif;
	   background: #f4f4f4; 
	   padding:70px 0px;
	}
	
	h1{
	    font-weight:600;
	    font-family: 'Josefin Sans', sans-serif;
	    text-transform:capitalize;
	    text-align:center;
	    color:#FFF;
	    background:#72d6f5;
	    padding:25px 0px;
	}
	
	form{
	    padding:80px;
	}
	
	.inner-form{
	    background:#FFF;
	    box-shadow: 0 2px 4px 0 rgba(0,0,0,0.4);
	}
	
	label{
	    font-weight:400;
	    font-size:15px;
	}
	
	.form-control {
	    background-color: #f5f5f5;
	    box-shadow: none;
	    color: #565656;
	    font-size:14px;
	    padding:30px 10px;
	    margin-bottom:30px;
	    border: 1px solid #f1f1f1;
	}
	
	.btn{ 
	    background: #72d6f5;
	    color: #FFF;
	    border-radius: 6px;
	    margin: 0 auto;
	    height: 48px;
	    line-height: 38px;
	    display: table;
	    font-size: 15px;
	    width: 100%;
	}
	
	.btn:hover{
	    background:#FFF;
	    border:2px solid #24acb3;
	}
	
	.forgot{
	    text-align:center;
	    margin-top:30px;
	    font-size:16px;
	}
	
	input[type=text], 
	input[type=password], 
	input[type=email] {
	    background-color: transparent;
	    border: none;
	    border-bottom: 1px solid #72d6f5;
	    border-radius: 0;
	    width: 100%;
	    margin: 0 0 30px 0;
	    padding: 0;
	    box-shadow: none;
	}
	
	
	input[type=text]:focus,
	input[type=password]:focus,
	input[type=email]:focus {
	    box-shadow: none;
	    border-bottom: 1px solid #6eafc4;
	}
</style>
</head>
<body>
	<div class="login">
	   <div class="container">
	       <div class="col-lg-6 col-lg-offset-3">
	           <div class="inner-form">
	            
	                <h1>로그인</h1> 
	            
	               <form role="form" action="${pageContext.request.contextPath }/member/loginOk" method="POST">
	        		   <div class="row">
	        		          
	    			    	<div class="col-lg-12 col-xs-12">
	    			    	    <label>Email</label>
	    			    	    <div class="form-group">
	    			    			<input type="email" name="email" id="email" class="form-control" placeholder="">
	    			    		</div>
	    			    	</div>
	    			    	
	    			    	<div class="col-lg-12 col-xs-12">
	    			    	    <label>Password</label>
	    			    	    <div class="form-group">
	    							<input type="password" name="password" id="password" class="form-control" placeholder="">
	    			    		</div>
	    			    	</div>
	    			    	
	    					<div class="col-lg-12 col-xs-12">
	    					    <button type="submit" class="btn btn-default">
	    							<span>LOGIN</span>
	    						</button>
	    					</div>
	    					
	    					<div class="col-lg-12 col-xs-12">
	        					<div class="forgot">
	        					<a href="${pageContext.request.contextPath }/member/idSearch">아이디 찾기</a>
	        					<span>&nbsp&nbsp</span>
	        					<a href="${pageContext.request.contextPath }/member/passwordSearch">비밀번호 찾기</a>
	        					<span>&nbsp&nbsp</span>
	        					<a href="${pageContext.request.contextPath }/member/join">회원가입</a>
	        					</div>
	    					</div>
	    						
	        			 </div>
	        	     </form>
	    	    
	            </div> <!-- inner-form -->
			</div>   
		</div>   
	</div>    
</body>
</html>