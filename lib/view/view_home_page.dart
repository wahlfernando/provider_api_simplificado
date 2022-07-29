import 'package:flutter/material.dart';
import 'package:flutter_estudo_avancado_api/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {

  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double? _width, _height;
  late HomeProvider homeProvider;
  var coutryList;

  @override
  void initState() {
    super.initState();
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    coutryList = homeProvider.getCoutryApi();
  }
  

   @override
   Widget build(BuildContext context) {
    
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;

       return Scaffold(
        appBar: AppBar(
          title: const Text('Provider com API'),
        ),
           body: Consumer<HomeProvider>(builder: (context, provider, child) {
             return SafeArea(child: Container(
              height: _height,
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: !provider.isLoaded
              ? SizedBox(
                height: 100,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey, 
                  highlightColor: Colors.white, 
                  child: ListView.separated(
                    itemBuilder: ((context, index) => Container(
                      color: Colors.grey,
                      height: 20,
                      width: _width,
                    )), 
                    separatorBuilder: ((context, index) => const SizedBox(height: 10,)), 
                    itemCount: 100),
                ),
              )
              : ListView.builder(
                itemCount: provider.model!.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      provider.model!.data![index].country!,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                },)
             ));
           }),
       );
  }
}