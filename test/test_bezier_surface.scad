module test_bezier_surface() {
    echo("==== test_bezier_surface ====");

    include <unittest.scad>;
    include <bezier_curve.scad>;
    include <bezier_surface.scad>; 

    t_step = 0.05;
    thickness = 0.5;

    ctrl_pts = [
        [[0, 0, 20],  [60, 0, -35],   [90, 0, 60],    [200, 0, 5]],
        [[0, 50, 30], [100, 60, -25], [120, 50, 120], [200, 50, 5]],
        [[0, 100, 0], [60, 120, 35],  [90, 100, 60],  [200, 100, 45]],
        [[0, 150, 0], [60, 150, -35], [90, 180, 60],  [200, 150, 45]]
    ];
    
    expected =  [[[0, 0, 20], [0, 7.5, 21.2087], [0, 15, 21.87], [0, 22.5, 22.0362], [0, 30, 21.76], [0, 37.5, 21.0938], [0, 45, 20.09], [0, 52.5, 18.8012], [0, 60, 17.28], [0, 67.5, 15.5788], [0, 75, 13.75], [0, 82.5, 11.8462], [0, 90, 9.92], [0, 97.5, 8.02375], [0, 105, 6.21], [0, 112.5, 4.53125], [0, 120, 3.04], [0, 127.5, 1.78875], [0, 135, 0.83], [0, 142.5, 0.21625], [0, 150, 0]], [[8.78875, 0, 12.8375], [9.55074, 7.70258, 14.1825], [10.1565, 15.4023, 15.1296], [10.6188, 23.0962, 15.7065], [10.9502, 30.7815, 15.9407], [11.1634, 38.4552, 15.8601], [11.271, 46.1145, 15.4923], [11.2858, 53.7565, 14.865], [11.2204, 61.3783, 14.0059], [11.0874, 68.977, 12.9426], [10.8995, 76.5497, 11.703], [10.6695, 84.0936, 10.3146], [10.4098, 91.6057, 8.80514], [10.1333, 99.0832, 7.20235], [9.85258, 106.523, 5.5339], [9.58029, 113.923, 3.82748], [9.32911, 121.279, 2.11078], [9.1117, 128.589, 0.411491], [8.94073, 135.85, -1.2427], [8.82885, 143.059, -2.82409], [8.78875, 150.214, -4.305]], [[17.21, 0, 7.7], [18.6355, 7.86369, 9.25093], [19.7688, 15.7225, 10.5078], [20.6336, 23.5716, 11.4796], [21.2535, 31.4062, 12.1754], [21.6523, 39.2213, 12.6042], [21.8537, 47.012, 12.7752], [21.8814, 54.7737, 12.6973], [21.759, 62.5013, 12.3797], [21.5102, 70.19, 11.8313], [21.1588, 77.835, 11.0613], [20.7283, 85.4314, 10.0786], [20.2426, 92.9743, 8.89232], [19.7254, 100.459, 7.51155], [19.2002, 107.88, 5.94531], [18.6908, 115.234, 4.20266], [18.2209, 122.514, 2.29264], [17.8142, 129.717, 0.224314], [17.4943, 136.837, -1.99327], [17.285, 143.87, -4.35106], [17.21, 150.81, -6.84]], [[25.3463, 0, 4.3625], [27.3398, 7.98668, 6.17412], [28.9247, 15.9673, 7.75576], [30.1341, 23.936, 9.1033], [31.0011, 31.8865, 10.2126], [31.5589, 39.8129, 11.0797], [31.8405, 47.7092, 11.7003], [31.8792, 55.5694, 12.0704], [31.708, 63.3874, 12.1858], [31.3601, 71.1572, 12.0425], [30.8686, 78.8728, 11.6364], [30.2667, 86.5282, 10.9633], [29.5874, 94.1172, 10.0192], [28.864, 101.634, 8.79987], [28.1295, 109.072, 7.30128], [27.4171, 116.427, 5.51932], [26.76, 123.69, 3.44986], [26.1912, 130.858, 1.08881], [25.7439, 137.923, -1.56795], [25.4512, 144.879, -4.52452], [25.3463, 151.721, -7.785]], [[33.28, 0, 2.6], [35.7492, 8.07492, 4.71232], [37.7123, 16.1434, 6.62496], [39.2103, 24.1988, 8.32544], [40.2842, 32.2349, 9.80128], [40.975, 40.245, 11.04], [41.3238, 48.2227, 12.0291], [41.3717, 56.1616, 12.7562], [41.1597, 64.055, 13.2086], [40.7288, 71.8967, 13.3741], [40.12, 79.68, 13.24], [39.3744, 87.3985, 12.7939], [38.5331, 95.0458, 12.0234], [37.6371, 102.615, 10.9158], [36.7274, 110.1, 9.45888], [35.845, 117.495, 7.64], [35.031, 124.792, 5.44672], [34.3265, 131.986, 2.86656], [33.7725, 139.069, -0.11296], [33.41, 146.036, -3.50432], [33.28, 152.88, -7.32]], [[41.0938, 0, 2.1875], [43.9493, 8.13176, 4.62572], [46.2195, 16.2572, 6.86672], [47.9519, 24.37, 8.89373], [49.1938, 32.4638, 10.69], [49.9927, 40.5322, 12.2388], [50.3961, 48.5691, 13.5233], [50.4515, 56.5679, 14.5268], [50.2062, 64.5225, 15.2325], [49.7079, 72.4264, 15.6237], [49.0039, 80.2734, 15.6836], [48.1417, 88.0571, 15.3954], [47.1687, 95.7713, 14.7425], [46.1325, 103.409, 13.708], [45.0805, 110.965, 12.2752], [44.0601, 118.433, 10.4272], [43.1188, 125.805, 8.1475], [42.304, 133.076, 5.41916], [41.6633, 140.24, 2.22547], [41.244, 147.289, -1.45033], [41.0938, 154.219, -5.625]], [[48.87, 0, 2.9], [52.0256, 8.16056, 5.67454], [54.5343, 16.3154, 8.23239], [56.4487, 24.459, 10.5559], [57.821, 32.5855, 12.6275], [58.7039, 40.6894, 14.4295], [59.1497, 48.7649, 15.9443], [59.2109, 56.8064, 17.1543], [58.9399, 64.8082, 18.0418], [58.3892, 72.7646, 18.5891], [57.6113, 80.67, 18.7788], [56.6585, 88.5187, 18.593], [55.5833, 96.305, 18.0142], [54.4382, 104.023, 17.0248], [53.2756, 111.668, 15.6072], [52.148, 119.233, 13.7436], [51.1078, 126.713, 11.4165], [50.2074, 134.103, 8.6082], [49.4994, 141.396, 5.30111], [49.0361, 148.587, 1.47759], [48.87, 155.67, -2.88]], [[56.6912, 0, 4.5125], [60.0636, 8.16467, 7.61896], [62.7447, 16.3247, 10.4733], [64.7905, 24.4756, 13.0598], [66.2572, 32.6126, 15.3626], [67.2007, 40.7312, 17.3658], [67.6771, 48.8268, 19.0538], [67.7425, 56.8947, 20.4107], [67.4529, 64.9304, 21.4208], [66.8644, 72.9292, 22.0681], [66.033, 80.8866, 22.337], [65.0147, 88.7979, 22.2117], [63.8657, 96.6585, 21.6762], [62.6419, 104.464, 20.7149], [61.3995, 112.209, 19.312], [60.1944, 119.89, 17.4516], [59.0827, 127.502, 15.1179], [58.1205, 135.04, 12.2953], [57.3639, 142.5, 8.96774], [56.8687, 149.877, 5.11958], [56.6912, 157.166, 0.735]], [[64.64, 0, 6.8], [68.1489, 8.14746, 10.2192], [70.9386, 16.2917, 13.3409], [73.0672, 24.4294, 16.1531], [74.5933, 32.5574, 18.6438], [75.575, 40.6725, 20.8013], [76.0707, 48.7714, 22.6134], [76.1388, 56.8508, 24.0682], [75.8374, 64.9075, 25.1539], [75.2251, 72.9383, 25.8585], [74.36, 80.94, 26.17], [73.3005, 88.9093, 26.0765], [72.105, 96.8429, 25.5661], [70.8316, 104.738, 24.6268], [69.5389, 112.59, 23.2466], [68.285, 120.398, 21.4138], [67.1283, 128.156, 19.1162], [66.1272, 135.863, 16.3419], [65.3398, 143.515, 13.0791], [64.8247, 151.108, 9.31579], [64.64, 158.64, 5.04]], [[72.7988, 0, 9.5375], [76.3671, 8.11228, 13.2355], [79.2039, 16.2229, 16.5864], [81.3686, 24.3302, 19.5835], [82.9205, 32.4324, 22.2201], [83.9188, 40.528, 24.4893], [84.423, 48.6152, 26.3845], [84.4922, 56.6924, 27.8988], [84.1857, 64.7579, 29.0255], [83.563, 72.8101, 29.7579], [82.6833, 80.8472, 30.0892], [81.6059, 88.8676, 30.0126], [80.3901, 96.8696, 29.5215], [79.0952, 104.852, 28.6089], [77.7806, 112.812, 27.2682], [76.5054, 120.749, 25.4926], [75.3292, 128.661, 23.2754], [74.3111, 136.546, 20.6098], [73.5104, 144.402, 17.489], [72.9866, 152.229, 13.9064], [72.7988, 160.024, 9.855]], [[81.25, 0, 12.5], [84.8036, 8.0625, 16.428], [87.6288, 16.125, 19.9612], [89.7845, 24.1875, 23.0989], [91.33, 32.25, 25.84], [92.3242, 40.3125, 28.1836], [92.8263, 48.375, 30.1288], [92.8952, 56.4375, 31.6745], [92.59, 64.5, 32.82], [91.9698, 72.5625, 33.5642], [91.0938, 80.625, 33.9063], [90.0208, 88.6875, 33.8452], [88.81, 96.75, 33.38], [87.5205, 104.813, 32.5098], [86.2112, 112.875, 31.2337], [84.9414, 120.938, 29.5508], [83.77, 129, 27.46], [82.7561, 137.063, 24.9605], [81.9588, 145.125, 22.0512], [81.437, 153.188, 18.7314], [81.25, 161.25, 15]], [[90.0763, 0, 15.4625], [93.544, 8.00147, 19.5569], [96.301, 16.0046, 23.2168], [98.4047, 24.0111, 26.447], [99.9129, 32.0226, 29.2523], [100.883, 40.0407, 31.6376], [101.373, 48.0673, 33.6077], [101.44, 56.1038, 35.1675], [101.142, 64.1521, 36.3217], [100.537, 72.2137, 37.0751], [99.6823, 80.2903, 37.4327], [98.6353, 88.3837, 37.3991], [97.4537, 96.4954, 36.9793], [96.1953, 104.627, 36.1781], [94.9177, 112.781, 35.0003], [93.6785, 120.958, 33.4507], [92.5354, 129.159, 31.5342], [91.546, 137.388, 29.2555], [90.7679, 145.645, 26.6195], [90.2588, 153.932, 23.6311], [90.0763, 162.251, 20.295]], [[99.36, 0, 18.2], [102.674, 7.93254, 22.3824], [105.309, 15.8683, 26.1043], [107.319, 23.8106, 29.3755], [108.76, 31.7626, 32.2058], [109.688, 39.7275, 34.605], [110.156, 47.7086, 36.583], [110.22, 55.7092, 38.1497], [109.935, 63.7325, 39.3149], [109.357, 71.7817, 40.0884], [108.54, 79.86, 40.48], [107.539, 87.9707, 40.4996], [106.41, 96.1171, 40.1571], [105.208, 104.302, 39.4623], [103.987, 112.53, 38.425], [102.802, 120.802, 37.055], [101.71, 129.124, 35.3622], [100.765, 137.497, 33.3565], [100.021, 145.925, 31.0477], [99.5344, 154.412, 28.4456], [99.36, 162.96, 25.56]], [[109.184, 0, 20.4875], [112.279, 7.85908, 24.6648], [114.74, 15.7228, 28.3752], [116.617, 23.5957, 31.6322], [117.963, 31.4824, 34.449], [118.829, 39.3875, 36.8392], [119.267, 47.3157, 38.8162], [119.327, 55.2715, 40.3933], [119.061, 63.2596, 41.584], [118.521, 71.2845, 42.4017], [117.758, 79.3509, 42.8598], [116.823, 87.4634, 42.9718], [115.769, 95.6265, 42.751], [114.645, 103.845, 42.2108], [113.505, 112.123, 41.3647], [112.399, 120.466, 40.2262], [111.379, 128.878, 38.8085], [110.496, 137.364, 37.1251], [109.801, 145.928, 35.1894], [109.347, 154.574, 33.0149], [109.184, 163.309, 30.615]], [[119.63, 0, 22.1], [122.444, 7.78445, 26.1643], [124.682, 15.5746, 29.7809], [126.389, 23.376, 32.9648], [127.613, 31.1945, 35.7309], [128.401, 39.0356, 38.0939], [128.798, 46.9051, 40.0688], [128.853, 54.8086, 41.6703], [128.611, 62.7518, 42.9134], [128.12, 70.7404, 43.813], [127.426, 78.78, 44.3838], [126.576, 86.8763, 44.6407], [125.618, 95.035, 44.5986], [124.596, 103.262, 44.2723], [123.559, 111.562, 43.6767], [122.554, 119.942, 42.8267], [121.626, 128.407, 41.7371], [120.823, 136.962, 40.4228], [120.191, 145.614, 38.8986], [119.778, 154.368, 37.1794], [119.63, 163.23, 35.28]], [[130.781, 0, 22.8125], [133.256, 7.71199, 26.6409], [135.224, 15.4303, 30.0727], [136.725, 23.1613, 33.1212], [137.801, 30.9113, 35.8], [138.494, 38.6865, 38.1226], [138.843, 46.4934, 40.1023], [138.891, 54.3383, 41.7528], [138.679, 62.2275, 43.0875], [138.247, 70.1673, 44.1198], [137.637, 78.1641, 44.8633], [136.889, 86.2241, 45.3313], [136.046, 94.3538, 45.5375], [135.148, 102.559, 45.4952], [134.236, 110.847, 45.218], [133.352, 119.224, 44.7192], [132.536, 127.695, 44.0125], [131.83, 136.268, 43.1112], [131.275, 144.948, 42.0289], [130.912, 153.742, 40.779], [130.781, 162.656, 39.375]], [[142.72, 0, 22.4], [144.799, 7.64508, 25.855], [146.452, 15.2966, 29.0018], [147.714, 22.9612, 31.849], [148.618, 30.6451, 34.4051], [149.2, 38.355, 36.6788], [149.494, 46.0973, 38.6785], [149.534, 53.8784, 40.4129], [149.356, 61.705, 41.8906], [148.993, 69.5833, 43.1201], [148.48, 77.52, 44.11], [147.852, 85.5215, 44.8689], [147.144, 93.5942, 45.4054], [146.389, 101.745, 45.7281], [145.623, 109.98, 45.8455], [144.88, 118.305, 45.7663], [144.195, 126.728, 45.4989], [143.601, 135.254, 45.052], [143.135, 143.891, 44.4342], [142.829, 152.644, 43.654], [142.72, 161.52, 42.72]], [[155.529, 0, 20.6375], [157.16, 7.58707, 23.5668], [158.457, 15.1802, 26.3198], [159.446, 22.7853, 28.896], [160.155, 30.4085, 31.295], [160.612, 38.0558, 33.516], [160.842, 45.7333, 35.5587], [160.874, 53.4468, 37.4226], [160.734, 61.2026, 39.107], [160.449, 69.0065, 40.6115], [160.047, 76.8647, 41.9355], [159.555, 84.7831, 43.0785], [158.999, 92.7678, 44.04], [158.407, 100.825, 44.8195], [157.806, 108.96, 45.4164], [157.223, 117.18, 45.8303], [156.685, 125.49, 46.0605], [156.22, 133.896, 46.1067], [155.854, 142.405, 45.9681], [155.615, 151.022, 45.6444], [155.529, 159.754, 45.135]], [[169.29, 0, 17.3], [170.423, 7.54131, 19.5364], [171.324, 15.0875, 21.7779], [172.011, 22.6434, 24.0101], [172.504, 30.2138, 26.2182], [172.821, 37.8038, 28.388], [172.981, 45.418, 30.5047], [173.003, 53.0613, 32.5539], [172.906, 60.7387, 34.5211], [172.708, 68.455, 36.3917], [172.429, 76.215, 38.1513], [172.087, 84.0236, 39.7851], [171.701, 91.8857, 41.2789], [171.289, 99.8061, 42.6179], [170.872, 107.79, 43.7878], [170.467, 115.841, 44.7739], [170.094, 123.966, 45.5618], [169.77, 132.168, 46.1368], [169.516, 140.453, 46.4846], [169.35, 148.825, 46.5905], [169.29, 157.29, 46.44]], [[184.086, 0, 12.1625], [184.675, 7.51117, 13.5241], [185.142, 15.0252, 15.1275], [185.499, 22.545, 16.9388], [185.755, 30.0735, 18.9237], [185.92, 37.6136, 21.0481], [186.003, 45.168, 23.2779], [186.014, 52.7398, 25.5791], [185.964, 60.3317, 27.9173], [185.861, 67.9468, 30.2587], [185.716, 75.5878, 32.5689], [185.538, 83.2577, 34.8139], [185.338, 90.9593, 36.9597], [185.124, 98.6956, 38.9719], [184.908, 106.469, 40.8166], [184.697, 114.283, 42.4596], [184.503, 122.141, 43.8668], [184.336, 130.045, 45.0041], [184.204, 137.997, 45.8373], [184.117, 146.002, 46.3323], [184.086, 154.061, 46.455]], [[200, 0, 5], [200, 7.5, 5.29], [200, 15, 6.12], [200, 22.5, 7.43], [200, 30, 9.16], [200, 37.5, 11.25], [200, 45, 13.64], [200, 52.5, 16.27], [200, 60, 19.08], [200, 67.5, 22.01], [200, 75, 25], [200, 82.5, 27.99], [200, 90, 30.92], [200, 97.5, 33.73], [200, 105, 36.36], [200, 112.5, 38.75], [200, 120, 40.84], [200, 127.5, 42.57], [200, 135, 43.88], [200, 142.5, 44.71], [200, 150, 45]]];

    actual = bezier_surface(t_step, ctrl_pts);

    for(i = [0:len(expected) - 1]) {
        assertEqualPoints(expected[i], actual[i]);
    }

}

test_bezier_surface();