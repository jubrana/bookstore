package bookstore

import org.springframework.dao.DataIntegrityViolationException

class SelectedProductsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [selectedProductsInstanceList: SelectedProducts.list(params), selectedProductsInstanceTotal: SelectedProducts.count()]
    }

    def create() {
        [selectedProductsInstance: new SelectedProducts(params)]
    }

    def save() {
        def selectedProductsInstance = new SelectedProducts(params)
        if (!selectedProductsInstance.save(flush: true)) {
            render(view: "create", model: [selectedProductsInstance: selectedProductsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'selectedProducts.label', default: 'SelectedProducts'), selectedProductsInstance.id])
        redirect(action: "show", id: selectedProductsInstance.id)
    }

    def show(Long id) {
        def selectedProductsInstance = SelectedProducts.get(id)
        if (!selectedProductsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'selectedProducts.label', default: 'SelectedProducts'), id])
            redirect(action: "list")
            return
        }

        [selectedProductsInstance: selectedProductsInstance]
    }

    def edit(Long id) {
        def selectedProductsInstance = SelectedProducts.get(id)
        if (!selectedProductsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'selectedProducts.label', default: 'SelectedProducts'), id])
            redirect(action: "list")
            return
        }

        [selectedProductsInstance: selectedProductsInstance]
    }

    def update(Long id, Long version) {
        def selectedProductsInstance = SelectedProducts.get(id)
        if (!selectedProductsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'selectedProducts.label', default: 'SelectedProducts'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (selectedProductsInstance.version > version) {
                selectedProductsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'selectedProducts.label', default: 'SelectedProducts')] as Object[],
                          "Another user has updated this SelectedProducts while you were editing")
                render(view: "edit", model: [selectedProductsInstance: selectedProductsInstance])
                return
            }
        }

        selectedProductsInstance.properties = params

        if (!selectedProductsInstance.save(flush: true)) {
            render(view: "edit", model: [selectedProductsInstance: selectedProductsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'selectedProducts.label', default: 'SelectedProducts'), selectedProductsInstance.id])
        redirect(action: "show", id: selectedProductsInstance.id)
    }

    def delete(Long id) {
        def selectedProductsInstance = SelectedProducts.get(id)
        if (!selectedProductsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'selectedProducts.label', default: 'SelectedProducts'), id])
            redirect(action: "list")
            return
        }

        try {
            selectedProductsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'selectedProducts.label', default: 'SelectedProducts'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'selectedProducts.label', default: 'SelectedProducts'), id])
            redirect(action: "show", id: id)
        }
    }
}
