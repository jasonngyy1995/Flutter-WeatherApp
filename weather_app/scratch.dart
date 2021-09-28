import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2Res = await task2();
  task3(task2Res);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future task2() async {
  Duration threeSecs = Duration(seconds: 3);
  String res;

  await Future.delayed(threeSecs, () {
    res = 'task 2 data';
    print('Task 2 complete');
  });
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Data');
}