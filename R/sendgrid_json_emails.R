sendgrid_json_emails <- function(input) {
  output <- ""
  counter <- 1
  for(part in input) {
    if (counter > 1) { output <- paste0(output, ', ') }
    if(length(part) == 1) {
      output <- paste0(output, '{ "email": "', part,'" }')
    } else {
      output <- paste0(output, '{ "email": "', part[1],'", "name": "', part[2],'" }')
    }
    counter <- counter + 1
  }
  return(output)
}
