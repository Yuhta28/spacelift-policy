package spacelift

deny[sprintf("command not allowed (%s)", [command])] {
  command := input.request.command

  not input.session.admin
  not re_match("^terraform\\s(un)?taint\\s[\\w\\-\\.]*$", command)
}