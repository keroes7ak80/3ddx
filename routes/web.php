<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Teacher
Route::group(['middleware' => ['auth', 'teacher']], function() {
	Route::get('/teacher', 'TeacherController@index')->name('teacher');
	Route::get('/teacher/quiz/create', 'QuizController@create')->name('teacher.quiz.create');
	Route::post('/teacher/quiz/store', 'QuizController@store')->name('teacher.quiz.store');
	Route::get('/teacher/quiz/edit/{id}', 'QuizController@edit')->name('teacher.quiz.edit');
	Route::patch('/teacher/quiz/update/{id}', 'QuizController@update')->name('teacher.quiz.update');
	Route::get('/teacher/quiz/delete/{id}', 'QuizController@delete')->name('teacher.quiz.delete');
	Route::get('/teacher/quiz/all', 'QuizController@showQuizzes')->name('teacher.quizzes');
});

Route::group(['middleware' => ['auth', 'student']], function() {
	Route::get('/student/quiz/all', 'StudentController@showQuizzes')->name('student.quizzes');
	Route::get('/student/quiz/{id}', 'StudentController@showQuiz')->name('student.quiz');
	Route::post('/student/submit-quiz', 'StudentController@submitQuiz')->name('student.submit_quiz');
});

Auth::routes();

Route::get('/', 'HomeController@index')->name('home');
