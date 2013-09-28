<%@ page import="bookstore.Basket" %>



<div class="fieldcontain ${hasErrors(bean: basketInstance, field: 'selectedItems', 'error')} required">
	<label for="selectedItems">
		<g:message code="basket.selectedItems.label" default="Selected Items" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="selectedItems" type="number" value="${basketInstance.selectedItems}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: basketInstance, field: 'selectedProducts', 'error')} ">
	<label for="selectedProducts">
		<g:message code="basket.selectedProducts.label" default="Selected Products" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${basketInstance?.selectedProducts?}" var="s">
    <li><g:link controller="selectedProducts" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="selectedProducts" action="create" params="['basket.id': basketInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'selectedProducts.label', default: 'SelectedProducts')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: basketInstance, field: 'totalPrice', 'error')} required">
	<label for="totalPrice">
		<g:message code="basket.totalPrice.label" default="Total Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalPrice" value="${fieldValue(bean: basketInstance, field: 'totalPrice')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: basketInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="basket.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${bookstore.User.list()}" optionKey="id" required="" value="${basketInstance?.user?.id}" class="many-to-one"/>
</div>

