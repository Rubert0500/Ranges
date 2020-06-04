void main() {

print("Builder");
Range range = builder("[2,6)");
Range range2 = builder("(2,5]");
Range range3 = builder("[2,10[");
Range range4 = builder("(1,9}");
print(range.endPoints());
print(range2.endPoints());
print(range3);
print(range4);

print("Contains");
Range ran = builder("[2,6)");
Range ran2 = builder("(2,5]");
Range ran3 = builder("[2,10]");
Range ran4 = builder("(1,9)");
var list = [2,3,4,5];
var list2 = [3,4,5];
var list3 = [1,2,3,4,5,6,7,8,9,10,11];
var list4 = [1,2,3,4,5,6,7,8,9];
print(ran.contains(list));
print(ran2.contains(list2));
print(ran3.contains(list3));
print(ran4.contains(list4));

print("NotContains");
print(ran.notContains(list));
print(ran2.notContains(list2));
print(ran3.notContains(list3));
print(ran4.notContains(list4));

print("AllPoints");
print(ran.allPoints());
print(ran2.allPoints());
print(ran3.allPoints());
print(ran4.allPoints());

print("ContainsRange");
print(ran.containsRange(builder("[3,5)")));
print(ran2.containsRange(builder("[3,5]")));
print(ran3.containsRange(builder("[1,10]")));
print(ran4.containsRange(builder("[2,10)")));

print("NotContainsRange");
print(ran.notContainsRange(builder("[3,5)")));
print(ran2.notContainsRange(builder("[3,5]")));
print(ran3.notContainsRange(builder("[1,10)")));
print(ran4.notContainsRange(builder("[2,10)")));

print("EndPoints");
print(ran.endPoints());
print(ran2.endPoints());
print(ran3.endPoints());
print(ran4.endPoints());

print("OverLapsRange");
print(ran.overLapsRange(builder("[3,5)")));
print(ran2.overLapsRange(builder("[3,5)")));
print(ran3.overLapsRange(builder("(11,15)")));
print(ran4.overLapsRange(builder("[-5,-2)")));

print("Equals");
print(ran.equals(builder("[2,6)")));
print(ran2.equals(builder("(2,5]")));
print(ran3.equals(builder("[2,15]")));
print(ran4.equals(builder("(1,10)")));

print("NotEquals");
print(ran.notEquals(builder("[2,6)")));
print(ran2.notEquals(builder("(2,5]")));
print(ran3.notEquals(builder("[2,15]")));
print(ran4.notEquals(builder("(1,10)")));


}

Range builder(String value) {
  int num, numb;
  var value1 = value[0];
  var value2 = value[value.length - 1];
  if ((value1 == '(' || value1 == '[') && (value2 == ')' || value2 == ']')) {
    var array = value
        .replaceAll('(', "")
        .replaceAll('[', '')
        .replaceAll(')', '')
        .replaceAll(']', '');
    List<String> ranges = array.split(',');
    num = int.parse(ranges[0]);
    numb = int.parse(ranges[1]);
    if (value1 == '(') {
      num += 1;
    }
    if (value2 == ')') {
      numb -= 1;
    }
    var range = new Range(num, numb);
    return range;
  } else {
    return null;
  }
}

class Range {
  int num;
  int numb;

  Range(int number1, int number2) {
    this.num = number1;
    this.numb = number2;
  }

  bool contains(List<int> numbers) {
    for (var item in numbers) {
      if (item < num || item > numb) {
        return false;
      }
    }
    return true;
  }

  bool notContains(List<int> numbers) {
    return !contains(numbers);
  }

  List<int> allPoints() {
     int less = this.numb - this.num;
    var numbers = new List(less + 1);
    for (int i = 0; i <= less; i++) {
      numbers[i] = this.num + i;
    }    
    List<int> list = numbers.map((array) => array as int).toList();
    return list;
  }

  bool containsRange(Range range) {
    if (range.num >= this.num && range.numb <= this.numb) {
      return true;
    } else {
      return false;
    }
  }

  bool notContainsRange(Range range) {
    return !containsRange(range);
  }

  List<int> endPoints() {
    List<int> numbers = [num, numb];
    var array = numbers;
    return array;
  }

  bool overLapsRange(Range range) {
    var numbers = range.allPoints();
    for (var item in numbers) {
      if (item >= num && item <= numb) {
        return true;
      }
    }
    return false;
  }

  bool equals(Range range) {
    if (this.num == range.num && this.numb == range.numb) {
      return true;
    } else {
      return false;
    }
  }

  bool notEquals(Range range) {
    return !equals(range);
  }
}