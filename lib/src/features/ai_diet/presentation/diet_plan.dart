import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:async';

class aiDietPlan extends StatefulWidget {
  final String? initialSection;

  aiDietPlan({Key? key, this.initialSection}) : super(key: key);

  @override
  _AiDietPlanQuizState createState() => _AiDietPlanQuizState();
}

class _AiDietPlanQuizState extends State<aiDietPlan>
    with TickerProviderStateMixin {
  int _currentIndex = -1;
  // State variables for selectors
  String selectedAge = '22';
  String selectedSex = 'male';
  String selectedFeet = '5';
  String selectedInches = '9';
  String selectedWeight = '66';
  String selectedActivity = 'Moderately Active';
  List<String> selectedAllergies = [];
  String selectedMeals = '3';
  String selectedCoffeeTea = 'very frequently';
  String selectedAlcohol = 'yes';
  String selectedEatOut = 'yes';
  String medications = '';
  List<String> medicalConditions = [];
  String weightGoal = 'Weight Loss';
  String fitnessGoal = 'Muscle Building';
  String targetTimeline = '2 Months';
  String lateNightSnacking = 'Yes';
  String checkInFrequency = 'Weekly';
  String autonomyLevel = '60%';
  String feedbackMedium = 'InApp';
  AnimationController? _animationController;
  Animation<double>? _animation;
  bool _isLoading = true;

  Map<String, double> sectionProgress = {
    'Personal Profile': 0.65,
    'Lifestyle Profile': 0.55,
    'Medical Profile': 0.40,
    'Health Goals': 0.70,
    'Preferences': 0.40,
    'Consent': 1.0,
  };
  void _nextSection() {
    setState(() {
      if (_currentIndex < 8) {
        _currentIndex++;
      }
    });
  }

  void _previousSection() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      }
    });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _setInitialSection();
    _initializeAnimation();

    Timer(Duration(seconds: 30), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  void _setInitialSection() {
    if (widget.initialSection != null) {
      switch (widget.initialSection) {
        case 'Personal Profile':
          _currentIndex = 0;
          break;
        case 'Lifestyle Profile':
          _currentIndex = 2;
          break;
        case 'Medical Profile':
          _currentIndex = 5;
          break;
        case 'Health Goals':
          _currentIndex = 6;
          break;
        case 'Preferences':
          _currentIndex = 7;
          break;
        case 'Consent':
          _currentIndex = 8;
          break;
        default:
          _currentIndex = -1;
      }
    }
  }

  void _initializeAnimation() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController!);
    _animationController!.forward();
  }

  void _navigateToSection(String title) {
    setState(() {
      switch (title) {
        case 'Personal Profile':
          _currentIndex = 0; // Physical Profile (Age, Sex)
          break;
        case 'Lifestyle Profile':
          _currentIndex = 2; // Activity Level
          break;
        case 'Medical Profile':
          _currentIndex = 3; // Allergies
          break;
        case 'Health Goals':
          _currentIndex = 6; // Health Goals
          break;
        case 'Preferences':
          _currentIndex = 7; // Preferences
          break;
        case 'Consent':
          _currentIndex =
              8; // Setup Complete (you may want to create a separate consent page)
          break;
        default:
          _currentIndex = 0;
      }
    });
  }

  Widget _buildSectionButton(String title, double progress) {
    IconData icon;
    switch (title) {
      case 'Personal Profile':
        icon = Icons.person;
        break;
      case 'Lifestyle Profile':
        icon = Icons.local_activity;
        break;
      case 'Medical Profile':
        icon = Icons.local_hospital;
        break;
      case 'Health Goals':
        icon = Icons.flag;
        break;
      case 'Preferences':
        icon = Icons.settings;
        break;
      case 'Consent':
        icon = Icons.check_circle;
        break;
      default:
        icon = Icons.circle;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
        onPressed: () {
          _navigateToSection(title);
        },
        child: Row(
          children: [
            Icon(icon, color: Colors.green),
            SizedBox(width: 12),
            Expanded(
              child: Text(title, style: TextStyle(color: Colors.black)),
            ),
            Text('${(progress * 100).toInt()}%',
                style: TextStyle(color: Colors.orange)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => _currentIndex == -1
              ? Navigator.pop(context)
              : setState(() => _currentIndex = -1),
        ),
        title: Text(
          'Ai Diet Plan',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            child: Text('Skip', style: TextStyle(color: Colors.orange)),
            onPressed: () {},
          ),
        ],
      ),
      body: _currentIndex == -1 ? _buildOverviewPage() : _buildQuizContent(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFFF0E6),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
        ],
      ),
    );
  }

  Widget _buildOverviewPage() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Personalised Diet Plan Setup',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Image.asset('assets/nutritionist 1.png'),
            SizedBox(height: 16),
            Text(
              'Please complete each section for the best personalized diet plan.',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 24),
            ...sectionProgress.entries
                .map((entry) => _buildSectionButton(entry.key, entry.value))
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_currentIndex == 0) _buildPhysicalProfileSection1(),
            if (_currentIndex == 1) _buildPhysicalProfileSection2(),
            if (_currentIndex == 2) _buildLifestyleProfileSection(),
            if (_currentIndex == 3) _buildAllergiesSection(),
            if (_currentIndex == 4) _buildEatingHabitsSection(),
            if (_currentIndex == 5) _buildMedicalProfileSection(),
            if (_currentIndex == 6) _buildHealthGoalsSection(),
            if (_currentIndex == 7) _buildPreferencesSection(),
            if (_currentIndex == 8) _buildSetupCompleteSection(),
            SizedBox(height: 32),
            if (_currentIndex < 8)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _previousSection,
                    child: Text('Back'),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  ),
                  ElevatedButton(
                    onPressed: _nextSection,
                    child: Text(_currentIndex == 7 ? 'Done' : 'Next'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhysicalProfileSection1() {
    return _buildSection(
      "Let's Setup your Physical Profile",
      "What's your Age and Biological Sex?",
      "Please be Honest :)",
      Image.asset('assets/q1.png'),
      Column(
        children: [
          _buildSelector(['20', '21', '22', '23', '24'], selectedAge,
              (value) => setState(() => selectedAge = value)),
          SizedBox(height: 16),
          _buildSelector(['male', 'female'], selectedSex,
              (value) => setState(() => selectedSex = value)),
        ],
      ),
    );
  }

  Widget _buildPhysicalProfileSection2() {
    return _buildSection(
      "Let's Setup your Physical Profile",
      "What's your Height and Weight?",
      "Please be Honest :)",
      Image.asset('assets/q2.png'),
      Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: _buildSelector(['3', '4', '5', '6', '7'], selectedFeet,
                      (value) => setState(() => selectedFeet = value))),
              SizedBox(width: 16),
              Expanded(
                  child: _buildSelector(
                      ['7', '8', '9', '10', '11'],
                      selectedInches,
                      (value) => setState(() => selectedInches = value))),
            ],
          ),
          SizedBox(height: 16),
          _buildSelector(['64', '65', '66', '67', '68'], selectedWeight,
              (value) => setState(() => selectedWeight = value)),
        ],
      ),
    );
  }

  Widget _buildLifestyleProfileSection() {
    return _buildSection(
      "Let's Setup your Lifestyle Profile",
      "How much active are you?",
      "Please be Honest :)",
      Image.asset('assets/q3.png'),
      _buildSelector([
        'Sedentary',
        'Lightly Active',
        'Moderately Active',
        'Very Active',
        'Extremely Active'
      ], selectedActivity, (value) => setState(() => selectedActivity = value)),
    );
  }

  Widget _buildAllergiesSection() {
    return _buildSection(
      "Let's Setup your Medical Profile",
      "Do you have any known allergies?",
      "Please be Honest :)",
      Image.asset('assets/q5.png'),
      Column(
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildChip('Peanuts'),
              _buildChip('Lactose'),
              _buildChip('Wheat'),
              _buildChip('Starch'),
              _buildChip('Milk'),
            ],
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter other allergies',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEatingHabitsSection() {
    return _buildSection(
      "Let's Setup your Lifestyle Profile",
      "Eating Habits",
      "Please be Honest :)",
      Image.asset('assets/q4.png'),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Meals in a day', style: TextStyle(color: Colors.grey)),
          _buildSelector(['1', '2', '3', '4', '5'], selectedMeals,
              (value) => setState(() => selectedMeals = value)),
          SizedBox(height: 16),
          Text('Do you drink Coffee/Tea', style: TextStyle(color: Colors.grey)),
          _buildSelector(
              ['rarely', 'sometimes', 'very frequently'],
              selectedCoffeeTea,
              (value) => setState(() => selectedCoffeeTea = value)),
          SizedBox(height: 16),
          Text('Do you consume Alcohol/cigarettes/tobacco',
              style: TextStyle(color: Colors.grey)),
          _buildSelector(['no', 'yes'], selectedAlcohol,
              (value) => setState(() => selectedAlcohol = value)),
          SizedBox(height: 16),
          Text('Do you eat out often?', style: TextStyle(color: Colors.grey)),
          _buildSelector(['no', 'yes'], selectedEatOut,
              (value) => setState(() => selectedEatOut = value)),
        ],
      ),
    );
  }

  Widget _buildMedicalProfileSection() {
    return _buildSection(
      "Let's Setup your Medical Profile",
      "Health Information",
      "Please be Honest :)",
      Image.asset('assets/meds.png'),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Medications or supplements currently taken?'),
          TextField(
            onChanged: (value) => setState(() => medications = value),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(height: 16),

          ElevatedButton.icon(
            onPressed: () async {
              // Open the file picker
              FilePickerResult? result = await FilePicker.platform.pickFiles();

              if (result != null) {
                // User selected a file, you can access the file path with:
                String? filePath = result.files.single.path;

                // Implement your functionality with the selected file
                // For example, you can upload the file to a server or save it locally
                print("Selected file: $filePath");
              } else {
                // User canceled the picker
                print("No file selected");
              }
            },
            icon: Icon(Icons.upload),
            label: Text('Prescription'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange.shade100,
              foregroundColor: Colors.orange,
            ),
          ),

          SizedBox(height: 8),
          Text(
              'Any existing medical conditions (diabetes, hypertension, etc.)?'),
          SizedBox(height: 16),
          Text('Only diagnosed*', style: TextStyle(color: Colors.grey)),
          //SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: [
              _buildChip('High blood pressure'),
              _buildChip('High Cholestrol'),
              _buildChip('Low HDL'),
              _buildChip('High Fasting Sugar'),
              _buildChip('High Triglycerides'),
              _buildChip('High Abdominal Obesity'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHealthGoalsSection() {
    return _buildSection(
      "Let's Setup your Health Goals",
      "Health Goals",
      "Please be Honest :)",
      Image.asset('assets/goal.png'),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Weight Goals'),
          _buildSelector(['Weight Loss', 'Weight Gain', 'Maintain'], weightGoal,
              (value) => setState(() => weightGoal = value)),
          SizedBox(height: 16),
          Text('Fitness Goals'),
          _buildSelector(['Muscle Building', 'Fat Loss', 'Endurance'],
              fitnessGoal, (value) => setState(() => fitnessGoal = value)),
          SizedBox(height: 16),
          Text('Any target timeline?'),
          _buildSelector(
              ['1 Month', '2 Months', '3 Months', '6 Months'],
              targetTimeline,
              (value) => setState(() => targetTimeline = value)),
          SizedBox(height: 16),
          Text('Late-night snacking habits'),
          _buildSelector(['Yes', 'No'], lateNightSnacking,
              (value) => setState(() => lateNightSnacking = value)),
        ],
      ),
    );
  }

  Widget _buildPreferencesSection() {
    return _buildSection(
      "Let's Setup your Preferences",
      "Preferences",
      "",
      Image.asset('assets/pref.png'),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Frequency of check-ins'),
          _buildSelector(
              ['Daily', 'Weekly', 'Bi-weekly', 'Monthly'],
              checkInFrequency,
              (value) => setState(() => checkInFrequency = value)),
          SizedBox(height: 16),
          Text('Level of autonomy'),
          _buildSelector(['20%', '40%', '60%', '80%', '100%'], autonomyLevel,
              (value) => setState(() => autonomyLevel = value)),
          SizedBox(height: 16),
          Text('Feedback medium'),
          _buildSelector(['InApp', 'Email', 'SMS'], feedbackMedium,
              (value) => setState(() => feedbackMedium = value)),
          SizedBox(height: 16),
          Text('Late-night snacking habits'),
          _buildSelector(['Yes', 'No'], lateNightSnacking,
              (value) => setState(() => lateNightSnacking = value)),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String question, String subtext,
      Widget image, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: TextStyle(color: Colors.grey)),
        SizedBox(height: 16),
        Center(
            child: Text(question,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center)),
        SizedBox(height: 8),
        Center(
            child: Text(subtext,
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center)),
        SizedBox(height: 24),
        Center(child: image),
        SizedBox(height: 24),
        content,
        SizedBox(height: 32),
      ],
    );
  }

  Widget _buildSetupCompleteSection() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Thank you for your patience'),
          SizedBox(height: 32),
          Text('AI Diet Plan',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Text('Setup Complete', style: TextStyle(fontSize: 18)),
          SizedBox(height: 16),
          Icon(Icons.check_circle, color: Colors.green, size: 48),
          SizedBox(height: 24),
          Text('AI is preparing your diet plan, please wait',
              textAlign: TextAlign.center),
          SizedBox(height: 24),
          if (_isLoading && _animation != null)
            Column(
              children: [
                AnimatedBuilder(
                  animation: _animation!,
                  builder: (context, child) {
                    return LinearProgressIndicator(
                      value: _animation!.value,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                    );
                  },
                ),
                SizedBox(height: 8),
                Text('${(_animation!.value * 100).toInt()}%'),
              ],
            )
          else
            Text('Your diet plan is ready!',
                style: TextStyle(fontSize: 18, color: Colors.green)),
        ],
      ),
    );
  }

  Widget _buildSelector(
      List<String> options, String selected, Function(String) onChanged) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFF0E6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: selected,
        isExpanded: true,
        underline: SizedBox(),
        icon: Icon(Icons.unfold_more, color: Colors.orange),
        style: TextStyle(color: Colors.orange, fontSize: 18),
        onChanged: (String? newValue) {
          if (newValue != null) {
            onChanged(newValue);
          }
        },
        items: options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(value),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildChip(String label) {
    return FilterChip(
      label: Text(label),
      backgroundColor: Color(0xFFFFF0E6),
      selected: selectedAllergies.contains(label) ||
          medicalConditions.contains(label),
      onSelected: (bool selected) {
        setState(() {
          if (selected) {
            if (label == 'High blood p.' || label == 'High Choles.') {
              medicalConditions.add(label);
            } else {
              selectedAllergies.add(label);
            }
          } else {
            if (label == 'High blood p.' || label == 'High Choles.') {
              medicalConditions.remove(label);
            } else {
              selectedAllergies.remove(label);
            }
          }
        });
      },
    );
  }
}
