; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136250 () Bool)

(assert start!136250)

(declare-fun res!1077113 () Bool)

(declare-fun e!879377 () Bool)

(assert (=> start!136250 (=> (not res!1077113) (not e!879377))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136250 (= res!1077113 (validMask!0 mask!898))))

(assert (=> start!136250 e!879377))

(assert (=> start!136250 true))

(declare-datatypes ((array!105456 0))(
  ( (array!105457 (arr!50851 (Array (_ BitVec 32) (_ BitVec 64))) (size!51403 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105456)

(declare-fun array_inv!39787 (array!105456) Bool)

(assert (=> start!136250 (array_inv!39787 _keys!605)))

(declare-fun b!1576615 () Bool)

(declare-fun e!879376 () Bool)

(assert (=> b!1576615 (= e!879377 e!879376)))

(declare-fun res!1077114 () Bool)

(assert (=> b!1576615 (=> (not res!1077114) (not e!879376))))

(declare-fun lt!675586 () Bool)

(declare-datatypes ((SeekEntryResult!13751 0))(
  ( (MissingZero!13751 (index!57402 (_ BitVec 32))) (Found!13751 (index!57403 (_ BitVec 32))) (Intermediate!13751 (undefined!14563 Bool) (index!57404 (_ BitVec 32)) (x!142414 (_ BitVec 32))) (Undefined!13751) (MissingVacant!13751 (index!57405 (_ BitVec 32))) )
))
(declare-fun lt!675588 () SeekEntryResult!13751)

(assert (=> b!1576615 (= res!1077114 (and (or lt!675586 (not (undefined!14563 lt!675588))) (or lt!675586 (undefined!14563 lt!675588))))))

(assert (=> b!1576615 (= lt!675586 (not (is-Intermediate!13751 lt!675588)))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105456 (_ BitVec 32)) SeekEntryResult!13751)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576615 (= lt!675588 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1576613 () Bool)

(declare-fun res!1077111 () Bool)

(assert (=> b!1576613 (=> (not res!1077111) (not e!879377))))

(assert (=> b!1576613 (= res!1077111 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51403 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun lt!675587 () SeekEntryResult!13751)

(declare-fun b!1576616 () Bool)

(assert (=> b!1576616 (= e!879376 (and (not (is-Undefined!13751 lt!675587)) (ite (is-Found!13751 lt!675587) (not (= (select (arr!50851 _keys!605) (index!57403 lt!675587)) k!761)) (ite (is-MissingZero!13751 lt!675587) (not (= (select (arr!50851 _keys!605) (index!57402 lt!675587)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (is-MissingVacant!13751 lt!675587)) (not (= (select (arr!50851 _keys!605) (index!57405 lt!675587)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun err!218 () SeekEntryResult!13751)

(assert (=> b!1576616 (= lt!675587 err!218)))

(assert (=> b!1576616 true))

(declare-fun b!1576614 () Bool)

(declare-fun res!1077112 () Bool)

(assert (=> b!1576614 (=> (not res!1077112) (not e!879377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576614 (= res!1077112 (validKeyInArray!0 k!761))))

(assert (= (and start!136250 res!1077113) b!1576613))

(assert (= (and b!1576613 res!1077111) b!1576614))

(assert (= (and b!1576614 res!1077112) b!1576615))

(assert (= (and b!1576615 res!1077114) b!1576616))

(declare-fun m!1448423 () Bool)

(assert (=> start!136250 m!1448423))

(declare-fun m!1448425 () Bool)

(assert (=> start!136250 m!1448425))

(declare-fun m!1448427 () Bool)

(assert (=> b!1576615 m!1448427))

(assert (=> b!1576615 m!1448427))

(declare-fun m!1448429 () Bool)

(assert (=> b!1576615 m!1448429))

(declare-fun m!1448431 () Bool)

(assert (=> b!1576616 m!1448431))

(declare-fun m!1448433 () Bool)

(assert (=> b!1576616 m!1448433))

(declare-fun m!1448435 () Bool)

(assert (=> b!1576616 m!1448435))

(declare-fun m!1448437 () Bool)

(assert (=> b!1576614 m!1448437))

(push 1)

(assert (not b!1576615))

(assert (not b!1576614))

(assert (not start!136250))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1576635 () Bool)

(declare-fun e!879391 () SeekEntryResult!13751)

(assert (=> b!1576635 (= e!879391 (Intermediate!13751 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun d!165547 () Bool)

(declare-fun e!879392 () Bool)

(assert (=> d!165547 e!879392))

(declare-fun c!146044 () Bool)

(declare-fun lt!675594 () SeekEntryResult!13751)

(assert (=> d!165547 (= c!146044 (and (is-Intermediate!13751 lt!675594) (undefined!14563 lt!675594)))))

(declare-fun e!879390 () SeekEntryResult!13751)

(assert (=> d!165547 (= lt!675594 e!879390)))

(declare-fun c!146043 () Bool)

(assert (=> d!165547 (= c!146043 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675593 () (_ BitVec 64))

(assert (=> d!165547 (= lt!675593 (select (arr!50851 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165547 (validMask!0 mask!898)))

(assert (=> d!165547 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675594)))

(declare-fun b!1576636 () Bool)

(assert (=> b!1576636 (and (bvsge (index!57404 lt!675594) #b00000000000000000000000000000000) (bvslt (index!57404 lt!675594) (size!51403 _keys!605)))))

(declare-fun e!879388 () Bool)

(assert (=> b!1576636 (= e!879388 (= (select (arr!50851 _keys!605) (index!57404 lt!675594)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1576637 () Bool)

(assert (=> b!1576637 (and (bvsge (index!57404 lt!675594) #b00000000000000000000000000000000) (bvslt (index!57404 lt!675594) (size!51403 _keys!605)))))

(declare-fun res!1077122 () Bool)

(assert (=> b!1576637 (= res!1077122 (= (select (arr!50851 _keys!605) (index!57404 lt!675594)) k!761))))

(assert (=> b!1576637 (=> res!1077122 e!879388)))

(declare-fun e!879389 () Bool)

(assert (=> b!1576637 (= e!879389 e!879388)))

(declare-fun b!1576638 () Bool)

(assert (=> b!1576638 (= e!879392 (bvsge (x!142414 lt!675594) #b01111111111111111111111111111110))))

(declare-fun b!1576639 () Bool)

(assert (=> b!1576639 (and (bvsge (index!57404 lt!675594) #b00000000000000000000000000000000) (bvslt (index!57404 lt!675594) (size!51403 _keys!605)))))

(declare-fun res!1077123 () Bool)

(assert (=> b!1576639 (= res!1077123 (= (select (arr!50851 _keys!605) (index!57404 lt!675594)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1576639 (=> res!1077123 e!879388)))

(declare-fun b!1576640 () Bool)

(assert (=> b!1576640 (= e!879392 e!879389)))

(declare-fun res!1077121 () Bool)

(assert (=> b!1576640 (= res!1077121 (and (is-Intermediate!13751 lt!675594) (not (undefined!14563 lt!675594)) (bvslt (x!142414 lt!675594) #b01111111111111111111111111111110) (bvsge (x!142414 lt!675594) #b00000000000000000000000000000000) (bvsge (x!142414 lt!675594) #b00000000000000000000000000000000)))))

(assert (=> b!1576640 (=> (not res!1077121) (not e!879389))))

(declare-fun b!1576641 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576641 (= e!879391 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1576642 () Bool)

(assert (=> b!1576642 (= e!879390 (Intermediate!13751 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576643 () Bool)

(assert (=> b!1576643 (= e!879390 e!879391)))

(declare-fun c!146042 () Bool)

(assert (=> b!1576643 (= c!146042 (or (= lt!675593 k!761) (= (bvadd lt!675593 lt!675593) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!165547 c!146043) b!1576642))

(assert (= (and d!165547 (not c!146043)) b!1576643))

(assert (= (and b!1576643 c!146042) b!1576635))

(assert (= (and b!1576643 (not c!146042)) b!1576641))

(assert (= (and d!165547 c!146044) b!1576638))

(assert (= (and d!165547 (not c!146044)) b!1576640))

(assert (= (and b!1576640 res!1077121) b!1576637))

(assert (= (and b!1576637 (not res!1077122)) b!1576639))

(assert (= (and b!1576639 (not res!1077123)) b!1576636))

(assert (=> b!1576641 m!1448427))

(declare-fun m!1448439 () Bool)

(assert (=> b!1576641 m!1448439))

(assert (=> b!1576641 m!1448439))

(declare-fun m!1448441 () Bool)

(assert (=> b!1576641 m!1448441))

(declare-fun m!1448443 () Bool)

(assert (=> b!1576639 m!1448443))

(assert (=> b!1576636 m!1448443))

(assert (=> b!1576637 m!1448443))

(assert (=> d!165547 m!1448427))

(declare-fun m!1448445 () Bool)

(assert (=> d!165547 m!1448445))

(assert (=> d!165547 m!1448423))

(assert (=> b!1576615 d!165547))

(declare-fun d!165561 () Bool)

(declare-fun lt!675604 () (_ BitVec 32))

(declare-fun lt!675603 () (_ BitVec 32))

(assert (=> d!165561 (= lt!675604 (bvmul (bvxor lt!675603 (bvlshr lt!675603 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165561 (= lt!675603 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165561 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077124 (let ((h!38339 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142417 (bvmul (bvxor h!38339 (bvlshr h!38339 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142417 (bvlshr x!142417 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077124 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077124 #b00000000000000000000000000000000))))))

(assert (=> d!165561 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675604 (bvlshr lt!675604 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1576615 d!165561))

(declare-fun d!165563 () Bool)

(assert (=> d!165563 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576614 d!165563))

(declare-fun d!165565 () Bool)

(assert (=> d!165565 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136250 d!165565))

(declare-fun d!165569 () Bool)

(assert (=> d!165569 (= (array_inv!39787 _keys!605) (bvsge (size!51403 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136250 d!165569))

(push 1)

(assert (not d!165547))

(assert (not b!1576641))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

