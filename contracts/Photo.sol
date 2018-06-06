pragma solidity ^0.4.23;

import "./Ownable.sol";
import "./Safemath.sol";

contract Photo is Ownable {
    using SafeMath for uint256;
    using SafeMath32 for uint32;
    using SafeMath16 for uint16;

    event NewPhoto(uint photoId, string name, uint value);

    struct PhotoStruct {
        string title;
        uint value;
    }
    string tokenId;

    PhotoStruct[] public photos;

    mapping (uint => address) public photoToOwner;
    mapping (address => uint) ownerPhotoCount;

    function createPhoto(string _title, uint _value) public {
        uint id = photos.push(PhotoStruct(_title, _value)) - 1;
        photoToOwner[id] = msg.sender;
        ownerPhotoCount[msg.sender] = ownerPhotoCount[msg.sender].add(1);
        emit NewPhoto(id, _title, _value);
    }

    function setId(string id) public {
        tokenId = id;
    }

    function getId() public view returns (string) {
        return tokenId;
    }
}
