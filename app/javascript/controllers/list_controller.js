import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button", "form", "passenger", "numTicketsDisplay"];
  static values = {nextPassenger: Number, numTickets: Number};

  add() {
    const template = this.element.querySelector("template.passenger-template");
    const newFields = template.content.cloneNode(true);
    this.replaceNumber(newFields, this.nextPassengerValue);
    this.element.insertBefore(newFields, template);
    this.nextPassengerValue++;
    this.numTicketsValue++;
  };

  remove({detail}) {
    if (this.element.childNodes.length > 1) {
      this.element.removeChild(this.element.querySelector(".passenger-" + detail.number.toString()));
    };
    this.numTicketsValue--;
  };

  numTicketsValueChanged() {
    console.log("C");
    if (this.numTicketsValue <= 1) {
      this.dispatch("buttonStates", {detail: {remove: false, add: true}});
    } else if (this.numTicketsValue < 4) {
      this.dispatch("buttonStates", {detail: {remove: true, add: true}});
    } else {
      this.dispatch("buttonStates", {detail: {remove: true, add: false}});
    };
    console.log(this.numTicketsDisplayTarget);
    this.numTicketsDisplayTarget.innerHTML = this.numTicketsValue;
  }

  replaceNumber(node, n) {
    if (node.hasAttributes) {
      Array.from(node.attributes).forEach(attrib => {
        if (attrib.value.match("§")) {
          node.setAttribute(attrib.name, attrib.value.replace(/§§/g, (n + 1).toString()));
          node.setAttribute(attrib.name, attrib.value.replace(/§/g, n.toString()));
        };
      });
    };

    if (node.nodeType == Node.TEXT_NODE) {
      node.nodeValue = node.nodeValue.replace(/§§/g, (n + 1).toString());
      node.nodeValue = node.nodeValue.replace(/§/g, n.toString());
    };

    if (node.hasChildNodes()) {
      node.childNodes.forEach(cnode => {
        this.replaceNumber(cnode, n);
      });
    }
  };
};
