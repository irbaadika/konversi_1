import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController text1 = TextEditingController();
  double kelvin = 0, reamur = 0, farenheit = 0, input = 0;

  konversi() {
    setState(() {
      input = double.parse(text1.text);
      kelvin = input + 273;
      reamur = input * 4 / 5;
      farenheit = (input * 9 / 5) + 32;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Konverter Suhu')),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              inputSuhu(text1: text1),
              Hasil(kelvin: kelvin, reamur: reamur, farenheit: farenheit),
              konvertButton(text1: text1, konversi: konversi)
            ],
          ),
        ),
      ),
    );
  }
}

class konvertButton extends StatelessWidget {
  konvertButton({
    Key? key,
    required this.text1,
    required this.konversi,
  }) : super(key: key);

  final TextEditingController text1;
  final Function konversi;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          konversi();
          text1.clear();
        },
        child: Text(
          "Konversi",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class inputSuhu extends StatelessWidget {
  const inputSuhu({
    Key? key,
    required this.text1,
  }) : super(key: key);

  final TextEditingController text1;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: text1,
        decoration: InputDecoration(hintText: "Masukkan Suhu Dalam Celcius"),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ]);
  }
}

class Hasil extends StatelessWidget {
  const Hasil({
    Key? key,
    required this.kelvin,
    required this.reamur,
    required this.farenheit,
  }) : super(key: key);

  final double kelvin;
  final double reamur;
  final double farenheit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              "Kelvin",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "$kelvin",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "Reamur",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "$reamur",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "Farenheit",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "$farenheit",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ],
    );
  }
}
