-- 16/04/23 Change Elizabeth bonus trade routes from first admiral to one for Shipbuilding, Exploration and Mercantilism
DELETE FROM TraitModifiers WHERE ModifierId='ELIZABETH_TRADE_ROUTES_MODIFIER';
INSERT INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId) VALUES
    ('BBG_ELIZABETH_TRADEROUTE_SHIPBUILDING', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY', 'BBG_UTILS_PLAYER_HAS_TECH_SHIPBUILDING'),
    ('BBG_ELIZABETH_TRADEROUTE_EXPLORATION', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY', 'BBG_UTILS_PLAYER_HAS_CIVIC_EXPLORATION_REQSET'),
    ('BBG_ELIZABETH_TRADEROUTE_MERCANTILISM', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY', 'BBG_UTILS_PLAYER_HAS_CIVIC_MERCANTILISM_REQSET');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('BBG_ELIZABETH_TRADEROUTE_SHIPBUILDING', 'Amount', '1'),
    ('BBG_ELIZABETH_TRADEROUTE_EXPLORATION', 'Amount', '1'),
    ('BBG_ELIZABETH_TRADEROUTE_MERCANTILISM', 'Amount', '1');
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES
    ('TRAIT_LEADER_ELIZABETH', 'BBG_ELIZABETH_TRADEROUTE_SHIPBUILDING'),
    ('TRAIT_LEADER_ELIZABETH', 'BBG_ELIZABETH_TRADEROUTE_EXPLORATION'),
    ('TRAIT_LEADER_ELIZABETH', 'BBG_ELIZABETH_TRADEROUTE_MERCANTILISM');

-- 24/04/23 Raiders have 1 additional movement and sight
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
    ('BBG_ELIZABETH_RAIDER_MOVEMENT_BONUS_MODIFIER', 'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT', 'UNIT_IS_NAVAL_RAIDER'),
    ('BBG_ELIZABETH_RAIDER_MOVEMENT_BONUS_ATTACHER', 'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', NULL);
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES
    ('TRAIT_LEADER_ELIZABETH', 'BBG_ELIZABETH_RAIDER_MOVEMENT_BONUS_ATTACHER');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('BBG_ELIZABETH_RAIDER_MOVEMENT_BONUS_MODIFIER', 'Amount', '1'),
    ('BBG_ELIZABETH_RAIDER_MOVEMENT_BONUS_ATTACHER', 'ModifierId', 'BBG_ELIZABETH_RAIDER_MOVEMENT_BONUS_MODIFIER');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
    ('BBG_ELIZABETH_RAIDER_SIGHT_BONUS_MODIFIER', 'MODIFIER_PLAYER_UNIT_ADJUST_SIGHT', 'UNIT_IS_NAVAL_RAIDER'),
    ('BBG_ELIZABETH_RAIDER_SIGHT_BONUS_ATTACHER', 'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', NULL);
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES
    ('TRAIT_LEADER_ELIZABETH', 'BBG_ELIZABETH_RAIDER_SIGHT_BONUS_ATTACHER');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('BBG_ELIZABETH_RAIDER_SIGHT_BONUS_MODIFIER', 'Amount', '1'),
    ('BBG_ELIZABETH_RAIDER_SIGHT_BONUS_ATTACHER', 'ModifierId', 'BBG_ELIZABETH_RAIDER_SIGHT_BONUS_MODIFIER');

-- 04/07/24 Elizabeth raider can promote and move/attack
INSERT INTO Types (Type, Kind) VALUES
    ('BBG_ABILITY_ELISABETH_RAIDER_MOVE_PROMOTE_ATTACK', 'KIND_ABILITY');
INSERT INTO TypeTags (Type, Tag) VALUES
    ('BBG_ABILITY_ELISABETH_RAIDER_MOVE_PROMOTE_ATTACK', 'CLASS_NAVAL_RAIDER');
INSERT INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive) VALUES
    ('BBG_ABILITY_ELISABETH_RAIDER_MOVE_PROMOTE_ATTACK', 'LOC_BBG_ABILITY_ELISABETH_RAIDER_MOVE_PROMOTE_ATTACK_NAME', 'LOC_BBG_ABILITY_ELISABETH_RAIDER_MOVE_PROMOTE_ATTACK_DESC', 1);
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES
    ('BBG_ABILITY_ELISABETH_RAIDER_MOVE_PROMOTE_ATTACK', 'BBG_ABILITY_ELISABETH_RAIDER_MOVE_PROMOTE_ATTACK_MODIFIER');
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
    ('BBG_ABILITY_ELISABETH_RAIDER_MOVE_PROMOTE_ATTACK_GIVER', 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY'),
    ('BBG_ABILITY_ELISABETH_RAIDER_MOVE_PROMOTE_ATTACK_MODIFIER', 'MODIFIER_PLAYER_UNITS_PROMOTE_NO_FINISH_MOVES');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('BBG_ABILITY_ELISABETH_RAIDER_MOVE_PROMOTE_ATTACK_GIVER', 'AbilityType', 'BBG_ABILITY_ELISABETH_RAIDER_MOVE_PROMOTE_ATTACK'),
    ('BBG_ABILITY_ELISABETH_RAIDER_MOVE_PROMOTE_ATTACK_MODIFIER', 'NoFinishMoves', 1);
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES
    ('TRAIT_LEADER_ELIZABETH', 'BBG_ABILITY_ELISABETH_RAIDER_MOVE_PROMOTE_ATTACK_GIVER');

-- 04/07/24 Elizabeth traderoute to CS also get +1 prod per district
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
    ('BBG_ELIZABETH_TRADE_ROUTES_CITY_STATE_PROD', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_STATE_TRADE_ROUTE_DISTRICT_YIELD');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('BBG_ELIZABETH_TRADE_ROUTES_CITY_STATE_PROD', 'YieldType', 'YIELD_PRODUCTION'),
    ('BBG_ELIZABETH_TRADE_ROUTES_CITY_STATE_PROD', 'Amount', 1);
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES
    ('TRAIT_LEADER_ELIZABETH', 'BBG_ELIZABETH_TRADE_ROUTES_CITY_STATE_PROD');
