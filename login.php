<?php
require_once 'include/DB_Functions.php';
$db = new DB_Functions();
 
// json response array
$response = array("error" => FALSE);
 
if (isset($_POST['username']) && isset($_POST['password'])) {
 
    // menerima parameter POST ( email dan password )
    $username = $_POST['username'];
    $password = $_POST['password'];
 
    // get the user by email and password
    // get user berdasarkan email dan password
    $user = $db->getUserByUsernameAndPassword($username, $password);
 
    if ($user != false) {
        // user ditemukan
        $response["error"] = FALSE;
        $response["uid"]                       = $user["unique_id"];
        $response["kloter"]                    = $user["kloter"];
        $response["priode"]                    = $user["priode"];
        $response["user"]["id_user"]           = $user["id_user"];
        $response["user"]["username"]          = $user["username"];
        $response["user"]["nama_awal"]         = $user["nama_awal"];
        $response["user"]["nama_akhir"]        = $user["nama_akhir"];
        $response["user"]["email"]             = $user["email"];
        $response["user"]["nomor_hp"]          = $user["nomor_hp"];
        $response["user"]["alamat"]            = $user["alamat"];
        $response["user"]["restore_id"]        = $user["restore_id"];
        echo json_encode($response);
    } else {
        // user tidak ditemukan password/email salah
        $response["error"] = TRUE;
        $response["error_msg"] = "Login gagal. Password/Email salah";
        echo json_encode($response);
    }
} else {
    $response["error"] = TRUE;
    $response["error_msg"] = "Parameter (email atau password) ada yang kurang";
    echo json_encode($response);
}
?>