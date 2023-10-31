import 'package:flutter/material.dart';

enum AppIcons {
  arrowBack(Icons.arrow_back_ios),
  calendar(Icons.calendar_month),
  user(Icons.person),
  mail(Icons.mail),
  phone(Icons.call),
  location(Icons.location_on),
  city(Icons.location_city),
  pin(Icons.push_pin),
  post(Icons.local_post_office),
  search(Icons.search),
  create(Icons.edit_calendar_outlined);

  const AppIcons(this.icon);
  final IconData icon;
}
