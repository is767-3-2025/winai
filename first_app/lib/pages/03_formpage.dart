import 'package:first_app/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  int _passwordLength = 0;
  bool _showPassword = false;
  String? _username;
  String? _password;

  String? _validateTextField(String fieldName, String? value, int length) {
    if (value!.isEmpty) {
      return '$fieldName must not be empty';
    }

    if (value.length <= length) {
      return '$fieldName must longer than $length chars';
    }
    
    return null;
  }

  @override
  void initState() {
    super.initState();
    _username = context.read<LoginModel>().username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Form Page'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: _username,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.person),
                  hintText: 'What is your username?',
                  labelText: 'Username',
                ),
                onSaved: (newValue) {
                  _username = newValue;
                },
                validator: (value) {
                  return _validateTextField('Username', value, 5);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: !_showPassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.password),
                  hintText: 'What is your password?',
                  labelText: 'Password',
                  suffixText: '$_passwordLength',
                  suffixIcon: GestureDetector(
                    child: Icon(Icons.security),
                    onLongPress: () async {
                      setState(() {
                        _showPassword = true;
                      });

                      await Future.delayed(Duration(
                        seconds: 5,
                      ));

                      setState(() {
                        _showPassword = false;
                      });
                    },
                  ),
                ),
                onSaved: (newValue) {
                  _password = newValue;
                },
                onChanged: (value) {
                  setState(() {
                    _passwordLength = value.length;
                  });
                },
                validator: (value) {
                  return _validateTextField('Password', value, 8);
                },
              ),
            ),
            ElevatedButton(
              child: Text('Log in'),
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Input is not valid')),
                  );

                  return;
                }

                _formKey.currentState!.save();

                context.read<LoginModel>().username = _username;

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Login: $_username with $_password'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}