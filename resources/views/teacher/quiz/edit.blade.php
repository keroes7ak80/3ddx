@extends('teacher.default')
@section('content')
{!! Form::model($quiz ,[
                  'method' => 'PATCH',
                  'route' => ['teacher.quiz.update', $quiz->id],
                ]) 
              !!}

 				@include('teacher.quiz.form')

{!! Form::close() !!}
@endsection