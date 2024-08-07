// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class ConfirmOrderScreen extends StatefulWidget {
//   @override
//   _ConfirmOrderScreenState createState() => _ConfirmOrderScreenState();
// }

// class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
//   GoogleMapController? mapController;
//   int selectedPaymentIndex = -1;

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   void _onPaymentOptionSelected(int index) {
//     setState(() {
//       selectedPaymentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text('Confirm Order'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(Icons.phone),
//                 SizedBox(width: 8),
//                 Text('Contact Number: +855 70 884 241'),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Icon(Icons.location_pin),
//                 SizedBox(width: 8),
//                 Text('Deliver to'),
//               ],
//             ),
//             GestureDetector(
//               onTap: () {
//                 // Navigate to pick map screen
//               },
//               child: Container(
//                 margin: EdgeInsets.symmetric(vertical: 8),
//                 height: 200,
//                 width: double.infinity,
//                 child: GoogleMap(
//                   onMapCreated: _onMapCreated,
//                   initialCameraPosition: CameraPosition(
//                     target: LatLng(11.562108, 104.888535),
//                     zoom: 14,
//                   ),
//                   markers: {
//                     Marker(
//                       markerId: MarkerId('location'),
//                       position: LatLng(11.562108, 104.888535),
//                     ),
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             Text('Payment'),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Pay online :'),
//                 Icon(Icons.arrow_forward),
//               ],
//             ),
//             SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: List.generate(4, (index) {
//                 double amount = [5, 10, 20, 50][index].toDouble();
//                 return ElevatedButton(
//                   onPressed: () => _onPaymentOptionSelected(index),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: selectedPaymentIndex == index
//                         ? Colors.purple
//                         : Colors.grey[300],
//                     disabledBackgroundColor: selectedPaymentIndex == index
//                         ? Colors.white
//                         : Colors.grey[700],
//                   ),
//                   child: Text('\$$amount'),
//                 );
//               }),
//             ),
//             SizedBox(height: 16),
//             Text('Your note'),
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Anything to let delivery man know...',
//                 border: OutlineInputBorder(),
//               ),
//               maxLines: 4,
//             ),
//             Spacer(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   width: 140,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   alignment: Alignment.center,
//                   child: Text(
//                     '\$15.34',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle checkout button press
//                   },
//                   style: ElevatedButton.styleFrom(
//                     fixedSize: Size(220, 50),
//                     backgroundColor: Colors.purple,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                   child: Text(
//                     'CHECK OUT',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
