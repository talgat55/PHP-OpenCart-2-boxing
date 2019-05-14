
var gulp      = require('gulp'), // Подключаем Gulp
    sass        = require('gulp-sass'), //Подключаем Sass пакет,
    browserSync = require('browser-sync'), // Подключаем Browser Sync
    autoprefixer = require('gulp-autoprefixer');


gulp.task('sass', function () {
  return gulp.src('./catalog/view/theme/theme/static/sass/style.sass')
    .pipe(sass().on('error', sass.logError))
      .pipe(autoprefixer(['last 15 versions', '> 1%', 'ie 8', 'ie 7'], { cascade: true })) // Создаем префиксы
    .pipe(gulp.dest('./catalog/view/theme/theme/stylesheet/'))
	.pipe(browserSync.reload({stream: true}));
});


gulp.task('update-file', function() { // Создаем таск browser-sync
    return gulp.src('./wp-content/themes/theme/assets/css/*.css') // Берем источник
	 .pipe(browserSync.reload({stream: true})) // Обновляем CSS на странице при изменении
});

gulp.task('browser-sync', function() { // Создаем таск browser-sync
    browserSync({
    proxy:'predprinimatel55.local',
    port:8000

  }

  );
});



gulp.task('watch',   gulp.series( gulp.parallel('browser-sync', 'update-file','sass')  , function () {
    gulp.watch('./wp-content/themes/asmart/*.*', ['sass','update-file'] );
	gulp.watch('./wp-content/themes/asmart/static/sass/*.sass', ['sass','update-file'] );
}));

