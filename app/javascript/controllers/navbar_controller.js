import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    document.addEventListener('turbo:load', () => {
      const burger = document.querySelector('.navbar-burger');
      const menu = document.querySelector('#navbarMenu');
    
      if (burger && menu) {
        burger.addEventListener('click', () => {
          burger.classList.toggle('is-active');
          menu.classList.toggle('is-active');
        });
      }
    });
  }
}
