habits.views.HabitView = Ext.extend(Ext.Panel, {



	 initComponent: function() {
		

		// 
		// Ext.applyIf(this, {
		// 	items : [this.statusList],
		// 	dockedItems: [this.formPanel,  this.filterBar]
		// });
		// 
		// 	
		habits.views.HabitView.superclass.initComponent.apply(this, arguments);
	 }
});


Ext.reg('habitView', habits.views.HabitView);


