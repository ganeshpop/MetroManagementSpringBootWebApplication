<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Transactions</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href='<c:url value="vendor/bootstrap/css/bootstrap.min.css"/>'>
    <link rel="stylesheet" href='<c:url value="vendor/animate/animate.css"/>'>
    <link rel="stylesheet" href='<c:url value="vendor/select2/select2.min.css"/>'>
    <link rel="stylesheet" href='<c:url value="vendor/perfect-scrollbar/perfect-scrollbar.css"/>'>
    <link rel="stylesheet" href='<c:url value="dist/css/transactionsStyle.css"/>'>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans:400,600" rel="stylesheet">
    <script src="https://unpkg.com/animejs@3.0.1/lib/anime.min.js"></script>
    <script src="https://unpkg.com/scrollreveal@4.0.0/dist/scrollreveal.min.js"></script>
</head>
<body class="is-boxed has-animations">

<nav class="navMenu" style="padding-top: 20px">
    <ul class="menuItems">
        <li class="menuLi" style="padding-inline: 20px "><a class="menuA" href='menu'
                                                            data-item='Home'>Home</a></li>
        <li class="menuLi" style="padding-inline: 20px "><a class="menuA" href='getTransactions'
                                                            data-item='Travel History'>Travel History</a></li>
        <li class="menuLi" style="padding-inline: 20px"><a class="menuA" href='getCard' data-item='Card Details'>Card
            Details</a></li>
        <li class="menuLi" style="padding-inline: 20px"><a class="menuA" href='rechargeCard' data-item='Recharge Card'>Recharge
            Card</a></li>
        <li class="menuLi" style="padding-inline: 20px"><a class="menuA" href='swipeIn' data-item='Swipe In'>Swipe
            In</a></li>
        <li class="menuLi" style="padding-inline: 20px"><a class="menuA" href='swipeOut' data-item='Swipe Out'>Swipe
            Out</a></li>
        <li class="menuLi" style="padding-inline: 20px"><a class="menuA" href='passwordChange'
                                                           data-item='Change Password'>Change Password</a></li>
        <li class="menuLi" style="padding-inline: 20px"><a class="menuA" href='logout' data-item='Log Out'>Log Out</a></li>
    </ul>
</nav>

<div class="is-boxed has-animations">
    <div class="body-wrap,site-header">

        <main>
            <div class="transactions">
                <c:if test="${not empty transactions}">
                <h2 style="text-align: center">Your Transactions </h2>
                <div class="limiter">
                    <div class="container-table100">
                        <div class="wrap-table100">
                            <div class="table100 ver3 m-b-110">
                                <div class="table100-head">
                                    <table>
                                        <thead>
                                        <tr class="row100 head">
                                            <th class="cell100 column1">Card ID</th>
                                            <th class="cell100 column2">Swipe In Time</th>
                                            <th class="cell100 column3">Source Station</th>
                                            <th class="cell100 column4">Destination Station</th>
                                            <th class="cell100 column5">Swipe Out Time</th>
                                            <th class="cell100 column6">Travel Fare</th>
                                            <th class="cell100 column7">Fine</th>
                                            <th class="cell100 column8">Total Fare</th>
                                            <th class="cell100 column9">Travel Duration</th>
                                        </tr>
                                        </thead>
                                    </table>
                                </div>

                                <div class="table100-body js-pscroll">
                                    <table>
                                        <tbody>
                                        <c:forEach items="${transactions}" var="transaction">
                                            <tr class="row100 body">
                                                <td class="cell100 column1">${transaction.cardId }</td>
                                                <td class="cell100 column2">${transaction.swipeInTimeStamp.toGMTString()}</td>
                                                <td class="cell100 column3">
                                                    [${transaction.sourceStation.stationId}] ${transaction.sourceStation.stationName}</td>
                                                <td class="cell100 column4">
                                                    <c:if test="${not empty transaction.destinationStation}">
                                                    [${transaction.destinationStation.stationId}] ${transaction.destinationStation.stationName}</td>
                                                </c:if>
                                                <td class="cell100 column5">${transaction.swipeOutTimeStamp.toGMTString()}</td>
                                                <td class="cell100 column6">&#8377;${transaction.fare -transaction.fine}/-</td>
                                                <td class="cell100 column7">&#8377;${transaction.fine}/-</td>
                                                <td class="cell100 column8">&#8377;${transaction.fare}/-</td>
                                                <td class="cell100 column9">${transaction.duration} min</td>
                                            </tr>
                                        </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </div>


                        </div>
                        </c:if>
                        <c:if test="${empty transactions}">
                            <h2 style="text-align: center">No Transactions Found</h2>
                        </c:if>


                        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>


                        <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
                        <script>
                            $('.js-pscroll').each(function () {
                                var ps = new PerfectScrollbar(this);
                                $(window).on('resize', function () {
                                    ps.update();
                                })
                            });
                        </script>

                    </div>
                </div>
            </div>
        </main>

        <footer class="site-footer">
            <div class="container">
                <div class="site-footer-inner">
                    <div class="brand footer-brand">
                        <a href="#">
                            <img class="header-logo-image" src="dist/images/logo.svg" alt="Logo">
                        </a>
                    </div>
                    <ul class="footer-links list-reset">
                        <li>
                            <a href="#">Contact</a>
                        </li>
                        <li>
                            <a href="#">About us</a>
                        </li>
                        <li>
                            <a href="#">FAQ's</a>
                        </li>
                        <li>
                            <a href="#">Support</a>
                        </li>
                    </ul>
                    <ul class="footer-social-links list-reset">
                        <li>
                            <a href="#">
                                <span class="screen-reader-text">Facebook</span>
                                <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg">
                                    <path
                                            d="M6.023 16L6 9H3V6h3V4c0-2.7 1.672-4 4.08-4 1.153 0 2.144.086 2.433.124v2.821h-1.67c-1.31 0-1.563.623-1.563 1.536V6H13l-1 3H9.28v7H6.023z"
                                            fill="#0270D7"></path>
                                </svg>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="screen-reader-text">Twitter</span>
                                <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg">
                                    <path
                                            d="M16 3c-.6.3-1.2.4-1.9.5.7-.4 1.2-1 1.4-1.8-.6.4-1.3.6-2.1.8-.6-.6-1.5-1-2.4-1-1.7 0-3.2 1.5-3.2 3.3 0 .3 0 .5.1.7-2.7-.1-5.2-1.4-6.8-3.4-.3.5-.4 1-.4 1.7 0 1.1.6 2.1 1.5 2.7-.5 0-1-.2-1.5-.4C.7 7.7 1.8 9 3.3 9.3c-.3.1-.6.1-.9.1-.2 0-.4 0-.6-.1.4 1.3 1.6 2.3 3.1 2.3-1.1.9-2.5 1.4-4.1 1.4H0c1.5.9 3.2 1.5 5 1.5 6 0 9.3-5 9.3-9.3v-.4C15 4.3 15.6 3.7 16 3z"
                                            fill="#0270D7"></path>
                                </svg>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="screen-reader-text">Google</span>
                                <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg">
                                    <path
                                            d="M7.9 7v2.4H12c-.2 1-1.2 3-4 3-2.4 0-4.3-2-4.3-4.4 0-2.4 2-4.4 4.3-4.4 1.4 0 2.3.6 2.8 1.1l1.9-1.8C11.5 1.7 9.9 1 8 1 4.1 1 1 4.1 1 8s3.1 7 7 7c4 0 6.7-2.8 6.7-6.8 0-.5 0-.8-.1-1.2H7.9z"
                                            fill="#0270D7"></path>
                                </svg>
                            </a>
                        </li>
                    </ul>
                    <div class="footer-copyright"> @Spring Boot</div>
                </div>
            </div>
        </footer>
    </div>
    <script src="dist/js/main.min.js"></script>
</div>
</body>

