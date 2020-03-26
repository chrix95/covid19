<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UtilityController extends Controller
{

    public function sendSMS($phone, $message) {
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://irecharge.com.ng/whatsapp_sms.php",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 60,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "POST",
            CURLOPT_POSTFIELDS => "{\n\t\"phone\":\"".$phone."\",\n\t\"message\":\"".$message."\"\n}",
            CURLOPT_HTTPHEADER => array(
                "cache-control: no-cache",
                "content-type: application/json",
                "postman-token: 7c2001e5-75b6-f1c1-b2ca-87d3241c70b7"
            ),
        ));
        $response = curl_exec($curl);
        $err = curl_error($curl);
        curl_close($curl);
        if ($err) {
            $errCode = "cURL Error #:" . $err;
            \Log::info('errCode from SMS');
            \Log::info($err);
        } else {
            \Log::info('response from SMS');
            \Log::info($response);
        }
    }

    public function push_response_offline($message) {
        print_r($message);
    }

    public function push_response_gupshup($message, $phone) {
        $curl = curl_init();
        curl_setopt_array($curl, array(
        CURLOPT_URL => "https://api.gupshup.io/sm/api/v1/msg",
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 60,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "POST",
        CURLOPT_POSTFIELDS => "channel=whatsapp&source=917834811114&destination=".$phone."&message=".$message,
        CURLOPT_HTTPHEADER => array(
            "Content-Type: application/x-www-form-urlencoded",
            "Postman-Token: b2f94111-cd96-487b-a04a-040444a1c29c",
            "apikey: f18e532adc4f41dac19607e4e5c68bf7",
            "cache-control: no-cache"
        ),
        ));
        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
            $error = "cURL Error #:" . $err;
            \Log::info("Error sending to Gupshup: ");
            \Log::info($error);
        } else {
            // echo $response;
            // \Log::info("Sent successfully to Gupshup: ");
            \Log::info('Gupshup response');
            \Log::info($response);
        }
    }
}
