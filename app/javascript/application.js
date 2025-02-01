// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//= require rails-ujs
//= require turbolinks
//= require_tree .
import { application } from "controllers/application"

import NavbarController from "controllers/navbar_controller"
application.register("navbar", NavbarController)