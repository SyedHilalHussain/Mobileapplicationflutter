import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Homepage(),
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8, // Set width to 80% of screen width
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome asdasjhakdahi asdasiodhas',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print('hello');
                        },
                        child: Text('Left'),
                        style:  ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Background color
                          foregroundColor: Colors.white, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5), // Rounded corners
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Padding
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print('hello');
                        },
                        child: Text('Right'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,

                   children:[
                     Expanded(

                       child: TextField(

                           decoration: InputDecoration(
                             labelText: 'Enter text',
                             focusedBorder:OutlineInputBorder(
                               borderRadius: BorderRadius.circular(12),
                                 borderSide: BorderSide(color: Colors.blue,width: 2)
                             ),
                             enabledBorder:OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(12),
                                 borderSide: BorderSide(color: Colors.yellow,width: 1)
                             ),
                             disabledBorder:OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(12),
                                 borderSide: BorderSide(color: Colors.cyan,width: 3)
                             ),
                             border: UnderlineInputBorder(),
                           ),


                       ),

                     ),
                     SizedBox(width: 20),
                     Expanded(
                       child:  TextField(
                         decoration: InputDecoration(
                           labelText: 'Enter text',
                           border: UnderlineInputBorder(),
                         ),

                       ),

                     ),],
                 ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print('hello');
                        },
                        child: Text('Left'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print('hello');
                        },
                        child: Text('Right'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
