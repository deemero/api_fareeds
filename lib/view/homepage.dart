import 'dart:math';

import 'package:flutter/material.dart';
import 'package:api_fareeds/service/apikey.dart';
import 'package:api_fareeds/model/resGetdriver.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  // const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isLoading = false;
  List<Datum> listGetDriver = [];

  Future<ResGetDriver?> getDriver() async {
    try {
      setState(() {
        isLoading = true;
      });
      http.Response res = await http.get(Uri.parse("$baseUrl"));
      List<Datum>? data = resGetDriverFromJson(res.body).data;
      setState(() {
        isLoading = false;
        listGetDriver = data ?? [];
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getDriver();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Driver Input"),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: listGetDriver.length,
            itemBuilder: (context, index) {
              Datum data = listGetDriver[index];
              return Card(
                color: Colors.white70,
                elevation: 5,
                child: ListTile(
                  onTap: () {
                    // Navigator.push(context, route)
                  },
                ),
              );
            }),
      ),
    );
  }
}
