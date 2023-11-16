import 'package:flutter_test/flutter_test.dart';
import 'package:expensetracker/presentation/pages/income/add_income_page.dart';

void main() {
  testWidgets('AddIncomePage UI Test', (WidgetTester tester) async {

    await tester.pumpWidget(AddIncomePage());


    expect(find.text('Tambah Pemasukan'), findsOneWidget);
    expect(find.text('Deskripsi'), findsOneWidget);
    expect(find.text('Nominal'), findsOneWidget);
    expect(find.text('Tanggal'), findsOneWidget);


    await tester.tap(find.text('Save'));
    await tester.pump();

    
  });
}
