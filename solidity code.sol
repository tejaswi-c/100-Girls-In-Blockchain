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


Primitive datatypes
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
  
  
  Variables
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
