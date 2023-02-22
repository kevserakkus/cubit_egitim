import 'package:cubbit_egitim/core/consts/colors.dart';
import 'package:cubbit_egitim/features/presentation/register_cubit/register_cubit.dart';
import 'package:cubbit_egitim/features/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Text("Kayıt Sayfasına Hoş Geldiniz"),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(label: Text("Kullanıcı Adı")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(label: Text("Şifre")),
                ),
              ),
              BlocConsumer<RegisterCubit, RegisterState>(
                listener: (context, state) {
                  if (state is RegisterComplete) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MainView()));
                  }
                  if (state is RegisterError) {
                    Flushbar(
                      flushbarPosition: FlushbarPosition.TOP,
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 3),
                      titleText: Text(
                        "Üzgünüm, Giriş Yapılamadı",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.white,
                            fontFamily: "ShadowsIntoLightTwo"),
                      ),
                      messageText: Text(
                        "Lütfen geçerli bir kullanıcı adı ve şifre girin",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontFamily: "ShadowsIntoLightTwo"),
                      ),
                    )..show(context);
                  }
                },
                builder: (context, state) {
                  if (state is RegisterLoading) {
                    return SizedBox(
                      height: 160,
                      width: 160,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                    );
                  } else {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.only(
                                left: 38, right: 38, top: 26, bottom: 26),
                            backgroundColor: ColorsPalette.primary),
                        onPressed: () {
                          context.read<RegisterCubit>().register(
                              _usernameController.text,
                              _passwordController.text,
                              0);
                        },
                        child: Text("Kayıt Ol"));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
