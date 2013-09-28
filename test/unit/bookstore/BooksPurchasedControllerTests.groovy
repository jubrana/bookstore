package bookstore



import org.junit.*
import grails.test.mixin.*

@TestFor(BooksPurchasedController)
@Mock(BooksPurchased)
class BooksPurchasedControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/booksPurchased/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.booksPurchasedInstanceList.size() == 0
        assert model.booksPurchasedInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.booksPurchasedInstance != null
    }

    void testSave() {
        controller.save()

        assert model.booksPurchasedInstance != null
        assert view == '/booksPurchased/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/booksPurchased/show/1'
        assert controller.flash.message != null
        assert BooksPurchased.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/booksPurchased/list'

        populateValidParams(params)
        def booksPurchased = new BooksPurchased(params)

        assert booksPurchased.save() != null

        params.id = booksPurchased.id

        def model = controller.show()

        assert model.booksPurchasedInstance == booksPurchased
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/booksPurchased/list'

        populateValidParams(params)
        def booksPurchased = new BooksPurchased(params)

        assert booksPurchased.save() != null

        params.id = booksPurchased.id

        def model = controller.edit()

        assert model.booksPurchasedInstance == booksPurchased
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/booksPurchased/list'

        response.reset()

        populateValidParams(params)
        def booksPurchased = new BooksPurchased(params)

        assert booksPurchased.save() != null

        // test invalid parameters in update
        params.id = booksPurchased.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/booksPurchased/edit"
        assert model.booksPurchasedInstance != null

        booksPurchased.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/booksPurchased/show/$booksPurchased.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        booksPurchased.clearErrors()

        populateValidParams(params)
        params.id = booksPurchased.id
        params.version = -1
        controller.update()

        assert view == "/booksPurchased/edit"
        assert model.booksPurchasedInstance != null
        assert model.booksPurchasedInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/booksPurchased/list'

        response.reset()

        populateValidParams(params)
        def booksPurchased = new BooksPurchased(params)

        assert booksPurchased.save() != null
        assert BooksPurchased.count() == 1

        params.id = booksPurchased.id

        controller.delete()

        assert BooksPurchased.count() == 0
        assert BooksPurchased.get(booksPurchased.id) == null
        assert response.redirectedUrl == '/booksPurchased/list'
    }
}
