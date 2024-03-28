# KSM Technical Test

## Deskripsi
Ini adalah program Fizzbuzz dan Palindrome sederhana dengan menggunakan API.

## Cara Mengunduh dan Menjalankan Program
1. Pastikan Anda memiliki Node.js dan npm terinstal di komputer Anda.
2. Buka terminal atau command prompt.
3. Clone repositori dari GitHub:

```bash
git clone https://github.com/agusanaluam/ksm-test.git
```

4. Masuk ke direktori proyek:

```bash
cd ksm-test/api
```

5. Install Dependencies:

```bash
npm install
```

6. Jalankan app:
```bash
npm start
```
----------------------------------------------------------------
## Pengujian

Server akan berjalan di http://localhost:3000. emudian pengujian dapat dilakukan menggunakan Postman atau Curl dengan mengakses URL berikut:

### Fizzbuzz
API :
```bash
curl -X GET http://localhost:3000/api/fizzbuzz/{:num}
```
Ganti `{:num}` dengan angka yang akan di cek, contohnya :
```bash
curl -X GET http://localhost:3000/api/fizzbuzz/15
```

Sampel Response yang ditampilkan:
```bash
{"input":15,"output":"FizzBuzz"}
```

### Palindrome
API :
```bash
curl -X GET http://localhost:3000/api/palindrome/{:input}
```
Ganti `{:input}` dengan text yang akan di cek, contohnya :
```bash
curl -X GET http://localhost:3000/api/palindrome/radar
```

Sampel Response yang ditampilkan:
```bash
{"input":"radar","palindrome":true}
```

---

## Soal SQL
Jawaban dari Soal SQL yang diminta dapat diambil pada folder `sql/` 
