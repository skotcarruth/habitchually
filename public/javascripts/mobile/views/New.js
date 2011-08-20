habits.views.NewHabit = Ext.extend(Ext.Panel, {

	 initComponent: function() {
		

		this.newHabitForm = new Ext.form.FormPanel({
		    items: [
		        {
		            xtype: 'textfield',
		            name : 'name',
		            label: 'Habit Name'
		        },
		        {
		            xtype: 'button',
		            ui : 'confirm',
					text : 'submit',
					handler : this.submitForm
		        },		
		    ]
		});


		
		Ext.applyIf(this, {
			items : [this.newHabitForm]
		});
		
			
		habits.views.NewHabit.superclass.initComponent.apply(this, arguments);
	 },

	submitForm : function() {
		var val = document.getElementById('ext-gen1025').value;

		var habit = Ext.ModelMgr.create({
			name : val
		}, 'Habit');
				
		habit.save({
			success : function(data) {
				console.log( data );
			}
		});

	}
	
});


Ext.reg('newHabit', habits.views.NewHabit);


