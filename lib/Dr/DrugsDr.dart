import 'package:app01/Constant/color.dart';
import 'package:app01/Dr/DrugsDetailsDr.dart';
import 'package:app01/View/Screens/Cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class drugsDr extends StatefulWidget {
  static const RouteName = 'drugsPage';
  final int categoryId;

  const drugsDr({
    Key? key,
    required this.categoryId,
  }) : super(key: key);
  @override
  State<drugsDr> createState() => _drugsDrState();
}

class _drugsDrState extends State<drugsDr> {
  var result = [];
  List<dynamic> _cart = [];
  var counter = 0;

  Future fetchDrugsByCategory(String id) async {
    var response = await http
        .get(Uri.parse('https://api.ezdrug.tech/Category/GetDrugs/${id}'));
    if (response.statusCode == 200) {
      var obj = json.decode(response.body);
      result = obj['drugs'];
      return result;
    }
  }

  Future<List<dynamic>> _getCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cart = prefs.getStringList('cart') ?? [];
    List<dynamic> decodedCart = cart.map((e) => json.decode(e)).toList();
    return decodedCart;
  }

  void _addToCart(dynamic drug) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cart = prefs.getStringList('cart') ?? [];
    bool exists = cart.any((d) => d == json.encode(drug));
    if (!exists) {
      setState(() {
        _cart.add(drug);
        counter++;
      });
      cart.add(json.encode(drug));
      await prefs.setStringList('cart', cart);
    }
  }

  void _removeFromCart(dynamic drug) async {
    setState(() {
      _cart.remove(drug);
      counter--;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cart = prefs.getStringList('cart') ?? [];
    cart.remove(json.encode(drug));
    await prefs.setStringList('cart', cart);
  }

  @override
  void initState() {
    super.initState();
    _getCart().then((cart) {
      setState(() {
        _cart = cart;
        counter = cart.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drugs Category'),
        centerTitle: true,
        backgroundColor: AppColor.primaryAppColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShoppingCart(
                        cart: _cart,
                        removeFromCart: _removeFromCart,
                        addtoCart: _addToCart,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.shopping_cart),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text("$counter"),
              )
            ],
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: fetchDrugsByCategory('${widget.categoryId}'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var categories = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: categories!.length,
                  itemBuilder: (context, index) {
                    var category = categories[index];
                    var stock = category['stock'];
                    return GestureDetector(
                      onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => drugDetailDr(
                                      drugId: category['id'],
                                      drugname: category['name'],
                                    ),
                                  ));
                      },
                      child: Card(
                        color: AppColor.primaryAppColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: MediaQuery.of(context).size.width * 0.106,
                              child: Image.network(
                                category["imageURL"],
                                width: 75,
                                height: 86,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                category["name"],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              '${category['price']} LE',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              color: Colors.grey,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Stock : ${stock}',
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(.5),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      width: MediaQuery.of(context).size.width *
                                          0.085,
                                      decoration: BoxDecoration(
                                          color: stock <= 0
                                              ? Colors.red
                                              : Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: IconButton(
                                        iconSize: 20,
                                        onPressed: () {
                                          // Add the drug to the cart
                                          if (stock > 0) {
                                            _addToCart(category);
                                          }
                                        },
                                        icon: Icon(Icons.add),
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
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
          },
        ),
      ),
    );
  }
}