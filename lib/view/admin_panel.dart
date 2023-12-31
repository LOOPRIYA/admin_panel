import 'package:admin_panel/models/steerling_wheel_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/car_name_model.dart';
import '../models/transmission_model.dart';

void main() async {
  final dio = Dio();
  dio.post('http://servername:2310/createcar', data: {
    "model": _model,
    "price_usd": _price_usd,
    "price_aed": int,
    "color": _color,
    "killometers": _killometers,
    "regional_specs": _regional_specs,
    "transmission": _transmission,
    "steering_whell": _steerlingWheel,
    "motor_trim": _motor_trim,
    "body": _body,
    "state": _state,
    "guarantee": _gurantee,
    "service_contact": _service_contact,
    "description": _description,
  });
}

String _model = "Model of car";
int _price_usd = 0;
String _color = "Color";
int _killometers = 0;
String _regional_specs = "Regional Specs";
String _transmission = "Transmission";
String _steerlingWheel = "Steerling Wheel";
String _motor_trim = "Motor Trim";
String _body = "Body";
String _state = "State";
String _gurantee = "Gurantee";
String _service_contact = "Service Contact";
String _description = "Description";

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  @override
  final priceController = TextEditingController();
  final colorController = TextEditingController();
  final miliegeController = TextEditingController();
  final regionalSpecsController = TextEditingController();
  final transmissionController = TextEditingController();
  final motorRimController = TextEditingController();
  final bodyController = TextEditingController();
  final stateController = TextEditingController();
  final guranteeController = TextEditingController();
  final serviceContactController = TextEditingController();
  final descriptionController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff242323),
        appBar: AppBar(
            toolbarHeight: 100,
            centerTitle: true,
            title: const Text(
              "Your Car",
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.w400),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0),
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: Column(children: [
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Model",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w400))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: const Color(0x00212121),
                                borderRadius: BorderRadius.circular(12)),
                            child: ExpansionTile(
                              title: Text(_model),
                              expandedCrossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: List.generate(
                                  cars.length,
                                  (index) => GestureDetector(
                                        onTap: () {
                                          _model = cars[index];
                                          setState(() {});
                                        },
                                        child: Text(cars[index]),
                                      )),
                            )),
                      ),
                    ]),
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Price",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w400))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: const Color(0x00212121),
                                borderRadius: BorderRadius.circular(12)),
                            child: TextField(
                              controller: priceController,
                              onChanged: (value) =>
                                  _price_usd = int.parse(priceController.text),
                            )),
                      ),
                    ]),
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Color",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w400))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: const Color(0x00212121),
                                borderRadius: BorderRadius.circular(12)),
                            child: TextField(
                              controller: colorController,
                              onChanged: (value) =>
                                  _color = colorController.text,
                            )),
                      ),
                    ]),
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Mileage",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w400))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: const Color(0x00212121),
                                borderRadius: BorderRadius.circular(12)),
                            child: TextField(
                              controller: miliegeController,
                              onChanged: (value) => _killometers =
                                  int.parse(miliegeController.text),
                            )),
                      ),
                    ]),
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Regional Specs",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w400))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: const Color(0x00212121),
                                borderRadius: BorderRadius.circular(12)),
                            child: TextField(
                              controller: regionalSpecsController,
                              onChanged: (value) =>
                                  _killometers = miliegeController.text as int,
                            )),
                      ),
                    ]),
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Transmission",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w400))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: const Color(0x00212121),
                                borderRadius: BorderRadius.circular(12)),
                            child: ExpansionTile(
                              title: Text(_transmission),
                              children: List.generate(
                                  transmissions.length,
                                  (index) => GestureDetector(
                                        onTap: () {
                                          setState(() {});
                                          _transmission = transmissions[index];
                                        },
                                        child: Text(transmissions[index]),
                                      )),
                            )),
                      ),
                    ]),
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Steering wheel",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w400))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: const Color(0x00212121),
                                borderRadius: BorderRadius.circular(12)),
                            child: ExpansionTile(
                              title: Text(_steerlingWheel),
                              children: List.generate(
                                  steerlingWheels.length,
                                  (index) => GestureDetector(
                                        onTap: () {
                                          setState(() {});
                                          _steerlingWheel =
                                              steerlingWheels[index];
                                        },
                                        child: Align(
                                            child: Text(
                                          steerlingWheels[index],
                                        )),
                                      )),
                            )),
                      ),
                    ]),
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Motors Trim",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w400))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: const Color(0x00212121),
                                borderRadius: BorderRadius.circular(12)),
                            child: TextField(
                                controller: motorRimController,
                                onChanged: (value) =>
                                    _motor_trim = motorRimController.text)),
                      ),
                    ]),
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Body",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w400))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: const Color(0x00212121),
                                borderRadius: BorderRadius.circular(12)),
                            child: TextField(
                              controller: bodyController,
                            )),
                      ),
                    ]),
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("State",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w400))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: const Color(0x00212121),
                                borderRadius: BorderRadius.circular(12)),
                            child: TextField(
                                controller: stateController,
                                onChanged: (value) =>
                                    _state = stateController.text)),
                      ),
                      Column(children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Guarantee",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w400))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  color: const Color(0x00212121),
                                  borderRadius: BorderRadius.circular(12)),
                              child: TextField(
                                  controller: guranteeController,
                                  onChanged: (value) =>
                                      _gurantee = guranteeController.text)),
                        ),
                        Column(children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Service contract",
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w400))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    color: const Color(0x00212121),
                                    borderRadius: BorderRadius.circular(12)),
                                child: TextField(
                                    controller: serviceContactController,
                                    onChanged: (value) => _service_contact =
                                        serviceContactController.text)),
                          ),
                        ])
                      ])
                    ])
                  ])),
            ],
          ),
        ));
  }
}
