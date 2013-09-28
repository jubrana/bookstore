package bookstore

import org.springframework.dao.DataIntegrityViolationException

class BooksPurchasedController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [booksPurchasedInstanceList: BooksPurchased.list(params), booksPurchasedInstanceTotal: BooksPurchased.count()]
    }

    def create() {
        [booksPurchasedInstance: new BooksPurchased(params)]
    }

    def save() {
        def booksPurchasedInstance = new BooksPurchased(params)
        if (!booksPurchasedInstance.save(flush: true)) {
            render(view: "create", model: [booksPurchasedInstance: booksPurchasedInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'booksPurchased.label', default: 'BooksPurchased'), booksPurchasedInstance.id])
        redirect(action: "show", id: booksPurchasedInstance.id)
    }

    def show(Long id) {
        def booksPurchasedInstance = BooksPurchased.get(id)
        if (!booksPurchasedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'booksPurchased.label', default: 'BooksPurchased'), id])
            redirect(action: "list")
            return
        }

        [booksPurchasedInstance: booksPurchasedInstance]
    }

    def edit(Long id) {
        def booksPurchasedInstance = BooksPurchased.get(id)
        if (!booksPurchasedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'booksPurchased.label', default: 'BooksPurchased'), id])
            redirect(action: "list")
            return
        }

        [booksPurchasedInstance: booksPurchasedInstance]
    }

    def update(Long id, Long version) {
        def booksPurchasedInstance = BooksPurchased.get(id)
        if (!booksPurchasedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'booksPurchased.label', default: 'BooksPurchased'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (booksPurchasedInstance.version > version) {
                booksPurchasedInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'booksPurchased.label', default: 'BooksPurchased')] as Object[],
                          "Another user has updated this BooksPurchased while you were editing")
                render(view: "edit", model: [booksPurchasedInstance: booksPurchasedInstance])
                return
            }
        }

        booksPurchasedInstance.properties = params

        if (!booksPurchasedInstance.save(flush: true)) {
            render(view: "edit", model: [booksPurchasedInstance: booksPurchasedInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'booksPurchased.label', default: 'BooksPurchased'), booksPurchasedInstance.id])
        redirect(action: "show", id: booksPurchasedInstance.id)
    }

    def delete(Long id) {
        def booksPurchasedInstance = BooksPurchased.get(id)
        if (!booksPurchasedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'booksPurchased.label', default: 'BooksPurchased'), id])
            redirect(action: "list")
            return
        }

        try {
            booksPurchasedInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'booksPurchased.label', default: 'BooksPurchased'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'booksPurchased.label', default: 'BooksPurchased'), id])
            redirect(action: "show", id: id)
        }
    }
}
