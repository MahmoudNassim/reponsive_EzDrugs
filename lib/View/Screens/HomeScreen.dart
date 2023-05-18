import 'dart:convert';

import 'package:app01/Constant/color.dart';
import 'package:app01/View/Screens/drug.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  static const RouteName = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static var result = [];
  Future fetchCategories() async {
    var response =
        await http.get(Uri.parse('https://api.ezdrug.tech/category'));
    if (response.statusCode == 200) {
      var obj = json.decode(response.body);
      result = obj['categories'];
      return result;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Customer Category'),
          centerTitle: true,
          backgroundColor: AppColor.primaryAppColor,
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.search)),
            
          ],
        ),
        body: Center(
            child: FutureBuilder(
                future: fetchCategories(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var categories = snapshot.data;
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: categories!.length,
                        itemBuilder: (context, index) {
                          var category = categories[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      drugs(categoryId: category['id']),
                                ),
                              );
                            },
                            child: Card(
                              color: AppColor.primaryAppColor,
                              
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: MediaQuery.of(context).size.width*0.2 ,
                                      child: Image.network(
                                        category["imageURL"],
                                        width: 150,
                                        height: 130,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      category["name"],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error}'),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })));
  }
}
