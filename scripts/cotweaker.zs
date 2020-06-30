#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Fluid;
import mods.contenttweaker.Color;
import mods.contenttweaker.Item;
import mods.contenttweaker.IItemRightClick;
import mods.contenttweaker.Commands;

function makeMachineHull(name as string){
	var hull = VanillaFactory.createBlock(name, <blockmaterial:iron>);
	hull.setBlockHardness(5.0);
	hull.setBlockResistance(5.0);
	hull.register();
}

var sulfur = VanillaFactory.createItem("sulfur");
sulfur.register();
var ingot_bronze = VanillaFactory.createItem("ingot_bronze");
ingot_bronze.register();
var nugget_bronze = VanillaFactory.createItem("nugget_bronze");
nugget_bronze.register();

var blast_gel = VanillaFactory.createItem("blast_gel");
blast_gel.register();
var fuse = VanillaFactory.createItem("fuse");
fuse.register();
var dynamite = VanillaFactory.createItem("dynamite");
dynamite.register();
var dynamite_bundle = VanillaFactory.createItem("dynamite_bundle");
dynamite_bundle.register();
var redstone_circuit = VanillaFactory.createItem("redstone_circuit");
redstone_circuit.register();
var radioactive_glass = VanillaFactory.createItem("radioactive_glass");
radioactive_glass.register();

var fuel_piece = VanillaFactory.createItem("fuel_piece");
fuel_piece.register();
var fuel_star = VanillaFactory.createItem("fuel_star");
fuel_star.register();
var fuel_lattice = VanillaFactory.createItem("fuel_lattice");
fuel_lattice.register();

var sulfuel = VanillaFactory.createItem("sulfuel");
sulfuel.register();
var sulfuel_empowered = VanillaFactory.createItem("sulfuel_empowered");
sulfuel_empowered.register();
var sulfuel_hp = VanillaFactory.createItem("sulfuel_hp");
sulfuel_hp.register();
var sulfuel_nuclear = VanillaFactory.createItem("sulfuel_nuclear");
sulfuel_nuclear.register();

var energy_star = VanillaFactory.createItem("energy_star");
energy_star.register();
var acid_star = VanillaFactory.createItem("acid_star");
acid_star.register();
var nightmare = VanillaFactory.createItem("nightmare");
nightmare.register();
var dark_matter = VanillaFactory.createItem("dark_matter");
dark_matter.register();

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

makeMachineHull("case_karmesine");
makeMachineHull("case_ovium");
makeMachineHull("case_jauxum");
makeMachineHull("case_terrax");
makeMachineHull("case_aurorium");
makeMachineHull("case_astrium");
makeMachineHull("case_palladium");

makeMachineHull("case_seismum");
makeMachineHull("case_fractum");
makeMachineHull("case_uru");
makeMachineHull("case_vibranium");

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







