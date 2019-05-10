import 'package:flutter/material.dart';
import 'package:slider_bloc/slider_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  SliderBloc sliderBloc = SliderBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: sliderBloc.outValue,
      builder: (context, snapshot) {
        return Material(
          color: Color.lerp(Colors.red, Colors.purple, sliderBloc.value),
          child: Container(
            margin: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StreamBuilder<double>(
                  stream: sliderBloc.outValue,
                  builder: (context, snapshot) {
                    return Text("${sliderBloc.value}", style: TextStyle(fontSize: 20),);
                  }
                ),
                SizedBox(height: 20,),
                StreamBuilder<double>(
                  stream: sliderBloc.outValue,
                  builder: (context, snapshot) {
                    return Slider(
                      inactiveColor: Colors.white,
                      activeColor: Colors.white,
                      min: 0.0,
                      max: 1.0,
                      onChanged: sliderBloc.onChangeValue,
                      value: sliderBloc.value,
                    );
                  }
                ),
              ],
            ),
          ),
        );
      }
    );
  }


}
