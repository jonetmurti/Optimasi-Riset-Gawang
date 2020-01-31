// Auto-generated. Do not edit!

// (in-package daho_vision.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class arrOfxGawang {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.xComponent = null;
    }
    else {
      if (initObj.hasOwnProperty('xComponent')) {
        this.xComponent = initObj.xComponent
      }
      else {
        this.xComponent = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type arrOfxGawang
    // Serialize message field [xComponent]
    bufferOffset = _arraySerializer.int32(obj.xComponent, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type arrOfxGawang
    let len;
    let data = new arrOfxGawang(null);
    // Deserialize message field [xComponent]
    data.xComponent = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.xComponent.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'daho_vision/arrOfxGawang';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'dbd9af7d26d3b4c7d9623e5d36caf99c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32[] xComponent
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new arrOfxGawang(null);
    if (msg.xComponent !== undefined) {
      resolved.xComponent = msg.xComponent;
    }
    else {
      resolved.xComponent = []
    }

    return resolved;
    }
};

module.exports = arrOfxGawang;
