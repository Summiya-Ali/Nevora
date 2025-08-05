import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeBar extends StatefulWidget {
  const HomeBar({super.key});

  @override
  State<HomeBar> createState() => HomeBarState();
}

class HomeBarState extends State<HomeBar> {
  bool _isTodaySelected = true;

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Homebar(),
          SizedBox(height: 11),
          DateSelector(),
        ],
      );


  }


  Widget Homebar() {
    return Container(

      decoration: BoxDecoration(

        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade700,
            width: 1.0,
          ),
        ),
      ),
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        children: [
          // 2 buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //calendar button
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white24,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.grey),
                    ),
                    padding: EdgeInsets.zero, // 👈 remove internal padding
                    minimumSize: Size(48, 48),

                  ),
                  onPressed: () {},
                  child: Icon(Icons.calendar_month)),
              // bell button
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white24,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.grey),
                    ),
                    padding: EdgeInsets.zero, // 👈 remove internal padding
                    minimumSize: Size(48, 48),
                  ),
                  onPressed: () {},
                  child: Icon(Icons.notifications)
              ),
            ],),

          SizedBox(height: 20),

          // Text and smiling emoji
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  //HI MERIT TEXT
                  Text("Hi, Mert 👋",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        //  color: Colors.white,
                      )
                  ),
                  SizedBox(height: 5),

                  Text("Lets make habits together",
                      style: TextStyle(
                        fontSize: 12,
                        //  color: Colors.white,
                      )
                  ),
                ],
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white24,
                ),
                child: Center(
                  child: Text("😇",
                    style: TextStyle(color: Colors.yellow,
                      fontSize: 25,),
                  ),
                ),

              ),
            ],
          ),

          // Toggle buttons

          SizedBox(height: 20),


      Container(
        height: 33,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey, // Background color of the entire toggle bar
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isTodaySelected = true;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: _isTodaySelected ? Color(0xFFEDC967) : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Center(
                    child: Text(
                      'Today',
                      style: TextStyle(
                        color: _isTodaySelected ? Colors.black : Colors.grey[700],
                        fontWeight: _isTodaySelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isTodaySelected = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: !_isTodaySelected ? Color(0xFFEDC967) : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Clubs',
                          style: TextStyle(
                            color: !_isTodaySelected ? Colors.black : Colors.grey[700],
                            fontWeight: !_isTodaySelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
          SizedBox(height: 17)




        ],
      ),

    );
  }
}


// ✅ DateModel remains simple
class DateModel {
  final String day;
  final int date;

  DateModel({required this.day, required this.date});
}


class DateSelector extends StatefulWidget {
  const DateSelector({super.key});

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  List<DateModel> dateList = [];
  int selectedDate = 1;

  @override
  void initState() {
    super.initState();
    addDates(); // ✅ fill the list
  }

  void addDates() {
    for (int i = 1; i <= 31; i++) {
      DateTime dt = DateTime(2025, 8, i);
      String day = DateFormat('E').format(dt); // Mon, Tue...
      dateList.add(DateModel(day: day, date: i));
    }
  }

  Widget buildDateBox(DateModel item) {
    bool isSelected = selectedDate == item.date;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDate = item.date;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black12 : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(item.date.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )),
            SizedBox(height: 4),
            Text(item.day,
                style: TextStyle(
                  fontSize: 12,
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: dateList.map((item) => buildDateBox(item)).toList(),
      ),
    );
  }
}

