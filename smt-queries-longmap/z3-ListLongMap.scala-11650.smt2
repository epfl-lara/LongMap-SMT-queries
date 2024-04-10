; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136098 () Bool)

(assert start!136098)

(declare-fun res!1076908 () Bool)

(declare-fun e!879187 () Bool)

(assert (=> start!136098 (=> (not res!1076908) (not e!879187))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136098 (= res!1076908 (validMask!0 mask!898))))

(assert (=> start!136098 e!879187))

(assert (=> start!136098 true))

(declare-datatypes ((array!105478 0))(
  ( (array!105479 (arr!50870 (Array (_ BitVec 32) (_ BitVec 64))) (size!51420 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105478)

(declare-fun array_inv!39597 (array!105478) Bool)

(assert (=> start!136098 (array_inv!39597 _keys!605)))

(declare-fun b!1576285 () Bool)

(declare-fun res!1076910 () Bool)

(assert (=> b!1576285 (=> (not res!1076910) (not e!879187))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576285 (= res!1076910 (validKeyInArray!0 k0!761))))

(declare-fun b!1576284 () Bool)

(declare-fun res!1076909 () Bool)

(assert (=> b!1576284 (=> (not res!1076909) (not e!879187))))

(assert (=> b!1576284 (= res!1076909 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51420 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1576287 () Bool)

(declare-datatypes ((SeekEntryResult!13735 0))(
  ( (MissingZero!13735 (index!57338 (_ BitVec 32))) (Found!13735 (index!57339 (_ BitVec 32))) (Intermediate!13735 (undefined!14547 Bool) (index!57340 (_ BitVec 32)) (x!142330 (_ BitVec 32))) (Undefined!13735) (MissingVacant!13735 (index!57341 (_ BitVec 32))) )
))
(declare-fun lt!675544 () SeekEntryResult!13735)

(declare-fun e!879186 () Bool)

(get-info :version)

(assert (=> b!1576287 (= e!879186 (and (not ((_ is Undefined!13735) lt!675544)) (ite ((_ is Found!13735) lt!675544) (not (= (select (arr!50870 _keys!605) (index!57339 lt!675544)) k0!761)) (ite ((_ is MissingZero!13735) lt!675544) (not (= (select (arr!50870 _keys!605) (index!57338 lt!675544)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not ((_ is MissingVacant!13735) lt!675544)) (not (= (select (arr!50870 _keys!605) (index!57341 lt!675544)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!675543 () SeekEntryResult!13735)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105478 (_ BitVec 32)) SeekEntryResult!13735)

(assert (=> b!1576287 (= lt!675544 (seekKeyOrZeroReturnVacant!0 (x!142330 lt!675543) (index!57340 lt!675543) (index!57340 lt!675543) k0!761 _keys!605 mask!898))))

(declare-fun b!1576286 () Bool)

(assert (=> b!1576286 (= e!879187 e!879186)))

(declare-fun res!1076907 () Bool)

(assert (=> b!1576286 (=> (not res!1076907) (not e!879186))))

(assert (=> b!1576286 (= res!1076907 (and (not (undefined!14547 lt!675543)) ((_ is Intermediate!13735) lt!675543) (not (= (select (arr!50870 _keys!605) (index!57340 lt!675543)) k0!761)) (not (= (select (arr!50870 _keys!605) (index!57340 lt!675543)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50870 _keys!605) (index!57340 lt!675543)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!57340 lt!675543) #b00000000000000000000000000000000) (bvslt (index!57340 lt!675543) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105478 (_ BitVec 32)) SeekEntryResult!13735)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576286 (= lt!675543 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!136098 res!1076908) b!1576284))

(assert (= (and b!1576284 res!1076909) b!1576285))

(assert (= (and b!1576285 res!1076910) b!1576286))

(assert (= (and b!1576286 res!1076907) b!1576287))

(declare-fun m!1448979 () Bool)

(assert (=> start!136098 m!1448979))

(declare-fun m!1448981 () Bool)

(assert (=> start!136098 m!1448981))

(declare-fun m!1448983 () Bool)

(assert (=> b!1576285 m!1448983))

(declare-fun m!1448985 () Bool)

(assert (=> b!1576287 m!1448985))

(declare-fun m!1448987 () Bool)

(assert (=> b!1576287 m!1448987))

(declare-fun m!1448989 () Bool)

(assert (=> b!1576287 m!1448989))

(declare-fun m!1448991 () Bool)

(assert (=> b!1576287 m!1448991))

(declare-fun m!1448993 () Bool)

(assert (=> b!1576286 m!1448993))

(declare-fun m!1448995 () Bool)

(assert (=> b!1576286 m!1448995))

(assert (=> b!1576286 m!1448995))

(declare-fun m!1448997 () Bool)

(assert (=> b!1576286 m!1448997))

(check-sat (not b!1576285) (not b!1576286) (not start!136098) (not b!1576287))
(check-sat)
(get-model)

(declare-fun d!165617 () Bool)

(assert (=> d!165617 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576285 d!165617))

(declare-fun b!1576330 () Bool)

(declare-fun e!879217 () Bool)

(declare-fun lt!675560 () SeekEntryResult!13735)

(assert (=> b!1576330 (= e!879217 (bvsge (x!142330 lt!675560) #b01111111111111111111111111111110))))

(declare-fun b!1576331 () Bool)

(assert (=> b!1576331 (and (bvsge (index!57340 lt!675560) #b00000000000000000000000000000000) (bvslt (index!57340 lt!675560) (size!51420 _keys!605)))))

(declare-fun res!1076931 () Bool)

(assert (=> b!1576331 (= res!1076931 (= (select (arr!50870 _keys!605) (index!57340 lt!675560)) k0!761))))

(declare-fun e!879215 () Bool)

(assert (=> b!1576331 (=> res!1076931 e!879215)))

(declare-fun e!879218 () Bool)

(assert (=> b!1576331 (= e!879218 e!879215)))

(declare-fun b!1576332 () Bool)

(declare-fun e!879214 () SeekEntryResult!13735)

(declare-fun e!879216 () SeekEntryResult!13735)

(assert (=> b!1576332 (= e!879214 e!879216)))

(declare-fun c!145977 () Bool)

(declare-fun lt!675559 () (_ BitVec 64))

(assert (=> b!1576332 (= c!145977 (or (= lt!675559 k0!761) (= (bvadd lt!675559 lt!675559) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576333 () Bool)

(assert (=> b!1576333 (= e!879214 (Intermediate!13735 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576334 () Bool)

(assert (=> b!1576334 (= e!879216 (Intermediate!13735 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun d!165619 () Bool)

(assert (=> d!165619 e!879217))

(declare-fun c!145975 () Bool)

(assert (=> d!165619 (= c!145975 (and ((_ is Intermediate!13735) lt!675560) (undefined!14547 lt!675560)))))

(assert (=> d!165619 (= lt!675560 e!879214)))

(declare-fun c!145976 () Bool)

(assert (=> d!165619 (= c!145976 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165619 (= lt!675559 (select (arr!50870 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165619 (validMask!0 mask!898)))

(assert (=> d!165619 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!675560)))

(declare-fun b!1576335 () Bool)

(assert (=> b!1576335 (= e!879217 e!879218)))

(declare-fun res!1076929 () Bool)

(assert (=> b!1576335 (= res!1076929 (and ((_ is Intermediate!13735) lt!675560) (not (undefined!14547 lt!675560)) (bvslt (x!142330 lt!675560) #b01111111111111111111111111111110) (bvsge (x!142330 lt!675560) #b00000000000000000000000000000000) (bvsge (x!142330 lt!675560) #b00000000000000000000000000000000)))))

(assert (=> b!1576335 (=> (not res!1076929) (not e!879218))))

(declare-fun b!1576336 () Bool)

(assert (=> b!1576336 (and (bvsge (index!57340 lt!675560) #b00000000000000000000000000000000) (bvslt (index!57340 lt!675560) (size!51420 _keys!605)))))

(declare-fun res!1076930 () Bool)

(assert (=> b!1576336 (= res!1076930 (= (select (arr!50870 _keys!605) (index!57340 lt!675560)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1576336 (=> res!1076930 e!879215)))

(declare-fun b!1576337 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576337 (= e!879216 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1576338 () Bool)

(assert (=> b!1576338 (and (bvsge (index!57340 lt!675560) #b00000000000000000000000000000000) (bvslt (index!57340 lt!675560) (size!51420 _keys!605)))))

(assert (=> b!1576338 (= e!879215 (= (select (arr!50870 _keys!605) (index!57340 lt!675560)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!165619 c!145976) b!1576333))

(assert (= (and d!165619 (not c!145976)) b!1576332))

(assert (= (and b!1576332 c!145977) b!1576334))

(assert (= (and b!1576332 (not c!145977)) b!1576337))

(assert (= (and d!165619 c!145975) b!1576330))

(assert (= (and d!165619 (not c!145975)) b!1576335))

(assert (= (and b!1576335 res!1076929) b!1576331))

(assert (= (and b!1576331 (not res!1076931)) b!1576336))

(assert (= (and b!1576336 (not res!1076930)) b!1576338))

(declare-fun m!1449019 () Bool)

(assert (=> b!1576336 m!1449019))

(assert (=> b!1576337 m!1448995))

(declare-fun m!1449021 () Bool)

(assert (=> b!1576337 m!1449021))

(assert (=> b!1576337 m!1449021))

(declare-fun m!1449023 () Bool)

(assert (=> b!1576337 m!1449023))

(assert (=> b!1576331 m!1449019))

(assert (=> b!1576338 m!1449019))

(assert (=> d!165619 m!1448995))

(declare-fun m!1449025 () Bool)

(assert (=> d!165619 m!1449025))

(assert (=> d!165619 m!1448979))

(assert (=> b!1576286 d!165619))

(declare-fun d!165625 () Bool)

(declare-fun lt!675568 () (_ BitVec 32))

(declare-fun lt!675567 () (_ BitVec 32))

(assert (=> d!165625 (= lt!675568 (bvmul (bvxor lt!675567 (bvlshr lt!675567 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165625 (= lt!675567 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165625 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076932 (let ((h!38282 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142334 (bvmul (bvxor h!38282 (bvlshr h!38282 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142334 (bvlshr x!142334 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076932 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076932 #b00000000000000000000000000000000))))))

(assert (=> d!165625 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!675568 (bvlshr lt!675568 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1576286 d!165625))

(declare-fun d!165629 () Bool)

(assert (=> d!165629 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136098 d!165629))

(declare-fun d!165637 () Bool)

(assert (=> d!165637 (= (array_inv!39597 _keys!605) (bvsge (size!51420 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136098 d!165637))

(declare-fun b!1576402 () Bool)

(declare-fun c!146004 () Bool)

(declare-fun lt!675590 () (_ BitVec 64))

(assert (=> b!1576402 (= c!146004 (= lt!675590 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!879255 () SeekEntryResult!13735)

(declare-fun e!879253 () SeekEntryResult!13735)

(assert (=> b!1576402 (= e!879255 e!879253)))

(declare-fun b!1576403 () Bool)

(assert (=> b!1576403 (= e!879255 (Found!13735 (index!57340 lt!675543)))))

(declare-fun b!1576404 () Bool)

(assert (=> b!1576404 (= e!879253 (MissingVacant!13735 (index!57340 lt!675543)))))

(declare-fun b!1576405 () Bool)

(declare-fun e!879254 () SeekEntryResult!13735)

(assert (=> b!1576405 (= e!879254 e!879255)))

(declare-fun c!146003 () Bool)

(assert (=> b!1576405 (= c!146003 (= lt!675590 k0!761))))

(declare-fun d!165639 () Bool)

(declare-fun lt!675589 () SeekEntryResult!13735)

(assert (=> d!165639 (and (or ((_ is Undefined!13735) lt!675589) (not ((_ is Found!13735) lt!675589)) (and (bvsge (index!57339 lt!675589) #b00000000000000000000000000000000) (bvslt (index!57339 lt!675589) (size!51420 _keys!605)))) (or ((_ is Undefined!13735) lt!675589) ((_ is Found!13735) lt!675589) (not ((_ is MissingVacant!13735) lt!675589)) (not (= (index!57341 lt!675589) (index!57340 lt!675543))) (and (bvsge (index!57341 lt!675589) #b00000000000000000000000000000000) (bvslt (index!57341 lt!675589) (size!51420 _keys!605)))) (or ((_ is Undefined!13735) lt!675589) (ite ((_ is Found!13735) lt!675589) (= (select (arr!50870 _keys!605) (index!57339 lt!675589)) k0!761) (and ((_ is MissingVacant!13735) lt!675589) (= (index!57341 lt!675589) (index!57340 lt!675543)) (= (select (arr!50870 _keys!605) (index!57341 lt!675589)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!165639 (= lt!675589 e!879254)))

(declare-fun c!146002 () Bool)

(assert (=> d!165639 (= c!146002 (bvsge (x!142330 lt!675543) #b01111111111111111111111111111110))))

(assert (=> d!165639 (= lt!675590 (select (arr!50870 _keys!605) (index!57340 lt!675543)))))

(assert (=> d!165639 (validMask!0 mask!898)))

(assert (=> d!165639 (= (seekKeyOrZeroReturnVacant!0 (x!142330 lt!675543) (index!57340 lt!675543) (index!57340 lt!675543) k0!761 _keys!605 mask!898) lt!675589)))

(declare-fun b!1576406 () Bool)

(assert (=> b!1576406 (= e!879253 (seekKeyOrZeroReturnVacant!0 (bvadd (x!142330 lt!675543) #b00000000000000000000000000000001) (nextIndex!0 (index!57340 lt!675543) (x!142330 lt!675543) mask!898) (index!57340 lt!675543) k0!761 _keys!605 mask!898))))

(declare-fun b!1576407 () Bool)

(assert (=> b!1576407 (= e!879254 Undefined!13735)))

(assert (= (and d!165639 c!146002) b!1576407))

(assert (= (and d!165639 (not c!146002)) b!1576405))

(assert (= (and b!1576405 c!146003) b!1576403))

(assert (= (and b!1576405 (not c!146003)) b!1576402))

(assert (= (and b!1576402 c!146004) b!1576404))

(assert (= (and b!1576402 (not c!146004)) b!1576406))

(declare-fun m!1449043 () Bool)

(assert (=> d!165639 m!1449043))

(declare-fun m!1449045 () Bool)

(assert (=> d!165639 m!1449045))

(assert (=> d!165639 m!1448993))

(assert (=> d!165639 m!1448979))

(declare-fun m!1449047 () Bool)

(assert (=> b!1576406 m!1449047))

(assert (=> b!1576406 m!1449047))

(declare-fun m!1449049 () Bool)

(assert (=> b!1576406 m!1449049))

(assert (=> b!1576287 d!165639))

(check-sat (not b!1576337) (not d!165619) (not d!165639) (not b!1576406))
(check-sat)
