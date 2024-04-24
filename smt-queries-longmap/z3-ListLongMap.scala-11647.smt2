; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136396 () Bool)

(assert start!136396)

(declare-fun res!1077560 () Bool)

(declare-fun e!880391 () Bool)

(assert (=> start!136396 (=> (not res!1077560) (not e!880391))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136396 (= res!1077560 (validMask!0 mask!898))))

(assert (=> start!136396 e!880391))

(assert (=> start!136396 true))

(declare-datatypes ((array!105575 0))(
  ( (array!105576 (arr!50914 (Array (_ BitVec 32) (_ BitVec 64))) (size!51465 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105575)

(declare-fun array_inv!39869 (array!105575) Bool)

(assert (=> start!136396 (array_inv!39869 _keys!605)))

(declare-fun b!1578198 () Bool)

(declare-fun e!880390 () Bool)

(declare-datatypes ((SeekEntryResult!13673 0))(
  ( (MissingZero!13673 (index!57090 (_ BitVec 32))) (Found!13673 (index!57091 (_ BitVec 32))) (Intermediate!13673 (undefined!14485 Bool) (index!57092 (_ BitVec 32)) (x!142268 (_ BitVec 32))) (Undefined!13673) (MissingVacant!13673 (index!57093 (_ BitVec 32))) )
))
(declare-fun lt!676229 () SeekEntryResult!13673)

(get-info :version)

(assert (=> b!1578198 (= e!880390 (and (not ((_ is Undefined!13673) lt!676229)) ((_ is Found!13673) lt!676229) (or (bvslt (index!57091 lt!676229) #b00000000000000000000000000000000) (bvsge (index!57091 lt!676229) (size!51465 _keys!605)))))))

(declare-fun lt!676230 () SeekEntryResult!13673)

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105575 (_ BitVec 32)) SeekEntryResult!13673)

(assert (=> b!1578198 (= lt!676229 (seekKeyOrZeroReturnVacant!0 (x!142268 lt!676230) (index!57092 lt!676230) (index!57092 lt!676230) k0!761 _keys!605 mask!898))))

(declare-fun b!1578195 () Bool)

(declare-fun res!1077558 () Bool)

(assert (=> b!1578195 (=> (not res!1077558) (not e!880391))))

(assert (=> b!1578195 (= res!1077558 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51465 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1578197 () Bool)

(assert (=> b!1578197 (= e!880391 e!880390)))

(declare-fun res!1077559 () Bool)

(assert (=> b!1578197 (=> (not res!1077559) (not e!880390))))

(assert (=> b!1578197 (= res!1077559 (and (not (undefined!14485 lt!676230)) ((_ is Intermediate!13673) lt!676230) (not (= (select (arr!50914 _keys!605) (index!57092 lt!676230)) k0!761)) (not (= (select (arr!50914 _keys!605) (index!57092 lt!676230)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50914 _keys!605) (index!57092 lt!676230)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!57092 lt!676230) #b00000000000000000000000000000000) (bvslt (index!57092 lt!676230) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105575 (_ BitVec 32)) SeekEntryResult!13673)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578197 (= lt!676230 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1578196 () Bool)

(declare-fun res!1077557 () Bool)

(assert (=> b!1578196 (=> (not res!1077557) (not e!880391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578196 (= res!1077557 (validKeyInArray!0 k0!761))))

(assert (= (and start!136396 res!1077560) b!1578195))

(assert (= (and b!1578195 res!1077558) b!1578196))

(assert (= (and b!1578196 res!1077557) b!1578197))

(assert (= (and b!1578197 res!1077559) b!1578198))

(declare-fun m!1450947 () Bool)

(assert (=> start!136396 m!1450947))

(declare-fun m!1450949 () Bool)

(assert (=> start!136396 m!1450949))

(declare-fun m!1450951 () Bool)

(assert (=> b!1578198 m!1450951))

(declare-fun m!1450953 () Bool)

(assert (=> b!1578197 m!1450953))

(declare-fun m!1450955 () Bool)

(assert (=> b!1578197 m!1450955))

(assert (=> b!1578197 m!1450955))

(declare-fun m!1450957 () Bool)

(assert (=> b!1578197 m!1450957))

(declare-fun m!1450959 () Bool)

(assert (=> b!1578196 m!1450959))

(check-sat (not b!1578196) (not b!1578197) (not start!136396) (not b!1578198))
(check-sat)
(get-model)

(declare-fun d!166219 () Bool)

(assert (=> d!166219 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1578196 d!166219))

(declare-fun b!1578249 () Bool)

(declare-fun e!880428 () SeekEntryResult!13673)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578249 (= e!880428 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1578250 () Bool)

(declare-fun e!880426 () SeekEntryResult!13673)

(assert (=> b!1578250 (= e!880426 e!880428)))

(declare-fun c!146612 () Bool)

(declare-fun lt!676252 () (_ BitVec 64))

(assert (=> b!1578250 (= c!146612 (or (= lt!676252 k0!761) (= (bvadd lt!676252 lt!676252) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578251 () Bool)

(declare-fun e!880425 () Bool)

(declare-fun lt!676251 () SeekEntryResult!13673)

(assert (=> b!1578251 (= e!880425 (bvsge (x!142268 lt!676251) #b01111111111111111111111111111110))))

(declare-fun b!1578252 () Bool)

(assert (=> b!1578252 (and (bvsge (index!57092 lt!676251) #b00000000000000000000000000000000) (bvslt (index!57092 lt!676251) (size!51465 _keys!605)))))

(declare-fun res!1077593 () Bool)

(assert (=> b!1578252 (= res!1077593 (= (select (arr!50914 _keys!605) (index!57092 lt!676251)) k0!761))))

(declare-fun e!880424 () Bool)

(assert (=> b!1578252 (=> res!1077593 e!880424)))

(declare-fun e!880427 () Bool)

(assert (=> b!1578252 (= e!880427 e!880424)))

(declare-fun b!1578253 () Bool)

(assert (=> b!1578253 (and (bvsge (index!57092 lt!676251) #b00000000000000000000000000000000) (bvslt (index!57092 lt!676251) (size!51465 _keys!605)))))

(declare-fun res!1077592 () Bool)

(assert (=> b!1578253 (= res!1077592 (= (select (arr!50914 _keys!605) (index!57092 lt!676251)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1578253 (=> res!1077592 e!880424)))

(declare-fun d!166221 () Bool)

(assert (=> d!166221 e!880425))

(declare-fun c!146611 () Bool)

(assert (=> d!166221 (= c!146611 (and ((_ is Intermediate!13673) lt!676251) (undefined!14485 lt!676251)))))

(assert (=> d!166221 (= lt!676251 e!880426)))

(declare-fun c!146613 () Bool)

(assert (=> d!166221 (= c!146613 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!166221 (= lt!676252 (select (arr!50914 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!166221 (validMask!0 mask!898)))

(assert (=> d!166221 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!676251)))

(declare-fun b!1578254 () Bool)

(assert (=> b!1578254 (= e!880426 (Intermediate!13673 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1578255 () Bool)

(assert (=> b!1578255 (= e!880428 (Intermediate!13673 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1578256 () Bool)

(assert (=> b!1578256 (and (bvsge (index!57092 lt!676251) #b00000000000000000000000000000000) (bvslt (index!57092 lt!676251) (size!51465 _keys!605)))))

(assert (=> b!1578256 (= e!880424 (= (select (arr!50914 _keys!605) (index!57092 lt!676251)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1578257 () Bool)

(assert (=> b!1578257 (= e!880425 e!880427)))

(declare-fun res!1077591 () Bool)

(assert (=> b!1578257 (= res!1077591 (and ((_ is Intermediate!13673) lt!676251) (not (undefined!14485 lt!676251)) (bvslt (x!142268 lt!676251) #b01111111111111111111111111111110) (bvsge (x!142268 lt!676251) #b00000000000000000000000000000000) (bvsge (x!142268 lt!676251) #b00000000000000000000000000000000)))))

(assert (=> b!1578257 (=> (not res!1077591) (not e!880427))))

(assert (= (and d!166221 c!146613) b!1578254))

(assert (= (and d!166221 (not c!146613)) b!1578250))

(assert (= (and b!1578250 c!146612) b!1578255))

(assert (= (and b!1578250 (not c!146612)) b!1578249))

(assert (= (and d!166221 c!146611) b!1578251))

(assert (= (and d!166221 (not c!146611)) b!1578257))

(assert (= (and b!1578257 res!1077591) b!1578252))

(assert (= (and b!1578252 (not res!1077593)) b!1578253))

(assert (= (and b!1578253 (not res!1077592)) b!1578256))

(declare-fun m!1450989 () Bool)

(assert (=> b!1578256 m!1450989))

(assert (=> b!1578253 m!1450989))

(assert (=> d!166221 m!1450955))

(declare-fun m!1450991 () Bool)

(assert (=> d!166221 m!1450991))

(assert (=> d!166221 m!1450947))

(assert (=> b!1578249 m!1450955))

(declare-fun m!1450993 () Bool)

(assert (=> b!1578249 m!1450993))

(assert (=> b!1578249 m!1450993))

(declare-fun m!1450995 () Bool)

(assert (=> b!1578249 m!1450995))

(assert (=> b!1578252 m!1450989))

(assert (=> b!1578197 d!166221))

(declare-fun d!166229 () Bool)

(declare-fun lt!676260 () (_ BitVec 32))

(declare-fun lt!676259 () (_ BitVec 32))

(assert (=> d!166229 (= lt!676260 (bvmul (bvxor lt!676259 (bvlshr lt!676259 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!166229 (= lt!676259 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!166229 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077600 (let ((h!38323 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142273 (bvmul (bvxor h!38323 (bvlshr h!38323 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142273 (bvlshr x!142273 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077600 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077600 #b00000000000000000000000000000000))))))

(assert (=> d!166229 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!676260 (bvlshr lt!676260 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1578197 d!166229))

(declare-fun d!166233 () Bool)

(assert (=> d!166233 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136396 d!166233))

(declare-fun d!166241 () Bool)

(assert (=> d!166241 (= (array_inv!39869 _keys!605) (bvsge (size!51465 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136396 d!166241))

(declare-fun b!1578325 () Bool)

(declare-fun e!880467 () SeekEntryResult!13673)

(assert (=> b!1578325 (= e!880467 Undefined!13673)))

(declare-fun d!166243 () Bool)

(declare-fun lt!676282 () SeekEntryResult!13673)

(assert (=> d!166243 (and (or ((_ is Undefined!13673) lt!676282) (not ((_ is Found!13673) lt!676282)) (and (bvsge (index!57091 lt!676282) #b00000000000000000000000000000000) (bvslt (index!57091 lt!676282) (size!51465 _keys!605)))) (or ((_ is Undefined!13673) lt!676282) ((_ is Found!13673) lt!676282) (not ((_ is MissingVacant!13673) lt!676282)) (not (= (index!57093 lt!676282) (index!57092 lt!676230))) (and (bvsge (index!57093 lt!676282) #b00000000000000000000000000000000) (bvslt (index!57093 lt!676282) (size!51465 _keys!605)))) (or ((_ is Undefined!13673) lt!676282) (ite ((_ is Found!13673) lt!676282) (= (select (arr!50914 _keys!605) (index!57091 lt!676282)) k0!761) (and ((_ is MissingVacant!13673) lt!676282) (= (index!57093 lt!676282) (index!57092 lt!676230)) (= (select (arr!50914 _keys!605) (index!57093 lt!676282)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!166243 (= lt!676282 e!880467)))

(declare-fun c!146641 () Bool)

(assert (=> d!166243 (= c!146641 (bvsge (x!142268 lt!676230) #b01111111111111111111111111111110))))

(declare-fun lt!676281 () (_ BitVec 64))

(assert (=> d!166243 (= lt!676281 (select (arr!50914 _keys!605) (index!57092 lt!676230)))))

(assert (=> d!166243 (validMask!0 mask!898)))

(assert (=> d!166243 (= (seekKeyOrZeroReturnVacant!0 (x!142268 lt!676230) (index!57092 lt!676230) (index!57092 lt!676230) k0!761 _keys!605 mask!898) lt!676282)))

(declare-fun b!1578326 () Bool)

(declare-fun e!880465 () SeekEntryResult!13673)

(assert (=> b!1578326 (= e!880467 e!880465)))

(declare-fun c!146642 () Bool)

(assert (=> b!1578326 (= c!146642 (= lt!676281 k0!761))))

(declare-fun b!1578327 () Bool)

(declare-fun e!880466 () SeekEntryResult!13673)

(assert (=> b!1578327 (= e!880466 (seekKeyOrZeroReturnVacant!0 (bvadd (x!142268 lt!676230) #b00000000000000000000000000000001) (nextIndex!0 (index!57092 lt!676230) (bvadd (x!142268 lt!676230) #b00000000000000000000000000000001) mask!898) (index!57092 lt!676230) k0!761 _keys!605 mask!898))))

(declare-fun b!1578328 () Bool)

(assert (=> b!1578328 (= e!880466 (MissingVacant!13673 (index!57092 lt!676230)))))

(declare-fun b!1578329 () Bool)

(declare-fun c!146640 () Bool)

(assert (=> b!1578329 (= c!146640 (= lt!676281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1578329 (= e!880465 e!880466)))

(declare-fun b!1578330 () Bool)

(assert (=> b!1578330 (= e!880465 (Found!13673 (index!57092 lt!676230)))))

(assert (= (and d!166243 c!146641) b!1578325))

(assert (= (and d!166243 (not c!146641)) b!1578326))

(assert (= (and b!1578326 c!146642) b!1578330))

(assert (= (and b!1578326 (not c!146642)) b!1578329))

(assert (= (and b!1578329 c!146640) b!1578328))

(assert (= (and b!1578329 (not c!146640)) b!1578327))

(declare-fun m!1451013 () Bool)

(assert (=> d!166243 m!1451013))

(declare-fun m!1451015 () Bool)

(assert (=> d!166243 m!1451015))

(assert (=> d!166243 m!1450953))

(assert (=> d!166243 m!1450947))

(declare-fun m!1451017 () Bool)

(assert (=> b!1578327 m!1451017))

(assert (=> b!1578327 m!1451017))

(declare-fun m!1451019 () Bool)

(assert (=> b!1578327 m!1451019))

(assert (=> b!1578198 d!166243))

(check-sat (not b!1578249) (not d!166221) (not d!166243) (not b!1578327))
(check-sat)
