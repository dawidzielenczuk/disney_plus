import 'package:disney_plus/app/features/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(isCreatingAccount == true
                        ? 'Zarejestruj sie'
                        : 'Zaloguj się'),
                    TextField(
                      controller: widget.emailController,
                      decoration: const InputDecoration(hintText: 'E-mail'),
                    ),
                    TextField(
                      controller: widget.passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(hintText: 'Hasło'),
                    ),
                    Text(errorMessage),
                    ElevatedButton(
                      onPressed: () async {
                        if (isCreatingAccount == true) {
                          context.read<LoginCubit>().createUser(
                              email: widget.emailController.text,
                              password: widget.passwordController.text);
                        } else {
                          context.read<LoginCubit>().signIn(
                              email: widget.emailController.text,
                              password: widget.passwordController.text);
                        }

                        // if (isCreatingAccount == true) {
                        //   try {
                        //     await FirebaseAuth.instance
                        //         .createUserWithEmailAndPassword(
                        //             email: widget.emailController.text,
                        //             password: widget.passwordController.text);
                        //   } catch (error) {
                        //     setState(() {
                        //       errorMessage = error.toString();
                        //     });
                        //   }
                        // } else {
                        //   try {
                        //     await FirebaseAuth.instance
                        //         .signInWithEmailAndPassword(
                        //             email: widget.emailController.text,
                        //             password: widget.passwordController.text);
                        //   } catch (error) {
                        //     setState(() {
                        //       errorMessage = error.toString();
                        //     });
                        //   }
                        // }
                      },
                      child: Text(isCreatingAccount == true
                          ? 'Zarejestruj sie'
                          : 'Zaloguj'),
                    ),
                    if (isCreatingAccount == false) ...[
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isCreatingAccount = true;
                          });
                        },
                        child: Text('Utwórz konto<-'),
                      ),
                    ],
                    if (isCreatingAccount == true) ...[
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isCreatingAccount = false;
                          });
                        },
                        child: Text('Masz już konto?->'),
                      ),
                    ]
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
