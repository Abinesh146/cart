import 'package:cart/successpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class secondPage extends StatefulWidget {
  const secondPage({super.key});

  @override
  _secondPageState createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {
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

  double discount = 50.0; // Fixed discount for simplicity

  @override
  Widget build(BuildContext context) {
    double totalPrice = calculateTotalPrice();
    double finalAmount = totalPrice - discount;

    return Scaffold(
      appBar: AppBar(
        title: const Text('SUMMARY'),
        centerTitle: true, // This centers the title
      ),

      body: Column(
        children: [
          // ListView displaying cart items
          Container(
            width: 500,
            height: 220,
            child: cartItems.isNotEmpty
                ? ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 4, horizontal: 8), // Reduced vertical spacing
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            item['name'] ?? 'Unnamed Item',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
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
                                  item['quantity'] =
                                      (item['quantity'] ?? 0) + 1;
                                });
                              },
                              icon: const Icon(Icons.add),
                              color: Colors.green,
                            ),
                          ],
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
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Column(
              children: [
                // Shipping Address Section
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.1), // Light background color
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.blueAccent, // Border color to match the icon
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.blueAccent,
                        size: 30, // Increased icon size for more emphasis
                      ),
                      const SizedBox(width: 12), // Spacing between icon and text
                      Expanded(
                        child: Text(
                          'Shipping Address: 123 Main Street, City, Country', // Example address
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87, // Darker text for better readability
                          ),
                          overflow: TextOverflow.ellipsis, // Handling long address text
                        ),
                      ),
                      // Divider inside Row for the first section
                      const Divider(
                        color: Colors.blueAccent, // Line color
                        thickness: 1.5, // Line thickness
                        indent: 20, // Indentation from the left to start after the text
                        endIndent: 20, // Indentation from the right to give space before the end
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10), // Space between the first and second row

                // Additional Shipping Info (e.g., "Delivery time" or "Shipping method")
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.blueAccent,
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.local_shipping,
                        color: Colors.blueAccent,
                        size: 30,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Delivery by: 3-5 business days',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Divider inside Row for the second section
                      const Divider(
                        color: Colors.blueAccent,
                        thickness: 1.5,
                        indent: 20, // Indentation for the second row divider
                        endIndent: 20, // Indentation for the second row divider
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),


          const SizedBox(height: 10),
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

          // Shipping Address Section

          SizedBox(height: 20),

          // Checkout button
          if (cartItems.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0), // Reduced bottom padding
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Proceeding to Checkout')),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentSuccessPage()), // Replace 'CheckoutScreen' with your actual checkout screen
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: Colors.orangeAccent,
                  ),
                  child: const Text(
                    'Place order',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
