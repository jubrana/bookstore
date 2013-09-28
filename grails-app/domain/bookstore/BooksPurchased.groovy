package bookstore

class BooksPurchased {

	int purchasedItems
	
	static belongsTo = [user: User]
	static hasMany = [books: Book]
	
    static constraints = {
    }
}
