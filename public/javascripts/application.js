$(document).ready(function() {

});


var Habitfil = {
	is_authed : false,
	loaded : false
}

Habitfil.events = {

	setup_new_habit_form : function() {
		$('#add_habit').click(function() {
			$.post('/habits')
		});
	}
	
}
