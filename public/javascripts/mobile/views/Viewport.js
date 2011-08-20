habits.Viewport = Ext.extend(Ext.Panel, {
    id        : 'viewport',
    layout    : 'card',
	direction : 'left',
    fullscreen: true,
    initComponent: function() {

        Ext.apply(this, {
            dockedItems: [
                {
                    dock : 'top',
                    xtype: 'toolbar',
					title: 'My Habits',
		            items: [{
		                text: 'Back',
		                ui: 'back',
		                handler: this.backBtn,
		                scope: this
		            },
					{
		                text: 'Add',
		                ui: 'add',
		                handler: this.addHabit,
		                scope: this
		            }		
					]
                }
            ],
            items: [
	        	{xtype : 'habitList'}
			],
        });
        habits.Viewport.superclass.initComponent.apply(this, arguments);
    },
    onHabitSelect: function(hid) {
		this.activeHabitCard = new habits.views.HabitView({
        });


        this.setActiveItem(this.activeHabitCard, 'slide');
        
    },
	backBtn : function() {
        var activeItem = this.layout.activeItem,
            idx = this.items.items.indexOf(activeItem),
            ownerCt = idx === 0 ? this.ownerCt : this,
            animCfg = Ext.is.Android ? false : {type: 'slide', direction: 'right'};
        

        ownerCt.layout.prev(animCfg);
	},
	addHabit : function() {
		this.activeHabitCard = new habits.views.NewHabit({
			
        });

        this.setActiveItem(this.activeHabitCard, 'slide');		
	}
});

Ext.reg('viewport', habits.Viewport);