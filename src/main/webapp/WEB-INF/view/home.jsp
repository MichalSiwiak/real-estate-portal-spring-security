<html>

<head>
	<title>luv2code Company Home Page</title>
</head>

<body>
	<h2>luv2code Company Home Page</h2>
	<hr>
	
	Welcome to the luv2code company home page!

	<h1>Spring MVC - File Upload Example</h1>
	<hr />

	<h3>Single file Upload</h3>
	<form action="singleFileUpload?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>title</td>
				<td><input type="text" name="title" required="true"/></td>
			</tr>
			<tr>
				<td>content</td>
				<td><input type="text" name="content"  required="true"/></td>
			</tr>
			<tr>
				<td>price</td>
				<td><input type="number" name="price"  required="true"/></td>
			</tr>
			<tr>
				<td>surface</td>
				<td><input type="number" name="surface"  required="true"/></td>
			</tr>
			<tr>
				<td>rooms</td>
				<td><input type="number" name="rooms"  required="true"/></td>
			</tr>
			<tr>
				<td>city</td>
				<td><input type="text" name="city"  required="true"/></td>
			</tr>
			<tr>
				<td>Select File</td>
				<td><input type="file" name="file"></td>
			</tr>
			<tr>
				<td><button type="submit">Upload</button></td>
			</tr>
		</table>
	</form>
	<br />
	<hr />
	<span style="color: red; font-size: 14px;">${msg}</span>

</body>

</html>