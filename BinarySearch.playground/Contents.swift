
// Wrapper function, prepares the input for the main binary search function
func find<Element: Comparable>(array:Array<Element>, item:Element) -> Int {
    var tempHold:Array<(index: Int, item: Element)> = array.enumerated().map { ($0, $1) }   // Transform input array into appropriate format
    tempHold.sort { $0.item < $1.item }     // Sort the array into ascending format
    return findBinary(&tempHold, item)      // Initiate find
}

// Main Function: Implements a recursive binary search on the given array looking for the given element
// Pre-Condition: Input array must be sorted  in ascending order by the items in the tuples
private func findBinary<Element: Comparable>(_ array: inout Array<(index:Int, item:Element)>, _ item:Element) -> Int {
    guard array.count > 1 else {    // Guard for if there is only one element left in the array
        if array.first!.item == item { return 0 }   // If its a match
        else { return -1 }
    }
    let mid:Int = array.count/2     // Find the middle index
    if array[mid].item == item {    // Check for middle of array
        return array[mid].index
    } else if array[mid].item > item {              // Item is in lower half of array
        array.removeSubrange(mid..<array.count)     // Remove higher half
        return findBinary(&array, item)             // Recurse
    } else if array[mid].item < item {              // Item is in higher half of array
        array.removeSubrange(0..<mid)               // Remove lower half
        return findBinary(&array, item)             // Recurse
    }
    return -1
}


func test() {
    let ar5 = [2, 1, 3, 4, 9]
    let ar15 = [257, 7457, 4402, 5950, 3561, 9870, 963, 4325, 5715, 39, 1299, 1819, 9030, 4663, 4132]
    let ar50 = [7715, 9069, 1973, 3451, 949, 6289, 9710, 7494, 2357, 4619, 6702, 8183, 9700, 1370, 6513, 5333, 1152, 887, 3323, 1438, 6348, 5447, 9187, 1537, 4919, 1019, 2870, 1572, 6557, 7986, 1984, 8565, 2840, 8818, 7068, 4945, 3471, 257, 7741, 6425, 9588, 8071, 2442, 5807, 8091, 5923, 7691, 7670, 3594, 9856]
    let ar200 = [135, 3417, 5600, 6649, 9961, 6057, 707, 2767, 2545, 2783, 2615, 9874, 282, 9936, 1514, 8348, 6551, 8567, 9272, 4060, 7610, 2501, 7121, 3587, 1903, 8508, 9818, 7015, 6034, 8994, 1662, 3288, 3763, 2040, 1188, 4358, 8864, 8430, 2303, 6790, 5271, 1360, 4040, 878, 2346, 9143, 4747, 9003, 5380, 4067, 5523, 4437, 4477, 8391, 4113, 8127, 2205, 9263, 2709, 3138, 1440, 6780, 5098, 1316, 5893, 7750, 1722, 8089, 7033, 7756, 5538, 7574, 1553, 7782, 6646, 9499, 1361, 8357, 5511, 5335, 2289, 9494, 2270, 4932, 1242, 6777, 8527, 8043, 1874, 2573, 9273, 4175, 2381, 4741, 2799, 3124, 6779, 2902, 998, 4515, 1255, 4675, 8865, 8334, 6286, 8929, 4988, 3411, 9340, 4117, 6419, 236, 8353, 5618, 7205, 2226, 6936, 7373, 574, 6098, 5585, 7083, 1497, 6889, 9276, 7318, 9875, 4380, 6530, 4643, 7245, 809, 5240, 5021, 7715, 512, 2700, 6384, 8478, 348, 8917, 5209, 8556, 4824, 1690, 9106, 8420, 5144, 1411, 1822, 4052, 5518, 6196, 9984, 4958, 9092, 9976, 7151, 6039, 9898, 965, 3646, 2267, 1847, 4544, 7531, 9025, 6714, 6549, 7556, 6747, 4916, 131, 8014, 6858, 594, 249, 8580, 8728, 9757, 9617, 7105, 2745, 5507, 1091, 6940, 1579, 3446, 9380, 1728, 4504, 6682, 5539, 79, 6613, 8443, 9695, 7277, 6358, 9051]
    
    print ("Test 1 Passed: \(find(array: ar5, item: 9) == 4)")          // Test against a 5 element array
    print ("Test 2 Passed: \(find(array: ar15, item: 9030) == 12)")     // Test against a 15 element array
    print ("Test 3 Passed: \(find(array: ar50, item: 8071) == 41)")     // Test against a 50 element array
    print ("Test 4 Passed: \(find(array: ar200, item: 9499) == 75)")    // Test against a 200 element array
    print ("Test 5 Passed: \(find(array: ar5, item: 9499) == -1)")      // Not found case of a 5 element array
    print ("Test 6 Passed: \(find(array: ar50, item: 8070) == -1)")     // Not found case of a 50 element array
}

//test()

