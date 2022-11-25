import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {

  static String id= 'welcome_screen';

  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation animation;


  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    animation = ColorTween(
      begin: Colors.blueGrey ,
      end:Colors.white ,
    ).animate(controller);

    controller.forward();

    // animation.addStatusListener((status) {
    //   if(status == AnimationStatus.completed){
    //     controller.reverse(from: 1);
    //   }else if (status == AnimationStatus.dismissed){
    //     controller.forward();
    //   };
    // });

    controller.addListener(() {
      setState(() {});
      // print(controller.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(tag:'logo',
                  child: SizedBox(
                    height: controller.value*60,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
            SizedBox(
              child: DefaultTextStyle(
              style: const TextStyle(
              fontSize: 45.0,
              fontWeight: FontWeight.w900,
              color: Colors.black
            ),
                child: AnimatedTextKit(
                animatedTexts: [
                TypewriterAnimatedText('Flash Chat'),
              ],
            ),
          ),
        )
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(colour: Colors.lightBlueAccent, title: 'Log In', onTap:(){
              Navigator.pushNamed(context, LoginScreen.id);
            } ,),
            RoundedButton(colour: Colors.blueAccent, title: 'Register', onTap: () {
              Navigator.pushNamed(context, RegistrationScreen.id);
            },)
          ],
        ),
      ),
    );
  }
}

