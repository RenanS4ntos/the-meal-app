import 'package:flutter/material.dart';
import 'package:the_meal_app/constants/assets.dart';
import 'package:the_meal_app/constants/styles.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Image.asset(
                      AppAssets.signupLogo,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(top: 24, bottom: 24), // margin top
                  child: Text('Crie sua conta', style: AppStyles.title),
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
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16.0), // margin top
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        // Se o formulário for válido, prossiga com a ação de inscrição
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
                            Text('Criar ', style: AppStyles.textButton),
                            const Icon(
                              Icons.check_circle_outlined,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
