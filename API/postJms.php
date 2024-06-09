<?php

header("Access-Control-Allow-Origin: *");

include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Pastikan bahwa semua parameter yang diperlukan tersedia
    if (
        isset($_POST['sekolah_tujuan']) &&
        isset($_POST['nama_pemohon'])
    ) {
        $sekolah_tujuan = $_POST['sekolah_tujuan'];
        $nama_pemohon = $_POST['nama_pemohon'];

        // Simpan data ke database
        $sql = "INSERT INTO tb_jms (sekolah_tujuan, nama_pemohon) VALUES ('$sekolah_tujuan', '$nama_pemohon')";
        
        if ($koneksi->query($sql) === TRUE) {
            $response['isSuccess'] = true;
            $response['message'] = "Berhasil menambahkan permohonan";
        } else {
            $response['isSuccess'] = false;
            $response['message'] = "Gagal menambahkan permohonan: " . $koneksi->error;
        }
    } else {
        // Menyertakan nama parameter yang tidak lengkap dalam pesan kesalahan
        $response['isSuccess'] = false;
        $response['message'] = "Parameter tidak lengkap. Pastikan semua parameter (sekolah_tujuan, nama_pemohon) tersedia.";
    }
} else {
    $response['isSuccess'] = false;
    $response['message'] = "Metode yang diperbolehkan hanya POST";
}

echo json_encode($response);
?>
