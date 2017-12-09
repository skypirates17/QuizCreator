<%@ include file="_header.jspf" %>
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
						<li><a href="#section-topline-2" class="icon icon-config"><span>Create</span></a></li>
					</ul>
				</nav>
				<div class="content-wrap">
					<section id="section-topline-1">
						<%@ include file="_play.jspf" %>
					</section>
					<section id="section-topline-2">
						<%@ include file="_create.jspf" %>
					</section>
				</div>
				<!-- /content -->
			</div>
			<!-- /tabs -->
		</section>
	</div>
<%@ include file="_footer.jspf" %>