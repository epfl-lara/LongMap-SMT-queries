; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135348 () Bool)

(assert start!135348)

(declare-fun b!1573698 () Bool)

(declare-fun res!1075092 () Bool)

(declare-fun e!877577 () Bool)

(assert (=> b!1573698 (=> (not res!1075092) (not e!877577))))

(declare-datatypes ((array!105132 0))(
  ( (array!105133 (arr!50719 (Array (_ BitVec 32) (_ BitVec 64))) (size!51269 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105132)

(declare-fun mask!889 () (_ BitVec 32))

(assert (=> b!1573698 (= res!1075092 (= (size!51269 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1573700 () Bool)

(declare-fun e!877575 () Bool)

(assert (=> b!1573700 (= e!877577 e!877575)))

(declare-fun res!1075094 () Bool)

(assert (=> b!1573700 (=> (not res!1075094) (not e!877575))))

(declare-fun lt!674542 () Bool)

(declare-datatypes ((SeekEntryResult!13632 0))(
  ( (MissingZero!13632 (index!56926 (_ BitVec 32))) (Found!13632 (index!56927 (_ BitVec 32))) (Intermediate!13632 (undefined!14444 Bool) (index!56928 (_ BitVec 32)) (x!141743 (_ BitVec 32))) (Undefined!13632) (MissingVacant!13632 (index!56929 (_ BitVec 32))) )
))
(declare-fun lt!674540 () SeekEntryResult!13632)

(assert (=> b!1573700 (= res!1075094 (and (or lt!674542 (not (undefined!14444 lt!674540))) (or lt!674542 (undefined!14444 lt!674540))))))

(assert (=> b!1573700 (= lt!674542 (not (is-Intermediate!13632 lt!674540)))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105132 (_ BitVec 32)) SeekEntryResult!13632)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573700 (= lt!674540 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(declare-fun res!1075093 () Bool)

(assert (=> start!135348 (=> (not res!1075093) (not e!877577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135348 (= res!1075093 (validMask!0 mask!889))))

(assert (=> start!135348 e!877577))

(assert (=> start!135348 true))

(declare-fun array_inv!39446 (array!105132) Bool)

(assert (=> start!135348 (array_inv!39446 _keys!600)))

(declare-fun b!1573699 () Bool)

(declare-fun res!1075095 () Bool)

(assert (=> b!1573699 (=> (not res!1075095) (not e!877577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573699 (= res!1075095 (validKeyInArray!0 k!754))))

(declare-fun b!1573701 () Bool)

(declare-fun lt!674541 () SeekEntryResult!13632)

(assert (=> b!1573701 (= e!877575 (and (not (is-MissingVacant!13632 lt!674541)) (not (is-Found!13632 lt!674541)) (not (is-MissingZero!13632 lt!674541)) (not (is-Undefined!13632 lt!674541))))))

(declare-fun err!150 () SeekEntryResult!13632)

(assert (=> b!1573701 (= lt!674541 err!150)))

(assert (=> b!1573701 true))

(assert (= (and start!135348 res!1075093) b!1573698))

(assert (= (and b!1573698 res!1075092) b!1573699))

(assert (= (and b!1573699 res!1075095) b!1573700))

(assert (= (and b!1573700 res!1075094) b!1573701))

(declare-fun m!1446991 () Bool)

(assert (=> b!1573700 m!1446991))

(assert (=> b!1573700 m!1446991))

(declare-fun m!1446993 () Bool)

(assert (=> b!1573700 m!1446993))

(declare-fun m!1446995 () Bool)

(assert (=> start!135348 m!1446995))

(declare-fun m!1446997 () Bool)

(assert (=> start!135348 m!1446997))

(declare-fun m!1446999 () Bool)

(assert (=> b!1573699 m!1446999))

(push 1)

(assert (not b!1573699))

(assert (not b!1573700))

(assert (not start!135348))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165071 () Bool)

(assert (=> d!165071 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1573699 d!165071))

(declare-fun b!1573744 () Bool)

(declare-fun e!877606 () SeekEntryResult!13632)

(assert (=> b!1573744 (= e!877606 (Intermediate!13632 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573746 () Bool)

(declare-fun lt!674565 () SeekEntryResult!13632)

(assert (=> b!1573746 (and (bvsge (index!56928 lt!674565) #b00000000000000000000000000000000) (bvslt (index!56928 lt!674565) (size!51269 _keys!600)))))

(declare-fun res!1075126 () Bool)

(assert (=> b!1573746 (= res!1075126 (= (select (arr!50719 _keys!600) (index!56928 lt!674565)) k!754))))

(declare-fun e!877608 () Bool)

(assert (=> b!1573746 (=> res!1075126 e!877608)))

(declare-fun e!877610 () Bool)

(assert (=> b!1573746 (= e!877610 e!877608)))

(declare-fun b!1573747 () Bool)

(declare-fun e!877609 () SeekEntryResult!13632)

(assert (=> b!1573747 (= e!877606 e!877609)))

(declare-fun c!145566 () Bool)

(declare-fun lt!674566 () (_ BitVec 64))

(assert (=> b!1573747 (= c!145566 (or (= lt!674566 k!754) (= (bvadd lt!674566 lt!674566) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1573748 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573748 (= e!877609 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1573749 () Bool)

(assert (=> b!1573749 (and (bvsge (index!56928 lt!674565) #b00000000000000000000000000000000) (bvslt (index!56928 lt!674565) (size!51269 _keys!600)))))

(declare-fun res!1075128 () Bool)

(assert (=> b!1573749 (= res!1075128 (= (select (arr!50719 _keys!600) (index!56928 lt!674565)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1573749 (=> res!1075128 e!877608)))

(declare-fun b!1573750 () Bool)

(declare-fun e!877607 () Bool)

(assert (=> b!1573750 (= e!877607 (bvsge (x!141743 lt!674565) #b01111111111111111111111111111110))))

(declare-fun b!1573751 () Bool)

(assert (=> b!1573751 (= e!877609 (Intermediate!13632 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573752 () Bool)

(assert (=> b!1573752 (= e!877607 e!877610)))

(declare-fun res!1075127 () Bool)

(assert (=> b!1573752 (= res!1075127 (and (is-Intermediate!13632 lt!674565) (not (undefined!14444 lt!674565)) (bvslt (x!141743 lt!674565) #b01111111111111111111111111111110) (bvsge (x!141743 lt!674565) #b00000000000000000000000000000000) (bvsge (x!141743 lt!674565) #b00000000000000000000000000000000)))))

(assert (=> b!1573752 (=> (not res!1075127) (not e!877610))))

(declare-fun d!165075 () Bool)

(assert (=> d!165075 e!877607))

(declare-fun c!145564 () Bool)

(assert (=> d!165075 (= c!145564 (and (is-Intermediate!13632 lt!674565) (undefined!14444 lt!674565)))))

(assert (=> d!165075 (= lt!674565 e!877606)))

(declare-fun c!145565 () Bool)

(assert (=> d!165075 (= c!145565 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165075 (= lt!674566 (select (arr!50719 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!165075 (validMask!0 mask!889)))

(assert (=> d!165075 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!674565)))

(declare-fun b!1573745 () Bool)

(assert (=> b!1573745 (and (bvsge (index!56928 lt!674565) #b00000000000000000000000000000000) (bvslt (index!56928 lt!674565) (size!51269 _keys!600)))))

(assert (=> b!1573745 (= e!877608 (= (select (arr!50719 _keys!600) (index!56928 lt!674565)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!165075 c!145565) b!1573744))

(assert (= (and d!165075 (not c!145565)) b!1573747))

(assert (= (and b!1573747 c!145566) b!1573751))

(assert (= (and b!1573747 (not c!145566)) b!1573748))

(assert (= (and d!165075 c!145564) b!1573750))

(assert (= (and d!165075 (not c!145564)) b!1573752))

(assert (= (and b!1573752 res!1075127) b!1573746))

(assert (= (and b!1573746 (not res!1075126)) b!1573749))

(assert (= (and b!1573749 (not res!1075128)) b!1573745))

(assert (=> d!165075 m!1446991))

(declare-fun m!1447021 () Bool)

(assert (=> d!165075 m!1447021))

(assert (=> d!165075 m!1446995))

(declare-fun m!1447023 () Bool)

(assert (=> b!1573746 m!1447023))

(assert (=> b!1573749 m!1447023))

(assert (=> b!1573748 m!1446991))

(declare-fun m!1447025 () Bool)

(assert (=> b!1573748 m!1447025))

(assert (=> b!1573748 m!1447025))

(declare-fun m!1447027 () Bool)

(assert (=> b!1573748 m!1447027))

(assert (=> b!1573745 m!1447023))

(assert (=> b!1573700 d!165075))

(declare-fun d!165085 () Bool)

(declare-fun lt!674572 () (_ BitVec 32))

(declare-fun lt!674571 () (_ BitVec 32))

(assert (=> d!165085 (= lt!674572 (bvmul (bvxor lt!674571 (bvlshr lt!674571 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165085 (= lt!674571 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165085 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1075129 (let ((h!38243 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141747 (bvmul (bvxor h!38243 (bvlshr h!38243 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141747 (bvlshr x!141747 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1075129 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1075129 #b00000000000000000000000000000000))))))

(assert (=> d!165085 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!674572 (bvlshr lt!674572 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1573700 d!165085))

(declare-fun d!165091 () Bool)

(assert (=> d!165091 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135348 d!165091))

(declare-fun d!165093 () Bool)

(assert (=> d!165093 (= (array_inv!39446 _keys!600) (bvsge (size!51269 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135348 d!165093))

(push 1)

(assert (not d!165075))

(assert (not b!1573748))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

