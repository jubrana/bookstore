
<%@ page import="bookstore.Basket" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'basket.label', default: 'Basket')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-basket" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-basket" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="selectedItems" title="${message(code: 'basket.selectedItems.label', default: 'Selected Items')}" />
					
						<g:sortableColumn property="totalPrice" title="${message(code: 'basket.totalPrice.label', default: 'Total Price')}" />
					
						<th><g:message code="basket.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${basketInstanceList}" status="i" var="basketInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${basketInstance.id}">${fieldValue(bean: basketInstance, field: "selectedItems")}</g:link></td>
					
						<td>${fieldValue(bean: basketInstance, field: "totalPrice")}</td>
					
						<td>${fieldValue(bean: basketInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${basketInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
