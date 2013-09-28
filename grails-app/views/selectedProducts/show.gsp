
<%@ page import="bookstore.SelectedProducts" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'selectedProducts.label', default: 'SelectedProducts')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-selectedProducts" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-selectedProducts" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list selectedProducts">
			
				<g:if test="${selectedProductsInstance?.basket}">
				<li class="fieldcontain">
					<span id="basket-label" class="property-label"><g:message code="selectedProducts.basket.label" default="Basket" /></span>
					
						<span class="property-value" aria-labelledby="basket-label"><g:link controller="basket" action="show" id="${selectedProductsInstance?.basket?.id}">${selectedProductsInstance?.basket?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${selectedProductsInstance?.book}">
				<li class="fieldcontain">
					<span id="book-label" class="property-label"><g:message code="selectedProducts.book.label" default="Book" /></span>
					
						<span class="property-value" aria-labelledby="book-label"><g:link controller="book" action="show" id="${selectedProductsInstance?.book?.id}">${selectedProductsInstance?.book?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${selectedProductsInstance?.id}" />
					<g:link class="edit" action="edit" id="${selectedProductsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
