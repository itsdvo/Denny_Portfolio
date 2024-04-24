-- Code is created for Microsoft SQL Server Management Studio
-- Had to use 'INT' instead of NUMBER
-- Run code after each 

CREATE DATABASE IS_680_PROJECT_FINAL;

USE IS_680_PROJECT_FINAL;

CREATE TABLE Character
	(Character_ID VARCHAR(10) NOT NULL,
	Character_Name VARCHAR(25) NOT NULL,
	Character_Level	INT	NOT NULL,
	Character_Class	VARCHAR(15)	NOT NULL,
	CONSTRAINT Character_PK PRIMARY KEY (Character_ID)
	);

CREATE TABLE Bag_Inventory
	(Bag_ID VARCHAR(10) NOT NULL,
    Character_ID VARCHAR(10) NOT NULL,
    CONSTRAINT Bag_Inventory_PK PRIMARY KEY (Bag_ID),
    CONSTRAINT Bag_Inventory_FK FOREIGN KEY (Character_ID) REFERENCES Character(Character_ID)
	);

CREATE TABLE Item_Category
	(Category_ID VARCHAR(15) NOT NULL,
	Category_Name VARCHAR(15) NOT NULL,
	Category_Description VARCHAR(50) NOT NULL,
	CONSTRAINT Item_Category_PK PRIMARY KEY (Category_ID)
	);

CREATE TABLE Equipped_Item
	(Character_ID VARCHAR(10) NOT NULL,
	Item_ID INT	NOT NULL,
	Equipped_Slot VARCHAR(15) NOT NULL,
	CONSTRAINT Equipped_Item_PK PRIMARY KEY	(Character_ID, Item_ID)
	);

CREATE TABLE Contain
	(Bag_ID	VARCHAR(10)	NOT NULL,
	Item_ID INT	NOT NULL,
	Bag_Slot INT NOT NULL,
	CONSTRAINT Contain_PK PRIMARY KEY (Bag_ID, Item_ID)
	);

CREATE TABLE Item
	(Item_ID INT NOT NULL,
	Item_Name VARCHAR(50) NOT NULL,
	Item_Type VARCHAR(15) NOT NULL,
	Item_Description VARCHAR(255) NOT NULL,
	Item_Rarity VARCHAR(15)	NOT NULL,
	Bag_ID VARCHAR(10),
	Category_ID	VARCHAR(15)	NOT NULL,
	CONSTRAINT Item_PK PRIMARY KEY	(Item_ID),
	CONSTRAINT Item_FK FOREIGN KEY	(Category_ID) REFERENCES Item_Category(Category_ID)
	);

INSERT INTO Character (Character_ID, Character_Name, Character_Level, Character_Class)
VALUES
('WAR4266', 'ITS_DVO', 100, 'Warrior'),
('ARC6692', 'ellie.tlou', 93, 'Archer'),
('MAG3017', 'michaelherrera_23', 85, 'Mage'),
('THI8311', 'Anner', 84, 'Thief'),
('WAR3206', 'LongBeachBeast', 82, 'Warrior'),
('CLE1389', 'Luni', 65, 'Cleric'),
('ARC7945', 'bilboswaggins', 75, 'Archer'),
('THI7588', 'multigrainflakes', 69, 'Thief'),
('WAR9013', 'MSIS_Enjoyer', 41, 'Warrior'),
('ARC4559', 'Sung_You', 70, 'Archer'),
('MAG3274', 'Pattiz', 56, 'Mage'),
('MAG6764', 'Gold_Fisher', 43, 'Mage'),
('CLE5373', 'sunnyr', 90, 'Cleric');

INSERT INTO Bag_Inventory (Bag_ID, Character_ID)
VALUES
('BG4266', 'WAR4266'),
('BG6692', 'ARC6692'),
('BG3017', 'MAG3017'),
('BG8311', 'THI8311'),
('BG3206', 'WAR3206'),
('BG1389', 'CLE1389'),
('BG7945', 'ARC7945'),
('BG7588', 'THI7588'),
('BG9013', 'WAR9013'),
('BG4559', 'ARC4559'),
('BG3274', 'MAG3274'),
('BG6764', 'MAG6764'),
('BG5373', 'CLE5373');

INSERT INTO Contain (Bag_ID, Item_ID, Bag_Slot)
VALUES
('BG1389', 743304311, 1),
('BG1389', 782411079, 2),
('BG1389', 301331006, 3),
('BG3017', 642780914, 1),
('BG3017', 164468922, 2),
('BG3017', 365521109, 3),
('BG3206', 211507570, 1),
('BG3206', 198311008, 2),
('BG3206', 234439450, 3),
('BG3274', 361785634, 1),
('BG4266', 145062783, 1),
('BG4266', 392625285, 2),
('BG4266', 261808392, 3),
('BG4266', 765419336, 4),
('BG4559', 578041354, 1),
('BG4559', 669370201, 2),
('BG6692', 588641779, 1),
('BG6692', 636928020, 2),
('BG6764', 397571381, 1),
('BG6764', 989601320, 2),
('BG7588', 277562489, 1),
('BG7588', 471355090, 2),
('BG7588', 365545924, 3),
('BG7945', 546200502, 1),
('BG8311', 110965594, 1),
('BG8311', 973459357, 2),
('BG9013', 185619225, 1);

INSERT INTO Equipped_Item (Character_ID, Item_ID, Equipped_Slot)
VALUES
('WAR4266', 691119845, 'Main-hand'),
('WAR4266', 797699098, 'Helmet'),
('WAR4266', 125005170, 'Body'),
('WAR4266', 957437782, 'Gloves'),
('WAR4266', 292639618, 'Boots'),
('WAR4266', 350555091, 'Amulet'),
('WAR4266', 603054106, 'Ring 1'),
('WAR4266', 784547354, 'Ring 2'),
('ARC6692', 630123925, 'Main-hand'),
('ARC6692', 866991807, 'Helmet'),
('ARC6692', 798573705, 'Body'),
('ARC6692', 290629040, 'Gloves'),
('ARC6692', 245754215, 'Boots'),
('ARC6692', 117535102, 'Amulet'),
('ARC6692', 335256898, 'Ring 1'),
('ARC6692', 807827244, 'Ring 2'),
('MAG3017', 855553133, 'Main-hand'),
('MAG3017', 764206880, 'Helmet'),
('MAG3017', 167330431, 'Body'),
('MAG3017', 841912875, 'Gloves'),
('MAG3017', 415798097, 'Boots'),
('MAG3017', 802245368, 'Amulet'),
('MAG3017', 839782319, 'Ring 1'),
('MAG3017', 848573945, 'Ring 2'),
('THI8311', 870743922, 'Main-hand'),
('THI8311', 729185466, 'Helmet'),
('THI8311', 533188657, 'Body'),
('THI8311', 130100081, 'Gloves'),
('THI8311', 557736028, 'Boots'),
('THI8311', 434513908, 'Amulet'),
('THI8311', 764111600, 'Ring 1'),
('THI8311', 154023384, 'Ring 2'),
('WAR3206', 771859141, 'Main-hand'),
('WAR3206', 301486174, 'Helmet'),
('WAR3206', 101888530, 'Body'),
('WAR3206', 419811032, 'Gloves'),
('WAR3206', 967034411, 'Boots'),
('WAR3206', 161113904, 'Amulet'),
('WAR3206', 220640897, 'Ring 1'),
('WAR3206', 703096852, 'Ring 2'),
('CLE1389', 981950788, 'Main-hand'),
('CLE1389', 252410086, 'Helmet'),
('CLE1389', 826996162, 'Body'),
('CLE1389', 870384634, 'Gloves'),
('CLE1389', 320347325, 'Boots'),
('CLE1389', 587290020, 'Amulet'),
('CLE1389', 549936490, 'Ring 1'),
('CLE1389', 969689735, 'Ring 2'),
('ARC7945', 929451287, 'Main-hand'),
('ARC7945', 697409392, 'Helmet'),
('ARC7945', 580330663, 'Body'),
('ARC7945', 590478585, 'Gloves'),
('ARC7945', 679694434, 'Boots'),
('ARC7945', 395829095, 'Amulet'),
('ARC7945', 421389858, 'Ring 1'),
('ARC7945', 817544376, 'Ring 2'),
('THI7588', 587486395, 'Main-hand'),
('THI7588', 380968484, 'Helmet'),
('THI7588', 411042933, 'Body'),
('THI7588', 227237836, 'Gloves'),
('THI7588', 534953520, 'Boots'),
('THI7588', 991261273, 'Amulet'),
('THI7588', 480141177, 'Ring 1'),
('THI7588', 207743135, 'Ring 2'),
('WAR9013', 379829421, 'Main-hand'),
('WAR9013', 354418684, 'Helmet'),
('WAR9013', 257151715, 'Body'),
('WAR9013', 732775586, 'Gloves'),
('WAR9013', 716635034, 'Boots'),
('WAR9013', 440436614, 'Amulet'),
('WAR9013', 660338300, 'Ring 1'),
('WAR9013', 652747701, 'Ring 2'),
('ARC4559', 517389874, 'Main-hand'),
('ARC4559', 416028029, 'Helmet'),
('ARC4559', 127775913, 'Body'),
('ARC4559', 158606242, 'Gloves'),
('ARC4559', 444659083, 'Boots'),
('ARC4559', 332864629, 'Amulet'),
('ARC4559', 356727985, 'Ring 1'),
('ARC4559', 106436012, 'Ring 2'),
('MAG3274', 657391194, 'Main-hand'),
('MAG3274', 151941498, 'Helmet'),
('MAG3274', 314133650, 'Body'),
('MAG3274', 910847245, 'Gloves'),
('MAG3274', 622840651, 'Boots'),
('MAG3274', 107058528, 'Amulet'),
('MAG3274', 173681442, 'Ring 1'),
('MAG3274', 566207653, 'Ring 2'),
('MAG6764', 249513226, 'Main-hand'),
('MAG6764', 490790278, 'Helmet'),
('MAG6764', 968646450, 'Body'),
('MAG6764', 484881732, 'Gloves'),
('MAG6764', 978597118, 'Boots'),
('MAG6764', 932932849, 'Amulet'),
('MAG6764', 344508159, 'Ring 1'),
('MAG6764', 451970727, 'Ring 2'),
('CLE5373', 827184373, 'Main-hand'),
('CLE5373', 350332392, 'Helmet'),
('CLE5373', 301786485, 'Body'),
('CLE5373', 614172111, 'Gloves'),
('CLE5373', 220898633, 'Boots'),
('CLE5373', 482784354, 'Amulet'),
('CLE5373', 211320969, 'Ring 1'),
('CLE5373', 478198660, 'Ring 2');

INSERT INTO Item_Category (Category_ID, Category_Name, Category_Description)
VALUES
('MH101', 'Main-hand', 'Item to be weilded by hand for damage'),
('HLM101', 'Helmet', 'Item to be worn on head'),
('BOD101', 'Body', 'Item to be worn on body'),
('GLO101', 'Gloves', 'Item to be worn on hands'),
('BOO101', 'Boots', 'Item to be worn on feet'),
('AMU101', 'Amulet', 'Item to be worn around neck'),
('RIN101', 'Ring', 'Item to be worn on fingers');

INSERT INTO Item (Item_ID, Item_Name, Item_Type, Item_Description, Item_Rarity, Bag_ID, Category_ID)
VALUES
('743304311', 'Amulet of Shadows', 'Amulet', 'Grants invisibility in dire situations', 'Legendary', 'BG1389', 'AMU101'),
('782411079', 'Pendant of Heart', 'Amulet', 'Sustains life force and wards off disease', 'Uncommon', 'BG1389', 'AMU101'),
('301331006', 'Warhammer of Dawn', 'Main-hand', 'Smashes foes with the light of the sunrise', 'Legendary', 'BG1389', 'MH101'),
('642780914', 'Flamebrand Sword', 'Main-hand', 'Engulfs enemies in fire with each swing', 'Legendary', 'BG3017', 'MH101'),
('164468922', 'Band of Elements', 'Ring', 'Controls elemental forces', 'Uncommon', 'BG3017', 'RIN101'),
('365521109', 'Circle of Wisdom', 'Ring', 'Grants insight and clarity', 'Uncommon', 'BG3017', 'RIN101'),
('211507570', 'Talisman of Truth', 'Amulet', 'Reveals illusions and hidden secrets', 'Uncommon', 'BG3206', 'AMU101'),
('198311008', 'Scale Armor', 'Body', 'Lightweight yet durable scales for protection', 'Normal', 'BG3206', 'BOD101'),
('234439450', 'Helm of the Lion', 'Helmet', 'Emboldens the heart of its wearer', 'Rare', 'BG3206', 'HLM101'),
('361785634', 'Reaper''s Scythe', 'Main-hand', 'Reaps souls of the fallen', 'Legendary', 'BG3274', 'MH101'),
('145062783', 'Sigil of Eternity', 'Amulet', 'Timeless artifact holding ancient power', 'Rare', 'BG4266', 'AMU101'),
('392625285', 'Gauntlets of Might', 'Gloves', 'Imbued with strength-enhancing magic', 'Normal', 'BG4266', 'GLO101'),
('261808392', 'Guardian Helm', 'Helmet', 'Protective gear forged by master smiths', 'Uncommon', 'BG4266', 'HLM101'),
('765419336', 'Mystic Staff', 'Main-hand', 'Channeler of arcane forces', 'Legendary', 'BG4266', 'MH101'),
('578041354', 'Chainmail Hauberk', 'Body', 'Interlocked rings resist piercing attacks', 'Uncommon', 'BG4559', 'BOD101'),
('669370201', 'Seer''s Signet', 'Ring', 'Enhances magical sight and prediction', 'Rare', 'BG4559', 'RIN101'),
('588641779', 'Sentinel''s Visage', 'Helmet', 'Offers keen sight and sturdy protection', 'Rare', 'BG6692', 'HLM101'),
('636928020', 'Ring of Vitality', 'Ring', 'Restores health over time', 'Rare', 'BG6692', 'RIN101'),
('397571381', 'Platemail of the Fortress', 'Body', 'Impenetrable defense against attacks', 'Legendary', 'BG6764', 'BOD101'),
('989601320', 'Doombringer Axe', 'Main-hand', 'Cleaves foes with dark energy', 'Legendary', 'BG6764', 'MH101'),
('277562489', 'Charm of the Phoenix', 'Amulet', 'Resurrects the bearer from fatal blows', 'Legendary', 'BG7588', 'AMU101'),
('471355090', 'Helm of the Depths', 'Helmet', 'Allows breathing underwater', 'Rare', 'BG7588', 'HLM101'),
('365545924', 'Blade of Echoes', 'Main-hand', 'Strikes resonate with shockwaves', 'Legendary', 'BG7588', 'MH101'),
('546200502', 'Swiftstrike Boots', 'Boots', 'Increases movement speed significantly', 'Uncommon', 'BG7945', 'BOO101'),
('110965594', 'Breastplate of Valor', 'Body', 'Awards courage in the face of danger', 'Rare', 'BG8311', 'BOD101'),
('973459357', 'Crested Helm', 'Helmet', 'Majestic helm that inspires troops', 'Rare', 'BG8311', 'HLM101'),
('185619225', 'Windwalkers', 'Boots', 'Makes no sound while moving', 'Normal', 'BG9013', 'BOO101'),
('691119845', 'Exaclibur', 'Main-hand', 'A wide-bladed sword for sweeping strikes', 'Legendary', '', 'MH101'),
('797699098', 'Awakened Helm', 'Helmet', 'A sturdy helm to withstand heavy blows', 'Legendary', '', 'HLM101'),
('125005170', 'Bulwark Chainmail', 'Body', 'Interlocked rings provide balanced protection', 'Legendary', '', 'BOD101'),
('957437782', 'Giant''s Gauntlet', 'Gloves', 'Reinforced to parry attacks and handle swords', 'Uncommon', '', 'GLO101'),
('292639618', 'Sabatons', 'Boots', 'Steel-toed for frontline combat', 'Uncommon', '', 'BOO101'),
('350555091', 'Crest of Valor', 'Amulet', 'Inscribed with motifs of ancient battles', 'Legendary', '', 'AMU101'),
('603054106', 'Band of Bravery', 'Ring', 'Engraved with runes to inspire courage', 'Common', '', 'RIN101'),
('784547354', 'Seal of the Warlord', 'Ring', 'Bears the mark of legendary leaders', 'Rare', '', 'RIN101'),
('630123925', 'Longbow', 'Main-hand', 'A finely crafted bow for long-range attacks', 'Rare', '', 'MH101'),
('866991807', 'Leather Hood', 'Helmet', 'Soft and durable - offers heightened senses', 'Common', '', 'HLM101'),
('798573705', 'Wind Walker Tunic', 'Body', 'Lightweight leather for ease of movement', 'Legendary', '', 'BOD101'),
('290629040', 'Grip Gloves', 'Gloves', 'Ensures a better grip on bowstrings', 'Rare', '', 'GLO101'),
('245754215', 'Softstep Boots', 'Boots', 'Designed for silent movement', 'Uncommon', '', 'BOO101'),
('117535102', 'Eagle Eye Amulet', 'Amulet', 'Sharpens sight for accuracy at a distance', 'Uncommon', '', 'AMU101'),
('335256898', 'Ring of Precision', 'Ring', 'Improves the wearer''s marksmanship', 'Common', '', 'RIN101'),
('807827244', 'Band of Fletching', 'Ring', 'Enhances arrow flight and speed', 'Rare', '', 'RIN101'),
('855553133', 'Spellblade', 'Main-hand', 'A blade that resonates with magical energy', 'Legendary', '', 'MH101'),
('764206880', 'Mystic Cowl', 'Helmet', 'Enchanted cowl that protects the mind', 'Rare', '', 'HLM101'),
('167330431', 'Robe of the Arcanist', 'Body', 'Robe that amplifies spellcasting power', 'Uncommon', '', 'BOD101'),
('841912875', 'Runed Bracers', 'Gloves', 'Wristwear etched with potent runes', 'Legendary', '', 'GLO101'),
('415798097', 'Traveler''s Shoes', 'Boots', 'Infused with magic to hasten movement', 'Rare', '', 'BOO101'),
('802245368', 'Pendant of Mana', 'Amulet', 'Stores magical energy for prolonged battles', 'Uncommon', '', 'AMU101'),
('839782319', 'Ring of Sorcery', 'Ring', 'Augments magical damage and control', 'Uncommon', '', 'RIN101'),
('848573945', 'Sigil of the Magus', 'Ring', 'Protects against hostile spells and curses', 'Common', '', 'RIN101'),
('870743922', 'Shadow Blade', 'Main-hand', 'A dagger that melds with the darkness', 'Rare', '', 'MH101'),
('729185466', 'Night''s Veil', 'Helmet', 'A hood that blends with the shadows', 'Rare', '', 'HLM101'),
('533188657', 'Silent Mantle', 'Body', 'Cloak that muffles sound and conceals presence', 'Uncommon', '', 'BOD101'),
('130100081', 'Lockpick Gloves', 'Gloves', 'Specialized gloves with lockpick tools', 'Common', '', 'GLO101'),
('557736028', 'Ghost Step Boots', 'Boots', 'Boots that leave no tracks', 'Common', '', 'BOO101'),
('434513908', 'Locket of Deceit', 'Amulet', 'Enables the wearer to lie without consequence', 'Rare', '', 'AMU101'),
('764111600', 'Ring of Nimbleness', 'Ring', 'Enhances agility and dexterity', 'Rare', '', 'RIN101'),
('154023384', 'Band of Shadows', 'Ring', 'Grants brief moments of invisibility', 'Uncommon', '', 'RIN101'),
('771859141', 'War Maul', 'Main-hand', 'A heavy maul capable of crushing armor', 'Uncommon', '', 'MH101'),
('301486174', 'Guardian Helm', 'Helmet', 'Offers protection and intimidation on the battlefield', 'Uncommon', '', 'HLM101'),
('101888530', 'Battle Harness', 'Body', 'Sturdy leather harness designed to deflect blows', 'Common', '', 'BOD101'),
('419811032', 'Grip of Might', 'Gloves', 'Grants additional strength for wielding heavy weapons', 'Rare', '', 'GLO101'),
('967034411', 'Warlord''s Greaves', 'Boots', 'Provides stability and protection for charges', 'Uncommon', '', 'BOO101'),
('161113904', 'Talisman of Fortitude', 'Amulet', 'Grants the bearer increased resilience in combat', 'Common', '', 'AMU101'),
('220640897', 'Ring of Endurance', 'Ring', 'Improves stamina for prolonged fights', 'Rare', '', 'RIN101'),
('703096852', 'Circlet of the Victor', 'Ring', 'Said to bring victory to its wearer', 'Legendary', '', 'RIN101'),
('981950788', 'Divine Scepter', 'Main-hand', 'Channels divine energy for healing and smiting', 'Legendary', '', 'MH101'),
('252410086', 'Sanctified Helm', 'Helmet', 'Infused with blessings for protection', 'Legendary', '', 'HLM101'),
('826996162', 'Robe of Benediction', 'Body', 'A robe that wards off evil and injury', 'Common', '', 'BOD101'),
('870384634', 'Bracers of Mercy', 'Gloves', 'Imbued with power to soothe wounds', 'Legendary', '', 'GLO101'),
('320347325', 'Pilgrim''s Steps', 'Boots', 'For the long journey of the faithful', 'Legendary', '', 'BOO101'),
('587290020', 'Necklace of Sanctity', 'Amulet', 'A holy symbol that repels corruption', 'Uncommon', '', 'AMU101'),
('549936490', 'Ring of the Divine', 'Ring', 'Grants clarity and vision to the wearer', 'Rare', '', 'RIN101'),
('969689735', 'Signet of Hope', 'Ring', 'Reassures allies and dismays foes', 'Rare', '', 'RIN101'),
('929451287', 'Recurve Bow', 'Main-hand', 'Designed for swift and silent shots', 'Uncommon', '', 'MH101'),
('697409392', 'Scout''s Cap', 'Helmet', 'Lightweight headgear for enhanced awareness', 'Uncommon', '', 'HLM101'),
('580330663', 'Tracker''s Vest', 'Body', 'Tailored for mobility in the wild', 'Uncommon', '', 'BOD101'),
('590478585', 'Fletcher''s Mitts', 'Gloves', 'Allows for a steady draw and quick release', 'Rare', '', 'GLO101'),
('679694434', 'Pathfinder''s Boots', 'Boots', 'Perfect for silent traversal of rough terrain', 'Uncommon', '', 'BOO101'),
('395829095', 'Amulet of the Wild', 'Amulet', 'Keeps the wearer attuned to nature', 'Common', '', 'AMU101'),
('421389858', 'Ring of Accuracy', 'Ring', 'Promises precision with every shot', 'Common', '', 'RIN101'),
('817544376', 'Band of the Hunter', 'Ring', 'Aids in tracking and targeting prey', 'Common', '', 'RIN101'),
('587486395', 'Stiletto', 'Main-hand', 'A slender blade for precise strikes', 'Rare', '', 'MH101'),
('380968484', 'Shadow Cloak', 'Helmet', 'A cloak that obscures the wearer''s presence', 'Rare', '', 'HLM101'),
('411042933', 'Silk Garb', 'Body', 'Light and silent - perfect for moving unnoticed', 'Rare', '', 'BOD101'),
('227237836', 'Sleight Gloves', 'Gloves', 'Ideal for pickpocketing and lockpicking', 'Rare', '', 'GLO101'),
('534953520', 'Whisper Boots', 'Boots', 'Muffles footsteps for silent movement', 'Uncommon', '', 'BOO101'),
('991261273', 'Charm of the Rogue', 'Amulet', 'Enhances agility and guile', 'Rare', '', 'AMU101'),
('480141177', 'Ring of Evasion', 'Ring', 'Increases the wearer''s ability to dodge', 'Uncommon', '', 'RIN101'),
('207743135', 'Band of Stealth', 'Ring', 'Provides brief moments of invisibility', 'Rare', '', 'RIN101'),
('379829421', 'Battle Axe', 'Main-hand', 'A hefty axe designed for powerful swings', 'Rare', '', 'MH101'),
('354418684', 'Fortress Helm', 'Helmet', 'Engineered for maximum head protection', 'Uncommon', '', 'HLM101'),
('257151715', 'Plate Mail', 'Body', 'Heavy armor that offers superior defense', 'Rare', '', 'BOD101'),
('732775586', 'Warrior''s Gauntlets', 'Gloves', 'Studded gloves for a firm grip and protection', 'Common', '', 'GLO101'),
('716635034', 'Marching Boots', 'Boots', 'Built for long marches and steady footing', 'Common', '', 'BOO101'),
('440436614', 'Medallion of Courage', 'Amulet', 'Symbolizes bravery and resilience', 'Common', '', 'AMU101'),
('660338300', 'Ring of Fortitude', 'Ring', 'Enhances physical strength and endurance', 'Common', '', 'RIN101'),
('652747701', 'Signet of Valor', 'Ring', 'Recognizes acts of heroism and valor', 'Uncommon', '', 'RIN101'),
('517389874', 'Crossbow', 'Main-hand', 'A powerful crossbow for precise and deadly shots', 'Common', '', 'MH101'),
('416028029', 'Ranger''s Hood', 'Helmet', 'A lightweight hood for enhanced perception', 'Uncommon', '', 'HLM101'),
('127775913', 'Forest Cloak', 'Body', 'A camouflaged cloak for blending with nature', 'Uncommon', '', 'BOD101'),
('158606242', 'Swift Gloves', 'Gloves', 'Designed for quick and agile movements', 'Uncommon', '', 'GLO101'),
('444659083', 'Trailblazer Boots', 'Boots', 'Optimized for speed and stealth in the wilderness', 'Legendary', '', 'BOO101'),
('332864629', 'Pendant of Precision', 'Amulet', 'Sharpens focus for unerring accuracy', 'Common', '', 'AMU101'),
('356727985', 'Ring of Dexterity', 'Ring', 'Boosts agility and reflexes', 'Legendary', '', 'RIN101'),
('106436012', 'Quiver Band', 'Ring', 'Increases arrow capacity and reload speed', 'Rare', '', 'RIN101'),
('657391194', 'Wand of Wisdom', 'Main-hand', 'A wand imbued with ancient knowledge', 'Legendary', '', 'MH101'),
('151941498', 'Sorcerer''s Hat', 'Helmet', 'A hat that channels mystical energies', 'Common', '', 'HLM101'),
('314133650', 'Elemental Robe', 'Body', 'A robe attuned to the forces of nature', 'Common', '', 'BOD101'),
('910847245', 'Arcane Gloves', 'Gloves', 'Enhances spellcasting precision and power', 'Common', '', 'GLO101'),
('622840651', 'Mystic Sandals', 'Boots', 'Infused with magic for light-footedness', 'Rare', '', 'BOO101'),
('107058528', 'Crystal Amulet', 'Amulet', 'Focuses magical energy for potent spells', 'Uncommon', '', 'AMU101'),
('173681442', 'Ring of Power', 'Ring', 'Amplifies the wearer''s magical strength', 'Rare', '', 'RIN101'),
('566207653', 'Tome Ring', 'Ring', 'Holds the secrets of forgotten spells', 'Uncommon', '', 'RIN101'),
('249513226', 'Staff of the Ancients', 'Main-hand', 'A staff that channels timeless energies', 'Rare', '', 'MH101'),
('490790278', 'Enchanter''s Cap', 'Helmet', 'Focuses the mind for complex spells', 'Rare', '', 'HLM101'),
('968646450', 'Mantle of the Magi', 'Body', 'Adorned with runes to enhance magic', 'Rare', '', 'BOD101'),
('484881732', 'Spellbound Gloves', 'Gloves', 'Woven with threads of pure mana', 'Rare', '', 'GLO101'),
('978597118', 'Boots of Levitation', 'Boots', 'Allows for brief moments of flight', 'Uncommon', '', 'BOO101'),
('932932849', 'Orb of Insight', 'Amulet', 'Reveals hidden truths and augments spells', 'Rare', '', 'AMU101'),
('344508159', 'Ring of the Arcanum', 'Ring', 'Contains powerful magical sigils', 'Rare', '', 'RIN101'),
('451970727', 'Scroll Ring', 'Ring', 'Stores additional spells for quick casting', 'Common', '', 'RIN101'),
('827184373', 'Scepter of Light', 'Main-hand', 'A scepter that radiates healing light', 'Legendary', '', 'MH101'),
('350332392', 'Crown of Piety', 'Helmet', 'Symbolizes devotion and purity of spirit', 'Rare', '', 'HLM101'),
('301786485', 'Vestments of the Faithful', 'Body', 'Robes imbued with divine protection', 'Rare', '', 'BOD101'),
('614172111', 'Blessed Wraps', 'Gloves', 'Infused with healing energies', 'Uncommon', '', 'GLO101'),
('220898633', 'Sandals of Sanctuary', 'Boots', 'Grants peace and steadiness to the wearer', 'Normal', '', 'BOO101'),
('482784354', 'Relic of the Divine', 'Amulet', 'Holds sacred power for miracles', 'Legendary', '', 'AMU101'),
('211320969', 'Ring of Salvation', 'Ring', 'Offers protection and succor in times of need', 'Rare', '', 'RIN101'),
('478198660', 'Band of Benediction', 'Ring', 'Enhances blessings and wards off evil', 'Uncommon', '', 'RIN101');

--Check each table

SELECT
	*
FROM
	dbo.Bag_Inventory;

SELECT
	*
FROM
	dbo.Character;

SELECT
	*
FROM
	dbo.Contain;

SELECT
	*
FROM
	dbo.Equipped_Item;

SELECT
	*
FROM
	dbo.Item;

SELECT
	*
FROM
	dbo.Item_Category;

--Test Queries

--Query 1
--How many characters are in the database?
SELECT
	COUNT(*) As "Character Count"
FROM
	Character;

--Query 2
--What is the character level average?
SELECT
	AVG(Character_Level) AS Average
FROM
	Character;

--Query 3
--What are the characters that are below level average?
SELECT
	Character_Name AS Name,
	Character_Class AS Class,
	Character_Level AS Level
FROM
	Character
WHERE
	Character_Level <
	(SELECT
		AVG(Character_Level)
	FROM
		Character
	)

--Query 4
--What are the top 5 characters in the database in terms of level?
SELECT TOP 5
	Character_ID AS ID,
	Character_Name AS Name,
	Character_Class AS Class,
	Character_Level AS Level
FROM
	Character
ORDER BY
	Character_Level DESC;


--Query 5
--What items does Gold_Fisher have equipped?
SELECT
	t1.Character_Name AS Name,
	t1.Character_Level AS Level,
	t1.Character_Class AS Class,
	t3.Item_Name AS Item,
	t3.Item_Rarity AS Rarity,
	t2.Equipped_Slot AS Equipped
FROM
	Character t1
JOIN
	Equipped_Item t2
ON
	t1.Character_ID=t2.Character_ID
JOIN
	Item t3
ON
	t2.Item_ID=t3.Item_ID
WHERE
	t1.Character_Name = 'Gold_Fisher'
ORDER BY
	t2.Equipped_Slot;

--Query 6
--What about what Gold_Fisher has in his bag?
SELECT
	t1.Character_Name AS Name,
	t1.Character_Level AS Level,
	t1.Character_Class AS Class,
	t4.Item_Name AS Item,
	t4.Item_Rarity AS Rarity,
	t4.Item_Type AS Type,
	t3.Bag_Slot AS "Bag Slot"
FROM
	Character t1
JOIN
	Bag_Inventory t2
ON
	t1.Character_ID=t2.Character_ID
JOIN
	Contain t3
ON
	t2.Bag_ID=t3.Bag_ID
JOIN
	Item t4
ON
	t3.Item_ID=t4.Item_ID
WHERE
	t1.Character_Name = 'Gold_Fisher';

--Query 7
--What are the count of items grouped by rarity per type?
SELECT
	Item_Rarity AS Rarity,
	Item_Type AS Type,
	COUNT (*) AS Countz
FROM
	Item
GROUP BY
	Item_Rarity, Item_Type
ORDER BY
	Item_Rarity, Item_Type;

--Query 8
--Of items equipped for ellie.tlou which is her highest rarity item and whats the description with category?
WITH Equip_Item_Category AS
(
SELECT
	t1.Character_Name AS Name,
	t1.Character_Level AS Level,
	t1.Character_Class AS Class,
	t3.Item_Name AS Item,
	t4.Category_Name AS Category,
	t3.Item_Rarity AS Rarity,
	t3.Item_Description,
	t4.Category_Description
FROM
	Character t1
JOIN
	Equipped_Item t2
ON
	t1.Character_ID=t2.Character_ID
JOIN
	Item t3
ON
	t2.Item_ID=t3.Item_ID
JOIN
	Item_Category t4
ON
	t3.Category_ID = t4.Category_ID
)

SELECT
	*
FROM
	Equip_Item_Category
WHERE
	Name = 'ellie.tlou'
ORDER BY
	Category;
