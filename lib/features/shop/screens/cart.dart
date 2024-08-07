import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [
    CartItem(
        name: 'Pizza Hut Pepparoniz',
        price: 7.99,
        quantity: 2,
        imageUrl:
            'https://www.freepngimg.com/thumb/pizza/7-pizza-png-image.png'),
    CartItem(
        name: 'Pizza Hut Pepparoniz',
        price: 7.99,
        quantity: 2,
        imageUrl:
            'https://www.freepngimg.com/thumb/pizza/7-pizza-png-image.png'),
    CartItem(
        name: 'Pizza Hut Pepparoniz',
        price: 7.99,
        quantity: 2,
        imageUrl:
            'https://www.freepngimg.com/thumb/pizza/7-pizza-png-image.png'),
  ];

  List<CartItem> get items => _items;

  void toggleSelect(int index) {
    _items[index].isSelected = !_items[index].isSelected;
    notifyListeners();
  }

  void deleteItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void increaseQuantity(int index) {
    _items[index].quantity++;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (_items[index].quantity > 1) {
      _items[index].quantity--;
      notifyListeners();
    }
  }

  int get totalItems => _items.length;

  double get totalPrice {
    return _items
        .where((item) => item.isSelected)
        .fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }
}

class CartItem {
  final String name;
  final double price;
  final String imageUrl;
  int quantity;
  bool isSelected;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    this.isSelected = false,
  });
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Cart'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  // Handle cart button press
                },
              ),
              Positioned(
                right: 4,
                top: 4,
                child: Consumer<CartProvider>(
                  builder: (context, cartProvider, child) {
                    return cartProvider.totalItems > 0
                        ? Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: Text(
                              '${cartProvider.totalItems}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Container();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return ListView.builder(
            itemCount: cartProvider.items.length,
            itemBuilder: (context, index) {
              final item = cartProvider.items[index];
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  cartProvider.deleteItem(index);
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 2.0),
                  child: ListTile(
                    leading: GestureDetector(
                      onTap: () => cartProvider.toggleSelect(index),
                      child: Container(
                        width: 17,
                        height: 17,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: item.isSelected ? Colors.blue : Colors.white,
                          border: Border.all(
                            color: item.isSelected ? Colors.blue : Colors.grey,
                          ),
                        ),
                        child: item.isSelected
                            ? Icon(Icons.check, color: Colors.white, size: 14)
                            : null,
                      ),
                    ),
                    title: Row(
                      children: [
                        Image.network(
                          item.imageUrl,
                          width: 90,
                          height: 90,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '\$${item.price.toStringAsFixed(2)}',
                                style: TextStyle(color: Colors.red),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove, size: 14),
                                    onPressed: () =>
                                        cartProvider.decreaseQuantity(index),
                                  ),
                                  Text(
                                    '${item.quantity}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add, size: 14),
                                    onPressed: () =>
                                        cartProvider.increaseQuantity(index),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  return Container(
                    width: 120,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 214, 213, 213),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      '\$${cartProvider.totalPrice.toStringAsFixed(2)}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  );
                },
              ),
              Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  return ElevatedButton(
                    onPressed: cartProvider.totalItems > 0
                        ? () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => ConfirmOrderScreen()),
                            // );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: cartProvider.totalItems == 0
                          ? Color.fromARGB(255, 193, 193, 193)
                          : Colors.purple,
                      foregroundColor: cartProvider.totalItems == 0
                          ? Colors.grey[700]
                          : Colors.white,
                      fixedSize: Size(220, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Text(
                      'CHECK OUT',
                      style: TextStyle(
                        color: cartProvider.totalItems == 0
                            ? Colors.grey[700]
                            : Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
