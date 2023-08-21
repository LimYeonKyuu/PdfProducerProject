<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.example.pdfproducerproject.dao.CampDAO, com.example.pdfproducerproject.vo.CampVO,java.util.*" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
  <title>Pdf Producer</title>
  <link rel="stylesheet" type="text/css" href="${context}/static/css/style.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
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
      <li class="nav-item"><a href="/addCamp" class="nav-link">캠프 추가</a></li>
      <li class="nav-item"><a href="#" class="nav-link">Pricing</a></li>
      <li class="nav-item"><a href="#" class="nav-link">FAQs</a></li>
      <li class="nav-item"><a href="#" class="nav-link">About</a></li>
    </ul>
  </header>
  <%--                 header                    --%>
    <div class="d-flex justify-content-end" style="margin-bottom: -30px"><button type="button" class="btn btn-outline-warning" style="margin-right: 5px">캠프 정보 수정</button><button type="button" class="btn btn-outline-danger">캠프 삭제</button></div>
    <h2>${c.getName()}</h2>
    <h6>캠프 기간: ${c.getStartDate()} - ${c.getEndDate()}</h6>
    <h6>${c.getContent()}</h6>
    <br>
    <br>
    <br>
    <br>
    <br>
    <h4 class="text-left" style="margin: 0; padding: 0;">학생 정보</h4>
    <div class="d-flex justify-content-end" style="margin-top: -30px;">
      <button type="button" class="btn btn-outline-danger" style="margin-right: 10px;">선택 삭제</button>
      <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">학생 추가</button>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">학생 추가</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form id="addStudent" class="needs-validation" action="/addStudentOk" method="POST" accept-charset="UTF-8">
              <div class="wirte-grid">
                <div>
                  <label for="name" class="label">이름</label>
                </div>
                <div>
                  <input id="name" name="name" type="text" class="input" style="width: 100%" placeholder="이름을 입력해주세요" required autofocus value>
                </div>
                <br>
                <div>
                  <label for="studentId" class="label">학번</label>
                </div>
                <div>
                  <input id="studentId" name="studentId" type="text" class="input" style="width: 100%" placeholder="학번을 입력해주세요" required autofocus value>
                </div>
                <br>
                <div>
                  <label for="department" class="label">학부</label>
                </div>
                <select name="department" id="department">
                  <option value="0">글로벌리더쉽학부</option>
                  <option value="1">국제어문학부</option>
                  <option value="2">경영경제학부</option>
                  <option value="3">법학부</option>
                  <option value="4">커뮤니케이션학부</option>
                  <option value="5">상담복지학부</option>
                  <option value="6">생명과학부</option>
                  <option value="7">공간환경시스템학부</option>
                  <option value="8">전산전자학부</option>
                  <option value="9">콘텐츠융합디자인학부</option>
                  <option value="10">기계제어학부</option>
                  <option value="11">ICT창업학부</option>
                </select>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
            <button type="submit" form="addStudent" class="btn btn-primary">입력</button>
          </div>
        </div>
      </div>
    </div>

    <div class="table-responsive small">
      <table class="table table-striped table-sm">
        <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">이름</th>
          <th scope="col">학번</th>
          <th scope="col">학부</th>
          <th scope="col" style="text-align:right">총원 ${c.getStudent()}명</th>
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
    </div>
</div>
</body>
</html>

