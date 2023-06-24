import 'package:bmi_calculator/app_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constant.dart';
import 'results_page.dart';
import 'buttom_button.dart';
import 'round_icon.dart';

enum Genders { male, female }

Genders selectedGender;
int height = 180;
int weight = 60;
int age = 23;

/**
Color maleCardColor = inactiveCardColor;
Color femaleCardColor = inactiveCardColor;

// 1=male, 2=female

void colorChange(Genders s) {
  if (s == Genders.male) {
    if (maleCardColor == inactiveCardColor) {
      maleCardColor = activeCardColor;
      femaleCardColor = inactiveCardColor;
    } else {
      maleCardColor = inactiveCardColor;
    }
  }

  if (s == Genders.female) {
    if (femaleCardColor == inactiveCardColor) {
      femaleCardColor = activeCardColor;
      maleCardColor = inactiveCardColor;
    } else {
      femaleCardColor = inactiveCardColor;
    }
  }
}
*/
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Genders.male;
                      });
                    },
                    colour: selectedGender == Genders.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: sexContent(
                      icon: FontAwesomeIcons.mars,
                      sex: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Genders.female;
                      });
                    },
                    colour: selectedGender == Genders.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: sexContent(
                      icon: FontAwesomeIcons.venus,
                      sex: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 230,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      setState(
                        () {
                          height = newValue.round();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            onPressed: () {
                              setState(
                                () {
                                  weight--;
                                },
                              );
                            },
                            icon: FontAwesomeIcons.minus,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            icon: FontAwesomeIcons.plus,
                          ),
                        ],
                      )
                    ],
                  ),
                  colour: kActiveCardColor,
                )),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    age--;
                                  },
                                );
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            bottomText: 'CALCULATE',
            onPress: () {
              AppBrain calc = AppBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiValue: calc.bmiResult(),
                    bmiCat: calc.getBMICat(),
                    bmiInterpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
