import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["items", "form","link"]

  connect() {
    // console.log(this.element)
    // console.log(this.itemsTarget)
    // const formData = new FormData(this.formTarget)
    // console.log(formData)
  }

  send(event) {
    event.preventDefault();

    if (this.itemsTarget !== null) {
      this.linkTarget.classList.add("d-none");
    }

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          // beforeend could also be dynamic with Stimulus values
          this.itemsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
        }
        this.formTarget.outerHTML = data.form
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  }

}
