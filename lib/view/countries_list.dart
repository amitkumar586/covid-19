import 'package:covid_19_tracker/services/statesServices.dart';
import 'package:covid_19_tracker/view/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
// import 'package:shimmer/main.dart';

class CoutriesListScreen extends StatefulWidget {
  const CoutriesListScreen({super.key});

  @override
  State<CoutriesListScreen> createState() => _CoutriesListScreenState();
}

class _CoutriesListScreenState extends State<CoutriesListScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          // this line use for back Icon
          backgroundColor: Theme.of(context).scaffoldBackgroundColor),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: "Search with country name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: statesServices.countriesList(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                      itemCount: 4,
                      //  snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade700,
                          child: Column(
                            children: [
                              ListTile(
                                title: Container(
                                  height: 10,
                                  width: 89,
                                  color: Colors.white,
                                ),
                                // Text(snapshot.data![index]['country']),
                                subtitle: Container(
                                  height: 10,
                                  width: 89,
                                  color: Colors.white,
                                ),
                                // Text(snapshot.data![index]['cases']
                                //     .toString()),
                                leading:
                                    //  Image(
                                    //   height: 55,
                                    //   width: 60,
                                    //   image: NetworkImage(snapshot.data![index]
                                    //       ['countryInfo']['flag']),
                                    // ),
                                    Container(
                                  height: 10,
                                  width: 89,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String name = snapshot.data![index]['country'];

                        if (searchController.text.isEmpty) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                                image: snapshot.data![index]
                                                    ['countryInfo']['flag'],
                                                name: snapshot.data![index]
                                                    ['country'],
                                                totalCases: snapshot
                                                    .data![index]['cases'],
                                                totalRecovered: snapshot
                                                    .data![index]['recovered'],
                                                totalDeaths: snapshot
                                                    .data![index]['deaths'],
                                                active: snapshot.data![index]
                                                    ['active'],
                                                test: snapshot.data![index]
                                                    ['tests'],
                                                todayRecovered:
                                                    snapshot.data![index]
                                                        ['todayRecovered'],
                                                critical: snapshot.data![index]
                                                    ['critical'],
                                              )));
                                },
                                child: ListTile(
                                  
                                  title: Text(snapshot.data![index]['country']),
                                  subtitle: Text(snapshot.data![index]['cases']
                                      .toString()),
                                  leading: Image(
                                    height: 55,
                                    width: 60,
                                    image: NetworkImage(snapshot.data![index]
                                        ['countryInfo']['flag']),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else if (name.toLowerCase().contains(
                                searchController.text.toLowerCase()) ||
                            name.toUpperCase().contains(
                                searchController.text.toUpperCase())) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                                image: snapshot.data![index]
                                                    ['countryInfo']['flag'],
                                                name: snapshot.data![index]
                                                    ['country'],
                                                totalCases: snapshot
                                                    .data![index]['cases'],
                                                totalRecovered: snapshot
                                                    .data![index]['recovered'],
                                                totalDeaths: snapshot
                                                    .data![index]['deaths'],
                                                active: snapshot.data![index]
                                                    ['active'],
                                                test: snapshot.data![index]
                                                    ['tests'],
                                                todayRecovered:
                                                    snapshot.data![index]
                                                        ['todayRecovered'],
                                                critical: snapshot.data![index]
                                                    ['critical'],
                                              )));
                                },
                                child: ListTile(
                                  title: Text(snapshot.data![index]['country']),
                                  subtitle: Text(snapshot.data![index]['cases']
                                      .toString()),
                                  leading: Image(
                                    height: 55,
                                    width: 60,
                                    image: NetworkImage(snapshot.data![index]
                                        ['countryInfo']['flag']),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }

                        //   return Column(
                        //     children: [
                        //       ListTile(
                        //         title: Text(snapshot.data![index]['country']),
                        //         subtitle: Text(
                        //             snapshot.data![index]['cases'].toString()),
                        //         leading: Image(
                        //           height: 55,
                        //           width: 60,
                        //           image: NetworkImage(snapshot.data![index]
                        //               ['countryInfo']['flag']),
                        //         ),
                        //       ),
                        //     ],
                        //   );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
