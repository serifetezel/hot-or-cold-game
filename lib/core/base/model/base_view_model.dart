import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

abstract class BaseViewModel {
  BuildContext? context;

  void setContext(BuildContext context);
  void init();
}
