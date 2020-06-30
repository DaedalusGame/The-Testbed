import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;
import mods.requious.SlotVisual;
import mods.requious.GaugeDirection;

var nuclear_core = <assembly:nuclear_core>;

static laserVisual as mods.requious.LaserVisual = mods.requious.LaserVisual.beam([23,54,8,255],5);
static nuclearSlot as SlotVisual = SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png",0,2,1,2,GaugeDirection.up(),false);
static nuclearIcon as SlotVisual = SlotVisual.create(1,1).addPart("contenttweaker:textures/gui/assembly_extra.png",0,0);

var x = nuclear_core.setItemSlot(3,2,mods.requious.ComponentFace.all(),64).setAccess(true,false).setGroup("input");
x = nuclear_core.setItemSlot(4,3,mods.requious.ComponentFace.all(),64).setAccess(false,false).setHandAccess(false,false).setGroup("process");
x = nuclear_core.setEnergySlot(4,2,mods.requious.ComponentFace.none(),1000).setAccess(false,false).setUnit("rad").allowOverfill().setBackground(nuclearSlot).setGroup("process");
x = nuclear_core.setLaserSlot(4,0,mods.requious.ComponentFace.all()).setAccess(false,true).setArea(-3,-3,-3,3,3,3).setMultiTarget(1,99).setLimit(0,100000).setGroup("output");
x = nuclear_core.setItemSlot(5,2,mods.requious.ComponentFace.all(),64).setAccess(false,true).setHandAccess(false,true).setGroup("output");

nuclear_core.setJEIItemSlot(0,0,"input");
nuclear_core.setJEIDurationSlot(1,0,"duration",mods.requious.SlotVisual.create(1,1).addPart("requious:textures/gui/assembly_gauges.png",0,8));
nuclear_core.setJEIItemSlot(2,0,"output");
nuclear_core.setJEILaserSlot(3,0,"output");

function add(inputItem as IIngredient, outputItem as IItemStack, power as int, time as int){
	var nuclear_core = <assembly:nuclear_core>;
	var recipeStartProcess = mods.requious.AssemblyRecipe.create(function(container) {
		container.addItemOutput("process",container.getItem("input"));
		container.addEnergyOutput("process",time,0);
	}).requireItem("input",inputItem.marked("input"));
	var recipeTickProcess = mods.requious.AssemblyRecipe.create(function(container) {
		container.addLaserOutput("output", "nuclear", power, laserVisual);
	}).requireEnergy("process",1).requireItem("process", inputItem, 0, 0).setActive(10);
	var recipeEndProcess = mods.requious.AssemblyRecipe.create(function(container) {
		container.addItemOutput("output", outputItem);
	}).requireItem("process",inputItem);
	var recipeJEI = mods.requious.AssemblyRecipe.create(function(container) {
		container.addItemOutput("output", outputItem);
		container.addLaserOutput("output", "nuclear", power, laserVisual, nuclearIcon);
	}).requireItem("input", inputItem).requireDuration("duration", time);
	nuclear_core.addRecipe(recipeTickProcess);
	nuclear_core.addRecipe(recipeEndProcess);
	nuclear_core.addRecipe(recipeStartProcess);
	nuclear_core.addJEIRecipe(recipeJEI);
}

add(<taiga:palladium_ingot>,<taiga:palladium_dust>,40,200);
add(<taiga:prometheum_ingot>,<taiga:prometheum_dust>,80,5000);
add(<taiga:nucleum_ingot>,<taiga:nucleum_dust>,400,32000);



