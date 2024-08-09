import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Map<String, dynamic> mapResponse = {};
  List<dynamic> dataList = [];
  bool isLoading = true;
  String errorMessage = '';

  Future<void> apicall() async {
    try {
      final response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
      if (response.statusCode == 200) {
        setState(() {
          mapResponse = json.decode(response.body);
          dataList = mapResponse['data'];
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load data';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'An error occurred: $e';
        isLoading = false;
      });
    }
  }

  Future<void> postData() async {
    try {
      final response = await http.post(
        Uri.parse("https://reqres.in/api/users"),
        body: json.encode({
          "name": "morpheus",
          "job": "leader",
        }),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 201) {
        print('POST successful: ${response.body}');
      } else {
        print('Failed to POST data');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  Future<void> putData(int id) async {
    try {
      final response = await http.put(
        Uri.parse("https://reqres.in/api/users/$id"),
        body: json.encode({
          "name": "morpheus",
          "job": "zion resident",
        }),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        print('PUT successful: ${response.body}');
      } else {
        print('Failed to PUT data');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  Future<void> deleteData(int id) async {
    try {
      final response = await http.delete(
        Uri.parse("https://reqres.in/api/users/$id"),
      );
      if (response.statusCode == 204) {
        print('DELETE successful: ${response.body}');
      } else {
        print('Failed to DELETE data');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    apicall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: postData,
          ),
          IconButton(
            icon: Icon(Icons.update),
            onPressed: () => putData(2), // Example ID
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => deleteData(2), // Example ID
          ),
        ],
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : errorMessage.isNotEmpty
            ? Text(errorMessage)
            : ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.network(dataList[index]['avatar']),
              title: Text('${dataList[index]['first_name']} ${dataList[index]['last_name']}'),
              subtitle: Text(dataList[index]['email']),
              trailing: const Icon(Icons.phone),
            );
          },
        ),
      ),
    );
  }
}
