<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCovidSessionitemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('covid_sessionitems', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('phone');
            $table->string('sessionId');
            $table->string('type')->default('0');
            $table->string('level')->default('0');
            $table->string('activeTime')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('covid_sessionitems');
    }
}
