module.exports = function(grunt){

  grunt.initConfig({
    //ここに実行内容を記述（uglifyは1例）
    uglify: { //←uglifyでないとダメ
      dist: { //←distは、distでなくても好きな名前でOK
        files: { //←ここはfilesじゃないとダメ
          'all.min.js': ['all.js']
        }
      },
      dist2: {
        src: ['test.js'],
        dest: 'test.min.js'
      }
    }
  });

  //プラグインからタスクを読み込む（uglifyは1例）
  grunt.loadNpmTasks('grunt-contrib-uglify');

  //タスクの登録
  grunt.registerTask('default', ['uglify']);

}