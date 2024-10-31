import 'package:admin_dashboard/models/http/category.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryModal extends StatefulWidget {
  final Categoria? categoria;

  const CategoryModal({Key? key, this.categoria}) : super(key: key);

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String nombre = '';
  String? id;

//---------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();

    id = widget.categoria?.id;
    nombre = widget.categoria?.nombre ?? '';
  }

//---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    final categoryProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    return Container(
      padding: const EdgeInsets.all(20),
      height: 500,
      width: 300,
      decoration: buildBoxDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.categoria?.nombre ?? 'Nueva Categoría',
                style: CustomLabels.h1.copyWith(color: Colors.white),
              ),
              IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          ),
          Divider(
            color: Colors.white.withOpacity(0.3),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              Expanded(
                child: TextFormField(
                  initialValue: widget.categoria?.nombre ?? '',
                  onChanged: (value) {
                    nombre = value;
                  },
                  decoration: CustomInput.loginInputDecoration(
                    hint: 'Nombre de la Categoría',
                    label: 'Categoría',
                    icon: Icons.category_outlined,
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const Spacer(),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlinedButton(
              onPressed: () async {
                try {
                  if (id == null) {
                    await categoryProvider.newCategory(nombre);
                    NotificationsService.showSnackbar(
                        "Categoría agregada con éxito");
                  } else {
                    await categoryProvider.updateCategory(id!, nombre);

                    NotificationsService.showSnackbar(
                        "Cambios guardados con éxito");
                  }
                  Navigator.of(context).pop();
                } catch (e) {
                  Navigator.of(context).pop();
                  NotificationsService.showSnackbarError(
                      "No se pudo guardar la Categoría");
                }
              },
              text: "Guardar",
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  //---------------------------------------------------------------------------
  BoxDecoration buildBoxDecoration() => const BoxDecoration(
          color: Color(0xff0f2041),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
            )
          ]);
}
