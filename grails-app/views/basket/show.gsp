
<%@ page import="bookstore.Basket" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'basket.label', default: 'Basket')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-basket" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-basket" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list basket">
			
				<g:if test="${basketInstance?.selectedItems}">
				<li class="fieldcontain">
					<span id="selectedItems-label" class="property-label"><g:message code="basket.selectedItems.label" default="Selected Items" /></span>
					
						<span class="property-value" aria-labelledby="selectedItems-label"><g:fieldValue bean="${basketInstance}" field="selectedItems"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basketInstance?.selectedProducts}">
				<li class="fieldcontain">
					<span id="selectedProducts-label" class="property-label"><g:message code="basket.selectedProducts.label" default="Selected Products" /></span>
					
						<g:each in="${basketInstance.selectedProducts}" var="s">
						<span class="property-value" aria-labelledby="selectedProducts-label"><g:link controller="selectedProducts" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${basketInstance?.totalPrice}">
				<li class="fieldcontain">
					<span id="totalPrice-label" class="property-label"><g:message code="basket.totalPrice.label" default="Total Price" /></span>
					
						<span class="property-value" aria-labelledby="totalPrice-label"><g:fieldValue bean="${basketInstance}" field="totalPrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basketInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="basket.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${basketInstance?.user?.id}">${basketInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${basketInstance?.id}" />
					<g:link class="edit" action="edit" id="${basketInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
