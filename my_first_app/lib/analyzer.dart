import 'package:flutter/material.dart';
import 'package:my_first_app/algorithim.dart';

class Visual extends StatefulWidget {
  const Visual({Key? key}) : super(key: key);

  @override
  _VisualState createState() => _VisualState();
}

class _VisualState extends State<Visual> {
  String selected = 'Select a sorting Algorithm';
  List<int> arr = [
    100,
    90,
    102,
    80,
    100,
    50,
    40,
    103,
    80,
    100,
    20,
    78,
    95,
    90,
    54,
    32,
    81,
    100,
    20
  ];
  List<int> temp = [
    100,
    90,
    102,
    80,
    100,
    50,
    40,
    103,
    80,
    100,
    20,
    78,
    95,
    90,
    54,
    32,
    81,
    100,
    20
  ];
  _updateArrayWithDelay(List<int> updatedArr) async {
    await Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        arr = List.from(updatedArr);
      });
    });
  }

  Future<void> bubblesort(List a) async {
    for (var i = 0; i < a.length; i++) {
      bool swaped = false;
      for (var j = i + 1; j < a.length; j++) {
        if (a[i] > a[j]) {
          var tmp = a[i];
          a[i] = a[j];
          a[j] = tmp;
          swaped = true;
        }
        await Future.delayed(const Duration(milliseconds: 300), () {
          setState(() {
            a = a;
          });
        });
      }
      if (!swaped) break;
    }
  }

  selectionSortVisualiser(List a) async {
    // print('Selection sort visualiser called');
    List<int> selectArr = List.from(a);
    int minIndex, temp;

    for (int i = 0; i < selectArr.length - 1; i++) {
      minIndex = i;
      for (int j = i + 1; j < selectArr.length; j++) {
        if (selectArr[j] < selectArr[minIndex]) {
          minIndex = j;
        }
      }

      temp = selectArr[i];
      selectArr[i] = selectArr[minIndex];
      selectArr[minIndex] = temp;

      await Future.delayed(const Duration(milliseconds: 1000), () {
        setState(() {
          a = List.from(selectArr);
        });
      });
    }
  }

  _insertionSortVisualiser(List a) async {
    // print('Insertion sort visualiser called');
    List<int> insertArr = List.from(a);
    int key, j;

    for (int i = 1; i < insertArr.length; i++) {
      key = insertArr[i];
      j = i - 1;

      while (j >= 0 && insertArr[j] > key) {
        insertArr[j + 1] = insertArr[j];
        j = j - 1;
      }
      insertArr[j + 1] = key;
      await Future.delayed(const Duration(milliseconds: 1000), () {
        setState(() {
          arr = List.from(insertArr);
        });
      });
    }
  }

  _quickSortVisualiser(List<int> quickArr, int low, int high) async {
    // print('Quick sort visualiser called');
    int pivot;
    if (low < high) {
      /* pi is partitioning index, arr[pi] is now
           at right place */
      pivot = await _partition(quickArr, low, high);

      await _quickSortVisualiser(quickArr, low, pivot - 1); // Before pi
      await _quickSortVisualiser(quickArr, pivot + 1, high); // After pi
    }
  }

  //helper function to partition array for quicksort
  Future<int> _partition(List<int> quickArr, int low, int high) async {
    int pivot = quickArr[high];
    int i = (low - 1);
    int temp;
    for (int j = low; j <= high - 1; j++) {
      if (quickArr[j] < pivot) {
        i++;
        temp = quickArr[i];
        quickArr[i] = quickArr[j];
        quickArr[j] = temp;
        await _updateArrayWithDelay(quickArr);
      }
    }
    temp = quickArr[i + 1];
    quickArr[i + 1] = quickArr[high];
    quickArr[high] = temp;
    await _updateArrayWithDelay(quickArr);
    return (i + 1);
  }

  _mergeSortVisualiser(List<int> mergeArr, int low, int high) async {
    // print('Merge Sort called');
    // print('Array size is : "${mergeArr.length}"');
    if (low < high) {
      // Same as (l+r)/2, but avoids overflow for
      // large l and h
      int mid = (low + (high - low) / 2).toInt();
      // Sort first and second halves
      await _mergeSortVisualiser(mergeArr, low, mid);

      await _mergeSortVisualiser(mergeArr, mid + 1, high);

      await merge(mergeArr, low, mid, high);
      _updateArrayWithDelay(mergeArr);
    }
  }

  //helper function to merge the array for merge sort
  merge(List<int> mergeArr, int low, int mid, int high) async {
    int i, j, k;
    int n1 = mid - low + 1;
    int n2 = high - mid;

    /* create temp arrays */
    List<int> L = [], R = [];

    /* Copy data to temp arrays L[] and R[] */
    for (i = 0; i < n1; i++) {
      L.add(mergeArr[low + i]);
    } //L[i] = mergeArr[low + i];
    for (j = 0; j < n2; j++) {
      R.add(mergeArr[mid + 1 + j]);
    } //R[j] = mergeArr[mid + 1 + j];
    i = 0;
    j = 0;
    k = low;
    while (i < n1 && j < n2) {
      if (L[i] <= R[j]) {
        mergeArr[k] = L[i];
        i++;
      } else {
        mergeArr[k] = R[j];
        j++;
      }
      await _updateArrayWithDelay(mergeArr);
      k++;
    }

    while (i < n1) {
      mergeArr[k] = L[i];
      i++;
      k++;
    }

    while (j < n2) {
      mergeArr[k] = R[j];
      j++;
      k++;
    }
  }

  // _heapSortVisualiser(List<int> heapArr) async {
  //   int n = heapArr.length;

  //   // Build heap (rearrange array)
  //   for (int i = n ~/ 2 - 1; i >= 0; i--) await heapify(heapArr, n, i);

  //   // One by one extract an element from heap
  //   for (int i = n - 1; i >= 0; i--) {
  //     // Move current root to end
  //     int temp = heapArr[0];
  //     heapArr[0] = heapArr[i];
  //     heapArr[i] = temp;
  //     await _updateArrayWithDelay(heapArr);
  //     // call max heapify on the reduced heap
  //     await heapify(heapArr, i, 0);
  //   }
  // }

  heapify(List<int> heapArr, int n, int i) async {
    int largest = i;
    int l = 2 * i + 1;
    int r = 2 * i + 2;

    // If left child is larger than root
    if (l < n && heapArr[l] > heapArr[largest]) largest = l;

    // If right child is larger than largest so far
    if (r < n && heapArr[r] > heapArr[largest]) largest = r;
    // If largest is not root
    if (largest != i) {
      int swap = heapArr[i];
      heapArr[i] = heapArr[largest];
      heapArr[largest] = swap;
      await _updateArrayWithDelay(heapArr);
      // Recursively heapify the affected sub-tree
      await heapify(heapArr, n, largest);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 21, 96, 139),
      child: Column(children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Sort()),
            );
          },
          child: const Text('Analyzer',
              style: TextStyle(
                height: 1,
                fontSize: 15,
                color: Color.fromARGB(255, 255, 255, 255),
              )),
        ),
        TextButton(
          onPressed: () {
            bubblesort(arr);
          },
          child: const Text('BubbleSort',
              style: TextStyle(
                height: 2,
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255),
              )),
        ),
        TextButton(
          onPressed: () {
            _insertionSortVisualiser(arr);
          },
          child: const Text('InsertionSort',
              style: TextStyle(
                height: 2,
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255),
              )),
        ),
        TextButton(
          onPressed: () {
            _mergeSortVisualiser;
          },
          child: const Text('MergeBubble',
              style: TextStyle(
                height: 2,
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255),
              )),
        ),
        TextButton(
          onPressed: () {
            _partition;
          },
          child: const Text('SelectionSort',
              style: TextStyle(
                height: 2,
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255),
              )),
        ),
        TextButton(
          onPressed: () {
            _quickSortVisualiser;
          },
          child: const Text('HeapSort',
              style: TextStyle(
                height: 2,
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255),
              )),
        ),
        const SizedBox(height: 100),
        Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: arr.map((val) => _widget(val.toDouble())).toList()),
        )
      ]),
    );
  }
}

Widget _widget(double h) {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: Container(
        height: h * 2,
        width: 10,
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255))),
  );
}
