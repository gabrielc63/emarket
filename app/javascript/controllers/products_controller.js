import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal"];

  openModal() {
    document.getElementById("product-modal").classList.remove("hidden");
  }

  closeModal() {
    document.getElementById("product-modal").classList.add("hidden");
  }

  connect() {
    this.element.focus();
  }

  hideOnSubmit(event) {
    if (event.detail.success) {
      this.resetForm();
      this.closeModal();
    }
  }

  resetForm() {
    document.forms[0].reset();
  }

  disconnect() {
    this.#modalTurboFrame.src = null;
  }

  clickOutside(event) {
    let my_modal = document.getElementById("product-modal");
    if (event.target === my_modal) {
      my_modal.classList.add("hidden");
    }
  }

  // private

  get #modalTurboFrame() {
    return document.querySelector("turbo-frame[id='product-modal']");
  }
}
