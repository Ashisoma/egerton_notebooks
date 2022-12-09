class Course {
  final String dept_name;

  const Course({required this.dept_name});

  // static const List<Department> department = [
  //   Department
  // ];

}

class Faculty {
  final String name;
  final List<Course> courses;

  const Faculty({required this.name, required this.courses});

  static const List<Faculty> facultyList = [
    Faculty(
      name: "Science",
      courses: [
        Course(dept_name: "Computer Science"),
        Course(dept_name: "Economic"),
        Course(dept_name: "General Science"),
        Course(dept_name: "Chemistry"),
        Course(dept_name: "Biology"),
      ],
    ),
    Faculty(
      name: "Engineering",
      courses: [
        Course(dept_name: "Mechanical"),
        Course(dept_name: "Civil"),
        Course(dept_name: "Electrical")
      ],
    ),
    Faculty(name: "Agriculture", courses: [Course(dept_name: "Agriculture")]),
    Faculty(name: "Arts and Social Science", courses: [
      Course(dept_name: "Socialogy")
    ]),
  ];
}
