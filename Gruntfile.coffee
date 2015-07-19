module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    coffee:
      compile:
        expand: true
        cwd: 'src'
        src: ['**/*.coffee']
        dest: 'lib'
        ext: '.js'

    watch:
      src:
        files: 'src/**/*.coffee'
        tasks: ['coffee']

    uglify:
      vendor:
        files:
          'static/js/vendor/vendor.min.js': [
            'bower_components/jquery/dist/jquery.js'
            'bower_components/lodash/lodash.js'
            'bower_components/angular/angular.js'
            'bower_components/angular-ui-router/release/angular-ui-router.js'
            'bower_components/bootstrap/dist/js/bootstrap.js'
            'bower_components/angular-bootstrap/ui-bootstrap-tpls.js'
          ]

    cssmin:
      vendor:
        files:
          'static/css/vendor/vendor.min.css': [
            'bower_components/bootstrap/dist/css/bootstrap.css'
            'bower_components/open-sans-fontface/open-sans.css',
          ]

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', [
    'coffee'
    'uglify'
    'cssmin'
    'watch'
  ]
