<%@ page import="bookstore.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:form action="save">
			<fieldset>
				<legend>Enter new Book</legend>
				<p class="info">Complete the form below to enter new Book!</p>
				
				<label for="title">Title</label>
				<div class="rightcol">
					<g:textField name="title" value="${bookInstance?.title}" />
				</div>

				<label for="author">Author</label>
				<div class="rightcol">
					<g:textField name="author" value="${bookInstance?.author}" />
				</div>

				<label for="price">Price</label>
				<div class="rightcol">
					<g:textField name="price" value="${bookInstance?.price}" />
				</div>
				
				<label for="ISBN">ISBN</label>
				<div class="rightcol">
					<g:textField name="ISBN" value="${bookInstance?.ISBN}" />
				</div>

				<label for="category">Category</label>
				<div class="rightcol">
					<g:select name="category.id" from="${bookstore.Category.list()}"
						optionKey="id" value="${bookInstance?.category?.id}" />
				</div>

				<label>&nbsp;</label>
				<div class="rightcol">
					<g:submitButton class="button" name="save"
						value="Enter Book" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</div>
			</fieldset>
		</g:form>
	</body>
</html>
