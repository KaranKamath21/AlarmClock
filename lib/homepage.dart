import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'clockview.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var offsetString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!offsetString.startsWith('-')) offsetSign = '+';
    print(offsetString);
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Buttons_HomePage('Clock', 'assets/clock_icon.png'),
              Buttons_HomePage('Alarm', 'assets/alarm_icon.png'),
              Buttons_HomePage('Timer', 'assets/timer_icon.png'),
              Buttons_HomePage('Stopwatch', 'assets/stopwatch_icon.png'),
            ],
          ),
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(32),
              color: Color(0xFF2D2F41),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      'Clock',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'avenir',
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          formattedTime,
                          style: TextStyle(
                            fontFamily: 'avenir',
                            color: Colors.white,
                            fontSize: 64,
                          ),
                        ),
                        Text(
                          formattedDate,
                          style: TextStyle(
                            fontFamily: 'avenir',
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: Align(
                      alignment: Alignment.center,
                      child: ClockView(
                        size: MediaQuery.of(context).size.height / 3,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'TimeZone',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'avenir',
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.language,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'UTC' + offsetSign + offsetString,
                              style: TextStyle(
                                fontFamily: 'avenir',
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}

Widget Buttons_HomePage(String name, String image) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    child: TextButton(
      onPressed: () {},
      child: Column(
        children: <Widget>[
          Image.asset(image, scale: 1.8),
          Text(
            name,
            style: TextStyle(
              fontFamily: 'avenir',
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}
