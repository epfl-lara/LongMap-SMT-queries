; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135320 () Bool)

(assert start!135320)

(declare-fun res!1075030 () Bool)

(declare-fun e!878116 () Bool)

(assert (=> start!135320 (=> (not res!1075030) (not e!878116))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135320 (= res!1075030 (validMask!0 mask!889))))

(assert (=> start!135320 e!878116))

(assert (=> start!135320 true))

(declare-datatypes ((array!105100 0))(
  ( (array!105101 (arr!50711 (Array (_ BitVec 32) (_ BitVec 64))) (size!51262 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105100)

(declare-fun array_inv!39666 (array!105100) Bool)

(assert (=> start!135320 (array_inv!39666 _keys!600)))

(declare-fun b!1574539 () Bool)

(declare-fun res!1075029 () Bool)

(assert (=> b!1574539 (=> (not res!1075029) (not e!878116))))

(assert (=> b!1574539 (= res!1075029 (= (size!51262 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1574540 () Bool)

(declare-fun res!1075031 () Bool)

(assert (=> b!1574540 (=> (not res!1075031) (not e!878116))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574540 (= res!1075031 (validKeyInArray!0 k!754))))

(declare-fun b!1574541 () Bool)

(declare-datatypes ((SeekEntryResult!13518 0))(
  ( (MissingZero!13518 (index!56470 (_ BitVec 32))) (Found!13518 (index!56471 (_ BitVec 32))) (Intermediate!13518 (undefined!14330 Bool) (index!56472 (_ BitVec 32)) (x!141443 (_ BitVec 32))) (Undefined!13518) (MissingVacant!13518 (index!56473 (_ BitVec 32))) )
))
(declare-fun lt!674763 () SeekEntryResult!13518)

(assert (=> b!1574541 (= e!878116 (and (is-Intermediate!13518 lt!674763) (not (undefined!14330 lt!674763)) (not (= (select (arr!50711 _keys!600) (index!56472 lt!674763)) k!754)) (not (= (select (arr!50711 _keys!600) (index!56472 lt!674763)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50711 _keys!600) (index!56472 lt!674763)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105100 (_ BitVec 32)) SeekEntryResult!13518)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574541 (= lt!674763 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135320 res!1075030) b!1574539))

(assert (= (and b!1574539 res!1075029) b!1574540))

(assert (= (and b!1574540 res!1075031) b!1574541))

(declare-fun m!1448217 () Bool)

(assert (=> start!135320 m!1448217))

(declare-fun m!1448219 () Bool)

(assert (=> start!135320 m!1448219))

(declare-fun m!1448221 () Bool)

(assert (=> b!1574540 m!1448221))

(declare-fun m!1448223 () Bool)

(assert (=> b!1574541 m!1448223))

(declare-fun m!1448225 () Bool)

(assert (=> b!1574541 m!1448225))

(assert (=> b!1574541 m!1448225))

(declare-fun m!1448227 () Bool)

(assert (=> b!1574541 m!1448227))

(push 1)

(assert (not b!1574541))

(assert (not b!1574540))

(assert (not start!135320))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1574569 () Bool)

(declare-fun lt!674771 () SeekEntryResult!13518)

(assert (=> b!1574569 (and (bvsge (index!56472 lt!674771) #b00000000000000000000000000000000) (bvslt (index!56472 lt!674771) (size!51262 _keys!600)))))

(declare-fun res!1075049 () Bool)

(assert (=> b!1574569 (= res!1075049 (= (select (arr!50711 _keys!600) (index!56472 lt!674771)) k!754))))

(declare-fun e!878135 () Bool)

(assert (=> b!1574569 (=> res!1075049 e!878135)))

(declare-fun e!878138 () Bool)

(assert (=> b!1574569 (= e!878138 e!878135)))

(declare-fun b!1574570 () Bool)

(declare-fun e!878136 () SeekEntryResult!13518)

(declare-fun e!878137 () SeekEntryResult!13518)

(assert (=> b!1574570 (= e!878136 e!878137)))

(declare-fun c!146015 () Bool)

(declare-fun lt!674772 () (_ BitVec 64))

(assert (=> b!1574570 (= c!146015 (or (= lt!674772 k!754) (= (bvadd lt!674772 lt!674772) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1574571 () Bool)

(assert (=> b!1574571 (= e!878137 (Intermediate!13518 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1574572 () Bool)

(assert (=> b!1574572 (= e!878136 (Intermediate!13518 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1574573 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574573 (= e!878137 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1574574 () Bool)

(assert (=> b!1574574 (and (bvsge (index!56472 lt!674771) #b00000000000000000000000000000000) (bvslt (index!56472 lt!674771) (size!51262 _keys!600)))))

(declare-fun res!1075047 () Bool)

(assert (=> b!1574574 (= res!1075047 (= (select (arr!50711 _keys!600) (index!56472 lt!674771)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1574574 (=> res!1075047 e!878135)))

(declare-fun b!1574575 () Bool)

(declare-fun e!878134 () Bool)

(assert (=> b!1574575 (= e!878134 e!878138)))

(declare-fun res!1075048 () Bool)

(assert (=> b!1574575 (= res!1075048 (and (is-Intermediate!13518 lt!674771) (not (undefined!14330 lt!674771)) (bvslt (x!141443 lt!674771) #b01111111111111111111111111111110) (bvsge (x!141443 lt!674771) #b00000000000000000000000000000000) (bvsge (x!141443 lt!674771) #b00000000000000000000000000000000)))))

(assert (=> b!1574575 (=> (not res!1075048) (not e!878138))))

(declare-fun d!165417 () Bool)

(assert (=> d!165417 e!878134))

(declare-fun c!146014 () Bool)

(assert (=> d!165417 (= c!146014 (and (is-Intermediate!13518 lt!674771) (undefined!14330 lt!674771)))))

(assert (=> d!165417 (= lt!674771 e!878136)))

(declare-fun c!146013 () Bool)

(assert (=> d!165417 (= c!146013 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165417 (= lt!674772 (select (arr!50711 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!165417 (validMask!0 mask!889)))

(assert (=> d!165417 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!674771)))

(declare-fun b!1574576 () Bool)

(assert (=> b!1574576 (and (bvsge (index!56472 lt!674771) #b00000000000000000000000000000000) (bvslt (index!56472 lt!674771) (size!51262 _keys!600)))))

(assert (=> b!1574576 (= e!878135 (= (select (arr!50711 _keys!600) (index!56472 lt!674771)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1574577 () Bool)

(assert (=> b!1574577 (= e!878134 (bvsge (x!141443 lt!674771) #b01111111111111111111111111111110))))

(assert (= (and d!165417 c!146013) b!1574572))

(assert (= (and d!165417 (not c!146013)) b!1574570))

(assert (= (and b!1574570 c!146015) b!1574571))

(assert (= (and b!1574570 (not c!146015)) b!1574573))

(assert (= (and d!165417 c!146014) b!1574577))

(assert (= (and d!165417 (not c!146014)) b!1574575))

(assert (= (and b!1574575 res!1075048) b!1574569))

(assert (= (and b!1574569 (not res!1075049)) b!1574574))

(assert (= (and b!1574574 (not res!1075047)) b!1574576))

(assert (=> b!1574573 m!1448225))

(declare-fun m!1448241 () Bool)

(assert (=> b!1574573 m!1448241))

(assert (=> b!1574573 m!1448241))

(declare-fun m!1448243 () Bool)

(assert (=> b!1574573 m!1448243))

(declare-fun m!1448245 () Bool)

(assert (=> b!1574576 m!1448245))

(assert (=> b!1574569 m!1448245))

(assert (=> b!1574574 m!1448245))

(assert (=> d!165417 m!1448225))

(declare-fun m!1448247 () Bool)

(assert (=> d!165417 m!1448247))

(assert (=> d!165417 m!1448217))

(assert (=> b!1574541 d!165417))

(declare-fun d!165427 () Bool)

(declare-fun lt!674778 () (_ BitVec 32))

(declare-fun lt!674777 () (_ BitVec 32))

(assert (=> d!165427 (= lt!674778 (bvmul (bvxor lt!674777 (bvlshr lt!674777 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165427 (= lt!674777 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165427 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1075050 (let ((h!38263 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141446 (bvmul (bvxor h!38263 (bvlshr h!38263 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141446 (bvlshr x!141446 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1075050 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1075050 #b00000000000000000000000000000000))))))

(assert (=> d!165427 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!674778 (bvlshr lt!674778 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1574541 d!165427))

(declare-fun d!165429 () Bool)

(assert (=> d!165429 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1574540 d!165429))

(declare-fun d!165431 () Bool)

(assert (=> d!165431 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135320 d!165431))

(declare-fun d!165433 () Bool)

(assert (=> d!165433 (= (array_inv!39666 _keys!600) (bvsge (size!51262 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135320 d!165433))

(push 1)

(assert (not b!1574573))

(assert (not d!165417))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

