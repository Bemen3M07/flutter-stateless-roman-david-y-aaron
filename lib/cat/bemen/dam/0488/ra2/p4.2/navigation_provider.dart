import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int pageIndex = 0;        // 0 = stateless, 1 = stateful
  int exerciseIndex = 0;    // ejercicio seleccionado

  void setPage(int index) {
    pageIndex = index;
    exerciseIndex = 0; // al cambiar de página reseteamos el ejercicio
    notifyListeners();
  }

  void setExercise(int index) {
    exerciseIndex = index;
    notifyListeners();
  }
}
