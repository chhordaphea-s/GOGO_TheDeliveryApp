import 'package:flutter/material.dart';
import 'package:gogo_thedeliveryapp/features/shop/screens/detailfood.dart';
import 'package:gogo_thedeliveryapp/utilities/colors.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedCategory = 'Foods';

  List<Map<String, dynamic>> items = [
    {
      'image': 'https://via.placeholder.com/70',
      'name': 'Pizza Hut Pepparoniz',
      'price': '\$7.99',
      'location': '1.7 km',
      'time': '32 min',
      'category': 'Foods'
    },
    // Add more items with different categories
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredItems =
        items.where((item) => item['category'] == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'What would you like to eat?',
            fillColor: AppColor.lightGrayTextColor,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryIcon(
                      icon: Icons.fastfood,
                      label: 'Foods',
                      selected: selectedCategory == 'Foods',
                      onTap: () {
                        setState(() {
                          selectedCategory = 'Foods';
                        });
                      },
                    ),
                    CategoryIcon(
                      icon: Icons.local_drink,
                      label: 'Drinks',
                      selected: selectedCategory == 'Drinks',
                      onTap: () {
                        setState(() {
                          selectedCategory = 'Drinks';
                        });
                      },
                    ),
                    CategoryIcon(
                      icon: Icons.local_pizza,
                      label: 'Snacks',
                      selected: selectedCategory == 'Snacks',
                      onTap: () {
                        setState(() {
                          selectedCategory = 'Snacks';
                        });
                      },
                    ),
                    CategoryIcon(
                      icon: Icons.local_grocery_store,
                      label: 'Fruits',
                      selected: selectedCategory == 'Fruits',
                      onTap: () {
                        setState(() {
                          selectedCategory = 'Fruits';
                        });
                      },
                    ),
                    CategoryIcon(
                      icon: Icons.cake,
                      label: 'Sweets',
                      selected: selectedCategory == 'Sweets',
                      onTap: () {
                        setState(() {
                          selectedCategory = 'Sweets';
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return ItemCard(
                  item: filteredItems[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailFoodScreen(),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  CategoryIcon({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 50),
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: selected ? Colors.purple : Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: selected ? Colors.purple : Colors.grey[200],
              child: Icon(icon, color: selected ? Colors.white : Colors.black),
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatefulWidget {
  final Map<String, dynamic> item;
  final VoidCallback onTap;

  ItemCard({required this.item, required this.onTap});

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool isFavorite = false;
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.item['image'], // Placeholder image URL
                width: 90,
                height: 70,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item['name'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(widget.item['price'],
                        style: TextStyle(color: Colors.red)),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 14),
                        SizedBox(width: 4),
                        Text(widget.item['location']),
                        SizedBox(width: 10),
                        Icon(Icons.access_time, size: 14),
                        SizedBox(width: 4),
                        Text(widget.item['time']),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15),
              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isButtonPressed = !isButtonPressed;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isButtonPressed
                          ? const Color.fromARGB(255, 193, 193, 193)
                          : Colors.purple,
                      foregroundColor: Colors.white,
                      minimumSize: Size(60, 30), // Adjust the size as needed
                    ),
                    child: Text(
                      'SELECT',
                      style: TextStyle(
                        color: isButtonPressed ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
