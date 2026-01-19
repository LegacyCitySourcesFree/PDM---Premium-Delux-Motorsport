Config = {}

-- Framework
Config.Framework = 'auto' -- 'auto' | 'qbox' | 'qb'

-- Target (ALT)
Config.Target = 'auto' -- 'auto' | 'ox_target' | 'qb-target'
Config.InteractDistance = 2.0

-- Key system (pra entregar a chave)
-- 'auto' tenta detectar; ou força: 'qbx_vehiclekeys' | 'qb-vehiclekeys' | 'wasabi_carlock' | 'none'
Config.Keys = 'auto'

-- Money
Config.PayAccount = 'bank' -- 'cash' ou 'bank'
Config.TestDriveEnabled = true
Config.TestDriveSeconds = 45

-- Shops
Config.Shops = {
  {
    id = 'pdm',
    label = 'Premium Deluxe Motorsport',
    ped = {
      model = 's_m_m_autoshop_02',
      coords = vec4(-2295.85, 371.96, 174.6, 18.29),
      scenario = 'WORLD_HUMAN_CLIPBOARD'
    },
    preview = {
      coords = vec4(-2290.99, 382.47, 174.47, 328.99), -- onde o carro aparece na tela/loja
    },
    spawn = {
      coords = vec4(-2311.03, 378.09, 174.47, 92.5), -- onde entrega o carro comprado
    }
  }
}

-- Categorias (aparecem como abas)
Config.Categories = {
  { id = 'sports', label = 'Sports' },
  { id = 'super', label = 'Super' },
  { id = 'sedan', label = 'Sedans' },
  { id = 'suv', label = 'SUVs' },
  { id = 'motorcycle', label = 'Motorcycles' },
}
