// Angular for commentsNg
var commentsNg = angular.module('commentsNg', ['comments.controller']);

commentsNg.config(['$httpProvider', '$locationProvider', commentsConfig]);

function commentsConfig($httpProvider, $locationProvider) {
	$httpProvider.defaults.headers.common["X-CSRF-Token"] = 
		$("meta[name=csrf-token]").attr("content");
	$locationProvider.html5Mode({
		enabled: true,
		requireBase: false
	});
};
