(function(){
  "use strict";

angular.module("app").controller("employeesCtrl", function($scope, $http) {
    $scope.setup = function() {
      $http.get("/api/v1/employees.json".then(function(response) {
        console.log(response)
        $scope.employees = response.data;  
      }());
    };

    $scope.addEmployee = function(newFirstName, newLastName, newEmail) {
      var newEmployee = {
                          firstName: newFirstName,
                          lastName: newLastName,
                          email: newEmail
                        };

      $http.post("/api/v1/employees.json", newEmployee).then(function(response) {
        $scope.employees.push(response.data);
        $scope.formFirstName = null;
        $scope.formLastName = null;
        $scope.formEmail = null;
        $scope.errors = null;
      }, function(errorResponse) {
        $scope.errors = errorReponse.data.errors;
      });
    });

    $scope.deleteEmployee = function(index) {
      $scope.employees.splice(index, 1);
    };
  };
}());
