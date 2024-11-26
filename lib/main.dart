import 'package:cart/second%20page%20.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      home: const CartPage(),
    );
  }
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Sample cart data
  final List<Map<String, dynamic>> cartItems = [
    {'name': 'Item 1', 'quantity': 1, 'price': 100.0},
    {'name': 'Item 2', 'quantity': 2, 'price': 150.0},
    {'name': 'Item 3', 'quantity': 1, 'price': 200.0},
  ];

  // Calculate the total price of items in the cart
  double calculateTotalPrice() {
    return cartItems.fold(0, (sum, item) {
      double price = item['price'] ?? 0.0; // Default to 0 if price is null
      int quantity = item['quantity'] ?? 1; // Default to 1 if quantity is null
      return sum + (price * quantity);
    });
  }
  int _selectedIndex = 0; // To track the selected index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  double discount = 50.0; // Fixed discount for simplicity

  @override
  Widget build(BuildContext context) {
    double totalPrice = calculateTotalPrice();
    double finalAmount = totalPrice - discount;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true, // This centers the title
      ),

      body: Column(
        children: [
          // ListView displaying cart items
          Container(
            width: 500,
            height: 250,
            child: cartItems.isNotEmpty
                ? ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Item Name and Price
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'] ?? 'Unnamed Item',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '\$${((item['price'] ?? 0.0) * (item['quantity'] ?? 1)).toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Quantity Controls
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (item['quantity'] > 1) {
                                    item['quantity']--;
                                  }
                                });
                              },
                              icon: const Icon(Icons.remove),
                              color: Colors.red,
                            ),
                            Text(
                              '${item['quantity'] ?? 1}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  item['quantity'] = (item['quantity'] ?? 0) + 1;
                                });
                              },
                              icon: const Icon(Icons.add),
                              color: Colors.green,
                            ),
                          ],
                        ),

                        // Delete Button (Text-based)
                        TextButton(
                          onPressed: () {
                            setState(() {
                              cartItems.removeAt(index);
                            });
                          },
                          child: const Text(
                            'DElETE',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
                : const Center(
              child: Text(
                'Your cart is empty!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height:20),
          // Price details section
          if (cartItems.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16), // Increased horizontal padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Price Details',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), // Increased text size
                  ),
                  const SizedBox(height: 8), // Increased spacing

                  // Total Price Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Price:',
                        style: TextStyle(fontSize: 18), // Increased text size
                      ),
                      Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 18), // Increased text size
                      ),
                    ],
                  ),
                  const SizedBox(height: 8), // Added space between rows

                  // Discount Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Discount:',
                        style: TextStyle(fontSize: 18), // Increased text size
                      ),
                      Text(
                        '-\$${discount.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 18), // Increased text size
                      ),
                    ],
                  ),
                  const SizedBox(height: 8), // Added space between rows

                  // Delivery Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Delivery:',
                        style: TextStyle(fontSize: 18), // Increased text size
                      ),
                      const Text(
                        'Free Delivery',
                        style: TextStyle(
                          fontSize: 18, // Increased text size
                          color: Colors.green, // Set the text color to green
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 8), // Added space between rows

                  const Divider(),

                  // Final Amount Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Amount:',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold), // Increased text size and weight
                      ),
                      Text(
                        '\$${finalAmount.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold), // Increased text size and weight
                      ),
                    ],
                  ),
                ],
              ),
            ),

          SizedBox(height:20),
          // Checkout button
          if (cartItems.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0), // Reduced bottom padding
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Show a SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Proceeding to Checkout')),
                    );

                    // Navigate to the checkout screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => secondPage()), // Replace 'CheckoutScreen' with your actual checkout screen
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: Colors.orangeAccent,
                  ),
                  child: const Text(
                    'Checkout',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: _selectedIndex == 2 ? Colors.orange : Colors.grey, // Cart icon color change
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],

        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),

    );
  }
}
