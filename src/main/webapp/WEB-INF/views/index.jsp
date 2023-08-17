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
            <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
            <span class="fs-4">Pdf Producer</span>
        </a>
        <ul class="nav nav-pills">
            <li class="nav-item"><a href="/" class="nav-link active" aria-current="page">Home</a></li>
            <li class="nav-item"><a href="#" class="nav-link">Features</a></li>
            <li class="nav-item"><a href="#" class="nav-link">Pricing</a></li>
            <li class="nav-item"><a href="#" class="nav-link">FAQs</a></li>
            <li class="nav-item"><a href="#" class="nav-link">About</a></li>
        </ul>
    </header>
    <%--                 header                    --%>
        <div class="card mb-4 rounded-3 shadow-sm" style="width: 300px">
            <div class="card-header py-3">
                <h4 class="my-0 fw-normal">A캠프</h4>
            </div>
            <div class="card-body">
                <h1 class="card-title pricing-card-title">$0<small class="text-body-secondary fw-light">/mo</small></h1>
                <ul class="list-unstyled mt-3 mb-4">
                    <li>캠프 기간: 2023.08.21 - 2023.09.20</li>
                    <li>인원: 23명</li>
                    <li>캠프 정보</li>
                    <li>웹서비스 구축 캠프</li>
                </ul>
                <button type="button" class="w-100 btn btn-lg btn-outline-primary">캠프 관리하기</button>
            </div>
        </div>
        <div class="card mb-4 rounded-3 shadow-sm" style="width: 300px">
            <div class="card-header py-3">
                <h4 class="my-0 fw-normal">A캠프</h4>
            </div>
            <div class="card-body">
                <h1 class="card-title pricing-card-title">$0<small class="text-body-secondary fw-light">/mo</small></h1>
                <ul class="list-unstyled mt-3 mb-4">
                    <li>캠프 기간: 2023.08.21 - 2023.09.20</li>
                    <li>인원: 23명</li>
                    <li>캠프 정보</li>
                    <li>웹서비스 구축 캠프</li>
                </ul>
                <button type="button" class="w-100 btn btn-lg btn-outline-primary">캠프 관리하기</button>
            </div>
        </div>
</div>
</body>
</html>

