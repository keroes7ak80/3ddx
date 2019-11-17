<?php

namespace App\Http\Middleware;

use Closure;
use Auth;
class CheckStudent
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (Auth::user()->type!='student') {
            return redirect('/');
        }
        return $next($request);
    }
}
