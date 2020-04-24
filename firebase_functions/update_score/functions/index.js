const functions = require('firebase-functions');

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });


const admin = require('firebase-admin');
admin.initializeApp();


exports.addMessage = functions.https.onRequest(
    async(req,res) => {
        const original = req.query.text;
        const snapshot = await admin.database().ref('/messages').push({original: original});
        // Redirect with 303 SEE OTHER to the URL of the pushed object in the Firebase console.
        res.redirect(303, snapshot.ref.toString());
    }
);


exports.updateHighScore = functions.https.onRequest(
    async(req,res) => {

        const uid = req.query.uid;
        const newScore = req.query.newScore;

        var ref = admin.database().ref("reward_app/users/"+uid);
        ref.once("value")
        .then((snapshot) => {
            
            var score = snapshot.child('score').val();

            
            if(newScore > score){

                // Write and then read back a JavaScript object from the Database.
                ref.set({ score: newScore});
                res.redirect(303, snapshot.ref.toString());

            } else {
                res.redirect(303, snapshot.ref.toString());
            }
            

            return 0;

        })
        .catch(
            (error) => {

            }
        );


    }
);

