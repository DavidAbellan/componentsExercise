import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorDelSlider = 100.0;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Sliders')),
        body: Container(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              _crearCheckBox(),
              _crearSwitch(),
              _crearSlider(),
              Expanded(child: _crearImagen())
            ],
          ),
        ));
  }

  Widget _crearCheckBox() {
    return CheckboxListTile(
        title: Text('BLOCK!!!!'),
        value: _bloquearCheck,
        onChanged: (v) {
          setState(() {
            _bloquearCheck = v;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('BLOCK!!!!'),
        value: _bloquearCheck,
        onChanged: (v) {
          setState(() {
            _bloquearCheck = v;
          });
        });
  }

  Widget _crearSlider() {
    return Slider(
        activeColor: Colors.indigo,
        label: 'Tamaño',
        value: _valorDelSlider,
        min: 10.0,
        max: 400.0,
        onChanged: (_bloquearCheck)
            ? null
            : (v) {
                setState(() {
                  _valorDelSlider = v;
                });
              });
  }

  Widget _crearImagen() {
    return Image(
        width: _valorDelSlider,
        fit: BoxFit.contain,
        image: NetworkImage(
            'https://as.com/futbol/imagenes/2017/07/05/mas_futbol/1499242341_624278_1499242922_sumario_grande.jpg'));
  }
}
