import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String image;
  String name;
  int totalCases;
  int totalDeaths;
  int active;
  int critical;
  int totalRecovered;
  int todayRecovered;
  int test;

  DetailScreen(
      {super.key, required this.name,
      required this.image,
      required this.totalCases,
      required this.totalDeaths,
      required this.active,
      required this.critical,
      required this.totalRecovered,
      required this.todayRecovered,
      required this.test});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .055),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .06,
                      ),
                      ReusableRow(
                        title: 'Cases',
                        value: widget.totalCases.toString(),
                      ),
                      ReusableRow(
                        title: 'Recovered',
                        value: widget.totalRecovered.toString(),
                      ),
                      ReusableRow(
                        title: 'Death',
                        value: widget.totalDeaths.toString(),
                      ),
                      ReusableRow(
                        title: 'Critical',
                        value: widget.critical.toString(),
                      ),
                      ReusableRow(
                        title: 'Today Recovered',
                        value: widget.todayRecovered.toString(),
                      ),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String? title;
  String? value;
  ReusableRow({super.key, this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title!),
              Text(value!),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider()
        ],
      ),
    );
  }
}
