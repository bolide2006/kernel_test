// SPDX-License-Identifier: GPL-2.0-only

#include <linux/clk.h>
#include <linux/device.h>
#include <linux/gpio/consumer.h>
#include <linux/module.h>
#include <linux/of_device.h>
#include <linux/slab.h>
#include <linux/component.h>

#include <media/cec.h>

#include <drm/drm_atomic.h>
#include <drm/drm_atomic_helper.h>
#include <drm/drm_edid.h>
#include <drm/drm_print.h>
#include <drm/drm_probe_helper.h>
#include <drm/drm_of.h>

enum vencoder_type {
    VENCODER_0,
    VENCODER_1,
    VENCODER_2,
    VENCODER_3
};

struct vencoder {
    enum drm_connector_status status;
    struct drm_display_mode curr_mode;

    struct drm_bridge bridge;
    struct drm_connector connector;
    struct drm_encoder encoder;
    enum vencoder_type type;
};

static const struct drm_display_mode drm_dmt_modes[] = {
    /* 0x01 - 640x350@85Hz */
    { DRM_MODE("640x350", DRM_MODE_TYPE_DRIVER, 31500, 640, 672,
           736, 832, 0, 350, 382, 385, 445, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x02 - 640x400@85Hz */
    { DRM_MODE("640x400", DRM_MODE_TYPE_DRIVER, 31500, 640, 672,
           736, 832, 0, 400, 401, 404, 445, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x03 - 720x400@85Hz */
    { DRM_MODE("720x400", DRM_MODE_TYPE_DRIVER, 35500, 720, 756,
           828, 936, 0, 400, 401, 404, 446, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x04 - 640x480@60Hz */
    { DRM_MODE("640x480", DRM_MODE_TYPE_DRIVER, 25175, 640, 656,
           752, 800, 0, 480, 490, 492, 525, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x05 - 640x480@72Hz */
    { DRM_MODE("640x480", DRM_MODE_TYPE_DRIVER, 31500, 640, 664,
           704, 832, 0, 480, 489, 492, 520, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x06 - 640x480@75Hz */
    { DRM_MODE("640x480", DRM_MODE_TYPE_DRIVER, 31500, 640, 656,
           720, 840, 0, 480, 481, 484, 500, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x07 - 640x480@85Hz */
    { DRM_MODE("640x480", DRM_MODE_TYPE_DRIVER, 36000, 640, 696,
           752, 832, 0, 480, 481, 484, 509, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x08 - 800x600@56Hz */
    { DRM_MODE("800x600", DRM_MODE_TYPE_DRIVER, 36000, 800, 824,
           896, 1024, 0, 600, 601, 603, 625, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x09 - 800x600@60Hz */
    { DRM_MODE("800x600", DRM_MODE_TYPE_DRIVER, 40000, 800, 840,
           968, 1056, 0, 600, 601, 605, 628, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x0a - 800x600@72Hz */
    { DRM_MODE("800x600", DRM_MODE_TYPE_DRIVER, 50000, 800, 856,
           976, 1040, 0, 600, 637, 643, 666, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x0b - 800x600@75Hz */
    { DRM_MODE("800x600", DRM_MODE_TYPE_DRIVER, 49500, 800, 816,
           896, 1056, 0, 600, 601, 604, 625, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x0c - 800x600@85Hz */
    { DRM_MODE("800x600", DRM_MODE_TYPE_DRIVER, 56250, 800, 832,
           896, 1048, 0, 600, 601, 604, 631, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x0d - 800x600@120Hz RB */
    { DRM_MODE("800x600", DRM_MODE_TYPE_DRIVER, 73250, 800, 848,
           880, 960, 0, 600, 603, 607, 636, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x0e - 848x480@60Hz */
    { DRM_MODE("848x480", DRM_MODE_TYPE_DRIVER, 33750, 848, 864,
           976, 1088, 0, 480, 486, 494, 517, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x0f - 1024x768@43Hz, interlace */
    { DRM_MODE("1024x768i", DRM_MODE_TYPE_DRIVER, 44900, 1024, 1032,
           1208, 1264, 0, 768, 768, 776, 817, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC |
           DRM_MODE_FLAG_INTERLACE) },
    /* 0x10 - 1024x768@60Hz */
    { DRM_MODE("1024x768", DRM_MODE_TYPE_DRIVER, 65000, 1024, 1048,
           1184, 1344, 0, 768, 771, 777, 806, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x11 - 1024x768@70Hz */
    { DRM_MODE("1024x768", DRM_MODE_TYPE_DRIVER, 75000, 1024, 1048,
           1184, 1328, 0, 768, 771, 777, 806, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x12 - 1024x768@75Hz */
    { DRM_MODE("1024x768", DRM_MODE_TYPE_DRIVER, 78750, 1024, 1040,
           1136, 1312, 0, 768, 769, 772, 800, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x13 - 1024x768@85Hz */
    { DRM_MODE("1024x768", DRM_MODE_TYPE_DRIVER, 94500, 1024, 1072,
           1168, 1376, 0, 768, 769, 772, 808, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x14 - 1024x768@120Hz RB */
    { DRM_MODE("1024x768", DRM_MODE_TYPE_DRIVER, 115500, 1024, 1072,
           1104, 1184, 0, 768, 771, 775, 813, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x15 - 1152x864@75Hz */
    { DRM_MODE("1152x864", DRM_MODE_TYPE_DRIVER, 108000, 1152, 1216,
           1344, 1600, 0, 864, 865, 868, 900, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x55 - 1280x720@60Hz */
    { DRM_MODE("1280x720", DRM_MODE_TYPE_DRIVER, 74250, 1280, 1390,
           1430, 1650, 0, 720, 725, 730, 750, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },

      //FIXME_YANGYANG  1080x2160@60Hz
     { DRM_MODE("1080x2160", DRM_MODE_TYPE_DRIVER, 151875, 1080, 1084,
        1089, 1126, 0, 2160, 2168, 2178, 2250, 0,
    DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
         //FIXME_YANGYANG  1440x2560@60Hz
        { DRM_MODE("1440x2560", DRM_MODE_TYPE_DRIVER, 336384, 1440, 1488,
        1520, 1600, 0, 2560, 2752,3032, 3504, 0,
       DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
         //FIXME_YANGYANG  1440x2560@120Hz
        { DRM_MODE("1440x2560", DRM_MODE_TYPE_DRIVER, 672768, 1440, 1488,
        1520, 1600, 0, 2560, 2752,3032, 3504, 0,
       DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },

       //FIXME_YANGYANG 2160*3840 60
       { DRM_MODE("2160x3840", DRM_MODE_TYPE_DRIVER, 594000, 2160, 2168,
       2178, 2250, 0, 3840, 4016,4104, 4400, 0,
              DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC)},
       //FIXME_YANGYANG 2160*3840 120
       { DRM_MODE("2160x3840", DRM_MODE_TYPE_DRIVER, 1188000, 2160, 2168,
       2178, 2250, 0, 3840, 4016,4104, 4400, 0,
              DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC)},

       //FIXME_YANGYANG
     { DRM_MODE("1280x480", DRM_MODE_TYPE_DRIVER, 50350, 1280, 1312,
    1504, 1600, 0, 480, 490, 492, 525, 0,
    DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x16 - 1280x768@60Hz RB */
    { DRM_MODE("1280x768", DRM_MODE_TYPE_DRIVER, 68250, 1280, 1328,
           1360, 1440, 0, 768, 771, 778, 790, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x17 - 1280x768@60Hz */
    { DRM_MODE("1280x768", DRM_MODE_TYPE_DRIVER, 79500, 1280, 1344,
           1472, 1664, 0, 768, 771, 778, 798, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x18 - 1280x768@75Hz */
    { DRM_MODE("1280x768", DRM_MODE_TYPE_DRIVER, 102250, 1280, 1360,
           1488, 1696, 0, 768, 771, 778, 805, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x19 - 1280x768@85Hz */
    { DRM_MODE("1280x768", DRM_MODE_TYPE_DRIVER, 117500, 1280, 1360,
           1496, 1712, 0, 768, 771, 778, 809, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x1a - 1280x768@120Hz RB */
    { DRM_MODE("1280x768", DRM_MODE_TYPE_DRIVER, 140250, 1280, 1328,
           1360, 1440, 0, 768, 771, 778, 813, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x1b - 1280x800@60Hz RB */
    { DRM_MODE("1280x800", DRM_MODE_TYPE_DRIVER, 71000, 1280, 1328,
           1360, 1440, 0, 800, 803, 809, 823, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x1c - 1280x800@60Hz */
    { DRM_MODE("1280x800", DRM_MODE_TYPE_DRIVER, 83500, 1280, 1352,
           1480, 1680, 0, 800, 803, 809, 831, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x1d - 1280x800@75Hz */
    { DRM_MODE("1280x800", DRM_MODE_TYPE_DRIVER, 106500, 1280, 1360,
           1488, 1696, 0, 800, 803, 809, 838, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x1e - 1280x800@85Hz */
    { DRM_MODE("1280x800", DRM_MODE_TYPE_DRIVER, 122500, 1280, 1360,
           1496, 1712, 0, 800, 803, 809, 843, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x1f - 1280x800@120Hz RB */
    { DRM_MODE("1280x800", DRM_MODE_TYPE_DRIVER, 146250, 1280, 1328,
           1360, 1440, 0, 800, 803, 809, 847, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x20 - 1280x960@60Hz */
    { DRM_MODE("1280x960", DRM_MODE_TYPE_DRIVER, 108000, 1280, 1376,
           1488, 1800, 0, 960, 961, 964, 1000, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x21 - 1280x960@85Hz */
    { DRM_MODE("1280x960", DRM_MODE_TYPE_DRIVER, 148500, 1280, 1344,
           1504, 1728, 0, 960, 961, 964, 1011, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x22 - 1280x960@120Hz RB */
    { DRM_MODE("1280x960", DRM_MODE_TYPE_DRIVER, 175500, 1280, 1328,
           1360, 1440, 0, 960, 963, 967, 1017, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x23 - 1280x1024@60Hz */
    { DRM_MODE("1280x1024", DRM_MODE_TYPE_DRIVER, 108000, 1280, 1328,
           1440, 1688, 0, 1024, 1025, 1028, 1066, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x24 - 1280x1024@75Hz */
    { DRM_MODE("1280x1024", DRM_MODE_TYPE_DRIVER, 135000, 1280, 1296,
           1440, 1688, 0, 1024, 1025, 1028, 1066, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x25 - 1280x1024@85Hz */
    { DRM_MODE("1280x1024", DRM_MODE_TYPE_DRIVER, 157500, 1280, 1344,
           1504, 1728, 0, 1024, 1025, 1028, 1072, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x26 - 1280x1024@120Hz RB */
    { DRM_MODE("1280x1024", DRM_MODE_TYPE_DRIVER, 187250, 1280, 1328,
           1360, 1440, 0, 1024, 1027, 1034, 1084, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x27 - 1360x768@60Hz */
    { DRM_MODE("1360x768", DRM_MODE_TYPE_DRIVER, 85500, 1360, 1424,
           1536, 1792, 0, 768, 771, 777, 795, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x28 - 1360x768@120Hz RB */
    { DRM_MODE("1360x768", DRM_MODE_TYPE_DRIVER, 148250, 1360, 1408,
           1440, 1520, 0, 768, 771, 776, 813, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x51 - 1366x768@60Hz */
    { DRM_MODE("1366x768", DRM_MODE_TYPE_DRIVER, 85500, 1366, 1436,
           1579, 1792, 0, 768, 771, 774, 798, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x56 - 1366x768@60Hz */
    { DRM_MODE("1366x768", DRM_MODE_TYPE_DRIVER, 72000, 1366, 1380,
           1436, 1500, 0, 768, 769, 772, 800, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x29 - 1400x1050@60Hz RB */
    { DRM_MODE("1400x1050", DRM_MODE_TYPE_DRIVER, 101000, 1400, 1448,
           1480, 1560, 0, 1050, 1053, 1057, 1080, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x2a - 1400x1050@60Hz */
    { DRM_MODE("1400x1050", DRM_MODE_TYPE_DRIVER, 121750, 1400, 1488,
           1632, 1864, 0, 1050, 1053, 1057, 1089, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x2b - 1400x1050@75Hz */
    { DRM_MODE("1400x1050", DRM_MODE_TYPE_DRIVER, 156000, 1400, 1504,
           1648, 1896, 0, 1050, 1053, 1057, 1099, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x2c - 1400x1050@85Hz */
    { DRM_MODE("1400x1050", DRM_MODE_TYPE_DRIVER, 179500, 1400, 1504,
           1656, 1912, 0, 1050, 1053, 1057, 1105, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x2d - 1400x1050@120Hz RB */
    { DRM_MODE("1400x1050", DRM_MODE_TYPE_DRIVER, 208000, 1400, 1448,
           1480, 1560, 0, 1050, 1053, 1057, 1112, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x2e - 1440x900@60Hz RB */
    { DRM_MODE("1440x900", DRM_MODE_TYPE_DRIVER, 88750, 1440, 1488,
           1520, 1600, 0, 900, 903, 909, 926, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x2f - 1440x900@60Hz */
    { DRM_MODE("1440x900", DRM_MODE_TYPE_DRIVER, 106500, 1440, 1520,
           1672, 1904, 0, 900, 903, 909, 934, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x30 - 1440x900@75Hz */
    { DRM_MODE("1440x900", DRM_MODE_TYPE_DRIVER, 136750, 1440, 1536,
           1688, 1936, 0, 900, 903, 909, 942, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x31 - 1440x900@85Hz */
    { DRM_MODE("1440x900", DRM_MODE_TYPE_DRIVER, 157000, 1440, 1544,
           1696, 1952, 0, 900, 903, 909, 948, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x32 - 1440x900@120Hz RB */
    { DRM_MODE("1440x900", DRM_MODE_TYPE_DRIVER, 182750, 1440, 1488,
           1520, 1600, 0, 900, 903, 909, 953, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x53 - 1600x900@60Hz */
    { DRM_MODE("1600x900", DRM_MODE_TYPE_DRIVER, 108000, 1600, 1624,
           1704, 1800, 0, 900, 901, 904, 1000, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x33 - 1600x1200@60Hz */
    { DRM_MODE("1600x1200", DRM_MODE_TYPE_DRIVER, 162000, 1600, 1664,
           1856, 2160, 0, 1200, 1201, 1204, 1250, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x34 - 1600x1200@65Hz */
    { DRM_MODE("1600x1200", DRM_MODE_TYPE_DRIVER, 175500, 1600, 1664,
           1856, 2160, 0, 1200, 1201, 1204, 1250, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x35 - 1600x1200@70Hz */
    { DRM_MODE("1600x1200", DRM_MODE_TYPE_DRIVER, 189000, 1600, 1664,
           1856, 2160, 0, 1200, 1201, 1204, 1250, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x36 - 1600x1200@75Hz */
    { DRM_MODE("1600x1200", DRM_MODE_TYPE_DRIVER, 202500, 1600, 1664,
           1856, 2160, 0, 1200, 1201, 1204, 1250, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x37 - 1600x1200@85Hz */
    { DRM_MODE("1600x1200", DRM_MODE_TYPE_DRIVER, 229500, 1600, 1664,
           1856, 2160, 0, 1200, 1201, 1204, 1250, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x38 - 1600x1200@120Hz RB */
    { DRM_MODE("1600x1200", DRM_MODE_TYPE_DRIVER, 268250, 1600, 1648,
           1680, 1760, 0, 1200, 1203, 1207, 1271, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x39 - 1680x1050@60Hz RB */
    { DRM_MODE("1680x1050", DRM_MODE_TYPE_DRIVER, 119000, 1680, 1728,
           1760, 1840, 0, 1050, 1053, 1059, 1080, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x3a - 1680x1050@60Hz */
    { DRM_MODE("1680x1050", DRM_MODE_TYPE_DRIVER, 146250, 1680, 1784,
           1960, 2240, 0, 1050, 1053, 1059, 1089, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x3b - 1680x1050@75Hz */
    { DRM_MODE("1680x1050", DRM_MODE_TYPE_DRIVER, 187000, 1680, 1800,
           1976, 2272, 0, 1050, 1053, 1059, 1099, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x3c - 1680x1050@85Hz */
    { DRM_MODE("1680x1050", DRM_MODE_TYPE_DRIVER, 214750, 1680, 1808,
           1984, 2288, 0, 1050, 1053, 1059, 1105, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x3d - 1680x1050@120Hz RB */
    { DRM_MODE("1680x1050", DRM_MODE_TYPE_DRIVER, 245500, 1680, 1728,
           1760, 1840, 0, 1050, 1053, 1059, 1112, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x3e - 1792x1344@60Hz */
    { DRM_MODE("1792x1344", DRM_MODE_TYPE_DRIVER, 204750, 1792, 1920,
           2120, 2448, 0, 1344, 1345, 1348, 1394, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x3f - 1792x1344@75Hz */
    { DRM_MODE("1792x1344", DRM_MODE_TYPE_DRIVER, 261000, 1792, 1888,
           2104, 2456, 0, 1344, 1345, 1348, 1417, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x40 - 1792x1344@120Hz RB */
    { DRM_MODE("1792x1344", DRM_MODE_TYPE_DRIVER, 333250, 1792, 1840,
           1872, 1952, 0, 1344, 1347, 1351, 1423, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x41 - 1856x1392@60Hz */
    { DRM_MODE("1856x1392", DRM_MODE_TYPE_DRIVER, 218250, 1856, 1952,
           2176, 2528, 0, 1392, 1393, 1396, 1439, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x42 - 1856x1392@75Hz */
    { DRM_MODE("1856x1392", DRM_MODE_TYPE_DRIVER, 288000, 1856, 1984,
           2208, 2560, 0, 1392, 1393, 1396, 1500, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x43 - 1856x1392@120Hz RB */
    { DRM_MODE("1856x1392", DRM_MODE_TYPE_DRIVER, 356500, 1856, 1904,
           1936, 2016, 0, 1392, 1395, 1399, 1474, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },

        //FIXME_YANGYANG  1920x1080@30Hz
    { DRM_MODE("1920x1080", DRM_MODE_TYPE_DRIVER, 74250, 1920, 2008,
           2052, 2200, 0, 1080, 1084, 1089, 1125, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
       /* 1080x1920@60Hz */
    { DRM_MODE("1080x1920", DRM_MODE_TYPE_DRIVER, 148500, 1080, 1084,
                1089, 1125, 0,1920, 2008,2052, 2200, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC) },

    /* 1920x1080@60Hz */
    { DRM_MODE("1920x1080", DRM_MODE_TYPE_DRIVER, 148500, 1920, 2008,
           2052, 2200, 0, 1080, 1084, 1089, 1125, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x44 - 1920x1200@60Hz RB */
    { DRM_MODE("1920x1200", DRM_MODE_TYPE_DRIVER, 154000, 1920, 1968,
           2000, 2080, 0, 1200, 1203, 1209, 1235, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x45 - 1920x1200@60Hz */
    { DRM_MODE("1920x1200", DRM_MODE_TYPE_DRIVER, 193250, 1920, 2056,
           2256, 2592, 0, 1200, 1203, 1209, 1245, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x46 - 1920x1200@75Hz */
    { DRM_MODE("1920x1200", DRM_MODE_TYPE_DRIVER, 245250, 1920, 2056,
           2264, 2608, 0, 1200, 1203, 1209, 1255, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x47 - 1920x1200@85Hz */
    { DRM_MODE("1920x1200", DRM_MODE_TYPE_DRIVER, 281250, 1920, 2064,
           2272, 2624, 0, 1200, 1203, 1209, 1262, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x48 - 1920x1200@120Hz RB */
    { DRM_MODE("1920x1200", DRM_MODE_TYPE_DRIVER, 317000, 1920, 1968,
           2000, 2080, 0, 1200, 1203, 1209, 1271, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x49 - 1920x1440@60Hz */
    { DRM_MODE("1920x1440", DRM_MODE_TYPE_DRIVER, 234000, 1920, 2048,
           2256, 2600, 0, 1440, 1441, 1444, 1500, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x4a - 1920x1440@75Hz */
    { DRM_MODE("1920x1440", DRM_MODE_TYPE_DRIVER, 297000, 1920, 2064,
           2288, 2640, 0, 1440, 1441, 1444, 1500, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x4b - 1920x1440@120Hz RB */
    { DRM_MODE("1920x1440", DRM_MODE_TYPE_DRIVER, 380500, 1920, 1968,
           2000, 2080, 0, 1440, 1443, 1447, 1525, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x54 - 2048x1152@60Hz */
    { DRM_MODE("2048x1152", DRM_MODE_TYPE_DRIVER, 162000, 2048, 2074,
           2154, 2250, 0, 1152, 1153, 1156, 1200, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x4c - 2560x1600@60Hz RB */
    { DRM_MODE("2560x1600", DRM_MODE_TYPE_DRIVER, 268500, 2560, 2608,
           2640, 2720, 0, 1600, 1603, 1609, 1646, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x4d - 2560x1600@60Hz */
    { DRM_MODE("2560x1600", DRM_MODE_TYPE_DRIVER, 348500, 2560, 2752,
           3032, 3504, 0, 1600, 1603, 1609, 1658, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x4e - 2560x1600@75Hz */
    { DRM_MODE("2560x1600", DRM_MODE_TYPE_DRIVER, 443250, 2560, 2768,
           3048, 3536, 0, 1600, 1603, 1609, 1672, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x4f - 2560x1600@85Hz */
    { DRM_MODE("2560x1600", DRM_MODE_TYPE_DRIVER, 505250, 2560, 2768,
           3048, 3536, 0, 1600, 1603, 1609, 1682, 0,
           DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
    /* 0x50 - 2560x1600@120Hz RB */
    { DRM_MODE("2560x1600", DRM_MODE_TYPE_DRIVER, 552750, 2560, 2608,
           2640, 2720, 0, 1600, 1603, 1609, 1694, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },

        //FIXME_YANGYANG 3840*2160 30
       { DRM_MODE("3840x2160", DRM_MODE_TYPE_DRIVER, 297000, 3840, 4016,
                    4104, 4400, 0, 2160, 2168, 2178, 2250, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC)},
    //FIXME_YANGYANG 3840*2160 60
    { DRM_MODE("3840x2160", DRM_MODE_TYPE_DRIVER, 594000, 3840, 4016,
           4104, 4400, 0, 2160, 2168, 2178, 2250, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC)},
    //FIXME_YANGYANG 7680*4320  30
    { DRM_MODE("7680x4320", DRM_MODE_TYPE_DRIVER, 1188000, 7680, 8032,
           8208, 8800, 0, 4320, 4336, 4356, 4500, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC)},
   //FIXME_YANGYANG 7680*4320  60
    { DRM_MODE("7680x4320", DRM_MODE_TYPE_DRIVER, 1188000*2, 7680, 8032,
           8208, 8800, 0, 4320, 4336, 4356, 4500, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC)},
    //FIXME_YANGYANG 3840*2160 120
        { DRM_MODE("3840x2160", DRM_MODE_TYPE_DRIVER, 1188000, 3840, 4016,
                       4104, 4400, 0, 2160, 2168, 2178, 2250, 0,
                       DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC)},
    /* 0x57 - 4096x2160@60Hz RB */
    { DRM_MODE("4096x2160", DRM_MODE_TYPE_DRIVER, 556744, 4096, 4104,
           4136, 4176, 0, 2160, 2208, 2216, 2222, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
    /* 0x58 - 4096x2160@59.94Hz RB */
    { DRM_MODE("4096x2160", DRM_MODE_TYPE_DRIVER, 556188, 4096, 4104,
           4136, 4176, 0, 2160, 2208, 2216, 2222, 0,
           DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
};

static enum drm_connector_status
vencoder_detect(struct vencoder *vencoder, struct drm_connector *connector)
{
    enum drm_connector_status status;

         //if(vencoder->type == VENCODER_1)
    //status = connector_status_disconnected;
    status = connector_status_connected;
    vencoder->status = status;
    return status;

}

static enum drm_mode_status vencoder_mode_valid(struct vencoder *vencoder,
                  struct drm_display_mode *mode)
{
    return MODE_OK;
}

/*
static void vencoder_mode_set(struct vencoder *vencoder,
                 const struct drm_display_mode *mode,
                 const struct drm_display_mode *adj_mode)
{
    return;
}
*/
/* -----------------------------------------------------------------------------
 * DRM Connector Operations
 */

static struct vencoder *connector_to_vencoder(struct drm_connector *connector)
{
    return container_of(connector, struct vencoder, connector);
}

static int vencoder_connector_get_modes(struct drm_connector *connector)
{
    //struct vencoder *venc = connector_to_vencoder(connector);
    return 0;
}


static enum drm_mode_status
vencoder_encoder_mode_valid(struct drm_encoder *encoder,
                        const struct drm_display_mode *mode)
{
    int i = 0, count = ARRAY_SIZE(drm_dmt_modes);
    for (i = 0; i < count; i++) {
        const struct drm_display_mode *ptr = &drm_dmt_modes[i];
        if(ptr->hdisplay == mode->hdisplay &&
            ptr->vdisplay == mode->vdisplay &&
            ptr->clock == mode->clock &&
            ptr->hdisplay == mode->hdisplay &&
            ptr->clock/(ptr->htotal*ptr->vtotal) == mode->clock/(mode->htotal*mode->vtotal))
        {
            return MODE_OK;
        }
    }
    return MODE_NOMODE;
}

static enum drm_mode_status
vencoder_connector_mode_valid(struct drm_connector *connector,
                 struct drm_display_mode *mode)
{
    struct vencoder *venc = connector_to_vencoder(connector);
    return vencoder_mode_valid(venc, mode);
}

static struct drm_connector_helper_funcs vencoder_connector_helper_funcs = {
    .get_modes = vencoder_connector_get_modes,
    .mode_valid = vencoder_connector_mode_valid,
};

static enum drm_connector_status
vencoder_connector_detect(struct drm_connector *connector, bool force)
{
    struct vencoder *adv = connector_to_vencoder(connector);

    return vencoder_detect(adv, connector);
}

static const struct drm_connector_funcs vencoder_connector_funcs = {
    .fill_modes = drm_helper_probe_single_connector_modes,
    .detect = vencoder_connector_detect,
    .destroy = drm_connector_cleanup,
    .reset = drm_atomic_helper_connector_reset,
    .atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
    .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
};

static int vencoder_connector_init(struct vencoder *adv)
{
    struct drm_bridge *bridge = &adv->bridge;
    int ret;

    if (!bridge->encoder) {
        DRM_ERROR("Parent encoder object not found");
        return -ENODEV;
    }


    ret = drm_connector_init(bridge->dev, &adv->connector,
                 &vencoder_connector_funcs,
                 DRM_MODE_CONNECTOR_HDMIA);
    if (ret < 0) {
        DRM_ERROR("Failed to initialize connector with drm\n");
        return ret;
    }
    drm_connector_helper_add(&adv->connector,
                 &vencoder_connector_helper_funcs);
    drm_connector_attach_encoder(&adv->connector, bridge->encoder);

    return 0;
}

/* -----------------------------------------------------------------------------
 * DRM Bridge Operations
 */

static struct vencoder *bridge_to_vencoder(struct drm_bridge *bridge)
{
    return container_of(bridge, struct vencoder, bridge);
}

static void vencoder_bridge_enable(struct drm_bridge *bridge)
{
    return;
}

static void vencoder_bridge_disable(struct drm_bridge *bridge)
{
    return;
}

static void vencoder_bridge_mode_set(struct drm_bridge *bridge,
                    const struct drm_display_mode *mode,
                    const struct drm_display_mode *adj_mode)
{
    return;

}

static int vencoder_bridge_attach(struct drm_bridge *bridge,
                 enum drm_bridge_attach_flags flags)
{
    struct vencoder *adv = bridge_to_vencoder(bridge);
    int ret = 0;

    if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
        ret = vencoder_connector_init(adv);
        if (ret < 0)
            return ret;
    }

    return ret;
}

static enum drm_connector_status vencoder_bridge_detect(struct drm_bridge *bridge)
{
    struct vencoder *adv = bridge_to_vencoder(bridge);

    return vencoder_detect(adv, NULL);
}



static const struct drm_bridge_funcs vencoder_bridge_funcs = {
    .enable = vencoder_bridge_enable,
    .disable = vencoder_bridge_disable,
    .mode_set = vencoder_bridge_mode_set,
    .attach = vencoder_bridge_attach,
    .detect = vencoder_bridge_detect,
};

static void vencoder_encoder_destroy(struct drm_encoder *encoder)
{
    drm_encoder_cleanup(encoder);
}

static const struct drm_encoder_funcs vencoder_encoder_funcs = {
    .destroy = vencoder_encoder_destroy,
};

static const struct drm_encoder_helper_funcs vencoder_encoder_helper_funcs = {
    .mode_valid = vencoder_encoder_mode_valid,
};

static int vencoder_encoder_init(struct device *dev, struct drm_device *drm)
{
    struct vencoder *priv = dev_get_drvdata(dev);
    u32 crtcs = 0;
    int ret;
    printk(" %s - %d  vencoder id %d \n",__func__,__LINE__,priv->type);

    if (dev->of_node)
        crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);

    /* If no CRTCs were found, fall back to our old behaviour */
    if (crtcs == 0) {
        dev_err(dev, "Falling back to first CRTC\n");
        //FIXME
        //crtcs = 0xf;
    }

    priv->encoder.possible_crtcs = crtcs;
    dev_err(dev, "possible_crtcs %x\n",crtcs);

    ret = drm_encoder_init(drm, &priv->encoder, &vencoder_encoder_funcs,
                   DRM_MODE_ENCODER_TMDS, NULL);
    if (ret)
        goto err_encoder;
    printk(" %s - %d \n",__func__,__LINE__);

    drm_encoder_helper_add(&priv->encoder,
                 &vencoder_encoder_helper_funcs);

    ret = drm_bridge_attach(&priv->encoder, &priv->bridge, NULL,0);
    if (ret)
        goto err_bridge;

        printk(" %s - %d \n",__func__,__LINE__);
    return 0;

err_bridge:
    drm_encoder_cleanup(&priv->encoder);
err_encoder:
    return ret;
}

static int vencoder_bind(struct device *dev, struct device *master, void *data)
{
    struct drm_device *drm = data;

    return vencoder_encoder_init(dev, drm);
}


static void drm_vencoder_unbind(struct device *dev, struct device *master,
                void *data)
{
    struct vencoder *priv = dev_get_drvdata(dev);

    drm_connector_unregister(&priv->connector);
    drm_connector_cleanup(&priv->connector);
    drm_encoder_cleanup(&priv->encoder);

}

static const struct component_ops vencoder_ops = {
    .bind = vencoder_bind,
    .unbind = drm_vencoder_unbind,
};


static int drm_vencoder_probe(struct platform_device *pdev)
{
struct vencoder *vencoder;
    vencoder = devm_kzalloc(&pdev->dev, sizeof(*vencoder), GFP_KERNEL);
    if (!vencoder)
        return -ENOMEM;

dev_set_drvdata(&pdev->dev, vencoder);

    vencoder->bridge.funcs = &vencoder_bridge_funcs;
    vencoder->bridge.ops = DRM_BRIDGE_OP_DETECT;
    vencoder->bridge.of_node = pdev->dev.of_node;
    vencoder->bridge.type = DRM_MODE_CONNECTOR_HDMIA;

    drm_bridge_add(&vencoder->bridge);

    if (pdev->dev.of_node)
        vencoder->type = (enum vencoder_type)of_device_get_match_data(&pdev->dev);
    else
        vencoder->type = VENCODER_0;

    printk("%s is called type %d \n",__func__,vencoder->type);
    return component_add(&pdev->dev, &vencoder_ops);
}


static int drm_vencoder_remove(struct platform_device *pdev)
{

    component_del(&pdev->dev, &vencoder_ops);

    return 0;
}

static const struct of_device_id vencoder_of_ids[] = {
    { .compatible = "drm,virtual-encoder0",.data=(void *)VENCODER_0},
    { .compatible = "drm,virtual-encoder1",.data=(void *)VENCODER_1},
    { .compatible = "drm,virtual-encoder2",.data=(void *)VENCODER_2},
    { .compatible = "drm,virtual-encoder3",.data=(void *)VENCODER_3},
    { }
};
MODULE_DEVICE_TABLE(of, vencoder_of_ids);

static struct platform_driver  drm_vencoder_driver = {
    .driver = {
            .owner		= THIS_MODULE,
            .name = "vencoder",
            .of_match_table = vencoder_of_ids,
    },
    .probe = drm_vencoder_probe,
    .remove = drm_vencoder_remove,
};

module_platform_driver(drm_vencoder_driver);

MODULE_DESCRIPTION("virtual encoder");
MODULE_LICENSE("GPL");
