; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136120 () Bool)

(assert start!136120)

(declare-fun res!1076943 () Bool)

(declare-fun e!879829 () Bool)

(assert (=> start!136120 (=> (not res!1076943) (not e!879829))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136120 (= res!1076943 (validMask!0 mask!898))))

(assert (=> start!136120 e!879829))

(assert (=> start!136120 true))

(declare-datatypes ((array!105461 0))(
  ( (array!105462 (arr!50866 (Array (_ BitVec 32) (_ BitVec 64))) (size!51417 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105461)

(declare-fun array_inv!39821 (array!105461) Bool)

(assert (=> start!136120 (array_inv!39821 _keys!605)))

(declare-fun b!1577275 () Bool)

(declare-fun res!1076944 () Bool)

(assert (=> b!1577275 (=> (not res!1076944) (not e!879829))))

(assert (=> b!1577275 (= res!1076944 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51417 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1577276 () Bool)

(declare-fun res!1076945 () Bool)

(assert (=> b!1577276 (=> (not res!1076945) (not e!879829))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577276 (= res!1076945 (validKeyInArray!0 k0!761))))

(declare-datatypes ((SeekEntryResult!13625 0))(
  ( (MissingZero!13625 (index!56898 (_ BitVec 32))) (Found!13625 (index!56899 (_ BitVec 32))) (Intermediate!13625 (undefined!14437 Bool) (index!56900 (_ BitVec 32)) (x!142056 (_ BitVec 32))) (Undefined!13625) (MissingVacant!13625 (index!56901 (_ BitVec 32))) )
))
(declare-fun lt!675867 () SeekEntryResult!13625)

(declare-fun b!1577277 () Bool)

(get-info :version)

(assert (=> b!1577277 (= e!879829 (and ((_ is Intermediate!13625) lt!675867) (not (undefined!14437 lt!675867)) (not (= (select (arr!50866 _keys!605) (index!56900 lt!675867)) k0!761)) (not (= (select (arr!50866 _keys!605) (index!56900 lt!675867)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50866 _keys!605) (index!56900 lt!675867)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105461 (_ BitVec 32)) SeekEntryResult!13625)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577277 (= lt!675867 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!136120 res!1076943) b!1577275))

(assert (= (and b!1577275 res!1076944) b!1577276))

(assert (= (and b!1577276 res!1076945) b!1577277))

(declare-fun m!1450293 () Bool)

(assert (=> start!136120 m!1450293))

(declare-fun m!1450295 () Bool)

(assert (=> start!136120 m!1450295))

(declare-fun m!1450297 () Bool)

(assert (=> b!1577276 m!1450297))

(declare-fun m!1450299 () Bool)

(assert (=> b!1577277 m!1450299))

(declare-fun m!1450301 () Bool)

(assert (=> b!1577277 m!1450301))

(assert (=> b!1577277 m!1450301))

(declare-fun m!1450303 () Bool)

(assert (=> b!1577277 m!1450303))

(check-sat (not b!1577276) (not start!136120) (not b!1577277))
(check-sat)
(get-model)

(declare-fun d!166007 () Bool)

(assert (=> d!166007 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577276 d!166007))

(declare-fun d!166009 () Bool)

(assert (=> d!166009 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136120 d!166009))

(declare-fun d!166019 () Bool)

(assert (=> d!166019 (= (array_inv!39821 _keys!605) (bvsge (size!51417 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136120 d!166019))

(declare-fun d!166021 () Bool)

(declare-fun e!879867 () Bool)

(assert (=> d!166021 e!879867))

(declare-fun c!146453 () Bool)

(declare-fun lt!675882 () SeekEntryResult!13625)

(assert (=> d!166021 (= c!146453 (and ((_ is Intermediate!13625) lt!675882) (undefined!14437 lt!675882)))))

(declare-fun e!879866 () SeekEntryResult!13625)

(assert (=> d!166021 (= lt!675882 e!879866)))

(declare-fun c!146452 () Bool)

(assert (=> d!166021 (= c!146452 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675883 () (_ BitVec 64))

(assert (=> d!166021 (= lt!675883 (select (arr!50866 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!166021 (validMask!0 mask!898)))

(assert (=> d!166021 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!675882)))

(declare-fun b!1577332 () Bool)

(declare-fun e!879865 () SeekEntryResult!13625)

(assert (=> b!1577332 (= e!879865 (Intermediate!13625 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1577333 () Bool)

(assert (=> b!1577333 (= e!879866 e!879865)))

(declare-fun c!146451 () Bool)

(assert (=> b!1577333 (= c!146451 (or (= lt!675883 k0!761) (= (bvadd lt!675883 lt!675883) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577334 () Bool)

(assert (=> b!1577334 (= e!879867 (bvsge (x!142056 lt!675882) #b01111111111111111111111111111110))))

(declare-fun b!1577335 () Bool)

(assert (=> b!1577335 (and (bvsge (index!56900 lt!675882) #b00000000000000000000000000000000) (bvslt (index!56900 lt!675882) (size!51417 _keys!605)))))

(declare-fun e!879864 () Bool)

(assert (=> b!1577335 (= e!879864 (= (select (arr!50866 _keys!605) (index!56900 lt!675882)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1577336 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577336 (= e!879865 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1577337 () Bool)

(declare-fun e!879863 () Bool)

(assert (=> b!1577337 (= e!879867 e!879863)))

(declare-fun res!1076978 () Bool)

(assert (=> b!1577337 (= res!1076978 (and ((_ is Intermediate!13625) lt!675882) (not (undefined!14437 lt!675882)) (bvslt (x!142056 lt!675882) #b01111111111111111111111111111110) (bvsge (x!142056 lt!675882) #b00000000000000000000000000000000) (bvsge (x!142056 lt!675882) #b00000000000000000000000000000000)))))

(assert (=> b!1577337 (=> (not res!1076978) (not e!879863))))

(declare-fun b!1577338 () Bool)

(assert (=> b!1577338 (= e!879866 (Intermediate!13625 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1577339 () Bool)

(assert (=> b!1577339 (and (bvsge (index!56900 lt!675882) #b00000000000000000000000000000000) (bvslt (index!56900 lt!675882) (size!51417 _keys!605)))))

(declare-fun res!1076976 () Bool)

(assert (=> b!1577339 (= res!1076976 (= (select (arr!50866 _keys!605) (index!56900 lt!675882)) k0!761))))

(assert (=> b!1577339 (=> res!1076976 e!879864)))

(assert (=> b!1577339 (= e!879863 e!879864)))

(declare-fun b!1577340 () Bool)

(assert (=> b!1577340 (and (bvsge (index!56900 lt!675882) #b00000000000000000000000000000000) (bvslt (index!56900 lt!675882) (size!51417 _keys!605)))))

(declare-fun res!1076977 () Bool)

(assert (=> b!1577340 (= res!1076977 (= (select (arr!50866 _keys!605) (index!56900 lt!675882)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1577340 (=> res!1076977 e!879864)))

(assert (= (and d!166021 c!146452) b!1577338))

(assert (= (and d!166021 (not c!146452)) b!1577333))

(assert (= (and b!1577333 c!146451) b!1577332))

(assert (= (and b!1577333 (not c!146451)) b!1577336))

(assert (= (and d!166021 c!146453) b!1577334))

(assert (= (and d!166021 (not c!146453)) b!1577337))

(assert (= (and b!1577337 res!1076978) b!1577339))

(assert (= (and b!1577339 (not res!1076976)) b!1577340))

(assert (= (and b!1577340 (not res!1076977)) b!1577335))

(assert (=> d!166021 m!1450301))

(declare-fun m!1450329 () Bool)

(assert (=> d!166021 m!1450329))

(assert (=> d!166021 m!1450293))

(declare-fun m!1450331 () Bool)

(assert (=> b!1577340 m!1450331))

(assert (=> b!1577336 m!1450301))

(declare-fun m!1450333 () Bool)

(assert (=> b!1577336 m!1450333))

(assert (=> b!1577336 m!1450333))

(declare-fun m!1450335 () Bool)

(assert (=> b!1577336 m!1450335))

(assert (=> b!1577335 m!1450331))

(assert (=> b!1577339 m!1450331))

(assert (=> b!1577277 d!166021))

(declare-fun d!166031 () Bool)

(declare-fun lt!675895 () (_ BitVec 32))

(declare-fun lt!675894 () (_ BitVec 32))

(assert (=> d!166031 (= lt!675895 (bvmul (bvxor lt!675894 (bvlshr lt!675894 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!166031 (= lt!675894 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!166031 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076979 (let ((h!38305 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142061 (bvmul (bvxor h!38305 (bvlshr h!38305 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142061 (bvlshr x!142061 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076979 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076979 #b00000000000000000000000000000000))))))

(assert (=> d!166031 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!675895 (bvlshr lt!675895 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1577277 d!166031))

(check-sat (not d!166021) (not b!1577336))
(check-sat)
