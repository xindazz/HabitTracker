//
//  FBFireStore.swift
//  Signin With Apple
//
//  Created by Stewart Lynch on 2020-03-18.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//
import FirebaseFirestore
import FirebaseFirestoreSwift

let db = Firestore.firestore()

enum FBFirestore {

    static func retrieveFBUser(uid: String, completion: @escaping (Result<FBUser, Error>) -> ()) {
        let reference = db.collection(FBKeys.CollectionPath.users).document(uid)
        getDocument(for: reference) { (result) in
            switch result {
            case .success(let data):
                guard let user = FBUser(documentData: data) else {
                    completion(.failure(FireStoreError.noUser))
                    return
                }
                completion(.success(user))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
    
    static func addAlarm(uid: String, alarm: Alarm) {
        // Create alarm document in alarms collection
        do {
            let _ = try db.collection(FBKeys.CollectionPath.alarms).document(alarm.id!).setData(from: alarm)
        } catch let error {
            print("Error adding alarm to Firestore: \(error)")
        }
        
        // Add alarm reference to sender's alarmsByMe array
        let alarmRef = db.collection(FBKeys.CollectionPath.alarms).document(alarm.id!)
        db.collection(FBKeys.CollectionPath.users).document(uid)
            .updateData([
            "alarmsByMe": FieldValue.arrayUnion([alarmRef])
        ]) { (error) in
            if let error = error {
                print("Error = \(error)")
            } else {
                print("Alarm successfully added for sender")
            }
        }
        
        // Add alarm reference to receiver's alarmsForMe array
        db.collection(FBKeys.CollectionPath.users).whereField("name", isEqualTo: alarm.receiver)
            .getDocuments() { (snap, err) in
                if let err = err {
                    print("Error getting user with username \(alarm.receiver): \(err)")
                } else {
                    for user in snap!.documents {
                        let receiverName = user.data()["name"] as! String
                        let receiverUID = user.data()["uid"] as! String
                        if receiverName == alarm.receiver {
                            db.collection(FBKeys.CollectionPath.users).document(receiverUID)
                            .updateData([
                                "alarmsForMe": FieldValue.arrayUnion([alarmRef])
                            ]) { (error) in
                                if let error = error {
                                    print("Error = \(error)")
                                } else {
                                    print("Alarm successfully added for receiver")
                                }
                            }
                        }
                    }
                }
                
        }
        
    }
    
    static func mergeFBUser(_ data: [String: Any], uid: String, completion: @escaping (Result<Bool, Error>) -> ()) {
        let reference = db.collection(FBKeys.CollectionPath.users).document(uid)
        reference.setData(data, merge: true) { (err) in
            if let err = err {
                completion(.failure(err))
                return
            }
            completion(.success(true))
        }
    }
    
    
    fileprivate static func getDocument(for reference: DocumentReference, completion: @escaping (Result<[String : Any], Error>) -> ()) {
        reference.getDocument { (documentSnapshot, err) in
            if let err = err {
                completion(.failure(err))
                return
            }
            guard let documentSnapshot = documentSnapshot else {
                completion(.failure(FireStoreError.noDocumentSnapshot))
                return
            }
            guard let data = documentSnapshot.data() else {
                completion(.failure(FireStoreError.noSnapshotData))
                return
            }
            completion(.success(data))
        }
    }
    
}
