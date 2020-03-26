<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

use App\Http\Controllers\UtilityController;
use App\Http\Controllers\TokenController;

// include all necessary models
use App\Model\CovidSessionitem;
use App\Model\Symptom;

class CovidController extends Controller
{

    public function __construct(UtilityController $utility) 
    {
        $this->utility = $utility;
    }

    public function index (Request $request) {
        if(isset($request->status)) {
            exit;
        }

        // $obj            = json_decode($request['messageobj']);
        // $text           = strtolower($obj->text);
        // $from_number2   = $obj->from; // with country code
        // $from_number    = preg_replace('/234/', '0', $obj->from, 1); // replacing the country code '234' with 0
        // $text           = trim(strtolower($text));
        
        $obj            = $request['messageobj'][0];
        $text           = strtolower($obj['text']);
        $from_number2   = $obj['from']; // with country code
        $from_number    = preg_replace('/234/', '0', $obj['from'], 1); // replacing the country code '234' with 0
        $text           = trim(strtolower($text));

        // check if the phone record exist on the database
        $getDetails = CovidSessionitem::where('phone', $from_number)->first();
        
        // check countdown timer
        date_default_timezone_set('Africa/Lagos');
        $currentTime = date("Y/m/d H:i:s", strtotime("now")); // current message time
        $activeTime = date("Y/m/d H:i:s", strtotime("+30 minutes")); // message time in 30 minutes
        
        if(empty($getDetails)) {
            $data = array(
                'phone'            => $from_number,
                'sessionId'        => $this->generate_session(),
                'type'             => 0,           // initial welcome stage
                'level'            => 0,           // initial welcome stage
                'activeTime'       => $activeTime   // expected active trasaction time
            );
            CovidSessionitem::create($data); // create a new record for this model
            $response = $this->welcomeMenu();
            $this->utility->push_response_offline($response, $from_number2);
            exit;
        } else {
            if($currentTime > $getDetails->activeTime) {
                $activeTime = date("Y/m/d H:i:s", strtotime("+30 minutes"));
                $data = array(
                    'phone'            => $from_number,
                    'sessionId'        => $this->generate_session(),
                    'type'             => 0,           // initial welcome stage
                    'level'            => 0,           // initial welcome stage
                    'activeTime'       => $activeTime   // expected active trasaction time
                );
                $response = $this->welcomeMenu();
                $getDetails->update($data);
                $this->utility->push_response_offline($response, $from_number2);
                exit;
            } else {
                $type = $getDetails->type;
                $level = $getDetails->level;
                if($text == 'cancel') { // terminate at anytime
                    $activeTime = date("Y/m/d H:i:s", strtotime("+30 minutes"));
                    $data = array(
                        'phone'            => $from_number,
                        'sessionId'        => $this->generate_session(),
                        'type'             => 0,           // initial welcome stage
                        'level'            => 0,           // initial welcome stage
                        'activeTime'       => $activeTime   // expected active trasaction time
                    );
                    $response = $this->welcomeMenu();
                    $getDetails->update($data);
                    $this->utility->push_response_offline($response, $from_number2);
                    exit;
                }

                if($text == 'back') {
                    if($type == 0) {
                        $level = $level - 1;
                        if($level <= 0) {
                            $level = 1;
                        }
                    } else if($type == 1) {
                        if($level == 41 || $level == 42 || $level == 43 || $level == 44) {
                            $level = 4;
                        } else if($level == 6) {
                            $level = 6;
                        } else {
                            if ($level == 1) {
                                $type = 0;
                            } else {
                                $level = $level - 1;
                                if($level == 0) {
                                    $type = 0;
                                }
                            }
                        }
                    } else if($type == 2) {
                        if($level == 41 || $level == 42 || $level == 43 || $level == 44) {
                            $level = 4;
                        } else if($level == 6) {
                            $level = 6;
                        } else {
                            if ($level == 1) {
                                $type = 0;
                            } else {
                                $level = $level - 1;
                                if($level == 0) {
                                    $type = 0;
                                }
                            }
                        }
                    } else if($type == 3) {
                        if($level == 41 || $level == 42 || $level == 43 || $level == 44) {
                            $level = 5;
                        } else if($level == 6) {
                            $level = 6;
                        } else {
                            $level = $level - 1;
                            if($level <= 0) {
                                $type = 0;
                            }
                            if($level == 2) {
                                $level = 1;
                            }
                        }
                    } else if($type == 4) {
                        if($level == 51 || $level == 52 || $level == 53 || $level == 54) {
                            $level = 5;
                        } else if($level == 6) {
                            $level = 6;
                        } else {
                            $level = $level - 1;
                            if($level <= 0) {
                                $type = 0;
                            }
                            if($level == 2) {
                                $level = 1;
                            }
                        }
                    } else if($type == 5) {
                        $level = $level - 1;
                        if($level <= 0) {
                            $type = 0;
                        }
                    }
                    $text = NULL;
                    $data = array(
                        'type'   => $type,
                        'level'  => $level,
                    );
                    $getDetails->update($data);
                }
            }
            $this->resendMessage($from_number, $text, $from_number2);
            // $this->resendMessage($type, $level, $from_number, $from_number2, $text, $activeTime, $getDetails);
        }
    }

    public function resendMessage ($from_number, $text, $from_number2) {
        $activeTime = date("Y/m/d H:i:s", strtotime("+30 minutes"));
        $getDetails = CovidSessionitem::where('phone', $from_number)->first();
        $type = $getDetails->type;
        $level = $getDetails->level;
        $from_number = $getDetails->phone;

        if ($type == 0) {
            if ($text == 1 || $text == "info") { // get info
                $data = array(
                    'type'          => 1,
                    'level'         => 0,
                    'activeTime'    => $activeTime
                );
                $getDetails->update($data);
                $response = $this->infoMenu();
                $this->utility->push_response_offline($response, $from_number2);
            }
            else if ($text == 2) { // report a case

            }
            else if ($text == 6) { // donate to covid

            } 
            else {
                $response = $this->invalidResponse($from_number2);
            }
        }

        if ($type == 1) {
            if ($level == 0) {
                if ($text == 1 || $text == 'symptom' || $text == 'symptoms') {
                    $response = "The following are the symptoms below shows posible alarm for Covid-19:\n\n";
                    $symptoms = Symptom::orderBy('order', 'asc')->get();
                    foreach ($symptoms as $key => $value) {
                        $response .= "✔ " .$value->description . "\n";
                    }
                    $response .= "\nReply *cancel* - to return to *Main Menu* 🏠\nReply *back* - to go 🔙 back one step";
                    $data = array(
                        'level'         => 1,
                        'activeTime'    => $activeTime
                    );
                    $getDetails->update($data);
                    $this->utility->push_response_offline($response, $from_number2);
                }
                else if ($text == 2 || $text == 'preventive' || $text == 'practice' || $text == 'measure' || $text == 'measures') {
                    
                }
                else if ($text == 3 || $text == 'statistic' || $text == 'statistics') {
                    
                } 
                else {
                    $response = $this->invalidResponse($from_number2);
                }
            }
            if ($level == 1) {

            }
        }

        if ($type == 2) {
            if ($level == 1) {
                // get the state $text
                // update the state, type
            }
        }

        if ($type == 6) {

        }
        
    }

    public function generate_session () {
        $generateCharacter = str_shuffle('1234567890AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz');
        return substr($generateCharacter, 44);
    }

    public function welcomeMenu () {
        $hour = date('H');
        if($hour > 00 && $hour < 12) {
            $dayTerm = "Good Morning";
        } else if($hour >= 12 && $hour < 16) {
            $dayTerm = "Good Afternoon";
        } else {
            $dayTerm = "Good Evening";
        }
        $response = $dayTerm . ",\nWelcome to Covid-19 WhatsApp Chatbot. What would you like to do today?\n\n*1.* Get info on Covid-19  \n*2.* Report a Covid-19 case \n*3.* Take a Covid-19 Self-Assessment \n*4.* Locate Test Centres \n*5.* Locate Isolation Centres \n*6.* Donate \n\n_To make a selection, reply with the number or service of your option_. \n*EXAMPLE:* Reply with *1* or *info* to get info on Covid-19\n\nReply *cancel* - to return to *Main Menu* 🏠\nReply *back* - to go 🔙 back one step";
        return $response;
    }

    public function infoMenu () {
        $response = "*Get info on Covid-19*?\n\n*1.* Symptoms  \n*2.* Preventive Measures & Best Practices \n*3.* Nigeria current Covid-19 Statistics \n*4.* Covid-19 FAQs \n*5.* Myths & Mind Busters \n*6.* Travel Tips & Advice \n\nReply *cancel* - to return to *Main Menu* 🏠\nReply *back* - to go 🔙 back one step";
        return $response;
    }

    public function invalidResponse ($from_number2) {
        $response = "*OOPS, DIDN'T GET THAT...*🤔 \nDid you spell that right? Please send a valid option. \nReply *cancel* - to return to *Main Menu* 🏠 \nReply *back* - to go 🔙 back one step";
        $this->utility->push_response_offline($response, $from_number2);
    }

}
