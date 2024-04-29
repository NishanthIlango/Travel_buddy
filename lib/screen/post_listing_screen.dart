import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/models/post_card_model.dart';
import 'package:travel_app/widget/post_card_widget.dart';
import 'package:travel_app/widget/post_list_widget.dart';

class PostListingScreen extends StatelessWidget {
  static String routeName = "/postListingScreen";

  const PostListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue[100],
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: StreamBuilder<DatabaseEvent>(
        stream: FirebaseDatabase.instance.ref().child("posts").onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.snapshot.value != null) {
              final data = snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
              List<PostCardModel> list = [];
              data.forEach((key, value) {
                print(key);
                print(value);
                if (value != null) {
                  list.add(PostCardModel.fromJson(value, key));
                }
              });
            return ListView(
              children: list
                  .map(
                    (e) => PostListWidget(
                      model: PostCardModel(
                        origin: e.origin,
                        destination: e.destination,
                        travelDate: e.travelDate,
                        weightAllowance: e.weightAllowance,
                      ),
                    ),
                  )
                  .toList(),
            );
          } else if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "No data",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
