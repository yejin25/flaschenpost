<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>About page</title>
    <link type="text/css" rel="stylesheet" href="css/About_style.css">
</head>
<body background="img/about_background.png">

<header>
    <h1>
        <a href="main.jsp" style="text-decoration:none; color:#111453">Flaschenpost</a>
    </h1>
</header>
<nav id="topnav">
    <ul>
        <li><a href="#why">Why make?</a></li>
        <li><a href="#how">How to use?</a></li>
        <li><a href="#who">Who are we?</a></li>
    </ul>
</nav>

<nav id="remote">
    <ul>
        <li><a href="#why">Why make?</a></li>
        </br>
        </br>
        <li><a href="#how">How to use?</a></li>
        </br>
        </br>
        <li><a href="#who">Who are we?</a></li>
    </ul>
</nav>

<section>
    <article id="why">
        <h2>Why make?</h2>
        <p>
            flaschenpost 는 독일어로 병에 편지를 넣어 바다에 띄워 보내는 통신이란 뜻으로, 익명으로  편지를 교환할 수 있는 웹입니다. 삶에 지친 현대인들에게 간편한 방식으로 힐링을 전하고, 지인에게 쉽게 말할 수 없는 비밀을 털어놓으면서 스트레스를 해소할 수 있는 공간을 제공하고자 제작되었습니다.</br>
친구가 많더라도 자신의 깊은 곳까지 마음을 드러내고 대화할 수 있는 사람은 적습니다. 이 웹 사이트는 가장 친한 친구에게도 말할 수 없는 비밀을 아무에게나 털어놓고 싶을 때, 혹은 별 의미 없는 일상적인 편지나 긍정적인 메시지를 전달하고 싶을 때 사용할 수 있습니다.
        </p>
    </article>
    <article id="how">
        <h2>How to use?</h2>
        <p>
            
            <br/><br/><br/><br/><img id=howUse src='img/tutorial.PNG'><br/><br/><br/><br/>
            
			1. 자유롭게 편지를 작성합니다.<br/>
   			(비속어와 같이 적절하지 못한 글은 필터링되어 바다에 띄워 보낼 수 없습니다.)<br/><br/>

			2. 원하는 글꼴, 글자색, 그룹을 지정할 수 있습니다.<br/><br/>

			3. send 버튼 클릭하면 다른 사용자가 띄워 보낸 편지를 받을 수 있습니다.<br/><br/>
        </p>
    </article>
    <article id="who">
        <h2>Who are we?</h2>
        <p>
        <ul class="imglist">
            <li class="imgblock"><img src="img/profile.png"></br>서예진</li>
            <li class="imgblock"><img src="img/profile.png"></br>이수아</li>
            <li class="imgblock"><img src="img/profile.png"></br>정윤영</li>
            <li class="imgblock"><img src="img/profile.png"></br>한별</li>
        </ul>

        </p>
    </article>
</section>
</body>
</html>