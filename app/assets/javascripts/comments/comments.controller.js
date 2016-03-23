// controller for commentsNg
angular.module('comments.controller', [])
	 .controller('CommentsCtrl', ['$scope', 'Comments', commentsController])
	 .factory('Comments', ['$http', commentsFactory]);

function commentsController($scope, Comments) {
	// initialize comments in scope
	$scope.comments = Comments;
	// send pin_id on params to getComments
	$scope.$watch("pin_id", function(){
		Comments.getComments($scope);
  });
	// form submit addComment()
	$scope.addComment = function(user, id, body) {
		if($scope.body == '') { return; }	
		// call addComment to add to db 
		Comments.addComment(user, id, body);
		// add recent comment async to view 
		$scope.comments.push({
			user: user,
			body: body
		});
		// clear $scope.body for next comment
		$scope.body = '';
	};
};

function commentsFactory($http) {
	var c = [];
	// populate $scope.comments from db 
	c.getComments = function($scope) {
		return $http.get('/comments', {params: {"pin_id": $scope.pin_id}}).then(function(res){
      angular.copy(res.data.comments, $scope.comments);
    });
	};
	// add new comment to db 
	c.addComment = function(user, id, body) {
  	return $http.post('/comments', {
			user: user,
			body: body,
			pin_id: id
  	});
	};
	return c;
};
