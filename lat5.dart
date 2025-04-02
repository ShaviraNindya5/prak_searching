import 'dart:io';

class Pegawai {
  String nip;
  String nama;

  Pegawai(this.nip, this.nama);

  @override
  String toString() {
    return 'NIP: $nip, Nama: $nama';
  }
}

// Fungsi Linear Search untuk mencari data pegawai berdasarkan NIP, Nama, atau keduanya
List<int> linearSearch(List<Pegawai> data, {String? nip, String? nama}) {
  List<int> hasilIndex = [];

  for (int i = 0; i < data.length; i++) {
    bool cocokNIP = (nip == null || data[i].nip == nip);
    bool cocokNama = (nama == null || data[i].nama.toLowerCase() == nama.toLowerCase());

    if (cocokNIP && cocokNama) {
      hasilIndex.add(i);
    }
  }

  return hasilIndex;
}

// Fungsi untuk menyisipkan data sebelum atau sesudah data kunci
void sisipkanData(List<Pegawai> data, Pegawai pegawaiBaru, int index, bool sebelum) {
  if (index >= 0 && index < data.length) {
    data.insert(sebelum ? index : index + 1, pegawaiBaru);
  }
}

// Fungsi untuk menghapus data berdasarkan index
void hapusData(List<Pegawai> data, int index) {
  if (index >= 0 && index < data.length) {
    data.removeAt(index);
  }
}

void main() {
  List<Pegawai> dataPegawai = [
    Pegawai("101", "Shavira"),
    Pegawai("102", "Nindya"),
    Pegawai("103", "Citra"),
    Pegawai("104", "Dewi"),
    Pegawai("105", "Putri"),
  ];

  while (true) {
    print("\n--- Menu ---");
    print("1. Tampilkan Data Pegawai");
    print("2. Cari Pegawai");
    print("3. Tambah Pegawai (Sisipkan)");
    print("4. Hapus Pegawai");
    print("5. Keluar");
    stdout.write("Pilih menu: ");
    String? pilihan = stdin.readLineSync();

    if (pilihan == "1") {
      print("\nData Pegawai:");
      for (int i = 0; i < dataPegawai.length; i++) {
        print("$i. ${dataPegawai[i]}");
      }
    } else if (pilihan == "2") {
      stdout.write("Masukkan NIP (opsional, tekan enter jika tidak ada): ");
      String? nip = stdin.readLineSync();
      stdout.write("Masukkan Nama (opsional, tekan enter jika tidak ada): ");
      String? nama = stdin.readLineSync();

      List<int> hasil = linearSearch(
        dataPegawai,
        nip: nip!.isNotEmpty ? nip : null,
        nama: nama!.isNotEmpty ? nama : null,
      );

      if (hasil.isNotEmpty) {
        print("\nPegawai ditemukan:");
        for (int index in hasil) {
          print("$index. ${dataPegawai[index]}");
        }
      } else {
        print("\nPegawai tidak ditemukan.");
      }
    } else if (pilihan == "3") {
      stdout.write("Masukkan NIP Pegawai Baru: ");
      String nipBaru = stdin.readLineSync()!;
      stdout.write("Masukkan Nama Pegawai Baru: ");
      String namaBaru = stdin.readLineSync()!;

      stdout.write("Masukkan NIP/Nama untuk lokasi penyisipan: ");
      String kunci = stdin.readLineSync()!;
      stdout.write("Sisipkan sebelum (y/n)? ");
      bool sebelum = stdin.readLineSync()!.toLowerCase() == "y";

      List<int> hasil = linearSearch(dataPegawai, nip: kunci, nama: kunci);
      if (hasil.isNotEmpty) {
        sisipkanData(dataPegawai, Pegawai(nipBaru, namaBaru), hasil[0], sebelum);
        print("\nPegawai berhasil disisipkan.");
      } else {
        print("\nData kunci tidak ditemukan.");
      }
    } else if (pilihan == "4") {
      stdout.write("Masukkan NIP/Nama Pegawai yang ingin dihapus: ");
      String kunci = stdin.readLineSync()!;

      List<int> hasil = linearSearch(dataPegawai, nip: kunci, nama: kunci);
      if (hasil.isNotEmpty) {
        for (int index in hasil.reversed) {
          hapusData(dataPegawai, index);
        }
        print("\nPegawai berhasil dihapus.");
      } else {
        print("\nPegawai tidak ditemukan.");
      }
    } else if (pilihan == "5") {
      print("Terima kasih!");
      break;
    } else {
      print("Pilihan tidak valid.");
    }
  }
}
