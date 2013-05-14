Feature: Instagram login
	In order to access my Instagram account
	I need to login

	Scenario: Instagram login
		Given that I am on the Instagram page
		When I enter my credentials
		Then I should be logged in

	Scenario Outline: Failed login
		Given that I am on the Instagram page
		When I enter an incorrect <username> and <password>
		Then the login should fail
			Scenarios:
      	| username		 				| password		  	|
      	| vladimir.grigore		| Instagram-12    |
      	| vladimir_grigore    | Instagram 	    |