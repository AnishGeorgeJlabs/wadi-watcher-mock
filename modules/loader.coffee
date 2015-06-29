###
google = require 'googleapis'
OAuth2 = google.auth.OAuth2

CLIENT_ID = '371111508534-n7ve2ddoipqle6afc8g4iudmfomlnv2b.apps.googleusercontent.com'
CLIENT_SECRET = 'Gsy-e3TNrA4NOrmJakP9NSAs'
REDIRECT_URL = 'urn:ietf:wg:oauth:2.0:oob'
SCOPE = 'https://spreadsheets.google.com/feeds'


oauth2Client = new OAuth2(CLIENT_ID, CLIENT_SECRET, REDIRECT_URL)
google.options({ auth: oauth2Client })    # Global level auth

url = oauth2Client.generateAuthUrl
  access_type: 'offline', # 'online' (default) or 'offline' (gets refresh_token)
  scope: SCOPE


oauth2Client.getTokens 'code', (err, tokens) ->
  if not err
    oauth2Client.setCredentials(tokens)

###
