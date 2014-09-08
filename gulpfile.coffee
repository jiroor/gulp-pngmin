
# require modules
gulp   = require 'gulp'
rimraf = require 'gulp-rimraf'
coffee = require 'gulp-coffee'

# Clean
gulp.task 'clean', ->
  gulp.src 'lib'
    .pipe rimraf()

# CoffeeScript
gulp.task 'coffee', ->
  gulp.src 'src/**/*.coffee'
    .pipe coffee()
    .pipe gulp.dest 'lib'

# Build
gulp.task 'default', ['clean', 'coffee']
