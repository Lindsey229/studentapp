import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Management App',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController usernameController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration:
                  const InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration:
                  const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Login"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const RegistrationPage(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() =>
      _RegistrationPageState();
}

class _RegistrationPageState
    extends State<RegistrationPage> {
  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController regController =
      TextEditingController();

  final TextEditingController courseController =
      TextEditingController();

  List<String> students = [];

  void saveStudent() {
    setState(() {
      students.add(
        "${nameController.text} - "
        "${regController.text} - "
        "${courseController.text}",
      );
    });

    nameController.clear();
    regController.clear();
    courseController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Registration"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration:
                  const InputDecoration(labelText: "Student Name"),
            ),
            TextField(
              controller: regController,
              decoration:
                  const InputDecoration(labelText: "Registration Number"),
            ),
            TextField(
              controller: courseController,
              decoration:
                  const InputDecoration(labelText: "Course"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveStudent,
              child: const Text("Save Student"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(students[index]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}