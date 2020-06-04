import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "quantity" ]

  connect() {
  }

  quantity_minus(evt){
    evt.preventDefault();
    let q = Number(this.quantityTarget.value);
    console.log('-');
    if(q>1){
        this.quantityTarget.value = q -1;
    }
  }
  quantity_plus(evt){
    evt.preventDefault();
    let q = Number(this.quantityTarget.value);
    console.log('+');
    this.quantityTarget.value = q + 1;
  }
}