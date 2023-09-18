import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task1_muskan/models/login_response.dart';
import 'package:flutter_task1_muskan/router/my_router.dart';
import 'package:go_router/go_router.dart';

import '../providers/login_state.dart';
import '../providers/shared_preference_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    ref.invalidate(loginStateProvider);
  }

  @override
  Widget build(BuildContext context) {

    // ref.listen(loginStateProvider, (previous, next) {
    //   next.when(initial: initial, success: success, loading: loading, error: error)
    // });
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login Screen"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Container(
              height: 150.0,
              width: 190.0,
              padding: const EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
              ),
              child: Center(
                child: Image.asset('assets/images/krishna.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
              child: TextFormField(
                controller: emailTextController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                  hintText: 'Enter valid mail id as abc@gmail.com',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field can\'t be empty';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: passwordTextController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter your secure password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field can\'t be empty';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {
                      final user = {
                        "email": emailTextController.text,
                        "password": passwordTextController.text
                      };
                      ref
                          .read(loginStateProvider.notifier)
                          .login(user)
                          .then((result) =>
                      {
                        result.when(initial: () {
                          print("on Register");
                        }, success: (data) {
                          ref.read(sharedUtilityProvider).setToken(
                              token: (data as LoginResponse).token ?? "");
                          showSnackbar(
                              context, "Logged in successfully");
                          emailTextController.clear();
                          passwordTextController.clear();
                          context.go(MyRouter.dashboardScreen);
                        }, loading: () {
                          return const CircularProgressIndicator();
                        }, error: (msg) {
                          showSnackbar(context, msg);
                        })
                      });
                    }
                  },
                  child: const Center(
                    child: Text("Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w900)),
                  )),
            ),

            Center(
              child: TextButton(
                child: const Text(
                    "Don't have an account? Click here to reigter",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300)),
                onPressed: () {
                  context.pushNamed(MyRouter.registrationScreen);
                },
              ),
            )

          ],
        ),
      ),
    );


    //   @override
    // Widget build(BuildContext context) {
    //   return Scaffold(
    //     appBar: AppBar(
    //       title: Text("Login Screen"),
    //       backgroundColor: Colors.blue,
    //     ),
    //     body: Column(
    //       children: [
    //         Container(
    //           height: 150.0,
    //           width: 190.0,
    //           padding: const EdgeInsets.only(top: 40),
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(200),
    //           ),
    //           child: Center(
    //             child: Image.asset('assets/images/krishna.png'),
    //           ),
    //         ),
    //         const Padding(
    //           padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
    //           child: TextField(
    //             decoration: InputDecoration(
    //                 border: OutlineInputBorder(),
    //                 labelText: 'User Name',
    //                 hintText: 'Enter valid mail id as abc@gmail.com'),
    //           ),
    //         ),
    //         const Padding(
    //           padding: EdgeInsets.all(10),
    //           child: TextField(
    //             obscureText: true,
    //             decoration: InputDecoration(
    //                 border: OutlineInputBorder(),
    //                 labelText: 'Password',
    //                 hintText: 'Enter your secure password'),
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(10.0),
    //           child: ElevatedButton(
    //               onPressed: () {},
    //               child: const Center(
    //                 child: Text("Login",
    //                     style: TextStyle(
    //                         color: Colors.white,
    //                         fontSize: 16.0,
    //                         fontWeight: FontWeight.w900)),
    //               )),
    //         ),
    //        Center(
    //           child: TextButton(
    //             child: const Text("Don't have an account? Click here to reigter",
    //                 style: TextStyle(
    //                     color: Colors.black,
    //                     fontSize: 14.0,
    //                     fontWeight: FontWeight.w300)),
    //             onPressed: (){
    //               context.pushNamed(MyRouter.registrationScreen);
    //             },
    //           ),
    //         )
    //       ],
    //     ),
    //   );
    // }
  }

  bool isValidate() {
    if (emailTextController.text.isNotEmpty &&
        passwordTextController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  void showSnackbar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
