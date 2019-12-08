<?php 
require __DIR__ . '/vendor/autoload.php';
require 'libs/NotORM.php'; 

use \Slim\App;

$app = new App();

$dbhost = '127.0.0.1';
$dbuser = 'root';
$dbpass = '';
$dbname = 'db_haji_umrah';
$dbmethod = 'mysql:dbname=';

$dsn = $dbmethod.$dbname;
$pdo = new PDO($dsn, $dbuser, $dbpass);
$db  = new NotORM($pdo);

$app-> get('/', function(){
    echo "API Biologi";
});

$app ->get('/larangan', function() use($app, $db){
	$larangan["error"] = false;
	$larangan["message"] = "Berhasil mendapatkan data";
    foreach($db->tb_larangan() as $data){
        $larangan['larangan'][] = array(
            'id_larangan' => $data['id_larangan'],
            'judul_larangan' => $data['judul_larangan'],
            'deskripsi_larangan' => $data['deskripsi_larangan']
            );
    }
    echo json_encode($larangan);
});

$app ->get('/larangan/{id}', function($request, $response, $args) use($app, $db){
    $larangan = $db->tb_larangan()->where('id_larangan',$args['id']);
    $larangandetail = $larangan->fetch();

    if ($larangan->count() == 0) {
        $responseJson["error"] = true;
        $responseJson["message"] = "Nama belum tersedia di database";
        $responseJson["id_larangan"] = null;
        $responseJson["judul_larangan"] = null;
        $responseJson["deskripsi_larangan"] = null;
    } else {
        $responseJson["error"] = false;
        $responseJson["message"] = "Berhasil mengambil data";
        $responseJson["id_larangan"] = $larangandetail['id_larangan'];
        $responseJson["judul_larangan"] = $larangandetail['judul_larangan'];
        $responseJson["deskripsi_larangan"] = $larangandetail['deskripsi_larangan'];
    }

    echo json_encode($responseJson); 
});

$app ->get('/doa', function() use($app, $db){
    $doa["error"] = false;
	$doa["message"] = "Berhasil mendapatkan data";
    foreach($db->tb_doa() as $data){
        $doa['doa'][] = array(
            'id_doa' => $data['id_doa'],
            'judul_doa' => $data['judul_doa'],
            'gambar_doa' => $data['gambar_doa'],
            'deskripsi_doa' => $data['deskripsi_doa']
            );
    }
    echo json_encode($doa);
});

$app ->get('/doa/{id}', function($request, $response, $args) use($app, $db){
    $doa = $db->tb_doa()->where('id_doa',$args['id']);
    $doadetail = $doa->fetch();

    if ($doa->count() == 0) {
        $responseJson["error"] = true;
        $responseJson["message"] = "Nama belum tersedia di database";
        $responseJson["id_doa"] = null;
        $responseJson["judul_doa"] = null;
        $responseJson["gambar_doa"] = null;
        $responseJson["deskripsi_doa"] = null;
    } else {
        $responseJson["error"] = false;
        $responseJson["message"] = "Berhasil mengambil data";
        $responseJson["id_doa"] = $doadetail['id_doa'];
        $responseJson["gambar_doa"] = $doadetail['gambar_doa'];
        $responseJson["deskripsi_doa"] = $doadetail['deskripsi_doa'];
    }

    echo json_encode($responseJson); 
});

$app ->get('/materi', function() use($app, $db){
    if ($db->tb_materi()->count() == 0) {
        $responseJson["error"] = true;
        $responseJson["message"] = "Belum mengambil data";
    } else {
        $responseJson["error"] = false;
        $responseJson["message"] = "Berhasil mendapatkan data";
        foreach($db->tb_materi() as $data){
        $responseJson['materi'][] = array(
            'id_materi' => $data['id_materi'],
            'jenis_materi' => $data['jenis_materi'],
            'judul_materi' => $data['judul_materi'],
            'deksripsi_materi' => $data['deksripsi_materi']
            );
        }
    }
    echo json_encode($responseJson);
});

$app ->get('/materi/{id}', function($request, $response, $args) use($app, $db){
    $materi = $db->tb_doa()->where('id_doa',$args['id']);
    $detailmateri = $materi->fetch();

    if ($doa->count() == 0) {
        $responseJson["error"] = true;
        $responseJson["message"] = "Nama belum tersedia di database";
        $responseJson["id_materi"] = null;
        $responseJson["jenis_doa"] = null;
        $responseJson["judul_materi"] = null;
        $responseJson["deskripsi_materi"] = null;
    } else {
        $responseJson["error"] = false;
        $responseJson["message"] = "Berhasil mengambil data";
        $responseJson["id_materi"] = $detailmateri['id_materi'];
        $responseJson["jenis_materi"] = $detailmateri['jenis_materi'];
        $responseJson["judul_materi"] = $detailmateri['judul_materi'];
        $responseJson["deskripsi_materi"] = $detailmateri['deskripsi_materi'];
    }

    echo json_encode($responseJson); 
});

$app ->get('/kegiatan', function() use($app, $db){
	$kegiatan["error"] = false;
	$kegiatan["message"] = "Berhasil mendapatkan data";
    foreach($db->tb_kegiatan() as $data){
        $kegiatan['kegiatan'][] = array(
            'id_kegiatan' => $data['id_kegiatan'],
            'judul_kegiatan' => $data['judul_kegiatan'],
            'deskripsi_kegiatan' => $data['deskripsi_kegiatan']
            );
    }
    echo json_encode($kegiatan);
});

$app ->get('/kegiatan/{id}', function($request, $response, $args) use($app, $db){
    $kegiatan = $db->tb_kegiatan()->where('id_kegiatan',$args['id']);
    $kegiatandetail = $kegiatan->fetch();

    if ($kegiatan->count() == 0) {
        $responseJson["error"] = true;
        $responseJson["message"] = "Nama belum tersedia di database";
        $responseJson["id_kegiatan"] = null;
        $responseJson["judul_kegiatan"] = null;
        $responseJson["deskripsi_kegiatan"] = null;
    } else {
        $responseJson["error"] = false;
        $responseJson["message"] = "Berhasil mengambil data";
        $responseJson["id_kegiatan"] = $kegiatandetail['id_kegiatan'];
        $responseJson["judul_kegiatan"] = $kegiatandetail['judul_kegiatan'];
        $responseJson["deskripsi_kegiatan"] = $kegiatandetail['deskripsi_kegiatan'];
    }

    echo json_encode($responseJson); 
});

//run App
$app->run();