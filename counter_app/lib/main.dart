import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj_cardapp/cubit/counter_cubit.dart';
import 'package:proj_cardapp/cubit/counterstate.dart';

void main() {
  runApp(const PointsCounter());
}

class PointsCounter extends StatelessWidget {
  const PointsCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

//----------------------------------------------------------------
  late CounterCubit counterCubit;
  @override
  void initState() {
    counterCubit = CounterCubit.get(context);
    super.initState();
  }
//----------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(builder: (context, State) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(100, 232, 152, 1),
          title: const Text('Points Counter'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Team E',
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      ),
                      Text(
                        '${counterCubit.teamAPoints}',
                        style: const TextStyle(
                          fontSize: 150,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(12),
                          backgroundColor:
                              const Color.fromRGBO(100, 232, 152, 1),
                          minimumSize: const Size(160, 60),
                        ),
                        onPressed: () {
                          counterCubit.incrementTeam(
                              buttonNumber: 1, teamName: "A");
                        },
                        child: const Text(
                          'Add 1 Point ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(100, 232, 152, 1),
                          minimumSize: const Size(160, 60),
                        ),
                        onPressed: () {
                          counterCubit.incrementTeam(
                              buttonNumber: 2, teamName: "A");
                        },
                        child: const Text(
                          'Add 2 Point',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(100, 232, 152, 1),
                          minimumSize: const Size(160, 60),
                        ),
                        onPressed: () {
                          counterCubit.incrementTeam(
                              buttonNumber: 3, teamName: "A");
                        },
                        child: const Text(
                          'Add 3 Point ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              const  SizedBox(
                  height: 500,
                  child: const VerticalDivider(
                    indent: 50,
                    endIndent: 50,
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
                SizedBox(
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Team B',
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      ),
                      Text(
                        '${counterCubit.teamBPoints}',
                        style: const TextStyle(
                          fontSize: 150,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(12),
                          backgroundColor:
                              const Color.fromRGBO(100, 232, 152, 1),
                          minimumSize: const Size(160, 60),
                        ),
                        onPressed: () {
                          counterCubit.incrementTeam(
                              buttonNumber: 1, teamName: "B");
                        },
                        child: const Text(
                          'Add 1 Point ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(12),
                          backgroundColor:
                              const Color.fromRGBO(100, 232, 152, 1),
                          minimumSize: const Size(160, 60),
                        ),
                        onPressed: () {
                          counterCubit.incrementTeam(
                              buttonNumber: 2, teamName: "B");
                        },
                        child: const Text(
                          'Add 2 Point ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(12),
                          backgroundColor:
                              const Color.fromRGBO(100, 232, 152, 1),
                          minimumSize: const Size(160, 60),
                        ),
                        onPressed: () {
                          counterCubit.incrementTeam(
                              buttonNumber: 3, teamName: "B");
                        },
                        child: const Text(
                          'Add 3 Point ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(12),
                backgroundColor: const Color.fromRGBO(100, 232, 152, 1),
                minimumSize: const Size(160, 60),
              ),
              onPressed: () {
                counterCubit.resetValues(buttonNumberA: 0);
              },
              child: const Text(
                'Reset',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      );
    }, listener: (context, State) {
      if (State is CounterAIncrementState) {
      } else {}
    });
  }
}
