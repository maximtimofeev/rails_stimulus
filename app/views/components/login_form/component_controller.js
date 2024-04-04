import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log('login form element: ', this.element)
  }
}
