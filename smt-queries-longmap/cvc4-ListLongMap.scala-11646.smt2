; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135900 () Bool)

(assert start!135900)

(declare-fun res!1076518 () Bool)

(declare-fun e!878624 () Bool)

(assert (=> start!135900 (=> (not res!1076518) (not e!878624))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135900 (= res!1076518 (validMask!0 mask!898))))

(assert (=> start!135900 e!878624))

(assert (=> start!135900 true))

(declare-datatypes ((array!105373 0))(
  ( (array!105374 (arr!50823 (Array (_ BitVec 32) (_ BitVec 64))) (size!51375 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105373)

(declare-fun array_inv!39759 (array!105373) Bool)

(assert (=> start!135900 (array_inv!39759 _keys!605)))

(declare-fun b!1575345 () Bool)

(declare-fun res!1076520 () Bool)

(assert (=> b!1575345 (=> (not res!1076520) (not e!878624))))

(assert (=> b!1575345 (= res!1076520 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51375 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575346 () Bool)

(declare-fun res!1076519 () Bool)

(assert (=> b!1575346 (=> (not res!1076519) (not e!878624))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575346 (= res!1076519 (validKeyInArray!0 k!761))))

(declare-fun b!1575347 () Bool)

(declare-datatypes ((SeekEntryResult!13723 0))(
  ( (MissingZero!13723 (index!57290 (_ BitVec 32))) (Found!13723 (index!57291 (_ BitVec 32))) (Intermediate!13723 (undefined!14535 Bool) (index!57292 (_ BitVec 32)) (x!142248 (_ BitVec 32))) (Undefined!13723) (MissingVacant!13723 (index!57293 (_ BitVec 32))) )
))
(declare-fun lt!674991 () SeekEntryResult!13723)

(assert (=> b!1575347 (= e!878624 (and (is-Intermediate!13723 lt!674991) (not (undefined!14535 lt!674991)) (not (= (select (arr!50823 _keys!605) (index!57292 lt!674991)) k!761)) (not (= (select (arr!50823 _keys!605) (index!57292 lt!674991)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvslt (index!57292 lt!674991) #b00000000000000000000000000000000) (bvsge (index!57292 lt!674991) (size!51375 _keys!605)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105373 (_ BitVec 32)) SeekEntryResult!13723)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575347 (= lt!674991 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135900 res!1076518) b!1575345))

(assert (= (and b!1575345 res!1076520) b!1575346))

(assert (= (and b!1575346 res!1076519) b!1575347))

(declare-fun m!1447749 () Bool)

(assert (=> start!135900 m!1447749))

(declare-fun m!1447751 () Bool)

(assert (=> start!135900 m!1447751))

(declare-fun m!1447753 () Bool)

(assert (=> b!1575346 m!1447753))

(declare-fun m!1447755 () Bool)

(assert (=> b!1575347 m!1447755))

(declare-fun m!1447757 () Bool)

(assert (=> b!1575347 m!1447757))

(assert (=> b!1575347 m!1447757))

(declare-fun m!1447759 () Bool)

(assert (=> b!1575347 m!1447759))

(push 1)

(assert (not b!1575346))

(assert (not start!135900))

(assert (not b!1575347))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165243 () Bool)

(assert (=> d!165243 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575346 d!165243))

(declare-fun d!165245 () Bool)

(assert (=> d!165245 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135900 d!165245))

(declare-fun d!165251 () Bool)

(assert (=> d!165251 (= (array_inv!39759 _keys!605) (bvsge (size!51375 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135900 d!165251))

(declare-fun b!1575429 () Bool)

(declare-fun e!878674 () SeekEntryResult!13723)

(assert (=> b!1575429 (= e!878674 (Intermediate!13723 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575430 () Bool)

(declare-fun lt!675023 () SeekEntryResult!13723)

(assert (=> b!1575430 (and (bvsge (index!57292 lt!675023) #b00000000000000000000000000000000) (bvslt (index!57292 lt!675023) (size!51375 _keys!605)))))

(declare-fun res!1076557 () Bool)

(assert (=> b!1575430 (= res!1076557 (= (select (arr!50823 _keys!605) (index!57292 lt!675023)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!878673 () Bool)

(assert (=> b!1575430 (=> res!1076557 e!878673)))

(declare-fun b!1575431 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575431 (= e!878674 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1575432 () Bool)

(assert (=> b!1575432 (and (bvsge (index!57292 lt!675023) #b00000000000000000000000000000000) (bvslt (index!57292 lt!675023) (size!51375 _keys!605)))))

(assert (=> b!1575432 (= e!878673 (= (select (arr!50823 _keys!605) (index!57292 lt!675023)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1575433 () Bool)

(declare-fun e!878671 () Bool)

(declare-fun e!878672 () Bool)

(assert (=> b!1575433 (= e!878671 e!878672)))

(declare-fun res!1076558 () Bool)

(assert (=> b!1575433 (= res!1076558 (and (is-Intermediate!13723 lt!675023) (not (undefined!14535 lt!675023)) (bvslt (x!142248 lt!675023) #b01111111111111111111111111111110) (bvsge (x!142248 lt!675023) #b00000000000000000000000000000000) (bvsge (x!142248 lt!675023) #b00000000000000000000000000000000)))))

(assert (=> b!1575433 (=> (not res!1076558) (not e!878672))))

(declare-fun d!165253 () Bool)

(assert (=> d!165253 e!878671))

(declare-fun c!145709 () Bool)

(assert (=> d!165253 (= c!145709 (and (is-Intermediate!13723 lt!675023) (undefined!14535 lt!675023)))))

(declare-fun e!878675 () SeekEntryResult!13723)

(assert (=> d!165253 (= lt!675023 e!878675)))

(declare-fun c!145710 () Bool)

(assert (=> d!165253 (= c!145710 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675024 () (_ BitVec 64))

(assert (=> d!165253 (= lt!675024 (select (arr!50823 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165253 (validMask!0 mask!898)))

(assert (=> d!165253 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675023)))

(declare-fun b!1575434 () Bool)

(assert (=> b!1575434 (= e!878675 e!878674)))

(declare-fun c!145711 () Bool)

(assert (=> b!1575434 (= c!145711 (or (= lt!675024 k!761) (= (bvadd lt!675024 lt!675024) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1575435 () Bool)

(assert (=> b!1575435 (= e!878671 (bvsge (x!142248 lt!675023) #b01111111111111111111111111111110))))

(declare-fun b!1575436 () Bool)

(assert (=> b!1575436 (= e!878675 (Intermediate!13723 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575437 () Bool)

(assert (=> b!1575437 (and (bvsge (index!57292 lt!675023) #b00000000000000000000000000000000) (bvslt (index!57292 lt!675023) (size!51375 _keys!605)))))

(declare-fun res!1076556 () Bool)

(assert (=> b!1575437 (= res!1076556 (= (select (arr!50823 _keys!605) (index!57292 lt!675023)) k!761))))

(assert (=> b!1575437 (=> res!1076556 e!878673)))

(assert (=> b!1575437 (= e!878672 e!878673)))

(assert (= (and d!165253 c!145710) b!1575436))

(assert (= (and d!165253 (not c!145710)) b!1575434))

(assert (= (and b!1575434 c!145711) b!1575429))

(assert (= (and b!1575434 (not c!145711)) b!1575431))

(assert (= (and d!165253 c!145709) b!1575435))

(assert (= (and d!165253 (not c!145709)) b!1575433))

(assert (= (and b!1575433 res!1076558) b!1575437))

(assert (= (and b!1575437 (not res!1076556)) b!1575430))

(assert (= (and b!1575430 (not res!1076557)) b!1575432))

(assert (=> b!1575431 m!1447757))

(declare-fun m!1447789 () Bool)

(assert (=> b!1575431 m!1447789))

(assert (=> b!1575431 m!1447789))

(declare-fun m!1447791 () Bool)

(assert (=> b!1575431 m!1447791))

(assert (=> d!165253 m!1447757))

(declare-fun m!1447793 () Bool)

(assert (=> d!165253 m!1447793))

(assert (=> d!165253 m!1447749))

(declare-fun m!1447795 () Bool)

(assert (=> b!1575430 m!1447795))

(assert (=> b!1575437 m!1447795))

(assert (=> b!1575432 m!1447795))

(assert (=> b!1575347 d!165253))

(declare-fun d!165259 () Bool)

(declare-fun lt!675030 () (_ BitVec 32))

(declare-fun lt!675029 () (_ BitVec 32))

(assert (=> d!165259 (= lt!675030 (bvmul (bvxor lt!675029 (bvlshr lt!675029 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165259 (= lt!675029 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165259 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076559 (let ((h!38314 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142255 (bvmul (bvxor h!38314 (bvlshr h!38314 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142255 (bvlshr x!142255 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076559 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076559 #b00000000000000000000000000000000))))))

(assert (=> d!165259 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675030 (bvlshr lt!675030 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1575347 d!165259))

(push 1)

(assert (not d!165253))

(assert (not b!1575431))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

