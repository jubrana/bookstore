package bookstore

class Basket {

	int selectedItems
	Float totalPrice
	Book book
	
	static hasMany = [book: Book]
	static belongsTo = [user: User]
	
	
    static constraints = {
    }
}
