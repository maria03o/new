import 'package:flutter/material.dart';
import 'package:myapp/plan/Componants/ExpandedListAnimationWidget.dart';

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> with TickerProviderStateMixin {
  late bool isStretchedDropDown1;
  late bool isStretchedDropDown2;
  late bool isStretchedDropDown3;
  int groupValue1 = -1;
  int groupValue2 = -1;
  int groupValue3 = -1;
  String title1 = 'Choose your style';
  String title2 = 'Choose your length';
  String title3 = 'Choose your Price';
  late ScrollController _scrollController1;
  late ScrollController _scrollController2;
  late ScrollController _scrollController3;

  @override
  void initState() {
    super.initState();
    isStretchedDropDown1 = false;
    isStretchedDropDown2 = false;
    isStretchedDropDown3 = false;
    _scrollController1 = ScrollController();
    _scrollController2 = ScrollController();
    _scrollController3 = ScrollController();
  }

  Widget buildCategory2(String text) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Row(
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      height: 0.20,
                      letterSpacing: 0.20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategory6(String text) {
    return Container(
      width: 180,
      height: 30000,
      margin: const EdgeInsets.only(right: 8),
      clipBehavior: Clip.antiAlias,
      decoration: const ShapeDecoration(
        color: Color.fromARGB(255, 58, 91, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 30000,
              padding: const EdgeInsets.only(
                top: 20,
                left: 74,
                right: 5,
                bottom: 20,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      height: 0.10,
                      letterSpacing: 0.10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: 
        AppBar(
          title: const Text(
            "Continue planning ",
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
         
          backgroundColor: Color.fromARGB(255, 170, 182, 255),
          elevation: 0,
          iconTheme: const IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
      body: SingleChildScrollView(
        child: 
        Container(
          color: Color.fromARGB(255, 255, 255, 255),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [


   Positioned(
    bottom: 0,
    right: 0,
    left: MediaQuery.of(context).size.width * 0.17 - 45,
    top: MediaQuery.of(context).size.height * 0.1 - 40,
    child: Container(
      width: 500,
      height: 1000,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100),
          Text(
            'Desired Trip Style',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 18,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 30), 
          buildDropDown(title1, _scrollController1, _list),
          SizedBox(height: 30), 
          Text(
            'Desired Trip Length',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 18,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 30),  
          buildDropDown(title2, _scrollController2, _list2),
          SizedBox(height: 30),
          Text(
            'Desired Trip price ',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 18,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 30), 
          buildDropDown(title3, _scrollController3, _list3),
          SizedBox(height: 30),
          Container(
            width: 220,
            height: 50, // Adjusted height for accommodating the first text
            margin: const EdgeInsets.only(left: 50 ,right:50 ),
            clipBehavior: Clip.antiAlias,
            decoration: const ShapeDecoration(
              color: Color.fromARGB(255, 87, 138, 240),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),
            child: Center(
              child: Text(
                'Next',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  height: 0.10,
                  letterSpacing: 0.10,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ),

  ]    ),
        ),
     
      )
    );
  }

  Widget buildDropDown(String dropdownTitle, ScrollController scrollController, List<String> dropdownList) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: dropdownTitle == title1 ? isStretchedDropDown1 ? null : 70 :
              dropdownTitle == title2 ? isStretchedDropDown2 ? null : 70 :
              dropdownTitle == title3 ? isStretchedDropDown3 ? null : 70 : 70,
      decoration: BoxDecoration(
        border: Border.all(
          color: dropdownTitle == title1 ? isStretchedDropDown1 ? Color.fromARGB(112, 99, 99, 99) : Color.fromARGB(0, 3, 3, 3) :
          dropdownTitle == title2 ? isStretchedDropDown2 ? Color.fromARGB(112, 99, 99, 99) : Colors.transparent :
          dropdownTitle == title3 ? isStretchedDropDown3 ? Color.fromARGB(112, 99, 99, 99) : Colors.transparent :
          Color.fromARGB(108, 213, 64, 64),
          width: 2
        ),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (dropdownTitle == title1) {
                  isStretchedDropDown1 = !isStretchedDropDown1;
                  isStretchedDropDown2 = false;
                  isStretchedDropDown3 = false;
                } else if (dropdownTitle == title2) {
                  isStretchedDropDown2 = !isStretchedDropDown2;
                  isStretchedDropDown1 = false;
                  isStretchedDropDown3 = false;
                } else if (dropdownTitle == title3) {
                  isStretchedDropDown3 = !isStretchedDropDown3;
                  isStretchedDropDown1 = false;
                  isStretchedDropDown2 = false;
                }
              });
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.5,
                  color: Color.fromARGB(121, 88, 88, 88),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              constraints: BoxConstraints(
                minHeight: 65,
                minWidth: double.infinity,
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        dropdownTitle,
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    dropdownTitle == title1 ? (isStretchedDropDown1 ? Icons.keyboard_arrow_up_sharp : Icons.keyboard_arrow_down_sharp) :
                    dropdownTitle == title2 ? (isStretchedDropDown2 ? Icons.keyboard_arrow_up_sharp : Icons.keyboard_arrow_down_sharp) :
                    dropdownTitle == title3 ? (isStretchedDropDown3 ? Icons.keyboard_arrow_up_sharp : Icons.keyboard_arrow_down_sharp) :
                    Icons.arrow_downward,
                    color: Color.fromARGB(255, 52, 128, 234),
                    size: 33,
                  ),
                ],
              ),
            ),
          ),
          ExpandedSection(
            expand: dropdownTitle == title1 ? isStretchedDropDown1 :
                    dropdownTitle == title2 ? isStretchedDropDown2 :
                    dropdownTitle == title3 ? isStretchedDropDown3 :
                    false,
            bottom: 0,
            height: 50,
            child:
            ListView.builder(
              itemCount: dropdownList.length,
              padding: EdgeInsets.all(0),
              controller: scrollController,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return RadioListTile(
                  title: Text(
                    dropdownList.elementAt(index),
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  value: index,
                  groupValue: dropdownTitle == title1
                      ? groupValue1
                      : dropdownTitle == title2
                      ? groupValue2
                      : dropdownTitle == title3
                      ? groupValue3
                      : -1,
                  onChanged: dropdownTitle == title1
                      ? (int? val) {
                    setState(() {
                      groupValue1 = val!;
                      title1 = dropdownList.elementAt(index);
                    });
                  }
                      : dropdownTitle == title2
                      ? (int? val) {
                    setState(() {
                      groupValue2 = val!;
                      title2 = dropdownList.elementAt(index);
                    });
                  }
                      : dropdownTitle == title3
                      ? (int? val) {
                    setState(() {
                      groupValue3 = val!;
                      title3 = dropdownList.elementAt(index);
                    });
                  }
                      : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

List<String> _list = [
  'Dynamic (Frequent Change Of Accommodation)',
  "Relaxed (Move Less, Stay Longer In One Place)",
];
List<String> _list2 = ['Short (3-5 Days)', "Midsize (6-15 Days)", "Long (18-30 Days)",];
List<String> _list3 = ['Expensive (Elegant areas, Upscale people)', "Middle (Beautiful places, memorial areas)", "Cheap (Beautiful Cheap places)",];
