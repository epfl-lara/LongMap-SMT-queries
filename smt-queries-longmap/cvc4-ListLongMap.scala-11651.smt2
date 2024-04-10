; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136142 () Bool)

(assert start!136142)

(declare-fun res!1076977 () Bool)

(declare-fun e!879286 () Bool)

(assert (=> start!136142 (=> (not res!1076977) (not e!879286))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136142 (= res!1076977 (validMask!0 mask!898))))

(assert (=> start!136142 e!879286))

(assert (=> start!136142 true))

(declare-datatypes ((array!105489 0))(
  ( (array!105490 (arr!50874 (Array (_ BitVec 32) (_ BitVec 64))) (size!51424 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105489)

(declare-fun array_inv!39601 (array!105489) Bool)

(assert (=> start!136142 (array_inv!39601 _keys!605)))

(declare-fun b!1576459 () Bool)

(declare-fun res!1076978 () Bool)

(assert (=> b!1576459 (=> (not res!1076978) (not e!879286))))

(assert (=> b!1576459 (= res!1076978 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51424 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1576460 () Bool)

(declare-fun res!1076979 () Bool)

(assert (=> b!1576460 (=> (not res!1076979) (not e!879286))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576460 (= res!1076979 (validKeyInArray!0 k!761))))

(declare-fun b!1576461 () Bool)

(declare-fun lt!675621 () Bool)

(declare-datatypes ((SeekEntryResult!13739 0))(
  ( (MissingZero!13739 (index!57354 (_ BitVec 32))) (Found!13739 (index!57355 (_ BitVec 32))) (Intermediate!13739 (undefined!14551 Bool) (index!57356 (_ BitVec 32)) (x!142351 (_ BitVec 32))) (Undefined!13739) (MissingVacant!13739 (index!57357 (_ BitVec 32))) )
))
(declare-fun lt!675622 () SeekEntryResult!13739)

(assert (=> b!1576461 (= e!879286 (and (or lt!675621 (not (undefined!14551 lt!675622))) (or lt!675621 (undefined!14551 lt!675622))))))

(assert (=> b!1576461 (= lt!675621 (not (is-Intermediate!13739 lt!675622)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105489 (_ BitVec 32)) SeekEntryResult!13739)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576461 (= lt!675622 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136142 res!1076977) b!1576459))

(assert (= (and b!1576459 res!1076978) b!1576460))

(assert (= (and b!1576460 res!1076979) b!1576461))

(declare-fun m!1449087 () Bool)

(assert (=> start!136142 m!1449087))

(declare-fun m!1449089 () Bool)

(assert (=> start!136142 m!1449089))

(declare-fun m!1449091 () Bool)

(assert (=> b!1576460 m!1449091))

(declare-fun m!1449093 () Bool)

(assert (=> b!1576461 m!1449093))

(assert (=> b!1576461 m!1449093))

(declare-fun m!1449095 () Bool)

(assert (=> b!1576461 m!1449095))

(push 1)

(assert (not b!1576460))

(assert (not b!1576461))

(assert (not start!136142))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165661 () Bool)

(assert (=> d!165661 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576460 d!165661))

(declare-fun b!1576534 () Bool)

(declare-fun e!879331 () SeekEntryResult!13739)

(assert (=> b!1576534 (= e!879331 (Intermediate!13739 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576535 () Bool)

(declare-fun lt!675644 () SeekEntryResult!13739)

(assert (=> b!1576535 (and (bvsge (index!57356 lt!675644) #b00000000000000000000000000000000) (bvslt (index!57356 lt!675644) (size!51424 _keys!605)))))

(declare-fun res!1077007 () Bool)

(assert (=> b!1576535 (= res!1077007 (= (select (arr!50874 _keys!605) (index!57356 lt!675644)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!879330 () Bool)

(assert (=> b!1576535 (=> res!1077007 e!879330)))

(declare-fun e!879329 () SeekEntryResult!13739)

(declare-fun b!1576536 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576536 (= e!879329 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1576537 () Bool)

(assert (=> b!1576537 (and (bvsge (index!57356 lt!675644) #b00000000000000000000000000000000) (bvslt (index!57356 lt!675644) (size!51424 _keys!605)))))

(declare-fun res!1077006 () Bool)

(assert (=> b!1576537 (= res!1077006 (= (select (arr!50874 _keys!605) (index!57356 lt!675644)) k!761))))

(assert (=> b!1576537 (=> res!1077006 e!879330)))

(declare-fun e!879332 () Bool)

(assert (=> b!1576537 (= e!879332 e!879330)))

(declare-fun d!165665 () Bool)

(declare-fun e!879328 () Bool)

(assert (=> d!165665 e!879328))

(declare-fun c!146043 () Bool)

(assert (=> d!165665 (= c!146043 (and (is-Intermediate!13739 lt!675644) (undefined!14551 lt!675644)))))

(assert (=> d!165665 (= lt!675644 e!879331)))

(declare-fun c!146041 () Bool)

(assert (=> d!165665 (= c!146041 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675643 () (_ BitVec 64))

(assert (=> d!165665 (= lt!675643 (select (arr!50874 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165665 (validMask!0 mask!898)))

(assert (=> d!165665 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675644)))

(declare-fun b!1576538 () Bool)

(assert (=> b!1576538 (= e!879329 (Intermediate!13739 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576539 () Bool)

(assert (=> b!1576539 (and (bvsge (index!57356 lt!675644) #b00000000000000000000000000000000) (bvslt (index!57356 lt!675644) (size!51424 _keys!605)))))

(assert (=> b!1576539 (= e!879330 (= (select (arr!50874 _keys!605) (index!57356 lt!675644)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1576540 () Bool)

(assert (=> b!1576540 (= e!879328 e!879332)))

(declare-fun res!1077005 () Bool)

(assert (=> b!1576540 (= res!1077005 (and (is-Intermediate!13739 lt!675644) (not (undefined!14551 lt!675644)) (bvslt (x!142351 lt!675644) #b01111111111111111111111111111110) (bvsge (x!142351 lt!675644) #b00000000000000000000000000000000) (bvsge (x!142351 lt!675644) #b00000000000000000000000000000000)))))

(assert (=> b!1576540 (=> (not res!1077005) (not e!879332))))

(declare-fun b!1576541 () Bool)

(assert (=> b!1576541 (= e!879328 (bvsge (x!142351 lt!675644) #b01111111111111111111111111111110))))

(declare-fun b!1576542 () Bool)

(assert (=> b!1576542 (= e!879331 e!879329)))

(declare-fun c!146042 () Bool)

(assert (=> b!1576542 (= c!146042 (or (= lt!675643 k!761) (= (bvadd lt!675643 lt!675643) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!165665 c!146041) b!1576534))

(assert (= (and d!165665 (not c!146041)) b!1576542))

(assert (= (and b!1576542 c!146042) b!1576538))

(assert (= (and b!1576542 (not c!146042)) b!1576536))

(assert (= (and d!165665 c!146043) b!1576541))

(assert (= (and d!165665 (not c!146043)) b!1576540))

(assert (= (and b!1576540 res!1077005) b!1576537))

(assert (= (and b!1576537 (not res!1077006)) b!1576535))

(assert (= (and b!1576535 (not res!1077007)) b!1576539))

(assert (=> d!165665 m!1449093))

(declare-fun m!1449113 () Bool)

(assert (=> d!165665 m!1449113))

(assert (=> d!165665 m!1449087))

(declare-fun m!1449115 () Bool)

(assert (=> b!1576539 m!1449115))

(assert (=> b!1576536 m!1449093))

(declare-fun m!1449117 () Bool)

(assert (=> b!1576536 m!1449117))

(assert (=> b!1576536 m!1449117))

(declare-fun m!1449119 () Bool)

(assert (=> b!1576536 m!1449119))

(assert (=> b!1576535 m!1449115))

(assert (=> b!1576537 m!1449115))

(assert (=> b!1576461 d!165665))

(declare-fun d!165673 () Bool)

(declare-fun lt!675658 () (_ BitVec 32))

(declare-fun lt!675657 () (_ BitVec 32))

(assert (=> d!165673 (= lt!675658 (bvmul (bvxor lt!675657 (bvlshr lt!675657 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165673 (= lt!675657 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165673 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077009 (let ((h!38287 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142357 (bvmul (bvxor h!38287 (bvlshr h!38287 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142357 (bvlshr x!142357 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077009 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077009 #b00000000000000000000000000000000))))))

(assert (=> d!165673 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675658 (bvlshr lt!675658 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1576461 d!165673))

(declare-fun d!165677 () Bool)

(assert (=> d!165677 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136142 d!165677))

(declare-fun d!165683 () Bool)

(assert (=> d!165683 (= (array_inv!39601 _keys!605) (bvsge (size!51424 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136142 d!165683))

(push 1)

