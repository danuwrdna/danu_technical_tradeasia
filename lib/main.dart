import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
     appBar: AppBar(
      backgroundColor: Colors.white,
          title: Text('Search App'),
          actions: [
           TextField(
               decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                
              },
            ),
               ),
           ),
          ],
        ),
      body: Container(
        
        margin: EdgeInsets.only(top: 50, left: 15),
        child: Column(
 children: [Text("Dipetence"),
 Row(
  mainAxisAlignment: MainAxisAlignment.center,
children: [Container

(margin: EdgeInsets.all(15),
  child:  Text("CasNumber")),
  Container( margin: EdgeInsets.all(15),
child: Text("Hscode")),
Container( margin: EdgeInsets.all(15),
child: Text("Formula")),
 ]


                 
 ),


 RaisedButton(onPressed: (){},child: Text("Download TDS", ),
 

                 
 ),
 RaisedButton(onPressed: (){},child: Text("Download MSDS",)
 ),
 Container(
  margin: EdgeInsets.all(15),
  child: Text("Basic Information"),
  
 ),
 Container(
  margin: EdgeInsets.all(15),
  child: Text("IUPAC name"),
 ),
 Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Container(
  
  child: Text("c10h6"),
 ),
  ],
 )
 ],
 
 
 
        ),
        
      )
        )
        ) ;
  }
}