import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;

import mods.requious.ComponentFace;
import mods.requious.SlotVisual;
import mods.requious.AssemblyRecipe;

var congeal_chamber = <assembly:congeal_chamber>;

congeal_chamber.setItemSlot(1, 2, ComponentFace.all(), 64)
			   .setAccess(true, false)
			   .setGroup("input");
congeal_chamber.setFluidSlot(2, 2, ComponentFace.back(), 12000)
			   .setAccess(true, false)
			   .setGroup("input");
congeal_chamber.setItemSlot(6, 1, ComponentFace.all(), 64)
			   .setAccess(false, true)
			   .setHandAccess(false, true)
			   .setGroup("output");
congeal_chamber.setItemSlot(6, 2, ComponentFace.all(), 64)
			   .setAccess(false, true)
			   .setHandAccess(false, true)
			   .setGroup("output");
congeal_chamber.setItemSlot(6, 3, ComponentFace.all(), 64)
			   .setAccess(false, true)
			   .setHandAccess(false, true)
			   .setGroup("output");

congeal_chamber.setJEIItemSlot(2, 0, "input");
congeal_chamber.setJEIFluidSlot(3, 0, "input");
congeal_chamber.setJEIDurationSlot(4, 0, "duration", SlotVisual.create(1, 1).addPart("requious:textures/gui/assembly_gauges.png", 0, 8));
congeal_chamber.setJEIItemSlot(5, 0, "output");
congeal_chamber.setJEIItemSlot(6, 0, "output");
congeal_chamber.setJEIItemSlot(7, 0, "output");

function basicCCRecipe(inputItems as IIngredient[], inputFluid as ILiquidStack, outputItems as IItemStack[]){
	var recipe = AssemblyRecipe.create(function(container) {
		for item in outputItems {
			container.addItemOutput("output", item);
		}
	});
	for item in inputItems {
		recipe = recipe.requireItem("input", item);
	}
	if(!isNull(inputFluid))
		recipe = recipe.requireFluid("input", inputFluid);
	
	congeal_chamber.addRecipe(recipe);
	congeal_chamber.addJEIRecipe(recipe);	
}
function randomCCRecipe(inputItems as IIngredient[], inputFluid as ILiquidStack, outputItems as WeightedItemStack[]){
	var recipe = AssemblyRecipe.create(function(container) {
		for item in outputItems {
			if(container.jei)
				container.addItemOutput("output", item.stack.withLore(["§d§l" ~ item.percent ~ "%"]));
			else if(container.random.nextDouble() < item.chance)
				container.addItemOutput("output", item.stack);
		}
	});
	for item in inputItems {
		recipe = recipe.requireItem("input", item);
	}
	if(!isNull(inputFluid))
		recipe = recipe.requireFluid("input", inputFluid);
	
	congeal_chamber.addRecipe(recipe);
	congeal_chamber.addJEIRecipe(recipe);
}

basicCCRecipe([<contenttweaker:blast_gel> * 16], null, [<contenttweaker:blast_gel_block>]);
