<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.example.pdfproducerproject.dao.CampDAO, com.example.pdfproducerproject.vo.CampVO,java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
            <li class="nav-item"><a href="/" class="nav-link active" aria-current="page">캠프 목록</a></li>
            <li class="nav-item"><a href="/addCamp" class="nav-link">캠프 추가</a></li>
            <li class="nav-item"><a href="#" class="nav-link">Pricing</a></li>
            <li class="nav-item"><a href="#" class="nav-link">FAQs</a></li>
            <li class="nav-item"><a href="#" class="nav-link">About</a></li>
        </ul>
    </header>
    <%--                 header                    --%>

        <div class="row row-cols-lg-3 row-cols-md-2">
            <c:forEach items='${campList}' var="c">
                <div class="col" style="margin-top: 20px">
                    <div class="card mb-4 rounded-3 shadow-sm" style="width: 330px">
                        <div class="card-header py-3">
                            <h4 class="my-0 fw-normal">${fn:substring(c.getName(), 0, 8)}${fn:length(c.getName()) > 8 ? '...' : ''}</h4>
                            <div class="d-flex justify-content-end" style="margin-top: -30px"><button type="button" class="btn btn-sm btn-outline-warning" data-bs-toggle="modal" data-bs-target="#updateCampModal-${c.getCampKey()}" style="margin-right: 5px">수정</button><button type="button" class="btn btn-sm btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteCampModal-${c.getCampKey()}">삭제</button></div>
                        </div>
                        <div class="card-body">
                            <ul class="list-unstyled mt-3 mb-4">
                                <li style="padding: 5px">캠프 기간: ${c.getStartDate()} ~ ${c.getEndDate()}</li>
                                <li style="padding:5px">인원: ${c.getStudents()}명</li>
                                <li style="padding:5px">캠프 정보</li>
                                <li style="height: 150px; border: 1px solid #f0f0f0; padding: 5px">${c.getContent()}</li>
                            </ul>
                            <button type="button" class="w-100 btn btn-lg btn-outline-primary" onclick="location.href='/camp/${c.getCampKey()}'">캠프 관리하기</button>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="deleteCampModal-${c.getCampKey()}" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="deleteCampModalLabel-${c.getCampKey()}">캠프 삭제</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                    ${c.getName()}를 삭제하시겠습니까?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-danger" onclick="location.href='/deleteCampOk/${c.getCampKey()}'">삭제</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="updateCampModal-${c.getCampKey()}" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="updateCampModalLabel-${c.getCampKey()}">캠프 정보 수정</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="updateCamp" action="/updateCampOk" method="post">
                                    <input type="hidden" name="campKey" value="${c.getCampKey()}">
                                    <div class="mb-3">
                                        <label for="updateCampName-${c.getCampKey()}" class="form-label">이름</label>
                                        <input type="text" class="form-control" id="updateCampName-${c.getCampKey()}" name="name" maxlength="20" value="${c.getName()}">
                                    </div>
                                    <div class="mb-3">
                                        <label for="updateCampStartDate-${c.getCampKey()}" class="form-label">시작 날짜</label>
                                        <input type="date" class="form-control" id="updateCampStartDate-${c.getCampKey()}" name="startDate" value="${c.getStartDate()}">
                                    </div>
                                    <div class="mb-3">
                                        <label for="updateCampEndDate-${c.getCampKey()}" class="form-label">종료 날짜</label>
                                        <input type="date" class="form-control" id="updateCampEndDate-${c.getCampKey()}" name="endDate" value="${c.getEndDate()}">
                                    </div>
                                    <div class="mb-3">
                                        <label for="updateCampContent-${c.getCampKey()}" class="form-label">캠프 정보</label>
                                        <textarea class="form-control" id="updateCampContent-${c.getCampKey()}" name="content" maxlength="300">${c.getContent()}</textarea>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                <button type="submit" class="btn btn-primary" form="updateCamp">수정</button>
                            </div>
                        </div>
                    </div>
                </div>

            </c:forEach>
        </div>
</div>
</body>
</html>

