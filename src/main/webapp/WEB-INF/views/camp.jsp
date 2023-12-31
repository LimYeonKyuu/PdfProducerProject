<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.example.pdfproducerproject.dao.CampDAO, com.example.pdfproducerproject.vo.CampVO,java.util.*" %>
<%@page import="com.example.pdfproducerproject.dao.StudentDAO, com.example.pdfproducerproject.vo.StudentVO,java.util.*" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
  <title>Pdf Producer</title>
  <link rel="stylesheet" type="text/css" href="${context}/static/css/style.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    function openPdfPage(campKey,studentKey) {
      window.open('/pdf/'+campKey+'/'+studentKey, '_blank');
    }
  </script>
  <script>
    function deleteSelectedStudents() {
      var selectedStudents = []; // 선택된 학생 키를 저장할 배열
      var checkboxes = document.getElementsByClassName("student-checkbox");

      for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
          selectedStudents.push(checkboxes[i].value);
        }
      }

      if (selectedStudents.length > 0) {
        var confirmation = confirm("선택한 학생들을 삭제하시겠습니까?");
        if (confirmation) {
          var url = "/deleteSelectedStudents/${c.getCampKey()}?studentKeys=" + selectedStudents.join(",");
          location.href = url; // URL로 이동하여 컨트롤러로 전송
        }
      } else {
        alert("삭제할 학생을 선택해주세요.");
      }
    }
  </script>
  <script>
    function pdfSelectedStudents() {
      var selectedStudents = []; // 선택된 학생 키를 저장할 배열
      var checkboxes = document.getElementsByClassName("student-checkbox");

      for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
          selectedStudents.push(checkboxes[i].value);
        }
      }

      if (selectedStudents.length > 0) {
        var confirmation = confirm("선택한 학생들의 수료증을 출력하시겠습니까?");
        if (confirmation) {
          var url = "/pdfSelectedStudents/${c.getCampKey()}?studentKeys=" + selectedStudents.join(",");
          window.open(url,'_blank');
        }
      } else {
        alert("수료증을 다운로드 할 학생을 선택해주세요.");
      }
    }
  </script>
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
    </ul>
  </header>

  <%--                 캠프 정보 수정 및 삭제                    --%>
    <div class="d-flex justify-content-end" style="margin-bottom: -30px"><button type="button" class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#updateCampModal" style="margin-right: 5px">캠프 정보 수정</button><button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteCampModal">캠프 삭제</button></div>
    <div class="modal fade" id="deleteCampModal" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="deleteCampModalLabel">캠프 삭제</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            ${c.getName()}를 삭제하시겠습니까? (학생들의 데이터도 모두 삭제됩니다)
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
            <button type="button" class="btn btn-danger" onclick="location.href='/deleteCampOk/${c.getCampKey()}'">삭제</button>
          </div>
        </div>
      </div>
    </div>
    <div class="modal fade" id="updateCampModal" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="updateCampModalLabel">캠프 정보 수정</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>

          <%--                 캠프 정보 수정 모달 창                   --%>
          <div class="modal-body">
            <form id="updateCamp" action="/updateCampOkInPage" method="post">
              <input type="hidden" name="campKey" value="${c.getCampKey()}">
              <div class="mb-3">
                <label for="updateName" class="form-label">이름</label>
                <input type="text" class="form-control" id="updateName" name="name" maxlength="20" value="${c.getName()}">
              </div>
              <div class="mb-3">
                <label for="startDate" class="form-label">시작 날짜</label>
                <input type="date" class="form-control" id="startDate" name="startDate" value="${c.getStartDate()}">
              </div>
              <div class="mb-3">
                <label for="endDate" class="form-label">종료 날짜</label>
                <input type="date" class="form-control" id="endDate" name="endDate" value="${c.getEndDate()}">
              </div>
              <div class="mb-3">
                <label for="content" class="form-label">캠프 정보</label>
                <textarea class="form-control" id="content" name="content" maxlength="300">${c.getContent()}</textarea>
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
    <%--                 캠프 정보                    --%>
    <h2>${c.getName()}</h2>
    <h6>캠프 기간: ${c.getFormatStartDate()} ~ ${c.getFormatEndDate()}</h6>
    <h6>${c.getContent()}</h6>
    <br>
    <br>
    <br>
    <br>
    <br>
    <%--                 학생 리스트                    --%>
    <h4 class="text-left" style="margin: 0; padding: 0;">학생 정보</h4>
    <div class="d-flex justify-content-end" style="margin-top: -30px;">
      <button type="button" class="btn btn-outline-success" style="margin-right: 10px;"onclick="pdfSelectedStudents()">선택 수료증 다운로드</button>
      <button type="button" class="btn btn-outline-danger" style="margin-right: 10px;" onclick="deleteSelectedStudents()">선택 삭제</button>
      <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#addStudentModal">학생 추가</button>
    </div>
    <%--                 학생 추가 모달                    --%>
    <div class="modal fade" id="addStudentModal" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="addStudentModalLabel">학생 추가</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form id="addStudent" class="needs-validation" action="/addStudentOk" method="POST" accept-charset="UTF-8">
              <input type="hidden" name="campKey" value="${c.getCampKey()}">
              <div class="wirte-grid">
                <div>
                  <label for="name" class="label">이름</label>
                </div>
                <div>
                  <input id="name" name="name" type="text" class="input" maxlength="15" style="width: 100%" placeholder="이름을 입력해주세요" required autofocus value>
                </div>
                <br>
                <div>
                  <label for="studentId" class="label">학번</label>
                </div>
                <div>
                  <input id="studentId" name="studentId" type="text" class="input" maxlength="10" style="width: 100%" placeholder="학번을 입력해주세요" required autofocus value>
                </div>
                <br>
                <div>
                  <label for="department" class="label">학부</label>
                </div>
                <select name="department" id="department">
                  <option value="글로벌리더쉽학부">글로벌리더쉽학부</option>
                  <option value="국제어문학부">국제어문학부</option>
                  <option value="경영경제학부">경영경제학부</option>
                  <option value="법학부">법학부</option>
                  <option value="커뮤니케이션학부">커뮤니케이션학부</option>
                  <option value="상담복지학부">상담복지학부</option>
                  <option value="생명과학부">생명과학부</option>
                  <option value="공간환경시스템학부">공간환경시스템학부</option>
                  <option value="전산전자학부">전산전자학부</option>
                  <option value="콘텐츠융합디자인학부">콘텐츠융합디자인학부</option>
                  <option value="기계제어학부">기계제어학부</option>
                  <option value="ICT창업학부">ICT창업학부</option>
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

    <%--                 학생 리스트 바디                    --%>
    <div class="table-responsive small">
      <table class="table table-striped table-sm">
        <thead>
        <tr>
          <th scope="col"><input type="checkbox" id="selectAllStudents"></th>
          <th scope="col">이름</th>
          <th scope="col">학번</th>
          <th scope="col">학부</th>
          <th scope="col" style="text-align:right">총원 ${c.getStudents()}명</th>
        </tr>
        </thead>
        <c:forEach items='${studentList}' var="s">
          <tbody>
          <tr style="font-size: 20px">
            <td><input type="checkbox" class="student-checkbox" value="${s.getStudentKey()}"></td>
            <td>${s.getName()}</td>
            <td>${s.getStudentId()}</td>
            <td>${s.getDepartment()}</td>
            <td class="d-flex justify-content-end"><button type="button" class="btn btn-outline-success" style="margin-right: 5px" onclick="openPdfPage(${s.getCampKey()},${s.getStudentKey()})">수료증 다운로드</button><button type="button" class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#updateStudentModal-${s.getStudentKey()}" style="margin-right: 5px">수정</button><button type="button" class="btn btn-outline-danger" onclick="location.href='/deleteStudentOk/${s.getCampKey()}/${s.getStudentKey()}'">삭제</button></td>
          </tr>
          </tbody>

          <%--                 학생 수정 모달                    --%>
          <div class="modal fade" id="updateStudentModal-${s.getStudentKey()}" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h1 class="modal-title fs-5" id="updateStudentModalLabel-${s.getStudentKey()}">학생 정보 수정</h1>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <form id="updateStudent-${s.getStudentKey()}" action="/updateStudentOk" method="post">
                    <input type="hidden" name="studentKey" value="${s.getStudentKey()}">
                    <input type="hidden" name="campKey" value="${s.getCampKey()}">
                    <div class="mb-3">
                      <label for="updateName-${s.getStudentKey()}" class="form-label">이름</label>
                      <input type="text" class="form-control" id="updateName-${s.getStudentKey()}" name="name" maxlength="20" value="${s.getName()}">
                    </div>
                    <div class="mb-3">
                      <label for="updateStudentId-${s.getStudentKey()}" class="form-label">학번</label>
                      <input type="text" class="form-control" id="updateStudentId-${s.getStudentKey()}" name="studentId" maxlength="10" value="${s.getStudentId()}">
                    </div>
                    <div class="mb-3">
                      <label for="updateDepartment-${s.getStudentKey()}" class="form-label">학부</label>
                      <select name="department" id="updateDepartment-${s.getStudentKey()}">
                        <option value="글로벌리더쉽학부">글로벌리더쉽학부</option>
                        <option value="국제어문학부">국제어문학부</option>
                        <option value="경영경제학부">경영경제학부</option>
                        <option value="법학부">법학부</option>
                        <option value="커뮤니케이션학부">커뮤니케이션학부</option>
                        <option value="상담복지학부">상담복지학부</option>
                        <option value="생명과학부">생명과학부</option>
                        <option value="공간환경시스템학부">공간환경시스템학부</option>
                        <option value="전산전자학부">전산전자학부</option>
                        <option value="콘텐츠융합디자인학부">콘텐츠융합디자인학부</option>
                        <option value="기계제어학부">기계제어학부</option>
                        <option value="ICT창업학부">ICT창업학부</option>
                      </select>
                    </div>
                  </form>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                  <button type="submit" class="btn btn-primary" form="updateStudent-${s.getStudentKey()}">수정</button>
                </div>
              </div>
            </div>
          </div>
        </c:forEach>
      </table>
    </div>
</div>
<script>
  // 전체 학생 선택 체크박스
  var selectAllCheckbox = document.getElementById("selectAllStudents");
  var studentCheckboxes = document.getElementsByClassName("student-checkbox");

  selectAllCheckbox.addEventListener("change", function () {
    if (selectAllCheckbox.checked) {
      for (var i = 0; i < studentCheckboxes.length; i++) {
        studentCheckboxes[i].checked = true;
      }
    } else {
      for (var i = 0; i < studentCheckboxes.length; i++) {
        studentCheckboxes[i].checked = false;
      }
    }
  });
</script>
</body>
</html>

