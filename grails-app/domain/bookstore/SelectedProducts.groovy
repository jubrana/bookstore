package bookstore

class SelectedProducts {

	
	static belongsTo = [book: Book, basket: Basket]
	
	
    static constraints = {
    }
}
