class Department {
  final String dept_name, facltyName;

  const Department({required this.dept_name, required this.facltyName});

  // static const List<Department> department = [
  //   Department
  // ];

}


class Faculty {
  final String name;
  final List<Department> dept;

  const Faculty({required this.name, required this.dept});

  static const List<Faculty> facultyList = [
    Faculty(name: 'Engineering', dept: [
      Department(dept_name: "Mechanical Engineering", facltyName: 'Engineering'),
      Department(dept_name: "Electrical Engineering", facltyName:'Engineering'),
      Department(dept_name: "Civil Engineering", facltyName: 'Engineering'),
      Department(dept_name: "Agricultural Engineering", facltyName: 'Engineering'),
    ]),
    Faculty(name: 'Science', dept: [
      Department(dept_name: "Computer Science", facltyName:'Science'),
    ]),
    Faculty(name: 'Fedcos', dept: [

    ]),
    Faculty(name: 'Fass', dept: [

    ]),
    Faculty(name: 'Agriculture', dept: [

    ]),
    Faculty(name: 'Health', dept:[

    ]),
  ];
}