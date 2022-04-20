import 'dart:convert';

import 'package:buchi/models/AdoptModel.dart';
import 'package:buchi/models/PetModel.dart';
import 'package:buchi/style/textstyle.dart';
import 'package:buchi/view/PetList.dart';
import 'package:buchi/viewModel/AdoptViewModel.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:hive/hive.dart';

class AdoptPet extends StatelessWidget {
  dynamic pets;
  AdoptPet({Key? key, this.pets}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  var fullName = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Buchi",
            style: Style().appbarstyle,
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                "Please Enter you Name and Phone nummber to Adopt pets",
                style: Style().getDetailStyle,
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.deepPurpleAccent,
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(color: Colors.white),
                        child: TextFormField(
                            controller: fullName,
                            enableSuggestions: true,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter Full Name ";
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            style: const TextStyle(fontSize: 15),
                            decoration: InputDecoration(
                                labelText: "Full Name",
                                labelStyle: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                contentPadding: const EdgeInsets.all(3),
                                errorStyle:
                                    const TextStyle(color: Colors.red))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(color: Colors.white),
                        child: TextFormField(
                            controller: email,
                            enableSuggestions: true,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter Your E-mail ";
                              }
                              return null;
                            },
                            // textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 15),
                            decoration: InputDecoration(
                                labelText: "Email Address",
                                // ignore: prefer_const_constructors
                                labelStyle: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                contentPadding: const EdgeInsets.all(3),
                                errorStyle:
                                    const TextStyle(color: Colors.red))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(color: Colors.white),
                        child: TextFormField(
                            controller: phone,
                            enableSuggestions: true,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter Your phone number ";
                              }
                              return null;
                            },
                            // textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 15),
                            decoration: InputDecoration(
                                labelText: "Phone Number",
                                // ignore: prefer_const_constructors
                                labelStyle: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                contentPadding: const EdgeInsets.all(3),
                                errorStyle:
                                    const TextStyle(color: Colors.red))),
                      ),
                    ),
                  ],
                )),
            Center(
              child: Wrap(
                direction: Axis.vertical,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      /**
                   * This ConnectivityResult check whether there is a connection or not
                   */
                      ConnectivityResult connectivityResult =
                          await Connectivity().checkConnectivity();
                      if (connectivityResult == ConnectivityResult.bluetooth ||
                          connectivityResult == ConnectivityResult.none) {
                        WarningAlertBoxCenter(
                            context: context,
                            messageText:
                                'You are offline, please connect with Wi-Fi or Mobile data!');
                      } else {
                        if (formKey.currentState!.validate()) {
                          var _phoneNumber = phone.text;
                          var _fullName = fullName.text;
                          var _email = email.text;
                          var _petID = pets.petId;
                          String result = await AdoptViewModel.httpSetAdotion(
                              _email, _phoneNumber, _fullName, _petID);

                          if (result.toLowerCase() != 'notOk'.toLowerCase()) {
                            SuccessAlertBoxCenter(
                                context: context,
                                messageText: 'Thank you for adoting pets!');
                          } else {
                            WarningAlertBoxCenter(
                                context: context, messageText: ' $result');
                          }
                        }
                      }
                    },
                    child: const Text("Send"),
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Colors.blueAccent,
                        elevation: 10),
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("View Detail"))
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.deepPurpleAccent,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const PetList();
                  }));
                },
                child: const Text("Back to Home"),
                style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Colors.blueAccent,
                    elevation: 10),
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.deepPurpleAccent,
            ),
          ],
        ));
  }
}
