/*
 * media/media_info.c
 *
 * This file is subject to the terms and conditions of the GNU General Public
 * License.  See the file COPYING in the main directory of this archive for
 * more details.
 *
 * media info driver
 *
 */
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/slab.h>
#include <linux/i2c.h>
#include <linux/interrupt.h>
#include <linux/delay.h>
#include <linux/input.h>
#include <linux/gpio.h>
#include <linux/uaccess.h>
#include <linux/cdev.h>

#include "cust_gpio_usage.h"
#include <cust_eint.h>

#define CHAR_DEVICE_NAME "lenovo_media"
#define DEVICE_CLASS_NAME "mediadev"
#define DEV_NUMBER 1
#define REG_ADDR_LIMIT 0xFFFF

extern struct tpd_device *tpd;
struct kobject *properties_kobj_tp;
struct kobject *properties_kobj_mediadev;




static ssize_t mediadev_sysfs_data_show(struct device *dev,
		struct device_attribute *attr, char *buf);

static ssize_t mediadev_sysfs_data_store(struct device *dev,
		struct device_attribute *attr, const char *buf, size_t count);

extern unsigned int getVersion(void);
extern unsigned int tpd_read_ID_version(void);
struct mediadev_handle {
	dev_t dev_no;
	unsigned short address;
	unsigned int length;
	struct device dev;
	struct kobject *sysfs_dir;
	void *data;
};

struct mediadev_data {
	int ref_count;
	struct cdev main_dev;
	struct class *device_class;
	struct mutex file_mutex;
	struct mediadev_handle *media_dev;
};

static struct device_attribute attrs[] = {

	__ATTR(tp_ver, (S_IRUGO | S_IRUGO),
			mediadev_sysfs_data_show,
			mediadev_sysfs_data_store),

};

static int mediadev_major_num;

static struct class *mediadev_device_class;

static struct mediadev_handle *mediadev;

static struct completion remove_complete;

static ssize_t mediadev_sysfs_data_show(struct device *dev,
		struct device_attribute *attr, char *buf)
{
		int retval;
		char *mod_type = NULL;
		unsigned int type = tpd_read_ID_version();//just test now version
		if(type == 0x0)
		{
			mod_type = "BOEN";
		}		
		else
		{
			mod_type = "Unknown type";
		}
		return sprintf(buf,"[%s-FW:0x%08x]\n", mod_type, getVersion());
}

static ssize_t mediadev_sysfs_data_store(struct device *dev,
		struct device_attribute *attr, const char *buf, size_t count)
{
	int retval;
	unsigned int data_length = mediadev->length;

	if (data_length > (REG_ADDR_LIMIT - mediadev->address))
		data_length = REG_ADDR_LIMIT - mediadev->address;

	if (data_length) {
		return 0;
	} else {
		return -EINVAL;
	}

	return data_length;
}


/*
 * mediadev_llseek - used to set up register address
 *
 * @filp: file structure for seek
 * @off: offset
 *   if whence == SEEK_SET,
 *     high 16 bits: page address
 *     low 16 bits: register address
 *   if whence == SEEK_CUR,
 *     offset from current position
 *   if whence == SEEK_END,
 *     offset from end position (0xFFFF)
 * @whence: SEEK_SET, SEEK_CUR, or SEEK_END
 */
static loff_t mediadev_llseek(struct file *filp, loff_t off, int whence)
{
	loff_t newpos;
	struct mediadev_data *dev_data = filp->private_data;

	if (IS_ERR(dev_data)) {
		pr_err("%s: Pointer of char device data is invalid", __func__);
		return -EBADF;
	}

	mutex_lock(&(dev_data->file_mutex));

	switch (whence) {
	case SEEK_SET:
		newpos = off;
		break;
	case SEEK_CUR:
		newpos = filp->f_pos + off;
		break;
	case SEEK_END:
		newpos = REG_ADDR_LIMIT + off;
		break;
	default:
		newpos = -EINVAL;
		goto clean_up;
	}

	if (newpos < 0 || newpos > REG_ADDR_LIMIT) {
		printk("%s: New position 0x%04x is invalid\n",
				__func__, (unsigned int)newpos);
		newpos = -EINVAL;
		goto clean_up;
	}

	filp->f_pos = newpos;

clean_up:
	mutex_unlock(&(dev_data->file_mutex));

	return newpos;
}

/*
 * mediadev_read: - use to read data from rmi device
 *
 * @filp: file structure for read
 * @buf: user space buffer pointer
 * @count: number of bytes to read
 * @f_pos: offset (starting register address)
 */
static ssize_t mediadev_read(struct file *filp, char __user *buf,
		size_t count, loff_t *f_pos)
{
	ssize_t retval;
	unsigned char tmpbuf[count + 1];
	struct mediadev_data *dev_data = filp->private_data;

	if (IS_ERR(dev_data)) {
		pr_err("%s: Pointer of char device data is invalid", __func__);
		return -EBADF;
	}

	if (count == 0)
		return 0;

	if (count > (REG_ADDR_LIMIT - *f_pos))
		count = REG_ADDR_LIMIT - *f_pos;

	mutex_lock(&(dev_data->file_mutex));

	retval = 0;
	if (retval < 0)
		goto clean_up;

	if (copy_to_user(buf, tmpbuf, count))
		retval = -EFAULT;
	else
		*f_pos += retval;

clean_up:
	mutex_unlock(&(dev_data->file_mutex));

	return retval;
}

/*
 * mediadev_write: - used to write data to rmi device
 *
 * @filep: file structure for write
 * @buf: user space buffer pointer
 * @count: number of bytes to write
 * @f_pos: offset (starting register address)
 */
static ssize_t mediadev_write(struct file *filp, const char __user *buf,
		size_t count, loff_t *f_pos)
{
	ssize_t retval;
	unsigned char tmpbuf[count + 1];
	struct mediadev_data *dev_data = filp->private_data;

	if (IS_ERR(dev_data)) {
		pr_err("%s: Pointer of char device data is invalid", __func__);
		return -EBADF;
	}

	if (count == 0)
		return 0;

	if (count > (REG_ADDR_LIMIT - *f_pos))
		count = REG_ADDR_LIMIT - *f_pos;

	if (copy_from_user(tmpbuf, buf, count))
		return -EFAULT;

	mutex_lock(&(dev_data->file_mutex));
	retval = 0;
	if (retval >= 0)
		*f_pos += retval;

	mutex_unlock(&(dev_data->file_mutex));

	return retval;
}

/*
 * mediadev_open: enable access to media device
 * @inp: inode struture
 * @filp: file structure
 */
static int mediadev_open(struct inode *inp, struct file *filp)
{
	int retval = 0;
	struct mediadev_data *dev_data =
			container_of(inp->i_cdev, struct mediadev_data, main_dev);

	if (!dev_data)
		return -EACCES;

	filp->private_data = dev_data;

	mutex_lock(&(dev_data->file_mutex));

	if (dev_data->ref_count < 1)
		dev_data->ref_count++;
	else
		retval = -EACCES;

	mutex_unlock(&(dev_data->file_mutex));

	return retval;
}

/*
 * mediadev_release: - release access to media device
 * @inp: inode structure
 * @filp: file structure
 */
static int mediadev_release(struct inode *inp, struct file *filp)
{
	struct mediadev_data *dev_data =
			container_of(inp->i_cdev, struct mediadev_data, main_dev);

	if (!dev_data)
		return -EACCES;

	mutex_lock(&(dev_data->file_mutex));

	dev_data->ref_count--;
	if (dev_data->ref_count < 0)
		dev_data->ref_count = 0;

	mutex_unlock(&(dev_data->file_mutex));

	return 0;
}

static const struct file_operations mediadev_fops = {
	.owner = THIS_MODULE,
	.llseek = mediadev_llseek,
	.read = mediadev_read,
	.write = mediadev_write,
	.open = mediadev_open,
	.release = mediadev_release,
};

static void mediadev_device_cleanup(struct mediadev_data *dev_data)
{
	dev_t devno;

	if (dev_data) {
		devno = dev_data->main_dev.dev;

		if (dev_data->device_class)
			device_destroy(dev_data->device_class, devno);

		cdev_del(&dev_data->main_dev);

		unregister_chrdev_region(devno, 1);

		printk("%s: mediadev device removed\n",
				__func__);
	}

	return;
}

static char *media_char_devnode(struct device *dev, mode_t *mode)
{
	if (!mode)
		return NULL;

	*mode = (S_IRUSR | S_IRGRP  | S_IROTH);

	return kasprintf(GFP_KERNEL, "lenovo_media/%s", dev_name(dev));
}

static int media_create_device_class(void)
{
	mediadev_device_class = class_create(THIS_MODULE, DEVICE_CLASS_NAME);

	if (IS_ERR(mediadev_device_class)) {
		pr_err("%s: Failed to create /dev/%s\n",
				__func__, CHAR_DEVICE_NAME);
		return -ENODEV;
	}

	mediadev_device_class->devnode = media_char_devnode;

	return 0;
}


static int mediadev_init_device(void)
{
	int retval;
	dev_t dev_no;
	unsigned char attr_count;
	struct mediadev_data *dev_data;
	struct device *device_ptr;

	printk("%s:enter \n",__func__);
	
	mediadev = kzalloc(sizeof(*mediadev), GFP_KERNEL);
	if (!mediadev) {
		printk("%s: Failed to alloc mem for mediadev\n",
				__func__);
		retval = -ENOMEM;
		goto err_mediadev;
	}

	retval = media_create_device_class();
	if (retval < 0) {
		printk("%s: Failed to create device class\n",__func__);
	}

    	printk("%s:after create device class \n",__func__);
	if (mediadev_major_num) {
		dev_no = MKDEV(mediadev_major_num, DEV_NUMBER);
		retval = register_chrdev_region(dev_no, 1, CHAR_DEVICE_NAME);
	} else {
		retval = alloc_chrdev_region(&dev_no, 0, 1, CHAR_DEVICE_NAME);
		if (retval < 0) {
			printk("%s: Failed to allocate char device region\n",
					__func__);
			goto err_device_region;
		}

		mediadev_major_num = MAJOR(dev_no);
		printk("%s: Major number of mediadev = %d\n",
				__func__, mediadev_major_num);
	}

	dev_data = kzalloc(sizeof(*dev_data), GFP_KERNEL);
	if (!dev_data) {
		printk("%s: Failed to alloc mem for dev_data\n",
				__func__);
		retval = -ENOMEM;
		goto err_dev_data;
	}

	mutex_init(&dev_data->file_mutex);
	dev_data->media_dev = mediadev;
	mediadev->data = dev_data;

	cdev_init(&dev_data->main_dev, &mediadev_fops);

	retval = cdev_add(&dev_data->main_dev, dev_no, 1);
	if (retval < 0) {
		printk("%s: Failed to add media device\n",
				__func__);
		goto err_char_device;
	}

	dev_set_name(&mediadev->dev, "mediadev%d", MINOR(dev_no));
	dev_data->device_class = mediadev_device_class;

	device_ptr = device_create(dev_data->device_class, NULL, dev_no,
			NULL, CHAR_DEVICE_NAME"%d", MINOR(dev_no));
	
	printk("%s:after devicecreate  \n",__func__);
	
	if (IS_ERR(device_ptr)) {
		printk("%s: Failed to create media char device\n",
				__func__);
		retval = -ENODEV;
		goto err_char_device;
	}

	properties_kobj_mediadev = kobject_create_and_add("mediadev", properties_kobj_tp);
	if (!properties_kobj_mediadev) {
			printk("%s: Failed to create sysfs directory\n",
					__func__);
			goto err_sysfs_dir;
	}


	for (attr_count = 0; attr_count < ARRAY_SIZE(attrs); attr_count++) {
		//retval = sysfs_create_file(mediadev->sysfs_dir, &attrs[attr_count].attr);
		retval = sysfs_create_file(properties_kobj_mediadev, &attrs[attr_count].attr);
		
		if (retval < 0) {
			printk("%s: Failed to create sysfs attributes\n",
					__func__);
			retval = -ENODEV;
			goto err_sysfs_attrs;
		}
	}

	return 0;

err_sysfs_attrs:
	for (attr_count--; attr_count >= 0; attr_count--) {
		sysfs_remove_file(properties_kobj_mediadev, &attrs[attr_count].attr);
	}

	kobject_put(properties_kobj_mediadev);

err_sysfs_dir:
err_char_device:
	mediadev_device_cleanup(dev_data);
	kfree(dev_data);

err_dev_data:
	unregister_chrdev_region(dev_no, 1);

err_device_region:
	class_destroy(mediadev_device_class);

err_fn_ptr:
	kfree(mediadev);

err_mediadev:
	return retval;
}

static void mediadev_remove_device(void)
{
	unsigned char attr_count;
	struct mediadev_data *dev_data;

	if (!mediadev)
		return;

	for (attr_count = 0; attr_count < ARRAY_SIZE(attrs); attr_count++)
		sysfs_remove_file(mediadev->sysfs_dir, &attrs[attr_count].attr);

	kobject_put(mediadev->sysfs_dir);

	dev_data = mediadev->data;
	if (dev_data) {
		mediadev_device_cleanup(dev_data);
		kfree(dev_data);
	}

	unregister_chrdev_region(mediadev->dev_no, 1);

	class_destroy(mediadev_device_class);

	//kfree(mediadev->fn_ptr);
	kfree(mediadev);

	complete(&remove_complete);

	return;
}

static int __init mediadev_module_init(void)
{
	printk("[wj]--%s--.\n", __func__);
	mediadev_init_device();
	return 0;
}

static void __exit mediadev_module_exit(void)
{
	printk("[wj]--%s--.\n", __func__);
	init_completion(&remove_complete);
	mediadev_remove_device();
	wait_for_completion(&remove_complete);
	return;
}

module_init(mediadev_module_init);
module_exit(mediadev_module_exit);

MODULE_AUTHOR("Lenovo.");
MODULE_DESCRIPTION("Lenovo Media info Module");
MODULE_LICENSE("GPL");

