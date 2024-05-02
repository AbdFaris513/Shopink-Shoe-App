import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:shopink/Service/LandingPage/LandingPage.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final _formKey = GlobalKey<FormState>();
  final _mail = TextEditingController();
  final _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            const Padding(
              padding: EdgeInsets.all(24),
              child: Image(
                image: AssetImage('img/NikeShoes.png'),
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            const Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              'Enter your email and password',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _mail,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          border: OutlineInputBorder(),
                          hintText: 'Email or Username',
                          label: Text('Email or Username'),
                          prefixIcon: Icon(Icons.mail),
                          prefixIconColor: Colors.black),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return '* Please Enter a Mail or Username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _pass,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          border: OutlineInputBorder(),
                          hintText: 'Password',
                          label: Text('Password'),
                          prefixIcon: Icon(Icons.lock),
                          prefixIconColor: Colors.black),
                      obscureText: true,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return '* Please Enter a Mail or Username';
                        }
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            print('gbhb');
                          },
                          child: const Text('Forget Password'),
                        )
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => const LandingPage()));
                            Get.toNamed('/landingPage');
                          } else {
                            debugPrint('Please check the validation');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Don\'t have an account? Signup ',
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
