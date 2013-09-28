
<%@ page import="bookstore.BooksPurchased" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'booksPurchased.label', default: 'BooksPurchased')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-booksPurchased" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-booksPurchased" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list booksPurchased">
			
				<g:if test="${booksPurchasedInstance?.books}">
				<li class="fieldcontain">
					<span id="books-label" class="property-label"><g:message code="booksPurchased.books.label" default="Books" /></span>
					
						<g:each in="${booksPurchasedInstance.books}" var="b">
						<span class="property-value" aria-labelledby="books-label"><g:link controller="book" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${booksPurchasedInstance?.purchasedItems}">
				<li class="fieldcontain">
					<span id="purchasedItems-label" class="property-label"><g:message code="booksPurchased.purchasedItems.label" default="Purchased Items" /></span>
					
						<span class="property-value" aria-labelledby="purchasedItems-label"><g:fieldValue bean="${booksPurchasedInstance}" field="purchasedItems"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksPurchasedInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="booksPurchased.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${booksPurchasedInstance?.user?.id}">${booksPurchasedInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${booksPurchasedInstance?.id}" />
					<g:link class="edit" action="edit" id="${booksPurchasedInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
