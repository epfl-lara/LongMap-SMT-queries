; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135888 () Bool)

(assert start!135888)

(declare-fun res!1076529 () Bool)

(declare-fun e!878716 () Bool)

(assert (=> start!135888 (=> (not res!1076529) (not e!878716))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135888 (= res!1076529 (validMask!0 mask!898))))

(assert (=> start!135888 e!878716))

(assert (=> start!135888 true))

(declare-datatypes ((array!105420 0))(
  ( (array!105421 (arr!50848 (Array (_ BitVec 32) (_ BitVec 64))) (size!51398 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105420)

(declare-fun array_inv!39575 (array!105420) Bool)

(assert (=> start!135888 (array_inv!39575 _keys!605)))

(declare-fun b!1575487 () Bool)

(declare-fun res!1076527 () Bool)

(assert (=> b!1575487 (=> (not res!1076527) (not e!878716))))

(assert (=> b!1575487 (= res!1076527 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51398 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575488 () Bool)

(declare-fun res!1076528 () Bool)

(assert (=> b!1575488 (=> (not res!1076528) (not e!878716))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575488 (= res!1076528 (validKeyInArray!0 k!761))))

(declare-fun b!1575489 () Bool)

(declare-datatypes ((SeekEntryResult!13713 0))(
  ( (MissingZero!13713 (index!57250 (_ BitVec 32))) (Found!13713 (index!57251 (_ BitVec 32))) (Intermediate!13713 (undefined!14525 Bool) (index!57252 (_ BitVec 32)) (x!142213 (_ BitVec 32))) (Undefined!13713) (MissingVacant!13713 (index!57253 (_ BitVec 32))) )
))
(declare-fun lt!675211 () SeekEntryResult!13713)

(assert (=> b!1575489 (= e!878716 (and (is-Intermediate!13713 lt!675211) (not (undefined!14525 lt!675211)) (not (= (select (arr!50848 _keys!605) (index!57252 lt!675211)) k!761)) (= (select (arr!50848 _keys!605) (index!57252 lt!675211)) #b0000000000000000000000000000000000000000000000000000000000000000) (or (bvslt (index!57252 lt!675211) #b00000000000000000000000000000000) (bvsge (index!57252 lt!675211) (size!51398 _keys!605)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105420 (_ BitVec 32)) SeekEntryResult!13713)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575489 (= lt!675211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135888 res!1076529) b!1575487))

(assert (= (and b!1575487 res!1076527) b!1575488))

(assert (= (and b!1575488 res!1076528) b!1575489))

(declare-fun m!1448509 () Bool)

(assert (=> start!135888 m!1448509))

(declare-fun m!1448511 () Bool)

(assert (=> start!135888 m!1448511))

(declare-fun m!1448513 () Bool)

(assert (=> b!1575488 m!1448513))

(declare-fun m!1448515 () Bool)

(assert (=> b!1575489 m!1448515))

(declare-fun m!1448517 () Bool)

(assert (=> b!1575489 m!1448517))

(assert (=> b!1575489 m!1448517))

(declare-fun m!1448519 () Bool)

(assert (=> b!1575489 m!1448519))

(push 1)

(assert (not b!1575489))

(assert (not start!135888))

(assert (not b!1575488))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1575553 () Bool)

(declare-fun e!878755 () Bool)

(declare-fun lt!675229 () SeekEntryResult!13713)

(assert (=> b!1575553 (= e!878755 (bvsge (x!142213 lt!675229) #b01111111111111111111111111111110))))

(declare-fun b!1575554 () Bool)

(declare-fun e!878759 () SeekEntryResult!13713)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575554 (= e!878759 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1575555 () Bool)

(assert (=> b!1575555 (and (bvsge (index!57252 lt!675229) #b00000000000000000000000000000000) (bvslt (index!57252 lt!675229) (size!51398 _keys!605)))))

(declare-fun res!1076565 () Bool)

(assert (=> b!1575555 (= res!1076565 (= (select (arr!50848 _keys!605) (index!57252 lt!675229)) k!761))))

(declare-fun e!878756 () Bool)

(assert (=> b!1575555 (=> res!1076565 e!878756)))

(declare-fun e!878758 () Bool)

(assert (=> b!1575555 (= e!878758 e!878756)))

(declare-fun b!1575556 () Bool)

(assert (=> b!1575556 (and (bvsge (index!57252 lt!675229) #b00000000000000000000000000000000) (bvslt (index!57252 lt!675229) (size!51398 _keys!605)))))

(declare-fun res!1076566 () Bool)

(assert (=> b!1575556 (= res!1076566 (= (select (arr!50848 _keys!605) (index!57252 lt!675229)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1575556 (=> res!1076566 e!878756)))

(declare-fun b!1575557 () Bool)

(assert (=> b!1575557 (= e!878755 e!878758)))

(declare-fun res!1076564 () Bool)

(assert (=> b!1575557 (= res!1076564 (and (is-Intermediate!13713 lt!675229) (not (undefined!14525 lt!675229)) (bvslt (x!142213 lt!675229) #b01111111111111111111111111111110) (bvsge (x!142213 lt!675229) #b00000000000000000000000000000000) (bvsge (x!142213 lt!675229) #b00000000000000000000000000000000)))))

(assert (=> b!1575557 (=> (not res!1076564) (not e!878758))))

(declare-fun b!1575558 () Bool)

(declare-fun e!878757 () SeekEntryResult!13713)

(assert (=> b!1575558 (= e!878757 (Intermediate!13713 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575559 () Bool)

(assert (=> b!1575559 (and (bvsge (index!57252 lt!675229) #b00000000000000000000000000000000) (bvslt (index!57252 lt!675229) (size!51398 _keys!605)))))

(assert (=> b!1575559 (= e!878756 (= (select (arr!50848 _keys!605) (index!57252 lt!675229)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!165441 () Bool)

(assert (=> d!165441 e!878755))

(declare-fun c!145764 () Bool)

(assert (=> d!165441 (= c!145764 (and (is-Intermediate!13713 lt!675229) (undefined!14525 lt!675229)))))

(assert (=> d!165441 (= lt!675229 e!878757)))

(declare-fun c!145763 () Bool)

(assert (=> d!165441 (= c!145763 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675228 () (_ BitVec 64))

(assert (=> d!165441 (= lt!675228 (select (arr!50848 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165441 (validMask!0 mask!898)))

(assert (=> d!165441 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675229)))

(declare-fun b!1575560 () Bool)

(assert (=> b!1575560 (= e!878759 (Intermediate!13713 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575561 () Bool)

(assert (=> b!1575561 (= e!878757 e!878759)))

(declare-fun c!145762 () Bool)

(assert (=> b!1575561 (= c!145762 (or (= lt!675228 k!761) (= (bvadd lt!675228 lt!675228) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!165441 c!145763) b!1575558))

(assert (= (and d!165441 (not c!145763)) b!1575561))

(assert (= (and b!1575561 c!145762) b!1575560))

(assert (= (and b!1575561 (not c!145762)) b!1575554))

(assert (= (and d!165441 c!145764) b!1575553))

(assert (= (and d!165441 (not c!145764)) b!1575557))

(assert (= (and b!1575557 res!1076564) b!1575555))

(assert (= (and b!1575555 (not res!1076565)) b!1575556))

(assert (= (and b!1575556 (not res!1076566)) b!1575559))

(declare-fun m!1448553 () Bool)

(assert (=> b!1575555 m!1448553))

(assert (=> b!1575554 m!1448517))

(declare-fun m!1448555 () Bool)

(assert (=> b!1575554 m!1448555))

(assert (=> b!1575554 m!1448555))

(declare-fun m!1448557 () Bool)

(assert (=> b!1575554 m!1448557))

(assert (=> b!1575556 m!1448553))

(assert (=> b!1575559 m!1448553))

(assert (=> d!165441 m!1448517))

(declare-fun m!1448559 () Bool)

(assert (=> d!165441 m!1448559))

(assert (=> d!165441 m!1448509))

(assert (=> b!1575489 d!165441))

(declare-fun d!165453 () Bool)

(declare-fun lt!675241 () (_ BitVec 32))

(declare-fun lt!675240 () (_ BitVec 32))

(assert (=> d!165453 (= lt!675241 (bvmul (bvxor lt!675240 (bvlshr lt!675240 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165453 (= lt!675240 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165453 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076567 (let ((h!38268 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142219 (bvmul (bvxor h!38268 (bvlshr h!38268 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142219 (bvlshr x!142219 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076567 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076567 #b00000000000000000000000000000000))))))

(assert (=> d!165453 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675241 (bvlshr lt!675241 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1575489 d!165453))

(declare-fun d!165457 () Bool)

(assert (=> d!165457 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135888 d!165457))

(declare-fun d!165461 () Bool)

(assert (=> d!165461 (= (array_inv!39575 _keys!605) (bvsge (size!51398 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135888 d!165461))

(declare-fun d!165463 () Bool)

(assert (=> d!165463 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575488 d!165463))

(push 1)

(assert (not b!1575554))

(assert (not d!165441))

(check-sat)

(pop 1)

(push 1)

(check-sat)

