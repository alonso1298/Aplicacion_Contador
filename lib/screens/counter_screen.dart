import 'package:flutter/material.dart';

class CounterString extends StatefulWidget {
  const CounterString({super.key});

  @override
  State<CounterString> createState() => _CounterStringState();
}

class _CounterStringState extends State<CounterString> {
  int counter = 10;

  void increase() {
    counter++;
    setState(() {});
  }

  void reset() {
    counter = 0;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterString'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Clicks Counter', style: fontSize30),
            Text('$counter', style: fontSize30),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: CustomFloatingActions(
        increaseFn: increase,
        resetFn: reset,
        decreaseFn: decrease,
      ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  
  final Function increaseFn;

  final Function decreaseFn;

  final Function resetFn;

  const CustomFloatingActions({
    super.key,
    required this.increaseFn, 
    required this.decreaseFn, 
    required this.resetFn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.exposure_plus_1),
          onPressed: () => increaseFn(),
        ),

        //const SizedBox(width: 20),

        FloatingActionButton(
          child: const Icon(Icons.exposure_outlined),
          onPressed: () => resetFn(),
        ),

        //const SizedBox(width: 20),

        FloatingActionButton(
          child: const Icon(Icons.exposure_minus_1),
          onPressed: () => decreaseFn(),
        ),
      ],
    );
  }
}
