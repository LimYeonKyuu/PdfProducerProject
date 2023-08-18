<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <title>Pdf Producer</title>
    <link rel="stylesheet" type="text/css" href="${context}/static/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']);
            $( "#startDate" ).datepicker({
                changeMonth: true,
                changeYear: true,
                nextText: '다음 달',
                prevText: '이전 달',
                dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                dateFormat: "yy.mm.dd",
                onClose: function( selectedDate ) {
                    //시작일(startDate) datepicker가 닫힐때
                    //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                    $("#endDate").datepicker( "option", "minDate", selectedDate );
                }

            });
            $( "#endDate" ).datepicker({
                changeMonth: true,
                changeYear: true,
                nextText: '다음 달',
                prevText: '이전 달',
                dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                dateFormat: "yy.mm.dd",
                onClose: function( selectedDate ) {
                    // 종료일(endDate) datepicker가 닫힐때
                    // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                    $("#startDate").datepicker( "option", "maxDate", selectedDate );
                }

            });
        });
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
            <li class="nav-item"><a href="/addCamp" class="nav-link active">캠프 추가</a></li>
            <li class="nav-item"><a href="#" class="nav-link">Pricing</a></li>
            <li class="nav-item"><a href="#" class="nav-link">FAQs</a></li>
            <li class="nav-item"><a href="#" class="nav-link">About</a></li>
        </ul>
    </header>
    <%--                 header                    --%>
        <form class="needs-validation" action="addCampOk" method="POST" accept-charset="UTF-8">
            <div class="wirte-grid" style="max-width: 580px;">
                <div>
                    <label for="name" class="label">캠프 이름</label>
                </div>
                <div>
                    <input id="name" name="name" type="text" class="input" style="width: 100%" placeholder="캠프 이름을 입력해주세요" required autofocus value>
                </div>
                <br>
                <div>
                    <label for="startDate" class="label">캠프 기간</label>
                </div>
                <div class="d-flex"><input type="text" id="startDate" placeholder="시작 날짜" required autofocus value><h6 style="margin: 0; padding: 0;"> ~ </h6><input type="text" id="endDate" placeholder="끝 날짜" required autofocus value></div>
                <br>
                <div>
                    <label for="content" class="label">캠프 설명</label>
                </div>
                <div>
                    <textarea id="content" name="content" class="input" rows="15" style="width: 100%" placeholder="캠프에 관해 간단하게 적어주세요." required autofocus value></textarea>
                    <div id="preview"></div>
                </div>
            </div>
            <button class="btn btn-outline-primary btn-lg" style="width: 580px" type="submit">캠프 추가하기</button>
        </form>
</div>
</body>
</html>

