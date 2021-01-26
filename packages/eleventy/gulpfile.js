// dependencies
const gulp = require('gulp');
const sass = require('gulp-sass');
const purgecss = require('gulp-purgecss');
const cleanCSS = require('gulp-clean-css');
const webpack = require('webpack');
const config = require('./webpack.config.js');

const BASEDIR = './scss';

// path variables
const path = {
	css: `./_site/css/`,
	sass: `${BASEDIR}/*.scss`,
	templates: './src/_includes/**/*.scss',
	js: 'scripts/*.js',
	js_prod: '_site/scripts/',
};

// sass task
gulp.task('sass', function () {
	return gulp.src(path.sass)
		.pipe(sass()).pipe(sass().on('error', sass.logError))
		.pipe(purgecss({ content: ['src/**/*.njk', 'scripts/*.js'] }))
		.pipe(cleanCSS({ compatibility: 'ie8' }))
		.pipe(gulp.dest(path.css));
});

gulp.task('js', function () {
	webpack(config).run();
	/* return gulp
		.src(path.js)
		.pipe(jsImport({ hideConsole: true }))
		.pipe(gulp.dest(path.js_prod)); */
});

// default ask - call from terminal with `npx gulp`
// `gulp.series` maps string "sass" to func called `on` method
gulp.task('default', function () {
	gulp.watch([path.sass, path.templates]).on('change', gulp.series('sass'));
	gulp.watch([path.js]).on('change', gulp.series('js'));
});
