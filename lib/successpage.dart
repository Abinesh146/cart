import 'package:flutter/material.dart';

class PaymentSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // Removing the background color
        backgroundColor: Colors.transparent, // No color background
        elevation: 0, // Remove shadow for a clean look

        // Leading icon - Home icon
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            // Navigate to the home page
            Navigator.pop(context); // You can replace this with navigation to the actual home page if needed
          },
        ),

        // Action icon - Next Page icon
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {
              // Call the function to show the order details dialog
              _showOrderDetailsDialog(context);
            },
          ),
        ],

        // Title of the AppBar (optional)
        title: const Text(
          "Payment Success",
          style: TextStyle(color: Colors.black), // Black text for contrast on transparent background
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // Center alignment for all children
            children: [
              // Success Icon with larger size
              Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 150, // Larger success icon
              ),
              const SizedBox(height: 20), // Space between icon and message

              // Success Message Text
              const Text(
                "Payment Successful!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10), // Space between message and details

              // Details Text
              const Text(
                "Thank you for your purchase. Your transaction was completed successfully.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 30), // Space between details and buttons

              // Button to Continue Shopping
              ElevatedButton(
                onPressed: () {
                  // Navigate to the shopping page or catalog
                  Navigator.pushNamed(context, '/shopping');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Continue Shopping',
                  style: TextStyle(fontSize: 16),
                ),
              ),

              const SizedBox(height: 20), // Space between buttons

// Back to Home button
              ElevatedButton(
                onPressed: () {
                  // Navigate to home page
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(

                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Back to Home',
                  style: TextStyle(fontSize: 16),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

  // Method to show the Order Details dialog
  void _showOrderDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Order Details"),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildOrderDetailRow("Order Number:", "#123456"),
                _buildOrderDetailRow("Date:", "2024-11-23"),
                _buildOrderDetailRow("Items:", "Item 1, "),
                _buildOrderDetailRow("Total Amount:", "\$150"),
                _buildOrderDetailRow("Shipping Address:", "123 Main "),
                _buildOrderDetailRow("Delivery Method:", "3-5 "),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  // Helper method to build each order detail row
  Widget _buildOrderDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PaymentSuccessPage(),
    routes: {
      '/shopping': (context) => ShoppingPage(),
      '/payment-details': (context) => PaymentDetailsPage(),
    },
  ));
}

// Placeholder for the Shopping Page
class ShoppingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Continue Shopping'),
      ),
      body: const Center(
        child: Text("Shopping Page - Add your shopping content here."),
      ),
    );
  }
}

// Placeholder for the Payment Details Page
class PaymentDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Details'),
      ),
      body: const Center(
        child: Text("Payment Details Page - Add your payment details content here."),
      ),
    );
  }
}
