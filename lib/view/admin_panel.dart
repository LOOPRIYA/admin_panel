import 'dart:io';

import 'package:admin_panel/models/steerling_wheel_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/car_name_model.dart';
import '../models/transmission_model.dart';

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
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  selectImages() async {
    final List<XFile> _selectedImages = await imagePicker.pickMultiImage();
    if (_selectedImages!.isNotEmpty) {
      imageFileList!.addAll(_selectedImages);
      setState(() {});
    }
  }

  void serverPost() async {
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
      "photo": imageFileList,
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff242323),
        appBar: AppBar(
            toolbarHeight: 100,
            centerTitle: true,
            title: const Text(
              "Create your car",
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.w400),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0),
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
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
                              title: Text(
                                _model,
                                style: TextStyle(color: Colors.white),
                              ),
                              expandedCrossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: List.generate(
                                  cars.length,
                                  (index) => GestureDetector(
                                        onTap: () {
                                          _model = cars[index];
                                          setState(() {});
                                        },
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(cars[index]),
                                            ),
                                          ],
                                        ),
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
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  contentPadding:
                                      EdgeInsetsDirectional.only(start: 10)),
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
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  contentPadding:
                                      EdgeInsetsDirectional.only(start: 10)),
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
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  contentPadding:
                                      EdgeInsetsDirectional.only(start: 10)),
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
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  contentPadding:
                                      EdgeInsetsDirectional.only(start: 10)),
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
                              title: Text(
                                _transmission,
                                style: TextStyle(color: Colors.white),
                              ),
                              children: List.generate(
                                  transmissions.length,
                                  (index) => GestureDetector(
                                        onTap: () {
                                          setState(() {});
                                          _transmission = transmissions[index];
                                        },
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Text(transmissions[index]),
                                            ),
                                          ],
                                        ),
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
                              title: Text(
                                _steerlingWheel,
                                style: TextStyle(color: Colors.white),
                              ),
                              children: List.generate(
                                  steerlingWheels.length,
                                  (index) => GestureDetector(
                                        onTap: () {
                                          setState(() {});
                                          _steerlingWheel =
                                              steerlingWheels[index];
                                        },
                                        child: Align(
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Text(
                                          steerlingWheels[index],
                                        ),
                                                ),
                                              ],
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
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    contentPadding:
                                        EdgeInsetsDirectional.only(start: 10)),
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
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  contentPadding:
                                      EdgeInsetsDirectional.only(start: 10)),
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
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    contentPadding:
                                        EdgeInsetsDirectional.only(start: 10)),
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
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      contentPadding:
                                          EdgeInsetsDirectional.only(
                                              start: 10)),
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
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        contentPadding:
                                            EdgeInsetsDirectional.only(
                                                start: 10)),
                                    controller: serviceContactController,
                                    onChanged: (value) => _service_contact =
                                        serviceContactController.text)),
                          ),
                        ])
                      ])
                    ]),
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          child: FilledButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xff000000)),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                            ),
                            onPressed: () async {
                              selectImages();
                              setState(() {});
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.car_repair),
                                SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  'Choose image',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GridView.builder(
                                      itemCount: imageFileList!.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Image.file(
                                            File(imageFileList![index].path),
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      }))),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: FilledButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff000000)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                        onPressed: () async {
                          serverPost();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add),
                            SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'Create',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ])),
            ],
          ),
        ));
  }
}
