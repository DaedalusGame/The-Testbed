import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;
import mods.requious.SlotVisual;
import mods.requious.LaserVisual;
import mods.requious.GaugeDirection;
import mods.requious.ComponentFace;

var nuclear_core = <assembly:nuclear_core>;

static laserVisual as LaserVisual = LaserVisual.beam([23, 54, 8, 255], 5);
static nuclearSlot as SlotVisual = SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 0, 2, 1, 2, GaugeDirection.up(), false);
static nuclearIcon as SlotVisual = SlotVisual.create(1, 1).addPart("contenttweaker:textures/gui/assembly_extra.png", 0, 0);

nuclear_core.setItemSlot(3, 2, ComponentFace.all(), 64)
			.setAccess(true, false)
				.setGroup("input");
nuclear_core.setItemSlot(4, 3, ComponentFace.all(), 64)
			.setAccess(false, false)
			.setHandAccess(false, false)
			.setGroup("process");
nuclear_core.setEnergySlot(4, 2, ComponentFace.none(), 1000)
			.setAccess(false, false)
			.setUnit("rad")
			.allowOverfill()
			.setBackground(nuclearSlot)
			.setGroup("process");
nuclear_core.setLaserSlot(4, 0, ComponentFace.all())
			.setAccess(false, true)
			.setArea(-3, -3, -3, 3, 3, 3)
			.setMultiTarget(1, 99)
			.setLimit(0, 100000)
			.setGroup("output");
nuclear_core.setItemSlot(5, 2, ComponentFace.all(), 64)
			.setAccess(false, true)
			.setHandAccess(false, true)
			.setGroup("output");

nuclear_core.setJEIItemSlot(0, 0, "input");
nuclear_core.setJEIDurationSlot(1, 0, "duration", SlotVisual.create(1, 1).addPart("requious:textures/gui/assembly_gauges.png", 0, 8));
nuclear_core.setJEIItemSlot(2 ,0, "output");
nuclear_core.setJEILaserSlot(3, 0, "output");

function normalNuclearRecipe(inputItem as IIngredient, outputItem as IItemStack, power as int, time as int){
	var recipeStartProcess = AssemblyRecipe.create(function(container) {
		container.addItemOutput("process",container.getItem("input"));
		container.addEnergyOutput("process", time,0);
	}).requireItem("input", inputItem.marked("input"));
	var recipeTickProcess = AssemblyRecipe.create(function(container) {
		container.addLaserOutput("output", "nuclear", power, laserVisual);
	}).requireEnergy("process",1).requireItem("process", inputItem, 0, 0).setActive(10);
	var recipeEndProcess = AssemblyRecipe.create(function(container) {
		container.addItemOutput("output", outputItem);
	}).requireItem("process", inputItem);
	var recipeJEI = AssemblyRecipe.create(function(container) {
		container.addItemOutput("output", outputItem);
		container.addLaserOutput("output", "nuclear", power, laserVisual, nuclearIcon);
	}).requireItem("input", inputItem).requireDuration("duration", time);
	nuclear_core.addRecipe(recipeTickProcess);
	nuclear_core.addRecipe(recipeEndProcess);
	nuclear_core.addRecipe(recipeStartProcess);
	nuclear_core.addJEIRecipe(recipeJEI);
}

normalNuclearRecipe(<taiga:palladium_ingot>, <taiga:palladium_dust>, 40, 200);
normalNuclearRecipe(<taiga:prometheum_ingot>, <taiga:prometheum_dust>, 80, 5000);
normalNuclearRecipe(<taiga:nucleum_ingot>, <taiga:nucleum_dust>, 400, 32000);
