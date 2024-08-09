// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   int _selectedIndex = 0;
//
//   final List<Widget> _screens = [
//     StackExample(),
//     GridViewExample(),
//     ListViewExample(),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter Exercises'),
//         ),
//         body: _screens[_selectedIndex],
//         bottomNavigationBar: BottomNavigationBar(
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.layers),
//               label: 'Stack',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.grid_on),
//               label: 'GridView',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.list),
//               label: 'ListView',
//             ),
//           ],
//           currentIndex: _selectedIndex,
//           selectedItemColor: Colors.blue,
//           onTap: _onItemTapped,
//         ),
//       ),
//     );
//   }
// }
//
// // Exercise 1: Stack Widget with Background Image, Semi-Transparent Overlay, and Centered Text
// class StackExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         // Background image
//         Image.asset(
//           'assets/images/logo_flutter.jpg', // Ensure you have an image in assets
//           fit: BoxFit.cover,
//         ),
//         // Semi-transparent overlay
//         Container(
//           color: Colors.black.withOpacity(0.5),
//           padding: const EdgeInsets.all(16.0),
//         ),
//         // Centered text
//         Center(
//           child: Text(
//             'Centered Text',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// // Exercise 2: GridView with 3 Columns
// class GridViewExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 100, // Number of columns
//           crossAxisSpacing: 2.0,
//           mainAxisSpacing: 3.0,
//         ),
//         itemCount: 100, // Number of items in the grid
//         itemBuilder: (context, index) {
//           return Container(
//             color: Colors.lightBlue,
//             child: Center(
//               child: Text(
//                 '${index + 1}',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// // Exercise 3: ListView of ListTiles
// class ListViewExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.all(8.0),
//       children: [
//         ListTile(
//           leading: CircleAvatar(
//             child: Text('MD'),
//           ),
//           title: Text('Maaz Nadeem'),
//           trailing: Icon(Icons.arrow_forward),
//           contentPadding: EdgeInsets.all(8.0),
//         ),
//         ListTile(
//           leading: CircleAvatar(
//             child: Text('AB'),
//           ),
//           title: Text('Alice Brown'),
//           subtitle: Text('Subtitle 1'),
//           contentPadding: EdgeInsets.all(8.0),
//         ),
//         ListTile(
//           leading: CircleAvatar(
//             child: Text('CD'),
//           ),
//           title: Text('Charlie Davis'),
//           subtitle: Text('Subtitle 2'),
//           contentPadding: EdgeInsets.all(8.0),
//         ),
//         ListTile(
//           leading: CircleAvatar(
//             backgroundImage: AssetImage('images/logo_flutter.jpg'), // Ensure you have an image in assets
//           ),
//           title: Text('Image Avatar'),
//           contentPadding: EdgeInsets.all(8.0),
//           onTap: () {
//             print('Tile tapped');
//           },
//         ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double weight = 60.0;
  double heightFeet = 5.0;
  double heightInches = 6.0;
  String result = "";
  var bg = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Container(
            color: bg,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 21),
                Text('Weight: ${weight.toInt()} kg'),
                Slider(
                  value: weight,
                  min: 30,
                  max: 150,
                  divisions: 120,
                  label: weight.toInt().toString(),
                  onChanged: (val) {
                    setState(() {
                      weight = val;
                    });
                  },
                ),
                SizedBox(height: 10),
                Text('Height: ${heightFeet.toInt()} feet ${heightInches.toInt()} inches'),
                Slider(
                  value: heightFeet,
                  min: 3,
                  max: 8,
                  divisions: 5,
                  label: heightFeet.toInt().toString(),
                  onChanged: (val) {
                    setState(() {
                      heightFeet = val;
                    });
                  },
                ),
                Slider(
                  value: heightInches,
                  min: 0,
                  max: 11,
                  divisions: 11,
                  label: heightInches.toInt().toString(),
                  onChanged: (val) {
                    setState(() {
                      heightInches = val;
                    });
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    var totalInches = (heightFeet * 12) + heightInches;
                    var heightCm = totalInches * 2.54;
                    var heightM = heightCm / 100;
                    var bmi = weight / (heightM * heightM);
                    var msg = "";

                    if (bmi > 25) {
                      msg = "You are overweight";
                      bg = Colors.orange.shade200;
                    } else if (bmi < 18) {
                      msg = "You are underweight";
                      bg = Colors.red.shade300;
                    } else {
                      msg = "You are healthy";
                      bg = Colors.green.shade200;
                    }

                    setState(() {
                      result = "$msg \nYour BMI is: ${bmi.toStringAsFixed(2)}";
                    });
                  },
                  child: Text('Calculate'),
                ),
                SizedBox(height: 16),
                Text(
                  result,
                  style: TextStyle(fontSize: 19),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
