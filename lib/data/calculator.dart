import 'package:mobx/mobx.dart';

part 'calculator.g.dart';

class Calculator = _Calculator with _$Calculator;

abstract class _Calculator with Store {
  DateTime firstPunch;

  @observable
  Duration totalTime;

  @observable
  List<Duration> taskTime;

  Duration breakTime;

  @computed
  DateTime get departureTime =>
      this.firstPunch.add(Duration(hours: 8)).add(this.breakTime);

  @computed
  Duration get currentTaskTime => this.firstPunch.difference(DateTime.now());

  @action
  void addTime(Duration duration) {
    this.taskTime.add(duration);
    this.totalTime = this.breakTime + this.taskTime.reduce((a, b) => a + b);
  }
}
