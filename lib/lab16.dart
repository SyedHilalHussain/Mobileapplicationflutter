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
  RangeValues _currentRangeValues = const RangeValues(20, 80);
  List<int> numbers = List.generate(100, (index) => index + 1);
  List<int> filteredNumbers = [];

  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.brown,
    Colors.grey,
  ];
  int selectedColorIndex = 0;

  @override
  void initState() {
    super.initState();
    filteredNumbers = numbers
        .where((number) => number >= _currentRangeValues.start && number <= _currentRangeValues.end)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Range Slider to Filter Numbers',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            RangeSlider(
              values: _currentRangeValues,
              min: 1,
              max: 100,
              divisions: 100,
              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                  filteredNumbers = numbers
                      .where((number) => number >= _currentRangeValues.start && number <= _currentRangeValues.end)
                      .toList();
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredNumbers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredNumbers[index].toString()),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Select a Color',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListWheelScrollView(
                itemExtent: 50,
                diameterRatio: 2,
                onSelectedItemChanged: (index) {
                  setState(() {
                    selectedColorIndex = index;
                  });
                },
                children: colors.map((color) {
                  return Container(
                    width: double.infinity,
                    height: 100,
                    color: color,
                  );
                }).toList(),
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              color: colors[selectedColorIndex],
              child: Center(
                child: Text(
                  'Selected Color',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
