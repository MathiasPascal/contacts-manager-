// test/widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:contact_management_app/main.dart';
import 'package:contact_management_app/screens/contacts_list.dart';
import 'package:contact_management_app/screens/add_contact.dart';
import 'package:contact_management_app/screens/about.dart';
import 'package:contact_management_app/screens/edit_contact.dart';

void main() {
  testWidgets('Main app loads and shows initial contacts screen',
      (WidgetTester tester) async {
    // Build our app
    await tester.pumpWidget(MyApp());

    // Verify initial screen structure
    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.byType(ContactsListScreen), findsOneWidget);
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });

  testWidgets('Bottom navigation switches between screens',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Test Contacts tab
    expect(find.text('Contacts'), findsOneWidget);
    expect(find.byIcon(Icons.contacts), findsOneWidget);

    // Switch to Add Contact tab
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('Add Contact'), findsOneWidget);
    expect(find.byType(AddContactScreen), findsOneWidget);

    // Switch to About tab
    await tester.tap(find.byIcon(Icons.info));
    await tester.pump();
    expect(find.text('About'), findsOneWidget);
    expect(find.byType(AboutScreen), findsOneWidget);
  });

  testWidgets('Contact list item navigates to edit screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Verify list item exists
    expect(find.byType(ListTile), findsOneWidget);

    // Tap on the first contact item
    await tester.tap(find.byType(ListTile).first);
    await tester.pumpAndSettle(); // Wait for navigation animation

    // Verify edit screen appears
    expect(find.byType(EditContactScreen), findsOneWidget);
    expect(find.text('Edit Contact'), findsOneWidget);
  });
}