import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gogo_thedeliveryapp/features/shop/screens/cart.dart';
import 'package:gogo_thedeliveryapp/features/shop/screens/search.dart';
import 'package:gogo_thedeliveryapp/features/shop/screens/orders.dart';
import 'package:gogo_thedeliveryapp/features/shop/screens/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _cartItemCount = 1; // Example cart item count
  int _currentPage = 0; // Track the current page

  void _onItemTapped(int index) {
    if (index != 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => _getScreenForIndex(index)),
      );
    }
  }

  Widget _getScreenForIndex(int index) {
    switch (index) {
      case 1:
        return CartScreen();
      case 2:
        return OrdersScreen();
      case 3:
        return ProfileScreen();
      default:
        return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(size: size),
                SizedBox(
                  height: 300,
                  child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: 5, // Assuming 5 food containers
                    itemBuilder: (context, index) {
                      return _buildFoodContainer(
                        'https://www.saveur.com/uploads/2019/12/09/OB7S7ZQJAVDRFGVXYHMD3FUS2Y.jpg?auto=webp&auto=webp&optimize=high&quality=70&width=1440',
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 2.0),
                      width: _currentPage == index ? 14.0 : 5.0,
                      height: 5.0,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Color(0xFF8063D6)
                            : Color.fromARGB(255, 189, 188, 188),
                        borderRadius: _currentPage == index
                            ? BorderRadius.circular(10.0)
                            : BorderRadius.circular(5.0),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 10),
                BlocksContainer(),
                // Other widgets can go here
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart),
                if (_cartItemCount > 0)
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: Text(
                        '$_cartItemCount',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF2B51BA),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _onItemTapped(index);
        },
      ),
    );
  }

  Widget _buildFoodContainer(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: 380,
        height: 278,
        child: Stack(
          children: [
            Container(
              width: 380,
              height: 190,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                  onError: (exception, stackTrace) {
                    // Handle the error here
                    print('Failed to load image: $exception');
                  },
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 155, // Overlap by 15 pixels
              left: 18.5,
              child: Container(
                width: 320,
                height: 110,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Jajangmyeon',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 8), // Space between text and icon
                          Icon(Icons.favorite_border),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        '\$7.99 (17 sold)',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.star, color: Colors.yellow, size: 16),
                              SizedBox(width: 4),
                              Text(
                                '4.5',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.location_on,
                                  color: Colors.blue, size: 16),
                              SizedBox(width: 4),
                              Text(
                                '1.7 kilometers',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.timer, color: Colors.red, size: 16),
                              SizedBox(width: 4),
                              Text(
                                '32 minutes',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final Size size;
  const CustomAppBar({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 200,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF204FB6),
            Color(0xFF8865D9),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome, Woof!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.white, size: 14),
                      SizedBox(width: 8),
                      Text(
                        'Phnom Penh City',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(Icons.favorite_border, color: Colors.white, size: 30),
            ],
          ),
          SizedBox(height: 25.0),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
            child: AbsorbPointer(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'What would you like to eat?',
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(0, 139, 139, 139),
                      width: 0.3,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BlocksContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 15,
            decoration: BoxDecoration(
              color: Color(0xFF2550B8),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(width: 10),
          Text(
            'Blocks',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
