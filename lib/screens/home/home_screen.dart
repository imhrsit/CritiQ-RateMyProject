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
    final prompt = 'Analyse this project based on the url given below and first give the overall rating for this website out of 10 and then rate it in different categories in the following order - 1. Functionality & Usability 2. Content 3. Design & Aesthetics 4. Technical Aspects 5. User Experience (UX) 6. Branding & Messaging 7. Social Proof & Trust 8. Call to Action (CTA) 9. Analytics & Tracking 10. Future-Proofing. URL - ${_urlController.text}. If you are not able to analyze the given URL then give any demo overall rating and category ratings but do not show any other message in any case.';
    try {
      final response = await http.post(
        Uri.parse('${Constants.uri}/api/gemini'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'message': prompt,
        }),
      );
      if (response.statusCode == 200) {
        setState(() {
          _response = response.body;
          _response = response.body.replaceAll(RegExp(r'[*#]'), '').trim();
          _response = _response.replaceAll(RegExp(r'\\n'), '\n');
          _response = _response.replaceAll(RegExp(r'["{}]'), '').trim();
          _response = _response.split('response:')[1].trim();
          
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: kwhite,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.elliptical(15, 15)),
          ),
          content: Text(
            'Failed to analyze the project',
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
          physics: const BouncingScrollPhysics(),
          primary: true,
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
                                  'Hey, I`m watching your ratings. your last project stands at. See you at the leaderboard! 🏆',
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
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: 'Enter URL here...',
                        hintStyle: const TextStyle(color: kwhite),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: kwhite),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: kwhite),
                        ),
                      ),
                      style: const TextStyle(color: kwhite),
                      validator: (value) {
                        if (value==null || value.isEmpty || value.length < 7 ) {
                          return 'Please enter a valid URL';
                        }
                        if (value.contains('http') == false && value.contains('www') == false && value.contains('.com') == false && value.contains('.in') == false && value.contains('.org') == false && value.contains('.net') == false && value.contains('.tech') == false && value.contains('localhost') == false && value.contains('.gov')==false) {
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
                        setState(() {
                          _buttonText = 'Analyzing...';
                        });
                        _sendMessage().then((value) => setState(() {
                          _buttonText = 'Analyze';
                        }),
                        );
                      }
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
                SizedBox(height: height*0.03),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Project Overview',
                    style: TextStyle(
                      color: kwhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: height*0.015,),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 100),                
                  child: Text(
                    _response,
                  style: const TextStyle(
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