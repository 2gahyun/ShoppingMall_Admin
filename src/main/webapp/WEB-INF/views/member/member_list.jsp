<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/assets/css/table_style.css">
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script>
        $(function(){
            $(".member_del").click(function(){
                let seq = $(this).attr("data-seq");
                alert(seq);
            })
        })
        // document.addEventListener("DOMContentLoaded", function () {
        //     $("#member").addClass("current");

        //     // $(function(){
        //     $.ajax({
        //         type: "get",
        //         url: "/member/api/list",
        //         success: function (r) {
        //             for (let i = 0; i < r.data.length; i++) {

        //                 let mem_status = '';
        //                 if (r.data[i].mi_status == 1) {
        //                     mem_status = '가입대기'
        //                 }
        //                 if (r.data[i].mi_status == 2) {
        //                     mem_status = '정상사용'
        //                 }
        //                 if (r.data[i].mi_status == 3) {
        //                     mem_status = '사용정지'
        //                 }
        //                 if (r.data[i].mi_status == 4) {
        //                     mem_status = '탈퇴대기'
        //                 }
        //                 let tag =
        //                     '<tr>' +
        //                     '<td>' + r.data[i].mi_id + '</td>' +
        //                     '<td>' + r.data[i].mi_name + '</td>' +
        //                     '<td>' + r.data[i].mi_email + '</td>' +
        //                     '<td>' + r.data[i].mi_address + '</td>' +
        //                     '<td>' + r.data[i].mi_birth + '</td>' +
        //                     '<td>' + (r.data[i].member_gen == 0 ? "남성" : r.data[i].member_gen == 1 ?
        //                         "여성" : "선택안함") + '</td>' +
        //                     '<td>' + r.data[i].mi_phone + '</td>' +
        //                     '<td>' + r.data[i].mi_pay_card + '</td>' +
        //                     '<td>' + r.data[i].mi_pay_account + '</td>' +
        //                     '<td>' + r.data[i].mi_grade + '</td>' +
        //                     '<td>' + r.data[i].mi_point + '</td>' +
        //                     '<td>' + mem_status + '</td>' +
        //                     '<td>' + '<button class="member_delete" data-seq="' + r.data[i].mi_seq +
        //                     '">삭제</button>' + '</td>' +
        //                     '</tr>'
        //                 $("#member_tbody").append(tag);
        //             }
        //             $(".member_delete").click(function () {
        //                 // alert("삭제클릭");
        //                 let seq = $(this).attr("data-seq");
        //                 if (confirm("삭제하시겠습니까?")) {
        //                     $.ajax({
        //                         type: "delete",
        //                         url: "/member/api/delete?seq=" + seq,
        //                         success: function (r) {
        //                             alert(r.message);
        //                             location.reload();
        //                         }
        //                     })
        //                 }
        //             })
        //         }
        //     })
        // })
        // })
    </script>
</head>

<body>
    <%@include file="/WEB-INF/views/includes/header.jsp" %>
    <h1>회원관리</h1>
    <div class="member_list list">
        <table id="member_table">
            <thead>
                <tr>
                    <td>번호</td>
                    <td>아이디</td>
                    <td>이름</td>
                    <td>이메일</td>
                    <td>주소</td>
                    <td>생년월일</td>
                    <td>성별</td>
                    <td>전화번호</td>
                    <td>결제 카드정보</td>
                    <td>결제 계좌정보</td>
                    <td>회원 등급</td>
                    <td>포인트</td>
                    <td>회원상태</td>
                    <td></td>
                    <td></td>
                </tr>
            </thead>
            <tbody id="member_tbody">
                <c:forEach items="${list}" var="user">
                    <tr>
                        <td>${user.mi_seq}</td>
                        <td>${user.mi_id}</td>
                        <td>${user.mi_name}</td>
                        <td>${user.mi_email}</td>
                        <td>${user.mi_address}</td>
                        <td>${user.mi_birth}</td>
                        <td>
                            <c:if test="${user.mi_gen == 0}">
                                남성
                            </c:if>
                            <c:if test="${user.mi_gen == 1}">
                                여성
                            </c:if>
                            <c:if test="${user.mi_gen == 2}">
                                선택안함
                            </c:if>
                        </td>
                        <td>${user.mi_gen}</td>
                        <td>${user.mi_phone}</td>
                        <td>${user.mi_pay_card}</td>
                        <td>${user.mi_pay_account}</td>
                        <td>${user.mi_grade}</td>
                        <td>${user.mi_point}</td>
                        <td>
                            <c:if test="${user.mi_status == 0}">
                                가입대기
                            </c:if>
                            <c:if test="${user.mi_status == 1}">
                                정상사용
                            </c:if>
                            <c:if test="${user.mi_status == 2}">
                                사용정지
                            </c:if>
                            <c:if test="${user.mi_status == 3}">
                                탈퇴대기
                            </c:if>
                        </td>
                        <td>
                            <button class="member_del" data-seq="${user.mi_seq}">삭제</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>

</html>