# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on 'change', '#atividades_select', (evt) ->
    $.ajax 'update_users',
      type: 'GET'
      dataType: 'script'
      data: {
        activity_id: $("#atividades_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{errorThrown}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")