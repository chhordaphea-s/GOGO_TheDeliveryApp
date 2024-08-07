import 'package:flutter/material.dart';
import 'package:gogo_thedeliveryapp/features/shop/screens/cart.dart';

class DetailFoodScreen extends StatefulWidget {
  @override
  _DetailFoodScreenState createState() => _DetailFoodScreenState();
}

class _DetailFoodScreenState extends State<DetailFoodScreen> {
  bool isFavorite = false;
  int quantity = 1;
  bool isAddToCartSelected = false;
  int cartItemCount = 0; // State to track the number of items in the cart

  // Function to show a dialog when the "Add to Cart" button is clicked
  void _showCartPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Added to Cart'),
          content: Text(
            'Your item has been added to the cart. You can view or modify your cart from the cart icon.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Function to update cart count and show the popup
  void _addToCart() {
    setState(() {
      isAddToCartSelected = !isAddToCartSelected;
      cartItemCount++; // Increment cart item count
    });
    _showCartPopup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.black, size: 30),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
                },
              ),
              if (cartItemCount >
                  0) // Show badge only if there are items in the cart
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    child: Center(
                      child: Text(
                        '$cartItemCount',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          IconButton(
            icon: Icon(
              size: 30,
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.black,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                ClipRect(
                  child: Align(
                    alignment: Alignment.centerRight,
                    widthFactor: 0.8,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 360,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://www.freepngimg.com/thumb/pizza/7-pizza-png-image.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.33,
                  height: 360,
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          SizedBox(height: 5),
                          Text('4.5'),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Icon(Icons.location_on, color: Colors.blue),
                          SizedBox(height: 5),
                          Text('1.7 kilometers'),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Icon(Icons.access_time, color: Colors.red),
                          SizedBox(height: 5),
                          Text('32 minutes'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pizza Pepparoniz',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$7.99',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Pizza Hut BKK',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'The blog provides 97 creative pizza captions for Instagram, including fun and clever phrases to enhance social media posts.',
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Suggestions include using snappy captions with images for effective marketing, and the blog lists various catchy phrases ideal for different types of pizza posts.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (quantity > 1) quantity--;
                    });
                  },
                ),
                Text('$quantity'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _addToCart, // Call _addToCart method
              style: ElevatedButton.styleFrom(
                backgroundColor: isAddToCartSelected
                    ? Color.fromARGB(255, 193, 193, 193)
                    : Colors.purple,
                foregroundColor:
                    isAddToCartSelected ? Colors.grey[700] : Colors.white,
                minimumSize: Size(220, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: Text(
                'ADD TO CART',
                style: TextStyle(
                  color: isAddToCartSelected ? Colors.grey[700] : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
