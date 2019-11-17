@extends('teacher.default')
@section('content')
 <table id="mytable" class="table table-bordred table-striped">
                   
                   <thead>
                   
                   <th>Description</th>
                      <th>Edit</th>
                       <th>Delete</th>
                   </thead>
 <tbody>
    @foreach($quizzes as $quiz)
    <tr>
    <td>{{$quiz->description}}</td>
    <td><p title="Edit"><a href="{{route('teacher.quiz.edit',$quiz->id)}}" class="btn btn-primary btn-xs"  ><span class="glyphicon glyphicon-pencil"></span></a></p></td>
    <td><p title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete{{$quiz->id}}" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
    </tr>
    <!-- Modal content-->
    <div class="modal fade" id="delete{{$quiz->id}}" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Confirm Deletion</h4>
        </div>
        <div class="modal-body">
          <p>You will permenantly delete this quiz.</p>
        </div>
        <div class="modal-footer">
          <a href="{{route('teacher.quiz.delete',$quiz->id)}}" type="button" class="btn btn-danger" >Confirm</a>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      </div>
  </div>
    @endforeach
</tbody>
<script type="text/javascript">
	
</script>
@endsection