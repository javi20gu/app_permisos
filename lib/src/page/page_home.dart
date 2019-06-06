import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:permisos_app/src/providers/provider_permis.dart';
import 'package:permisos_app/src/utils/util_permis.dart';

import 'package:permisos_app/src/widgets/widget_custom_appbar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Permis permisos = Provider.of<Permis>(context);
    return Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(103, 114, 241, 1),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 3, offset: Offset(0, -5))
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 13),
                child: Text(
                  permisos.id,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontFamily: "AirbnbCereal-Black"),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Container(
            color: Color.fromRGBO(245, 247, 250, 1),
            child: Column(
              children: <Widget>[
                CustomAppBar(),
                body(),
              ],
            ),
          ),
        ));
  }

  Widget body() {
    return Expanded(
      child: ListView(
        children: <Widget>[
          WidgetPermisos(title: "Propietario"),
          WidgetPermisos(title: "Grupo"),
          WidgetPermisos(title: "Otros"),
          SizedBox(
            height: 34,
          )
        ],
      ),
    );
  }
}

class WidgetPermisos extends StatefulWidget {
  final String title;

  WidgetPermisos({Key key, @required this.title}) : super(key: key);

  WidgetPermisosState createState() => WidgetPermisosState();
}

class WidgetPermisosState extends State<WidgetPermisos> {
  bool propietarioLectura = false;
  bool propietarioEscritura = false;
  bool propietarioEjecucion = false;
  bool grupoLectura = false;
  bool grupoEscritura = false;
  bool grupoEjecucion = false;
  bool otrosLectura = false;
  bool otrosEscritura = false;
  bool otrosEjecucion = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 34,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            widget.title,
            style: TextStyle(fontFamily: "AirbnbCereal-Book"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        blurRadius: 2,
                        offset: Offset(0, 1)),
                  ]),
              width: double.infinity,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: verificar())),
        ),
      ],
    );
  }

  Widget permiso(Permisos name, String namePermiso, bool valor) {
    final Permis permisos = Provider.of<Permis>(context);
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        namePermiso,
        style: TextStyle(fontFamily: 'AirbnbCereal-Medium', fontSize: 18),
      ),
      value: valor,
      onChanged: (bool valorNuevo) {
        setState(() {
          switch (name) {
            case Permisos.PROPIETARIO_LECTURA:
              propietarioLectura = valorNuevo;
              permisos.updateId(propietarioLectura: valorNuevo);
              break;
            case Permisos.PROPIETARIO_ESCRITURA:
              propietarioEscritura = valorNuevo;
              permisos.updateId(propietarioEscritura: valorNuevo);
              break;
            case Permisos.PROPIETARIO_EJECUCION:
              propietarioEjecucion = valorNuevo;
              permisos.updateId(propietarioEjecucion: valorNuevo);
              break;
            case Permisos.GRUPO_LECTURA:
              grupoLectura = valorNuevo;
              permisos.updateId(grupoLectura: valorNuevo);
              break;
            case Permisos.GRUPO_ESCRITURA:
              grupoEscritura = valorNuevo;
              permisos.updateId(grupoEscritura: valorNuevo);
              break;
            case Permisos.GRUPO_EJECUCION:
              grupoEjecucion = valorNuevo;
              permisos.updateId(grupoEjecucion: valorNuevo);
              break;
            case Permisos.OTROS_LECTURA:
              otrosLectura = valorNuevo;
              permisos.updateId(otrosLectura: valorNuevo);
              break;
            case Permisos.OTROS_ESCRITURA:
              otrosEscritura = valorNuevo;
              permisos.updateId(otrosEscritura: valorNuevo);
              break;
            case Permisos.OTROS_EJECUCION:
              otrosEjecucion = valorNuevo;
              permisos.updateId(otrosEjecucion: valorNuevo);
              break;
          }
        });
      },
    );
  }

  Widget verificar() {
    List<Widget> elementos = [];

    if (widget.title == "Propietario") {
      elementos.add(
          permiso(Permisos.PROPIETARIO_LECTURA, "Lectura", propietarioLectura));
      elementos.add(permiso(
          Permisos.PROPIETARIO_ESCRITURA, "Escritura", propietarioEscritura));
      elementos.add(permiso(
          Permisos.PROPIETARIO_EJECUCION, "Ejecución", propietarioEjecucion));
    } else if (widget.title == "Grupo") {
      elementos.add(permiso(Permisos.GRUPO_LECTURA, "Lectura", grupoLectura));
      elementos
          .add(permiso(Permisos.GRUPO_ESCRITURA, "Escritura", grupoEscritura));
      elementos
          .add(permiso(Permisos.GRUPO_EJECUCION, "Ejecución", grupoEjecucion));
    } else if (widget.title == "Otros") {
      elementos.add(permiso(Permisos.OTROS_LECTURA, "Lectura", otrosLectura));
      elementos
          .add(permiso(Permisos.OTROS_ESCRITURA, "Escritura", otrosEscritura));
      elementos
          .add(permiso(Permisos.OTROS_EJECUCION, "Ejecución", otrosEjecucion));
    }
    return Column(children: elementos);
  }
}
