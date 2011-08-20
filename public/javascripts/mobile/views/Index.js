habits.views.List = Ext.extend(Ext.List, {
    cls: 'habit-list',
    emptyText   : 'Nothing',
    itemCls: 'habit-item',
    itemTpl: '{name} <input type="hidden" value="{id}" />',
	itemId : "{id}",
	 initComponent: function() {
	      Ext.applyIf(this, {
	          store: new Ext.data.Store({
	              model: "Habit",
	              autoLoad: true,
	              remoteFilter: true
	          })
	      });
		habits.views.List.superclass.initComponent.apply(this, arguments);
	 },
	onItemTap: function(item, index, e) {
		var id =  item.getElementsByTagName('input')[0].value;
		habits.viewport.onHabitSelect(id);
    },	
});

Ext.reg('habitList', habits.views.List);
