import 'dart:convert';

import 'package:critiq/global/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'package:critiq/global/color.dart';
import 'package:critiq/providers/user_provider.dart';
import 'package:file_picker/file_picker.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String _greeting = '';
  final _formKey = GlobalKey<FormState>();
  final _urlController = TextEditingController();
  String _buttonText = 'Analyze';
  String? _fileName;
  String _response = '';
  
  Future<void> _sendMessage() async{
    final message = _urlController.text;
    try {
      final response = await http.post(
        Uri.parse('${Constants.uri}/api/gemini'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'message': message,
        }),
      );
      if (response.statusCode == 200) {
        setState(() {
          _response = response.body;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: kwhite,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.elliptical(15, 15)),
            ),
            content: Text(
              'Error: ${response.statusCode}',
              style: TextStyle(color: kblackHeading, fontSize: 15),
            ),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: kwhite,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.elliptical(15, 15)),
          ),
          content: Text(
            'Error: $e',
            style: TextStyle(color: kblackHeading, fontSize: 15),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  void _updateGreeting() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour < 12) {
      setState(() {
        _greeting = 'Good Morning';
      });
    } else if (hour < 17) {
      setState(() {
        _greeting = 'Good Afternoon';
      });
    } else {
      setState(() {
        _greeting = 'Good Evening';
      });
    }
  }

  @override
  void initState() {
    _updateGreeting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      backgroundColor: kgrey,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
            floating: true,
            snap: true,
            pinned: false,
            backgroundColor: kgreyopacity,
            expandedHeight: 50,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                'CritiQ',
                style: TextStyle(
                  color: kwhite,
                  fontSize: 26,
                ),
              ),
              centerTitle: true,
              titlePadding: EdgeInsets.only(bottom: 10),
            ),
          ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  height: height * 0.3,
                  width: width,
                  // decoration: BoxDecoration(
                  //   color: kgreyopacity,
                  //   borderRadius: const BorderRadius.all(Radius.elliptical(40, 20)),
                  // ),
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$_greeting, ${user.name.split(' ')[0]}',
                          style: const TextStyle(
                            color: kwhite,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              height: height * 0.16,
                              width: width * 0.45,
                              decoration: BoxDecoration(
                                color: kdarkBlueMuted,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Center(
                                child: Text(
                                  'Hey, I`m watching your ratings. See you at the leaderboard! 🏆',
                                  style: TextStyle(
                                    color: kwhite,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            
                            Stack(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: width*0.01),
                                    Container(
                                      margin: EdgeInsets.only(top: height * 0.1),
                                      height: height * 0.02,
                                      width: width * 0.04,
                                      decoration: BoxDecoration(
                                        color: kdarkBlueMuted,
                                        borderRadius: BorderRadius.circular(150),
                                      ),
                                    ),
                                  SizedBox(width: width*0.01),
                                    Container(
                                  margin: EdgeInsets.only(top: height * 0.08),
                                  height: height * 0.015,
                                  width: width * 0.03,
                                  decoration: BoxDecoration(
                                    color: kdarkBlueMuted,
                                    borderRadius: BorderRadius.circular(150),
                                  ),
                                ),
                                SizedBox(width: width*0.01),
                                    Container(
                                  margin: EdgeInsets.only(top: height * 0.06),
                                  height: height * 0.01,
                                  width: width * 0.02,
                                  decoration: BoxDecoration(
                                    color: kdarkBlueMuted,
                                    borderRadius: BorderRadius.circular(150),
                                  ),
                                ),
                                  ],
                                ),
                                    Image.asset(
                                  'assets/jack_image3.png',
                                  width: width * 0.5,
                                  height: height * 0.25,
                                  alignment: Alignment.centerRight,
                                ),
                              ] 
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ),
                SizedBox(height: height*0.015),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Rate your project',
                    style: TextStyle(
                      color: kwhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: height*0.015),
                Padding(
                  padding: const EdgeInsets.only(left: 1, right: 1),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _urlController,
                      
                      decoration: InputDecoration(
                        hintText: 'Enter URL here...',
                        hintStyle: const TextStyle(color: kwhite),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: kwhite),
                        ),
                        enabled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: kwhite),
                        ),
                        filled: true,
                        fillColor: kgreyopacity,
                        focusColor: kdarkBlue,
                        alignLabelWithHint: true,
                      ),
                      style: const TextStyle(color: kwhite),
            
                      validator: (value) {
                        if (value==null || value.isEmpty || value.length < 10){
                          return 'Please enter a valid URL';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: height*0.015),
                const Center(
                    child: Text(
                      'OR',
                      style: TextStyle(
                        color: kwhite,
                        fontSize: 20,
                      ),
                    ),
                  ),
                SizedBox(height: height*0.015),
                Container(
                  height: height * 0.2,
                  width: width,
                  decoration: BoxDecoration(
                    color: kgreyopacity,
                    border: Border.all(color: kwhite),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.upload_file_outlined,
                        size: 40,
                        color: kwhite,
                      ),
                      SizedBox(height: height*0.01),
                      const Text(
                        'Drop your apk file here or',
                        style: TextStyle(
                          color: kwhite,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: height*0.01),
                      ElevatedButton(
                        child: Text(
                          _fileName ?? 'Upload',
                          style: TextStyle(
                            color: kblackHeading,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () async{
                          FilePickerResult? result = await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['apk'],
                          );
                          if (result != null) {
                            setState(() {
                              _fileName = result.files.single.name;
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: kwhite,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(top: Radius.elliptical(15, 15)),
                                ),
                                content: Text(
                                  'you cancelled the file selection',
                                  style: TextStyle(color: kblackHeading, fontSize: 15),
                                ),
                              ),
                            );
                          }
                        },
                        )
                    ],
                  ),
                ),
                SizedBox(height: height*0.015),
                OutlinedButton(
                  onPressed: (){
                    if (_formKey.currentState?.validate() ?? false) {
                      if(_fileName != null){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: kwhite,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.elliptical(15, 15)),
                            ),
                            content: Text(
                              'Please select only one option',
                              style: TextStyle(color: kblackHeading, fontSize: 15),
                            ),
                          ),
                        );
                      }
                      else {
                        _sendMessage();
                        setState(() {
                          _buttonText = 'Analyzing...';
                        });
                      }
                    Future.delayed(const Duration(seconds: 3), () {
                      setState(() {
                        _buttonText = 'Analyze';
                      });
                    });
                    }
                  },
                  child: Text(
                    _buttonText,
                    style: const TextStyle(
                      color: kwhite,
                      fontSize: 20,
                    ),
                  )
                  ),
                SizedBox(height: height*0.015),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Recent Projects',
                    style: TextStyle(
                      color: kwhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10),
                child: Text('$_response',
                style: TextStyle(
                  color: kwhite,
                  fontSize: 20,
                ),
                ),
                ),
              ],
            ),
        )
      ),
    );
  }
}