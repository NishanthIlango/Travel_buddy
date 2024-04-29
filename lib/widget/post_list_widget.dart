import 'package:flutter/material.dart';
import 'package:travel_app/models/post_card_model.dart';

class PostListWidget extends StatelessWidget {
  final PostCardModel model;
  const PostListWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
      Positioned(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 1,spreadRadius: 1,
            )
          ]
        ),
        child:  Row(
          children: [
            SizedBox(width: 40,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.0),
                  Text("${model.origin} ---> ${model.destination}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  SizedBox(height: 8.0,),
                  Text("DOJ: ${model.travelDate}",style: TextStyle(fontSize: 16),),
                  SizedBox(height: 4.0,),
                  Text("Weight: ${model.weightAllowance}"),
                ],
              ),
            )
          ],
        ),
      ),
    )] 
    );
  }
}