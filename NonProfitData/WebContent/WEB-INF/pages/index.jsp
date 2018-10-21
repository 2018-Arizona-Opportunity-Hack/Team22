<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<spring:url value="/resources/css/main.css" var="mainCss" />
<link href="${mainCss}" rel="stylesheet" />
<body>
<ul>
  <li><a href="index">Home</a></li>
  <li><a class="active" href="login">Login</a></li>
  <li><a href="register">Register</a></li>
</ul>
	<h2>Login</h2>
	<form:form method="POST" modelAttribute="user" action="login">
	<table>
    <tr>
	<td><form:label path="email">Email</form:label></td>
    <td><form:input path="email"/></td>
    </tr>
    	<tr>
	<td><form:label path="password">Password</form:label></td>
    <td><form:input path="password"/></td>
    </tr>
    <tr>
    <td colspan="2"><input type="submit" value="Submit"/></td>
    </tr>
	</table>
	<br/>
	<form:errors path="email"/><br/>
	<form:errors path="password"/><br/>
	</form:form>	
</body>