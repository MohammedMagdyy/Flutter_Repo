import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 55, 55, 55),
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          actions: [
            Icon(Icons.search, color: Colors.white),
          ],
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 41, 38, 38),
          title: const Text(
            'Mohammed Magdy',
            style: TextStyle(color: Color.fromARGB(255, 254, 253, 253)),
          ),
          // leading: YourWidgetHere,  // You can add a leading widget if needed
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main profile header
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        "Assets/Images/download (2).jpeg",
                        fit: BoxFit.cover,
                        height: MediaQuery.sizeOf(context).height * 0.3,
                        width: double.infinity,
                      ),
                      const Positioned(
                        bottom: 0,
                        left: 380,
                        child: const Icon(
                          Icons.camera,
                        ),
                      )
                    ],
                  ),
                  const Positioned(
                    bottom: 10,
                    left: 20,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            "Assets/Images/blank-profile-picture-973460_960_720.webp",
                          ),
                          radius: 75,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 100,
                          child: const Icon(
                            color: Colors.white,
                            Icons.camera,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Mohammed Magdy",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Text(
                    "975 ",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    " friends",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Just Trust in God",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            const Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Card(
                    color: Colors.blue,
                    child: ListTile(
                      leading: const Icon(Icons.add),
                      title: const Text(
                        "Add to Story",
                        maxLines: 1,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Card(
                    child: ListTile(
                      leading: const Icon(Icons.edit_road),
                      title: const Text(
                        "Edit Profile",
                        maxLines: 1,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Card(
                    child: ListTile(
                      title: Center(child: Icon(Icons.more_horiz)),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
