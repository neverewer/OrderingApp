import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ordering_app/src/core/models/order.dart';
import 'package:ordering_app/src/core/models/user.dart';

class OrderingViewModel extends ChangeNotifier {
  DateTime _orderingDate = DateTime.now();

  DateTime get orderingDate => _orderingDate;

  final List<User> _senders = [];

  List<User> get senders => _senders;

  final List<User> _recipients = [];

  List<User> get recipients => _recipients;

  final List<Order> _orders = [];

  List<Order> get orders => _orders;

  User? _selectedSender;

  User? get selectedSender => _selectedSender;

  User? _selectedRecipient;

  User? get selectedRecipient => _selectedRecipient;

  void selectSender(User sender) {
    _selectedSender = sender;
    notifyListeners();
    log('Sender selected');
  }

  void selectRecipient(User recipient) {
    _selectedRecipient = recipient;
    notifyListeners();
    log('Recipient selected');
  }

  void setOrderingDate(DateTime date) {
    _orderingDate = date;
    notifyListeners();
  }

  void addSender(User sender) {
    _senders.add(sender);
    notifyListeners();
  }

  void addRecipient(User recipient) {
    _recipients.add(recipient);
    notifyListeners();
  }

  void createOrderFromAddedData(User sender, User recipient) {
    final order = Order(startDate: _orderingDate, sender: sender, recipient: recipient);
    _orders.add(order);
    _senders.add(sender);
    _recipients.add(recipient);
    notifyListeners();
    log('Order successfully create');
    log(_senders.length.toString());
    log(_recipients.length.toString());
  }

  void createOrderFromSelectedData() {
    if (_selectedRecipient == null || _selectedSender == null) {
      throw Exception('Empty sender or recipient');
    }
    final order = Order(startDate: _orderingDate, sender: _selectedSender!, recipient: _selectedRecipient!);
    _orders.add(order);
    notifyListeners();
    log('Order successfully create');
  }

  void createOrderFromSelectedSenderAndAddedRecipient(User recipient) {
    if (_selectedSender == null) {
      throw Exception('Empty sender');
    }
    final order = Order(startDate: _orderingDate, sender: _selectedSender!, recipient: recipient);
    _orders.add(order);
    _recipients.add(recipient);
    notifyListeners();
    log('Order successfully create');
  }

  void createOrderFromSelectedRecipientAndAddedSender(User sender) {
    if (_selectedRecipient == null) {
      throw Exception('Empty recipient');
    }
    final order = Order(startDate: _orderingDate, sender: sender, recipient: _selectedRecipient!);
    _orders.add(order);
    _senders.add(sender);
    notifyListeners();
    log('Order successfully create');
  }
}
