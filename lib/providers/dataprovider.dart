import 'package:flutter/material.dart';
import 'package:fast_contacts/fast_contacts.dart';  

class DataProvider extends ChangeNotifier {
  Contact? _selectedContact;

  setSelectedContact(Contact c) {
    _selectedContact = c;
    notifyListeners();
  } 

  Contact? get selectedContact => _selectedContact;
}