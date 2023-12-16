import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const textPlaceholder = 'Text placeholder';
const imagePlaceholder = 'https://source.unsplash.com/random/?dark,blue';

// Title: Register form with text fields and checkbox
// refo-tfch12

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  DateTime date = DateTime(2023, 01, 01);
  DateTime time = DateTime(2023, 01, 01, 00, 00);
  DateTime dateTime = DateTime(2023, 01, 01, 00, 00);

  bool checkboxValue = false;

  @override
  void dispose() {
    emailController.dispose();
    dateController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final viewInsets = MediaQuery.viewInsetsOf(context);
    final isKeyboardOpen = viewInsets.bottom > 0.0;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: colorScheme.primary),
    );

    final enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: colorScheme.primary),
    );

    final focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: colorScheme.primary),
    );

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250,
                      padding: const EdgeInsets.all(16.0),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(imagePlaceholder),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            textPlaceholder,
                            textAlign: TextAlign.center,
                            style: textTheme.headlineLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSecondary,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            '$textPlaceholder $textPlaceholder $textPlaceholder $textPlaceholder $textPlaceholder $textPlaceholder',
                            textAlign: TextAlign.center,
                            style: textTheme.bodyLarge!.copyWith(
                              color: colorScheme.onSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              filled: true,
                              label: const Text('Email Address'),
                              fillColor: colorScheme.primaryContainer,
                              border: border,
                              enabledBorder: enabledBorder,
                              focusedBorder: focusedBorder,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          TextFormField(
                            controller: dateController,
                            keyboardType: TextInputType.text,
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              _selectDate(context);
                            },
                            decoration: InputDecoration(
                              filled: true,
                              label: const Text('Date of Birth'),
                              fillColor: colorScheme.primaryContainer,
                              border: border,
                              enabledBorder: enabledBorder,
                              focusedBorder: focusedBorder,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              filled: true,
                              label: const Text('Phone Number'),
                              fillColor: colorScheme.primaryContainer,
                              border: border,
                              enabledBorder: enabledBorder,
                              focusedBorder: focusedBorder,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          CheckboxListTile(
                            value: checkboxValue,
                            title: const Text(
                              '$textPlaceholder $textPlaceholder $textPlaceholder',
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            onChanged: (bool? value) {
                              setState(() {
                                checkboxValue = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            isKeyboardOpen
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 16.0,
                    ),
                    child: FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48.0),
                      ),
                      child: const Text(textPlaceholder),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 225,
        padding: const EdgeInsets.only(top: 8.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: CupertinoDatePicker(
            initialDateTime: date,
            mode: CupertinoDatePickerMode.date,
            use24hFormat: true,
            showDayOfWeek: true,
            onDateTimeChanged: (DateTime newDate) {
              setState(() => date = newDate);
              dateController.text = newDate.toLocal().toString().split(' ')[0];
            },
          ),
        ),
      ),
    );
  }
}
