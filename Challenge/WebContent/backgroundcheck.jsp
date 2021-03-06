<%@page import="com.instacart.challenge.model.ShopperApplication"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<% ShopperApplication shopperApplication = (ShopperApplication)session.getAttribute("sessionData");
	
	if(shopperApplication == null){
		response.sendRedirect("/InstacartChallenge/");
		return;
	}
	
	long timeLeft = (session.getCreationTime() + session.getMaxInactiveInterval()*1000)- System.currentTimeMillis(); 

%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<script src ="https://code.jquery.com/jquery-1.8.2.min.js"></script>
	<script src="http://vitalets.github.io/x-editable/assets/bootstrap300/js/bootstrap.js" ></script>
	<link rel="stylesheet" href="http://vitalets.github.io/x-editable/assets/x-editable/bootstrap3-editable/css/bootstrap-editable.css" type="text/css" charset="utf-8"/>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js">
	</script>
	<script src="http://vitalets.github.io/x-editable/assets/x-editable/bootstrap3-editable/js/bootstrap-editable.js">
	</script>
	<link rel="stylesheet"  href="./css/shopperApp.css" >
	<link rel="stylesheet" href="http://vitalets.github.io/x-editable/assets/bootstrap300/css/bootstrap.css" type="text/css" charset="utf-8" />
	<script src = "./js/validations.js"></script>
	<script src = "./js/backgroundcheck.js"></script>
	
	
	<script type="text/javascript">
	
	
		setTimeout(goBack, <%=timeLeft%>);
		
	</script>	
	
	<div class="bgcheck-text">
		<form id ="authForm" name="authForm" action="/InstacartChallenge/SaveShopperApplication" onsubmit="return validateForm()" method="post" >
		  
		<h1>Notification and Authorization to Release Criminal Information for Employment Purposes</h1>
		<br />
		<br />
		<h2>Notification</h2><br />
		<p>
				The position for which I am being considered requires me to consent to a criminal background check as a condition of employment.  This check includes the following:  Criminal history reference searches for felony and misdemeanor convictions at the county and federal levels of every jurisdiction where I currently reside or where I have resided during the past 7 years; and sex offender registry searches at the county and federal levels in every jurisdiction where I currently reside or where I have resided.
		</p>
		<br />
		
		<h2>Authorization</h2>
	
		<p>
			
		<span class="important">*</span><input type="checkbox" name="auth"  id="auth"/>   I hereby authorize Instacart to conduct the criminal background check described above.  In connection with this, I also authorize the use of law enforcement agencies and/or private background check organizations to assist Instacart in collecting this information.  Validity Screening Solutions has been secured as a third party vendor (consumer reporting agency) to assist Instacart in collecting and verifying information.

			I also am aware that records of arrests on pending charges and/or convictions are not an absolute bar to employment.  Such information will be used to determine whether the results of the background check reasonably bear on my trustworthiness or my ability to perform the duties of my position as an Instacart employee.

		</p>
		
		<br />
		<small  id="authNotChecked" class="form-text hidden err-message ">*Please check the box before submitting to authorize background check and store your information in our candidate database.</small>
		
		<h4>Please verify your information below before submitting</h4>
		
		<div id="formFields">
			<table border="0" cellspacing="5" cellpadding="5" class="table table-bordered table-striped">
				<tbody> 
                    
                    <tr>         
                        <td>First Name</td>
                        <td><a href="#" class="myeditable editable" id="fname" data-type="text" data-name="fname" data-placement="right" data-placeholder="Required" data-title="Enter your first name"><%=shopperApplication.getFirstName()%></a></td>
                    </tr>
                    <tr>         
                        <td>Last Name</td>
                        <td><a href="#" class="myeditable editable" id="lname" data-type="text" data-name="lname" data-placement="right" data-placeholder="Required" data-title="Enter your last name"><%=shopperApplication.getLastName()%></a></td>
                    </tr>
                    <tr>         
                        <td>E-mail</td>
                        <td><a href="#" class="myeditable editable" id="email" data-type="text" data-name="email" data-placement="right" data-placeholder="Required" data-title="Enter your e-mail"><%=shopperApplication.getEmail()%></a></td>
                    </tr>
                    <tr>         
                        <td>Phone number</td>
                        <td><a href="#" class="myeditable editable" id="number" data-type="text" data-name="number" data-placement="right" data-placeholder="Required" data-title="Enter your phone number"><%=shopperApplication.getPhoneNumber()%></a></td>
                    </tr>
                    <tr>         
                        <td>Referral Code</td>
                        <td><a href="#" class="myeditable editable" id="rcode" data-type="text" data-name="rcode" data-placement="right"  data-title="Enter referral code"><%=shopperApplication.getReferralCode()%></a></td>
                    </tr>  
              </tbody>      
			</table>
			   
		</div>
		
		<div class="time-left-message">Your session expires in <span id="time-left" timeLeft="<%=timeLeft%>"></span> seconds </div>
		<div style="text-align:center">
			<button id="back" onclick="goBack()" class="btn btn-primary" type="button">Back</button>
			<button type="button" id="save_shopper" class="btn btn-primary">Submit</button>
		</div>
		</form>
	  
	</div>	

</body>
</html>