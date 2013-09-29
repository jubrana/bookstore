<%@ page import="bookstore.Basket" %>



<div class="fieldcontain ${hasErrors(bean: basketInstance, field: 'selectedItems', 'error')} required">
	<label for="selectedItems">
		<g:message code="basket.selectedItems.label" default="Selected Items" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="selectedItems" type="number" value="${basketInstance.selectedItems}" required=""/>
</div>



<div class="fieldcontain ${hasErrors(bean: basketInstance, field: 'totalPrice', 'error')} required">
	<label for="totalPrice">
		<g:message code="basket.totalPrice.label" default="Total Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="totalPrice" value="${fieldValue(bean: basketInstance, field: 'totalPrice')}" required=""/>
</div>



<div class="fieldcontain ${hasErrors(bean: basketInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="basket.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${bookstore.User.list()}" optionKey="id" required="" value="${basketInstance?.user?.id}" class="many-to-one"/>
</div>

