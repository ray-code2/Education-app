import 'package:keema_app/Services/Auth.dart';

import 'ProfilePage.dart';
import 'constants.dart';
import 'category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Course_Screen.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
      child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                  child: DrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/background.jpg"),
                          fit: BoxFit.cover)),
                  child: Text("Profile" , style: TextStyle(color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                  ),),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView(children: [
                ListTile(
                  title: Text("Logout"),
                  onTap: () {
                  signOut();
                  },
                ),
              
              ]),
            )
          ],
        ),
  ),
  
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        actions: [
          
            IconButton(
              color: Colors.white,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return ProfilePage();
                      }));
                    },
                    icon: Icon(Icons.person_outline))
        ],
        leading: IconButton(
            color: Colors.white,
          icon: Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.orange.shade50,
    
      body: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.only(left: 20, top: 50, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Hi Keemas,", style: TextStyle(letterSpacing: 5, fontSize: 20 , fontWeight: FontWeight.w600)),
              Text("Select a course you want to learn", style: kSubheadingextStyle),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Category", style: kTitleTextStyle),
               
                ],
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 800,
              child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1.9 / 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 20),
            itemCount: categories.length,
            itemBuilder: (BuildContext ctx, index) {
                return InkWell(
                  splashColor: Colors.purple,
                 onTap: (){
                   print("U Tap: ${categories[index].name} ");
                   Navigator.of(context).push(MaterialPageRoute(
                     builder: (context) => CourseDetails(category: categories[index], )
                   ));
                 },
                      child: Card(
                      color: Colors.pink.shade50,
                      shadowColor: Colors.black,
                      elevation: 12,
                      shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
            ),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(categories[index].name),
                            Text(categories[index].numOfCourses.toString() + ' Courses'),
                            Image.asset(categories[index].image , fit: BoxFit.fill,),
       
                          ],
                          
                        ),
                      ),
                    ),
                  ),
                );
            }),
              ),
              ], 
          ),
        ),
      ),
    );
  }
}
