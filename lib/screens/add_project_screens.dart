import 'package:flutter/material.dart';

class AddProjectScreen extends StatefulWidget {
  @override
  _AddProjectScreenState createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  // Controllers
  final TextEditingController _projectNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // State Variables
  String _selectedTaskGroup = "Work";
  DateTime? _startDate;
  DateTime? _endDate;
  String? _projectIconPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Project'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Task Group Dropdown
              _buildTaskGroupDropdown(),
              SizedBox(height: 20),

              // Project Name Input
              _buildTextField(_projectNameController, 'Project Name'),
              SizedBox(height: 20),

              // Description Input
              _buildTextField(_descriptionController, 'Description',
                  maxLines: 4),
              SizedBox(height: 20),

              // Date Pickers
              _buildDatePicker(context, 'Start Date', true),
              SizedBox(height: 20),
              _buildDatePicker(context, 'End Date', false),
              SizedBox(height: 20),

              // Image Picker
              _buildImagePicker(),

              // Add Project Button
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _saveProject,
                child: Text('Add Project'),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build text fields
  Widget _buildTextField(TextEditingController controller, String label,
      {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }

  // Function to build date pickers
  Widget _buildDatePicker(
      BuildContext context, String label, bool isStartDate) {
    return InkWell(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        setState(() {
          if (pickedDate != null) {
            if (isStartDate) {
              _startDate = pickedDate;
            } else {
              _endDate = pickedDate;
            }
          }
        });
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          isStartDate
              ? (_startDate != null
                  ? _startDate.toString().substring(0, 10)
                  : 'Select Start Date')
              : (_endDate != null
                  ? _endDate.toString().substring(0, 10)
                  : 'Select End Date'),
        ),
      ),
    );
  }

  // Function to build task group dropdown
  Widget _buildTaskGroupDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedTaskGroup,
      items: ['Work', 'Personal', 'Others']
          .map((group) => DropdownMenuItem(value: group, child: Text(group)))
          .toList(),
      onChanged: (value) {
        setState(() {
          _selectedTaskGroup = value!;
        });
      },
      decoration: InputDecoration(
        labelText: 'Task Group',
        border: OutlineInputBorder(),
      ),
    );
  }

  // Placeholder for image picker (implement later)
  Widget _buildImagePicker() {
    return InkWell(
      onTap: () {
        // Image picker functionality here
      },
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text('Select Icon')),
      ),
    );
  }

  // Placeholder function for saving the project
  void _saveProject() {
    if (_projectNameController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _startDate == null ||
        _endDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
    } else {
      // Save project data logic here
      print('Project Saved');
    }
  }
}
