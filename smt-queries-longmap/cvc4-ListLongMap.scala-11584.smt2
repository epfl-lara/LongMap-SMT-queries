; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135000 () Bool)

(assert start!135000)

(declare-fun res!1074374 () Bool)

(declare-fun e!876794 () Bool)

(assert (=> start!135000 (=> (not res!1074374) (not e!876794))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135000 (= res!1074374 (validMask!0 mask!889))))

(assert (=> start!135000 e!876794))

(assert (=> start!135000 true))

(declare-datatypes ((array!105016 0))(
  ( (array!105017 (arr!50673 (Array (_ BitVec 32) (_ BitVec 64))) (size!51223 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105016)

(declare-fun array_inv!39400 (array!105016) Bool)

(assert (=> start!135000 (array_inv!39400 _keys!600)))

(declare-fun b!1572409 () Bool)

(declare-fun res!1074373 () Bool)

(assert (=> b!1572409 (=> (not res!1074373) (not e!876794))))

(assert (=> b!1572409 (= res!1074373 (= (size!51223 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572410 () Bool)

(declare-fun res!1074375 () Bool)

(assert (=> b!1572410 (=> (not res!1074375) (not e!876794))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572410 (= res!1074375 (validKeyInArray!0 k!754))))

(declare-fun b!1572411 () Bool)

(declare-datatypes ((SeekEntryResult!13586 0))(
  ( (MissingZero!13586 (index!56742 (_ BitVec 32))) (Found!13586 (index!56743 (_ BitVec 32))) (Intermediate!13586 (undefined!14398 Bool) (index!56744 (_ BitVec 32)) (x!141512 (_ BitVec 32))) (Undefined!13586) (MissingVacant!13586 (index!56745 (_ BitVec 32))) )
))
(declare-fun lt!673975 () SeekEntryResult!13586)

(assert (=> b!1572411 (= e!876794 (and (is-Intermediate!13586 lt!673975) (not (undefined!14398 lt!673975)) (or (bvslt (index!56744 lt!673975) #b00000000000000000000000000000000) (bvsge (index!56744 lt!673975) (size!51223 _keys!600)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105016 (_ BitVec 32)) SeekEntryResult!13586)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572411 (= lt!673975 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135000 res!1074374) b!1572409))

(assert (= (and b!1572409 res!1074373) b!1572410))

(assert (= (and b!1572410 res!1074375) b!1572411))

(declare-fun m!1446177 () Bool)

(assert (=> start!135000 m!1446177))

(declare-fun m!1446179 () Bool)

(assert (=> start!135000 m!1446179))

(declare-fun m!1446181 () Bool)

(assert (=> b!1572410 m!1446181))

(declare-fun m!1446183 () Bool)

(assert (=> b!1572411 m!1446183))

(assert (=> b!1572411 m!1446183))

(declare-fun m!1446185 () Bool)

(assert (=> b!1572411 m!1446185))

(push 1)

(assert (not b!1572410))

(assert (not b!1572411))

(assert (not start!135000))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164789 () Bool)

(assert (=> d!164789 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1572410 d!164789))

(declare-fun b!1572484 () Bool)

(declare-fun e!876835 () Bool)

(declare-fun lt!673997 () SeekEntryResult!13586)

(assert (=> b!1572484 (= e!876835 (bvsge (x!141512 lt!673997) #b01111111111111111111111111111110))))

(declare-fun b!1572485 () Bool)

(declare-fun e!876836 () Bool)

(assert (=> b!1572485 (= e!876835 e!876836)))

(declare-fun res!1074404 () Bool)

(assert (=> b!1572485 (= res!1074404 (and (is-Intermediate!13586 lt!673997) (not (undefined!14398 lt!673997)) (bvslt (x!141512 lt!673997) #b01111111111111111111111111111110) (bvsge (x!141512 lt!673997) #b00000000000000000000000000000000) (bvsge (x!141512 lt!673997) #b00000000000000000000000000000000)))))

(assert (=> b!1572485 (=> (not res!1074404) (not e!876836))))

(declare-fun b!1572486 () Bool)

(declare-fun e!876838 () SeekEntryResult!13586)

(declare-fun e!876839 () SeekEntryResult!13586)

(assert (=> b!1572486 (= e!876838 e!876839)))

(declare-fun c!145286 () Bool)

(declare-fun lt!673996 () (_ BitVec 64))

(assert (=> b!1572486 (= c!145286 (or (= lt!673996 k!754) (= (bvadd lt!673996 lt!673996) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1572487 () Bool)

(assert (=> b!1572487 (and (bvsge (index!56744 lt!673997) #b00000000000000000000000000000000) (bvslt (index!56744 lt!673997) (size!51223 _keys!600)))))

(declare-fun e!876837 () Bool)

(assert (=> b!1572487 (= e!876837 (= (select (arr!50673 _keys!600) (index!56744 lt!673997)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1572488 () Bool)

(assert (=> b!1572488 (= e!876839 (Intermediate!13586 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572490 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572490 (= e!876839 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1572491 () Bool)

(assert (=> b!1572491 (= e!876838 (Intermediate!13586 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572492 () Bool)

(assert (=> b!1572492 (and (bvsge (index!56744 lt!673997) #b00000000000000000000000000000000) (bvslt (index!56744 lt!673997) (size!51223 _keys!600)))))

(declare-fun res!1074402 () Bool)

(assert (=> b!1572492 (= res!1074402 (= (select (arr!50673 _keys!600) (index!56744 lt!673997)) k!754))))

(assert (=> b!1572492 (=> res!1074402 e!876837)))

(assert (=> b!1572492 (= e!876836 e!876837)))

(declare-fun b!1572489 () Bool)

(assert (=> b!1572489 (and (bvsge (index!56744 lt!673997) #b00000000000000000000000000000000) (bvslt (index!56744 lt!673997) (size!51223 _keys!600)))))

(declare-fun res!1074403 () Bool)

(assert (=> b!1572489 (= res!1074403 (= (select (arr!50673 _keys!600) (index!56744 lt!673997)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1572489 (=> res!1074403 e!876837)))

(declare-fun d!164791 () Bool)

(assert (=> d!164791 e!876835))

(declare-fun c!145285 () Bool)

(assert (=> d!164791 (= c!145285 (and (is-Intermediate!13586 lt!673997) (undefined!14398 lt!673997)))))

(assert (=> d!164791 (= lt!673997 e!876838)))

(declare-fun c!145287 () Bool)

(assert (=> d!164791 (= c!145287 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164791 (= lt!673996 (select (arr!50673 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!164791 (validMask!0 mask!889)))

(assert (=> d!164791 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!673997)))

(assert (= (and d!164791 c!145287) b!1572491))

(assert (= (and d!164791 (not c!145287)) b!1572486))

(assert (= (and b!1572486 c!145286) b!1572488))

(assert (= (and b!1572486 (not c!145286)) b!1572490))

(assert (= (and d!164791 c!145285) b!1572484))

(assert (= (and d!164791 (not c!145285)) b!1572485))

(assert (= (and b!1572485 res!1074404) b!1572492))

(assert (= (and b!1572492 (not res!1074402)) b!1572489))

(assert (= (and b!1572489 (not res!1074403)) b!1572487))

(assert (=> b!1572490 m!1446183))

(declare-fun m!1446203 () Bool)

(assert (=> b!1572490 m!1446203))

(assert (=> b!1572490 m!1446203))

(declare-fun m!1446205 () Bool)

(assert (=> b!1572490 m!1446205))

(declare-fun m!1446207 () Bool)

(assert (=> b!1572492 m!1446207))

(assert (=> b!1572487 m!1446207))

(assert (=> b!1572489 m!1446207))

(assert (=> d!164791 m!1446183))

(declare-fun m!1446209 () Bool)

(assert (=> d!164791 m!1446209))

(assert (=> d!164791 m!1446177))

(assert (=> b!1572411 d!164791))

(declare-fun d!164799 () Bool)

(declare-fun lt!674011 () (_ BitVec 32))

(declare-fun lt!674010 () (_ BitVec 32))

(assert (=> d!164799 (= lt!674011 (bvmul (bvxor lt!674010 (bvlshr lt!674010 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164799 (= lt!674010 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164799 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074405 (let ((h!38221 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141518 (bvmul (bvxor h!38221 (bvlshr h!38221 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141518 (bvlshr x!141518 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074405 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074405 #b00000000000000000000000000000000))))))

(assert (=> d!164799 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!674011 (bvlshr lt!674011 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1572411 d!164799))

(declare-fun d!164803 () Bool)

(assert (=> d!164803 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135000 d!164803))

(declare-fun d!164809 () Bool)

(assert (=> d!164809 (= (array_inv!39400 _keys!600) (bvsge (size!51223 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135000 d!164809))

(push 1)

(assert (not d!164791))

(assert (not b!1572490))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

