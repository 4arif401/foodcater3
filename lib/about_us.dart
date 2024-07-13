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
            Spacer(),
            Center(
              child: GestureDetector(
                onTap: () async {
                  const url = 'https://www.youtube.com';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Text(
                  'GitHub',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
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
