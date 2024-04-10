; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135036 () Bool)

(assert start!135036)

(declare-fun res!1074430 () Bool)

(declare-fun e!876857 () Bool)

(assert (=> start!135036 (=> (not res!1074430) (not e!876857))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135036 (= res!1074430 (validMask!0 mask!889))))

(assert (=> start!135036 e!876857))

(assert (=> start!135036 true))

(declare-datatypes ((array!105025 0))(
  ( (array!105026 (arr!50676 (Array (_ BitVec 32) (_ BitVec 64))) (size!51226 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105025)

(declare-fun array_inv!39403 (array!105025) Bool)

(assert (=> start!135036 (array_inv!39403 _keys!600)))

(declare-fun b!1572517 () Bool)

(declare-fun res!1074431 () Bool)

(assert (=> b!1572517 (=> (not res!1074431) (not e!876857))))

(assert (=> b!1572517 (= res!1074431 (= (size!51226 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572518 () Bool)

(declare-fun res!1074432 () Bool)

(assert (=> b!1572518 (=> (not res!1074432) (not e!876857))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572518 (= res!1074432 (validKeyInArray!0 k!754))))

(declare-fun b!1572519 () Bool)

(declare-datatypes ((SeekEntryResult!13589 0))(
  ( (MissingZero!13589 (index!56754 (_ BitVec 32))) (Found!13589 (index!56755 (_ BitVec 32))) (Intermediate!13589 (undefined!14401 Bool) (index!56756 (_ BitVec 32)) (x!141529 (_ BitVec 32))) (Undefined!13589) (MissingVacant!13589 (index!56757 (_ BitVec 32))) )
))
(declare-fun lt!674020 () SeekEntryResult!13589)

(assert (=> b!1572519 (= e!876857 (and (is-Intermediate!13589 lt!674020) (not (undefined!14401 lt!674020)) (= (select (arr!50676 _keys!600) (index!56756 lt!674020)) k!754) (or (bvslt (index!56756 lt!674020) #b00000000000000000000000000000000) (bvsge (index!56756 lt!674020) (size!51226 _keys!600)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105025 (_ BitVec 32)) SeekEntryResult!13589)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572519 (= lt!674020 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135036 res!1074430) b!1572517))

(assert (= (and b!1572517 res!1074431) b!1572518))

(assert (= (and b!1572518 res!1074432) b!1572519))

(declare-fun m!1446235 () Bool)

(assert (=> start!135036 m!1446235))

(declare-fun m!1446237 () Bool)

(assert (=> start!135036 m!1446237))

(declare-fun m!1446239 () Bool)

(assert (=> b!1572518 m!1446239))

(declare-fun m!1446241 () Bool)

(assert (=> b!1572519 m!1446241))

(declare-fun m!1446243 () Bool)

(assert (=> b!1572519 m!1446243))

(assert (=> b!1572519 m!1446243))

(declare-fun m!1446245 () Bool)

(assert (=> b!1572519 m!1446245))

(push 1)

(assert (not b!1572519))

(assert (not start!135036))

(assert (not b!1572518))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1572592 () Bool)

(declare-fun e!876898 () SeekEntryResult!13589)

(declare-fun e!876900 () SeekEntryResult!13589)

(assert (=> b!1572592 (= e!876898 e!876900)))

(declare-fun c!145314 () Bool)

(declare-fun lt!674043 () (_ BitVec 64))

(assert (=> b!1572592 (= c!145314 (or (= lt!674043 k!754) (= (bvadd lt!674043 lt!674043) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!164821 () Bool)

(declare-fun e!876899 () Bool)

(assert (=> d!164821 e!876899))

(declare-fun c!145312 () Bool)

(declare-fun lt!674044 () SeekEntryResult!13589)

(assert (=> d!164821 (= c!145312 (and (is-Intermediate!13589 lt!674044) (undefined!14401 lt!674044)))))

(assert (=> d!164821 (= lt!674044 e!876898)))

(declare-fun c!145313 () Bool)

(assert (=> d!164821 (= c!145313 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164821 (= lt!674043 (select (arr!50676 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!164821 (validMask!0 mask!889)))

(assert (=> d!164821 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!674044)))

(declare-fun b!1572593 () Bool)

(assert (=> b!1572593 (= e!876898 (Intermediate!13589 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572594 () Bool)

(assert (=> b!1572594 (and (bvsge (index!56756 lt!674044) #b00000000000000000000000000000000) (bvslt (index!56756 lt!674044) (size!51226 _keys!600)))))

(declare-fun res!1074460 () Bool)

(assert (=> b!1572594 (= res!1074460 (= (select (arr!50676 _keys!600) (index!56756 lt!674044)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!876902 () Bool)

(assert (=> b!1572594 (=> res!1074460 e!876902)))

(declare-fun b!1572595 () Bool)

(assert (=> b!1572595 (= e!876899 (bvsge (x!141529 lt!674044) #b01111111111111111111111111111110))))

(declare-fun b!1572596 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572596 (= e!876900 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1572597 () Bool)

(assert (=> b!1572597 (and (bvsge (index!56756 lt!674044) #b00000000000000000000000000000000) (bvslt (index!56756 lt!674044) (size!51226 _keys!600)))))

(declare-fun res!1074461 () Bool)

(assert (=> b!1572597 (= res!1074461 (= (select (arr!50676 _keys!600) (index!56756 lt!674044)) k!754))))

(assert (=> b!1572597 (=> res!1074461 e!876902)))

(declare-fun e!876901 () Bool)

(assert (=> b!1572597 (= e!876901 e!876902)))

(declare-fun b!1572598 () Bool)

(assert (=> b!1572598 (and (bvsge (index!56756 lt!674044) #b00000000000000000000000000000000) (bvslt (index!56756 lt!674044) (size!51226 _keys!600)))))

(assert (=> b!1572598 (= e!876902 (= (select (arr!50676 _keys!600) (index!56756 lt!674044)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1572599 () Bool)

(assert (=> b!1572599 (= e!876900 (Intermediate!13589 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572600 () Bool)

(assert (=> b!1572600 (= e!876899 e!876901)))

(declare-fun res!1074459 () Bool)

(assert (=> b!1572600 (= res!1074459 (and (is-Intermediate!13589 lt!674044) (not (undefined!14401 lt!674044)) (bvslt (x!141529 lt!674044) #b01111111111111111111111111111110) (bvsge (x!141529 lt!674044) #b00000000000000000000000000000000) (bvsge (x!141529 lt!674044) #b00000000000000000000000000000000)))))

(assert (=> b!1572600 (=> (not res!1074459) (not e!876901))))

(assert (= (and d!164821 c!145313) b!1572593))

(assert (= (and d!164821 (not c!145313)) b!1572592))

(assert (= (and b!1572592 c!145314) b!1572599))

(assert (= (and b!1572592 (not c!145314)) b!1572596))

(assert (= (and d!164821 c!145312) b!1572595))

(assert (= (and d!164821 (not c!145312)) b!1572600))

(assert (= (and b!1572600 res!1074459) b!1572597))

(assert (= (and b!1572597 (not res!1074461)) b!1572594))

(assert (= (and b!1572594 (not res!1074460)) b!1572598))

(assert (=> b!1572596 m!1446243))

(declare-fun m!1446263 () Bool)

(assert (=> b!1572596 m!1446263))

(assert (=> b!1572596 m!1446263))

(declare-fun m!1446265 () Bool)

(assert (=> b!1572596 m!1446265))

(declare-fun m!1446267 () Bool)

(assert (=> b!1572598 m!1446267))

(assert (=> d!164821 m!1446243))

(declare-fun m!1446269 () Bool)

(assert (=> d!164821 m!1446269))

(assert (=> d!164821 m!1446235))

(assert (=> b!1572594 m!1446267))

(assert (=> b!1572597 m!1446267))

(assert (=> b!1572519 d!164821))

(declare-fun d!164829 () Bool)

(declare-fun lt!674056 () (_ BitVec 32))

(declare-fun lt!674055 () (_ BitVec 32))

(assert (=> d!164829 (= lt!674056 (bvmul (bvxor lt!674055 (bvlshr lt!674055 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164829 (= lt!674055 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164829 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074462 (let ((h!38224 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141535 (bvmul (bvxor h!38224 (bvlshr h!38224 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141535 (bvlshr x!141535 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074462 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074462 #b00000000000000000000000000000000))))))

(assert (=> d!164829 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!674056 (bvlshr lt!674056 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1572519 d!164829))

(declare-fun d!164833 () Bool)

(assert (=> d!164833 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135036 d!164833))

(declare-fun d!164839 () Bool)

(assert (=> d!164839 (= (array_inv!39403 _keys!600) (bvsge (size!51226 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135036 d!164839))

(declare-fun d!164841 () Bool)

(assert (=> d!164841 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1572518 d!164841))

(push 1)

(assert (not b!1572596))

(assert (not d!164821))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

