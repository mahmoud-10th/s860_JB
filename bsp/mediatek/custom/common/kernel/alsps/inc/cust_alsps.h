#ifndef __CUST_ALSPS_H__
#define __CUST_ALSPS_H__

/*Lenovo-xm huangdra 20130624 add for Aupress new als param.begin*/
#if defined(LENOVO_PROJECT_AUX) 
#define C_CUST_ALS_LEVEL    8
/*Lenovo-sh chenlj2 20130822 add for stella &sofina s new als param.begin*/
#elif defined(LENOVO_PROJECT_STELLA) || defined(LENOVO_PROJECT_SOFINA) || defined(LENOVO_PROJECT_SOFINATD)
#define C_CUST_ALS_LEVEL    12
#elif defined(LENOVO_PROJECT_PHAETON)
#define C_CUST_ALS_LEVEL    18
#else
#define C_CUST_ALS_LEVEL    16
#endif
#define C_CUST_I2C_ADDR_NUM 4

#define MAX_THRESHOLD_HIGH 0xffff
#define MIN_THRESHOLD_LOW 0x0

struct alsps_hw {
    int i2c_num;                                    /*!< the i2c bus used by ALS/PS */
    int power_id;                                   /*!< the power id of the chip */
    int power_vol;                                  /*!< the power voltage of the chip */
	int polling_mode;                               /*!< 1: polling mode ; 0:interrupt mode*/
	int polling_mode_ps;                               /*!< 1: polling mode ; 0:interrupt mode*/
	int polling_mode_als;                               /*!< 1: polling mode ; 0:interrupt mode*/
    unsigned char   i2c_addr[C_CUST_I2C_ADDR_NUM];  /*!< i2c address list, some chip will have multiple address */
    unsigned int    als_level[C_CUST_ALS_LEVEL-1];  /*!< (C_CUST_ALS_LEVEL-1) levels divides all range into C_CUST_ALS_LEVEL levels*/
    unsigned int    als_value[C_CUST_ALS_LEVEL];    /*!< the value reported in each level */
    unsigned int    ps_threshold;                   /*!< the threshold of proximity sensor */
	unsigned int    als_window_loss;                /*!< the window loss  */
	unsigned int    ps_threshold_high;
	unsigned int    ps_threshold_low;
	unsigned int    als_threshold_high;
	unsigned int    als_threshold_low;
};

extern struct alsps_hw* get_cust_alsps_hw(void);
#endif
