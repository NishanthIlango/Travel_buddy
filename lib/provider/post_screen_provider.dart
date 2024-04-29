import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/helper/snackbar_helper.dart';

class PostScreenProvider extends ChangeNotifier {
  TextEditingController originController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  TextEditingController travelController = TextEditingController();
  TextEditingController weightAllowanceController = TextEditingController();

  PostScreenProvider() {
    // Initialize the user ID when the provider is created
    _initializeUserId();
  }

  void _initializeUserId() {
    // Check if the current user is not null, then get its UID
    final user = FirebaseAuth.instance.currentUser;
  }

  void sendDetails({
    required BuildContext context,
    required String Origin,
    required String Destination,
    required String TravelDate,
    required String WeightAllowance,
  }) async {
    try {
      await FirebaseDatabase.instance.ref().child("posts").push().set({
        'Origin': Origin,
        'Destination': Destination,
        'Travel Date': TravelDate,
        'Weight Allowance': WeightAllowance,// Add userId to the post data
      });
    } on FirebaseException catch (firebaseError) {
      SnackBarHelper.showErrorSnackBar(context, firebaseError.message!);
    } catch (error) {
      SnackBarHelper.showErrorSnackBar(context, error.toString());
    }
  }
}
