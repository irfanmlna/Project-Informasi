<?php
$koneksi = mysqli_connect("localhost", "root", "", "db_informasi");
if ($koneksi) {
    // echo "Berhasil konek ke database";
} else {
    echo "Gagal koneksi";
}
