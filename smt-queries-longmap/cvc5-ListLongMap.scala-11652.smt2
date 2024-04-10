; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136174 () Bool)

(assert start!136174)

(declare-fun b!1576553 () Bool)

(declare-fun e!879339 () Bool)

(declare-fun e!879341 () Bool)

(assert (=> b!1576553 (= e!879339 e!879341)))

(declare-fun res!1077020 () Bool)

(assert (=> b!1576553 (=> (not res!1077020) (not e!879341))))

(declare-fun lt!675666 () Bool)

(declare-datatypes ((SeekEntryResult!13740 0))(
  ( (MissingZero!13740 (index!57358 (_ BitVec 32))) (Found!13740 (index!57359 (_ BitVec 32))) (Intermediate!13740 (undefined!14552 Bool) (index!57360 (_ BitVec 32)) (x!142366 (_ BitVec 32))) (Undefined!13740) (MissingVacant!13740 (index!57361 (_ BitVec 32))) )
))
(declare-fun lt!675665 () SeekEntryResult!13740)

(assert (=> b!1576553 (= res!1077020 (and (or lt!675666 (not (undefined!14552 lt!675665))) (or lt!675666 (undefined!14552 lt!675665))))))

(assert (=> b!1576553 (= lt!675666 (not (is-Intermediate!13740 lt!675665)))))

(declare-datatypes ((array!105494 0))(
  ( (array!105495 (arr!50875 (Array (_ BitVec 32) (_ BitVec 64))) (size!51425 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105494)

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105494 (_ BitVec 32)) SeekEntryResult!13740)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576553 (= lt!675665 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1576551 () Bool)

(declare-fun res!1077019 () Bool)

(assert (=> b!1576551 (=> (not res!1077019) (not e!879339))))

(assert (=> b!1576551 (= res!1077019 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51425 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1576554 () Bool)

(declare-fun lt!675667 () SeekEntryResult!13740)

(assert (=> b!1576554 (= e!879341 (and (not (is-Undefined!13740 lt!675667)) (is-Found!13740 lt!675667) (or (bvslt (index!57359 lt!675667) #b00000000000000000000000000000000) (bvsge (index!57359 lt!675667) (size!51425 _keys!605)))))))

(declare-fun err!174 () SeekEntryResult!13740)

(assert (=> b!1576554 (= lt!675667 err!174)))

(assert (=> b!1576554 true))

(declare-fun b!1576552 () Bool)

(declare-fun res!1077018 () Bool)

(assert (=> b!1576552 (=> (not res!1077018) (not e!879339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576552 (= res!1077018 (validKeyInArray!0 k!761))))

(declare-fun res!1077021 () Bool)

(assert (=> start!136174 (=> (not res!1077021) (not e!879339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136174 (= res!1077021 (validMask!0 mask!898))))

(assert (=> start!136174 e!879339))

(assert (=> start!136174 true))

(declare-fun array_inv!39602 (array!105494) Bool)

(assert (=> start!136174 (array_inv!39602 _keys!605)))

(assert (= (and start!136174 res!1077021) b!1576551))

(assert (= (and b!1576551 res!1077019) b!1576552))

(assert (= (and b!1576552 res!1077018) b!1576553))

(assert (= (and b!1576553 res!1077020) b!1576554))

(declare-fun m!1449121 () Bool)

(assert (=> b!1576553 m!1449121))

(assert (=> b!1576553 m!1449121))

(declare-fun m!1449123 () Bool)

(assert (=> b!1576553 m!1449123))

(declare-fun m!1449125 () Bool)

(assert (=> b!1576552 m!1449125))

(declare-fun m!1449127 () Bool)

(assert (=> start!136174 m!1449127))

(declare-fun m!1449129 () Bool)

(assert (=> start!136174 m!1449129))

(push 1)

(assert (not b!1576552))

(assert (not start!136174))

(assert (not b!1576553))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165689 () Bool)

(assert (=> d!165689 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576552 d!165689))

(declare-fun d!165691 () Bool)

(assert (=> d!165691 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136174 d!165691))

(declare-fun d!165703 () Bool)

(assert (=> d!165703 (= (array_inv!39602 _keys!605) (bvsge (size!51425 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136174 d!165703))

(declare-fun b!1576632 () Bool)

(declare-fun e!879393 () SeekEntryResult!13740)

(assert (=> b!1576632 (= e!879393 (Intermediate!13740 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576633 () Bool)

(declare-fun e!879390 () Bool)

(declare-fun lt!675701 () SeekEntryResult!13740)

(assert (=> b!1576633 (= e!879390 (bvsge (x!142366 lt!675701) #b01111111111111111111111111111110))))

(declare-fun b!1576634 () Bool)

(assert (=> b!1576634 (and (bvsge (index!57360 lt!675701) #b00000000000000000000000000000000) (bvslt (index!57360 lt!675701) (size!51425 _keys!605)))))

(declare-fun e!879389 () Bool)

(assert (=> b!1576634 (= e!879389 (= (select (arr!50875 _keys!605) (index!57360 lt!675701)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1576635 () Bool)

(declare-fun e!879391 () SeekEntryResult!13740)

(assert (=> b!1576635 (= e!879391 (Intermediate!13740 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576636 () Bool)

(assert (=> b!1576636 (and (bvsge (index!57360 lt!675701) #b00000000000000000000000000000000) (bvslt (index!57360 lt!675701) (size!51425 _keys!605)))))

(declare-fun res!1077062 () Bool)

(assert (=> b!1576636 (= res!1077062 (= (select (arr!50875 _keys!605) (index!57360 lt!675701)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1576636 (=> res!1077062 e!879389)))

(declare-fun b!1576637 () Bool)

(assert (=> b!1576637 (and (bvsge (index!57360 lt!675701) #b00000000000000000000000000000000) (bvslt (index!57360 lt!675701) (size!51425 _keys!605)))))

(declare-fun res!1077064 () Bool)

(assert (=> b!1576637 (= res!1077064 (= (select (arr!50875 _keys!605) (index!57360 lt!675701)) k!761))))

(assert (=> b!1576637 (=> res!1077064 e!879389)))

(declare-fun e!879392 () Bool)

(assert (=> b!1576637 (= e!879392 e!879389)))

(declare-fun b!1576638 () Bool)

(assert (=> b!1576638 (= e!879390 e!879392)))

(declare-fun res!1077063 () Bool)

(assert (=> b!1576638 (= res!1077063 (and (is-Intermediate!13740 lt!675701) (not (undefined!14552 lt!675701)) (bvslt (x!142366 lt!675701) #b01111111111111111111111111111110) (bvsge (x!142366 lt!675701) #b00000000000000000000000000000000) (bvsge (x!142366 lt!675701) #b00000000000000000000000000000000)))))

(assert (=> b!1576638 (=> (not res!1077063) (not e!879392))))

(declare-fun d!165705 () Bool)

(assert (=> d!165705 e!879390))

(declare-fun c!146063 () Bool)

(assert (=> d!165705 (= c!146063 (and (is-Intermediate!13740 lt!675701) (undefined!14552 lt!675701)))))

(assert (=> d!165705 (= lt!675701 e!879393)))

(declare-fun c!146064 () Bool)

(assert (=> d!165705 (= c!146064 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675700 () (_ BitVec 64))

(assert (=> d!165705 (= lt!675700 (select (arr!50875 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165705 (validMask!0 mask!898)))

(assert (=> d!165705 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675701)))

(declare-fun b!1576639 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576639 (= e!879391 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1576640 () Bool)

(assert (=> b!1576640 (= e!879393 e!879391)))

(declare-fun c!146065 () Bool)

(assert (=> b!1576640 (= c!146065 (or (= lt!675700 k!761) (= (bvadd lt!675700 lt!675700) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!165705 c!146064) b!1576632))

(assert (= (and d!165705 (not c!146064)) b!1576640))

(assert (= (and b!1576640 c!146065) b!1576635))

(assert (= (and b!1576640 (not c!146065)) b!1576639))

(assert (= (and d!165705 c!146063) b!1576633))

(assert (= (and d!165705 (not c!146063)) b!1576638))

(assert (= (and b!1576638 res!1077063) b!1576637))

(assert (= (and b!1576637 (not res!1077064)) b!1576636))

(assert (= (and b!1576636 (not res!1077062)) b!1576634))

(assert (=> d!165705 m!1449121))

(declare-fun m!1449159 () Bool)

(assert (=> d!165705 m!1449159))

(assert (=> d!165705 m!1449127))

(assert (=> b!1576639 m!1449121))

(declare-fun m!1449161 () Bool)

(assert (=> b!1576639 m!1449161))

(assert (=> b!1576639 m!1449161))

(declare-fun m!1449163 () Bool)

(assert (=> b!1576639 m!1449163))

(declare-fun m!1449165 () Bool)

(assert (=> b!1576634 m!1449165))

(assert (=> b!1576636 m!1449165))

(assert (=> b!1576637 m!1449165))

(assert (=> b!1576553 d!165705))

(declare-fun d!165713 () Bool)

(declare-fun lt!675715 () (_ BitVec 32))

(declare-fun lt!675714 () (_ BitVec 32))

(assert (=> d!165713 (= lt!675715 (bvmul (bvxor lt!675714 (bvlshr lt!675714 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165713 (= lt!675714 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165713 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077071 (let ((h!38289 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142373 (bvmul (bvxor h!38289 (bvlshr h!38289 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142373 (bvlshr x!142373 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077071 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077071 #b00000000000000000000000000000000))))))

(assert (=> d!165713 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675715 (bvlshr lt!675715 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1576553 d!165713))

(push 1)

(assert (not d!165705))

(assert (not b!1576639))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

