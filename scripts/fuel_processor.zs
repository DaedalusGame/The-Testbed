import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.world.IVector3d;
import crafttweaker.world.IFacing;

import mods.requious.Color;
import mods.requious.SlotVisual;
import mods.requious.MachineVisual;
import mods.requious.ComponentFace;
import mods.requious.AssemblyRecipe;

static fuel_processor = <assembly:fuel_processor>;

fuel_processor.setItemSlot(1,1, ComponentFace.all(),64)
				.setAccess(true, false)
				.setGroup("input");
fuel_processor.setItemSlot(1,2, ComponentFace.all(),64)
				.setAccess(true, false)
				.setGroup("input");
fuel_processor.setItemSlot(1,3, ComponentFace.all(),64)
				.setAccess(true, false)
				.setGroup("input");
fuel_processor.setFluidSlot(2,1, ComponentFace.all(),12000)
				.setAccess(true, false)
				.setGroup("input");
fuel_processor.setFluidSlot(2,2, ComponentFace.all(),12000)
				.setAccess(true, false)
				.setGroup("input");
fuel_processor.setFluidSlot(2,3, ComponentFace.all(),12000)
				.setAccess(true, false)
				.setGroup("input");
fuel_processor.setItemSlot(6,1, ComponentFace.all(),64)
				.setAccess(false, true)
				.setHandAccess(false, true)
				.setGroup("output");
fuel_processor.setItemSlot(6,2, ComponentFace.all(),64)
				.setAccess(false, true)
				.setHandAccess(false, true)
				.setGroup("output");
fuel_processor.setItemSlot(6,3, ComponentFace.all(),64)
				.setAccess(false, true)
				.setHandAccess(false, true)
				.setGroup("output");

fuel_processor.setJEIItemSlot(0,0, "input");
fuel_processor.setJEIItemSlot(1,0, "input");
fuel_processor.setJEIItemSlot(2,0, "input");
fuel_processor.setJEIFluidSlot(0,1, "input");
fuel_processor.setJEIFluidSlot(1,1, "input");
fuel_processor.setJEIFluidSlot(2,1, "input");
fuel_processor.setJEIDurationSlot(3,0, "duration", SlotVisual.create(1, 1).addPart("requious:textures/gui/assembly_gauges.png", 0, 8));
fuel_processor.setJEIItemSlot(4,0, "output");
fuel_processor.setJEIItemSlot(5,0, "output");
fuel_processor.setJEIItemSlot(6,0, "output");

fuel_processor.addVisual(MachineVisual.smoke("active".asVariable(), 
							IVector3d.create(0,0.25,0.25),
							IVector3d.create(0,0.75,0.75),
							IVector3d.create(-0.1,0,0),
							Color.normal([255,255,255]), 30, false));
fuel_processor.addVisual(MachineVisual.smoke("active".asVariable(),
							IVector3d.create(1,0.25,0.25),
							IVector3d.create(1,0.75,0.75),
							IVector3d.create(0.1,0,0),
							Color.normal([255,255,255]), 30, false));
fuel_processor.addVisual(MachineVisual.smoke("active".asVariable(),
							IVector3d.create(0.25,0.25,0),
							IVector3d.create(0.75,0.75,0),
							IVector3d.create(0,0,-0.1),
							Color.normal([255,255,255]), 30, false));
fuel_processor.addVisual(MachineVisual.smoke("active".asVariable(),
							IVector3d.create(0.25,0.25,1),
							IVector3d.create(0.75,0.75,1),
							IVector3d.create(0,0,0.1),
							Color.normal([255,255,255]), 30, false));


function basicFuelRecipe(inputItems as IIngredient[], inputFluids as ILiquidStack[], outputItems as IItemStack[]){
	var recipe = AssemblyRecipe.create(function(container) {
		for item in outputItems {
			container.addItemOutput("output", item);
		}
	});
	for item in inputItems {
		recipe = recipe.requireItem("input", item);
	}
	for fluid in inputFluids {
		recipe = recipe.requireFluid("input", fluid);
	}
	fuel_processor.addRecipe(recipe);
	fuel_processor.addJEIRecipe(recipe);	
}

function randomFuelRecipe(inputItems as IIngredient[], inputFluids as ILiquidStack[], outputItems as WeightedItemStack[]){
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
	for fluid in inputFluids {
		recipe = recipe.requireFluid("input", fluid);
	}
	fuel_processor.addRecipe(recipe);
	fuel_processor.addJEIRecipe(recipe);
}


basicFuelRecipe([], [<liquid:fuel> * 500], [<contenttweaker:solid_fuel>]);
basicFuelRecipe([], [<liquid:gas> * 1000], [<contenttweaker:solid_fuel>]);







