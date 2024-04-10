; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135794 () Bool)

(assert start!135794)

(declare-fun res!1076315 () Bool)

(declare-fun e!878525 () Bool)

(assert (=> start!135794 (=> (not res!1076315) (not e!878525))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135794 (= res!1076315 (validMask!0 mask!898))))

(assert (=> start!135794 e!878525))

(assert (=> start!135794 true))

(declare-datatypes ((array!105380 0))(
  ( (array!105381 (arr!50831 (Array (_ BitVec 32) (_ BitVec 64))) (size!51381 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105380)

(declare-fun array_inv!39558 (array!105380) Bool)

(assert (=> start!135794 (array_inv!39558 _keys!605)))

(declare-fun b!1575172 () Bool)

(declare-fun res!1076316 () Bool)

(assert (=> b!1575172 (=> (not res!1076316) (not e!878525))))

(assert (=> b!1575172 (= res!1076316 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51381 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575173 () Bool)

(declare-fun res!1076314 () Bool)

(assert (=> b!1575173 (=> (not res!1076314) (not e!878525))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575173 (= res!1076314 (validKeyInArray!0 k0!761))))

(declare-fun b!1575174 () Bool)

(declare-datatypes ((SeekEntryResult!13696 0))(
  ( (MissingZero!13696 (index!57182 (_ BitVec 32))) (Found!13696 (index!57183 (_ BitVec 32))) (Intermediate!13696 (undefined!14508 Bool) (index!57184 (_ BitVec 32)) (x!142136 (_ BitVec 32))) (Undefined!13696) (MissingVacant!13696 (index!57185 (_ BitVec 32))) )
))
(declare-fun lt!675088 () SeekEntryResult!13696)

(get-info :version)

(assert (=> b!1575174 (= e!878525 (and ((_ is Intermediate!13696) lt!675088) (not (undefined!14508 lt!675088)) (or (bvslt (index!57184 lt!675088) #b00000000000000000000000000000000) (bvsge (index!57184 lt!675088) (size!51381 _keys!605)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105380 (_ BitVec 32)) SeekEntryResult!13696)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575174 (= lt!675088 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135794 res!1076315) b!1575172))

(assert (= (and b!1575172 res!1076316) b!1575173))

(assert (= (and b!1575173 res!1076314) b!1575174))

(declare-fun m!1448285 () Bool)

(assert (=> start!135794 m!1448285))

(declare-fun m!1448287 () Bool)

(assert (=> start!135794 m!1448287))

(declare-fun m!1448289 () Bool)

(assert (=> b!1575173 m!1448289))

(declare-fun m!1448291 () Bool)

(assert (=> b!1575174 m!1448291))

(assert (=> b!1575174 m!1448291))

(declare-fun m!1448293 () Bool)

(assert (=> b!1575174 m!1448293))

(check-sat (not start!135794) (not b!1575174) (not b!1575173))
(check-sat)
(get-model)

(declare-fun d!165365 () Bool)

(assert (=> d!165365 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135794 d!165365))

(declare-fun d!165375 () Bool)

(assert (=> d!165375 (= (array_inv!39558 _keys!605) (bvsge (size!51381 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135794 d!165375))

(declare-fun b!1575220 () Bool)

(declare-fun e!878555 () Bool)

(declare-fun e!878552 () Bool)

(assert (=> b!1575220 (= e!878555 e!878552)))

(declare-fun res!1076339 () Bool)

(declare-fun lt!675101 () SeekEntryResult!13696)

(assert (=> b!1575220 (= res!1076339 (and ((_ is Intermediate!13696) lt!675101) (not (undefined!14508 lt!675101)) (bvslt (x!142136 lt!675101) #b01111111111111111111111111111110) (bvsge (x!142136 lt!675101) #b00000000000000000000000000000000) (bvsge (x!142136 lt!675101) #b00000000000000000000000000000000)))))

(assert (=> b!1575220 (=> (not res!1076339) (not e!878552))))

(declare-fun b!1575221 () Bool)

(assert (=> b!1575221 (and (bvsge (index!57184 lt!675101) #b00000000000000000000000000000000) (bvslt (index!57184 lt!675101) (size!51381 _keys!605)))))

(declare-fun res!1076338 () Bool)

(assert (=> b!1575221 (= res!1076338 (= (select (arr!50831 _keys!605) (index!57184 lt!675101)) k0!761))))

(declare-fun e!878554 () Bool)

(assert (=> b!1575221 (=> res!1076338 e!878554)))

(assert (=> b!1575221 (= e!878552 e!878554)))

(declare-fun b!1575222 () Bool)

(declare-fun e!878556 () SeekEntryResult!13696)

(assert (=> b!1575222 (= e!878556 (Intermediate!13696 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575223 () Bool)

(declare-fun e!878553 () SeekEntryResult!13696)

(assert (=> b!1575223 (= e!878553 (Intermediate!13696 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575224 () Bool)

(assert (=> b!1575224 (and (bvsge (index!57184 lt!675101) #b00000000000000000000000000000000) (bvslt (index!57184 lt!675101) (size!51381 _keys!605)))))

(declare-fun res!1076340 () Bool)

(assert (=> b!1575224 (= res!1076340 (= (select (arr!50831 _keys!605) (index!57184 lt!675101)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1575224 (=> res!1076340 e!878554)))

(declare-fun b!1575225 () Bool)

(assert (=> b!1575225 (= e!878553 e!878556)))

(declare-fun c!145705 () Bool)

(declare-fun lt!675100 () (_ BitVec 64))

(assert (=> b!1575225 (= c!145705 (or (= lt!675100 k0!761) (= (bvadd lt!675100 lt!675100) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!165377 () Bool)

(assert (=> d!165377 e!878555))

(declare-fun c!145706 () Bool)

(assert (=> d!165377 (= c!145706 (and ((_ is Intermediate!13696) lt!675101) (undefined!14508 lt!675101)))))

(assert (=> d!165377 (= lt!675101 e!878553)))

(declare-fun c!145707 () Bool)

(assert (=> d!165377 (= c!145707 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165377 (= lt!675100 (select (arr!50831 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165377 (validMask!0 mask!898)))

(assert (=> d!165377 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!675101)))

(declare-fun b!1575226 () Bool)

(assert (=> b!1575226 (and (bvsge (index!57184 lt!675101) #b00000000000000000000000000000000) (bvslt (index!57184 lt!675101) (size!51381 _keys!605)))))

(assert (=> b!1575226 (= e!878554 (= (select (arr!50831 _keys!605) (index!57184 lt!675101)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1575227 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575227 (= e!878556 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1575228 () Bool)

(assert (=> b!1575228 (= e!878555 (bvsge (x!142136 lt!675101) #b01111111111111111111111111111110))))

(assert (= (and d!165377 c!145707) b!1575223))

(assert (= (and d!165377 (not c!145707)) b!1575225))

(assert (= (and b!1575225 c!145705) b!1575222))

(assert (= (and b!1575225 (not c!145705)) b!1575227))

(assert (= (and d!165377 c!145706) b!1575228))

(assert (= (and d!165377 (not c!145706)) b!1575220))

(assert (= (and b!1575220 res!1076339) b!1575221))

(assert (= (and b!1575221 (not res!1076338)) b!1575224))

(assert (= (and b!1575224 (not res!1076340)) b!1575226))

(assert (=> b!1575227 m!1448291))

(declare-fun m!1448305 () Bool)

(assert (=> b!1575227 m!1448305))

(assert (=> b!1575227 m!1448305))

(declare-fun m!1448307 () Bool)

(assert (=> b!1575227 m!1448307))

(declare-fun m!1448309 () Bool)

(assert (=> b!1575226 m!1448309))

(assert (=> b!1575221 m!1448309))

(assert (=> d!165377 m!1448291))

(declare-fun m!1448311 () Bool)

(assert (=> d!165377 m!1448311))

(assert (=> d!165377 m!1448285))

(assert (=> b!1575224 m!1448309))

(assert (=> b!1575174 d!165377))

(declare-fun d!165387 () Bool)

(declare-fun lt!675113 () (_ BitVec 32))

(declare-fun lt!675112 () (_ BitVec 32))

(assert (=> d!165387 (= lt!675113 (bvmul (bvxor lt!675112 (bvlshr lt!675112 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165387 (= lt!675112 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165387 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076341 (let ((h!38261 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142141 (bvmul (bvxor h!38261 (bvlshr h!38261 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142141 (bvlshr x!142141 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076341 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076341 #b00000000000000000000000000000000))))))

(assert (=> d!165387 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!675113 (bvlshr lt!675113 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1575174 d!165387))

(declare-fun d!165391 () Bool)

(assert (=> d!165391 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575173 d!165391))

(check-sat (not b!1575227) (not d!165377))
(check-sat)
