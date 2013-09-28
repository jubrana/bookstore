package bookstore



import org.junit.*
import grails.test.mixin.*

@TestFor(SelectedProductsController)
@Mock(SelectedProducts)
class SelectedProductsControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/selectedProducts/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.selectedProductsInstanceList.size() == 0
        assert model.selectedProductsInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.selectedProductsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.selectedProductsInstance != null
        assert view == '/selectedProducts/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/selectedProducts/show/1'
        assert controller.flash.message != null
        assert SelectedProducts.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/selectedProducts/list'

        populateValidParams(params)
        def selectedProducts = new SelectedProducts(params)

        assert selectedProducts.save() != null

        params.id = selectedProducts.id

        def model = controller.show()

        assert model.selectedProductsInstance == selectedProducts
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/selectedProducts/list'

        populateValidParams(params)
        def selectedProducts = new SelectedProducts(params)

        assert selectedProducts.save() != null

        params.id = selectedProducts.id

        def model = controller.edit()

        assert model.selectedProductsInstance == selectedProducts
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/selectedProducts/list'

        response.reset()

        populateValidParams(params)
        def selectedProducts = new SelectedProducts(params)

        assert selectedProducts.save() != null

        // test invalid parameters in update
        params.id = selectedProducts.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/selectedProducts/edit"
        assert model.selectedProductsInstance != null

        selectedProducts.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/selectedProducts/show/$selectedProducts.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        selectedProducts.clearErrors()

        populateValidParams(params)
        params.id = selectedProducts.id
        params.version = -1
        controller.update()

        assert view == "/selectedProducts/edit"
        assert model.selectedProductsInstance != null
        assert model.selectedProductsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/selectedProducts/list'

        response.reset()

        populateValidParams(params)
        def selectedProducts = new SelectedProducts(params)

        assert selectedProducts.save() != null
        assert SelectedProducts.count() == 1

        params.id = selectedProducts.id

        controller.delete()

        assert SelectedProducts.count() == 0
        assert SelectedProducts.get(selectedProducts.id) == null
        assert response.redirectedUrl == '/selectedProducts/list'
    }
}
