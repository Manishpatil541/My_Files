

// let nums = [10,20,30,40,50,60,70,80,90]
// let position = 3 - 1 
// let index = 0
// let array = []

// const remove_nums = (int_list) => {
//     let len_list = int_list.length
//     while (len_list > 0){
//         index = (position + index) % len_list
//         len_list -= 1
//         array.push(int_list[index])
//     }
//     console.log(array)
// }
// remove_nums(nums)


// let string = "Gooogle googggggle"
// let new_string = string.toLowerCase()

// let getMax = function (str) {
//     let max = 0,
//         maxChar = '';
//      str.split('').forEach(function(char){
//        if(str.split(char).length > max) {
//            max = str.split(char).length;
//            maxChar = char;
//         }
//      });
//      console.log(maxChar)

//    };

// getMax(new_string)

// Write a program to find the product of two array of numbers

// let arr1 = [2,3,4,5];
// let arr2 = [4,3,3,1];
// let product = [];
// for(let i=0; i< arr1.length; i++) {
//    product.push(arr1[i]*arr2[i])
// }

// console.log(product)

function happy_num(n) {
   const next = (n) => {
     let happy = 0;
     for (const digit of `${n}`) {
       happy += (+digit) ** 2;
     }
     return happy;
   };
   while (n !== 1 && n !== 4) n = next(n);
   return n === 1;
 }
 
 console.log(happy_num(82));
