<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class CovidSessionitem extends Model
{
    protected $fillable = [
        'phone',
        'sessionId',
        'type',
        'level',
        'activeTime'
    ];
}