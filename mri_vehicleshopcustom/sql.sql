CREATE TABLE IF NOT EXISTS `mvehicleshop_vehicles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `shop` VARCHAR(50) NOT NULL,
  `category` VARCHAR(50) NOT NULL,
  `model` VARCHAR(60) NOT NULL,
  `label` VARCHAR(80) NOT NULL,
  `price` INT NOT NULL DEFAULT 0,
  `stock` INT NOT NULL DEFAULT 0,
  `image` TEXT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX (`shop`),
  INDEX (`category`),
  INDEX (`model`)
);

-- Para “veículo comprado virar do player” (QB/Qbox normalmente já tem player_vehicles)
-- Se tua base usa outro nome/colunas, me manda teu schema que eu ajusto.
