import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;

var assembler = <assembly:assembler>;

var x = assembler.setItemSlot(1,1,mods.requious.ComponentFace.all(),64).setAccess(true,false).setGroup("input");
x = assembler.setItemSlot(1,2,mods.requious.ComponentFace.all(),64).setAccess(true,false).setGroup("input");
x = assembler.setItemSlot(1,3,mods.requious.ComponentFace.all(),64).setAccess(true,false).setGroup("input");
x = assembler.setItemSlot(2,1,mods.requious.ComponentFace.all(),64).setAccess(true,false).setGroup("input");
x = assembler.setItemSlot(2,2,mods.requious.ComponentFace.all(),64).setAccess(true,false).setGroup("input");
x = assembler.setFluidSlot(2,3,mods.requious.ComponentFace.all(),12000).setAccess(true,false).setGroup("input");
x = assembler.setItemSlot(6,1,mods.requious.ComponentFace.all(),64).setAccess(false,true).setHandAccess(false,true).setGroup("output");
x = assembler.setItemSlot(6,2,mods.requious.ComponentFace.all(),64).setAccess(false,true).setHandAccess(false,true).setGroup("output");
x = assembler.setItemSlot(6,3,mods.requious.ComponentFace.all(),64).setAccess(false,true).setHandAccess(false,true).setGroup("output");

assembler.setJEIItemSlot(0,0,"input");
assembler.setJEIItemSlot(1,0,"input");
assembler.setJEIItemSlot(2,0,"input");
assembler.setJEIItemSlot(0,1,"input");
assembler.setJEIItemSlot(1,1,"input");
assembler.setJEIFluidSlot(2,1,"input");
assembler.setJEIDurationSlot(3,0,"duration",mods.requious.SlotVisual.create(1,1).addPart("requious:textures/gui/assembly_gauges.png",0,8));
assembler.setJEIItemSlot(4,0,"output");
assembler.setJEIItemSlot(5,0,"output");
assembler.setJEIItemSlot(6,0,"output");

function add(inputItems as IIngredient[], inputFluids as ILiquidStack[], outputItems as IItemStack[]){
	var assembler = <assembly:assembler>;
	var recipe = mods.requious.AssemblyRecipe.create(function(container) {
		for item in outputItems {
			container.addItemOutput("output",item);
		}
	});
	for item in inputItems {
		recipe = recipe.requireItem("input",item);
	}
	for fluid in inputFluids {
		recipe = recipe.requireFluid("input",fluid);
	}
	assembler.addRecipe(recipe);
	assembler.addJEIRecipe(recipe);	
}
function addRandom(inputItems as IIngredient[], inputFluids as ILiquidStack[], outputItems as WeightedItemStack[]){
	var assembler = <assembly:assembler>;
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
	for fluid in inputFluids {
		recipe = recipe.requireFluid("input",fluid);
	}
	assembler.addRecipe(recipe);
	assembler.addJEIRecipe(recipe);
}

add([<contenttweaker:blast_gel_block>, <contenttweaker:fuse> * 16], [], [<contenttweaker:blast_gel_processed>]);
add([<contenttweaker:blast_gel_processed>, <minecraft:paper> * 8], [], [<minecraft:tnt>]);




