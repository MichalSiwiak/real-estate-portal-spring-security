<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>
	<title>luv2code Company Home Page</title>
</head>

<body>
<table class="table table-striped">
	<tbody>
	<tr>
		<th>Flat</th>
		<th>Data</th>
		<th>User</th>
		<th>Price</th>
		<th>City</th>
	</tr>
	<c:forEach var="flat" items="${flats}">

		<tr>
			<td>
				<c:url var="url" scope="page" value="/temat">
					<c:param name="id" value="${flat.id}">
					</c:param>
				</c:url> <a href="${url}">${flat.title}</a>
			</td>
			<td>
				<fmt:formatDate value="${flat.date}" dateStyle="short" timeStyle="short" type="both"/>
			</td>
			<td>${flat.users.username}</td>
			<td>${flat.price}</td>
			<td>${flat.city}</td>
			<td><img src="${pageContext.request.contextPath}/image-manual-response/${flat.id}"></td>
		</tr>
	</c:forEach>
	</tbody>
</table>

</body>

</html>