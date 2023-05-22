// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_cold_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HotColdViewModel on _HotColdViewModelBase, Store {
  late final _$isVisibleAtom =
      Atom(name: '_HotColdViewModelBase.isVisible', context: context);

  @override
  bool get isVisible {
    _$isVisibleAtom.reportRead();
    return super.isVisible;
  }

  @override
  set isVisible(bool value) {
    _$isVisibleAtom.reportWrite(value, super.isVisible, () {
      super.isVisible = value;
    });
  }

  late final _$resultEnumAtom =
      Atom(name: '_HotColdViewModelBase.resultEnum', context: context);

  @override
  ResultEnum get resultEnum {
    _$resultEnumAtom.reportRead();
    return super.resultEnum;
  }

  @override
  set resultEnum(ResultEnum value) {
    _$resultEnumAtom.reportWrite(value, super.resultEnum, () {
      super.resultEnum = value;
    });
  }

  late final _$_HotColdViewModelBaseActionController =
      ActionController(name: '_HotColdViewModelBase', context: context);

  @override
  void changeVisibility() {
    final _$actionInfo = _$_HotColdViewModelBaseActionController.startAction(
        name: '_HotColdViewModelBase.changeVisibility');
    try {
      return super.changeVisibility();
    } finally {
      _$_HotColdViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isHotOrCold(int guess) {
    final _$actionInfo = _$_HotColdViewModelBaseActionController.startAction(
        name: '_HotColdViewModelBase.isHotOrCold');
    try {
      return super.isHotOrCold(guess);
    } finally {
      _$_HotColdViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isVisible: ${isVisible},
resultEnum: ${resultEnum}
    ''';
  }
}
