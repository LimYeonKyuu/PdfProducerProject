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
      <li class="nav-item"><a href="/" class="nav-link" aria-current="page">Home</a></li>
      <li class="nav-item"><a href="#" class="nav-link">Features</a></li>
      <li class="nav-item"><a href="#" class="nav-link">Pricing</a></li>
      <li class="nav-item"><a href="#" class="nav-link">FAQs</a></li>
      <li class="nav-item"><a href="#" class="nav-link">About</a></li>
    </ul>
  </header>
  <%--                 header                    --%>
    <h2>A캠프</h2>
    <h6>캠프 기간: 2023.08.21 - 2023.09.20</h6>
    <h6>웹서비스 구축 캠프</h6>
    <br>
    <br>
    <br>
    <br>
    <br>
    <h4 class="text-left" style="margin: 0; padding: 0;">학생 정보</h4>
    <div class="d-flex justify-content-end" style="margin-top: -30px;">
      <button type="button" class="btn btn-outline-danger" style="margin-right: 10px;">선택 삭제</button>
      <button type="button" class="btn btn-outline-primary">학생 추가</button>
    </div>
    <div class="table-responsive small">
      <table class="table table-striped table-sm">
        <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">이름</th>
          <th scope="col">학번</th>
          <th scope="col">학부</th>
          <th scope="col" style="text-align:right">총원 23명</th>
        </tr>
        </thead>
        <tbody>
        <tr style="font-size: 20px">
          <td >1</td>
          <td>임연규</td>
          <td>21900613</td>
          <td>전산전자학부</td>
          <td class="d-flex justify-content-end"><button type="button" class="btn btn-outline-warning" style="margin-right: 5px">수정</button><button type="button" class="btn btn-outline-danger">삭제</button></td>
        </tr>
        </tbody>
      </table>
      <div class="d-flex justify-content-center"><button type="button" class="btn btn-outline-success">수료증 다운로드</button></div>
      <div class="d-flex justify-content-end"><button type="button" class="btn btn-outline-warning" style="margin-right: 5px">캠프 정보 수정</button><button type="button" class="btn btn-outline-danger">캠프 삭제</button></div>
    </div>
</div>
</body>
</html>

