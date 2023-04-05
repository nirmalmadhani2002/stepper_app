import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Color(0xffedfaf1),
          statusBarIconBrightness: Brightness.dark),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffedfaf1),
        appBar: AppBar(
          backgroundColor: Color(0xff61cd8f),
          title: const Text(
            "Stepper App",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          children: [
            Stepper(
              currentStep: currentStep,
              onStepTapped: (val) {
                setState(() {
                  currentStep = val;
                });
               },
              onStepContinue: () {
                setState(() {
                  if (currentStep < 2) currentStep++;
                  });
              },
              onStepCancel: () {
                setState(() {
                  if (currentStep > 0) currentStep--;
                  });
              },
              steps: [
                Step(
                  isActive: currentStep >= 0,
                  title: const Text("Sing up"),
                  content: Column(
                    children: [
                      TextField(
                        cursorColor: Color(0xff61cd8f),
                        decoration: decoration(
                            Icons.person_outline, "Full Name"),
                      ),
                      const SizedBox(height: 10,),
                      TextField(
                        cursorColor: Color(0xff61cd8f),
                        decoration: decoration(
                            Icons.email_outlined, "Email Address"),
                      ),
                      const SizedBox(height: 10,),
                      TextField(
                        cursorColor: Color(0xff61cd8f),
                        decoration: decoration(Icons.lock_outline, "Password"),
                      ),
                      const SizedBox(height: 10,),
                      TextField(
                        cursorColor: Color(0xff61cd8f),
                        decoration:
                        decoration(Icons.lock_outline, "Conform Password"),
                      ),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
                Step(
                  isActive: currentStep >= 1,
                  title: const Text("Login"),
                  content: Column(
                    children: [
                      TextField(
                        cursorColor: Color(0xff61cd8f),
                        decoration: decoration(
                            Icons.person_outline, "User Name"),
                      ),
                      const SizedBox(height: 10,),
                      TextField(
                        cursorColor: Color(0xff61cd8f),
                        decoration: decoration(Icons.lock_outline, "Password"),
                      ),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
                Step(
                  isActive: currentStep >= 2,
                  title: const Text("Home"),
                  content: Container(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  decoration(icon, String hint) {
    return InputDecoration(
      icon: Icon(icon,color: Color(0xff61cd8f),),
      iconColor: Color(0xff61cd8f),
      hintText: hint,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.black),
      ),
      filled: true,
      fillColor: Colors.white
    );
  }
}