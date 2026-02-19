import 'dart:developer' as developer;
import 'package:controleseventos/src/model/computador.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Registro2 extends StatefulWidget {
  const Registro2({super.key});

  @override
  State<Registro2> createState() => _Registro2State();
}

class _Registro2State extends State<Registro2> {
  final Computador model = Computador.init();
  final ScrollController controller = ScrollController();
  String dropdownValue = 'Seleccione';
  DateTime dateTimeDefault = DateTime(2030, 2, 1, 10, 20);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>(); // permite capturar datos del form
  bool onSaving = false;
  bool visible = true;

  _saveForm() async {
    if (!formKey.currentState!.validate()) return; // valida datos

    formKey.currentState!.save();
    setState(() {
      onSaving = true;
    });

    if (visible == true) {
      setState(() {
        visible = false;
      });
    } else {
      setState(() {
        visible = true;
      });
    }

    developer.log("El computador con los valores:");
    developer.log("Modelo: ${model.modelo}");
    developer.log("Marca: ${model.marca}");
    developer.log("Año: ${model.anio}");
    developer.log("Facultad: $dropdownValue");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Registro guardado"),
        duration: Duration(seconds: 6),
      ),
    );
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "El nombre no puede estar vacío";
    }
    return null;
  }

  String? _validateDescripcion(String? value) {
    if (value == null || value.isEmpty) {
      return "La descripción no puede estar vacía";
    }
    return null;
  }

  String? _validateAnio(String? value) {
    if (value == null || value.isEmpty) {
      return "El año no puede estar vacío";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 7.0),
      child: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Text("Nuevo Computador",
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    maxLength: 75,
                    decoration: const InputDecoration(
                      hintText: "Nombre",
                      prefixIcon: Icon(Icons.shop),
                    ),
                    onSaved: (value) => model.modelo = value,
                    validator: (value) => _validateName(value),
                  ),
                  TextFormField(
                    maxLines: 3,
                    maxLength: 255,
                    decoration: const InputDecoration(
                      hintText: "Descripción",
                      prefixIcon: Icon(Icons.shop),
                    ),
                    onSaved: (value) => model.marca = value,
                    validator: (value) => _validateDescripcion(value),
                  ),
                  TextFormField(
                    maxLength: 4,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Año",
                      prefixIcon: Icon(Icons.shop),
                    ),
                    onSaved: (value) => model.anio = int.tryParse(value ?? "0"),
                    validator: (value) => _validateAnio(value),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Facultad:  ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.0),
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.menu),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: const [
                          DropdownMenuItem<String>(
                            value: 'Seleccione',
                            child: Text('--Seleccione--'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Software',
                            child: Text('Software'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Automotriz',
                            child: Text('Automotriz'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Fecha:  ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.0),
                      ),
                      CupertinoButton(
                        child: const Text('Seleccionar'),
                        onPressed: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) => SizedBox(
                              height: 250,
                              child: CupertinoDatePicker(
                                backgroundColor: Colors.white,
                                initialDateTime: dateTimeDefault,
                                onDateTimeChanged: (DateTime newDateTime) {
                                  setState(() =>
                                      dateTimeDefault = newDateTime);
                                },
                                use24hFormat: true,
                                mode: CupertinoDatePickerMode.date,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: onSaving
                        ? Visibility(
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: visible,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(top: 50, bottom: 30),
                              child: const CircularProgressIndicator(),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: _saveForm,
                            child: const Text("Guardar"),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
