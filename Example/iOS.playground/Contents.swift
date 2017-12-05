//: Playground - noun: a place where people can play

import UIKit
import NGAEssentials

var str = "Hello, playground"
let result = str.AES256Encrypt(key: "abab".md5())
result.iv
result.encrypted

result.encrypted?.AES256Decrypt(key: "abab".md5(), iv: result.iv)
