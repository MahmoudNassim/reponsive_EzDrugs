import 'package:app01/Constant/color.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {

  final List<dynamic> cart;
  final Function(dynamic) removeFromCart;
  final Function(dynamic) addtoCart;

  const ShoppingCart({
    Key? key,
    required this.cart,
    required this.removeFromCart,
    required this.addtoCart,
  }) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  Map<dynamic, int> counter = {};
  @override
  void initState() {
    super.initState();
    // Initialize the quantities map with the current quantity of each item in the cart
    for (var item in widget.cart) {
      counter[item] = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        centerTitle: true,
        backgroundColor: AppColor.primaryAppColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.cart.length,
                itemBuilder: (context, index) {
                  var item = widget.cart[index];

                  return Card(
                    color: AppColor.primaryAppColor,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColor.white,
                                      borderRadius: BorderRadius.circular(9)),
                                  height:
                                      MediaQuery.of(context).size.height * .11,
                                  width:
                                      MediaQuery.of(context).size.width * .25,
                                  child: Image.network(
                                    item["imageURL"],
                                    width:
                                        MediaQuery.of(context).size.width * .32,
                                    height: MediaQuery.of(context).size.height *
                                        .32,
                                  )),
                            ),
                            Column(
                              children: [
                                Text(item['name']),
                                Text(
                                  item['category']['name'],
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  '${item['price']} LE',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    counter[item] = counter[item]! + 1;
                                  });
                                },
                                icon: Icon(Icons.add)),
                            Text("${counter[item]}"),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (counter[item]! < 2) {
                                      widget.removeFromCart(item);
                                    } else {
                                      counter[item] = counter[item]! - 1;
                                    }
                                  });
                                },
                                icon: Icon(Icons.remove)),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Text(
              'Total Price: ${_calculateTotalPrice().toStringAsFixed(2)} LE',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {

              },
              child: Text('Proceed to Checkout'),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateTotalPrice() {
    double total = 0;
    for (var item in widget.cart) {
      total += item['price']*counter[item];
    }
    return total;
  }
}
