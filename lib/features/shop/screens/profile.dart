import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Location',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Starbucks Reserved Beong Keng Kang'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            SizedBox(height: 16),
            Text(
              'My Information',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Woof Woof'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: Text('woofwoof@gmail.com'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: Text('8557088***1'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement log out logic here
                },
                child: Text('Log out'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
