pragma solidity ^0.4.19;

import "./Photo.sol";
import "./ERC721.sol";
import "./Safemath.sol";

/// TODO: Replace this with natspec descriptions
contract Photo721 is Photo, ERC721 {

    using SafeMath for uint256;

    mapping (uint => address) photoApprovals;

    modifier onlyOwnerOf(uint _photoId) {
        require(msg.sender == photoToOwner[_photoId]);
        _;
    }

    function withdraw() external onlyOwner {
        owner.transfer(this.balance);
    }

    function balanceOf(address _owner) public view returns (uint256 _balance) {
        return ownerPhotoCount[_owner];
    }

    function ownerOf(uint256 _tokenId) public view returns (address _owner) {
        return photoToOwner[_tokenId];
    }

    function _transfer(address _from, address _to, uint256 _tokenId) private {
        ownerPhotoCount[_to] = ownerPhotoCount[_to].add(1);
        ownerPhotoCount[msg.sender] = ownerPhotoCount[msg.sender].sub(1);
        photoToOwner[_tokenId] = _to;
        Transfer(_from, _to, _tokenId);
    }

    function transfer(address _to, uint256 _tokenId) public onlyOwnerOf(_tokenId) {
        _transfer(msg.sender, _to, _tokenId);
    }

    function approve(address _to, uint256 _tokenId) public onlyOwnerOf(_tokenId) {
        photoApprovals[_tokenId] = _to;
        Approval(msg.sender, _to, _tokenId);
    }

    function takeOwnership(uint256 _tokenId) public {
        require(photoApprovals[_tokenId] == msg.sender);
        address owner = ownerOf(_tokenId);
        _transfer(owner, msg.sender, _tokenId);
    }
    
    function pay(address _to, uint256 _tokenId) public payable {
        require(msg.value == photos[_tokenId].value);
        approve(_to, _tokenId);
    }
}