# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $(".progress-div").click ->
    console.log("fail")
    $.ajax 
      url: $(this).data("url")
      success: (data) ->
        $('.alert-div').empty();
        mesg = "<div class='alert alert-success alert-dismissible fade in' role='alert'>"
        mesg+= "<p class='text-center'>Your request is being processed</p>"
        mesg+= "</div>"
        $('.alert-div').append(mesg)
        redirect_to(data)
        console.log("success")
      error: (data) ->
        console.log("fail")
