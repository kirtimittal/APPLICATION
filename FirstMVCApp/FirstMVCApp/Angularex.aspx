<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Angularex.aspx.cs" Inherits="FirstMVCApp.Angularex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.2/angular.min.js"></script>
    <%-- <script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js">
      </script>--%>

    <script>
        var mainApp = angular.module("myapp", []);
           mainApp.controller("studentController", function ($scope) {
                $scope.reset = function() {
               $scope.firstName = "Mahesh";
               $scope.lastName = "Parashar";
               $scope.email = "MaheshParashar@tutorialspoint.com";
            }
            
                $scope.reset();

                $scope.student = {
                    firstName: "Mahesh",
                    lastName: "Parashar",
                    rollno: "1",
                    fees: 500,

                    subjects: [
                        { name: 'Physics', marks: 70 },
                        { name: 'Chemistry', marks: 80 },
                        { name: 'Math', marks: 65 }
                    ],
                    fullName: function () {
                        var studentObject;
                        studentObject = $scope.student;
                        return studentObject.firstName + " " + studentObject.lastName;
                    }
                };
            });

        mainApp.factory('MathService', function() {
            var factory = {};
            
            factory.multiply = function(a, b) {
               return a * b
            }
            return factory;
         });
         mainApp.service('CalcService', function(MathService) {
            this.square = function(a) {
               return MathService.multiply(a,a);
            }
         });
         mainApp.controller('CalcController', function($scope, CalcService) {
            $scope.square = function() {
               $scope.result = CalcService.square($scope.number);
            }
         });
    </script>
    <script>
       
    </script>
</head>
<body>
    <h1>Sample Application</h1>

    <div ng-app="myapp" ng-init="countries = [{locale:'en-US',name:'United States'}, 
         {locale:'en-GB',name:'United Kingdom'}, {locale:'en-FR',name:'France'}]">

        <p>
            Enter your Name:
            <input type="text" ng-model="name">
        </p>
        <p>Hello <span ng-bind="name"></span>!</p>
        <p>List of Countries with locale:</p>

        <ol>
            <li ng-repeat="country in countries">{{ 'Country: ' + country.name + ', Locale: ' + country.locale }}
            </li>
        </ol>

        <div ng-controller="studentController" ng-init="cost=100;quantity=1;marks=[10,20,30,40,50] ">
            <p>Hello {{(student.firstName + " " + student.lastName) | lowercase}}!</p>
            <p>Expense on Books : {{cost * quantity}} Rs</p>
            <p>Roll No: {{student.rollno}}</p>
            <p>Marks(Math): {{marks[3]}}</p>

            Enter first name:
            <input type="text" ng-model="student.firstName"><br>
            <br>
            Enter last name:
            <input type="text" ng-model="student.lastName"><br>
            <br>
            You are entering: {{student.fullName()| uppercase}}
           <br />
            Fees: {{ student.fees| currency}}
              Enter subject:
            <input type="text" ng-model="subjectname" />

            <ol>

                <li ng-repeat="subject in student.subjects| filter: subjectName |orderBy:'marks'">{{'Subject:' + subject.name + ' ,marks:' + subject.marks}}
                </li>
            </ol>
        </div>
        <div>
            <input type="checkbox" ng-model="enableDisableButton">Disable Button
            <button ng-disabled="enableDisableButton">Click Me!</button>
            <br />
            <input type="checkbox" ng-model="showHide1">Show Button
            <button ng-show="showHide1">Click Me!</button>
            <br />
            <input type="checkbox" ng-model="showHide2">Hide Button
            <button ng-hide="showHide2">Click Me!</button>
            <br />
            <p>Total click: {{ clickCounter }}</p>
            <button ng-click="clickCounter = clickCounter + 1">Click Me!</button>
        </div>
        <form name = "studentForm" ng-controller="studentController" novalidate>
            <table border = "0">
               <tr>
                  <td>Enter first name:</td>
                  <td><input name = "firstname" type = "text" ng-model = "firstName" required>
                     <span style = "color:red" ng-show = "studentForm.firstname.$dirty && studentForm.firstname.$invalid">
                        <span ng-show = "studentForm.firstname.$error.required">First Name is required.</span>
                     </span>
                  </td>
               </tr>
               
               <tr>
                  <td>Enter last name: </td>
                  <td><input name = "lastname"  type = "text" ng-model = "lastName" required>
                     <span style = "color:red" ng-show = "studentForm.lastname.$dirty && studentForm.lastname.$invalid">
                        <span ng-show = "studentForm.lastname.$error.required">Last Name is required.</span>
                     </span>
                  </td>
               </tr>
               
               <tr>
                  <td>Email: </td><td><input name = "email" type = "email" ng-model = "email" length = "100" required>
                     <span style = "color:red" ng-show = "studentForm.email.$dirty && studentForm.email.$invalid">
                        <span ng-show = "studentForm.email.$error.required">Email is required.</span>
                        <span ng-show = "studentForm.email.$error.email">Invalid email address.</span>
                     </span>
                  </td>
               </tr>
               
               <tr>
                  <td>
                     <button ng-click = "reset()">Reset</button>
                  </td>
                  <td>
                     <button ng-disabled = "studentForm.firstname.$dirty &&
                        studentForm.firstname.$invalid || studentForm.lastname.$dirty &&
                        studentForm.lastname.$invalid || studentForm.email.$dirty &&
                        studentForm.email.$invalid" ng-click="submit()">Submit</button>
                  </td>
               </tr>
					
            </table>
         </form>
        <div ng-controller = "CalcController">
         <p>Enter a number: <input type = "number" ng-model = "number" /></p>
         <button ng-click = "square()">X<sup>2</sup></button>
         <p>Result: {{result}}</p>
      </div>

    </div>

     

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js">
    </script>

    <%--ajax call--%>
     <script>
         function studentController($scope,$http) {
            var url = "/data.txt";

            $http.get(url).then( function(response) {
               $scope.students = response.data;
            });
         }
      </script>

</body>
</html>
