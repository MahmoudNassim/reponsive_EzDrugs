// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:app01/Constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class drugDetailDr extends StatefulWidget {
  final int drugId;
  final String drugname;

  const drugDetailDr({
    Key? key,
    required this.drugId,
    required this.drugname,
  }) : super(key: key);

  @override
  _drugDetailDrState createState() => _drugDetailDrState();
}

class _drugDetailDrState extends State<drugDetailDr> {
  var result;
  var counter = 0;
  var counter2 = 0;

  @override
  void initState() {
    super.initState();
    fetchDrug('${widget.drugId}', widget.drugname);
  }

  Future fetchDrug(String id, String name) async {
    var response =
        await http.get(Uri.parse('https://api.ezdrug.tech/Drug/$id'));
    if (response.statusCode == 200) {
      var obj = json.decode(response.body);
      result = obj['drug'];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drugname),
        centerTitle: true,
        backgroundColor: AppColor.primaryAppColor,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: Center(
        child: result == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
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
                              result['imageURL'],
                              width: double.infinity,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                result['name'],
                                style: const TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                '${result['dosageForm']}, ${result['dosageStrength']}',
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
                                result['description'],
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              Row(
                                children: [
                                  Text(
                                    "Dose : ",
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          counter--;
                                        });
                                      },
                                      icon: Icon(Icons.remove)),
                                  Text("$counter"),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          counter++;
                                        });
                                      },
                                      icon: Icon(Icons.add)),
                                ],
                              ),
                              const SizedBox(height: 4.0),
                              Row(
                                children: [
                                  Text(
                                    "Dosage : ",
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          counter2--;
                                        });
                                      },
                                      icon: Icon(Icons.remove)),
                                  Text("$counter2"),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          counter2++;
                                        });
                                      },
                                      icon: Icon(Icons.add)),
                                ],
                              ),
                              const SizedBox(height: 15.0),
                              Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Container(
                                width: double.infinity,
                                height: 60,
                                child: ElevatedButton(
                                    onPressed: () {
                                    },
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                AppColor.primaryButtonColor),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ))),
                                    child: const Text(
                                      'Add to Prescription',
                                      style: TextStyle(
                                          color: AppColor.white, fontSize: 20),
                                    )),
                              ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
