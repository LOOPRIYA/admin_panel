import 'package:admin_panel/models/included_model.dart';
import 'package:flutter/material.dart';

class MajorServiceView extends StatefulWidget {
  const MajorServiceView({super.key});

  @override
  State<MajorServiceView> createState() => _MajorServiceViewState();
}

class _MajorServiceViewState extends State<MajorServiceView> {
  final bigLeadingStyleService =
      const TextStyle(fontSize: 32, fontWeight: FontWeight.w900);
  final middleLeadingStyleService =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w900);
  final blackMiddleLeadingStyleService =
  const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Colors.black);
  final generalRepairController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
          color: Color(0xff40cc46),
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 48),
            child: Wrap(
              spacing: 8,
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                    )),
                Text(
                  "Major Service",
                  style: bigLeadingStyleService,
                ),
                Text(
                    "39 \$", style: blackMiddleLeadingStyleService,),
                Text(
                  "was 49\$",
                  style: middleLeadingStyleService,
                ),
              ],
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.77,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  color: Color(0xff121212)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        child: Text(
                          "What's Included",
                          style: middleLeadingStyleService,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                            included.length,
                            (index) => Row(
                                  children: [
                                    Text(
                                      included[index],
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Expanded(
                                      child: IconButton(
                                          alignment: Alignment.centerRight,
                                          constraints: const BoxConstraints(),
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            setState(() {});
                                          },
                                          icon: const Icon(
                                            Icons.create,
                                            size: 20,
                                            color: Colors.green,
                                          )),
                                    ),
                                    SizedBox(width: 12),
                                    IconButton(
                                        alignment: Alignment.centerRight,
                                        constraints: const BoxConstraints(),
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          included.removeAt(index);
                                          setState(() {});
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          size: 20,
                                          color: Colors.red,
                                        )),
                                  ],
                                )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        child: Text(
                          "What's  NOT Included",
                          style: middleLeadingStyleService,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 48),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                              notIncluded.length,
                              (index) => Row(
                                    children: [
                                      Text(
                                        notIncluded[index],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Expanded(
                                        child: IconButton(
                                            alignment: Alignment.centerRight,
                                            constraints: const BoxConstraints(),
                                            padding: EdgeInsets.zero,
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.create,
                                              size: 20,
                                              color: Colors.green,
                                            )),
                                      ),
                                      SizedBox(width: 12),
                                      IconButton(
                                          alignment: Alignment.centerRight,
                                          constraints: const BoxConstraints(),
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            notIncluded.removeAt(index);
                                            setState(() {});
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            size: 20,
                                            color: Colors.red,
                                          )),
                                    ],
                                  )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                              activeColor: const Color(0xff8875FF),
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              }),
                          Text(
                            "NOT Included",
                            style: middleLeadingStyleService,
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: TextField(
                                  controller: generalRepairController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff8875FF))),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff8875FF)))),
                                )),
                            SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll<Color>(
                                            Color(0xff8875FF)),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    if(isChecked == false){
                                      included.add(generalRepairController.text);
                                    }
                                    else {
                                      notIncluded.add(generalRepairController.text);
                                    }
                                    setState(() {});
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text("ADD"),
                                  )),
                            ),
                            SizedBox(
                              height: 16,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )),
      ],
    ));
  }
}
