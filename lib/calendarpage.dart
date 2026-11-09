import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'cores.dart';
import 'todo.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late CalendarFormat _calendarController;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarFormat.month;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calendário',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: rosa,
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: fundo),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: cartao,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: ciano, width: 2),
                ),
                child: TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2100, 12, 31),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarController,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  headerStyle: HeaderStyle(
                    titleCentered: true,
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    formatButtonDecoration: BoxDecoration(
                      color: rosa,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    formatButtonTextStyle: TextStyle(color: Colors.white),
                    leftChevronIcon:
                        Icon(Icons.chevron_left, color: amarelo),
                    rightChevronIcon:
                        Icon(Icons.chevron_right, color: amarelo),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(color: ciano),
                    weekendStyle: TextStyle(color: amarelo),
                  ),
                  calendarStyle: CalendarStyle(
                    defaultTextStyle: TextStyle(color: Colors.white),
                    weekendTextStyle: TextStyle(color: amarelo),
                    outsideTextStyle: TextStyle(color: Colors.white38),
                    todayDecoration: BoxDecoration(
                      color: ciano,
                      shape: BoxShape.circle,
                    ),
                    todayTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: rosa,
                      shape: BoxShape.circle,
                    ),
                    selectedTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TodoPage(dia: selectedDay),
                      ),
                    );
                  },
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarController = format;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Toque em um dia para ver as tarefas",
                  style: TextStyle(
                    color: amarelo,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}