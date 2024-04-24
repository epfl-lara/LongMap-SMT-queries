; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136314 () Bool)

(assert start!136314)

(declare-fun res!1077397 () Bool)

(declare-fun e!880231 () Bool)

(assert (=> start!136314 (=> (not res!1077397) (not e!880231))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136314 (= res!1077397 (validMask!0 mask!898))))

(assert (=> start!136314 e!880231))

(assert (=> start!136314 true))

(declare-datatypes ((array!105547 0))(
  ( (array!105548 (arr!50903 (Array (_ BitVec 32) (_ BitVec 64))) (size!51454 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105547)

(declare-fun array_inv!39858 (array!105547) Bool)

(assert (=> start!136314 (array_inv!39858 _keys!605)))

(declare-fun b!1577932 () Bool)

(declare-fun res!1077398 () Bool)

(assert (=> b!1577932 (=> (not res!1077398) (not e!880231))))

(assert (=> b!1577932 (= res!1077398 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51454 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1577933 () Bool)

(declare-fun res!1077396 () Bool)

(assert (=> b!1577933 (=> (not res!1077396) (not e!880231))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577933 (= res!1077396 (validKeyInArray!0 k!761))))

(declare-datatypes ((SeekEntryResult!13662 0))(
  ( (MissingZero!13662 (index!57046 (_ BitVec 32))) (Found!13662 (index!57047 (_ BitVec 32))) (Intermediate!13662 (undefined!14474 Bool) (index!57048 (_ BitVec 32)) (x!142213 (_ BitVec 32))) (Undefined!13662) (MissingVacant!13662 (index!57049 (_ BitVec 32))) )
))
(declare-fun lt!676122 () SeekEntryResult!13662)

(declare-fun b!1577934 () Bool)

(assert (=> b!1577934 (= e!880231 (and (is-Intermediate!13662 lt!676122) (not (undefined!14474 lt!676122)) (not (= (select (arr!50903 _keys!605) (index!57048 lt!676122)) k!761)) (= (select (arr!50903 _keys!605) (index!57048 lt!676122)) #b0000000000000000000000000000000000000000000000000000000000000000) (or (bvslt (index!57048 lt!676122) #b00000000000000000000000000000000) (bvsge (index!57048 lt!676122) (size!51454 _keys!605)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105547 (_ BitVec 32)) SeekEntryResult!13662)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577934 (= lt!676122 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136314 res!1077397) b!1577932))

(assert (= (and b!1577932 res!1077398) b!1577933))

(assert (= (and b!1577933 res!1077396) b!1577934))

(declare-fun m!1450779 () Bool)

(assert (=> start!136314 m!1450779))

(declare-fun m!1450781 () Bool)

(assert (=> start!136314 m!1450781))

(declare-fun m!1450783 () Bool)

(assert (=> b!1577933 m!1450783))

(declare-fun m!1450785 () Bool)

(assert (=> b!1577934 m!1450785))

(declare-fun m!1450787 () Bool)

(assert (=> b!1577934 m!1450787))

(assert (=> b!1577934 m!1450787))

(declare-fun m!1450789 () Bool)

(assert (=> b!1577934 m!1450789))

(push 1)

(assert (not start!136314))

(assert (not b!1577934))

(assert (not b!1577933))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166157 () Bool)

(assert (=> d!166157 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136314 d!166157))

(declare-fun d!166163 () Bool)

(assert (=> d!166163 (= (array_inv!39858 _keys!605) (bvsge (size!51454 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136314 d!166163))

(declare-fun b!1578016 () Bool)

(declare-fun e!880283 () SeekEntryResult!13662)

(declare-fun e!880280 () SeekEntryResult!13662)

(assert (=> b!1578016 (= e!880283 e!880280)))

(declare-fun c!146573 () Bool)

(declare-fun lt!676155 () (_ BitVec 64))

(assert (=> b!1578016 (= c!146573 (or (= lt!676155 k!761) (= (bvadd lt!676155 lt!676155) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!166165 () Bool)

(declare-fun e!880279 () Bool)

(assert (=> d!166165 e!880279))

(declare-fun c!146572 () Bool)

(declare-fun lt!676154 () SeekEntryResult!13662)

(assert (=> d!166165 (= c!146572 (and (is-Intermediate!13662 lt!676154) (undefined!14474 lt!676154)))))

(assert (=> d!166165 (= lt!676154 e!880283)))

(declare-fun c!146571 () Bool)

(assert (=> d!166165 (= c!146571 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!166165 (= lt!676155 (select (arr!50903 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!166165 (validMask!0 mask!898)))

(assert (=> d!166165 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!676154)))

(declare-fun b!1578017 () Bool)

(assert (=> b!1578017 (and (bvsge (index!57048 lt!676154) #b00000000000000000000000000000000) (bvslt (index!57048 lt!676154) (size!51454 _keys!605)))))

(declare-fun e!880282 () Bool)

(assert (=> b!1578017 (= e!880282 (= (select (arr!50903 _keys!605) (index!57048 lt!676154)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1578018 () Bool)

(assert (=> b!1578018 (= e!880280 (Intermediate!13662 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1578019 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578019 (= e!880280 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1578020 () Bool)

(assert (=> b!1578020 (and (bvsge (index!57048 lt!676154) #b00000000000000000000000000000000) (bvslt (index!57048 lt!676154) (size!51454 _keys!605)))))

(declare-fun res!1077434 () Bool)

(assert (=> b!1578020 (= res!1077434 (= (select (arr!50903 _keys!605) (index!57048 lt!676154)) k!761))))

(assert (=> b!1578020 (=> res!1077434 e!880282)))

(declare-fun e!880281 () Bool)

(assert (=> b!1578020 (= e!880281 e!880282)))

(declare-fun b!1578021 () Bool)

(assert (=> b!1578021 (= e!880283 (Intermediate!13662 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1578022 () Bool)

(assert (=> b!1578022 (= e!880279 e!880281)))

(declare-fun res!1077436 () Bool)

(assert (=> b!1578022 (= res!1077436 (and (is-Intermediate!13662 lt!676154) (not (undefined!14474 lt!676154)) (bvslt (x!142213 lt!676154) #b01111111111111111111111111111110) (bvsge (x!142213 lt!676154) #b00000000000000000000000000000000) (bvsge (x!142213 lt!676154) #b00000000000000000000000000000000)))))

(assert (=> b!1578022 (=> (not res!1077436) (not e!880281))))

(declare-fun b!1578023 () Bool)

(assert (=> b!1578023 (= e!880279 (bvsge (x!142213 lt!676154) #b01111111111111111111111111111110))))

(declare-fun b!1578024 () Bool)

(assert (=> b!1578024 (and (bvsge (index!57048 lt!676154) #b00000000000000000000000000000000) (bvslt (index!57048 lt!676154) (size!51454 _keys!605)))))

(declare-fun res!1077435 () Bool)

(assert (=> b!1578024 (= res!1077435 (= (select (arr!50903 _keys!605) (index!57048 lt!676154)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1578024 (=> res!1077435 e!880282)))

(assert (= (and d!166165 c!146571) b!1578021))

(assert (= (and d!166165 (not c!146571)) b!1578016))

(assert (= (and b!1578016 c!146573) b!1578018))

(assert (= (and b!1578016 (not c!146573)) b!1578019))

(assert (= (and d!166165 c!146572) b!1578023))

(assert (= (and d!166165 (not c!146572)) b!1578022))

(assert (= (and b!1578022 res!1077436) b!1578020))

(assert (= (and b!1578020 (not res!1077434)) b!1578024))

(assert (= (and b!1578024 (not res!1077435)) b!1578017))

(declare-fun m!1450819 () Bool)

(assert (=> b!1578020 m!1450819))

(assert (=> b!1578024 m!1450819))

(assert (=> b!1578017 m!1450819))

(assert (=> d!166165 m!1450787))

(declare-fun m!1450821 () Bool)

(assert (=> d!166165 m!1450821))

(assert (=> d!166165 m!1450779))

(assert (=> b!1578019 m!1450787))

(declare-fun m!1450823 () Bool)

(assert (=> b!1578019 m!1450823))

(assert (=> b!1578019 m!1450823))

(declare-fun m!1450825 () Bool)

(assert (=> b!1578019 m!1450825))

(assert (=> b!1577934 d!166165))

(declare-fun d!166175 () Bool)

(declare-fun lt!676161 () (_ BitVec 32))

(declare-fun lt!676160 () (_ BitVec 32))

(assert (=> d!166175 (= lt!676161 (bvmul (bvxor lt!676160 (bvlshr lt!676160 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!166175 (= lt!676160 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!166175 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077437 (let ((h!38319 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142220 (bvmul (bvxor h!38319 (bvlshr h!38319 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142220 (bvlshr x!142220 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077437 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077437 #b00000000000000000000000000000000))))))

(assert (=> d!166175 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!676161 (bvlshr lt!676161 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1577934 d!166175))

(declare-fun d!166179 () Bool)

(assert (=> d!166179 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577933 d!166179))

(push 1)

(assert (not d!166165))

(assert (not b!1578019))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

