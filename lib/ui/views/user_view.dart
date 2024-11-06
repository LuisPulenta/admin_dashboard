import 'package:admin_dashboard/models/http/usuario.dart';
import 'package:admin_dashboard/providers/user_form_provider.dart';
import 'package:admin_dashboard/providers/users_provider.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserView extends StatefulWidget {
  final String uid;
  const UserView({Key? key, required this.uid}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  Usuario? user;

  //------------------------------------------------------------------------------
  @override
  void initState() {
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    final userFormProvider =
        Provider.of<UserFormProvider>(context, listen: false);

    usersProvider.getUserById(widget.uid).then((userDB) {
      setState(() {
        userFormProvider.user = userDB;
        user = userDB;
      });
    });
  }

  //------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "UserView",
            style: CustomLabels.h1,
          ),
          const SizedBox(
            height: 10,
          ),
          if (user == null)
            WhiteCard(
              child: Container(
                height: 300,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              ),
            ),
          if (user != null) _UserViewBody(),
        ],
      ),
    );
  }
}

//-------------------------------------------------------
class _UserViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        columnWidths: const {
          0: FixedColumnWidth(250),
        },
        children: const [
          TableRow(children: [
            //Avatar
            _AvatarContainer(),
            _UserViewForm(),
          ])
        ],
      ),
    );
  }
}

//-------------------------------------------------------
class _UserViewForm extends StatelessWidget {
  const _UserViewForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;

    return WhiteCard(
      title: 'Información general ${user.correo}',
      child: Form(
        key: userFormProvider.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              initialValue: user.nombre,
              decoration: CustomInput.formInputDecoration(
                hint: 'Nombre del Usuario',
                label: 'Nombre',
                icon: Icons.supervised_user_circle_outlined,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Ingrese un Nombre';
                if (value.length < 2) {
                  return 'El Nombre debe ser de al menos 2 caracteres';
                }
              },
              onChanged: (value) {
                userFormProvider.copyUserWith(nombre: value);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: user.correo,
              decoration: CustomInput.formInputDecoration(
                hint: 'Correo del Usuario',
                label: 'Correo',
                icon: Icons.mark_email_read_outlined,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Ingrese su correo";
                }
                if (!EmailValidator.validate(value)) {
                  return "El correo no tiene formato válido";
                }
                return null;
              },
              onChanged: (value) {
                userFormProvider.copyUserWith(correo: value);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 110,
              ),
              child: ElevatedButton(
                onPressed: () async {
                  final saved = await userFormProvider.updateUser();
                  if (saved) {
                    NotificationsService.showSnackbar('Usuario actualizado');
                    Provider.of<UsersProvider>(context, listen: false)
                        .refreshUser(user);
                  } else {
                    NotificationsService.showSnackbarError(
                        'No se puedo guardar');
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.indigo),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.save_outlined,
                      size: 20,
                    ),
                    Text(' Guardar'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//-------------------------------------------------------
class _AvatarContainer extends StatelessWidget {
  const _AvatarContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;

    return WhiteCard(
        width: 250,
        child: Container(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Profile',
                  style: CustomLabels.h2,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 150,
                  height: 160,
                  child: Stack(
                    children: [
                      const ClipOval(
                        child: Image(
                          image: AssetImage('no-image.jpg'),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 5),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: FloatingActionButton(
                            backgroundColor: Colors.indigo,
                            elevation: 0,
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              size: 20,
                            ),
                            onPressed: () {
                              //TODO Seleccionar la imagen
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(user.nombre, style: TextStyle(fontWeight: FontWeight.bold))
              ]),
        ));
  }
}
