import 'dart:io';

void linearSearch(List<int> data, int keyword) {
  bool found = false;
  for (int i = 0; i < data.length; i++) {
    if (data[i] == keyword) {
      print('Data ditemukan pada index $i: ${data[i]}');
      found = true;
    }
  }
  if (!found) {
    print('Data tidak ditemukan.');
  }
}

void main() {
  List<int> data = [3, 8, 2, 5, 3, 7, 9, 3];
  print('Masukkan kata kunci yang ingin dicari:');
  int keyword = int.parse(stdin.readLineSync()!);  // Membaca input dari pengguna
  linearSearch(data, keyword);
}
