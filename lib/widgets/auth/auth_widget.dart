import 'package:flutter/material.dart';
import 'package:movie_app/Theme/app_button_style.dart';
import 'package:movie_app/main_screen/main_screen_widget.dart';

//26

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login to your account',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(children: [_HeaderWidget()]),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          const _FormWidget(),
          const SizedBox(height: 25),
          const Text(
            'In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple. ',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 5),
          ElevatedButton(onPressed: () {}, child: const Text('Register')),
          const SizedBox(height: 25),
          const Text(
            'If you signed up but didn\'t receive the verification email, click here to have it resent. ',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 5),
          ElevatedButton(onPressed: () {}, child: const Text('Verify email')),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({super.key});

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: "admin");
  final _passwordTextController = TextEditingController(text: 'admin');
  String? errorText = null;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;
 
      Navigator.of(context).pushNamed('/main_screen');
      //Navigator.of(context).pushReplacementNamed('/example_widget');
      
    } else {
      errorText = 'Error, login or password is incorrect';
    }

    setState(() {});
  }

  void _resetPassword() {
    print('Reset password');
  }

  final TextStyle style = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16.0,
    color: Color(0xFF212519),
  );
  final textFieldDecoration = const InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        if (errorText != null) ...[
          Text(
            errorText!,
            style: const TextStyle(color: Colors.red, fontSize: 17),
          ),
          const SizedBox(height: 20),
        ],
        Text('Username', style: style),
        TextField(
          controller: _loginTextController,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(height: 20),
        Text('Password', style: style),
        TextField(
          controller: _passwordTextController,
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blue),
            ),
          ),
        ),

        const SizedBox(height: 20),
        Row(
          children: [
            ElevatedButton(
              onPressed: _auth,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.blue),
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(width: 30),
            ElevatedButton(
              onPressed: _resetPassword,
              style: AppButtonStyle.linkButton,
              child: const Text(
                'Reset password here',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
