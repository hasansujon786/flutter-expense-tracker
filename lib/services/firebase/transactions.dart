import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';

Future<MyTransaction?> createTransaction(MyTransaction newTx) async {
  final txDoc = FirebaseFirestore.instance.collection('transactions').doc();

  newTx.id = txDoc.id;
  final json = newTx.toJson();

  try {
    txDoc.set(json);
    return newTx;
  } catch (error) {
    print(error);
  }
  return null;
}

Stream<List<MyTransaction>> readTransactions() {
  return FirebaseFirestore.instance
      .collection('transactions')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => MyTransaction.fromJson(doc.data())).toList());
}

void deleteSingleTransaction(String id) async {
  final txDoc = FirebaseFirestore.instance.collection('transactions').doc(id);
  txDoc.delete();
}
