// initiate can volumes
const SMALL_CAN_VOL = 1,
  BIG_CAN_VOL = 5;

function canFill(bigCansCount, smallCansCount, bucketSize) {
  // if negative value passed - return false
  if (bigCansCount < 0 || smallCansCount < 0) {
    return false;
  }

  // calculate the number of full big cans that fit bucket
  let bigCansIn = Math.floor(bucketSize / BIG_CAN_VOL);

  // check if the value is not higher than the available number of big cans
  bigCansIn = bigCansCount > bigCansIn ? bigCansIn : bigCansCount;

  // subtract from bucket the amount we can fill with big cans
  bucketSize -= BIG_CAN_VOL * bigCansIn;

  // calculate the number of full small cans that fit bucket
  let smallCansIn = Math.floor(bucketSize / SMALL_CAN_VOL);

  // check if the value is not higher than the available number of small cans
  smallCansIn = smallCansCount > smallCansIn ? smallCansIn : smallCansCount;

  // subtract from bucket the amount we can fill with big cans
  bucketSize -= SMALL_CAN_VOL * smallCansIn;

  // return true if bucket was reduced to 0
  return !(bucketSize > 0);
}

// test cases
console.log(canFill(0, 2, 3), 'expected false');
console.log(canFill(2, 0, 9), 'expected false');
console.log(canFill(3, 0, 15), 'expected true');
console.log(canFill(4, 0, 15), 'expected true');
console.log(canFill(0, 3, 3), 'expected true');
console.log(canFill(1, 3, 3), 'expected true');
console.log(canFill(2, 2, 11), 'expected true');
console.log(canFill(-2, 1, 1), 'expected true');
console.log(canFill(-2, -1, 1), 'expected false');
console.log(canFill(2, 90, 100), 'expected true');
