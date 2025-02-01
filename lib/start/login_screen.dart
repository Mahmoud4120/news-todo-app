import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool obscureText = true;

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
                children: [
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: emailController,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    validator: (value) {
                      if ( value!.isEmpty) {
                        return 'Email address must not be empty!';
                      }

                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Email Address',
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: passwordController,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: obscureText,
                    validator: (value) {
                      if ( value!.isEmpty) {
                        return 'Password must not be empty!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            icon: obscureText
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      color: Colors.blue,
                      width: double.infinity,
                      child: MaterialButton(
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            if (
                                formKey.currentState!.validate()) {
                              print(emailController.text);
                              print(passwordController.text);
                            }
                          })),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account? '),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Register Now',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
