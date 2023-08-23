// Drajat Danu Wardana_Technical_Tradeasia


import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/Detailprodukmodel.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  //API UNTUK CARD 
  Future<Product> fetchProduct() async {
    final response = await http.get(Uri.parse('https://tradeasia.sg//en/dipentene'));
    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load product data');
    }
  }
//END API UNTUK CARD 

  //API IMAGE
  Future<Uint8List> fetchImage() async {
  final response = await http.get(Uri.parse('https://chemtradea.chemtradeasia.com//images/product/dipentene.webp'));

  if (response.statusCode == 200) {
    return Uint8List.fromList(response.bodyBytes);
  } else {
    throw Exception('Failed to load image');
  }
}
//END API IMAGE
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [
            Stack(children: [
              //UI API IMAGE
             FutureBuilder<Uint8List>(
  future: fetchImage(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return Center(
        child: Container(
          child: Image.memory(
            Uint8List.fromList(snapshot.data!),
            fit: BoxFit.cover,
            width: 900,
            height: 300,
          ),
        ),
      );
    }
  },
),
//END UI API IMAGE

              // FORM SEARCH
              Center(
                child: Row(
                  children: [
                    Container(
                      
                      decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      ),
                      
                      margin: EdgeInsets.only(top: 40, left: 45),
                      
                      width: 300,
                     
                      child: TextField(
                        
                        decoration:
                         InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Dipentene"),
                       
                      ),
                      
                    ),
                    
                           Container(
                            margin: EdgeInsets.only(top: 35),
                             child: IconButton(
                         onPressed: () {},
                        icon: Icon(Icons.shop), 
                        color: Colors.blue[900],
                         ),
                           ),
                  ],
                ),
              ),
              //CARD KE 1
              Container(
                margin: EdgeInsets.only(top: 250, left: 20,right: 20),
                 //keperluan API
                child: FutureBuilder<Product>(
                future: fetchProduct(),
                builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                 return CircularProgressIndicator();
               } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
                } else {
                 final product = snapshot.data!;
                  //keperluan API
                return Card(
                  elevation: 4, 
                  child: Column(children: [
                    ListTile(
                      leading: Icon(Icons.share),
                      title: Text(product.detailProduct.productName),
                    ),
                    ListTile(
                      title: Text('CAS Number :'),
                      subtitle: Text(product.detailProduct.casNumber),
                    ),
                    ListTile(
                      title: Text('Hs Code'),
                      subtitle: Text(product.detailProduct.hsCode),
                    ),
                    ListTile(
                      title: Text('Formula'),
                      subtitle: Text(product.detailProduct.formula),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 30),
                      child: ButtonBar(
                        children: [
                          RaisedButton(
                            color: Colors.blue[900],
                            onPressed: () {},
                            child: Text('DOWNLOAD TDS'),
                          ),
                          RaisedButton(
                            color: Colors.blue[900],
                            onPressed: () {},
                            child: Text('DOWNLOAD MSDS'),
                          )
                        ],
                      ),
                    ),
                  ]),
                );
               }
               }
                )
              ),
              
            ]),
            //CARD KE 2
            Container(
                margin: EdgeInsets.only(top: 10, left: 20,right: 20),
                 //keperluan API
                child: FutureBuilder<Product>(
                future: fetchProduct(),
                builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                 return CircularProgressIndicator();
               } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
                } else {
                 final product = snapshot.data!;
                  //keperluan API
                return Card(
                  elevation: 4, 
                  child: Column(children: [
                    ListTile(
                      
                      title: Text("Basic Information"),
                    ),
                    ListTile(
                      title: Text('IUPAC Name :'),
                      subtitle: Text(product.detailProduct.iupacName),
                    ),
                    ListTile(
                      title: Text('Apperance'),
                      subtitle: Text('Clear Liquid'),
                    ),
                    ListTile(
                      title: Text('Common Name'),
                      subtitle: Text('Dipentene'),
                    ),
                    ListTile(
                      title: Text('Packaging'),
                      subtitle: Text(product.detailProduct.packagingName),
                    ),
                
                    
                  ]),
                );
                }
                }
                )
              ),
              //CARD KE 3
              Container(
                margin: EdgeInsets.only(top: 10, left: 20,right: 20),
                 //keperluan API
                child: FutureBuilder<Product>(
                future: fetchProduct(),
                builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                 return CircularProgressIndicator();
               } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
                } else {
                 final product = snapshot.data!;
                  //keperluan API
                return Card(
                  elevation: 4, 
                  child: Column(children: [
                    ListTile(
                      
                      title: Text("Industry"),
                    ),
                     for (var industry in product.listIndustry)
                     RaisedButton(
                            color: Colors.grey,
                            onPressed: () {},
                            child: Text(industry.industryName),
                          ),
                      for (var industry in product.listIndustry)
                          RaisedButton(
                            color: Colors.grey,
                            onPressed: () {},
                            child: Text(industry.industryName),
                          ),
                      for (var industry in product.listIndustry)
                           RaisedButton(
                            color: Colors.grey,
                            onPressed: () {},
                            child: Text(industry.industryName),
                          ),
                          for (var industry in product.listIndustry)
                          RaisedButton(
                            color: Colors.grey,
                            onPressed: () {},
                            child: Text(industry.industryUrl),
                          )
                    
                  ]),
                );
                }
                }
                )
              ),
              //CARD KE 4 DAN 5
              Container(
                margin: EdgeInsets.only(top: 10, left: 20,right: 20),
                //keperluan API
                child: FutureBuilder<Product>(
                future: fetchProduct(),
                builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                 return CircularProgressIndicator();
               } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
                } else {
                 final product = snapshot.data!;
                  //keperluan API
                return Card(
                  elevation: 4, 
                  child: Column(children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                          child: Material(
                                  child: InkWell(
                                    splashColor: Colors.amber,
                                    onTap: (){},
                                    child: Text("Description",
                                    style: TextStyle(color: Colors.blueAccent, fontSize: 20),),
                                    ),
                                  ),
                                   ),
                                Container(
                                  margin: EdgeInsets.only(left: 120, top: 10, bottom: 10),
                                  child: Material(
                            child: InkWell(
                              splashColor: Colors.amber,
                              onTap: (){},
                              child: Text("Application",
                              style: TextStyle(color: Colors.blueAccent, fontSize: 20),),
                              ),
                            ),
                                ),
                      ],
                    ),
                          
                    ListTile(
                      title: Text('Brief Overview' ),
                      subtitle: Text(
                        product.detailProduct.description, 
                        overflow: 
                        TextOverflow.ellipsis, 
                        maxLines: 5,),
                    ),
                    ListTile(
                      title: Text('Manufacting Proces'),
                      subtitle: Text(
                        product.detailProduct.description, 
                        overflow: TextOverflow.ellipsis, 
                        maxLines: 5,),
                    ),
                    Container(
                margin: EdgeInsets.only(top: 10, left: 20,right: 20),
                child: Card(
                  elevation: 4, 
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(right: 30),
                      child: Column(
                        children: [
                          Material(
                            child: InkWell(
                              splashColor: Colors.amber,
                              onTap: (){},
                              child: Center(
                              child: Text("Selengkapnya",
                              style: TextStyle(color: Colors.blueAccent),),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                         onPressed: () {},
                        icon: Icon(Icons.message), 
                        color: Colors.blue[900], 
                        
                         ),
                         IconButton(
                         onPressed: () {},
                        icon: Icon(Icons.shop), 
                        color: Colors.blue[900],
                         ),
                         ButtonBar(
                            children: [
                              
                              RaisedButton(
                                
                                color: Colors.blue[900],
                                onPressed: () {},
                                child: Text('Send Inquiry'),
                              )
                            ],
                          ),
                      ],                 
                    )                 
                  ]),
                ),                                   
                )
                ]
                ),
                );
                }
                }
                )
              ),
          ],
        ),
      ),
    );
  }
}
