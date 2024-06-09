<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Ensure that the necessary parameters are available
    if (
        isset($_POST['nama']) &&
        isset($_POST['no_hp']) &&
        isset($_POST['no_ktp']) &&
        isset($_POST['bentuk_permasalahan'])
    ) {
        $nama = $_POST['nama'];
        $no_hp = $_POST['no_hp'];
        $no_ktp = $_POST['no_ktp'];
        $bentuk_permasalahan = $_POST['bentuk_permasalahan'];

        // Define the file upload path
        $upload_path = "../kejaksaan/files/"; // Adjust to your file storage location

        // Function to upload file
        function upload_file($file, $upload_path, $allowed_types = ['pdf']) {
            $file_ext = pathinfo($file['name'], PATHINFO_EXTENSION);

            // Check file extension
            if (!in_array(strtolower($file_ext), $allowed_types)) {
                return ['success' => false, 'message' => 'Format file tidak didukung'];
            }

            // Generate a unique file name
            $file_name = uniqid() . '.' . $file_ext;

            // Move the file to the upload location
            if (move_uploaded_file($file['tmp_name'], $upload_path . $file_name)) {
                return ['success' => true, 'file_name' => $file_name];
            } else {
                return ['success' => false, 'message' => 'Gagal mengunggah file'];
            }
        }

        // Upload KTP file if exists
        $file_ktp = null;
        if (isset($_FILES['file_ktp'])) {
            $upload_ktp = upload_file($_FILES['file_ktp'], $upload_path);
            if (!$upload_ktp['success']) {
                $response['isSuccess'] = false;
                $response['message'] = $upload_ktp['message'];
                echo json_encode($response);
                exit();
            }
            $file_ktp = $upload_ktp['file_name'];
        }

        // Upload report file if exists
        $file_laporan = null;
        if (isset($_FILES['file_laporan'])) {
            $upload_laporan = upload_file($_FILES['file_laporan'], $upload_path);
            if (!$upload_laporan['success']) {
                $response['isSuccess'] = false;
                $response['message'] = $upload_laporan['message'];
                echo json_encode($response);
                exit();
            }
            $file_laporan = $upload_laporan['file_name'];
        }

        // Save data to the database
        $sql = "INSERT INTO tb_penyuluhan (nama, no_hp, no_ktp, file_ktp, bentuk_permasalahan, file_laporan) 
                VALUES ('$nama', '$no_hp', '$no_ktp', '$file_ktp', '$bentuk_permasalahan', '$file_laporan')";
        
        if ($koneksi->query($sql) === TRUE) {
            $response['isSuccess'] = true;
            $response['message'] = "Berhasil menambahkan laporan";
        } else {
            $response['isSuccess'] = false;
            $response['message'] = "Gagal menambahkan laporan: " . $koneksi->error;
        }
    } else {
        $response['isSuccess'] = false;
        $response['message'] = "Parameter tidak lengkap";
    }
} else {
    $response['isSuccess'] = false;
    $response['message'] = "Metode yang diperbolehkan hanya POST";
}

echo json_encode($response);
?>