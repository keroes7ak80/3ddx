@extends('student.default')
@section('content')
 <table id="mytable" class="table table-bordred table-striped">
                   
                   <thead>
                   
                   <th>Description</th>
                   <th>Grade</th>
                   </thead>
 <tbody>
    @foreach($quizzes as $quiz)
    <tr>
    <td><a href="{{route('student.quiz',$quiz->id)}}">{{$quiz->description}}</a></td>
    @if(Auth::user()->solved_quizzes->find($quiz->id))
    <td>{{Auth::user()->solved_quizzes->find($quiz->id)->pivot->grade}}% </td>
    @else
    <td>Exam not solved yet</td>
    @endif
    </tr>
    @endforeach
</tbody>
<script type="text/javascript">
	
</script>
@endsection