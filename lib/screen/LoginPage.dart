//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;
  static const route = '/LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;
  TextEditingController _firstController = TextEditingController();
  TextEditingController _secondController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 52, 240, 240),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Sign in, thanks',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _firstController,
                    validator: (value) => EmailValidator.validate(value!)
                        ? null
                        : "Please enter a valid email",
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _secondController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  //  CheckboxListTile(
                  //    title: const Text("Remember me"),
                  //    contentPadding: EdgeInsets.zero,
                  //    value: rememberValue,
                  //    activeColor: Theme.of(context).colorScheme.primary,
                  //    onChanged: (newValue) {
                  //      setState(() {
                  //        rememberValue = newValue!;
                  //      });
                  //    },
                  //    controlAffinity: ListTileControlAffinity.leading,
                  //  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/HomePage').then((value) {
                          _firstController
                              .clear(); //elimina email quando si esce
                          _secondController
                              .clear(); //elimina password quando si esce
                        });
                      } else {
                        //Navigator.pushNamed(context, '/HomePage');
                        //return null;

                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Attenzione !!!'),
                            content: Text(
                                'Email e password\nnon inseriti in modo\ncorretto'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                      primary: Colors.red,
                      elevation: 3.0,
                    ),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //Row(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                  //  children: [
                  //    const Text('Not registered yet?'),
                  //    TextButton(
                  //      onPressed: () {
                  // Navigator.pushReplacement(
                  //    context,
                  //   MaterialPageRoute(
                  //     builder: (context) =>
                  //         const RegisterPage(title: 'Register UI'),
                  //   ),
                  //  );
                  //      },
                  //      child: const Text('Create an account'),
                  //    ),
                  //  ],
                  //  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

