import 'dart:convert';
// import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/analyzer.dart';
import 'package:reactive_forms/reactive_forms.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
  };

  runApp(const MaterialApp(home: Sort()));
}

class Sort extends StatefulWidget {
  const Sort({Key? key}) : super(key: key);

  @override
  Sorting createState() => Sorting();
}

class Sorting extends State<Sort> {
  // demonstration purposes and to simplify this example.
  final form = FormGroup(
    {'array': FormControl()},
  );

  int bubble = 0;
  int insertion = 0;
  int selection = 0;
  int heap = 0;
  int merge = 0;
  String get name => form.control('array').value;
  List<int> list = [];
  void bubblesort(List a) {
    Stopwatch stopwatch1 = Stopwatch()..start();
    //var a = [5,4,3,2,1];
    for (var i = 0; i < a.length; i++) {
      bool swaped = false;
      for (var j = i + 1; j < a.length; j++) {
        if (a[i] > a[j]) {
          var tmp = a[i];
          a[i] = a[j];
          a[j] = tmp;
          swaped = true;
        }
      }
      if (!swaped) break;
    }
    int stop = stopwatch1.elapsedMicroseconds;
    setState(() {
      bubble = stop;
    });
  }

  void insertionsort(List a) {
    Stopwatch stopwatch2 = Stopwatch()..start();
    for (var i = 0; i < a.length; i++) {
      var x = a[i], j = i;

      while (j > 0 && a[j - 1] > x) {
        a[j] = a[j - 1];
        a[j - 1] = x;
        j--;
      }

      a[j] = x;
    }
    int stop = stopwatch2.elapsedMicroseconds;
    setState(() {
      insertion = stop;
    });
  }

  void selectionsort(List a) {
    Stopwatch stopwatch3 = Stopwatch()..start();
    for (var i = a.length - 1; i >= 0; i--) {
      // ignore: prefer_typing_uninitialized_variables
      var first = 0, tmp;

      for (var j = 1; j <= i; j++) {
        if (a[j] > a[first]) first = j;
      }

      tmp = a[first];
      a[first] = a[i];
      a[i] = tmp;
    }
    int stop = stopwatch3.elapsedMicroseconds;
    setState(() {
      selection = stop;
    });
  }

  void heapify(List list, int n, int i) {
    int largest = i;
    int l = 2 * i + 1;
    int r = 2 * i + 2;

    if (l < n && list[l] > list[largest]) {
      largest = l;
    }

    if (r < n && list[r] > list[largest]) {
      largest = r;
    }

    if (largest != i) {
      swapList(list, i, largest);
      heapify(list, n, largest);
    }
  }

  void swapList(List list, int i, int largest) {
    int swap = list[i];
    list[i] = list[largest];
    list[largest] = swap;
  }

  void swap(List list, int i) {
    int temp = list[0];
    list[0] = list[i];
    list[i] = temp;
  }

  void heapSort(List list) {
    Stopwatch stopwatch4 = Stopwatch()..start();
    int n = list.length;
    for (int i = (n ~/ 2); i >= 0; i--) {
      heapify(list, n, i);
    }

    for (int i = n - 1; i >= 0; i--) {
      swap(list, i);
      heapify(list, i, 0);
    }
    int stop = stopwatch4.elapsedMicroseconds;
    setState(() {
      heap = stop;
    });
  }
//   void merges(List list, int leftIndex, int middleIndex, int rightIndex) {
//   int leftSize = middleIndex - leftIndex + 1;
//   int rightSize = rightIndex - middleIndex;

//   List leftList = new List(leftSize);
//   List rightList = new List(rightSize);

//   for (int i = 0; i < leftSize; i++) leftList[i] = list[leftIndex + i];
//   for (int j = 0; j < rightSize; j++) rightList[j] = list[middleIndex + j + 1];

//   int i = 0, j = 0;
//   int k = leftIndex;

//   while (i < leftSize && j < rightSize) {
//     if (leftList[i] <= rightList[j]) {
//       list[k] = leftList[i];
//       i++;
//     } else {
//       list[k] = rightList[j];
//       j++;
//     }
//     k++;
//   }

//   while (i < leftSize) {
//     list[k] = leftList[i];
//     i++;
//     k++;
//   }

//   while (j < rightSize) {
//     list[k] = rightList[j];
//     j++;
//     k++;
//   }
// }

  void mergeSort(List list, int leftIndex, int rightIndex) {
    Stopwatch stopwatch5 = Stopwatch()..start();
    if (leftIndex < rightIndex) {
      int middleIndex = (rightIndex + leftIndex) ~/ 2;

      mergeSort(list, leftIndex, middleIndex);
      mergeSort(list, middleIndex + 1, rightIndex);

      // merges(list, leftIndex, middleIndex, rightIndex);
    }
    int stop = stopwatch5.elapsedMicroseconds;
    setState(() {
      merge = stop;
    });
  }

  changetoarr() {
    list = List<int>.from(json.decode(name));
  }

  @override
  Widget build(BuildContext context) {
    // print(list);
    return Material(
      color: const Color.fromARGB(255, 21, 96, 139),
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          const SizedBox(height: 50),
          Text(
            'Sorting Algorithm Analyzer',
            style: GoogleFonts.firaCode(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          Center(
            child: SizedBox(
              width: 250,
              child: ReactiveForm(
                formGroup: form,
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      child: const Text('Visualizer'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Visual()),
                        );
                      },
                    ),
                    Text(
                      'Enter your array here:',
                      style: GoogleFonts.abel(
                          color: Colors.white,
                          fontSize: 18,
                          height: 2,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      color: Colors.white,
                      child: ReactiveTextField(
                        formControlName: 'array',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Array: ' + list.toString(),
            style: GoogleFonts.abel(
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 20,
                height: 1.8),
          ),
          ElevatedButton.icon(
            onPressed: () {
              changetoarr();
              bubblesort(list);
              heapSort(list);
              selectionsort(list);
              insertionsort(list);
              mergeSort(list, 0, list.length - 1);
            },
            icon: const Icon(Icons.sort),
            label: Text(
              'ANALYZE NOW',
              style: GoogleFonts.abel(
                  color: const Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
            width: 250,
            height: 55,
            child: Card(
                child: ListTile(
              leading: const FlutterLogo(size: 20.0),
              title: Text('Bubble Sort: ' + bubble.toString() + ' us',
                  style: GoogleFonts.abel(fontWeight: FontWeight.bold)),
            )),
          ),
          SizedBox(
            width: 250,
            height: 55,
            child: Card(
                child: ListTile(
              leading: const FlutterLogo(size: 20.0),
              title: Text('Heap Sort: ' + heap.toString() + ' us',
                  style: GoogleFonts.abel(fontWeight: FontWeight.bold)),
            )),
          ),
          SizedBox(
            width: 250,
            height: 55,
            child: Card(
                child: ListTile(
              leading: const FlutterLogo(size: 20.0),
              title: Text('Selection Sort: ' + selection.toString() + ' us',
                  style: GoogleFonts.abel(fontWeight: FontWeight.bold)),
            )),
          ),
          SizedBox(
            width: 250,
            height: 55,
            child: Card(
                child: ListTile(
              leading: const FlutterLogo(size: 20.0),
              title: Text(
                'Insertion Sort: ' + insertion.toString() + ' us',
                style: GoogleFonts.abel(fontWeight: FontWeight.bold),
              ),
            )),
          ),
          SizedBox(
            width: 250,
            height: 55,
            child: Card(
                child: ListTile(
              leading: const FlutterLogo(size: 20.0),
              title: Text(
                'Merge Sort: ' + merge.toString() + ' us',
                style: GoogleFonts.abel(fontWeight: FontWeight.bold),
              ),
            )),
          ),
        ]),
      ),
    );
  }
}

class Analyzer extends StatelessWidget {
  const Analyzer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
