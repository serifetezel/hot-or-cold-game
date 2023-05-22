import 'dart:math';

import 'package:flutter/material.dart';

import 'package:hot_or_cold_game/view/home/model/result_enum.dart';
import 'package:mobx/mobx.dart';
part 'hot_cold_viewmodel.g.dart';

class HotColdViewModel = _HotColdViewModelBase with _$HotColdViewModel;

abstract class _HotColdViewModelBase with Store {
  int randomNumber = 0;
  int _difference = 0;
  int _differenceAfter = 0;
  final myController = TextEditingController();

  @observable
  bool isVisible = false;

  @observable
  ResultEnum resultEnum = ResultEnum.NORMAL;

  @override
  void init() {
    initRandom();
  }

  void initRandom() {
    Random random = Random();
    randomNumber = random.nextInt(100);
  }

  @action
  void changeVisibility() {
    isVisible = !isVisible;
  }

  @action
  void isHotOrCold(int guess) {
    _difference = guess - randomNumber;
    if (_difference != 0) {
      if (_difference.abs() > _differenceAfter.abs()) {
        resultEnum = ResultEnum.COLD;
      } else {
        resultEnum = ResultEnum.HOT;
      }
    } else {
      resultEnum = ResultEnum.HIT;
    }
    _differenceAfter = _difference;
    myController.text = "";
  }
}
