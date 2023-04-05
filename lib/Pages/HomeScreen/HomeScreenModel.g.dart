// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeScreenModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenModel on _HomeScreenModelBase, Store {
  late final _$collectionofInputsAtom =
      Atom(name: '_HomeScreenModelBase.collectionofInputs', context: context);

  @override
  List<String> get collectionofInputs {
    _$collectionofInputsAtom.reportRead();
    return super.collectionofInputs;
  }

  @override
  set collectionofInputs(List<String> value) {
    _$collectionofInputsAtom.reportWrite(value, super.collectionofInputs, () {
      super.collectionofInputs = value;
    });
  }

  late final _$_HomeScreenModelBaseActionController =
      ActionController(name: '_HomeScreenModelBase', context: context);

  @override
  void setInputs({required List<String> collectionofInputs}) {
    final _$actionInfo = _$_HomeScreenModelBaseActionController.startAction(
        name: '_HomeScreenModelBase.setInputs');
    try {
      return super.setInputs(collectionofInputs: collectionofInputs);
    } finally {
      _$_HomeScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
collectionofInputs: ${collectionofInputs}
    ''';
  }
}
