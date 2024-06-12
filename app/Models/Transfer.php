<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Transfer extends Model
{
    use HasFactory;

    protected $guarded = [];
    
    public function equipments(): BelongsToMany
    {
        return $this->belongsToMany(Equipment::class);
    }

    public function destination()
    {
        return $this->belongsTo(Destination::class);
    }
}
