package bookstore

class Category {

	String name
	String description
	
	static hasMany = [book: Book]
	
    static constraints = {
    }
}
