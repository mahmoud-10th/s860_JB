#include <linux/interrupt.h>
#include <linux/i2c.h>
#include <linux/slab.h>
#include <linux/irq.h>
#include <linux/miscdevice.h>
#include <asm/uaccess.h>
#include <linux/delay.h>
#include <linux/input.h>
#include <linux/workqueue.h>
#include <linux/kobject.h>
#include <linux/earlysuspend.h>
#include <linux/platform_device.h>
#include <asm/atomic.h>

#include <cust_acc.h>
#include <linux/hwmsensor.h>
#include <linux/hwmsen_dev.h>
#include <linux/sensors_io.h>
#include <linux/hwmsen_helper.h>
#include <linux/xlog.h>


#include <mach/mt_typedefs.h>
#include <mach/mt_gpio.h>
#include <mach/mt_pm_ldo.h>

#include "bq24196.h"

#include "cust_charging.h"
#include <mach/charging.h>

#ifdef MTK_BQ27531_SUPPORT
#include "bq27531.h"
#endif

#ifdef MTK_BQ27531_CONTROL_24196_SUPPORT
kal_uint8 bq24196_reg[bq24196_REG_NUM] = {0};

int bq24196_read_byte(kal_uint8 cmd, kal_uint8 *returnData)
{
	return bq27531_read_byte(cmd, returnData);
}

int bq24196_write_byte(kal_uint8 cmd, kal_uint8 writeData)
{
	return bq27531_write_byte(cmd, writeData);
}
#else
/**********************************************************
  *
  *   [I2C Slave Setting] 
  *
  *********************************************************/
#define BQ24196_SLAVE_ADDR_WRITE	0xD6
#define bq24196_SLAVE_ADDR_READ		0xD7

static struct i2c_client *new_client = NULL;
static const struct i2c_device_id bq24196_i2c_id[] = {{"bq24196",0},{}};   
kal_bool chargin_hw_init_done = KAL_FALSE; 
static int bq24196_driver_probe(struct i2c_client *client, const struct i2c_device_id *id);

static struct i2c_driver bq24196_driver = {
    .driver = {
        .name    = "bq24196",
    },
    .probe       = bq24196_driver_probe,
    .id_table    = bq24196_i2c_id,
};

/**********************************************************
  *
  *   [Global Variable] 
  *
  *********************************************************/
kal_uint8 bq24196_reg[bq24196_REG_NUM] = {0};

static DEFINE_MUTEX(bq24196_i2c_access);
/**********************************************************
  *
  *   [I2C Function For Read/Write fan5405] 
  *
  *********************************************************/
int bq24196_read_byte(kal_uint8 cmd, kal_uint8 *returnData)
{
    char     cmd_buf[1]={0x00};
    char     readData = 0;
    int      ret=0;

    mutex_lock(&bq24196_i2c_access);
    
    //new_client->addr = ((new_client->addr) & I2C_MASK_FLAG) | I2C_WR_FLAG;    
    new_client->ext_flag=((new_client->ext_flag ) & I2C_MASK_FLAG ) | I2C_WR_FLAG | I2C_DIRECTION_FLAG;

    cmd_buf[0] = cmd;
    ret = i2c_master_send(new_client, &cmd_buf[0], (1<<8 | 1));
    if (ret < 0) 
    {    
        //new_client->addr = new_client->addr & I2C_MASK_FLAG;
        new_client->ext_flag=0;

        mutex_unlock(&bq24196_i2c_access);
        return 0;
    }
    
    readData = cmd_buf[0];
    *returnData = readData;

    // new_client->addr = new_client->addr & I2C_MASK_FLAG;
    new_client->ext_flag=0;
    
    mutex_unlock(&bq24196_i2c_access);    
    return 1;
}

int bq24196_write_byte(kal_uint8 cmd, kal_uint8 writeData)
{
    char    write_data[2] = {0};
    int     ret=0;

    mutex_lock(&bq24196_i2c_access);
    
    write_data[0] = cmd;
    write_data[1] = writeData;
    
    new_client->ext_flag=((new_client->ext_flag ) & I2C_MASK_FLAG ) | I2C_DIRECTION_FLAG;
    
    ret = i2c_master_send(new_client, write_data, 2);
    if (ret < 0) 
    {
       
        new_client->ext_flag=0;
        mutex_unlock(&bq24196_i2c_access);
        return 0;
    }
    
    new_client->ext_flag=0;
    mutex_unlock(&bq24196_i2c_access);
    return 1;
}
#endif

/**********************************************************
  *
  *   [Read / Write Function] 
  *
  *********************************************************/
kal_uint32 bq24196_read_interface (kal_uint8 RegNum, kal_uint8 *val, kal_uint8 MASK, kal_uint8 SHIFT)
{
    kal_uint8 bq24196_reg = 0;
    int ret = 0;

   battery_xlog_printk(BAT_LOG_FULL,"--------------------------------------------------\n");

    ret = bq24196_read_byte(RegNum, &bq24196_reg);

	battery_xlog_printk(BAT_LOG_FULL,"[bq24196_read_interface] Reg[%x]=0x%x\n", RegNum, bq24196_reg);
	
    bq24196_reg &= (MASK << SHIFT);
    *val = (bq24196_reg >> SHIFT);
	
	battery_xlog_printk(BAT_LOG_FULL,"[bq24196_read_interface] val=0x%x\n", *val);
	
    return ret;
}

kal_uint32 bq24196_config_interface (kal_uint8 RegNum, kal_uint8 val, kal_uint8 MASK, kal_uint8 SHIFT)
{
    kal_uint8 bq24196_reg = 0;
    int ret = 0;

    battery_xlog_printk(BAT_LOG_FULL,"--------------------------------------------------\n");
	
    ret = bq24196_read_byte(RegNum, &bq24196_reg);
    battery_xlog_printk(BAT_LOG_FULL,"[bq24196_config_interface] Reg[%x]=0x%x\n", RegNum-bq24196_CON0, bq24196_reg);
    
    bq24196_reg &= ~(MASK << SHIFT);
    bq24196_reg |= (val << SHIFT);

	if(RegNum == bq24196_CON1 && val == 1 && MASK ==CON1_REG_RST_MASK && SHIFT == CON1_REG_RST_SHIFT)
	{
		// RESET bit
	}else if(RegNum == bq24196_CON1)
	{
		bq24196_reg &= ~0x80;	//RESET bit read returs 1, so clear it
	}

    ret = bq24196_write_byte(RegNum, bq24196_reg);
    battery_xlog_printk(BAT_LOG_FULL,"[bq24196_config_interface] write Reg[%x]=0x%x\n", RegNum-bq24196_CON0, bq24196_reg);

    // Check
    //bq24196_read_byte(RegNum, &bq24196_reg);
    //printk("[bq24196_config_interface] Check Reg[%x]=0x%x\n", RegNum, bq24196_reg);

    return ret;
}

//write one register directly
kal_uint32 bq24196_config_interface_liao (kal_uint8 RegNum, kal_uint8 val)
{   
    int ret = 0;
    
    ret = bq24196_write_byte(RegNum, val);

    return ret;
}

/**********************************************************
  *
  *   [Internal Function] 
  *
  *********************************************************/

void bq24196_set_en_hiz(kal_uint32 val)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON0), 
                                    (kal_uint8)(val),
                                    (kal_uint8)(CON0_EN_HIZ_MASK),
                                    (kal_uint8)(CON0_EN_HIZ_SHIFT)
                                    );
}

void bq24196_set_vindpm(kal_uint32 val)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON0), 
                                    (kal_uint8)(val),
                                    (kal_uint8)(CON0_VINDPM_MASK),
                                    (kal_uint8)(CON0_VINDPM_SHIFT)
                                    );
}

void bq24196_set_iinlim(kal_uint32 val)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON0), 
                                    (kal_uint8)(val),
                                    (kal_uint8)(CON0_IINLIM_MASK),
                                    (kal_uint8)(CON0_IINLIM_SHIFT)
                                    );
}

//CON1----------------------------------------------------

void bq24196_set_reg_rst(kal_uint32 val)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON1), 
                                    (kal_uint8)(val),
                                    (kal_uint8)(CON1_REG_RST_MASK),
                                    (kal_uint8)(CON1_REG_RST_SHIFT)
                                    );
}

void bq24196_set_wdt_rst(void)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON1), 
                                    (kal_uint8)1,
                                    (kal_uint8)(CON1_WDT_RST_MASK),
                                    (kal_uint8)(CON1_WDT_RST_SHIFT)
                                    );
}

void bq24196_set_chg_config(kal_uint32 val)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON1), 
                                    (kal_uint8)(val),
                                    (kal_uint8)(CON1_CHG_CONFIG_MASK),
                                    (kal_uint8)(CON1_CHG_CONFIG_SHIFT)
                                    );
}

void bq24196_set_sys_min(kal_uint32 val)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON1), 
                                    (kal_uint8)(val),
                                    (kal_uint8)(CON1_SYS_MIN_MASK),
                                    (kal_uint8)(CON1_SYS_MIN_SHIFT)
                                    );
}

void bq24196_set_boost_lim(kal_uint32 val)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON1), 
                                    (kal_uint8)(val),
                                    (kal_uint8)(CON1_BOOST_LIM_MASK),
                                    (kal_uint8)(CON1_BOOST_LIM_SHIFT)
                                    );
}

//CON2----------------------------------------------------

void bq24196_set_ichg(kal_uint32 val)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON2), 
                                    (kal_uint8)(val),
                                    (kal_uint8)(CON2_ICHG_MASK),
                                    (kal_uint8)(CON2_ICHG_SHIFT)
                                    );
}

kal_uint32 bq24196_get_ichg(void)
{
    kal_uint32 ret=0;
    kal_uint8 val=0;  

    ret=bq24196_read_interface(     (kal_uint8)(bq24196_CON2), 
                                    (&val),
                                    (kal_uint8)(CON2_ICHG_MASK),
                                    (kal_uint8)(CON2_ICHG_SHIFT)
                                    );

    return val;
}
//CON3----------------------------------------------------

void bq24196_set_iprechg(kal_uint32 val)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON3), 
                                    (kal_uint8)(val),
                                    (kal_uint8)(CON3_IPRECHG_MASK),
                                    (kal_uint8)(CON3_IPRECHG_SHIFT)
                                    );
}

void bq24196_set_iterm(kal_uint32 val)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON3), 
                                    (kal_uint8)(val),
                                    (kal_uint8)(CON3_ITERM_MASK),
                                    (kal_uint8)(CON3_ITERM_SHIFT)
                                    );
}

//CON4----------------------------------------------------

void bq24196_set_vreg(kal_uint32 val)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON4), 
                                    (kal_uint8)(val),
                                    (kal_uint8)(CON4_VREG_MASK),
                                    (kal_uint8)(CON4_VREG_SHIFT)
                                    );
}

void bq24196_set_batlowv(kal_uint32 val)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON4), 
                                    (kal_uint8)(val),
                                    (kal_uint8)(CON4_BATLOWV_MASK),
                                    (kal_uint8)(CON4_BATLOWV_SHIFT)
                                    );
}

void bq24196_set_vrechg(kal_uint32 val)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON4), 
                                    (kal_uint8)(val),
                                    (kal_uint8)(CON4_VRECHG_MASK),
                                    (kal_uint8)(CON4_VRECHG_SHIFT)
                                    );
}

//CON5----------------------------------------------------

void bq24196_set_en_term(kal_uint32 val)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON5), 
                                    (kal_uint8)(val),
                                    (kal_uint8)(CON5_EN_TERM_MASK),
                                    (kal_uint8)(CON5_EN_TERM_SHIFT)
                                    );
}

void bq24196_set_term_stat(kal_uint32 val)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON5), 
                                    (kal_uint8)(val),
                                    (kal_uint8)(CON5_TERM_STAT_MASK),
                                    (kal_uint8)(CON5_TERM_STAT_SHIFT)
                                    );
}

void bq24196_set_watchdog(kal_uint32 val)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON5), 
                                    (kal_uint8)(val),
                                    (kal_uint8)(CON5_WATCHDOG_MASK),
                                    (kal_uint8)(CON5_WATCHDOG_SHIFT)
                                    );
}

void bq24196_set_en_timer(kal_uint32 val)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON5), 
                                    (kal_uint8)(val),
                                    (kal_uint8)(CON5_EN_TIMER_MASK),
                                    (kal_uint8)(CON5_EN_TIMER_SHIFT)
                                    );
}

void bq24196_set_chg_timer(kal_uint32 val)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON5), 
                                    (kal_uint8)(val),
                                    (kal_uint8)(CON5_CHG_TIMER_MASK),
                                    (kal_uint8)(CON5_CHG_TIMER_SHIFT)
                                    );
}

//CON6----------------------------------------------------

void bq24196_set_res_ir(kal_uint32 val)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON6), 
                                    (kal_uint8)(val),
                                    (kal_uint8)(CON6_RES_IR_MASK),
                                    (kal_uint8)(CON6_RES_IR_SHIFT)
                                    );
}

void bq24196_set_vol_ir(kal_uint32 val)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON6), 
                                    (kal_uint8)(val),
                                    (kal_uint8)(CON6_VOL_IR_MASK),
                                    (kal_uint8)(CON6_VOL_IR_SHIFT)
                                    );
}

void bq24196_set_treg(kal_uint32 val)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON6), 
                                    (kal_uint8)(val),
                                    (kal_uint8)(CON6_TREG_MASK),
                                    (kal_uint8)(CON6_TREG_SHIFT)
                                    );
}

//CON7----------------------------------------------------

void bq24196_set_tmr2x_en(kal_uint32 val)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON7), 
                                    (kal_uint8)(val),
                                    (kal_uint8)(CON7_TMR2X_EN_MASK),
                                    (kal_uint8)(CON7_TMR2X_EN_SHIFT)
                                    );
}

void bq24196_set_batfet_disable(kal_uint32 val)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON7), 
                                    (kal_uint8)(val),
                                    (kal_uint8)(CON7_BATFET_Disable_MASK),
                                    (kal_uint8)(CON7_BATFET_Disable_SHIFT)
                                    );
}

void bq24196_set_int_mask(kal_uint32 val)
{
    kal_uint32 ret=0;    

    ret=bq24196_config_interface(   (kal_uint8)(bq24196_CON7), 
                                    (kal_uint8)(val),
                                    (kal_uint8)(CON7_INT_MASK_MASK),
                                    (kal_uint8)(CON7_INT_MASK_SHIFT)
                                    );
}

//CON8----------------------------------------------------

kal_uint32 bq24196_get_system_status(void)
{
    kal_uint32 ret=0;
    kal_uint8 val=0;

    ret=bq24196_read_interface(     (kal_uint8)(bq24196_CON8), 
                                    (&val),
                                    (kal_uint8)(0xFF),
                                    (kal_uint8)(0x0)
                                    );
    return val;
}

kal_uint32 bq24196_get_vbus_stat(void)
{
    kal_uint32 ret=0;
    kal_uint8 val=0;

    ret=bq24196_read_interface(     (kal_uint8)(bq24196_CON8), 
                                    (&val),
                                    (kal_uint8)(CON8_VBUS_STAT_MASK),
                                    (kal_uint8)(CON8_VBUS_STAT_SHIFT)
                                    );
    return val;
}

kal_uint32 bq24196_get_chrg_stat(void)
{
    kal_uint32 ret=0;
    kal_uint8 val=0;

    ret=bq24196_read_interface(     (kal_uint8)(bq24196_CON8), 
                                    (&val),
                                    (kal_uint8)(CON8_CHRG_STAT_MASK),
                                    (kal_uint8)(CON8_CHRG_STAT_SHIFT)
                                    );
    return val;
}

kal_uint32 bq24196_get_vsys_stat(void)
{
    kal_uint32 ret=0;
    kal_uint8 val=0;

    ret=bq24196_read_interface(     (kal_uint8)(bq24196_CON8), 
                                    (&val),
                                    (kal_uint8)(CON8_VSYS_STAT_MASK),
                                    (kal_uint8)(CON8_VSYS_STAT_SHIFT)
                                    );
    return val;
}

//CON9----------------------------------------------------

kal_uint32 bq24196_get_otg_status(void)
{
    kal_uint32 ret=0;
    kal_uint8 val=0;

    ret=bq24196_read_interface(     (kal_uint8)(bq24196_CON9), 
                                    (&val),
                                    (kal_uint8)(CON9_OTG_FAULT_MASK),
                                    (kal_uint8)(CON9_OTG_FAULT_SHIFT)
                                    );
    return val;
}

/**********************************************************
  *
  *   [Internal Function] 
  *
  *********************************************************/
void bq24196_dump_register(void)
{
    int i=0;
    printk("[bq24196] ");

#ifdef MTK_BQ27531_SUPPORT
 //       bq24196_read_byte(0x74, &bq24196_reg[0]);
 //       printk("[0x74]=0x%x ",  bq24196_reg[0]);  
#endif

#if 1
    for (i=0;i<bq24196_REG_NUM;i++)
    {
        bq24196_read_byte(i+bq24196_CON0, &bq24196_reg[i]);
        printk("[0x%x]=0x%x ", i, bq24196_reg[i]);        
    }
    printk("\n");
#endif

#ifdef MTK_BQ27531_SUPPORT
	bq27531_dump_register();
#endif	
/*
bq24196_read_byte(bq24196_CON2, &bq24196_reg[i]);
        printk("ww_debug[0x%x]=0x%x ", bq24196_CON2, bq24196_reg[i]);        
bq24196_write_byte(bq24196_CON2, 0xaa);
bq24196_read_byte(bq24196_CON2, &bq24196_reg[i]);
        printk("ww_debug[0x%x]=0x%x ", bq24196_CON2, bq24196_reg[i]);     
*/		
}

#ifdef LENOVO_OTG_OCP
#include <cust_eint.h>
#include <mach/eint.h>

#define bq24196_otg_ocp_int_pin GPIO119

struct delayed_work bq24196_otg_ocp_state_int_work;

//extern void mt65xx_eint_registration(unsigned int eint_num, unsigned int is_deb_en, unsigned int pol, void (EINT_FUNC_PTR)(void), unsigned int is_auto_umask);
extern void bq24196_set_otg_en( int en);

static void bq24196_otg_ocp_state_delay_work(struct work_struct *data)
{
	int val=0;

	if(chargin_hw_init_done==KAL_FALSE)
	{
		printk("[LENOVO_OTG_OCP]bq24196 i2c not ready\n");	
		return;
	}

	val = bq24196_get_otg_status();
	printk("[LENOVO_OTG_OCP]bq24196_state_interrup val = %d\n", val);
	if(val==1)
		bq24196_set_otg_en(0);
}

void bq24196_otg_ocp_state_interrup(void)
{
	printk("[LENOVO_OTG_OCP]bq24196_state_interrup\n");
	//val = bq24196_get_otg_status();
	//printk("val = %d\n", val);
	//schedule_delayed_work(&bq24196_state_int_work,sw_deboun_time*HZ/1000);
	schedule_work(&bq24196_otg_ocp_state_int_work);
}

static bq24196_otg_ocp_config_int(void)
{
	battery_xlog_printk(BAT_LOG_CRTI,"[LENOVO_OTG_OCP] config int\n");
	 
	mt_eint_registration(bq24196_otg_ocp_int_pin, CUST_EINTF_TRIGGER_FALLING, bq24196_otg_ocp_state_interrup,TRUE);
	
	INIT_DELAYED_WORK(&bq24196_otg_ocp_state_int_work, bq24196_otg_ocp_state_delay_work);	
}
#endif

#ifndef MTK_BQ27531_CONTROL_24196_SUPPORT
static int bq24196_driver_probe(struct i2c_client *client, const struct i2c_device_id *id) 
{             
    int err=0; 

    battery_xlog_printk(BAT_LOG_CRTI,"[bq24196_driver_probe] \n");

    if (!(new_client = kmalloc(sizeof(struct i2c_client), GFP_KERNEL))) {
        err = -ENOMEM;
        goto exit;
    }    
    memset(new_client, 0, sizeof(struct i2c_client));

    new_client = client;    

    //---------------------
    bq24196_dump_register();
    chargin_hw_init_done = KAL_TRUE;

#ifdef LENOVO_OTG_OCP
	bq24196_otg_ocp_config_int();
#endif

    return 0;                                                                                       

exit:
    return err;

}

/**********************************************************
  *
  *   [platform_driver API] 
  *
  *********************************************************/
kal_uint8 g_reg_value_bq24196=0;
static ssize_t show_bq24196_access(struct device *dev,struct device_attribute *attr, char *buf)
{
    battery_xlog_printk(BAT_LOG_FULL,"[show_fan5405_access] 0x%x\n", g_reg_value_bq24196);
    return sprintf(buf, "%u\n", g_reg_value_bq24196);
}
static ssize_t store_bq24196_access(struct device *dev,struct device_attribute *attr, const char *buf, size_t size)
{
    int ret=0;
    char *pvalue = NULL;
    unsigned int reg_value = 0;
    unsigned int reg_address = 0;
    
    battery_xlog_printk(BAT_LOG_FULL,"[store_bq24196_access] \n");
    
    if(buf != NULL && size != 0)
    {
        battery_xlog_printk(BAT_LOG_FULL,"[store_bq24196_access] buf is %s and size is %d \n",buf,size);
        reg_address = simple_strtoul(buf,&pvalue,16);
        
        if(size > 3)
        {        
            reg_value = simple_strtoul((pvalue+1),NULL,16);        
            battery_xlog_printk(BAT_LOG_FULL,"[store_bq24196_access] write bq24196 reg 0x%x with value 0x%x !\n",reg_address,reg_value);
            ret=bq24196_config_interface(reg_address, reg_value, 0xFF, 0x0);
        }
        else
        {    
            ret=bq24196_read_interface(reg_address, &g_reg_value_bq24196, 0xFF, 0x0);
            battery_xlog_printk(BAT_LOG_FULL,"[store_bq24196_access] read bq24196 reg 0x%x with value 0x%x !\n",reg_address,g_reg_value_bq24196);
            battery_xlog_printk(BAT_LOG_FULL,"[store_bq24196_access] Please use \"cat bq24196_access\" to get value\r\n");
        }        
    }    
    return size;
}
static DEVICE_ATTR(bq24196_access, 0664, show_bq24196_access, store_bq24196_access); //664

static int bq24196_user_space_probe(struct platform_device *dev)    
{    
    int ret_device_file = 0;

    battery_xlog_printk(BAT_LOG_CRTI,"******** bq24196_user_space_probe!! ********\n" );
    
    ret_device_file = device_create_file(&(dev->dev), &dev_attr_bq24196_access);
    
    return 0;
}

struct platform_device bq24196_user_space_device = {
    .name   = "bq24196-user",
    .id     = -1,
};

static struct platform_driver bq24196_user_space_driver = {
    .probe      = bq24196_user_space_probe,
    .driver     = {
        .name = "bq24196-user",
    },
};


static struct i2c_board_info __initdata i2c_bq24196 = { I2C_BOARD_INFO("bq24196", (BQ24196_SLAVE_ADDR_WRITE>>1))};

static int __init bq24196_init(void)
{    
    int ret=0;
    
    battery_xlog_printk(BAT_LOG_CRTI,"[bq24196_init] init start\n");
    
    i2c_register_board_info(BQ24196_BUSNUM, &i2c_bq24196, 1);

    if(i2c_add_driver(&bq24196_driver)!=0)
    {
        battery_xlog_printk(BAT_LOG_CRTI,"[bq24196_init] failed to register bq24196 i2c driver.\n");
    }
    else
    {
        battery_xlog_printk(BAT_LOG_CRTI,"[bq24196_init] Success to register bq24196 i2c driver.\n");
    }

    // fan5405 user space access interface
    ret = platform_device_register(&bq24196_user_space_device);
    if (ret) {
        battery_xlog_printk(BAT_LOG_CRTI,"****[bq24196_init] Unable to device register(%d)\n", ret);
        return ret;
    }    
    ret = platform_driver_register(&bq24196_user_space_driver);
    if (ret) {
        battery_xlog_printk(BAT_LOG_CRTI,"****[bq24196_init] Unable to register driver (%d)\n", ret);
        return ret;
    }
    
    return 0;        
}

static void __exit bq24196_exit(void)
{
    i2c_del_driver(&bq24196_driver);
}

module_init(bq24196_init);
module_exit(bq24196_exit);
   
MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("I2C fan5405 Driver");
MODULE_AUTHOR("James Lo<james.lo@mediatek.com>");
#endif
