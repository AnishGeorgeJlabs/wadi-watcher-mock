###
  Parse the given csv
###

csv = require 'csv'

parse = (downloadStream) ->
  downloadStream
  .pipe(csv.parse())
  .pipe(csv.transform((record) ->
      record.map (value) ->
        value
    ))
