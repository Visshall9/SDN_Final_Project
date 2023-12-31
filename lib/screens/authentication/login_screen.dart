import 'package:flutter_todo_app/provider/internet_provider.dart';
import 'package:flutter_todo_app/provider/sign_in_provider.dart';
import 'package:flutter_todo_app/screens/home.dart';
import 'package:flutter_todo_app/screens/main_screen.dart';
import 'package:flutter_todo_app/utils/config.dart';
import 'package:flutter_todo_app/utils/next_screen.dart';
import 'package:flutter_todo_app/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  final RoundedLoadingButtonController googleController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController facebookController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController twitterController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController phoneController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
          child: Padding(
        padding:
            const EdgeInsets.only(left: 40, right: 40, top: 90, bottom: 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                  child: Image(
                    image: AssetImage(Config.app_icon),
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("       ToDo - Do things",
                      style:
                          TextStyle(fontSize: 30, color: Color.fromARGB(255, 224, 220, 239), fontWeight: FontWeight.w500)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "  Beginning of a productive day",
                    style: TextStyle(fontSize: 23, color: Color.fromARGB(255, 231, 228, 221)),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  Text(
                    "Get started right away by signing in",
                    style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 176, 222, 40)),
                  )
                  
                ],
              ),
            ),

            // roundedbutton
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedLoadingButton(
                  onPressed: () {
                    handleGoogleSignIn();
                  },
                  controller: googleController,
                  successColor: Colors.red,
                  width: MediaQuery.of(context).size.width * 0.80,
                  elevation: 0,
                  borderRadius: 25,
                  color: Colors.red,
                  child: const Wrap(
                    children: [
                      Icon(
                        FontAwesomeIcons.google,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text("Sign in with Google",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // facebook login button
                RoundedLoadingButton(
                  onPressed: () {
                    // handleFacebookAuth();
                  },
                  controller: facebookController,
                  successColor: Colors.blue,
                  width: MediaQuery.of(context).size.width * 0.80,
                  elevation: 0,
                  borderRadius: 25,
                  color: Colors.blue,
                  child: const Wrap(
                    children: [
                      Icon(
                        FontAwesomeIcons.facebook,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text("Sign in with Facebook",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // twitter auth
                RoundedLoadingButton(
                  onPressed: () {
                    // handleFacebookAuth();
                  },
                  controller: twitterController,
                  successColor: Colors.blue,
                  width: MediaQuery.of(context).size.width * 0.80,
                  elevation: 0,
                  borderRadius: 25,
                  color: Colors.blue,
                  child: const Wrap(
                    children: [
                      Icon(
                        FontAwesomeIcons.twitter,
                        size: 20,
                        color: Colors.lightBlueAccent,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text("proceed with Twitter",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            )
          ],
        ),
      )),
    );
  }

  // handling google sigin in
  Future handleGoogleSignIn() async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackbar(context, "Check your Internet connection", Colors.red);
      googleController.reset();
    } else {
      await sp.signInWithGoogle().then((value) {
        if (sp.hasError == true) {
          openSnackbar(context, sp.errorCode.toString(), Colors.red);
          googleController.reset();
        } else {
          // checking whether user exists or not
          sp.checkUserExists().then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        googleController.success();
                        handleAfterSignIn();
                      })));
            } else {
              // user does not exist
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        googleController.success();
                        handleAfterSignIn();
                      })));
            }
          });
        }
      });
    }
  }

  // handling facebookauth
  // handling google sigin in
  // Future handleFacebookAuth() async {
  //   final sp = context.read<SignInProvider>();
  //   final ip = context.read<InternetProvider>();
  //   await ip.checkInternetConnection();

  //   if (ip.hasInternet == false) {
  //     openSnackbar(context, "Check your Internet connection", Colors.red);
  //     facebookController.reset();
  //   } else {
  //     await sp.signInWithFacebook().then((value) {
  //       if (sp.hasError == true) {
  //         openSnackbar(context, sp.errorCode.toString(), Colors.red);
  //         facebookController.reset();
  //       } else {
  //         // checking whether user exists or not
  //         sp.checkUserExists().then((value) async {
  //           if (value == true) {
  //             // user exists
  //             await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
  //                 .saveDataToSharedPreferences()
  //                 .then((value) => sp.setSignIn().then((value) {
  //                       facebookController.success();
  //                       handleAfterSignIn();
  //                     })));
  //           } else {
  //             // user does not exist
  //             sp.saveDataToFirestore().then((value) => sp
  //                 .saveDataToSharedPreferences()
  //                 .then((value) => sp.setSignIn().then((value) {
  //                       facebookController.success();
  //                       handleAfterSignIn();
  //                     })));
  //           }
  //         });
  //       }
  //     });
  //   }
  // }

  // handle after signin
  handleAfterSignIn() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => const MainScreen()));
  }
}
