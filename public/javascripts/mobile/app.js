Ext.defaultAnim = 'slide';

Ext.regApplication({
    name: "habits",
    icon: '',
    glossOnIcon: false,
    tabletStartupScreen: '',
    

    launch: function() {
		this.viewport = new habits.Viewport({
            application: this
        });    
        
    }

});