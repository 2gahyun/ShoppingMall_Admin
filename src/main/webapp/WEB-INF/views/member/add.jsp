<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/assets/css/reset.css">
    <link rel="stylesheet" href="/assets/css/member_add.css">
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="/assets/js/member_add.js"></script>
    <script>
        // let isDupId = true;
        // let isDupEmail = true;

        // document.addEventListener("DOMContentLoaded", function () {

        //     document.getElementById("add").addEventListener("click", function () {
        //         if (isDupId == true) {
        //             alert("아이디 중복체크를 해주세요.");
        //             return;
        //         }
        //         if (isDupEmail == true){
        //             alert("이메일 중복체크를 해주세요.");
        //             return;
        //         }
        //         let mi_id = document.getElementById("mi_id").value
        //         let mi_pwd = document.getElementById("mi_pwd").value
        //         let mi_pwd_con = document.getElementById("mi_pwd_con").value
        //         let mi_name = document.getElementById("mi_name").value
        //         let mi_email = document.getElementById("mi_email").value
        //         let mi_addr = document.getElementById("mi_addr").value
        //         let mi_birth = document.getElementById("mi_birth").value
        //         let mi_gen = document.getElementById("mi_gen").value
        //         let mi_phone = document.getElementById("mi_phone").value
        //         let mi_pay_card = document.getElementById("mi_pay_card").value
        //         let mi_pay_acc = document.getElementById("mi_pay_acc").value
        //         // let mi_status = document.getElementsByName("mi_status").value

        //         if (mi_id == '' || mi_id == null || mi_id == undefined) {
        //             alert("아이디를 입력하세요.");
        //             return;
        //         }
        //         if (mi_pwd == '' || mi_pwd == null || mi_pwd == undefined) {
        //             alert("비밀번호를 입력하세요.");
        //             return;
        //         }
        //         if (mi_pwd.length < 6) {
        //             alert("비밀번호를 6자 이상 입력하세요.");
        //             return;
        //         }
        //         if (mi_pwd != mi_pwd_con) {
        //             alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
        //             return;
        //         }
        //         if (mi_name == '' || mi_name == null || mi_name == undefined) {
        //             alert("이름을 입력하세요.");
        //             return;
        //         }
        //         if (mi_email == '' || mi_email == null || mi_email == undefined) {
        //             alert("이메일을 입력하세요.");
        //             return;
        //         }
        //         if (mi_addr == '' || mi_addr == null || mi_addr == undefined) {
        //             alert("주소를 입력하세요.");
        //             return;
        //         }
        //         if (mi_birth == '' || mi_birth == null || mi_birth == undefined) {
        //             alert("생년월일을 입력하세요.");
        //             return;
        //         }
        //         if (mi_phone == '' || mi_phone == null || mi_phone == undefined) {
        //             alert("전화번호를 입력하세요.");
        //             return;
        //         }

        //         let data = {
        //             mi_id: mi_id,
        //             mi_pwd: mi_pwd,
        //             mi_name: mi_name,
        //             mi_email: mi_email,
        //             mi_address: mi_addr,
        //             mi_birth: mi_birth,
        //             mi_gen: mi_gen,
        //             mi_phone: mi_phone,
        //             mi_pay_card: mi_pay_card,
        //             mi_pay_account: mi_pay_acc,
        //             // mi_status: mi_status
        //         }
        //         $.ajax({
        //             type: "post",
        //             url: "/member/api/add",
        //             data: JSON.stringify(data),
        //             contentType: "application/json",
        //             success: function (r) {
        //                 console.log(r.message);
        //                 alert(r.message);
        //             },
        //             error: function (e) {

        //             }
        //         })
        //     });
        //     document.getElementById("doub_ck").addEventListener("click", function () {

        //         let mi_id = document.getElementById("mi_id").value;
        //         if (mi_id == '' || mi_id == null || mi_id == undefined) {
        //             alert("아이디를 입력하세요.");
        //             return;
        //         }
        //         $.ajax({
        //             type: "get",
        //             url: "/member/checkId?id=" + mi_id,
        //             success: function (data) {
        //                 console.log(data);
        //                 alert(data.message);
        //                 isDupId = data.status;
        //             }
        //         })

        //     });
        //     document.getElementById("doub_ck2").addEventListener("click", function () {
        //         let mi_email = document.getElementById("mi_email").value;
        //         if (mi_email == '' || mi_email == null || mi_email == undefined) {
        //             alert("이메일을 입력하세요.");
        //             return;
        //         }
        //         $.ajax({
        //             type: "get",
        //             url: "/member/checkEmail?email=" + mi_email,
        //             success: function (data) {
        //                 alert(data.message);
        //                 isDupEmail = data.status;
        //             }
        //         })
        //     })
        // });
    </script>
</head>

<body>
    <%@include file="/WEB-INF/views/includes/header.jsp" %>
    <h1 class="title">회원가입</h1>
    <div class="member_form">
        <table class="add_table">
            <tr>
                <td>아이디</td>
                <td colspan="3"><input type="text" id="mi_id"></td>
                <td><button id="doub_ck">중복확인</button></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td colspan="3"><input type="password" id="mi_pwd"></td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td colspan="3"><input type="password" id="mi_pwd_con"></td>
            </tr>
            <tr>
                <td>성명</td>
                <td colspan="3"><input type="text" id="mi_name"></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td colspan="3"><input type="text" id="mi_email"></td>
                <td><button id="doub_ck2">중복확인</button></td>
            </tr>
            <tr>
                <td>주소</td>
                <td colspan="3"><input type="text" id="mi_addr"></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td>
                    <input type="text" id="mi_birth_year">
                    <span>년</span>
                </td>
                <td>
                    <input type="text" id="mi_birth_month">
                    <span>월</span>
                </td>
                <td>
                    <input type="text" id="mi_birth_date">
                    <span>일</span>
                </td>
            </tr>
            <tr>
                <td>성별</td>
                <td colspan="3">
                    <select id="mi_gen">
                        <option value="0">male</option>
                        <option value="1">female</option>
                        <option value="2">none</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td colspan="3"><input type="text" id="mi_phone"></td>
            </tr>
            <tr>
                <td>결제 카드정보</td>
                <td colspan="3"><input type="text" id="mi_pay_card"></td>
            </tr>
            <tr>
                <td>결제 계좌정보</td>
                <td colspan="3"><input type="text" id="mi_pay_acc"></td>
            </tr>
            <!-- <tr>
                <td>회원상태</td>
                <td>
                    <select name="mi_status">
                        <option value="0">관리자</option>
                        <option value="1">일반가입자</option>
                    </select>
                </td>
            </tr> -->
            <tr>
                <td colspan="4">
                    <button id="add">회원가입</button>
                </td>
            </tr>
        </table>

    </div>
</body>

</html>