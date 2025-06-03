# navigation
Siti Intan Nia  : 4522210054
## Tujuan Praktikum
Praktikum ini bertujuan untuk mempelajari dan mempraktikkan penggunaan navigasi antar layar (screen) dalam Flutter dengan menerapkan named routes dan MaterialPageRoute. Melalui pendekatan ini, pengguna dapat berpindah antar berbagai layar dalam aplikasi serta mengirimkan data dari satu layar ke layar lainnya
## Penjelasan Singkat
Terdapat beberapa layar utama yang diimplementasikan, antara lain:
- Home Screen: Layar utama yang menampilkan tombol navigasi untuk berpindah ke layar lain.
- Detail Screen: Layar yang menampilkan data yang diteruskan dari HomeScreen atau menggunakan named route.
- Settings Screen: Layar pengaturan yang menampilkan data argumen yang dikirimkan melalui Navigator.pushNamed.
- About Screen: Layar yang menjelaskan tujuan aplikasi.
## Home Screen
![image](https://github.com/user-attachments/assets/22d11df6-da79-410a-9989-d5c3aa40fd88)
## Detail Screen
![image](https://github.com/user-attachments/assets/e4429cc7-54e7-4e34-b5ae-a717a0af9697)
## Settings Screen
![image](https://github.com/user-attachments/assets/3ec69853-0345-4bd3-b7be-21c1b20f66cc)
## About Screen
![image](https://github.com/user-attachments/assets/c0bee870-2b34-4635-9755-76bcba6d1321)
## Penjelasan Program
1. Navigasi menggunakan pendekatan Navigator 1.0 dilakukan dengan dua cara utama:
* Navigator.push() untuk berpindah layar menggunakan parameter langsung melalui konstruktor.
* Navigator.pushNamed() untuk navigasi berdasarkan nama rute (named route).
2. Daftar rute yang digunakan didefinisikan di dalam properti routes pada widget MaterialApp, yaitu:
* '/' → HomeScreen
* '/detail' → DetailScreen
* '/settings' → SettingsScreen
* '/about' → AboutScreen
3. Pada layar HomeScreen, tersedia empat tombol untuk navigasi ke:
* DetailScreen dengan mengirim data langsung melalui konstruktor (menggunakan push).
* DetailScreen menggunakan named route.
* SettingsScreen dengan menyertakan data (seperti username) melalui arguments.
* AboutScreen menggunakan named route.
4. Layar DetailScreen menerima data melalui parameter konstruktor, sedangkan SettingsScreen mendapatkan data menggunakan ModalRoute.of(context)?.settings.arguments.
5. AboutScreen menampilkan informasi seperti versi dan deskripsi aplikasi.
6. Antarmuka pengguna dibangun menggunakan widget dasar Flutter seperti Scaffold, AppBar, Column, Center, Text, ElevatedButton, dan SizedBox

