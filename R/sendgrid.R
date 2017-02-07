### Simple sendgrid API v3 R function
#
# to, from, reply_to - either string (email) or vector (email, name)
# cc, bcc - list of strings and/or vectors (see to, from, reply_to)
# subject - string
# text - string (content of email)
# html - string (content of email)
# attachment - base64enc string

sendgrid <- function(api, to, subject, from, text, 
                     html=NULL, cc=NULL, bcc=NULL, reply_to=NULL, attachment=NULL) {
  
  json <- '{ "personalizations": [ { "to": ['
  json <- paste0(json, sendgrid_json_emails(to))
  json <- paste0(json, '], "subject": "', subject, '" } ], "from": ')
  json <- paste0(json, sendgrid_json_emails(from))
  json <- paste0(json, ', "content": [ { "type": "text/plain", "value": "' ,text, '" }] }')

  curl_args <- paste0('-X "POST" "https://api.sendgrid.com/v3/mail/send" -H "Authorization: Bearer ', 
                      api,'" -H "Content-Type: application/json" -d ')
  curl_args <- paste0(curl_args, "'", json, "'")
  sys_ret <- system2("curl", curl_args, stdout=FALSE, stderr=FALSE)
  
  return(sys_ret)  
}
