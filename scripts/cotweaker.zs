#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Fluid;
import mods.contenttweaker.Color;
import mods.contenttweaker.Item;
import mods.contenttweaker.IItemRightClick;
import mods.contenttweaker.Commands;

function makeMachineHull(name as string){
	VanillaFactory.createBlock(name, <blockmaterial:iron>)
	.setBlockHardness(5.0)
	.setBlockResistance(5.0)
	.register();
}

val normalItemList as string[] = [
	"sulfur", "ingot_bronze", "nugget_bronze", "blast_gel", "fuse", "dynamite", "dynamite_bundle",
	"redstone_circuit", "radioactive_glass", "fuel_piece", "fuel_star", "fuel_lattice", "sulfuel",
	"sulfuel_empowered", "sulfuel_hp", "sulfuel_nuclear", "energy_star", "acid_star", "nightmare",
	"dark_matter"
];

for item in normalItemList{
	VanillaFactory.createItem(item).register();
}

var solid_fuel = VanillaFactory.createBlock("solid_fuel", <blockmaterial:rock>);
solid_fuel.setBlockHardness(5.0);
solid_fuel.setBlockResistance(5.0);
solid_fuel.setToolClass("pickaxe");
solid_fuel.setToolLevel(0);
solid_fuel.register();

var white_fuel = VanillaFactory.createBlock("white_fuel", <blockmaterial:rock>);
white_fuel.setBlockHardness(5.0);
white_fuel.setBlockResistance(5.0);
white_fuel.setToolClass("pickaxe");
white_fuel.setToolLevel(0);
white_fuel.register();

var block_bronze = VanillaFactory.createBlock("block_bronze", <blockmaterial:iron>);
block_bronze.setBlockHardness(5.0);
block_bronze.setBlockResistance(5.0);
block_bronze.setToolClass("pickaxe");
block_bronze.setToolLevel(0);
block_bronze.register();

var blast_gel_block = VanillaFactory.createBlock("blast_gel_block", <blockmaterial:rock>);
blast_gel_block.setBlockHardness(5.0);
blast_gel_block.register();

var blast_gel_processed = VanillaFactory.createBlock("blast_gel_processed", <blockmaterial:rock>);
blast_gel_processed.setBlockHardness(5.0);
blast_gel_processed.register();

val caseList as sting[] = [
	"karmesine",
	"ovium",
	"jauxum",
	"terrax",
	"aurorium",
	"astrium",
	"palladium",
	"seismum",
	"fractum",
	"uru",
	"vibranium"
];

for case in caseList {
	makeMachineHull("case_" ~ case);
}

var fuel = VanillaFactory.createFluid("fuel", Color.fromHex("ffd700"));
fuel.register();
var gas = VanillaFactory.createFluid("gas", Color.fromHex("fff0f5"));
gas.gaseous = true;
gas.register();

var dragon_breath = VanillaFactory.createFluid("dragon_breath", Color.fromHex("ffb5f8"));
dragon_breath.gaseous = true;
dragon_breath.colorize = false;
dragon_breath.stillLocation = "contenttweaker:blocks/dragon_breath_still";
dragon_breath.flowingLocation = "contenttweaker:blocks/dragon_breath_flowing";
dragon_breath.register();







