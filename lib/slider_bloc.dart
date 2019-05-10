import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class SliderBloc implements BlocBase {

    var _streamSliderController = BehaviorSubject<double>();

    Stream<double> get outValue => _streamSliderController.stream;
    double value = 0.0;

    onChangeValue(double v){
      value = v;
      _streamSliderController.add(v);
    }



  @override
  void dispose() {
  _streamSliderController.close();
  }



}