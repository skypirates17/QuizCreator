<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
           
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Quiz Creator</title>
		<meta name="description" content="Tab Styles Inspiration: A small collection of styles for tabs" />
		<meta name="keywords" content="tabs, inspiration, web design, css, modern, effects, svg" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/tabs.css" />
		<link rel="stylesheet" type="text/css" href="css/tabstyles.css" />
		<link rel="stylesheet" type="text/css" href="css/callouts.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
		<script src="js/modernizr.custom.js"></script>
		<script type="text/javascript" src="js/nicEdit-latest.js"></script> <script type="text/javascript">
			bkLib.onDomLoaded(function() { 
			nicEditors.allTextAreas() 
			//new nicEditor().panelInstance('area2');
			//new nicEditor({fullPanel : false}).panelInstance('area2');
			
			// new nicEditor({buttonList : ['bold']}).panelInstance('area2');
			       
			});
		</script>
	</head>
	<body>
		<div class="container">
			<header class="codrops-header">
				<h1>Quiz Creator <span>Civil Service Exam</span></h1>
				<p class="support">Your browser does not support <strong>flexbox</strong>! <br />Please view this demo with a <strong>modern browser</strong>.</p>
			</header>
			<section>
				<div class="tabs tabs-style-topline">
					<nav>
						<ul>
							<li><a href="#section-topline-1" class="icon icon-home"><span>Play</span></a></li>
							<li><a href="#section-topline-5" class="icon icon-config"><span>Create</span></a></li>
						</ul>
					</nav>
					<div class="content-wrap">
						<section id="section-topline-1">
							<div class="bs-callout bs-callout-default">
								<h4>Default Callout</h4>
								This is a default callout.
							</div>
							<div class="bs-callout bs-callout-primary">
								<h4>Primary Callout</h4>
								This is a primary callout.
							</div>
							<div class="bs-callout bs-callout-success">
								<h4>Success Callout</h4>
								This is a success callout.
							</div>
							<div class="bs-callout bs-callout-info">
								<h4>Info Callout</h4>
								This is an info callout.
							</div>
							<div class="bs-callout bs-callout-warning">
								<h4>Warning Callout</h4>
								This is a warning callout.
							</div>
							<div class="bs-callout bs-callout-danger">
								<h4>Danger Callout</h4>
								This is a danger callout.
							</div>
						</section>
						<section id="section-topline-5">
							<%@ include file="_create.jspf" %>
						</section>
					</div>
					<!-- /content -->
				</div>
				<!-- /tabs -->
			</section>
		</div>
		<!-- /container -->
		<script src="js/cbpFWTabs.js"></script>
		<script>
			(function() {
			
				[].slice.call( document.querySelectorAll( '.tabs' ) ).forEach( function( el ) {
					new CBPFWTabs( el );
				});
			
			})();
			
			$(document).ready(function() { 
			
			
			});
			
			
			function arrayReplace (thisArray, thisName, thisValue) {
				$.each(thisArray, function(key, data) {
				    if (this.name == thisName) 
				        this.value=thisValue;
				});
			}
			
			
			$('#QuizForm').on('submit',function(e){
				var url = '<c:url value="/saveQuestion.htm" />';
				var data = $('#QuizForm :input').serializeArray();
				arrayReplace(data, 'QUESTION', new nicEditors.findEditor('QUESTION').getContent());
				arrayReplace(data, 'ANSWER_EXPLAINATION', new nicEditors.findEditor('ANSWER_EXPLAINATION').getContent());
				
				var form = JSON.stringify(data);
				e.preventDefault(); // avoid to execute the actual submit of the form.
				
			    $.ajax({
			        type     	: 'POST',
			        url      	: url,
			        data     	: {form: form},
			        success  	: function(resp) {
			        	var obj = jQuery.parseJSON( resp );
			        	alert("SUCCESS");
			        	/*
			        	showNotification(obj.TITLE, obj.MESSAGE, obj.ERRORTYPE);
			        	btn.button('reset');
			        	if (obj.ERRORTYPE == 2) {
			        		var newdivcontent = '<div class="alert alert-success"><strong>Success!</strong><br>Thanks! Your message has been successfully sent. <br>And please avoid from sending this form again as NID may track us ;)</div>';
			        		$("#mynewform").html(newdivcontent);
			        	}
			        	*/
			        },
			        error		: function() {
			        	alert("ERROR");
			        	/*
			        	showNotification("Error","There was an error submitting message...",4);
			        	btn.button('reset');
			        	*/
			        }
			    });
			    
			});
		</script>
	</body>
</html>