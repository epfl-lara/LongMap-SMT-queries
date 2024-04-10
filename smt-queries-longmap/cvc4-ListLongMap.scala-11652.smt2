; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136178 () Bool)

(assert start!136178)

(declare-fun b!1576576 () Bool)

(declare-fun res!1077045 () Bool)

(declare-fun e!879358 () Bool)

(assert (=> b!1576576 (=> (not res!1077045) (not e!879358))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576576 (= res!1077045 (validKeyInArray!0 k!761))))

(declare-fun b!1576577 () Bool)

(declare-fun e!879359 () Bool)

(assert (=> b!1576577 (= e!879358 e!879359)))

(declare-fun res!1077042 () Bool)

(assert (=> b!1576577 (=> (not res!1077042) (not e!879359))))

(declare-fun lt!675683 () Bool)

(declare-datatypes ((SeekEntryResult!13742 0))(
  ( (MissingZero!13742 (index!57366 (_ BitVec 32))) (Found!13742 (index!57367 (_ BitVec 32))) (Intermediate!13742 (undefined!14554 Bool) (index!57368 (_ BitVec 32)) (x!142368 (_ BitVec 32))) (Undefined!13742) (MissingVacant!13742 (index!57369 (_ BitVec 32))) )
))
(declare-fun lt!675684 () SeekEntryResult!13742)

(assert (=> b!1576577 (= res!1077042 (and (or lt!675683 (not (undefined!14554 lt!675684))) (or lt!675683 (undefined!14554 lt!675684))))))

(assert (=> b!1576577 (= lt!675683 (not (is-Intermediate!13742 lt!675684)))))

(declare-datatypes ((array!105498 0))(
  ( (array!105499 (arr!50877 (Array (_ BitVec 32) (_ BitVec 64))) (size!51427 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105498)

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105498 (_ BitVec 32)) SeekEntryResult!13742)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576577 (= lt!675684 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1576575 () Bool)

(declare-fun res!1077044 () Bool)

(assert (=> b!1576575 (=> (not res!1077044) (not e!879358))))

(assert (=> b!1576575 (= res!1077044 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51427 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1576578 () Bool)

(declare-fun lt!675685 () SeekEntryResult!13742)

(assert (=> b!1576578 (= e!879359 (and (not (is-Undefined!13742 lt!675685)) (is-Found!13742 lt!675685) (or (bvslt (index!57367 lt!675685) #b00000000000000000000000000000000) (bvsge (index!57367 lt!675685) (size!51427 _keys!605)))))))

(declare-fun err!182 () SeekEntryResult!13742)

(assert (=> b!1576578 (= lt!675685 err!182)))

(assert (=> b!1576578 true))

(declare-fun res!1077043 () Bool)

(assert (=> start!136178 (=> (not res!1077043) (not e!879358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136178 (= res!1077043 (validMask!0 mask!898))))

(assert (=> start!136178 e!879358))

(assert (=> start!136178 true))

(declare-fun array_inv!39604 (array!105498) Bool)

(assert (=> start!136178 (array_inv!39604 _keys!605)))

(assert (= (and start!136178 res!1077043) b!1576575))

(assert (= (and b!1576575 res!1077044) b!1576576))

(assert (= (and b!1576576 res!1077045) b!1576577))

(assert (= (and b!1576577 res!1077042) b!1576578))

(declare-fun m!1449141 () Bool)

(assert (=> b!1576576 m!1449141))

(declare-fun m!1449143 () Bool)

(assert (=> b!1576577 m!1449143))

(assert (=> b!1576577 m!1449143))

(declare-fun m!1449145 () Bool)

(assert (=> b!1576577 m!1449145))

(declare-fun m!1449147 () Bool)

(assert (=> start!136178 m!1449147))

(declare-fun m!1449149 () Bool)

(assert (=> start!136178 m!1449149))

(push 1)

(assert (not b!1576576))

(assert (not start!136178))

(assert (not b!1576577))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165693 () Bool)

(assert (=> d!165693 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576576 d!165693))

(declare-fun d!165695 () Bool)

(assert (=> d!165695 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136178 d!165695))

(declare-fun d!165707 () Bool)

(assert (=> d!165707 (= (array_inv!39604 _keys!605) (bvsge (size!51427 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136178 d!165707))

(declare-fun b!1576651 () Bool)

(declare-fun e!879401 () SeekEntryResult!13742)

(declare-fun e!879400 () SeekEntryResult!13742)

(assert (=> b!1576651 (= e!879401 e!879400)))

(declare-fun c!146068 () Bool)

(declare-fun lt!675708 () (_ BitVec 64))

(assert (=> b!1576651 (= c!146068 (or (= lt!675708 k!761) (= (bvadd lt!675708 lt!675708) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576652 () Bool)

(assert (=> b!1576652 (= e!879400 (Intermediate!13742 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576653 () Bool)

(declare-fun e!879403 () Bool)

(declare-fun e!879402 () Bool)

(assert (=> b!1576653 (= e!879403 e!879402)))

(declare-fun res!1077073 () Bool)

(declare-fun lt!675709 () SeekEntryResult!13742)

(assert (=> b!1576653 (= res!1077073 (and (is-Intermediate!13742 lt!675709) (not (undefined!14554 lt!675709)) (bvslt (x!142368 lt!675709) #b01111111111111111111111111111110) (bvsge (x!142368 lt!675709) #b00000000000000000000000000000000) (bvsge (x!142368 lt!675709) #b00000000000000000000000000000000)))))

(assert (=> b!1576653 (=> (not res!1077073) (not e!879402))))

(declare-fun b!1576654 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576654 (= e!879400 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun d!165709 () Bool)

(assert (=> d!165709 e!879403))

(declare-fun c!146070 () Bool)

(assert (=> d!165709 (= c!146070 (and (is-Intermediate!13742 lt!675709) (undefined!14554 lt!675709)))))

(assert (=> d!165709 (= lt!675709 e!879401)))

(declare-fun c!146069 () Bool)

(assert (=> d!165709 (= c!146069 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165709 (= lt!675708 (select (arr!50877 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165709 (validMask!0 mask!898)))

(assert (=> d!165709 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675709)))

(declare-fun b!1576655 () Bool)

(assert (=> b!1576655 (= e!879401 (Intermediate!13742 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576656 () Bool)

(assert (=> b!1576656 (and (bvsge (index!57368 lt!675709) #b00000000000000000000000000000000) (bvslt (index!57368 lt!675709) (size!51427 _keys!605)))))

(declare-fun res!1077074 () Bool)

(assert (=> b!1576656 (= res!1077074 (= (select (arr!50877 _keys!605) (index!57368 lt!675709)) k!761))))

(declare-fun e!879404 () Bool)

(assert (=> b!1576656 (=> res!1077074 e!879404)))

(assert (=> b!1576656 (= e!879402 e!879404)))

(declare-fun b!1576657 () Bool)

(assert (=> b!1576657 (and (bvsge (index!57368 lt!675709) #b00000000000000000000000000000000) (bvslt (index!57368 lt!675709) (size!51427 _keys!605)))))

(assert (=> b!1576657 (= e!879404 (= (select (arr!50877 _keys!605) (index!57368 lt!675709)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1576658 () Bool)

(assert (=> b!1576658 (and (bvsge (index!57368 lt!675709) #b00000000000000000000000000000000) (bvslt (index!57368 lt!675709) (size!51427 _keys!605)))))

(declare-fun res!1077072 () Bool)

(assert (=> b!1576658 (= res!1077072 (= (select (arr!50877 _keys!605) (index!57368 lt!675709)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1576658 (=> res!1077072 e!879404)))

(declare-fun b!1576659 () Bool)

(assert (=> b!1576659 (= e!879403 (bvsge (x!142368 lt!675709) #b01111111111111111111111111111110))))

(assert (= (and d!165709 c!146069) b!1576655))

(assert (= (and d!165709 (not c!146069)) b!1576651))

(assert (= (and b!1576651 c!146068) b!1576652))

(assert (= (and b!1576651 (not c!146068)) b!1576654))

(assert (= (and d!165709 c!146070) b!1576659))

(assert (= (and d!165709 (not c!146070)) b!1576653))

(assert (= (and b!1576653 res!1077073) b!1576656))

(assert (= (and b!1576656 (not res!1077074)) b!1576658))

(assert (= (and b!1576658 (not res!1077072)) b!1576657))

(assert (=> d!165709 m!1449143))

(declare-fun m!1449167 () Bool)

(assert (=> d!165709 m!1449167))

(assert (=> d!165709 m!1449147))

(declare-fun m!1449169 () Bool)

(assert (=> b!1576658 m!1449169))

(assert (=> b!1576654 m!1449143))

(declare-fun m!1449171 () Bool)

(assert (=> b!1576654 m!1449171))

(assert (=> b!1576654 m!1449171))

(declare-fun m!1449173 () Bool)

(assert (=> b!1576654 m!1449173))

(assert (=> b!1576657 m!1449169))

(assert (=> b!1576656 m!1449169))

(assert (=> b!1576577 d!165709))

(declare-fun d!165715 () Bool)

(declare-fun lt!675721 () (_ BitVec 32))

(declare-fun lt!675720 () (_ BitVec 32))

(assert (=> d!165715 (= lt!675721 (bvmul (bvxor lt!675720 (bvlshr lt!675720 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165715 (= lt!675720 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165715 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077075 (let ((h!38290 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142374 (bvmul (bvxor h!38290 (bvlshr h!38290 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142374 (bvlshr x!142374 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077075 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077075 #b00000000000000000000000000000000))))))

(assert (=> d!165715 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675721 (bvlshr lt!675721 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1576577 d!165715))

(push 1)

