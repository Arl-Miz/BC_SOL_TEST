// SPDX-License-Identifier:MIT
pragma solidity ^0.8.8;


contract SeulAot{

// memeory/mapping/enums/...
// enums set limits


    uint256 monNumero ;

    mapping(address => uint256) public addressToNum;
    // mapping(address => string) public addressToName;

    // mapping(uint256 => address) public numberToAddress;
    // mapping(string => address) public nameToAddress;


    enum bNCurse {bn1,bn2,bn3}
    bNCurse currentChoice;
    bNCurse constant defualtChoice = bNCurse.bn3;
    
    function set1() public {
        currentChoice = bNCurse.bn2;
    }
    function getCurse() public view returns(bNCurse){
        return currentChoice;
        
    }

    // store number
    // fn get user number by address
    // fn get user name by address
    // fn export user number by address
    // fn export user name by address

    function getUNBA(uint256 _num) public  returns(uint){
         addressToNum[msg.sender] = _num;
        //  addressToName[msg.sender] = _name;
        return(addressToNum[msg.sender]);
        // addressToName[msg.sender] = _name;
    
    }

    // function exUNBA(uint256 _num,string memory _name) public view returns(uint256 add_) {

    //     // add_ = addressToName;

    //     return(
    //     // addressToName[_num] = msg.sender 

    //     );
    // }


}