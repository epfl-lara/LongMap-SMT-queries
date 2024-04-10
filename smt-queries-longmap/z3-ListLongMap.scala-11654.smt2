; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136248 () Bool)

(assert start!136248)

(declare-fun res!1077162 () Bool)

(declare-fun e!879493 () Bool)

(assert (=> start!136248 (=> (not res!1077162) (not e!879493))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136248 (= res!1077162 (validMask!0 mask!898))))

(assert (=> start!136248 e!879493))

(assert (=> start!136248 true))

(declare-datatypes ((array!105514 0))(
  ( (array!105515 (arr!50882 (Array (_ BitVec 32) (_ BitVec 64))) (size!51432 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105514)

(declare-fun array_inv!39609 (array!105514) Bool)

(assert (=> start!136248 (array_inv!39609 _keys!605)))

(declare-fun b!1576798 () Bool)

(declare-fun res!1077164 () Bool)

(assert (=> b!1576798 (=> (not res!1077164) (not e!879493))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576798 (= res!1077164 (validKeyInArray!0 k0!761))))

(declare-fun b!1576797 () Bool)

(declare-fun res!1077165 () Bool)

(assert (=> b!1576797 (=> (not res!1077165) (not e!879493))))

(assert (=> b!1576797 (= res!1077165 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51432 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1576799 () Bool)

(declare-fun e!879494 () Bool)

(assert (=> b!1576799 (= e!879493 e!879494)))

(declare-fun res!1077163 () Bool)

(assert (=> b!1576799 (=> (not res!1077163) (not e!879494))))

(declare-fun lt!675802 () Bool)

(declare-datatypes ((SeekEntryResult!13747 0))(
  ( (MissingZero!13747 (index!57386 (_ BitVec 32))) (Found!13747 (index!57387 (_ BitVec 32))) (Intermediate!13747 (undefined!14559 Bool) (index!57388 (_ BitVec 32)) (x!142401 (_ BitVec 32))) (Undefined!13747) (MissingVacant!13747 (index!57389 (_ BitVec 32))) )
))
(declare-fun lt!675800 () SeekEntryResult!13747)

(assert (=> b!1576799 (= res!1077163 (and (or lt!675802 (not (undefined!14559 lt!675800))) (or lt!675802 (undefined!14559 lt!675800))))))

(get-info :version)

(assert (=> b!1576799 (= lt!675802 (not ((_ is Intermediate!13747) lt!675800)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105514 (_ BitVec 32)) SeekEntryResult!13747)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576799 (= lt!675800 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1576800 () Bool)

(declare-fun lt!675801 () SeekEntryResult!13747)

(assert (=> b!1576800 (= e!879494 (and (not ((_ is Undefined!13747) lt!675801)) (not ((_ is Found!13747) lt!675801)) (not ((_ is MissingZero!13747) lt!675801)) ((_ is MissingVacant!13747) lt!675801) (or (bvslt (index!57389 lt!675801) #b00000000000000000000000000000000) (bvsge (index!57389 lt!675801) (size!51432 _keys!605)))))))

(declare-fun err!202 () SeekEntryResult!13747)

(assert (=> b!1576800 (= lt!675801 err!202)))

(assert (=> b!1576800 true))

(assert (= (and start!136248 res!1077162) b!1576797))

(assert (= (and b!1576797 res!1077165) b!1576798))

(assert (= (and b!1576798 res!1077164) b!1576799))

(assert (= (and b!1576799 res!1077163) b!1576800))

(declare-fun m!1449239 () Bool)

(assert (=> start!136248 m!1449239))

(declare-fun m!1449241 () Bool)

(assert (=> start!136248 m!1449241))

(declare-fun m!1449243 () Bool)

(assert (=> b!1576798 m!1449243))

(declare-fun m!1449245 () Bool)

(assert (=> b!1576799 m!1449245))

(assert (=> b!1576799 m!1449245))

(declare-fun m!1449247 () Bool)

(assert (=> b!1576799 m!1449247))

(check-sat (not start!136248) (not b!1576798) (not b!1576799))
(check-sat)
(get-model)

(declare-fun d!165751 () Bool)

(assert (=> d!165751 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136248 d!165751))

(declare-fun d!165755 () Bool)

(assert (=> d!165755 (= (array_inv!39609 _keys!605) (bvsge (size!51432 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136248 d!165755))

(declare-fun d!165757 () Bool)

(assert (=> d!165757 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576798 d!165757))

(declare-fun b!1576831 () Bool)

(declare-fun e!879516 () Bool)

(declare-fun lt!675817 () SeekEntryResult!13747)

(assert (=> b!1576831 (= e!879516 (bvsge (x!142401 lt!675817) #b01111111111111111111111111111110))))

(declare-fun b!1576832 () Bool)

(declare-fun e!879515 () SeekEntryResult!13747)

(assert (=> b!1576832 (= e!879515 (Intermediate!13747 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun d!165759 () Bool)

(assert (=> d!165759 e!879516))

(declare-fun c!146104 () Bool)

(assert (=> d!165759 (= c!146104 (and ((_ is Intermediate!13747) lt!675817) (undefined!14559 lt!675817)))))

(declare-fun e!879514 () SeekEntryResult!13747)

(assert (=> d!165759 (= lt!675817 e!879514)))

(declare-fun c!146105 () Bool)

(assert (=> d!165759 (= c!146105 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675816 () (_ BitVec 64))

(assert (=> d!165759 (= lt!675816 (select (arr!50882 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165759 (validMask!0 mask!898)))

(assert (=> d!165759 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!675817)))

(declare-fun b!1576833 () Bool)

(assert (=> b!1576833 (= e!879514 (Intermediate!13747 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576834 () Bool)

(assert (=> b!1576834 (= e!879514 e!879515)))

(declare-fun c!146106 () Bool)

(assert (=> b!1576834 (= c!146106 (or (= lt!675816 k0!761) (= (bvadd lt!675816 lt!675816) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576835 () Bool)

(assert (=> b!1576835 (and (bvsge (index!57388 lt!675817) #b00000000000000000000000000000000) (bvslt (index!57388 lt!675817) (size!51432 _keys!605)))))

(declare-fun res!1077185 () Bool)

(assert (=> b!1576835 (= res!1077185 (= (select (arr!50882 _keys!605) (index!57388 lt!675817)) k0!761))))

(declare-fun e!879517 () Bool)

(assert (=> b!1576835 (=> res!1077185 e!879517)))

(declare-fun e!879518 () Bool)

(assert (=> b!1576835 (= e!879518 e!879517)))

(declare-fun b!1576836 () Bool)

(assert (=> b!1576836 (and (bvsge (index!57388 lt!675817) #b00000000000000000000000000000000) (bvslt (index!57388 lt!675817) (size!51432 _keys!605)))))

(declare-fun res!1077186 () Bool)

(assert (=> b!1576836 (= res!1077186 (= (select (arr!50882 _keys!605) (index!57388 lt!675817)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1576836 (=> res!1077186 e!879517)))

(declare-fun b!1576837 () Bool)

(assert (=> b!1576837 (= e!879516 e!879518)))

(declare-fun res!1077184 () Bool)

(assert (=> b!1576837 (= res!1077184 (and ((_ is Intermediate!13747) lt!675817) (not (undefined!14559 lt!675817)) (bvslt (x!142401 lt!675817) #b01111111111111111111111111111110) (bvsge (x!142401 lt!675817) #b00000000000000000000000000000000) (bvsge (x!142401 lt!675817) #b00000000000000000000000000000000)))))

(assert (=> b!1576837 (=> (not res!1077184) (not e!879518))))

(declare-fun b!1576838 () Bool)

(assert (=> b!1576838 (and (bvsge (index!57388 lt!675817) #b00000000000000000000000000000000) (bvslt (index!57388 lt!675817) (size!51432 _keys!605)))))

(assert (=> b!1576838 (= e!879517 (= (select (arr!50882 _keys!605) (index!57388 lt!675817)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1576839 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576839 (= e!879515 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and d!165759 c!146105) b!1576833))

(assert (= (and d!165759 (not c!146105)) b!1576834))

(assert (= (and b!1576834 c!146106) b!1576832))

(assert (= (and b!1576834 (not c!146106)) b!1576839))

(assert (= (and d!165759 c!146104) b!1576831))

(assert (= (and d!165759 (not c!146104)) b!1576837))

(assert (= (and b!1576837 res!1077184) b!1576835))

(assert (= (and b!1576835 (not res!1077185)) b!1576836))

(assert (= (and b!1576836 (not res!1077186)) b!1576838))

(declare-fun m!1449259 () Bool)

(assert (=> b!1576836 m!1449259))

(assert (=> b!1576838 m!1449259))

(assert (=> d!165759 m!1449245))

(declare-fun m!1449261 () Bool)

(assert (=> d!165759 m!1449261))

(assert (=> d!165759 m!1449239))

(assert (=> b!1576839 m!1449245))

(declare-fun m!1449263 () Bool)

(assert (=> b!1576839 m!1449263))

(assert (=> b!1576839 m!1449263))

(declare-fun m!1449265 () Bool)

(assert (=> b!1576839 m!1449265))

(assert (=> b!1576835 m!1449259))

(assert (=> b!1576799 d!165759))

(declare-fun d!165775 () Bool)

(declare-fun lt!675823 () (_ BitVec 32))

(declare-fun lt!675822 () (_ BitVec 32))

(assert (=> d!165775 (= lt!675823 (bvmul (bvxor lt!675822 (bvlshr lt!675822 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165775 (= lt!675822 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165775 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077187 (let ((h!38294 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142404 (bvmul (bvxor h!38294 (bvlshr h!38294 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142404 (bvlshr x!142404 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077187 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077187 #b00000000000000000000000000000000))))))

(assert (=> d!165775 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!675823 (bvlshr lt!675823 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1576799 d!165775))

(check-sat (not b!1576839) (not d!165759))
(check-sat)
