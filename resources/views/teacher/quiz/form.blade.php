<div>
	@if ($errors->any())
	<div class="alert alert-danger">
		@foreach ($errors->all() as $error)
		<p>{{ $error }}</p>
		@endforeach

	</div>
	@endif

	<label>Description</label>

	{!!

		Form::text('description')
		!!}
		{!!Form::select('published', ['0' => 'Not Published', '1' => 'Published']);!!}
		<p></p>
		<p><button class="add_fields btn btn-primary">Add Question</button></p>
		<div class="wrapper">
			@if(!isset($edit))
			<div class="row">
				<label>Description</label>
				<input required type="text" name="question_description[]" placeholder="Question Description" />
				<label>Possible Answers</label>
				<input required type="text" name="possible_answers[]" placeholder="Possible Answers" />
				<label>Correct Answer</label>
				<input required type="text" name="correct_answer[]" placeholder="Correct Answer" />
				<label>Explanation</label>
				<input required type="text" name="explanation[]" placeholder="Explanation" />
				<a href="javascript:void(0);" class="remove_field">Remove</a>
			</div>
			@else
			@foreach($quiz->questions()->get() as $question)
				<div class="row">
					<label>Description</label>
					<input value="{{$question->question_description}}" required type="text" name="question_description[]" placeholder="Question Description" />
					<label>Possible Answers</label>
					<input value="{{$question->possible_answers}}" required type="text" name="possible_answers[]" placeholder="Possible Answers" />
					<label>Correct Answer</label>
					<input value="{{$question->correct_answer}}" required type="text" name="correct_answer[]" placeholder="Correct Answer" />
					<label>Explanation</label>
					<input value="{{$question->explanation}}" required type="text" name="explanation[]" placeholder="Explanation" />
					<a href="javascript:void(0);" class="remove_field">Remove</a>
				</div>
			@endforeach
			@endif
		</div>
		
		<input type="submit" value="Submit">
	</div>

<script>
//Add Input Fields
$(document).ready(function() {
    var max_fields = 10; //Maximum allowed input fields 
    var wrapper    = $(".wrapper"); //Input fields wrapper
    var add_button = $(".add_fields"); //Add button class or ID
    var x = 1; //Initial input field is set to 1

 //When user click on add input button
 $(add_button).click(function(e){
 	e.preventDefault();
 //Check maximum allowed input fields
 if(x < max_fields){ 
            x++; //input field increment
 //add input field
 $(wrapper).append('<div class="row"> <label>Description</label> <input required type="text" name="question_description[]" placeholder="Question Description" /> <label>Possible Answers</label> <input required type="text" name="possible_answers[]" placeholder="Possible Answers" /> <label>Correct Answer</label> <input required type="text" name="correct_answer[]" placeholder="Correct Answer" /> <label>Explanation</label> <input required type="text" name="explanation[]" placeholder="Explanation" /> <a href="javascript:void(0);" class="remove_field">Remove</a> </div>');
}
});
 
    //when user click on remove button
    $(wrapper).on("click",".remove_field", function(e){ 
    	e.preventDefault();
 $(this).parent('div').remove(); //remove inout field
 x--; //inout field decrement
})
});
</script>