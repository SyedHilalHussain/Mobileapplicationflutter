// // File path: lib/main.dart
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Student Name',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   final List<Color> avatarColors = [
//     Colors.red,
//     Colors.green,
//     Colors.blue,
//     Colors.yellow,
//     Colors.orange,
//     Colors.purple,
//     Colors.orange,
//     Colors.purple,
//     Colors.yellow,
//     Colors.orange,
//     Colors.purple,
//     Colors.orange,
//     Colors.purple,
//     Colors.orange,
//     Colors.purple,
//
//   ];
//
//   void _showSnackbar(BuildContext context, String colorName) {
//     final snackBar = SnackBar(
//       content: Text('Tapped on $colorName'),
//     );
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     print('hello $colorName');
//   }
//   void _hellow(){
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Student Name'),
//       ),
//       body: Center(
//
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//
//             children: avatarColors.map((color) {
//               return InkWell(
//                 onTap: () => _showSnackbar(context, colorToString(color)),
//
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: CircleAvatar(
//                     radius: 30,
//                     backgroundColor: color,
//                     child:Icon( Icons.person ,color: Colors.white,),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       ),
//     );
//   }
//
//   String colorToString(Color color) {
//     if (color == Colors.red) return 'Red';
//     if (color == Colors.green) return 'Green';
//     if (color == Colors.blue) return 'Blue';
//     if (color == Colors.yellow) return 'Yellow';
//     if (color == Colors.orange) return 'Orange';
//     if (color == Colors.purple) return 'Purple';
//     return 'Unknown Color';
//   }
// }

// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ScrollView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScrollViewDemo(),
    );
  }
}

class ScrollViewDemo extends StatefulWidget {
  @override
  _ScrollViewDemoState createState() => _ScrollViewDemoState();
}

class _ScrollViewDemoState extends State<ScrollViewDemo> {
  final ScrollController _verticalScrollController = ScrollController();
  final ScrollController _horizontalScrollController = ScrollController();

  @override
  void dispose() {
    _verticalScrollController.dispose();
    _horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScrollView Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              controller: _verticalScrollController,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              children: List.generate(20, (index) => ListTile(title: Text('Vertical Item $index'))),
            ),
          ),
          Container(
            height: 200,
            child: ListView(
              controller: _horizontalScrollController,
              scrollDirection: Axis.horizontal,
              physics: ClampingScrollPhysics(),
              children: List.generate(
                20,
                    (index) => Container(
                  width: 150,
                  color: Colors.blue[(index % 9 + 1) * 100],
                  child: Center(child: Text('Horizontal Item $index')),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: List.generate(
                  50,
                      (index) => ListTile(title: Text('Nested Scroll Item $index')),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _verticalScrollController.animateTo(
            _verticalScrollController.position.maxScrollExtent,
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,
          );
        },
        child: Icon(Icons.vertical_align_bottom),
      ),
    );
  }
}

