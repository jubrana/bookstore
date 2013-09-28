package bookstore

import org.springframework.dao.DataIntegrityViolationException

class BasketController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [basketInstanceList: Basket.list(params), basketInstanceTotal: Basket.count()]
    }

    def create() {
        [basketInstance: new Basket(params)]
    }

    def save() {
        def basketInstance = new Basket(params)
        if (!basketInstance.save(flush: true)) {
            render(view: "create", model: [basketInstance: basketInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'basket.label', default: 'Basket'), basketInstance.id])
        redirect(action: "show", id: basketInstance.id)
    }

    def show(Long id) {
        def basketInstance = Basket.get(id)
        if (!basketInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'basket.label', default: 'Basket'), id])
            redirect(action: "list")
            return
        }

        [basketInstance: basketInstance]
    }

    def edit(Long id) {
        def basketInstance = Basket.get(id)
        if (!basketInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'basket.label', default: 'Basket'), id])
            redirect(action: "list")
            return
        }

        [basketInstance: basketInstance]
    }

    def update(Long id, Long version) {
        def basketInstance = Basket.get(id)
        if (!basketInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'basket.label', default: 'Basket'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (basketInstance.version > version) {
                basketInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'basket.label', default: 'Basket')] as Object[],
                          "Another user has updated this Basket while you were editing")
                render(view: "edit", model: [basketInstance: basketInstance])
                return
            }
        }

        basketInstance.properties = params

        if (!basketInstance.save(flush: true)) {
            render(view: "edit", model: [basketInstance: basketInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'basket.label', default: 'Basket'), basketInstance.id])
        redirect(action: "show", id: basketInstance.id)
    }

    def delete(Long id) {
        def basketInstance = Basket.get(id)
        if (!basketInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'basket.label', default: 'Basket'), id])
            redirect(action: "list")
            return
        }

        try {
            basketInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'basket.label', default: 'Basket'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'basket.label', default: 'Basket'), id])
            redirect(action: "show", id: id)
        }
    }
}
