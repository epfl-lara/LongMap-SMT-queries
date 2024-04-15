; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135304 () Bool)

(assert start!135304)

(declare-fun res!1074990 () Bool)

(declare-fun e!877395 () Bool)

(assert (=> start!135304 (=> (not res!1074990) (not e!877395))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135304 (= res!1074990 (validMask!0 mask!889))))

(assert (=> start!135304 e!877395))

(assert (=> start!135304 true))

(declare-datatypes ((array!105064 0))(
  ( (array!105065 (arr!50686 (Array (_ BitVec 32) (_ BitVec 64))) (size!51238 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105064)

(declare-fun array_inv!39622 (array!105064) Bool)

(assert (=> start!135304 (array_inv!39622 _keys!600)))

(declare-fun b!1573412 () Bool)

(declare-fun e!877397 () Bool)

(declare-datatypes ((SeekEntryResult!13634 0))(
  ( (MissingZero!13634 (index!56934 (_ BitVec 32))) (Found!13634 (index!56935 (_ BitVec 32))) (Intermediate!13634 (undefined!14446 Bool) (index!56936 (_ BitVec 32)) (x!141740 (_ BitVec 32))) (Undefined!13634) (MissingVacant!13634 (index!56937 (_ BitVec 32))) )
))
(declare-fun lt!674272 () SeekEntryResult!13634)

(assert (=> b!1573412 (= e!877397 (and (not (is-MissingVacant!13634 lt!674272)) (not (is-Found!13634 lt!674272)) (not (is-MissingZero!13634 lt!674272)) (not (is-Undefined!13634 lt!674272))))))

(declare-fun err!158 () SeekEntryResult!13634)

(assert (=> b!1573412 (= lt!674272 err!158)))

(assert (=> b!1573412 true))

(declare-fun b!1573410 () Bool)

(declare-fun res!1074987 () Bool)

(assert (=> b!1573410 (=> (not res!1074987) (not e!877395))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573410 (= res!1074987 (validKeyInArray!0 k!754))))

(declare-fun b!1573411 () Bool)

(assert (=> b!1573411 (= e!877395 e!877397)))

(declare-fun res!1074989 () Bool)

(assert (=> b!1573411 (=> (not res!1074989) (not e!877397))))

(declare-fun lt!674274 () Bool)

(declare-fun lt!674273 () SeekEntryResult!13634)

(assert (=> b!1573411 (= res!1074989 (and (or lt!674274 (not (undefined!14446 lt!674273))) (or lt!674274 (undefined!14446 lt!674273))))))

(assert (=> b!1573411 (= lt!674274 (not (is-Intermediate!13634 lt!674273)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105064 (_ BitVec 32)) SeekEntryResult!13634)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573411 (= lt!674273 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1573409 () Bool)

(declare-fun res!1074988 () Bool)

(assert (=> b!1573409 (=> (not res!1074988) (not e!877395))))

(assert (=> b!1573409 (= res!1074988 (= (size!51238 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(assert (= (and start!135304 res!1074990) b!1573409))

(assert (= (and b!1573409 res!1074988) b!1573410))

(assert (= (and b!1573410 res!1074987) b!1573411))

(assert (= (and b!1573411 res!1074989) b!1573412))

(declare-fun m!1446119 () Bool)

(assert (=> start!135304 m!1446119))

(declare-fun m!1446121 () Bool)

(assert (=> start!135304 m!1446121))

(declare-fun m!1446123 () Bool)

(assert (=> b!1573410 m!1446123))

(declare-fun m!1446125 () Bool)

(assert (=> b!1573411 m!1446125))

(assert (=> b!1573411 m!1446125))

(declare-fun m!1446127 () Bool)

(assert (=> b!1573411 m!1446127))

(push 1)

(assert (not b!1573411))

(assert (not b!1573410))

(assert (not start!135304))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1573449 () Bool)

(declare-fun e!877420 () SeekEntryResult!13634)

(declare-fun e!877419 () SeekEntryResult!13634)

(assert (=> b!1573449 (= e!877420 e!877419)))

(declare-fun c!145483 () Bool)

(declare-fun lt!674283 () (_ BitVec 64))

(assert (=> b!1573449 (= c!145483 (or (= lt!674283 k!754) (= (bvadd lt!674283 lt!674283) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1573450 () Bool)

(declare-fun lt!674284 () SeekEntryResult!13634)

(assert (=> b!1573450 (and (bvsge (index!56936 lt!674284) #b00000000000000000000000000000000) (bvslt (index!56936 lt!674284) (size!51238 _keys!600)))))

(declare-fun e!877421 () Bool)

(assert (=> b!1573450 (= e!877421 (= (select (arr!50686 _keys!600) (index!56936 lt!674284)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1573451 () Bool)

(assert (=> b!1573451 (and (bvsge (index!56936 lt!674284) #b00000000000000000000000000000000) (bvslt (index!56936 lt!674284) (size!51238 _keys!600)))))

(declare-fun res!1075004 () Bool)

(assert (=> b!1573451 (= res!1075004 (= (select (arr!50686 _keys!600) (index!56936 lt!674284)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1573451 (=> res!1075004 e!877421)))

(declare-fun b!1573452 () Bool)

(declare-fun e!877418 () Bool)

(assert (=> b!1573452 (= e!877418 (bvsge (x!141740 lt!674284) #b01111111111111111111111111111110))))

(declare-fun d!164819 () Bool)

(assert (=> d!164819 e!877418))

(declare-fun c!145482 () Bool)

(assert (=> d!164819 (= c!145482 (and (is-Intermediate!13634 lt!674284) (undefined!14446 lt!674284)))))

(assert (=> d!164819 (= lt!674284 e!877420)))

(declare-fun c!145481 () Bool)

(assert (=> d!164819 (= c!145481 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164819 (= lt!674283 (select (arr!50686 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!164819 (validMask!0 mask!889)))

(assert (=> d!164819 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!674284)))

(declare-fun b!1573453 () Bool)

(assert (=> b!1573453 (= e!877419 (Intermediate!13634 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573454 () Bool)

(declare-fun e!877422 () Bool)

(assert (=> b!1573454 (= e!877418 e!877422)))

(declare-fun res!1075003 () Bool)

(assert (=> b!1573454 (= res!1075003 (and (is-Intermediate!13634 lt!674284) (not (undefined!14446 lt!674284)) (bvslt (x!141740 lt!674284) #b01111111111111111111111111111110) (bvsge (x!141740 lt!674284) #b00000000000000000000000000000000) (bvsge (x!141740 lt!674284) #b00000000000000000000000000000000)))))

(assert (=> b!1573454 (=> (not res!1075003) (not e!877422))))

(declare-fun b!1573455 () Bool)

(assert (=> b!1573455 (and (bvsge (index!56936 lt!674284) #b00000000000000000000000000000000) (bvslt (index!56936 lt!674284) (size!51238 _keys!600)))))

(declare-fun res!1075005 () Bool)

(assert (=> b!1573455 (= res!1075005 (= (select (arr!50686 _keys!600) (index!56936 lt!674284)) k!754))))

(assert (=> b!1573455 (=> res!1075005 e!877421)))

(assert (=> b!1573455 (= e!877422 e!877421)))

(declare-fun b!1573456 () Bool)

(assert (=> b!1573456 (= e!877420 (Intermediate!13634 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573457 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573457 (= e!877419 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and d!164819 c!145481) b!1573456))

(assert (= (and d!164819 (not c!145481)) b!1573449))

(assert (= (and b!1573449 c!145483) b!1573453))

(assert (= (and b!1573449 (not c!145483)) b!1573457))

(assert (= (and d!164819 c!145482) b!1573452))

(assert (= (and d!164819 (not c!145482)) b!1573454))

(assert (= (and b!1573454 res!1075003) b!1573455))

(assert (= (and b!1573455 (not res!1075005)) b!1573451))

(assert (= (and b!1573451 (not res!1075004)) b!1573450))

(declare-fun m!1446129 () Bool)

(assert (=> b!1573451 m!1446129))

(assert (=> b!1573457 m!1446125))

(declare-fun m!1446131 () Bool)

(assert (=> b!1573457 m!1446131))

(assert (=> b!1573457 m!1446131))

(declare-fun m!1446133 () Bool)

(assert (=> b!1573457 m!1446133))

(assert (=> b!1573455 m!1446129))

(assert (=> d!164819 m!1446125))

(declare-fun m!1446135 () Bool)

(assert (=> d!164819 m!1446135))

(assert (=> d!164819 m!1446119))

(assert (=> b!1573450 m!1446129))

(assert (=> b!1573411 d!164819))

(declare-fun d!164829 () Bool)

(declare-fun lt!674296 () (_ BitVec 32))

(declare-fun lt!674295 () (_ BitVec 32))

(assert (=> d!164829 (= lt!674296 (bvmul (bvxor lt!674295 (bvlshr lt!674295 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164829 (= lt!674295 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164829 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1075009 (let ((h!38285 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141743 (bvmul (bvxor h!38285 (bvlshr h!38285 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141743 (bvlshr x!141743 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1075009 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1075009 #b00000000000000000000000000000000))))))

(assert (=> d!164829 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!674296 (bvlshr lt!674296 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1573411 d!164829))

(declare-fun d!164833 () Bool)

(assert (=> d!164833 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1573410 d!164833))

(declare-fun d!164835 () Bool)

(assert (=> d!164835 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135304 d!164835))

(declare-fun d!164843 () Bool)

(assert (=> d!164843 (= (array_inv!39622 _keys!600) (bvsge (size!51238 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135304 d!164843))

(push 1)

(assert (not b!1573457))

(assert (not d!164819))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

