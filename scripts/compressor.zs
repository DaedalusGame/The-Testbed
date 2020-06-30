import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;

var compressor = <assembly:compressor>;

var x = compressor.setItemSlot(1,1,mods.requious.ComponentFace.all(),64).setAccess(true,false).setGroup("input");
x = compressor.setItemSlot(1,2,mods.requious.ComponentFace.all(),64).setAccess(true,false).setGroup("input");
x = compressor.setItemSlot(1,3,mods.requious.ComponentFace.all(),64).setAccess(true,false).setGroup("input");
x = compressor.setFluidSlot(2,2,mods.requious.ComponentFace.back(),12000).setAccess(true,false).setGroup("input");
x = compressor.setItemSlot(6,1,mods.requious.ComponentFace.all(),64).setAccess(false,true).setHandAccess(false,true).setGroup("output");
x = compressor.setItemSlot(6,2,mods.requious.ComponentFace.all(),64).setAccess(false,true).setHandAccess(false,true).setGroup("output");
x = compressor.setItemSlot(6,3,mods.requious.ComponentFace.all(),64).setAccess(false,true).setHandAccess(false,true).setGroup("output");

compressor.setJEIItemSlot(0,0,"input");
compressor.setJEIItemSlot(1,0,"input");
compressor.setJEIItemSlot(2,0,"input");
compressor.setJEIFluidSlot(3,0,"input");
compressor.setJEIDurationSlot(4,0,"duration",mods.requious.SlotVisual.create(1,1).addPart("requious:textures/gui/assembly_gauges.png",0,8));
compressor.setJEIItemSlot(5,0,"output");
compressor.setJEIItemSlot(6,0,"output");
compressor.setJEIItemSlot(7,0,"output");

function add(inputItems as IIngredient[], inputFluid as ILiquidStack, outputItems as IItemStack[]){
	var compressor = <assembly:compressor>;
	var recipe = mods.requious.AssemblyRecipe.create(function(container) {
		for item in outputItems {
			container.addItemOutput("output",item);
		}
	});
	for item in inputItems {
		recipe = recipe.requireItem("input",item);
	}
	if(!isNull(inputFluid))
		recipe = recipe.requireFluid("input",inputFluid);
	
	compressor.addRecipe(recipe);
	compressor.addJEIRecipe(recipe);	
}
function addRandom(inputItems as IIngredient[], inputFluid as ILiquidStack, outputItems as WeightedItemStack[]){
	var compressor = <assembly:compressor>;
	var recipe = mods.requious.AssemblyRecipe.create(function(container) {
		for item in outputItems {
			if(container.jei)
				container.addItemOutput("output",item.stack.withLore(["§d§l" ~ item.percent ~ "%"]));
			else if(container.random.nextDouble() < item.chance)
				container.addItemOutput("output",item.stack);
		}
	});
	for item in inputItems {
		recipe = recipe.requireItem("input",item);
	}
	if(!isNull(inputFluid))
		recipe = recipe.requireFluid("input",inputFluid);
	
	compressor.addRecipe(recipe);
	compressor.addJEIRecipe(recipe);
}

addRandom([<contenttweaker:sulfur>,<ore:coal>*2], <liquid:steam> * 1500, [<contenttweaker:sulfuel> % 20, <minecraft:cobblestone> % 80]);
addRandom([<contenttweaker:sulfuel>*2,<contenttweaker:solid_fuel>*4], <liquid:gas> * 500, [<contenttweaker:sulfuel_empowered> % 40, <minecraft:cobblestone> % 60]);
add([<contenttweaker:sulfuel_empowered>*3,<minecraft:tnt>*25], <liquid:steam> * 10000, [<contenttweaker:sulfuel_hp>]);