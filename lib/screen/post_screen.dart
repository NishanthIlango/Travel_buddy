import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/provider/post_screen_provider.dart';
import 'package:travel_app/screen/post_listing_screen.dart';
import 'package:travel_app/widget/custom_button.dart';
import 'package:travel_app/widget/custom_text_field.dart';

class PostScreen extends StatefulWidget {
  static String routeName = "/post-screen";
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextEditingController originController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  TextEditingController travelController = TextEditingController();
  TextEditingController weightAllowanceController = TextEditingController();
  DateTime? selectedDate;

  final _key = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        travelController.text = pickedDate.toString().substring(0, 10);
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    originController.dispose();
    destinationController.dispose();
    travelController.dispose();
    weightAllowanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<PostScreenProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: Form(
        key: _key,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image1.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40,
              child: Padding(
                padding: const EdgeInsets.all(45.0),
                child: RichText(
                  text: TextSpan(
                    text: "Find the best route",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 140,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 550,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white38,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          "Origin Airport",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF1e5376),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Consumer<PostScreenProvider>(
                          builder: (context, provider, _) {
                            return CustomTextField(
                              controller: originController,
                              hintText: "Enter your Origin Airport",
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Please Enter your Origin Airport";
                                } else {
                                  return null;
                                }
                              },
                            );
                          },
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Destination Airport",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF1e5376),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Consumer<PostScreenProvider>(
                          builder: (context, provider, _) {
                            return CustomTextField(
                              controller: destinationController,
                              hintText: "Enter your Destination Airport",
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Please Enter your Destination Airport";
                                } else {
                                  return null;
                                }
                              },
                            );
                          },
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Travel Date",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF1e5376),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Consumer<PostScreenProvider>(
                                  builder: (context, provider, _) {
                                    return TextFormField(
                                      keyboardType: TextInputType.datetime,
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return "Please Enter the weight";
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: travelController,
                                      decoration: InputDecoration(
                                        hintText: " Enter travel date",
                                        fillColor: Colors.white,
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            _selectDate(context);
                                          },
                                          icon: Icon(Icons.date_range),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Weight Allowance",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF1e5376),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Consumer<PostScreenProvider>(
                          builder: (context, provider, _) {
                            return CustomTextField(
                              controller: weightAllowanceController,
                              hintText: "e.g: 5 kg available",
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Please Enter the weight";
                                } else {
                                  return null;
                                }
                              },
                            );
                          },
                        ),
                        SizedBox(height: 20),
                        CustomButton(
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              FocusScope.of(context).unfocus();
                              _provider.sendDetails(
                                context: context,
                                Origin: originController.text,
                                Destination: destinationController.text,
                                TravelDate: travelController.text,
                                WeightAllowance: weightAllowanceController.text,
                              );
                              Navigator.of(context).pushNamed(PostListingScreen.routeName);
                            }
                          },
                          title: "Post",
                        ),
                      ],
                    ),
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
