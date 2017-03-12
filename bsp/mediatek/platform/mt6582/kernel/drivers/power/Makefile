obj-$(CONFIG_MTK_PMIC)          += pmic_mt6323.o upmu_common.o

ifeq ($(MTK_MT6333_SUPPORT),yes)
    obj-$(CONFIG_MTK_PMIC) += mt6333.o
endif

obj-$(CONFIG_MTK_SMART_BATTERY) += battery_meter_hal.o 

ifeq ($(MTK_BQ27531_SUPPORT),yes)
    obj-$(CONFIG_MTK_SMART_BATTERY) += bq27531.o bq27531_firmware.o
endif

ifeq ($(MTK_MAX17058_SUPPORT),yes)
    obj-$(CONFIG_MTK_SMART_BATTERY) += max17058.o
endif

ifeq ($(MTK_BQ24250_SUPPORT),yes) 
	obj-$(CONFIG_MTK_SMART_BATTERY) += bq24250.o charging_hw_bq24250.o
else
ifeq ($(MTK_BQ24196_SUPPORT),yes) 
#lenovo-sw weiweij modified for add bq24196 support
    obj-$(CONFIG_MTK_SMART_BATTERY) += bq24196.o charging_hw_bq24196.o
    #obj-$(CONFIG_MTK_SMART_BATTERY) += addon/
#lenovo-sw weiweij modified for add bq24196 support end
    ifeq ($(MTK_BQ27541_SUPPORT),yes)
      #obj-$(CONFIG_MTK_SMART_BATTERY) += bq27541.o
      obj-$(CONFIG_MTK_SMART_BATTERY) += addon/
    endif
else
  ifeq ($(MTK_NCP1851_SUPPORT),yes) 
    #obj-$(CONFIG_MTK_SMART_BATTERY) += mt_battery_ncp1851.o mt6320_fuel_gauge_ncp1851.o ncp1851.o
    obj-$(CONFIG_MTK_SMART_BATTERY) += addon/
  else
      ifeq ($(MTK_FAN5405_SUPPORT),yes)
           obj-$(CONFIG_MTK_SMART_BATTERY) += fan5405.o charging_hw_fan5405.o
      else
           ifeq ($(MTK_SWCHR_SUPPORT),yes)
                obj-$(CONFIG_MTK_SMART_BATTERY) += charging_hw_6333.o                
           else
                obj-$(CONFIG_MTK_SMART_BATTERY) += charging_hw_pmic.o 
           endif
      endif
  endif
endif
endif
