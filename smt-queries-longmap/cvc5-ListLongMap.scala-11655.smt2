; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136712 () Bool)

(assert start!136712)

(declare-fun res!1078100 () Bool)

(declare-fun e!881082 () Bool)

(assert (=> start!136712 (=> (not res!1078100) (not e!881082))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136712 (= res!1078100 (validMask!0 mask!898))))

(assert (=> start!136712 e!881082))

(assert (=> start!136712 true))

(declare-datatypes ((array!105651 0))(
  ( (array!105652 (arr!50940 (Array (_ BitVec 32) (_ BitVec 64))) (size!51491 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105651)

(declare-fun array_inv!39895 (array!105651) Bool)

(assert (=> start!136712 (array_inv!39895 _keys!605)))

(declare-fun b!1579362 () Bool)

(declare-fun res!1078102 () Bool)

(assert (=> b!1579362 (=> (not res!1078102) (not e!881082))))

(assert (=> b!1579362 (= res!1078102 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51491 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1579365 () Bool)

(declare-datatypes ((SeekEntryResult!13699 0))(
  ( (MissingZero!13699 (index!57194 (_ BitVec 32))) (Found!13699 (index!57195 (_ BitVec 32))) (Intermediate!13699 (undefined!14511 Bool) (index!57196 (_ BitVec 32)) (x!142418 (_ BitVec 32))) (Undefined!13699) (MissingVacant!13699 (index!57197 (_ BitVec 32))) )
))
(declare-fun lt!676780 () SeekEntryResult!13699)

(declare-fun e!881084 () Bool)

(declare-fun k!761 () (_ BitVec 64))

(assert (=> b!1579365 (= e!881084 (and (not (is-Undefined!13699 lt!676780)) (ite (is-Found!13699 lt!676780) (not (= (select (arr!50940 _keys!605) (index!57195 lt!676780)) k!761)) (ite (is-MissingZero!13699 lt!676780) (not (= (select (arr!50940 _keys!605) (index!57194 lt!676780)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (is-MissingVacant!13699 lt!676780)) (not (= (select (arr!50940 _keys!605) (index!57197 lt!676780)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun err!218 () SeekEntryResult!13699)

(assert (=> b!1579365 (= lt!676780 err!218)))

(assert (=> b!1579365 true))

(declare-fun b!1579363 () Bool)

(declare-fun res!1078103 () Bool)

(assert (=> b!1579363 (=> (not res!1078103) (not e!881082))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1579363 (= res!1078103 (validKeyInArray!0 k!761))))

(declare-fun b!1579364 () Bool)

(assert (=> b!1579364 (= e!881082 e!881084)))

(declare-fun res!1078101 () Bool)

(assert (=> b!1579364 (=> (not res!1078101) (not e!881084))))

(declare-fun lt!676781 () Bool)

(declare-fun lt!676782 () SeekEntryResult!13699)

(assert (=> b!1579364 (= res!1078101 (and (or lt!676781 (not (undefined!14511 lt!676782))) (or lt!676781 (undefined!14511 lt!676782))))))

(assert (=> b!1579364 (= lt!676781 (not (is-Intermediate!13699 lt!676782)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105651 (_ BitVec 32)) SeekEntryResult!13699)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1579364 (= lt!676782 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136712 res!1078100) b!1579362))

(assert (= (and b!1579362 res!1078102) b!1579363))

(assert (= (and b!1579363 res!1078103) b!1579364))

(assert (= (and b!1579364 res!1078101) b!1579365))

(declare-fun m!1451573 () Bool)

(assert (=> start!136712 m!1451573))

(declare-fun m!1451575 () Bool)

(assert (=> start!136712 m!1451575))

(declare-fun m!1451577 () Bool)

(assert (=> b!1579365 m!1451577))

(declare-fun m!1451579 () Bool)

(assert (=> b!1579365 m!1451579))

(declare-fun m!1451581 () Bool)

(assert (=> b!1579365 m!1451581))

(declare-fun m!1451583 () Bool)

(assert (=> b!1579363 m!1451583))

(declare-fun m!1451585 () Bool)

(assert (=> b!1579364 m!1451585))

(assert (=> b!1579364 m!1451585))

(declare-fun m!1451587 () Bool)

(assert (=> b!1579364 m!1451587))

(push 1)

(assert (not b!1579364))

(assert (not start!136712))

(assert (not b!1579363))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1579384 () Bool)

(declare-fun e!881098 () SeekEntryResult!13699)

(declare-fun e!881095 () SeekEntryResult!13699)

(assert (=> b!1579384 (= e!881098 e!881095)))

(declare-fun c!146933 () Bool)

(declare-fun lt!676788 () (_ BitVec 64))

(assert (=> b!1579384 (= c!146933 (or (= lt!676788 k!761) (= (bvadd lt!676788 lt!676788) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1579385 () Bool)

(declare-fun e!881096 () Bool)

(declare-fun lt!676787 () SeekEntryResult!13699)

(assert (=> b!1579385 (= e!881096 (bvsge (x!142418 lt!676787) #b01111111111111111111111111111110))))

(declare-fun b!1579386 () Bool)

(declare-fun e!881097 () Bool)

(assert (=> b!1579386 (= e!881096 e!881097)))

(declare-fun res!1078110 () Bool)

(assert (=> b!1579386 (= res!1078110 (and (is-Intermediate!13699 lt!676787) (not (undefined!14511 lt!676787)) (bvslt (x!142418 lt!676787) #b01111111111111111111111111111110) (bvsge (x!142418 lt!676787) #b00000000000000000000000000000000) (bvsge (x!142418 lt!676787) #b00000000000000000000000000000000)))))

(assert (=> b!1579386 (=> (not res!1078110) (not e!881097))))

(declare-fun b!1579387 () Bool)

(assert (=> b!1579387 (= e!881098 (Intermediate!13699 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun d!166501 () Bool)

(assert (=> d!166501 e!881096))

(declare-fun c!146932 () Bool)

(assert (=> d!166501 (= c!146932 (and (is-Intermediate!13699 lt!676787) (undefined!14511 lt!676787)))))

(assert (=> d!166501 (= lt!676787 e!881098)))

(declare-fun c!146931 () Bool)

(assert (=> d!166501 (= c!146931 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!166501 (= lt!676788 (select (arr!50940 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!166501 (validMask!0 mask!898)))

(assert (=> d!166501 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!676787)))

(declare-fun b!1579388 () Bool)

(assert (=> b!1579388 (and (bvsge (index!57196 lt!676787) #b00000000000000000000000000000000) (bvslt (index!57196 lt!676787) (size!51491 _keys!605)))))

(declare-fun e!881099 () Bool)

(assert (=> b!1579388 (= e!881099 (= (select (arr!50940 _keys!605) (index!57196 lt!676787)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1579389 () Bool)

(assert (=> b!1579389 (and (bvsge (index!57196 lt!676787) #b00000000000000000000000000000000) (bvslt (index!57196 lt!676787) (size!51491 _keys!605)))))

(declare-fun res!1078111 () Bool)

(assert (=> b!1579389 (= res!1078111 (= (select (arr!50940 _keys!605) (index!57196 lt!676787)) k!761))))

(assert (=> b!1579389 (=> res!1078111 e!881099)))

(assert (=> b!1579389 (= e!881097 e!881099)))

(declare-fun b!1579390 () Bool)

(assert (=> b!1579390 (and (bvsge (index!57196 lt!676787) #b00000000000000000000000000000000) (bvslt (index!57196 lt!676787) (size!51491 _keys!605)))))

(declare-fun res!1078112 () Bool)

(assert (=> b!1579390 (= res!1078112 (= (select (arr!50940 _keys!605) (index!57196 lt!676787)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1579390 (=> res!1078112 e!881099)))

(declare-fun b!1579391 () Bool)

(assert (=> b!1579391 (= e!881095 (Intermediate!13699 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1579392 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1579392 (= e!881095 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!898) k!761 _keys!605 mask!898))))

(assert (= (and d!166501 c!146931) b!1579387))

(assert (= (and d!166501 (not c!146931)) b!1579384))

(assert (= (and b!1579384 c!146933) b!1579391))

(assert (= (and b!1579384 (not c!146933)) b!1579392))

(assert (= (and d!166501 c!146932) b!1579385))

(assert (= (and d!166501 (not c!146932)) b!1579386))

(assert (= (and b!1579386 res!1078110) b!1579389))

(assert (= (and b!1579389 (not res!1078111)) b!1579390))

(assert (= (and b!1579390 (not res!1078112)) b!1579388))

(declare-fun m!1451589 () Bool)

(assert (=> b!1579390 m!1451589))

(assert (=> b!1579392 m!1451585))

(declare-fun m!1451591 () Bool)

(assert (=> b!1579392 m!1451591))

(assert (=> b!1579392 m!1451591))

(declare-fun m!1451593 () Bool)

(assert (=> b!1579392 m!1451593))

(assert (=> b!1579388 m!1451589))

(assert (=> b!1579389 m!1451589))

(assert (=> d!166501 m!1451585))

(declare-fun m!1451595 () Bool)

(assert (=> d!166501 m!1451595))

(assert (=> d!166501 m!1451573))

(assert (=> b!1579364 d!166501))

(declare-fun d!166513 () Bool)

(declare-fun lt!676802 () (_ BitVec 32))

(declare-fun lt!676801 () (_ BitVec 32))

(assert (=> d!166513 (= lt!676802 (bvmul (bvxor lt!676801 (bvlshr lt!676801 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!166513 (= lt!676801 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!166513 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1078113 (let ((h!38347 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142421 (bvmul (bvxor h!38347 (bvlshr h!38347 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142421 (bvlshr x!142421 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1078113 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1078113 #b00000000000000000000000000000000))))))

(assert (=> d!166513 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!676802 (bvlshr lt!676802 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1579364 d!166513))

(declare-fun d!166515 () Bool)

(assert (=> d!166515 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136712 d!166515))

(declare-fun d!166521 () Bool)

(assert (=> d!166521 (= (array_inv!39895 _keys!605) (bvsge (size!51491 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136712 d!166521))

(declare-fun d!166523 () Bool)

(assert (=> d!166523 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1579363 d!166523))

(push 1)

(assert (not b!1579392))

(assert (not d!166501))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

