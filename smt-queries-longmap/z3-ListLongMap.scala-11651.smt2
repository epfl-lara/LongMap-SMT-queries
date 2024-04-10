; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136140 () Bool)

(assert start!136140)

(declare-fun res!1076969 () Bool)

(declare-fun e!879281 () Bool)

(assert (=> start!136140 (=> (not res!1076969) (not e!879281))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136140 (= res!1076969 (validMask!0 mask!898))))

(assert (=> start!136140 e!879281))

(assert (=> start!136140 true))

(declare-datatypes ((array!105487 0))(
  ( (array!105488 (arr!50873 (Array (_ BitVec 32) (_ BitVec 64))) (size!51423 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105487)

(declare-fun array_inv!39600 (array!105487) Bool)

(assert (=> start!136140 (array_inv!39600 _keys!605)))

(declare-fun b!1576450 () Bool)

(declare-fun res!1076968 () Bool)

(assert (=> b!1576450 (=> (not res!1076968) (not e!879281))))

(assert (=> b!1576450 (= res!1076968 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51423 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1576451 () Bool)

(declare-fun res!1076970 () Bool)

(assert (=> b!1576451 (=> (not res!1076970) (not e!879281))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576451 (= res!1076970 (validKeyInArray!0 k0!761))))

(declare-fun b!1576452 () Bool)

(declare-fun lt!675616 () Bool)

(declare-datatypes ((SeekEntryResult!13738 0))(
  ( (MissingZero!13738 (index!57350 (_ BitVec 32))) (Found!13738 (index!57351 (_ BitVec 32))) (Intermediate!13738 (undefined!14550 Bool) (index!57352 (_ BitVec 32)) (x!142350 (_ BitVec 32))) (Undefined!13738) (MissingVacant!13738 (index!57353 (_ BitVec 32))) )
))
(declare-fun lt!675615 () SeekEntryResult!13738)

(assert (=> b!1576452 (= e!879281 (and (or lt!675616 (not (undefined!14550 lt!675615))) (or lt!675616 (undefined!14550 lt!675615))))))

(get-info :version)

(assert (=> b!1576452 (= lt!675616 (not ((_ is Intermediate!13738) lt!675615)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105487 (_ BitVec 32)) SeekEntryResult!13738)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576452 (= lt!675615 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!136140 res!1076969) b!1576450))

(assert (= (and b!1576450 res!1076968) b!1576451))

(assert (= (and b!1576451 res!1076970) b!1576452))

(declare-fun m!1449077 () Bool)

(assert (=> start!136140 m!1449077))

(declare-fun m!1449079 () Bool)

(assert (=> start!136140 m!1449079))

(declare-fun m!1449081 () Bool)

(assert (=> b!1576451 m!1449081))

(declare-fun m!1449083 () Bool)

(assert (=> b!1576452 m!1449083))

(assert (=> b!1576452 m!1449083))

(declare-fun m!1449085 () Bool)

(assert (=> b!1576452 m!1449085))

(check-sat (not b!1576451) (not b!1576452) (not start!136140))
(check-sat)
(get-model)

(declare-fun d!165655 () Bool)

(assert (=> d!165655 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576451 d!165655))

(declare-fun b!1576500 () Bool)

(declare-fun e!879312 () SeekEntryResult!13738)

(declare-fun e!879310 () SeekEntryResult!13738)

(assert (=> b!1576500 (= e!879312 e!879310)))

(declare-fun c!146035 () Bool)

(declare-fun lt!675635 () (_ BitVec 64))

(assert (=> b!1576500 (= c!146035 (or (= lt!675635 k0!761) (= (bvadd lt!675635 lt!675635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576501 () Bool)

(declare-fun lt!675636 () SeekEntryResult!13738)

(assert (=> b!1576501 (and (bvsge (index!57352 lt!675636) #b00000000000000000000000000000000) (bvslt (index!57352 lt!675636) (size!51423 _keys!605)))))

(declare-fun e!879307 () Bool)

(assert (=> b!1576501 (= e!879307 (= (select (arr!50873 _keys!605) (index!57352 lt!675636)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1576503 () Bool)

(assert (=> b!1576503 (and (bvsge (index!57352 lt!675636) #b00000000000000000000000000000000) (bvslt (index!57352 lt!675636) (size!51423 _keys!605)))))

(declare-fun res!1076987 () Bool)

(assert (=> b!1576503 (= res!1076987 (= (select (arr!50873 _keys!605) (index!57352 lt!675636)) k0!761))))

(assert (=> b!1576503 (=> res!1076987 e!879307)))

(declare-fun e!879309 () Bool)

(assert (=> b!1576503 (= e!879309 e!879307)))

(declare-fun b!1576504 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576504 (= e!879310 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1576505 () Bool)

(declare-fun e!879311 () Bool)

(assert (=> b!1576505 (= e!879311 e!879309)))

(declare-fun res!1076988 () Bool)

(assert (=> b!1576505 (= res!1076988 (and ((_ is Intermediate!13738) lt!675636) (not (undefined!14550 lt!675636)) (bvslt (x!142350 lt!675636) #b01111111111111111111111111111110) (bvsge (x!142350 lt!675636) #b00000000000000000000000000000000) (bvsge (x!142350 lt!675636) #b00000000000000000000000000000000)))))

(assert (=> b!1576505 (=> (not res!1076988) (not e!879309))))

(declare-fun b!1576506 () Bool)

(assert (=> b!1576506 (= e!879310 (Intermediate!13738 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576507 () Bool)

(assert (=> b!1576507 (= e!879311 (bvsge (x!142350 lt!675636) #b01111111111111111111111111111110))))

(declare-fun b!1576508 () Bool)

(assert (=> b!1576508 (= e!879312 (Intermediate!13738 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun d!165657 () Bool)

(assert (=> d!165657 e!879311))

(declare-fun c!146034 () Bool)

(assert (=> d!165657 (= c!146034 (and ((_ is Intermediate!13738) lt!675636) (undefined!14550 lt!675636)))))

(assert (=> d!165657 (= lt!675636 e!879312)))

(declare-fun c!146032 () Bool)

(assert (=> d!165657 (= c!146032 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165657 (= lt!675635 (select (arr!50873 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165657 (validMask!0 mask!898)))

(assert (=> d!165657 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!675636)))

(declare-fun b!1576502 () Bool)

(assert (=> b!1576502 (and (bvsge (index!57352 lt!675636) #b00000000000000000000000000000000) (bvslt (index!57352 lt!675636) (size!51423 _keys!605)))))

(declare-fun res!1076986 () Bool)

(assert (=> b!1576502 (= res!1076986 (= (select (arr!50873 _keys!605) (index!57352 lt!675636)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1576502 (=> res!1076986 e!879307)))

(assert (= (and d!165657 c!146032) b!1576508))

(assert (= (and d!165657 (not c!146032)) b!1576500))

(assert (= (and b!1576500 c!146035) b!1576506))

(assert (= (and b!1576500 (not c!146035)) b!1576504))

(assert (= (and d!165657 c!146034) b!1576507))

(assert (= (and d!165657 (not c!146034)) b!1576505))

(assert (= (and b!1576505 res!1076988) b!1576503))

(assert (= (and b!1576503 (not res!1076987)) b!1576502))

(assert (= (and b!1576502 (not res!1076986)) b!1576501))

(declare-fun m!1449097 () Bool)

(assert (=> b!1576502 m!1449097))

(assert (=> b!1576503 m!1449097))

(assert (=> b!1576504 m!1449083))

(declare-fun m!1449099 () Bool)

(assert (=> b!1576504 m!1449099))

(assert (=> b!1576504 m!1449099))

(declare-fun m!1449101 () Bool)

(assert (=> b!1576504 m!1449101))

(assert (=> d!165657 m!1449083))

(declare-fun m!1449103 () Bool)

(assert (=> d!165657 m!1449103))

(assert (=> d!165657 m!1449077))

(assert (=> b!1576501 m!1449097))

(assert (=> b!1576452 d!165657))

(declare-fun d!165667 () Bool)

(declare-fun lt!675646 () (_ BitVec 32))

(declare-fun lt!675645 () (_ BitVec 32))

(assert (=> d!165667 (= lt!675646 (bvmul (bvxor lt!675645 (bvlshr lt!675645 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165667 (= lt!675645 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165667 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077001 (let ((h!38285 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142355 (bvmul (bvxor h!38285 (bvlshr h!38285 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142355 (bvlshr x!142355 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077001 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077001 #b00000000000000000000000000000000))))))

(assert (=> d!165667 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!675646 (bvlshr lt!675646 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1576452 d!165667))

(declare-fun d!165671 () Bool)

(assert (=> d!165671 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136140 d!165671))

(declare-fun d!165679 () Bool)

(assert (=> d!165679 (= (array_inv!39600 _keys!605) (bvsge (size!51423 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136140 d!165679))

(check-sat (not d!165657) (not b!1576504))
