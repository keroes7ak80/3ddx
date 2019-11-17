<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Auth;
class Quiz extends Model
{
    protected $table = 'quizes';
    protected $fillable = ['description','published','user_id'];

    public function questions()
    {
    	return $this->hasMany('App\Question');
    }
    public function scopePublished($query)
    {
        return $query->where('published', 1);
    }

    public function users()
    {
        return $this->belongsToMany('App\User')
                    ->withPivot([
                        'grade',
                    ]);
    }

    public function isSolved()
    {
        $current_user=$this->users->where('id',Auth::user()->id);
        if(count($current_user))
            return 1;
        else 
            return 0;
    }
}
