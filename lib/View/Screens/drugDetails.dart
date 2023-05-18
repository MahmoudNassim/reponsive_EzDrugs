// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:app01/Constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class drugDetail extends StatelessWidget {
  static var result  ;
Future fetchDrug(String id,String name) async{
    var response = await http.get(Uri.parse('https://api.ezdrug.tech/Drug/$id'));
    if(response.statusCode ==200){
      var obj = json.decode(response.body);
      result = obj['drug'];
      return result;
    }
  }
  final int drugId;
  final String drugname;

  const drugDetail({
    Key? key,
    required this.drugId,
    required this.drugname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    fetchDrug('$drugId', drugname);
    return Scaffold(
      appBar: AppBar(
        title:  Text(drugname),
        centerTitle: true,
        backgroundColor: AppColor.primaryAppColor,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
      ),
      body: Center(  
        child: FutureBuilder(
          future: fetchDrug('${drugId}','${drugname}'),
          builder: (context, snapshot){
            if (!snapshot.hasData) {
              return const Center(child:CircularProgressIndicator(),);
            }
            var drug = snapshot.data;
        return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: MediaQuery.of(context).size.width * 0.4,
                    child: Image.network(
                      drug['imageURL'],
                      width: double.infinity,
                      
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        drug['name'],
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        '${drug['dosageForm']}, ${drug['dosageStrength']}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Description:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        drug['description'],
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Price: ${drug['price']} LE ',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Stock: ${drug['stock']}',
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Side Effects:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        drug['sideEffects'],
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
        
  }
  )));
  }
}
