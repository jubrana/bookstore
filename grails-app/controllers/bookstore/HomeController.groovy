package bookstore

import java.util.List;

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class HomeController {

	List books
	List categories
	
    def index() { 
		
		books = Book.findAll(max:10, order: 'dateCreated')
		categories = Category.list()
	}
	
	@Secured(['ROLE_ADMIN'])
	def adminOnly() {
		
		//TODO Na category/create, user/create, category/create, book/create, bookspurchased/create
		//TODO Npr. Create, delete, i sl.
	}
}
