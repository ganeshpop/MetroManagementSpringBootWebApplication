<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: venom
  Date: 8/15/2021
  Time: 3:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en" class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Metro Management System</title>
    <link rel="stylesheet" href='<c:url value="/dist/css/style.css"/>'>
    <link href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans:400,600" rel="stylesheet">
    <script src="https://unpkg.com/animejs@3.0.1/lib/anime.min.js"></script>
    <script src="https://unpkg.com/scrollreveal@4.0.0/dist/scrollreveal.min.js"></script>
</head>
<body class="is-boxed has-animations">
<div class="body-wrap">
    <header class="site-header">
        <div class="container">
            <div class="site-header-inner">
                <div class="brand header-brand">
                    <h1 class="m-0">
                        <a href="#">
                            <img class="header-logo-image" src="dist/images/logo.svg" alt="Logo">
                        </a>
                    </h1>
                </div>
            </div>
        </div>
    </header>

    <main>
        <section class="hero">
            <div class="container">
                <div class="hero-inner">
                    <div class="hero-copy">
                        <h1 class="hero-title mt-0">Welcome To City Metro</h1>
                        <p class="hero-paragraph">We provide the best metro services. </p>
                        <div class="pricing-tables-wrap">
                            <div class="pricing-table">
                                <div class="pricing-table-inner is-revealing">
                                    <div class="pricing-table-main">
                                        <div class="pricing-table-header pb-24">
                                            <div class="pricing-table-price"><span
                                                    class="pricing-table-price-currency h2">₹</span><span
                                                    class="pricing-table-price-amount h1">5</span><span
                                                    class="text-xs">/station</span></div>
                                        </div>
                                        <div class="pricing-table-features-title text-xs pt-24 pb-24"> You can
                                        </div>
                                        <spring:form action="./verifyCard" method="post" modelAttribute="login" cssClass="pricing-table-features">
                                        <ul class="pricing-table-features list-reset text-xs">
                                            <li>
                                                <span> Card ID : <spring:input path="cardId"/><br><br></span>
                                            </li>
                                            <li>
                                                <span>Password : <spring:input type="password" path="password"/> </span>
                                            </li>
                                        </ul>
                                    </div><spring:errors path="password" cssClass="error"/><br><br>
                                    </spring:form><br><br>
                                    <div class="pricing-table-cta mb-8">
                                        <a class="button button-primary button-shadow button-block" href="signup">Sign Up
                                            now</a>
                                    </div>
                                </div>
                            </div>
                        </div>




                            <input type="submit" value="Login">

                        <a href="./">Go Back to Home</a><br><br>
                    </div>
                    <div class="hero-figure anime-element">
                        <svg class="placeholder" width="528" height="396" viewBox="0 0 528 396">
                            <rect width="528" height="396" style="fill:transparent;"/>
                        </svg>
                        <div class="hero-figure-box hero-figure-box-01" data-rotation="45deg"></div>
                        <div class="hero-figure-box hero-figure-box-02" data-rotation="-45deg"></div>
                        <div class="hero-figure-box hero-figure-box-03" data-rotation="0deg"></div>
                        <div class="hero-figure-box hero-figure-box-04" data-rotation="-135deg"></div>
                        <div class="hero-figure-box hero-figure-box-05"></div>
                        <div class="hero-figure-box hero-figure-box-06"></div>
                        <div class="hero-figure-box hero-figure-box-07"></div>
                        <div class="hero-figure-box hero-figure-box-08" data-rotation="-22deg"></div>
                        <div class="hero-figure-box hero-figure-box-09" data-rotation="-52deg"></div>
                        <div class="hero-figure-box hero-figure-box-10" data-rotation="-50deg"></div>
                    </div>
                </div>
            </div>
        </section>

        <section class="features section">
            <div class="container">
                <div class="features-inner section-inner has-bottom-divider">
                    <div class="features-wrap">
                        <div class="feature text-center is-revealing">
                            <div class="feature-inner">
                                <div class="feature-icon">
                                    <img src="dist/images/feature-icon-01.svg" alt="Feature 01">
                                </div>
                                <h4 class="feature-title mt-24">Lowest Prices</h4>
                                <p class="text-sm mb-0"> We provide the smartest way to get around and you can save
                                    money without thinking about it.</p>
                            </div>
                        </div>
                        <div class="feature text-center is-revealing">
                            <div class="feature-inner">
                                <div class="feature-icon">
                                    <img src="dist/images/feature-icon-02.svg" alt="Feature 02">
                                </div>
                                <h4 class="feature-title mt-24">Smart Metro Cards</h4>
                                <p class="text-sm mb-0">No more waiting in queues, by using our smart card you can
                                    travel without hassle. Just Swipe-In and Swipe-Out its just that simple. </p>
                            </div>
                        </div>
                        <div class="feature text-center is-revealing">
                            <div class="feature-inner">
                                <div class="feature-icon">
                                    <img src="dist/images/feature-icon-03.svg" alt="Feature 03">
                                </div>
                                <h4 class="feature-title mt-24">Cyber Stations</h4>
                                <p class="text-sm mb-0">Our stations are equipped with cutting edge technology that
                                    monitors our customer's safety at all times.</p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <section class="pricing section">
            <div class="container-sm">
                <div class="pricing-inner section-inner">
                    <div class="pricing-header text-center">
                        <h2 class="section-title mt-0">Metro Card</h2>
                        <p class="section-paragraph mb-0">Get your free metro card and start using our services.</p>
                    </div>
                    <div class="pricing-tables-wrap">
                        <div class="pricing-table">
                            <div class="pricing-table-inner is-revealing">
                                <div class="pricing-table-main">
                                    <div class="pricing-table-header pb-24">
                                        <div class="pricing-table-price"><span
                                                class="pricing-table-price-currency h2">₹</span><span
                                                class="pricing-table-price-amount h1">5</span><span
                                                class="text-xs">/station</span></div>
                                    </div>
                                    <div class="pricing-table-features-title text-xs pt-24 pb-24"> You can
                                    </div>
                                    <ul class="pricing-table-features list-reset text-xs">
                                        <li>
                                            <span>Recharge Anytime</span>
                                        </li>
                                        <li>
                                            <span>View Travel History </span>
                                        </li>
                                        <li>
                                            <span>Manage Your Expenses</span>
                                        </li>
                                        <li>
                                            <span>Get Real-Time Analytics</span>
                                        </li>
                                    </ul>
                                </div>
                                <div class="pricing-table-cta mb-8">
                                    <a class="button button-primary button-shadow button-block" href="signup">Sign Up
                                        now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="cta section">
            <div class="container">
                <div class="cta-inner section-inner">
                    <h3 class="section-title mt-0">Still not convinced on buying?</h3>
                    <div class="cta-cta">
                        <a class="button button-primary button-wide-mobile" href="https://github.com/ganeshpop">Get in
                            touch</a>
                    </div>
                </div>
            </div>
        </section>
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
                                        fill="#0270D7"/>
                            </svg>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="screen-reader-text">Twitter</span>
                            <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg">
                                <path
                                        d="M16 3c-.6.3-1.2.4-1.9.5.7-.4 1.2-1 1.4-1.8-.6.4-1.3.6-2.1.8-.6-.6-1.5-1-2.4-1-1.7 0-3.2 1.5-3.2 3.3 0 .3 0 .5.1.7-2.7-.1-5.2-1.4-6.8-3.4-.3.5-.4 1-.4 1.7 0 1.1.6 2.1 1.5 2.7-.5 0-1-.2-1.5-.4C.7 7.7 1.8 9 3.3 9.3c-.3.1-.6.1-.9.1-.2 0-.4 0-.6-.1.4 1.3 1.6 2.3 3.1 2.3-1.1.9-2.5 1.4-4.1 1.4H0c1.5.9 3.2 1.5 5 1.5 6 0 9.3-5 9.3-9.3v-.4C15 4.3 15.6 3.7 16 3z"
                                        fill="#0270D7"/>
                            </svg>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="screen-reader-text">Google</span>
                            <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg">
                                <path
                                        d="M7.9 7v2.4H12c-.2 1-1.2 3-4 3-2.4 0-4.3-2-4.3-4.4 0-2.4 2-4.4 4.3-4.4 1.4 0 2.3.6 2.8 1.1l1.9-1.8C11.5 1.7 9.9 1 8 1 4.1 1 1 4.1 1 8s3.1 7 7 7c4 0 6.7-2.8 6.7-6.8 0-.5 0-.8-.1-1.2H7.9z"
                                        fill="#0270D7"/>
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
</body>
</html>
