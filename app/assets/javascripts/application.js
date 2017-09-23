// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery.ui.all
//= require turbolinks
//= require bootstrap.min
//= require select2-full
//= require underscore
//= require bootbox
//= require bootstrap-slider
//= require switchery
//= require jquery-fileupload/basic
//= require bootstrap-datepicker
//= require jquery.datetimepicker
//= require bootstrap-multiselect
//= require app
//= require_tree .


$(document).on('turbolinks:load', function() {
  $(".select2").select2();
  $(".datetime").datetimepicker();
});
