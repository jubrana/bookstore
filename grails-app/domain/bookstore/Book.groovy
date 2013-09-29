package bookstore

class Book {

	String title
	String ISBN
	String author
	Float price
	
	static belongsTo = [category: Category]

	static constraints = {
	}
}
