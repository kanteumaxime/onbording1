import 'package:flutter/material.dart';
import 'package:onbordingapp1/content_model.dart';

import 'HomeScreen.dart';

class OnbordScreen extends StatefulWidget {
  const OnbordScreen({super.key});
  @override
  State<OnbordScreen> createState() => _OnbordScreenState();
}

class _OnbordScreenState extends State<OnbordScreen> {
  int currentindex = 0;
  PageController ?_pageController;
  @override
  void initState(){
     _pageController = PageController(initialPage: 0);
     super.initState();
  }
  @override
  void dispose(){
    _pageController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: contents.length,
            onPageChanged: (int index){
              setState(() {
                currentindex = index;
              });
            },
            itemBuilder: (_ , i){
              return Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    Image.asset(contents[i].image.toString(),
                    height: 300,
                    ),
                     Text(
                      contents[i].title.toString(),
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                     Text(
                     contents[i].description.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              );
            } ,
          ),
        ),
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(contents.length, 
              (index) => builddot(index,context),
              ),
            ),
        ),
           InkWell(
  child: Container(
    height: 60,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 33, 150, 343),
      borderRadius: BorderRadius.circular(20),
    ),
    margin: const EdgeInsets.all(60),
    width: double.infinity,
    child: Align(
      alignment: Alignment.center,
      child: Text(currentindex == contents.length - 1 ? "Continue" : "Next",style: const TextStyle(
      fontWeight: FontWeight.bold,fontSize: 20, color: Colors.white
      ),)),
  ),
  onTap: () {
    if (currentindex == contents.length - 1) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const MyHomePage()));
    }
    _pageController?.nextPage(
      duration: const Duration(microseconds: 100),
      curve: Curves.bounceIn,
    );
  },
           )
      ], 
      ),
    );
  }

  Container builddot(int index,BuildContext context) {
    return Container(
              height: 10,
              width: currentindex == index ? 25 : 10,
              margin: const EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green
              ),
            );
  }
}