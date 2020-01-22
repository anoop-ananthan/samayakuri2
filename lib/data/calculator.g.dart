// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Calculator on _Calculator, Store {
  Computed<DateTime> _$departureTimeComputed;

  @override
  DateTime get departureTime => (_$departureTimeComputed ??=
          Computed<DateTime>(() => super.departureTime))
      .value;
  Computed<Duration> _$currentTaskTimeComputed;

  @override
  Duration get currentTaskTime => (_$currentTaskTimeComputed ??=
          Computed<Duration>(() => super.currentTaskTime))
      .value;

  final _$totalTimeAtom = Atom(name: '_Calculator.totalTime');

  @override
  Duration get totalTime {
    _$totalTimeAtom.context.enforceReadPolicy(_$totalTimeAtom);
    _$totalTimeAtom.reportObserved();
    return super.totalTime;
  }

  @override
  set totalTime(Duration value) {
    _$totalTimeAtom.context.conditionallyRunInAction(() {
      super.totalTime = value;
      _$totalTimeAtom.reportChanged();
    }, _$totalTimeAtom, name: '${_$totalTimeAtom.name}_set');
  }

  final _$taskTimeAtom = Atom(name: '_Calculator.taskTime');

  @override
  List<Duration> get taskTime {
    _$taskTimeAtom.context.enforceReadPolicy(_$taskTimeAtom);
    _$taskTimeAtom.reportObserved();
    return super.taskTime;
  }

  @override
  set taskTime(List<Duration> value) {
    _$taskTimeAtom.context.conditionallyRunInAction(() {
      super.taskTime = value;
      _$taskTimeAtom.reportChanged();
    }, _$taskTimeAtom, name: '${_$taskTimeAtom.name}_set');
  }

  final _$_CalculatorActionController = ActionController(name: '_Calculator');

  @override
  void addTime(Duration duration) {
    final _$actionInfo = _$_CalculatorActionController.startAction();
    try {
      return super.addTime(duration);
    } finally {
      _$_CalculatorActionController.endAction(_$actionInfo);
    }
  }
}
