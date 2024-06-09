<?php

header("Access-Control-Allow-Origin: header");
header("Access-Control-Allow-Origin: *");
include_once 'koneksi.php';

$id = $_POST['id'];
$nama = $_POST['nama'];

$query = "UPDATE pegawai SET nama = '$nama' WHERE id = $id";

$res = array();

if (mysqli_query($koneksi, $query)) {
  $cek = "SELECT * FROM pegawai WHERE id = $id";
  $result = mysqli_fetch_array(mysqli_query($koneksi, $cek));
  $res['is_success'] = true;
  $res['value'] = 1;
  $res['message'] = "Berhasil edit pegawai";
  $res['nama'] = $result['nama'];
  $res['id'] = $result['id'];
} else {
  $res['is_success'] = false;
  $res['value'] = 0;
  $res['message'] = "Gagal edit pegawai";
}

echo json_encode($res);

?>
