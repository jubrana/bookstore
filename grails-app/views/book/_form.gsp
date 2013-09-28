<%@ page import="bookstore.Book" %>



<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'ISBN', 'error')} ">
	<label for="ISBN">
		<g:message code="book.ISBN.label" default="ISBN" />
		
	</label>
	<g:textField name="ISBN" value="${bookInstance?.ISBN}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'author', 'error')} ">
	<label for="author">
		<g:message code="book.author.label" default="Author" />
		
	</label>
	<g:textField name="author" value="${bookInstance?.author}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="book.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${bookstore.Category.list()}" optionKey="id" required="" value="${bookInstance?.category?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="book.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${bookInstance?.title}"/>
</div>

