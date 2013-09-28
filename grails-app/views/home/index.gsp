<html>
<head>
<title>Web Store - Homepage</title>
<meta name="layout" content="main" />
</head>
<body>
	<div>
		<h2>Category List</h2>
		<table>
			<thead>
				<tr>
					<g:sortableColumn property="name" title="Name" />
					<g:sortableColumn property="description" title="Description" />
				</tr>
			</thead>
			<tbody>
				<g:each in="${categories}" var="category">
					<tr>
						<td><g:link controller="category" action="show"
								id="${category.id}">
								${category.name}
							</g:link>
						</td>
						<td>
							${category.description}
						</td>
					</tr>
				</g:each>
			</tbody>
		</table>
	</div>
	<br></br>
	<div>
		<h2>Product List</h2>
		<table>
			<thead>
				<tr>

					<g:sortableColumn property="title" title="Name" />
					<g:sortableColumn property="author" title="Description" />
					<g:sortableColumn property="category" title="Category" />
					<g:sortableColumn property="ISBN" title="ISBN" />
					<g:sortableColumn property="price" title="Price" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${books}" var="book">
					<tr>
						<td><g:link controller="product" action="show"
								id="${book.id}">
								${book.title}
							</g:link>
						</td>
						<td>
							${book.author}
						</td>
						<td>
							${book.category}
						</td>
						<td>
							${book.ISBN}
						</td>
						<td>
							${book.price}
						</td>

					</tr>
				</g:each>
			</tbody>
		</table>
	</div>
	<br></br>
</body>
</html>
