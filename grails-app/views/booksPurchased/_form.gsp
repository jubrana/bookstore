<%@ page import="bookstore.BooksPurchased" %>



<div class="fieldcontain ${hasErrors(bean: booksPurchasedInstance, field: 'books', 'error')} ">
	<label for="books">
		<g:message code="booksPurchased.books.label" default="Books" />
		
	</label>
	<g:select name="books" from="${bookstore.Book.list()}" multiple="multiple" optionKey="id" size="5" value="${booksPurchasedInstance?.books*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksPurchasedInstance, field: 'purchasedItems', 'error')} required">
	<label for="purchasedItems">
		<g:message code="booksPurchased.purchasedItems.label" default="Purchased Items" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="purchasedItems" type="number" value="${booksPurchasedInstance.purchasedItems}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksPurchasedInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="booksPurchased.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${bookstore.User.list()}" optionKey="id" required="" value="${booksPurchasedInstance?.user?.id}" class="many-to-one"/>
</div>

