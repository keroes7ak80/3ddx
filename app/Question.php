<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    protected $table = 'questions';
    protected $fillable = ['question_description','possible_answers','correct_answer','explanation','quiz_id'];
    public function users()
    {
        	return $this->belongsToMany('App\User')
                        ->withPivot([
                            'answer',
                        ]);
    }

}
