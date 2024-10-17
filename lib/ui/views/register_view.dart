import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 370),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  //validator: ,
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInput.loginInputDecoration(
                    hint: "Ingrese su nombre",
                    label: "Nombre",
                    icon: Icons.person,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  //validator: ,
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInput.loginInputDecoration(
                    hint: "Ingrese su correo",
                    label: "Correo",
                    icon: Icons.email_outlined,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  //validator: ,
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInput.loginInputDecoration(
                    hint: "**********",
                    label: "Contraseña",
                    icon: Icons.lock_outline_rounded,
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomOutlinedButton(
                  text: "Crear cuenta",
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                LinkText(
                  text: "Ir al Login",
                  onPressed: () {
                    Navigator.pushNamed(context, Flurorouter.loginRoute);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
