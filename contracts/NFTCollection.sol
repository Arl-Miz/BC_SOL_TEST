//SPDX-License-Identifier:MIT
pragma solidity ^0.8.8;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol';
import '@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol';
import '@openzeppelin/contracts/utils/math/SafeMath.sol';
import '@openzeppelin/contracts/access/Ownable.sol';



contract Collection is ERC721,ERC721URIStorage,ERC721Enumerable,Ownable {
    using SafeMath for uint256;
    uint256 public constant mintPrice=0;
    uint256 public _totalSupply;
    uint256 public maxSupply;
    bool public toggleMint;

    mapping(address => uint256) public MintCounter;

    constructor() payable ERC721("My NFTs", "MNFTs"){
        maxSupply = 2;
    }
    function _beforeTokenTransfer(address from, address _to, uint256 tokenId)  internal 
    override(ERC721,ERC721Enumerable){
        super._beforeTokenTransfer(from,_to,tokenId);
    }
    function _burn(uint256 tokenId) internal 
    override(ERC721,ERC721URIStorage){
        super._burn(tokenId);
    }
    function tokenURI(uint256 tokenId) public view 
    override(ERC721, ERC721URIStorage) 
     returns(string memory){
        return super.tokenURI(tokenId);
    }
    function supportsInterface(bytes4 interfaceId) public view 
    override(ERC721, ERC721Enumerable)
    returns(bool){
        return super.supportsInterface(interfaceId);
    }

    function toggleIsMintEnable() public onlyOwner{
        toggleMint = !toggleMint;
    }

    function setMaxSupply(uint256 _maxSupply) public onlyOwner () {
        maxSupply = _maxSupply;

    }

    function mint(string memory _uri) public payable{
        require(toggleMint,"minting not active");
        require(maxSupply > _totalSupply,"sold out");
        require(MintCounter[msg.sender] < 1 ,"you mint your nft before with this account");
        require(msg.value == mintPrice,"wrong value");

        MintCounter[msg.sender]++;

        _totalSupply++;
        uint256 tokenId = _totalSupply;

        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId,_uri);



    }

}