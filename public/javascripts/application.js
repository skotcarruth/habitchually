$(document).ready(function() {

});


var Habitfil = {
	is_authed : false,
	loaded : false
}

Habitfil.views = {

	index : {
		init : function() {
			var _this = this;
			$.get('/habits.json', function(data) {
				_this.helpers.build_list(data);
			});
		},
		
		helpers : {
			build_list : function(data) {
				var habits = { habits : data },
					html = new EJS({url: '/javascripts/templates/habit_list.ejs'}).render(habits);
				$('#habit-index-list').append(html);
			}
		}
	}	
	
}
