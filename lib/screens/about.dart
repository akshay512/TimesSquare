import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  
  
  
   _launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/newss.png',
                height: 80,
              ),
              Text(
                'Times Square',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico',
                ),
              ),
              Text(
                'Global News App',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 30.0,
                  color: Colors.teal[50],
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  color: Colors.teal.shade700,
                ),
              ),
              InkWell(
                              child: Container(
                  child: Card(
                      child: Row(
                    children: <Widget>[
                      Icon(Icons.mail),
                      SizedBox(width: 20),
                      Text('timessquarenewsapp@gmail.com',style: TextStyle(fontWeight:FontWeight.bold),)
                    ],
                  )),
                  height: 50,
                  width: 300,
                ),
                onTap: (){
                   _launchURL('timessquarenewsapp@gmail.com', 'Message to TimesSquare', 'Write your queries and Message here!');
                },
              ),
              InkWell(
                child: Container(
                  child: Card(
                      child: Row(
                    children: <Widget>[
                      Icon(Icons.bookmark),
                      SizedBox(width: 20),
                      Text('Tap here to contribute to this project!',style: TextStyle(fontWeight:FontWeight.bold),)
                    ],
                  )),
                  height: 50,
                  width: 300,
                ),
                onTap: () async {
                  if (await canLaunch(
                      "https://github.com/Himanshuranjan30/TimesSquare")) {
                    await launch(
                        "https://github.com/Himanshuranjan30/TimesSquare");
                  }
                },
              ),
              Container(
                child: Card(
                    child: Row(
                  children: <Widget>[
                    Icon(Icons.group),
                    SizedBox(width: 20),
                    Text('Developed By: Team NoContext\n' 
                         'Members:\n'
                         'Ashish Kumar Behera\n'
                         'Chirag\n'
                         'Himanshu Ranjan\n'
                         'Shubham Kumar Giri\n'
                         
                         
                         ,style: TextStyle(fontWeight:FontWeight.bold),
                    )
                  ],
                )),
                height: 150,
                width: 300,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[200],
    );
  }
}

// ignore: must_be_immutable
class InfoCard extends StatelessWidget {
  final String text;
  final IconData icon;
  Function onPressed;

  InfoCard({
    @required this.text,
    @required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.black,
          ),
          title: Text(
            text,
            style: TextStyle(
              fontFamily: 'Source Sans Pro',
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
