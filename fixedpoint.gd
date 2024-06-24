class_name GDFixedPoint
extends Object

const SHIFT_AMMOUNT = 8
const FIXEDPOINTONE = 1<<SHIFT_AMMOUNT

func _init():
	push_error("this object isn't supossed to be created, so don't")
	assert(false,"this object isn't supossed to be created, so don't")
	free()
	
static func create_fixed_from_int(integer:int):
	return integer << SHIFT_AMMOUNT

static func create_fixed_from_float(floating: float) -> int:
	return int(floating * FIXEDPOINTONE)
	
static func fixed_floor(fixed:int):
	return fixed & ~0xff

static func fixed_ceil(fixed:int):
	var integer_part: int = fixed >> SHIFT_AMMOUNT
	var fractional_part: int = fixed & ((1 << SHIFT_AMMOUNT) - 1) 
	if fractional_part > 0:integer_part += 1
	return (integer_part << SHIFT_AMMOUNT)

static func fixed_round(fixed:int):
	var integer_part: int = fixed >> SHIFT_AMMOUNT
	var fractional_part: int = fixed & ((1 << SHIFT_AMMOUNT) - 1)
	var round_value: int = fractional_part >> (SHIFT_AMMOUNT - 1)
	integer_part += round_value
	return (integer_part << SHIFT_AMMOUNT)

static func fixed_to_int(fixed:int):
	return fixed >> SHIFT_AMMOUNT
	
static func fixed_to_float(fixed: int) -> float:
	return float(fixed) / FIXEDPOINTONE

static func fixedvec2_to_floatvec2(fixed: Vector2i) -> Vector2:
	return Vector2( fixed_to_float(fixed.x),fixed_to_float(fixed.y) )

static func division(fixed:int,divider:int):
	fixed <<= SHIFT_AMMOUNT
	var result :int= fixed / divider
	return result
	
static func mult(fixed:int,mult:int):
	return (fixed * mult) >> SHIFT_AMMOUNT

static func create_fixed_from_ints(full:int,decimal:int):
	return full << SHIFT_AMMOUNT | decimal
