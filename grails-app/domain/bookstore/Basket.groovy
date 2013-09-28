package bookstore

class Basket {

	int selectedItems
	Float totalPrice
	
	static hasMany = [selectedProducts: SelectedProducts]
	static belongsTo = [user: User]
	
    static constraints = {
    }
}
