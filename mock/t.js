csv = require('csv')

process.stdin
.pipe(csv.parse())
.pipe(csv.transform(function(record){
  record.map(function(val){
    val.toUpperCase()
  })
}))
.pipe(csv.stringify())
.pipe(process.stdout)