import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  DatePicker({Key? key, required this.handleSubmit}) : super(key: key);

  Function handleSubmit;

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: Text("${selectedDate.toLocal()}".split(' ')[0],
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w500,
                        fontSize: 35)),
                onTap: () => _selectDate(context),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => widget
                    .handleSubmit(selectedDate.toString().substring(0, 10)),
                child: Text('Confirm Date'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent[700],
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    textStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.normal)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
