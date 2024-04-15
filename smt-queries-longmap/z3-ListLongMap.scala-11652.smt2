; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136138 () Bool)

(assert start!136138)

(declare-fun res!1076890 () Bool)

(declare-fun e!879142 () Bool)

(assert (=> start!136138 (=> (not res!1076890) (not e!879142))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136138 (= res!1076890 (validMask!0 mask!898))))

(assert (=> start!136138 e!879142))

(assert (=> start!136138 true))

(declare-datatypes ((array!105425 0))(
  ( (array!105426 (arr!50840 (Array (_ BitVec 32) (_ BitVec 64))) (size!51392 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105425)

(declare-fun array_inv!39776 (array!105425) Bool)

(assert (=> start!136138 (array_inv!39776 _keys!605)))

(declare-fun b!1576238 () Bool)

(declare-fun res!1076891 () Bool)

(assert (=> b!1576238 (=> (not res!1076891) (not e!879142))))

(assert (=> b!1576238 (= res!1076891 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51392 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1576239 () Bool)

(declare-fun res!1076889 () Bool)

(assert (=> b!1576239 (=> (not res!1076889) (not e!879142))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576239 (= res!1076889 (validKeyInArray!0 k0!761))))

(declare-fun b!1576240 () Bool)

(declare-fun e!879143 () Bool)

(assert (=> b!1576240 (= e!879142 e!879143)))

(declare-fun res!1076892 () Bool)

(assert (=> b!1576240 (=> (not res!1076892) (not e!879143))))

(declare-fun lt!675379 () Bool)

(declare-datatypes ((SeekEntryResult!13740 0))(
  ( (MissingZero!13740 (index!57358 (_ BitVec 32))) (Found!13740 (index!57359 (_ BitVec 32))) (Intermediate!13740 (undefined!14552 Bool) (index!57360 (_ BitVec 32)) (x!142361 (_ BitVec 32))) (Undefined!13740) (MissingVacant!13740 (index!57361 (_ BitVec 32))) )
))
(declare-fun lt!675380 () SeekEntryResult!13740)

(assert (=> b!1576240 (= res!1076892 (and (or lt!675379 (not (undefined!14552 lt!675380))) (or lt!675379 (undefined!14552 lt!675380))))))

(get-info :version)

(assert (=> b!1576240 (= lt!675379 (not ((_ is Intermediate!13740) lt!675380)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105425 (_ BitVec 32)) SeekEntryResult!13740)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576240 (= lt!675380 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1576241 () Bool)

(declare-fun lt!675381 () SeekEntryResult!13740)

(assert (=> b!1576241 (= e!879143 (and (not ((_ is Undefined!13740) lt!675381)) ((_ is Found!13740) lt!675381) (or (bvslt (index!57359 lt!675381) #b00000000000000000000000000000000) (bvsge (index!57359 lt!675381) (size!51392 _keys!605)))))))

(declare-fun err!174 () SeekEntryResult!13740)

(assert (=> b!1576241 (= lt!675381 err!174)))

(assert (=> b!1576241 true))

(assert (= (and start!136138 res!1076890) b!1576238))

(assert (= (and b!1576238 res!1076891) b!1576239))

(assert (= (and b!1576239 res!1076889) b!1576240))

(assert (= (and b!1576240 res!1076892) b!1576241))

(declare-fun m!1448229 () Bool)

(assert (=> start!136138 m!1448229))

(declare-fun m!1448231 () Bool)

(assert (=> start!136138 m!1448231))

(declare-fun m!1448233 () Bool)

(assert (=> b!1576239 m!1448233))

(declare-fun m!1448235 () Bool)

(assert (=> b!1576240 m!1448235))

(assert (=> b!1576240 m!1448235))

(declare-fun m!1448237 () Bool)

(assert (=> b!1576240 m!1448237))

(check-sat (not b!1576239) (not start!136138) (not b!1576240))
(check-sat)
(get-model)

(declare-fun d!165447 () Bool)

(assert (=> d!165447 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576239 d!165447))

(declare-fun d!165449 () Bool)

(assert (=> d!165449 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136138 d!165449))

(declare-fun d!165459 () Bool)

(assert (=> d!165459 (= (array_inv!39776 _keys!605) (bvsge (size!51392 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136138 d!165459))

(declare-fun b!1576302 () Bool)

(declare-fun e!879186 () Bool)

(declare-fun lt!675409 () SeekEntryResult!13740)

(assert (=> b!1576302 (= e!879186 (bvsge (x!142361 lt!675409) #b01111111111111111111111111111110))))

(declare-fun b!1576303 () Bool)

(assert (=> b!1576303 (and (bvsge (index!57360 lt!675409) #b00000000000000000000000000000000) (bvslt (index!57360 lt!675409) (size!51392 _keys!605)))))

(declare-fun res!1076929 () Bool)

(assert (=> b!1576303 (= res!1076929 (= (select (arr!50840 _keys!605) (index!57360 lt!675409)) k0!761))))

(declare-fun e!879185 () Bool)

(assert (=> b!1576303 (=> res!1076929 e!879185)))

(declare-fun e!879184 () Bool)

(assert (=> b!1576303 (= e!879184 e!879185)))

(declare-fun b!1576304 () Bool)

(assert (=> b!1576304 (and (bvsge (index!57360 lt!675409) #b00000000000000000000000000000000) (bvslt (index!57360 lt!675409) (size!51392 _keys!605)))))

(assert (=> b!1576304 (= e!879185 (= (select (arr!50840 _keys!605) (index!57360 lt!675409)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1576305 () Bool)

(declare-fun e!879183 () SeekEntryResult!13740)

(assert (=> b!1576305 (= e!879183 (Intermediate!13740 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576306 () Bool)

(declare-fun e!879182 () SeekEntryResult!13740)

(assert (=> b!1576306 (= e!879182 (Intermediate!13740 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun d!165461 () Bool)

(assert (=> d!165461 e!879186))

(declare-fun c!145968 () Bool)

(assert (=> d!165461 (= c!145968 (and ((_ is Intermediate!13740) lt!675409) (undefined!14552 lt!675409)))))

(assert (=> d!165461 (= lt!675409 e!879182)))

(declare-fun c!145969 () Bool)

(assert (=> d!165461 (= c!145969 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675408 () (_ BitVec 64))

(assert (=> d!165461 (= lt!675408 (select (arr!50840 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165461 (validMask!0 mask!898)))

(assert (=> d!165461 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!675409)))

(declare-fun b!1576307 () Bool)

(assert (=> b!1576307 (and (bvsge (index!57360 lt!675409) #b00000000000000000000000000000000) (bvslt (index!57360 lt!675409) (size!51392 _keys!605)))))

(declare-fun res!1076930 () Bool)

(assert (=> b!1576307 (= res!1076930 (= (select (arr!50840 _keys!605) (index!57360 lt!675409)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1576307 (=> res!1076930 e!879185)))

(declare-fun b!1576308 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576308 (= e!879183 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1576309 () Bool)

(assert (=> b!1576309 (= e!879182 e!879183)))

(declare-fun c!145967 () Bool)

(assert (=> b!1576309 (= c!145967 (or (= lt!675408 k0!761) (= (bvadd lt!675408 lt!675408) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576310 () Bool)

(assert (=> b!1576310 (= e!879186 e!879184)))

(declare-fun res!1076931 () Bool)

(assert (=> b!1576310 (= res!1076931 (and ((_ is Intermediate!13740) lt!675409) (not (undefined!14552 lt!675409)) (bvslt (x!142361 lt!675409) #b01111111111111111111111111111110) (bvsge (x!142361 lt!675409) #b00000000000000000000000000000000) (bvsge (x!142361 lt!675409) #b00000000000000000000000000000000)))))

(assert (=> b!1576310 (=> (not res!1076931) (not e!879184))))

(assert (= (and d!165461 c!145969) b!1576306))

(assert (= (and d!165461 (not c!145969)) b!1576309))

(assert (= (and b!1576309 c!145967) b!1576305))

(assert (= (and b!1576309 (not c!145967)) b!1576308))

(assert (= (and d!165461 c!145968) b!1576302))

(assert (= (and d!165461 (not c!145968)) b!1576310))

(assert (= (and b!1576310 res!1076931) b!1576303))

(assert (= (and b!1576303 (not res!1076929)) b!1576307))

(assert (= (and b!1576307 (not res!1076930)) b!1576304))

(declare-fun m!1448259 () Bool)

(assert (=> b!1576307 m!1448259))

(assert (=> d!165461 m!1448235))

(declare-fun m!1448261 () Bool)

(assert (=> d!165461 m!1448261))

(assert (=> d!165461 m!1448229))

(assert (=> b!1576304 m!1448259))

(assert (=> b!1576308 m!1448235))

(declare-fun m!1448263 () Bool)

(assert (=> b!1576308 m!1448263))

(assert (=> b!1576308 m!1448263))

(declare-fun m!1448265 () Bool)

(assert (=> b!1576308 m!1448265))

(assert (=> b!1576303 m!1448259))

(assert (=> b!1576240 d!165461))

(declare-fun d!165471 () Bool)

(declare-fun lt!675421 () (_ BitVec 32))

(declare-fun lt!675420 () (_ BitVec 32))

(assert (=> d!165471 (= lt!675421 (bvmul (bvxor lt!675420 (bvlshr lt!675420 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165471 (= lt!675420 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165471 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076932 (let ((h!38330 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142367 (bvmul (bvxor h!38330 (bvlshr h!38330 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142367 (bvlshr x!142367 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076932 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076932 #b00000000000000000000000000000000))))))

(assert (=> d!165471 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!675421 (bvlshr lt!675421 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1576240 d!165471))

(check-sat (not b!1576308) (not d!165461))
(check-sat)
