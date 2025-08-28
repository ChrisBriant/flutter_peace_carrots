import 'package:flutter/material.dart';
import 'package:fast_contacts/fast_contacts.dart';  
import '../providers/dataprovider.dart';
import '../data/database.dart';

class DataProvider extends ChangeNotifier {
  Contact? _selectedContact;
  AppContact? _selectedAppContact;
  List<AppContact> _appContacts = [];

  setSelectedContact(Contact c) {
    _selectedContact = c;
    notifyListeners();
  } 

  setSelectedAppContact(AppContact ac) {
    _selectedAppContact = ac;
  }

  setAppContacts(List<AppContact> appContacts) {
    _appContacts = appContacts;
  }

  Contact? get selectedContact => _selectedContact;
  AppContact? get selectedAppContact => _selectedAppContact;
  List<AppContact> get appContacts => _appContacts;
}