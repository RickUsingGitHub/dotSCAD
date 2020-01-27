use <unittest.scad>;
use <golden_spiral.scad>;

module test_golden_spiral() {
    echo("==== test_golden_spiral ====");

    pts_angles = golden_spiral(
        from = 3, 
        to = 10, 
        point_distance = 1
    );
    
    expected_pts =  [[2, 0], [1.84776, 0.765367], [1.41421, 1.41421], [0.765367, 1.84776], [0, 2], [-0.927051, 1.85317], [-1.76336, 1.42705], [-2.42705, 0.763356], [-2.85317, -0.072949], [-3, -1], [-2.90393, -1.97545], [-2.6194, -2.91342], [-2.15735, -3.77785], [-1.53553, -4.53553], [-0.777851, -5.15735], [0.0865828, -5.6194], [1.02455, -5.90393], [2, -6], [2.96429, -5.94167], [3.91453, -5.76753], [4.83684, -5.48013], [5.71779, -5.08365], [6.54452, -4.58387], [7.30498, -3.98809], [7.98809, -3.30498], [8.58387, -2.54452], [9.08365, -1.71779], [9.48013, -0.836839], [9.76753, 0.0854747], [9.94167, 1.03571], [10, 2], [10, 2], [9.96365, 2.97149], [9.8548, 3.93755], [9.67406, 4.89277], [9.42245, 5.83182], [9.10136, 6.74943], [8.7126, 7.64049], [8.25833, 8.5], [7.7411, 9.32316], [7.16381, 10.1054], [6.52967, 10.8422], [5.84225, 11.5297], [5.10537, 12.1638], [4.32316, 12.7411], [3.5, 13.2583], [2.64049, 13.7126], [1.74943, 14.1014], [0.831817, 14.4224], [-0.107228, 14.6741], [-1.06245, 14.8548], [-2.02851, 14.9636], [-3, 15], [-3.99922, 14.9762], [-4.99618, 14.9049], [-5.98861, 14.7863], [-6.97428, 14.6205], [-7.95094, 14.408], [-8.91638, 14.1494], [-9.86843, 13.845], [-10.8049, 13.4957], [-11.7237, 13.1023], [-12.6228, 12.6655], [-13.5, 12.1865], [-14.3535, 11.6663], [-15.1812, 11.1061], [-15.9813, 10.5071], [-16.7521, 9.87074], [-17.4917, 9.19841], [-18.1984, 8.49166], [-18.8707, 7.75208], [-19.5071, 6.98134], [-20.1061, 6.1812], [-20.6663, 5.35346], [-21.1865, 4.5], [-21.6655, 3.62276], [-22.1023, 2.72372], [-22.4957, 1.80491], [-22.845, 0.868427], [-23.1494, -0.0836163], [-23.408, -1.04906], [-23.6205, -2.02572], [-23.7863, -3.01139], [-23.9049, -4.00382], [-23.9762, -5.00078], [-24, -6], [-23.9856, -6.98888], [-23.9425, -7.97692], [-23.8706, -8.9633], [-23.7701, -9.94716], [-23.641, -10.9277], [-23.4835, -11.904], [-23.2976, -12.8754], [-23.0835, -13.8409], [-22.8415, -14.7998], [-22.5716, -15.7513], [-22.2742, -16.6945], [-21.9495, -17.6287], [-21.5978, -18.553], [-21.2193, -19.4667], [-20.8145, -20.369], [-20.3835, -21.2592], [-19.9268, -22.1364], [-19.4449, -23], [-18.938, -23.8492], [-18.4066, -24.6833], [-17.8512, -25.5016], [-17.2722, -26.3034], [-16.6701, -27.088], [-16.0455, -27.8548], [-15.3989, -28.6031], [-14.7307, -29.3322], [-14.0416, -30.0416], [-13.3322, -30.7307], [-12.6031, -31.3989], [-11.8548, -32.0455], [-11.088, -32.6701], [-10.3034, -33.2722], [-9.5016, -33.8512], [-8.68331, -34.4066], [-7.8492, -34.938], [-7, -35.4449], [-6.13641, -35.9268], [-5.25917, -36.3835], [-4.36902, -36.8145], [-3.46671, -37.2193], [-2.55301, -37.5978], [-1.62868, -37.9495], [-0.694522, -38.2742], [0.24869, -38.5716], [1.20015, -38.8415], [2.15906, -39.0835], [3.1246, -39.2976], [4.09596, -39.4835], [5.07232, -39.641], [6.05284, -39.7701], [7.0367, -39.8706], [8.02308, -39.9425], [9.01112, -39.9856], [10, -40], [10.993, -39.991], [11.9856, -39.9641], [12.9776, -39.9193], [13.9687, -39.8566], [14.9584, -39.776], [15.9465, -39.6776], [16.9327, -39.5613], [17.9167, -39.4273], [18.898, -39.2755], [19.8765, -39.106], [20.8517, -38.9188], [21.8234, -38.7141], [22.7912, -38.4919], [23.7549, -38.2523], [24.7141, -37.9952], [25.6684, -37.721], [26.6177, -37.4295], [27.5616, -37.1209], [28.4997, -36.7954], [29.4318, -36.4529], [30.3576, -36.0937], [31.2767, -35.7179], [32.1889, -35.3255], [33.0939, -34.9166], [33.9913, -34.4916], [34.881, -34.0504], [35.7625, -33.5932], [36.6356, -33.1201], [37.5, -32.6314], [38.3555, -32.1271], [39.2017, -31.6075], [40.0384, -31.0727], [40.8653, -30.5229], [41.6821, -29.9582], [42.4887, -29.3789], [43.2846, -28.7851], [44.0697, -28.1771], [44.8436, -27.5549], [45.6062, -26.9189], [46.3573, -26.2692], [47.0964, -25.6061], [47.8235, -24.9298], [48.5382, -24.2404], [49.2404, -23.5382], [49.9298, -22.8235], [50.6061, -22.0964], [51.2692, -21.3573], [51.9189, -20.6062], [52.5549, -19.8436], [53.1771, -19.0697], [53.7851, -18.2846], [54.3789, -17.4887], [54.9582, -16.6821], [55.5229, -15.8653], [56.0727, -15.0384], [56.6075, -14.2017], [57.1271, -13.3555], [57.6314, -12.5], [58.1201, -11.6356], [58.5932, -10.7625], [59.0504, -9.88096], [59.4916, -8.99134], [59.9166, -8.0939], [60.3255, -7.18893], [60.7179, -6.27673], [61.0937, -5.3576], [61.4529, -4.43183], [61.7954, -3.49972], [62.1209, -2.56158], [62.4295, -1.61772], [62.721, -0.668445], [62.9952, 0.285941], [63.2523, 1.24512], [63.4919, 2.20879], [63.7141, 3.17663], [63.9188, 4.14832], [64.106, 5.12354], [64.2755, 6.10199], [64.4273, 7.08334], [64.5613, 8.06727], [64.6776, 9.05345], [64.776, 10.0416], [64.8566, 11.0313], [64.9193, 12.0224], [64.9641, 13.0144], [64.991, 14.007], [65, 15]];  
    actual_pts = [for(pt_angle = pts_angles) pt_angle[0]];   
    
    expected_angles =  [0, 22.5, 45, 67.5, 90, 108, 126, 144, 162, 180, 191.25, 202.5, 213.75, 225, 236.25, 247.5, 258.75, 270, 276.923, 283.846, 290.769, 297.692, 304.615, 311.538, 318.462, 325.385, 332.308, 339.231, 346.154, 353.077, 360, 360, 364.286, 368.571, 372.857, 377.143, 381.429, 385.714, 390, 394.286, 398.571, 402.857, 407.143, 411.429, 415.714, 420, 424.286, 428.571, 432.857, 437.143, 441.429, 445.714, 450, 452.727, 455.455, 458.182, 460.909, 463.636, 466.364, 469.091, 471.818, 474.545, 477.273, 480, 482.727, 485.455, 488.182, 490.909, 493.636, 496.364, 499.091, 501.818, 504.545, 507.273, 510, 512.727, 515.455, 518.182, 520.909, 523.636, 526.364, 529.091, 531.818, 534.545, 537.273, 540, 541.667, 543.333, 545, 546.667, 548.333, 550, 551.667, 553.333, 555, 556.667, 558.333, 560, 561.667, 563.333, 565, 566.667, 568.333, 570, 571.667, 573.333, 575, 576.667, 578.333, 580, 581.667, 583.333, 585, 586.667, 588.333, 590, 591.667, 593.333, 595, 596.667, 598.333, 600, 601.667, 603.333, 605, 606.667, 608.333, 610, 611.667, 613.333, 615, 616.667, 618.333, 620, 621.667, 623.333, 625, 626.667, 628.333, 630, 631.034, 632.069, 633.103, 634.138, 635.172, 636.207, 637.241, 638.276, 639.31, 640.345, 641.379, 642.414, 643.448, 644.483, 645.517, 646.552, 647.586, 648.621, 649.655, 650.69, 651.724, 652.759, 653.793, 654.828, 655.862, 656.897, 657.931, 658.966, 660, 661.034, 662.069, 663.103, 664.138, 665.172, 666.207, 667.241, 668.276, 669.31, 670.345, 671.379, 672.414, 673.448, 674.483, 675.517, 676.552, 677.586, 678.621, 679.655, 680.69, 681.724, 682.759, 683.793, 684.828, 685.862, 686.897, 687.931, 688.966, 690, 691.034, 692.069, 693.103, 694.138, 695.172, 696.207, 697.241, 698.276, 699.31, 700.345, 701.379, 702.414, 703.448, 704.483, 705.517, 706.552, 707.586, 708.621, 709.655, 710.69, 711.724, 712.759, 713.793, 714.828, 715.862, 716.897, 717.931, 718.966, 720];
    actual_angles = [for(pt_angle = pts_angles) pt_angle[1]];
    
    assertEqualPoints(expected_pts, actual_pts);
    
    for(i = [0:len(expected_angles) - 1]) {
        assertEqualNum(
           expected_angles[i], 
           actual_angles[i],
           0.0005
        );
    }
}

test_golden_spiral();