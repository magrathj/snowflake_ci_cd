terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.35"
    }
  }
}

provider "snowflake" {
  role  = "SYSADMIN" 
  region = "north-europe.azure"
  account = "TW17535" 
  private_key_path = "~/.ssh/snowflake_tf_snow_key.p8" 
  username = "tf-snow-test" 
}

resource "snowflake_database" "db" {
  name     = "TF_DEMO"
}

resource "snowflake_warehouse" "warehouse" {
  name           = "TF_DEMO"
  warehouse_size = "small"
  auto_suspend = 60
}