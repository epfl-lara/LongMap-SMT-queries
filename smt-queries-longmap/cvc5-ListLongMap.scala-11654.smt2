; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136214 () Bool)

(assert start!136214)

(declare-fun b!1576497 () Bool)

(declare-fun res!1077045 () Bool)

(declare-fun e!879303 () Bool)

(assert (=> b!1576497 (=> (not res!1077045) (not e!879303))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576497 (= res!1077045 (validKeyInArray!0 k!761))))

(declare-fun res!1077047 () Bool)

(assert (=> start!136214 (=> (not res!1077047) (not e!879303))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136214 (= res!1077047 (validMask!0 mask!898))))

(assert (=> start!136214 e!879303))

(assert (=> start!136214 true))

(declare-datatypes ((array!105447 0))(
  ( (array!105448 (arr!50848 (Array (_ BitVec 32) (_ BitVec 64))) (size!51400 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105447)

(declare-fun array_inv!39784 (array!105447) Bool)

(assert (=> start!136214 (array_inv!39784 _keys!605)))

(declare-fun b!1576496 () Bool)

(declare-fun res!1077046 () Bool)

(assert (=> b!1576496 (=> (not res!1077046) (not e!879303))))

(assert (=> b!1576496 (= res!1077046 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51400 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1576498 () Bool)

(declare-fun e!879304 () Bool)

(assert (=> b!1576498 (= e!879303 e!879304)))

(declare-fun res!1077048 () Bool)

(assert (=> b!1576498 (=> (not res!1077048) (not e!879304))))

(declare-fun lt!675525 () Bool)

(declare-datatypes ((SeekEntryResult!13748 0))(
  ( (MissingZero!13748 (index!57390 (_ BitVec 32))) (Found!13748 (index!57391 (_ BitVec 32))) (Intermediate!13748 (undefined!14560 Bool) (index!57392 (_ BitVec 32)) (x!142397 (_ BitVec 32))) (Undefined!13748) (MissingVacant!13748 (index!57393 (_ BitVec 32))) )
))
(declare-fun lt!675523 () SeekEntryResult!13748)

(assert (=> b!1576498 (= res!1077048 (and (or lt!675525 (not (undefined!14560 lt!675523))) (or lt!675525 (undefined!14560 lt!675523))))))

(assert (=> b!1576498 (= lt!675525 (not (is-Intermediate!13748 lt!675523)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105447 (_ BitVec 32)) SeekEntryResult!13748)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576498 (= lt!675523 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1576499 () Bool)

(declare-fun lt!675524 () SeekEntryResult!13748)

(assert (=> b!1576499 (= e!879304 (and (not (is-Undefined!13748 lt!675524)) (not (is-Found!13748 lt!675524)) (not (is-MissingZero!13748 lt!675524)) (is-MissingVacant!13748 lt!675524) (or (bvslt (index!57393 lt!675524) #b00000000000000000000000000000000) (bvsge (index!57393 lt!675524) (size!51400 _keys!605)))))))

(declare-fun err!206 () SeekEntryResult!13748)

(assert (=> b!1576499 (= lt!675524 err!206)))

(assert (=> b!1576499 true))

(assert (= (and start!136214 res!1077047) b!1576496))

(assert (= (and b!1576496 res!1077046) b!1576497))

(assert (= (and b!1576497 res!1077045) b!1576498))

(assert (= (and b!1576498 res!1077048) b!1576499))

(declare-fun m!1448357 () Bool)

(assert (=> b!1576497 m!1448357))

(declare-fun m!1448359 () Bool)

(assert (=> start!136214 m!1448359))

(declare-fun m!1448361 () Bool)

(assert (=> start!136214 m!1448361))

(declare-fun m!1448363 () Bool)

(assert (=> b!1576498 m!1448363))

(assert (=> b!1576498 m!1448363))

(declare-fun m!1448365 () Bool)

(assert (=> b!1576498 m!1448365))

(push 1)

(assert (not start!136214))

(assert (not b!1576497))

(assert (not b!1576498))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165511 () Bool)

(assert (=> d!165511 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136214 d!165511))

(declare-fun d!165517 () Bool)

(assert (=> d!165517 (= (array_inv!39784 _keys!605) (bvsge (size!51400 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136214 d!165517))

(declare-fun d!165519 () Bool)

(assert (=> d!165519 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576497 d!165519))

(declare-fun b!1576536 () Bool)

(declare-fun e!879328 () SeekEntryResult!13748)

(assert (=> b!1576536 (= e!879328 (Intermediate!13748 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576537 () Bool)

(declare-fun e!879329 () SeekEntryResult!13748)

(assert (=> b!1576537 (= e!879329 e!879328)))

(declare-fun c!146022 () Bool)

(declare-fun lt!675535 () (_ BitVec 64))

(assert (=> b!1576537 (= c!146022 (or (= lt!675535 k!761) (= (bvadd lt!675535 lt!675535) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576538 () Bool)

(declare-fun lt!675534 () SeekEntryResult!13748)

(assert (=> b!1576538 (and (bvsge (index!57392 lt!675534) #b00000000000000000000000000000000) (bvslt (index!57392 lt!675534) (size!51400 _keys!605)))))

(declare-fun res!1077062 () Bool)

(assert (=> b!1576538 (= res!1077062 (= (select (arr!50848 _keys!605) (index!57392 lt!675534)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!879326 () Bool)

(assert (=> b!1576538 (=> res!1077062 e!879326)))

(declare-fun b!1576539 () Bool)

(assert (=> b!1576539 (and (bvsge (index!57392 lt!675534) #b00000000000000000000000000000000) (bvslt (index!57392 lt!675534) (size!51400 _keys!605)))))

(assert (=> b!1576539 (= e!879326 (= (select (arr!50848 _keys!605) (index!57392 lt!675534)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1576540 () Bool)

(declare-fun e!879330 () Bool)

(declare-fun e!879327 () Bool)

(assert (=> b!1576540 (= e!879330 e!879327)))

(declare-fun res!1077063 () Bool)

(assert (=> b!1576540 (= res!1077063 (and (is-Intermediate!13748 lt!675534) (not (undefined!14560 lt!675534)) (bvslt (x!142397 lt!675534) #b01111111111111111111111111111110) (bvsge (x!142397 lt!675534) #b00000000000000000000000000000000) (bvsge (x!142397 lt!675534) #b00000000000000000000000000000000)))))

(assert (=> b!1576540 (=> (not res!1077063) (not e!879327))))

(declare-fun b!1576541 () Bool)

(assert (=> b!1576541 (= e!879330 (bvsge (x!142397 lt!675534) #b01111111111111111111111111111110))))

(declare-fun b!1576542 () Bool)

(assert (=> b!1576542 (and (bvsge (index!57392 lt!675534) #b00000000000000000000000000000000) (bvslt (index!57392 lt!675534) (size!51400 _keys!605)))))

(declare-fun res!1077061 () Bool)

(assert (=> b!1576542 (= res!1077061 (= (select (arr!50848 _keys!605) (index!57392 lt!675534)) k!761))))

(assert (=> b!1576542 (=> res!1077061 e!879326)))

(assert (=> b!1576542 (= e!879327 e!879326)))

(declare-fun d!165521 () Bool)

(assert (=> d!165521 e!879330))

(declare-fun c!146023 () Bool)

(assert (=> d!165521 (= c!146023 (and (is-Intermediate!13748 lt!675534) (undefined!14560 lt!675534)))))

(assert (=> d!165521 (= lt!675534 e!879329)))

(declare-fun c!146021 () Bool)

(assert (=> d!165521 (= c!146021 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165521 (= lt!675535 (select (arr!50848 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165521 (validMask!0 mask!898)))

(assert (=> d!165521 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675534)))

(declare-fun b!1576543 () Bool)

(assert (=> b!1576543 (= e!879329 (Intermediate!13748 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576544 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576544 (= e!879328 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and d!165521 c!146021) b!1576543))

(assert (= (and d!165521 (not c!146021)) b!1576537))

(assert (= (and b!1576537 c!146022) b!1576536))

(assert (= (and b!1576537 (not c!146022)) b!1576544))

(assert (= (and d!165521 c!146023) b!1576541))

(assert (= (and d!165521 (not c!146023)) b!1576540))

(assert (= (and b!1576540 res!1077063) b!1576542))

(assert (= (and b!1576542 (not res!1077061)) b!1576538))

(assert (= (and b!1576538 (not res!1077062)) b!1576539))

(assert (=> b!1576544 m!1448363))

(declare-fun m!1448367 () Bool)

(assert (=> b!1576544 m!1448367))

(assert (=> b!1576544 m!1448367))

(declare-fun m!1448369 () Bool)

(assert (=> b!1576544 m!1448369))

(declare-fun m!1448371 () Bool)

(assert (=> b!1576538 m!1448371))

(assert (=> d!165521 m!1448363))

(declare-fun m!1448373 () Bool)

(assert (=> d!165521 m!1448373))

(assert (=> d!165521 m!1448359))

(assert (=> b!1576539 m!1448371))

(assert (=> b!1576542 m!1448371))

(assert (=> b!1576498 d!165521))

(declare-fun d!165533 () Bool)

(declare-fun lt!675547 () (_ BitVec 32))

(declare-fun lt!675546 () (_ BitVec 32))

(assert (=> d!165533 (= lt!675547 (bvmul (bvxor lt!675546 (bvlshr lt!675546 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165533 (= lt!675546 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165533 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077067 (let ((h!38336 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142400 (bvmul (bvxor h!38336 (bvlshr h!38336 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142400 (bvlshr x!142400 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077067 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077067 #b00000000000000000000000000000000))))))

(assert (=> d!165533 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675547 (bvlshr lt!675547 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1576498 d!165533))

(push 1)

(assert (not d!165521))

(assert (not b!1576544))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

