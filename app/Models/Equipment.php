<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Equipment extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function transfers(): BelongsToMany
    {
        return $this->belongsToMany(Transfer::class);
    }
}