<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <title>Pdf Producer</title>
    <link rel="stylesheet" type="text/css" href="${context}/static/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
<div class="container">

    <%--                 header                    --%>
    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
        <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
            Pdf Producer
        </a>
        <ul class="nav nav-pills">
            <li class="nav-item"><a href="/" class="nav-link" aria-current="page">캠프 목록</a></li>
            <li class="nav-item"><a href="/addCamp" class="nav-link active">캠프 추가</a></li>
        </ul>
    </header>

    <%--                 캠프 추가 폼                    --%>
        <form class="needs-validation" action="/addCampOk" method="POST" accept-charset="UTF-8">
            <div class="wirte-grid" style="max-width: 580px;">
                <div>
                    <label for="name" class="label">캠프 이름</label>
                </div>
                <div>
                    <input id="name" name="name" type="text" class="input" style="width: 100%" maxlength="20" placeholder="캠프 이름을 입력해주세요" required autofocus value>
                </div>
                <br>
                <div>
                    <label for="startDate" class="label">캠프 기간</label>
                </div>
                <div class="d-flex"><input type="date" id="startDate" name="startDate" placeholder="시작 날짜" required autofocus value><h6 style="margin: 2px; padding: 2px;"> ~ </h6><input type="date" name="endDate" id="endDate" placeholder="끝 날짜" required autofocus value></div>
                <br>
                <div>
                    <label for="content" class="label">캠프 설명</label>
                </div>
                <div>
                    <textarea id="content" name="content" class="input" rows="15" style="width: 100%" maxlength="300" placeholder="캠프에 관해 간단하게 적어주세요." required autofocus value></textarea>
                    <div id="preview"></div>
                </div>
            </div>
            <button class="btn btn-outline-primary btn-lg" style="width: 580px" type="submit">캠프 추가하기</button>
        </form>
</div>
</body>
</html>

