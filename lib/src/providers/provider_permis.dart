import 'package:flutter/widgets.dart';

class Permis with ChangeNotifier {
  Map<String, bool> propietario;
  Map<String, bool> grupo;
  Map<String, bool> otros;

  String _result = "000";

  Permis(
      {@required this.propietario, @required this.grupo, @required this.otros});

  static const Map<String, int> _identificadores = {
    "000": 0,
    "001": 1,
    "010": 2,
    "011": 3,
    "100": 4,
    "101": 5,
    "110": 6,
    "111": 7,
  };

  get id {
    return this._result;
  }

  set id(String newValue) {
    this._result = newValue;
    notifyListeners();
  }

  updateId(
      {bool propietarioLectura,
      bool propietarioEscritura,
      bool propietarioEjecucion,
      bool grupoLectura,
      bool grupoEscritura,
      bool grupoEjecucion,
      bool otrosLectura,
      bool otrosEscritura,
      bool otrosEjecucion}) {
    final List<int> idPropietario = [];
    final List<int> idGrupo = [];
    final List<int> idOtros = [];
    final List<int> idResult = [];

    if (propietarioLectura != null) {
      this.propietario["r"] = propietarioLectura;
    }
    if (propietarioEscritura != null) {
      this.propietario["w"] = propietarioEscritura;
    }
    if (propietarioEjecucion != null) {
      this.propietario["x"] = propietarioEjecucion;
    }
    if (grupoLectura != null) {
      this.grupo["r"] = grupoLectura;
    }
    if (grupoEscritura != null) {
      this.grupo["w"] = grupoEscritura;
    }
    if (grupoEjecucion != null) {
      this.grupo["x"] = grupoEjecucion;
    }
    if (otrosLectura != null) {
      this.otros["r"] = otrosLectura;
    }
    if (otrosEscritura != null) {
      this.otros["w"] = otrosEscritura;
    }
    if (otrosEjecucion != null) {
      this.otros["x"] = otrosEjecucion;
    }

    this.propietario.forEach((key, valor) {
      if (valor == false) {
        idPropietario.add(0);
      } else {
        idPropietario.add(1);
      }
    });

    this.grupo.forEach((key, valor) {
      if (valor == false) {
        idGrupo.add(0);
      } else {
        idGrupo.add(1);
      }
    });

    this.otros.forEach((key, valor) {
      if (valor == false) {
        idOtros.add(0);
      } else {
        idOtros.add(1);
      }
    });

    _identificadores.forEach((key, valor) {
      if (idPropietario.join() == key) {
        idResult.add(valor);
      }
    });

    _identificadores.forEach((key, valor) {
      if (idGrupo.join() == key) {
        idResult.add(valor);
      }
    });

    _identificadores.forEach((key, valor) {
      if (idOtros.join() == key) {
        idResult.add(valor);
      }
    });

    this.id = idResult.join();
  }
}
