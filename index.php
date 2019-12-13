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
            'deskripsi_materi' => $data['deskripsi_materi'],
            'link_youtube' => $data['link_youtube']
            );
        }
    }
    echo json_encode($responseJson);
});

$app ->get('/kegiatan/{kloter}/{priode}', function($request, $response, $args) use($app, $db){

    // $priode = $args['priode'];
    // $kloter = $args['kloter'];
    // $sql = "SELECT * FROM tb_kegiatan WHERE kloter=:kloter";
    // $stmt = $db->prepare($sql);
    // $stmt->execute([":kloter" => $kloter]);
    // $kegiatan = $stmt->fetchAll();

        $kegiatan = $db->tb_kegiatan()->where('kloter',$args['kloter'] AND 'priode',$args['priode']);
        $responseJson["error"] = false;
        $responseJson["message"] = "Berhasil mendapatkan data";
        foreach($kegiatan as $data){
        $responseJson['kegiatan'][] = array(
            'id_kegiatan' => $data['id_kegiatan'],
            'kloter' => $data['kloter'],
            'priode' => $data['priode'],
            'tanggal_keberangkatan' => $data['tanggal_keberangkatan'],
            'tanggal_kepulangan' => $data['tanggal_kepulangan'],
            'judul_kegiatan' => $data['judul_kegiatan'],
            'deskripsi_kegiatan' => $data['deskripsi_kegiatan']
            );
        }
    echo json_encode($responseJson);
});

$app ->get('/user/{id}', function($request, $response, $args) use($app, $db){
    $user = $db->tb_user()->where('id_user',$args['id']);
    $detailuser = $user->fetch();

    if ($user->count() == 0) {
        $responseJson["error"] = true;
        $responseJson["message"] = "Nama belum tersedia di database";
        $responseJson["id_user"] = null;
        $responseJson["username"] = null;
        $responseJson["kloter"] = null;
        $responseJson["priode"] = null;
        $responseJson["nama_awal"] = null;
        $responseJson["nama_akhir"] = null;
        $responseJson["email"] = null;
        $responseJson["nomor_hp"] = null;
        $responseJson["alamat"] = null;
        $responseJson["restore_id"] = null;
    } else {
        $responseJson["error"] = false;
        $responseJson["message"] = "Berhasil mengambil data";
        $responseJson["id_user"] = $detailuser['id_user'];
        $responseJson["username"] = $detailuser['username'];
        $responseJson["priode"] = $detailuser['priode'];
        $responseJson["kloter"] = $detailuser['kloter'];
        $responseJson["nama_awal"] = $detailuser['nama_awal'];
        $responseJson["nama_akhir"] = $detailuser['nama_akhir'];
        $responseJson["email"] = $detailuser['email'];
        $responseJson["nomor_hp"] = $detailuser['nomor_hp'];
        $responseJson["alamat"] = $detailuser['alamat'];
        $responseJson["restore_id"] = $detailuser['restore_id'];
    }

    echo json_encode($responseJson); 
});

$app->get('/kegiatans[/{params:.*}]', function ($request, $response, $args) use ($app, $db) {
    $params = explode('/', $args['params']);
    if ($db->tb_kegiatan()->where('priode=?', $params[0])->count() == 0) {
            $responseJson["error"] = true;
            $responseJson["message"] = "Belum mengambil data";
        } else {
            $responseJson["error"] = false;
            $responseJson["message"] = "Berhasil mendapatkan data";
            foreach($db->tb_kegiatan()->where('priode=?', $params[0])->and('kloter=?', $params[1]) as $data){
            $responseJson['kegiatan'][] = array(
                'id_kegiatan' => $data['id_kegiatan'],
                'kloter' => $data['kloter'],
                'priode' => $data['priode'],
                'tanggal_keberangkatan' => $data['tanggal_keberangkatan'],
                'tanggal_kepulangan' => $data['tanggal_kepulangan'],
                'judul_kegiatan' => $data['judul_kegiatan'],
                'deskripsi_kegiatan' => $data['deskripsi_kegiatan']
                );
            }
        }
        echo json_encode($responseJson); 
});

//run App
$app->run();