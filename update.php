<?php
 
require_once 'include/DB_Functions.php';
$db = new DB_Functions();
 
// json response array
$response = array("error" => FALSE);
 
if (

    isset($_POST['id_user']) && 
    isset($_POST['restore_id'])) {
 
    // menerima parameter POST ( nama, email, password )
    $restore_id = $_POST['restore_id'];
    $id_user = $_POST['id_user'];

        // buat user baru
        $user = $db->updateUser($id_user, $restore_id);
        if ($user) {
            // simpan user berhasil
            $response["error"] = FALSE;
            $response["user"]["id_user"] = $user["id_user"];
            $response["user"]["username"] = $user["username"];
            $response["user"]["nama_lengkap"] = $user["nama_lengkap"];
            $response["user"]["email"] = $user["email"];
            $response["user"]["password"] = $user["password"];
            $response["user"]["nomor_hp"] = $user["nomor_hp"];
            $response["user"]["alamat"] = $user["alamat"];
            $response["user"]["restore_id"] = $user["restore_id"];
            echo json_encode($response);
        } else {
            // gagal menyimpan user
            $response["error"] = TRUE;
            $response["error_msg"] = "Terjadi kesalahan saat melakukan registrasi";
            echo json_encode($response);
        }
} else {
    $response["error"] = TRUE;
    $response["error_msg"] = "Parameter ada yang kurang";
    echo json_encode($response);
}
?>