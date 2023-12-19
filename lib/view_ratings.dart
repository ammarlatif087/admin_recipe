import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ViewRatings extends StatelessWidget {
  const ViewRatings({super.key});

  @override
  Widget build(BuildContext context) {
    Query dbRef = FirebaseDatabase.instance.ref().child('recipe_ratings');
    // DatabaseReference reference =
    //     FirebaseDatabase.instance.ref().child('qr_codes');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Ratings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query: dbRef,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                Map qrCode = snapshot.value as Map;
                qrCode['key'] = snapshot.key;

                return listItem(qrCodes: qrCode);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem({required Map qrCodes}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      color: Colors.blueGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const Text(
              'Name',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            title: Text(
              qrCodes['name'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ListTile(
            leading: const Text(
              'Instructions',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            title: Text(
              qrCodes['instructions'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ListTile(
            leading: const Text(
              'Cost',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            title: Text(
              qrCodes['cost'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ListTile(
            leading: const Text(
              'Rating',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            title: Text(
              qrCodes['rating'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ListTile(
            leading: const Text(
              'Feedback',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            title: Text(
              qrCodes['feedback'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
