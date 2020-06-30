import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;

var congeal_chamber = <assembly:congeal_chamber>;

var x = congeal_chamber.setItemSlot(1,2,mods.requious.ComponentFace.all(),64).setAccess(true,false).setGroup("input");
x = congeal_chamber.setFluidSlot(2,2,mods.requious.ComponentFace.back(),12000).setAccess(true,false).setGroup("input");
x = congeal_chamber.setItemSlot(6,1,mods.requious.ComponentFace.all(),64).setAccess(false,true).setHandAccess(false,true).setGroup("output");
x = congeal_chamber.setItemSlot(6,2,mods.requious.ComponentFace.all(),64).setAccess(false,true).setHandAccess(false,true).setGroup("output");
x = congeal_chamber.setItemSlot(6,3,mods.requious.ComponentFace.all(),64).setAccess(false,true).setHandAccess(false,true).setGroup("output");

congeal_chamber.setJEIItemSlot(2,0,"input");
congeal_chamber.setJEIFluidSlot(3,0,"input");
congeal_chamber.setJEIDurationSlot(4,0,"duration",mods.requious.SlotVisual.create(1,1).addPart("requious:textures/gui/assembly_gauges.png",0,8));
congeal_chamber.setJEIItemSlot(5,0,"output");
congeal_chamber.setJEIItemSlot(6,0,"output");
congeal_chamber.setJEIItemSlot(7,0,"output");

function add(inputItems as IIngredient[], inputFluid as ILiquidStack, outputItems as IItemStack[]){
	var congeal_chamber = <assembly:congeal_chamber>;
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
	
	congeal_chamber.addRecipe(recipe);
	congeal_chamber.addJEIRecipe(recipe);	
}
function addRandom(inputItems as IIngredient[], inputFluid as ILiquidStack, outputItems as WeightedItemStack[]){
	var congeal_chamber = <assembly:congeal_chamber>;
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
	
	congeal_chamber.addRecipe(recipe);
	congeal_chamber.addJEIRecipe(recipe);
}

add([<contenttweaker:blast_gel> * 16], null, [<contenttweaker:blast_gel_block>]);