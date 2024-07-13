import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Added Application Name Text
            Text(
              'Application Name: FoodCater',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Existing Group Text
            Text(
              'Group: RCDCS2515B',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Programme Code: CDCS251',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Group Member (Student Number):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '1. Muhammad \'Arif bin Salleh Hudin (2023389011)',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              '2. Mohammad Fawwaz bin Ahmad Fauzi (2023164947)',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              '3. Muhammad Aysar bin Mahmad Yusup (2023189277)',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16), // Space before the copyright text
            Text(
              '© 2024 FoodCater. All rights reserved.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Spacer(),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      const url = 'https://github.com/4arif401/food_truck_app';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Text(
                      'GitHub for Web',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 16), // Space between links
                  GestureDetector(
                    onTap: () async {
                      const url = 'https://github.com/4arif401/foodcater3';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Text(
                      'GitHub for Mobile',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
