import 'package:admin_panel/models/all_service_text_model.dart';
import 'package:admin_panel/view/services/general_repair_view.dart';
import 'package:admin_panel/view/services/major_service_view.dart';
import 'package:flutter/material.dart';

import '../models/all_service_icons_model.dart';
import '../models/special_offers_models.dart';

class ServiceView extends StatefulWidget {
  const ServiceView({super.key});

  @override
  State<ServiceView> createState() => _ServiceViewState();
}

class _ServiceViewState extends State<ServiceView> {
  final middleLeadingStyle =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w900);
  final bigLeadingStyle = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.w900, color: Color(0xff8875FF));
  final firstBigLeadingStyle = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.w900, color: Colors.white);
  final smallLeadingStyle =
      const TextStyle(fontSize: 13, color: Color(0xff7A7A7A));
  final firstSmallLeadingStyle =
      const TextStyle(fontSize: 13, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 97,
        backgroundColor: const Color(0xff121212),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
        title: const Text("DWD"),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16),
            child: CircleAvatar(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 13, bottom: 35),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 35),
                    child: Row(
                      children: [
                        Text("Special offers", style: middleLeadingStyle),
                      ],
                    ),
                  ),
                  Container(
                    height: 140,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Wrap(
                              spacing: 16,
                              children: List.generate(
                                nameMajorService.length,
                                (index) => SizedBox(
                                    height: 140,
                                    width: 150,
                                    child: ElevatedButton(
                                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MajorServiceView())),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll<Color>(
                                                  index == 0
                                                      ? Colors.green
                                                      : Colors.white),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Wrap(
                                                direction: Axis.vertical,
                                                spacing: 4,
                                                children: [
                                                  Text(
                                                    nameMajorService[index],
                                                    style: index == 0
                                                        ? firstBigLeadingStyle
                                                        : bigLeadingStyle,
                                                  ),
                                                  Text(
                                                    newMajorService[index],
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    lastMajorService[index],
                                                    style: index == 0
                                                        ? firstSmallLeadingStyle
                                                        : smallLeadingStyle,
                                                  )
                                                ],
                                              )),
                                        ))),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 35),
                  child: Row(
                    children: [
                      Text(
                        "All service",
                        style: middleLeadingStyle,
                      )
                    ],
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 24,
                  runSpacing: 38,
                  children: List.generate(
                    buttonText.length,
                    (index) => Column(
                      children: [
                        SizedBox(
                          height: 72,
                          width: 72,
                          child: ElevatedButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          GeneralRepairView())),
                              style: ButtonStyle(
                                backgroundColor:
                                    const MaterialStatePropertyAll<Color>(
                                        Color(0xff363636)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                              child: Image(
                                image: AssetImage(icons[index]),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: SizedBox(
                              width: 72,
                              child: Text(
                                buttonText[index],
                                style: const TextStyle(fontSize: 13),
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
