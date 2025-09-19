import 'package:flutter/material.dart';

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
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 25),
          _FormWidget(),
          SizedBox(height: 25),
          Text(
            'In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple. ',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          SizedBox(height: 25),
          Text(
            'If you signed up but didn\'t receive the verification email, click here to have it resent. ',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
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
  final TextStyle style = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16.0,
    color: Color(0xFF212519),
  );
  final textFieldDecoration = const InputDecoration(
    contentPadding:  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Username',
          style: style,
        ),
        TextField(
          decoration: InputDecoration(
            
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Password',
          style: style,
          
        ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blue),
            ),
          ),
        ),


        const SizedBox(height: 20),
        Row(
          children: [
            ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.blue
              ),
            ),
            child: const Text('Login', style: TextStyle(fontSize: 18)),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.blue)), 
            child: const Text('Reset password', style: TextStyle(fontSize: 18)),
          ),


          ],
        ),
      ],
    );
  }
}
