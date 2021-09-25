import 'package:flutter/material.dart';
import 'package:flutter_attendence_web/main_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailForm extends StatefulWidget {
  const DetailForm({Key? key}) : super(key: key);

  @override
  _DetailFormState createState() => _DetailFormState();
}

class _DetailFormState extends State<DetailForm> {
  String type = 'attendence';
  String name = '';
  String voltage = '';
  String inOut = 'IN';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Text("Battery"),
              Checkbox(
                  value: type == 'attendence' ? false : true,
                  onChanged: (bool? val) {
                    if (val == null || !val) {
                      setState(() {
                        type = 'attendence';
                      });
                    } else {
                      setState(() {
                        type = 'battery';
                      });
                    }
                  }),
            ],
          ),
          TextFormField(
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter Name for Battery'),
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter Voltage for Battery'),
            onChanged: (val) {
              setState(() {
                voltage = val;
              });
            },
          ),
          Row(
            children: [
              const Text("OUT"),
              Checkbox(
                  value: inOut == 'IN' ? false : true,
                  onChanged: (bool? val) {
                    if (val == null || !val) {
                      setState(() {
                        inOut = 'IN';
                      });
                    } else {
                      setState(() {
                        inOut = 'OUT';
                      });
                    }
                  }),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                if (type == 'battery' && (name == '' || voltage == '')) {
                  print("$type $name $voltage");
                  Fluttertoast.showToast(
                      msg: "Enter All Details",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MainScreen(
                          type: type,
                          name: name,
                          voltage: voltage,
                          inOut: inOut)));
                }
              },
              child: const Text("Done")),
        ],
      ),
    );
  }
}
