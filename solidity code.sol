Day-1

code1:
     pragma solidity ^0.8.17;

     contract Helloworld{
          string public greet+"Hello world!";
      }
 
 counter App:
      pragma solidity ^0.8.17;
      contract Counter{
            uint public count;
            function get() public view return (uint){
                 return count;
            }
            function inc() public{
                 count+=1;
             }
             function dec() public{
                 count-=1;
             }
     }


2.Primitive datatypes
     -boolean
     -uint256=uint
     -int256=int
     -address

  pragma solidity ^0.8.17;
  contract Primitives{
        bool public too=true;

        unit8 public u8=1;
        unit public u256=456;
        unit public u=123;

        int public minInt=type(int).min;
        int public maxInt=type(int).max;

        address public addr=0xCads258vbdy83FHN77Jgmk89Jmc;

        bytes a=0xb5;
        bytes b=0x56;

        //unassigned are default variables
        bool public defaultboo;
        unit public defaultuint;
        int public defaultint;
        address public defaultaddr;
   }
  
  
 3.Variables
  -3 types 
     -local-declared inside a function,not stored on blockchain
     -state-declared outside a function,stored on blockchain
     -global
     
     pragma solidity ^0.8.17;
     contract variables{
        //state variables
         string public text="Hello world"
         unit public num=123;
          
         function do() public{
         //local variables
         unit i=456;
         
         //global variables
         unit timestamp=block.timestamp//current block timestamp
         address sender=msg.sender;//address of caller
         }
     }


4.Constants
     Their value is hard coded and using constants can save gas cost.
     pragma solidity ^0.8.17;
     contract constants{
         address public constant my_addr=0x77777bgmjueduj7287YHVHYJF386nc;
         unit public constant my_uint=123;
     }
    
    
5.Immutable
     Immutable variables are like constants. 
     Values of immutable variables can be set inside the constructor but cannot be modified afterwards.
     pragma solidity ^0.8.17;
     contract Immutable{
              address public immutable my_addr;
              address public immutable my_uint;
              constructor(uint myuint){
                  my_addr=msg.sender;
                  my_uint=myuint;
               }
      }






Day-2

6.Reading and writing to a state variable
    -To write or update a state variable you need to send a transaction.
    -you can read state variables, for free, without any transaction fee.
    
     pragma solidity ^0.8.17;
     contract simplestorage{
          uint public num;
          function set(unit _num) public {
               num=_num
          }
          function get() public view returns (unit){
               return num;
           }
      }
      
      
7.Ether and wei
     -transactions are paid with ether
     -1 ether=10**18 wei
     
     pragma solidity ^0.8.17;
     contarct EtherUnits{
          uint public onewei=1 wei;
          bool public isOnewei=1 wei==1;
          
          unit public oneether=1ether;
          bool public isoneether=1ether=1e18;
     }


8.Gas
      How much ether do you need to pay for a transsaction?
      =gas spent*gas price amount of ether
      -gas is a unit of computation
      -gas spent is the total amount of gas used in transaction
      -gas price is how much ether you are willing to pay per gas

      -transactions with higher gas prices have higher priorirty to be included in a block
      -unspent gas will be refunded

      Gas limit
      There are two upper bounds to the amount of gas you can spend
      -gas limit(set by you)
      -block gas limit(set by network)


     pragma solidity ^0.8.17;
     contract Gas{
          uint public i=0;
          function forever() public{
          //all the gas are spent in a tranasaction
               while(true){
                    i+=1;
              }
         }
     }
     
     
9.if,else if,else
     
     pragma solidity ^0.8.17;
     contract ifelse{
          function foo(uint x) public pure returns (uint){
               if(x<10){
                    return 0;
               }
               else if(x<20){
                    return 1;
               }
               else{
                    return 2;
               }
          }
          function ternary(uint _x) public pure returns (uint){
               return x_<10?1:2;
            }
     }
     

10.For,while,dowhile
     -If we write loops that are unbounded, this can hit the gas limit, causing your transaction to fail.
     -while and do while loops are rarely used
     pragma solidity ^0.8.17;
     contract loop{
          function loop() public{
               //for loop
               for(uint i=0;i,10;i++){
                    if(i==3){
                         continue;
                    }
                    if(i==5){
                         break;
                    }
                }
                unit j;
                while(j<10){
                    j++;
               }
            }
         }
   
   
   
   
   
 Day-3
 
 
 11.Maps
     Maps are created with the syntax mapping(keytype=>valuetype)
     keytype-type,bytes,string,or any contract
     valuetype-any type including mapping or an array
     
     contract Mapping{
          mapping(address=>uint) public mymap;
          function get(address add) public view returns (uint){
               return mymap[add];
          }
          function set(address add,uint i) public{
               mymap[add]=i;
          }
          function remove(add add) public{
               delete mymap[add];
          }
     }
  
     Nested mapping
     
     contract nestedmapping{
          mapping(address=>mapping(uint=>bool)) public nested;
          function get(address add,uint i) public view returns (bool){
               return nested[add][i];
          }
          function set(address add,uint i,bool boo) public{
               nested[add][i]=boo;
          }
          function remove(address add,uint i) public{
               delete nested[add][i];
          }
    }
    
    

12.Arrays
     Array can have a compile-time fixed size or a dynamic size.
     pragma solidity ^0.8.17;
     contract array{
          uint[] public arr;
          uint[] public arr1=[1,2,3];
          uint[10] public myarr;
          function get(uint i) public view (uint){
               return arr[i];
          }
          function getarr()  public view return (uint[] memory){
               return arr;
          }
          function push(uint i) public{
               arr.push(i);
          }
          function pop(uint i)public{
               arr.push(i);
          }
          function getlength() public view returns (uint){
               return arr.length;
          }
          function remove(uint index) public{
               delete arr[index];
          }
          function example() external{
               uint[] memory a=new uint[](5);
          }
     }
     
     Remove array element by shifting elements from right to left

     pragma solidity 0.8.17;
     contract ArrayRemoveByShifting{
          uint[] public arr;
          function  remove(uint index) public{
               require(index<arr.length,"index out of bound");
               for(uint i=index;i<arr.length-1;i++){
                    arr[i]=arr[i+1];
                }
                arr[i]=arr[i+1];
           }
           arr.pop();
       }
       function test() external{
          arr=[1,2,3,4,5]
          remove(2);
          assert(arr[0]==1);
          assert(arr[1]==2);
          assert(arr[2]==4);
          assert(arr[3]==5);
          arr=[1];
          remove(0);
          assert(arr.length==0);
          }
       }
       
      Remove array element by copying last element into to the place to remove

      pragma solidity ^0.8.17;
      contract arrayreplacefound{
          uint[] public arr;
          function remove(uint index) public{
               for(uint i=index;i<arr.length-1;i++){
                    arr[index]=arr[arr.length-1];
               }
               arr.pop();
           }
           function test() public{
               arr=[1,2,3,4];
               remove(1);
               assert(arr.length==3);
               assert(arr[0]==1);
               assert(arr[2]==2);
               assert(arr[2]=3);
                
               remove(2);
               assert(arr.length==2);
               assert(arr[0]==1);
               assert(arr[1]==4);
          }
   }
          
Day-4

Enum
Solidity supports enumerables 
Enums declared outside of contract
           
  
  
          
             
     



























