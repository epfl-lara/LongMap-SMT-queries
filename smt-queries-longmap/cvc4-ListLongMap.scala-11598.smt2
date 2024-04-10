; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135280 () Bool)

(assert start!135280)

(declare-fun res!1074985 () Bool)

(declare-fun e!877451 () Bool)

(assert (=> start!135280 (=> (not res!1074985) (not e!877451))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135280 (= res!1074985 (validMask!0 mask!889))))

(assert (=> start!135280 e!877451))

(assert (=> start!135280 true))

(declare-datatypes ((array!105118 0))(
  ( (array!105119 (arr!50715 (Array (_ BitVec 32) (_ BitVec 64))) (size!51265 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105118)

(declare-fun array_inv!39442 (array!105118) Bool)

(assert (=> start!135280 (array_inv!39442 _keys!600)))

(declare-fun b!1573489 () Bool)

(declare-fun res!1074987 () Bool)

(assert (=> b!1573489 (=> (not res!1074987) (not e!877451))))

(assert (=> b!1573489 (= res!1074987 (= (size!51265 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1573490 () Bool)

(declare-fun res!1074986 () Bool)

(assert (=> b!1573490 (=> (not res!1074986) (not e!877451))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573490 (= res!1074986 (validKeyInArray!0 k!754))))

(declare-fun b!1573491 () Bool)

(declare-fun lt!674433 () Bool)

(declare-datatypes ((SeekEntryResult!13628 0))(
  ( (MissingZero!13628 (index!56910 (_ BitVec 32))) (Found!13628 (index!56911 (_ BitVec 32))) (Intermediate!13628 (undefined!14440 Bool) (index!56912 (_ BitVec 32)) (x!141711 (_ BitVec 32))) (Undefined!13628) (MissingVacant!13628 (index!56913 (_ BitVec 32))) )
))
(declare-fun lt!674434 () SeekEntryResult!13628)

(assert (=> b!1573491 (= e!877451 (and (or lt!674433 (not (undefined!14440 lt!674434))) (or lt!674433 (undefined!14440 lt!674434))))))

(assert (=> b!1573491 (= lt!674433 (not (is-Intermediate!13628 lt!674434)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105118 (_ BitVec 32)) SeekEntryResult!13628)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573491 (= lt!674434 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135280 res!1074985) b!1573489))

(assert (= (and b!1573489 res!1074987) b!1573490))

(assert (= (and b!1573490 res!1074986) b!1573491))

(declare-fun m!1446903 () Bool)

(assert (=> start!135280 m!1446903))

(declare-fun m!1446905 () Bool)

(assert (=> start!135280 m!1446905))

(declare-fun m!1446907 () Bool)

(assert (=> b!1573490 m!1446907))

(declare-fun m!1446909 () Bool)

(assert (=> b!1573491 m!1446909))

(assert (=> b!1573491 m!1446909))

(declare-fun m!1446911 () Bool)

(assert (=> b!1573491 m!1446911))

(push 1)

(assert (not b!1573491))

(assert (not b!1573490))

(assert (not start!135280))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1573564 () Bool)

(declare-fun e!877496 () Bool)

(declare-fun e!877494 () Bool)

(assert (=> b!1573564 (= e!877496 e!877494)))

(declare-fun res!1075014 () Bool)

(declare-fun lt!674452 () SeekEntryResult!13628)

(assert (=> b!1573564 (= res!1075014 (and (is-Intermediate!13628 lt!674452) (not (undefined!14440 lt!674452)) (bvslt (x!141711 lt!674452) #b01111111111111111111111111111110) (bvsge (x!141711 lt!674452) #b00000000000000000000000000000000) (bvsge (x!141711 lt!674452) #b00000000000000000000000000000000)))))

(assert (=> b!1573564 (=> (not res!1075014) (not e!877494))))

(declare-fun b!1573566 () Bool)

(declare-fun e!877493 () SeekEntryResult!13628)

(assert (=> b!1573566 (= e!877493 (Intermediate!13628 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573567 () Bool)

(assert (=> b!1573567 (and (bvsge (index!56912 lt!674452) #b00000000000000000000000000000000) (bvslt (index!56912 lt!674452) (size!51265 _keys!600)))))

(declare-fun res!1075015 () Bool)

(assert (=> b!1573567 (= res!1075015 (= (select (arr!50715 _keys!600) (index!56912 lt!674452)) k!754))))

(declare-fun e!877492 () Bool)

(assert (=> b!1573567 (=> res!1075015 e!877492)))

(assert (=> b!1573567 (= e!877494 e!877492)))

(declare-fun b!1573568 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573568 (= e!877493 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1573565 () Bool)

(assert (=> b!1573565 (= e!877496 (bvsge (x!141711 lt!674452) #b01111111111111111111111111111110))))

(declare-fun d!165009 () Bool)

(assert (=> d!165009 e!877496))

(declare-fun c!145530 () Bool)

(assert (=> d!165009 (= c!145530 (and (is-Intermediate!13628 lt!674452) (undefined!14440 lt!674452)))))

(declare-fun e!877495 () SeekEntryResult!13628)

(assert (=> d!165009 (= lt!674452 e!877495)))

(declare-fun c!145528 () Bool)

(assert (=> d!165009 (= c!145528 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!674451 () (_ BitVec 64))

(assert (=> d!165009 (= lt!674451 (select (arr!50715 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!165009 (validMask!0 mask!889)))

(assert (=> d!165009 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!674452)))

(declare-fun b!1573569 () Bool)

(assert (=> b!1573569 (= e!877495 e!877493)))

(declare-fun c!145529 () Bool)

(assert (=> b!1573569 (= c!145529 (or (= lt!674451 k!754) (= (bvadd lt!674451 lt!674451) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1573570 () Bool)

(assert (=> b!1573570 (and (bvsge (index!56912 lt!674452) #b00000000000000000000000000000000) (bvslt (index!56912 lt!674452) (size!51265 _keys!600)))))

(assert (=> b!1573570 (= e!877492 (= (select (arr!50715 _keys!600) (index!56912 lt!674452)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1573571 () Bool)

(assert (=> b!1573571 (= e!877495 (Intermediate!13628 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573572 () Bool)

(assert (=> b!1573572 (and (bvsge (index!56912 lt!674452) #b00000000000000000000000000000000) (bvslt (index!56912 lt!674452) (size!51265 _keys!600)))))

(declare-fun res!1075016 () Bool)

(assert (=> b!1573572 (= res!1075016 (= (select (arr!50715 _keys!600) (index!56912 lt!674452)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1573572 (=> res!1075016 e!877492)))

(assert (= (and d!165009 c!145528) b!1573571))

(assert (= (and d!165009 (not c!145528)) b!1573569))

(assert (= (and b!1573569 c!145529) b!1573566))

(assert (= (and b!1573569 (not c!145529)) b!1573568))

(assert (= (and d!165009 c!145530) b!1573565))

(assert (= (and d!165009 (not c!145530)) b!1573564))

(assert (= (and b!1573564 res!1075014) b!1573567))

(assert (= (and b!1573567 (not res!1075015)) b!1573572))

(assert (= (and b!1573572 (not res!1075016)) b!1573570))

(declare-fun m!1446929 () Bool)

(assert (=> b!1573570 m!1446929))

(assert (=> b!1573567 m!1446929))

(assert (=> d!165009 m!1446909))

(declare-fun m!1446931 () Bool)

(assert (=> d!165009 m!1446931))

(assert (=> d!165009 m!1446903))

(assert (=> b!1573572 m!1446929))

(assert (=> b!1573568 m!1446909))

(declare-fun m!1446933 () Bool)

(assert (=> b!1573568 m!1446933))

(assert (=> b!1573568 m!1446933))

(declare-fun m!1446935 () Bool)

(assert (=> b!1573568 m!1446935))

(assert (=> b!1573491 d!165009))

(declare-fun d!165015 () Bool)

(declare-fun lt!674470 () (_ BitVec 32))

(declare-fun lt!674469 () (_ BitVec 32))

(assert (=> d!165015 (= lt!674470 (bvmul (bvxor lt!674469 (bvlshr lt!674469 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165015 (= lt!674469 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165015 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1075017 (let ((h!38239 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141717 (bvmul (bvxor h!38239 (bvlshr h!38239 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141717 (bvlshr x!141717 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1075017 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1075017 #b00000000000000000000000000000000))))))

(assert (=> d!165015 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!674470 (bvlshr lt!674470 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1573491 d!165015))

(declare-fun d!165025 () Bool)

(assert (=> d!165025 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1573490 d!165025))

(declare-fun d!165027 () Bool)

(assert (=> d!165027 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135280 d!165027))

(declare-fun d!165033 () Bool)

(assert (=> d!165033 (= (array_inv!39442 _keys!600) (bvsge (size!51265 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135280 d!165033))

(push 1)

