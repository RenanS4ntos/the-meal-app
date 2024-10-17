import 'package:flutter/material.dart';
import 'package:the_meal_app/constants/assets.dart';
import 'package:the_meal_app/constants/styles.dart';
import 'package:the_meal_app/views/home_view.dart';
import 'package:the_meal_app/views/signup_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // px-16
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(150), // border full
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3), // Cor da sombra
                          spreadRadius: 5, // Espalhamento da sombra
                          blurRadius: 7, // Borrão da sombra
                          offset: const Offset(0, 3), // Deslocamento da sombra
                        ),
                      ],
                    ),
                    child: Image.asset(
                      AppAssets.logo,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      hintText: 'Informe o seu email',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, informe o seu email';
                      }
                      // Regex para validar email
                      final RegExp emailRegex = RegExp(
                        r'^[^@]+@[^@]+\.[^@]+',
                      );
                      if (!emailRegex.hasMatch(value)) {
                        return 'Por favor, informe um email válido';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                        hintText: 'Informe a sua senha',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, informe a sua senha';
                        }
                        if (value.length < 6) {
                          return 'A senha deve ter pelo menos 6 caracteres';
                        }
                        return null;
                      }),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16.0), // margin top
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        // Se o formulário for válido, prossiga com a ação de inscrição
                        print('Dados: ');
                        print(emailController.text);
                        print(passwordController.text);

                        // navegar para tela de produtos
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const HomeView(),
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      textStyle: WidgetStateProperty.all(
                        const TextStyle(color: Colors.white),
                      ),
                      backgroundColor:
                          WidgetStateProperty.all(Colors.deepPurple),
                    ),
                    child: SizedBox(
                      width: double.infinity, // 100% da width
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Entrar ', style: AppStyles.textButton),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Não tem uma conta? '),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SignUpView(),
                          ),
                        );
                      },
                      child: const Text('Cadastre-se'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
