(function() {
  var pngquant, through2;

  through2 = require('through2');

  pngquant = require('pngquant');

  module.exports = function(options) {
    return through2.obj(function(file, enc, cb) {
      if (file.isNull()) {
        this.push(file);
        return cb();
      }
      if (file.isBuffer()) {
        file.contents = file.pipe(new pngquant(options));
        this.push(file);
        return cb();
      }
      if (file.isStream()) {
        file.contents = file.contents.pipe(new pngquant(options));
        this.push(file);
        return cb();
      }
    });
  };

}).call(this);
