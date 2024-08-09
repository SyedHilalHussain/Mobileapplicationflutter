import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

    title:'flutter demo',
    debugShowCheckedModeBanner: false,
    theme:ThemeData(
    primarySwatch:Colors.lightBlue,
    ),
    home:MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>
{
  List<String> arrnames=[
    'ali','hilal','sssssssssssssssssssssssssssssal','ali','hilal','sssssssssssssssssssssssssssssal','ali',

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('ink well widget',style: TextStyle(fontSize: 26,color:Colors.white),),
    ),
    body:
    ListView.separated(itemBuilder: (context, index)
    {
    return  Container(
      decoration: BoxDecoration(
        color:Colors.blue,
        borderRadius:BorderRadius.circular(8),
        border:Border.all(
          width: 1,
          color: Colors.white,
        ),

      ),
      child:Padding(
      padding: const EdgeInsets.all(16.0),
     child: Row(
      children: [
        Icon(Icons.label, color: Colors.white,),
        SizedBox(width: 16),


        // flex:1,

      Text(arrnames[index],style: TextStyle(color: Colors.white),),


    ],
      ), ), );
    },
    itemCount: arrnames.length,
      separatorBuilder: (context,index){

        return Divider(height:30,thickness: 2);
      },
    ),



    );
  }
}