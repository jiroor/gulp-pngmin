
through2 = require 'through2'
pngquant = require 'pngquant'

module.exports = (options)->
  
  through2.obj (file, enc, cb)->

    if file.isNull()
      @push file
      return cb()

    if file.isBuffer()
      file.contents = file.pipe new pngquant options
      @push file
      return cb()

    if file.isStream()
      file.contents = file.contents.pipe new pngquant options
      @push file
      return cb()
