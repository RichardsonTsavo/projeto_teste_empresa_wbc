// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$resultAtom = Atom(name: 'HomeStoreBase.result');

  @override
  String get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(String value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  final _$imcInfoAtom = Atom(name: 'HomeStoreBase.imcInfo');

  @override
  String get imcInfo {
    _$imcInfoAtom.reportRead();
    return super.imcInfo;
  }

  @override
  set imcInfo(String value) {
    _$imcInfoAtom.reportWrite(value, super.imcInfo, () {
      super.imcInfo = value;
    });
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  void calculate() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.calculate');
    try {
      return super.calculate();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
result: ${result},
imcInfo: ${imcInfo}
    ''';
  }
}
