// Fungsi untuk pencarian sequential
int sequentialSearch(List<int> arr, int x) {
  int comparisons = 0;
  for (int i = 0; i < arr.length; i++) {
    comparisons++;
    if (arr[i] == x) {
      print('Elemen ditemukan pada indeks $i');
      return comparisons;
    }
  }
  print('Elemen tidak ditemukan');
  return comparisons; 
}

// Fungsi untuk pencarian binary
int binarySearch(List<int> arr, int x) {
  int comparisons = 0;
  int left = 0;
  int right = arr.length - 1;
  
  while (left <= right) {
    comparisons++;
    int mid = (left + right) ~/ 2;
    
    if (arr[mid] == x) {
      print('Elemen ditemukan pada indeks $mid');
      return comparisons;
    } else if (arr[mid] < x) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  print('Elemen tidak ditemukan');
  return comparisons; 
}

void main() {
  List<int> sortedArray = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19];
  int target = 13;

  int sequentialComparisons = sequentialSearch(sortedArray, target);
  print('Jumlah perbandingan dengan pencarian sequential: $sequentialComparisons');

  int binaryComparisons = binarySearch(sortedArray, target);
  print('Jumlah perbandingan dengan pencarian binary: $binaryComparisons');
}
