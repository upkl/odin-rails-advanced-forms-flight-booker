import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {number: Number};

  removeme() {
    this.element.textContent = "Hi there!";
    this.dispatch("remove", {detail: {button: this, number: this.numberValue}});
  };

  changeState({detail: {remove, add}}) {
    console.log("CC");
    let enabled;

    if (this.element.classList.contains("add")) {
      enabled = add;
    } else if (this.element.classList.contains("remove")) {
      enabled = remove;
    }
    
    if (enabled) {
      this.element.removeAttribute("disabled");
    } else {
      this.element.setAttribute("disabled", "disabled");
    };
  };
};
