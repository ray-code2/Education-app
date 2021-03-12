import 'package:keema_app/category.dart';

import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CourseDetails extends StatelessWidget {
  final Category category;
  CourseDetails({this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent[50],
      appBar: AppBar(
          backgroundColor: Colors.purple[800],
        title: Text('${category.name} Class'),),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFF5F4EF),
          image: DecorationImage(
            image: AssetImage(category.image),
            alignment: Alignment.topRight,
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, top: 50, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipPath(
                    clipper: BestSellerClipper(),
                    child: Container(
                      color: kBestSellerColor,
                      padding: EdgeInsets.only(
                          left: 10, top: 5, right: 20, bottom: 5),
                      child: Text(
                        "BestSeller".toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text('${category.subtitle} ', style: TextStyle(
                    color: Colors.amber.shade900,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w900,
                    fontSize: 36
                  )),
                  SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      IconButton(
                      color: Colors.grey[400],
                      icon: Icon(Icons.people), onPressed: null),
                      Text("18K"),
                      SizedBox(width: 10),
                      SvgPicture.asset("assets/icons/star.svg"),
                      SizedBox(width: 5),
                      Text("4.8")
                    ],
                  ),
                
                ],
              ),  
            ),
            
            SizedBox(height: 40),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                    child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("${category.name} Course Content", style: kTitleTextStyle),
                            SizedBox(height: 30),

                                CourseContent(
                                number: "01",
                                duration: 5.35,
                                title: "Welcome to ${category.name} Course",
                                isDone: true,
                              ),
                            CourseContent(
                              number: '02',
                              duration: 19.04,
                              title: "Basic ${category.name} Course",
                              isDone: false,
                            ),
                            CourseContent(
                              number: '03',
                              duration: 15.35,
                              title: "Intermediate ${category.name}",
                            ),
                            CourseContent(
                              number: '04',
                              duration: 5.35,
                              title: "Advance ${category.name}",
                            ),
                            RaisedButton(
                            onPressed: (){
                            showAlertDialog(context);
                            },
                            child: Text('Enroll Now'),
                            )
                          
                          ],
                        ),
                      ),
                    
                            ],
                          ),
                        ),
                      ),

                  ),
          ],
        ),
      ),
    );
  }
}

class CourseContent extends StatelessWidget {
  final String number;
  final double duration;
  final String title;
  final bool isDone;
  const CourseContent({
    Key key,
    this.number,
    this.duration,
    this.title,
    this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(
          children: <Widget>[
            Text(
              number,
              style: kHeadingextStyle.copyWith(
                color: kTextColor.withOpacity(.15),
                fontSize: 32,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
                child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "$duration mins\n",
                      style: TextStyle(
                        color: kTextColor.withOpacity(.5),
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                      text: title,
                      style: kSubtitleTextSyule.copyWith(
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kGreenColor.withOpacity(isDone ? 1 : .5),
              ),
              child: Icon(Icons.play_arrow, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}


showAlertDialog(BuildContext context) {
  // set up the button
  Widget OkButton = FlatButton(
    child: Text("Ok "),
    onPressed: () { 
      Navigator.pop(context);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Center(child: Text("You Have Enrolled The Course!" , style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.red),)),
    content: new Container(
    
    width: 80.0,
    height: 40.0,
    decoration: new BoxDecoration(
      shape: BoxShape.rectangle,
      color: Colors.white,
      borderRadius: BorderRadius.circular(32),
    ),
    child: Center(
      child: Text("OK" , 
      style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w700),
      ),
    ),
    ),
    actions: [
      OkButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

