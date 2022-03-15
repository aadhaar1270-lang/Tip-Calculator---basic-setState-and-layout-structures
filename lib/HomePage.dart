import 'package:flutter/material.dart';
import './quotes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.0),
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Per Person',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        '\$ ${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)}',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    padding: EdgeInsets.all(12.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.blueGrey.shade100,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Column(
                      children: [
                        TextField(
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          style: TextStyle(color: Colors.purple, fontSize: 18),
                          decoration: InputDecoration(
                            prefixText: 'Bill Amount: ',
                            //prefixIcon: Icon(Icons.attach_money),
                          ),
                          onChanged: (String value) {
                            try {
                              setState(() {
                                _billAmount = double.parse(value);
                              });
                            } catch (exception) {
                              _billAmount = 0.0;
                            }
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Split',
                              style:
                                  TextStyle(color: Colors.purple, fontSize: 18),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(
                                      () {
                                        if (_personCounter > 1) {
                                          _personCounter--;
                                        }
                                      },
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.purple,
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "-",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          //fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "$_personCounter",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(
                                      () {
                                        if (_personCounter >= 1) {
                                          _personCounter++;
                                        }
                                      },
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.purple,
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "+",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tip',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.purple),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(
                                " \$ ${ (calculateTotalTip(_billAmount, _personCounter, _tipPercentage)).toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '$_tipPercentage%',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                        Slider(
                          min: 0,
                          max: 100,
                          divisions: 10,
                          activeColor: Colors.purple,
                          inactiveColor: Colors.blueGrey,
                          value: _tipPercentage.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              _tipPercentage = newValue.round();
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
          //getQuotes(),
          /*getCard(),
          getAvatar(),*/
          ),
    );

  }

  Widget getQuotes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 350,
          height: 200,
          //padding: EdgeInsets.all(30.0),
          margin: EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(14.5),
          ),
          child: Center(
            child: Text(
              quotes[_index % quotes.length],
              style: TextStyle(
                fontSize: 16.5,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
        Divider(thickness: 1.3),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.green,
            ),
            onPressed: changeQuote,
            icon: Icon(Icons.wb_sunny),
            label: Text(
              'Change quote',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
        Spacer(),

        //getAvatar
      ],
    );
  }

  void changeQuote() {
    setState(() {
      _index++;
    });
  }

  Widget getAvatar() {
    return Positioned(
      top: 100,
      child: Container(
        height: 100,
        width: 100,
        margin: EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(color: Colors.black, width: 5),
          image: DecorationImage(
            image: NetworkImage('https://picsum.photos/300/300'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget getCard() {
    return Center(
      //color: Colors.green,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        height: 200,
        width: 350,
        decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(
              color: Colors.black,
              width: 4,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Aadhaar Narang',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Text(
              'aadhaar1270@gmail.com',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person_outline),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '@aadhaar1270',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage) {

    var totalPerPerson = (calculateTotalTip(billAmount, splitBy, tipPercentage) + _billAmount) / splitBy;

    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage){
    double totalTip = 0.0;

    if(_billAmount < 0 || _billAmount.toString().isEmpty || _billAmount == null) {
      // no go
    }else{
      totalTip = (_billAmount * _tipPercentage) / 100;
    }
    return totalTip;
  }
}
