import 'package:flutter/material.dart';
import 'package:udemy/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Text(
                    'Login ',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  //email
                  buildDefaultFieldText(
                    controller: emailController,
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    label: 'Email Address',
                    validator: (value) {
                      if (value.isEmpty)
                        return 'email address must not be empty ';
                      else
                        return null;
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    onSubmit: (value) {
                      print(value);
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  //Password
                  buildDefaultFieldText(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isPassword,
                    prefixIcon: Icons.lock,
                    suffixIcon: isPassword ?Icons.visibility:Icons.visibility_off,
                    suffixPressed: (){
                      setState(() {
                       isPassword= !isPassword;
                      });
                    },
                    label: 'Password ',
                    onSubmit: (value) {
                      print(value);
                    },
                    validator: (value) {
                      if (value.isEmpty)
                        return 'password must not be empty ';
                      else
                        return null;
                    },
                    onChanged: (value) {
                      print(value);
                    },

                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  buildDefaultButton(
                      text: 'Login',
                      function: () {
                        if (formKey.currentState.validate()) {
                          print(emailController.text);
                          print(passwordController.text);
                        }
                      }),

                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account ?'),
                      TextButton(
                        onPressed: () {},
                        child: Text('Register Now'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
