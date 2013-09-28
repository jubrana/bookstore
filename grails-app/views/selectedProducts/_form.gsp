<%@ page import="bookstore.SelectedProducts" %>



<div class="fieldcontain ${hasErrors(bean: selectedProductsInstance, field: 'basket', 'error')} required">
	<label for="basket">
		<g:message code="selectedProducts.basket.label" default="Basket" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="basket" name="basket.id" from="${bookstore.Basket.list()}" optionKey="id" required="" value="${selectedProductsInstance?.basket?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: selectedProductsInstance, field: 'book', 'error')} required">
	<label for="book">
		<g:message code="selectedProducts.book.label" default="Book" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="book" name="book.id" from="${bookstore.Book.list()}" optionKey="id" required="" value="${selectedProductsInstance?.book?.id}" class="many-to-one"/>
</div>

