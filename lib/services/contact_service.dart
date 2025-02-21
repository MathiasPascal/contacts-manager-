import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/contact.dart';

class ContactService {
  static const String baseUrl = 'https://apps.ashesi.edu.gh/contactmgt/actions/';

  Future<List<Contact>> getAllContacts() async {
    final response = await http.get(Uri.parse('${baseUrl}get_all_contact_mob'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Contact.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load contacts');
    }
  }
  Future<void> addContact(String name, String phone) async {
    final response = await http.post(
      Uri.parse('${baseUrl}add_contact_mob'),
      body: {'ufullname': name, 'uphonename': phone},
    );
    if (response.body != 'success') throw Exception('Failed to add contact');
  }

  Future<void> updateContact(int cid, String name, String phone) async {
    final response = await http.post(
      Uri.parse('${baseUrl}update_contact'),
      body: {'cid': cid.toString(), 'cname': name, 'cnum': phone},
    );
    if (response.body != 'success') throw Exception('Failed to update contact');
  }

  Future<void> deleteContact(int cid) async {
    final response = await http.post(
      Uri.parse('${baseUrl}delete_contact'),
      body: {'cid': cid.toString()},
    );
    if (response.statusCode != 200) throw Exception('Failed to delete contact');
  }
}