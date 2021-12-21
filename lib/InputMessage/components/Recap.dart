import 'package:flutter/material.dart';

class Recap extends StatelessWidget {
  Recap({required this.handleSubmit, required this.collectedData});

  Function handleSubmit;
  Map collectedData;

  @override
  Widget build(BuildContext context) {
    var refactorList = {};
    collectedData.keys.forEach((key) => {
          if (key == 'date')
            {refactorList[key] = collectedData[key].split('T')[0]}
          else
            {refactorList[key] = collectedData[key]}
        });

    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            for (var key in refactorList.keys)
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(key,
                        style: TextStyle(fontSize: 17, color: Colors.black54)),
                    Text(refactorList[key].toString(),
                        style: TextStyle(fontSize: 20, color: Colors.black87)),
                    Divider()
                  ],
                ),
              ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 70.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text('Confirm'),
                onPressed: () {
                  print('url-save-data then restart');
                  this.handleSubmit('restart');
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent[600],
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 15,
                    )),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                child: Text('Get Directions'),
                onPressed: () {
                  this.handleSubmit('directions');
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent[700],
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 15,
                    )),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
