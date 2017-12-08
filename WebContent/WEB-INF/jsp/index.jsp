<!DOCTYPE html>
<html lang="en" class="no-js">
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
					</div><!-- /content -->
				</div><!-- /tabs -->
			</section>


		</div><!-- /container -->
		<script src="js/cbpFWTabs.js"></script>
		<script>
			(function() {

				[].slice.call( document.querySelectorAll( '.tabs' ) ).forEach( function( el ) {
					new CBPFWTabs( el );
				});

			})();
		</script>
	</body>
</html>