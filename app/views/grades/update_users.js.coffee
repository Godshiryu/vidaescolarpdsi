$('[id^=myModal]').find('#users_select').empty()
  .append("<%= escape_javascript(render(:partial => @users)) %>")

  