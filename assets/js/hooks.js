import HelloSvelte from "./components/simple-svelte-components/HelloSvelte.svelte"
import ContactForm from "./components/push-event/ContactForm.svelte"
import ContactList from "./components/patch-event/ContactList.svelte"
import NoEvent from "./components/no-event/ClientSide.svelte"
import E2E from "./components/e-2-e/ChatWindow.svelte"
import AgisSvelte from "./components/esri/AgisSvelte.svelte"

const components = {
    HelloSvelte,
    ContactForm,
    ContactList,
    NoEvent,
    E2E,
    AgisSvelte
}

function parsedProps(el) {
    const props = el.getAttribute('data-props')
    return props ? JSON.parse(props) : {}
}

const SvelteComponent = {
    mounted() {
        const componentName = this.el.getAttribute('data-name')
        if (!componentName) {
            throw new Error('Component name must be provided')
        }

        const requiredApp = components[componentName]
        if (!requiredApp) {
            throw new Error(`Unable to find ${componentName} component. Did you forget to import it into hooks.js?`)
        }

        const request = (event, data, callback) => {
            this.pushEvent(event, data, callback)
        }

        const goto = (href) => {
            liveSocket.pushHistoryPatch(href, "push", this.el)
        }

        this._instance = new requiredApp({
            target: this.el,
            props: { ...parsedProps(this.el), request, goto },
        })
    },

    updated() {
        const request = (event, data, callback) => {
            this.pushEvent(event, data, callback)
        }

        const goto = (href) => {
            liveSocket.pushHistoryPatch(href, "push", this.el)
        }

        this._instance.$$set({ ...parsedProps(this.el), request, goto })
    },

    destroyed() {
        this._instance?.$destroy()
    }
}

export default {
    SvelteComponent,
}