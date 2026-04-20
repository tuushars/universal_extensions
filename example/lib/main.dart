import 'package:flutter/material.dart';
import 'package:universal_extensions/universal_extensions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Universal Extensions Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Universal Extensions Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      // ── SafeArea wrapper (Widget Extension) ──────────────────────────────
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Section: String Extensions ─────────────────────────────────
            "String Extensions".txt(
              style: context.textTheme.titleLarge,
            ).padOnly(left: 16, top: 16, bottom: 8),

            // capitalize()
            "hello world".capitalize().txt().padAll(8),

            // isEmail()
            Text(
              '"user@example.com".isEmail() → ${"user@example.com".isEmail()}',
            ).padAll(8),

            // toInt() / toDouble()
            Text('"42".toInt() → ${"42".toInt()}').padAll(8),
            Text('"3.14".toDouble() → ${"3.14".toDouble()}').padAll(8),

            const Divider(),

            // ── Section: Num Extensions ────────────────────────────────────
            "Num Extensions".txt(
              style: context.textTheme.titleLarge,
            ).padOnly(left: 16, top: 8, bottom: 8),

            // 10.w and 20.h as spacing widgets
            Row(
              children: [
                const Text("← 20.w gap →"),
                20.w,
                const Text("← 20.w gap →"),
              ],
            ).padAll(8),

            // EdgeInsets helpers
            Container(
              color: Colors.deepPurple.shade100,
              child: const Text("10.all padding"),
            ).padAll(10),

            Container(
              color: Colors.deepPurple.shade100,
              child: const Text("16.horizontal padding"),
            ).padSymmetric(horizontal: 16),

            16.h, // vertical space

            // ── Section: Widget Extensions ─────────────────────────────────
            "Widget Extensions".txt(
              style: context.textTheme.titleLarge,
            ).padOnly(left: 16, top: 8, bottom: 8),

            // padAll / padSymmetric / padOnly
            Container(color: Colors.amber, child: const Text("padAll(12)"))
                .padAll(12),

            Container(color: Colors.green.shade100, child: const Text("padSymmetric"))
                .padSymmetric(horizontal: 24, vertical: 8),

            Container(color: Colors.blue.shade100, child: const Text("padOnly left:32"))
                .padOnly(left: 32),

            16.h,

            // marginAll / marginSymmetric
            Container(color: Colors.orange.shade100, child: const Text("marginAll(12)"))
                .marginAll(12),

            Container(color: Colors.red.shade100, child: const Text("marginSymmetric"))
                .marginSymmetric(horizontal: 20),

            16.h,

            // .center()
            const Icon(Icons.star, color: Colors.deepPurple, size: 36).center(),

            16.h,

            // .align()
            const Text("Aligned to centerRight")
                .align(Alignment.centerRight)
                .padAll(8),

            // .sized()
            Container(color: Colors.teal.shade100)
                .sized(width: context.width * 0.6, height: 50)
                .center(),

            16.h,

            // .expanded() inside a Row
            Row(
              children: [
                const Text("Left"),
                16.w,
                Container(color: Colors.purple.shade100, height: 40)
                    .expanded(),
                16.w,
                const Text("Right"),
              ],
            ).padAll(8),

            16.h,

            // .flexible() inside a Row
            Row(
              children: [
                const Text("Flex: "),
                Container(color: Colors.indigo.shade100, height: 40)
                    .flexible(flex: 2),
                8.w,
                Container(color: Colors.cyan.shade100, height: 40)
                    .flexible(flex: 1),
              ],
            ).padAll(8),

            16.h,

            // .onTap()
            Container(
              padding: 10.all,
              color: Colors.deepPurple,
              child: "Tap Me!".txt(
                style: const TextStyle(color: Colors.white),
              ),
            ).onTap(() {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Tapped via .onTap()!")),
              );
            }).center(),

            16.h,

            // .safeArea() wrapper
            Container(
              color: Colors.lime.shade100,
              child: const Text("SafeArea wrapped widget"),
            ).safeArea().padAll(8),

            const Divider(),

            // ── Section: BuildContext Extensions ──────────────────────────
            "BuildContext Extensions".txt(
              style: context.textTheme.titleLarge,
            ).padOnly(left: 16, top: 8, bottom: 8),

            // context.width / context.height
            Text(
              "context.width = ${context.width.toStringAsFixed(1)}, "
                  "context.height = ${context.height.toStringAsFixed(1)}",
            ).padAll(8),

            // context.theme / context.textTheme
            "context.textTheme.bodyLarge".txt(
              style: context.textTheme.bodyLarge,
            ).padAll(8),

            // context.safePop()
            Container(
              padding: 10.all,
              color: Colors.grey.shade300,
              child: const Text("Safe Pop (no-op on root)"),
            ).onTap(() => context.safePop()).padAll(8),

            const Divider(),

            // ── Section: DateTime Extensions ───────────────────────────────
            "DateTime Extensions".txt(
              style: context.textTheme.titleLarge,
            ).padOnly(left: 16, top: 8, bottom: 8),

            Text(
              "DateTime.now().isToday() → ${now.isToday()}",
            ).padAll(8),

            Text(
              "Yesterday.isToday() → "
                  "${now.subtract(const Duration(days: 1)).isToday()}",
            ).padAll(8),

            32.h,

            // ── Original counter feature ───────────────────────────────────
            const Divider(),
            "Counter (original feature)".txt(
              style: context.textTheme.titleLarge,
            ).padOnly(left: 16, top: 8, bottom: 8),

            'You have pushed the button this many times:'.txt().center(),
            8.h,
            "$_counter".txt(style: context.textTheme.headlineMedium).center(),

            32.h,
          ],
        ),
      ).safeArea(),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}