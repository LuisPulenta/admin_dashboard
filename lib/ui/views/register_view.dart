import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(
        builder: (context) {
          final registerFormProvider =
              Provider.of<RegisterFormProvider>(context, listen: false);
          return Container(
            margin: const EdgeInsets.only(top: 80),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 370),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: registerFormProvider.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ingrese su nombre";
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.white),
                        onChanged: (value) {
                          registerFormProvider.name = value;
                        },
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ingrese su correo";
                          }
                          if (!EmailValidator.validate(value)) {
                            return "El correo no tiene formato válido";
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.white),
                        onChanged: (value) {
                          registerFormProvider.email = value;
                        },
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ingrese su contraseña";
                          }
                          if (value.length < 6) {
                            return "La contraseña debe tener al menos 6 caracteres";
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.white),
                        onChanged: (value) {
                          registerFormProvider.password = value;
                        },
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
                        text: "Crear Cuenta",
                        onPressed: () {
                          final validForm = registerFormProvider.validateForm();

                          if (!validForm) return;

                          final authProvider =
                              Provider.of<AuthProvider>(context, listen: false);

                          authProvider.register(
                              registerFormProvider.email,
                              registerFormProvider.password,
                              registerFormProvider.name);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      LinkText(
                        text: "Ingrese con su cuenta",
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
        },
      ),
    );
  }
}
