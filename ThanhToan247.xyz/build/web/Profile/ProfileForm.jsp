<%@page import="java.text.DecimalFormat"%>
<%@page import="models.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang='en'>

    <head>
        <meta charset='UTF-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <meta name='viewport' content='width=device-width, initial-scale=1.0'>
        <title>Document</title>
        <style>
            .div-profile,
            .container-update-change {
                box-shadow: rgba(0, 0, 0, 0.3) 0px 19px 38px, rgba(0, 0, 0, 0.22) 0px 15px 12px;
                padding: 20px;
            }

            .div-profile {
                margin: 20px auto;
                width: 98%;
            }

            .imgclass {
                border-radius: 8px;
                width: 110px;
            }
            .div-2 span {
                font-weight: bold;
            }
            .div-1,
            .container-update-change {
                display: flex;
                align-items: center;
            }
            .div-1{
                justify-content: center;
            }
            .container-update-change {
                justify-content: space-between;
            }

            .div-2 {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .div-2 img {
                width: 50px;
            }

            .right-div {
                display: flex;
                align-items: center;
            }

            .right-div img {
                width: 25px;
                margin-left: 15px;
                margin-right: 5px;
            }

            .icon-div2 {
                display: flex;
                align-items: center;
            }

            .icon-div2 img {
                margin-right: 15px;
            }

            .change-ava {
                display: flex;
                align-items: center;
            }

            *,
            ::before,
            ::after {
                box-sizing: border-box;
            }

            body {
                margin: 0;
                padding: 0;
                font-family: 'Roboto', sans-serif;
                font-size: 1rem;
            }

            h1 {
                margin: 0;
            }
            /*===== FORM =====*/

            .l-form {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .form {
                margin: 5px;
                width: 48%;
                padding: 2rem 2rem;
                border-radius: 1rem;
                box-shadow: 0 10px 25px rgba(92, 99, 105, .2);
            }

            .form__title {
                font-weight: 400;
                margin-bottom: 3rem;
            }

            .form__div {
                position: relative;
                height: 48px;
                margin-bottom: 1.5rem;
            }

            .form__input {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                font-size: 1rem;
                border: 1px solid #DADCE0;
                border-radius: .5rem;
                outline: none;
                padding: 1rem;
                background: none;
                z-index: 1;
            }

            .form__label {
                position: absolute;
                left: 1rem;
                top: 1rem;
                padding: 0 .25rem;
                background-color: #fff;
                color: #80868B;
                font-size: 1rem;
                transition: .3s;
            }

            .form__button {
                display: block;
                margin-left: auto;
                padding: .75rem 2rem;
                outline: none;
                border: none;
                background-color: #1A73E8;
                color: #fff;
                font-size: 1rem;
                border-radius: .5rem;
                cursor: pointer;
                transition: .3s;
            }

            .form__button:hover {
                box-shadow: 0 10px 36px rgba(0, 0, 0, .15);
            }
            /*Input focus move up label*/

            .form__input:focus+.form__label {
                top: -.5rem;
                left: .8rem;
                color: #1A73E8;
                font-size: .75rem;
                font-weight: 500;
                z-index: 10;
            }
            /*Input focus sticky top label*/

            .form__input:not(:placeholder-shown).form__input:not(:focus)+.form__label {
                top: -.5rem;
                left: .8rem;
                font-size: .75rem;
                font-weight: 500;
                z-index: 10;
            }
            /*Input focus*/

            .form__input:focus {
                border: 1.5px solid #1A73E8;
            }

            /*aler*/
           

        </style>
    </head>

    <body>
        <div class='div-profile'>
            <div class='div-1'>
                <div class='left-div'>
                    <img class='imgclass' src="${user.avatar}" alt="image">
                </div>
                <div class='right-div'>
                    <img class='imgclass' src="../img/email.png" alt="image"> <span>${user.email}</span>
                    <img class='imgclass' src="../img/handshake.png" alt="image">
                    <c:if test="${user.role==1}">
                        <span>Quản trị viên</span>
                    </c:if>
                    <c:if test="${user.role==0}">
                        <span>Cộng tác viên</span>
                    </c:if>

                </div>
            </div>
            <hr>
            <div class='div-2'>
                <span class='icon-div2'><img src="../img/piggy-bank.png" alt=""><span>Số Dư: <%=new DecimalFormat("###,###,###").format(((User) session.getAttribute("user")).getRemainingMoney()) + " VNĐ"%></span></span>
                <span class='icon-div2'><img src="../img/diagram.png" alt=""><span>Đã Nạp: <%=new DecimalFormat("###,###,###").format(((User) session.getAttribute("user")).getTotalMoneyLoaded()) + " VNĐ"%></span></span>
                <span class='icon-div2'><img src="../img/giftbox.png" alt=""><span>Chiết khấu: ${user.discount}%</span></span>
            </div>
        </div>
        <br>

        <br>
        <div style="display: flex; justify-content: center;">
            <form action="profile" class="form" method="post">
                <h3 style="margin: 0;">Cập nhật thông tin</h3>
                <hr>
                <div style="display: flex; align-items: center;">
                    <img style=" border-radius: 8px;width: 180px;height: 180px; margin-right: 15px;" src="${user.avatar}" alt=""><br>
                    <button>ChangeImage</button>
                </div>
                <br>
                <div class="form__div">
                    <input style="background-color: rgb(0 0 0 / 6%);" value='${user.username}' class="form__input" placeholder=" " disabled>
                    <label for="" class="form__label">Tài khoản</label>
                </div>

                <div class="form__div">
                    <input name="email" value="${user.email}" type="text" class="form__input" placeholder=" ">
                    <label for="" class="form__label" >Email</label>
                </div>
                <div class="form__div">
                    <input name="cfPassword" type="password" class="form__input" placeholder=" ">
                    <label for="" class="form__label">Xác nhận mật khẩu</label>
                </div>
                <input type="submit" class="form__button" value="Cập nhật">
            </form>
            <form action="profile" class="form" method="post">
                <h3 style="margin: 0;">Thay đổi mật khẩu</h3>
                <hr>
                <img style="display: flex;margin: 0 auto;width: 180px;height: 180px;" src="../img/secure.png" alt=""><br>

                <div class="form__div">
                    <input name="oldpassword" type="password" class="form__input" placeholder=" ">
                    <label for="" class="form__label">Mật khẩu cũ</label>
                </div>

                <div class="form__div">
                    <input name="newpassword" type="password" class="form__input" placeholder=" ">
                    <label for="" class="form__label">Mật khẩu mới</label>
                </div>
                <div class="form__div">
                    <input name="re-newpassword" type="password" class="form__input" placeholder=" ">
                    <label for="" class="form__label">Xác nhận mật khẩu</label>
                </div>
                <input type="submit" class="form__button" value="Thay đổi">
            </form>
        </div>
        <!------>
        <!------>
        <script>
            <c:if test="${message!=null}">
            alert('${message}')
            </c:if>
        </script>
    </body>


</html>