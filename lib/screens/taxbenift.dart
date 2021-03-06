import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class taxbenifit extends StatefulWidget {
  const taxbenifit({
    Key? key,
  }) : super(key: key);
  @override
  State<taxbenifit> createState() => _taxbenifit();
}

class _taxbenifit extends State<taxbenifit> {

  final Stream<QuerySnapshot> data =
      FirebaseFirestore.instance.collection('EkamShowBenifts').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ekam's Tax Benefits"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 250,
                child: StreamBuilder<QuerySnapshot>(
                  stream: data,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot,
                  ) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                          height: 250,
                          width: 250,
                          child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return const Text('Error');
                    }
                    final display = snapshot.requireData;
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: display.size,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              // ignore: prefer_interpolation_to_compose_strings
                              "${"\n Tax Deduction  \$" + display.docs[index]['score'].toString()}\n Recycled Items  " +
                                  display.docs[index]['num_recycled'].toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
