<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Quiz;
use App\Question;
use Auth;
class QuizController extends Controller
{
  public function create ()
  { 	
  	return view('teacher.quiz.create');
  }
  public function showQuizzes()
  {
    $quizzes=Auth::user()->quizzes()->get();
    return view('teacher.all_quizzes',['quizzes'=>$quizzes]);
  }

  public function store (Request $request)
  {
    $request->validate([
    'description' => 'required|max:1023',
    'question_description.*' => 'required|max:1023',
    'possible_answers.*' => 'required|max:1023',
    'correct_answer.*' => 'required|max:1023',
    'explanation.*' => 'required|max:1023',
    ]);
  	$quiz=Quiz::create($request->only('description','published'));

    $quiz->user_id=Auth::user()->id;
    $quiz->save();
    $questions=$request->only('question_description','possible_answers','correct_answer','explanation');
    for ($i=0; $i <count($questions['question_description']) ; $i++) { 
      $new_question= new Question;
      $new_question->question_description= $questions['question_description'][$i];
      $new_question->possible_answers= $questions['possible_answers'][$i];
      $new_question->correct_answer= $questions['correct_answer'][$i];
      $new_question->explanation= $questions['explanation'][$i];
      $new_question->quiz_id=$quiz->id;
      $new_question->save();
    }
    $request->session()->flash('message', 'Quiz Created Successfully');

    return redirect()->route('teacher.quizzes');
  }

  public function edit ($id)
  {
    $quiz=Quiz::findOrFail($id);
    if ($quiz->user_id!=Auth::user()->id) {
      throw new \Illuminate\Database\Eloquent\ModelNotFoundException;
    }
    $edit=1;
  	return view('teacher.quiz.edit',['quiz'=>$quiz,'edit'=>$edit]);
  }

  public function update ($id, Request $request)
  {
    $request->validate([
    'description' => 'required|max:1023',
    'question_description.*' => 'required|max:1023',
    'possible_answers.*' => 'required|max:1023',
    'correct_answer.*' => 'required|max:1023',
    'explanation.*' => 'required|max:1023',
    ]);	
    $quiz=Quiz::findOrFail($id);
    if ($quiz->user_id!=Auth::user()->id) {
      throw new \Illuminate\Database\Eloquent\ModelNotFoundException;
    }
    $quiz->user_id=Auth::user()->id;
    $quiz->save;

    
    $quiz->update($request->only('description','published'));
    $old_questions=$quiz->questions()->get();
    foreach ($old_questions as $key => $question) {
      $question->delete();
    }
    $questions=$request->only('question_description','possible_answers','correct_answer','explanation');
    for ($i=0; $i <count($questions['question_description']) ; $i++) { 
      $new_question= new Question;
      $new_question->question_description= $questions['question_description'][$i];
      $new_question->possible_answers= $questions['possible_answers'][$i];
      $new_question->correct_answer= $questions['correct_answer'][$i];
      $new_question->explanation= $questions['explanation'][$i];
      $new_question->quiz_id=$quiz->id;
      $new_question->save();
    }
    $request->session()->flash('message', 'Quiz Updated Successfully');
    return redirect()->route('teacher.quizzes');
  }

  public function delete($id)
  {
    $quiz= Quiz::findOrFail($id);
    $quiz->delete();
    return redirect()->back();
  }
}
