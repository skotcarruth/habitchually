Ext.regModel('Habit', {
    fields: ['id', 'name'],
    proxy: {
        type: 'rest',
  		format: 'json',		
        url : '/habits',
		appendId : false,
		writer : {
			root : 'habit'
		}
    }
});
