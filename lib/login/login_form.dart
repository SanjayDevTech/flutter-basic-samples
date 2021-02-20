import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_samples/home/home_screen.dart';

enum LoginState {
  LOGIN_IDLE,
  LOGIN_FAILED,
  LOGIN_PENDING,
  LOGIN_SUCCESS,
}

final emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

final pwdRegex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

class LoginForm extends StatefulWidget {
  final emailController = TextEditingController();
  final pwdController = TextEditingController();

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginState _state;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _state = LoginState.LOGIN_IDLE;
  }

  Future<String> signInUser(String email, String pwd) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pwd,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      print(e);
      return 'Unknown error';
    }
  }

  Future<String> registerUser(String email, String pwd) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pwd,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      print(e);
      return 'Unknown error';
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Rendered');
    return Center(
      child: SizedBox(
        height: 500,
        width: 300,
        child: Card(
          elevation: 8,
          clipBehavior: Clip.antiAlias,
          child: (_state == LoginState.LOGIN_PENDING || _state == LoginState.LOGIN_SUCCESS)
              ? Center(child: CircularProgressIndicator())
              : Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildTextField(
                        widget.emailController,
                        placeholder: 'Email address',
                        validator: (email) {
                          if (email.trim().isEmpty) return 'Email is empty';
                          if (!emailRegex.hasMatch(email.trim()))
                            return 'Invalid email address';
                          return null;
                        },
                      ),
                      _buildTextField(
                        widget.pwdController,
                        placeholder: 'Password',
                        hideText: true,
                        validator: (pwd) {
                          if (pwd.trim().isEmpty) return 'Password is empty';
                          if (!pwdRegex.hasMatch(pwd.trim()))
                            return 'Password does not meet requirements';
                          return null;
                        },
                      ),
                      _buildActionRows(),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildActionRows() {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlineButton(
          onPressed: () async {
            if (!formKey.currentState.validate()) return;
            setState(() {
              _state = LoginState.LOGIN_PENDING;
            });
            final result = await signInUser(
              widget.emailController.value.text.trim(),
              widget.emailController.value.text.trim(),
            );
            if (result == null) {
              setState(() {
                _state = LoginState.LOGIN_SUCCESS;
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              });
            } else {
              setState(() {
                _state = LoginState.LOGIN_FAILED;
              });
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(result),
              ));
            }
          },
          child: const Text('Login'),
        ),
        ElevatedButton(
          onPressed: () async {
            if (!formKey.currentState.validate()) return;
            setState(() {
              _state = LoginState.LOGIN_PENDING;
            });
            final result = await registerUser(
              widget.emailController.value.text.trim(),
              widget.emailController.value.text.trim(),
            );
            if (result == null) {
              setState(() {
                _state = LoginState.LOGIN_SUCCESS;
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              });
            } else {
              setState(() {
                _state = LoginState.LOGIN_FAILED;
              });
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(result),
              ));
            }
          },
          child: const Text('Register'),
        ),
      ],
    );
  }

  Widget _buildTextField(
    TextEditingController controller, {
    String placeholder,
    FormFieldValidator<String> validator,
    bool hideText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 200,
        child: TextFormField(
          validator: validator,
          obscureText: hideText,
          style: TextStyle(fontSize: 18, height: 1.5),
          decoration: InputDecoration(
            labelText: placeholder,
            contentPadding: const EdgeInsets.all(5),
          ),
          controller: controller,
        ),
      ),
    );
  }
}
