<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Quiz;
use Auth;
use App\Question;
class StudentController extends Controller
{
  public function showQuizzes()
  {
    $quizzes=Quiz::published()->get();
    return view('student.all_quizzes',['quizzes'=>$quizzes]);
  }

  public function showQuiz($id)
  {
    $quiz=Quiz::where('id',$id)->published()->first();
    if($quiz)
    {
      if($quiz->isSolved())
      {

        return view('student.solved_quiz',['quiz'=>$quiz]);
      }
      else
        return view('student.quiz',['quiz'=>$quiz]);
    }
    else
      throw new \Illuminate\Database\Eloquent\ModelNotFoundException;

  }
  public function submitQuiz(Request $request)
  {
    $quiz_id=$request->only('quiz_id')['quiz_id'];
    $answers=$request->only('answer')['answer'];
    $question_ids=$request->only('question_id')['question_id'];
    $questions_number=count($question_ids);
    $correct_asnwers_count=0;
    for ($i=0; $i < count($answers) ; $i++) { 
     Auth::user()->questions()->attach($question_ids[$i], ['answer' => $answers[$i]]);
     $question=Question::where('id',$question_ids[$i])->first();
     
     if($answers[$i]==$question->correct_answer)
        $correct_asnwers_count++;
    }
    
    $grade= $correct_asnwers_count /(float) $questions_number;
    $grade=$grade*100;
    $grade=number_format((float)$grade, 2, '.', '');
    Auth::user()->solved_quizzes()->attach($quiz_id, ['grade' => $grade]);
    return redirect()->back();
  }
}
