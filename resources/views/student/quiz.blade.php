@extends('student.default')
@section('content')
<dir class="container">
	<h3>{{$quiz->description}}</h3>
	<br>
	<br>
	<form class="form-horizontal" method="POST" action="{{ route('student.submit_quiz') }}">
		<input type="hidden" name="quiz_id" value="{{$quiz->id}}">
	{{ csrf_field() }}
		@foreach($quiz->questions()->get() as $k => $question)
			<h4>Question {{$k+1}}</h4>
			<h5> {{$question->question_description}}</h5>
			<br>
			<label>Choose the correct answer</label>
			<h5> {{$question->possible_answers}}</h5>
			<br>
			<input type="hidden" name="question_id[{{$k}}]" value="{{$question->id}}">
			<input type="text" name="answer[{{$k}}]" required>
			<hr>
		@endforeach
		<button class="btn btn-primary"  type="submit">Submit Answers</button>	
	</form>
</dir>

@endsection