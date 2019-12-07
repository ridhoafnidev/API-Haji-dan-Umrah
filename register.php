<?php
 
require_once 'include/DB_Functions.php';
$db = new DB_Functions();
 
// json response array
$response = array("error" => FALSE);
 
if (
    isset($_POST['username']) && 
    isset($_POST['nama_lengkap']) && 
    isset($_POST['email']) && 
    isset($_POST['password']) && 
    isset($_POST['nomor_hp']) && 
    isset($_POST['alamat'])) {
 
    // menerima parameter POST ( nama, email, password )
    $username = $_POST['username'];
    $nama = $_POST['nama_lengkap'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $nomor_hp = $_POST['nomor_hp'];
    $alamat = $_POST['alamat'];
 
    // Cek jika user ada dengan email yang sama
    if ($db->isUserExisted($username)) {
        // user telah ada
        $response["error"] = TRUE;
        $response["error_msg"] = "User telah ada dengan email " . $username;
        echo json_encode($response);
    } else {
        // buat user baru
        $user = $db->simpanUser($username, $nama, $email, $password, $nomor_hp, $alamat);
        if ($user) {
            // simpan user berhasil
            $response["error"] = FALSE;
            $response["uid"] = $user["unique_id"];
            $response["user"]["username"] = $user["username"];
            $response["user"]["nama_lengkap"] = $user["nama_lengkap"];
            $response["user"]["email"] = $user["email"];
            $response["user"]["password"] = $user["password"];
            $response["user"]["nomor_hp"] = $user["nomor_hp"];
            $response["user"]["alamat"] = $user["alamat"];
            echo json_encode($response);
        } else {
            // gagal menyimpan user
            $response["error"] = TRUE;
            $response["error_msg"] = "Terjadi kesalahan saat melakukan registrasi";
            echo json_encode($response);
        }
    }
} else {
    $response["error"] = TRUE;
    $response["error_msg"] = "Parameter (nama, email, atau password) ada yang kurang";
    echo json_encode($response);
}
?>