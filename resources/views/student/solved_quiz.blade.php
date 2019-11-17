@extends('student.default')
@section('content')
<dir class="container">
	<h1>{{$quiz->description}}</h1>
	<h2> Your Grade is: {{Auth::user()->solved_quizzes->find($quiz->id)->pivot->grade}}% </h2>
	<br>
	<br>
	{{ csrf_field() }}
		@foreach($quiz->questions()->get() as $k => $question)
			<h4 style="color : blue;">Question {{$k+1}}</h4>
			<h5> {{$question->question_description}}</h5>
			<br>
			<label>Possible Answers</label>
			<h5> {{$question->possible_answers}}</h5>
			<label>Your Answer</label>
			<h5> {{Auth::user()->questions->find($question->id)->pivot->answer}}</h5>
			<br>
			<label>Correct Answer</label>
			<h5> {{$question->correct_answer}}</h5>
			<br>
			<label>Explanation</label>
			<h5> {{$question->explanation}}</h5>
			<hr>
		@endforeach
</dir>

@endsection