@extends('teacher.default')
@section('content')
{!! Form::open(['method' => 'POST','route' => 'teacher.quiz.store']) !!}

 				@include('teacher.quiz.form')

{!! Form::close() !!}
@endsection


