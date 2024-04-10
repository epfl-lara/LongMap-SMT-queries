; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135830 () Bool)

(assert start!135830)

(declare-fun res!1076373 () Bool)

(declare-fun e!878588 () Bool)

(assert (=> start!135830 (=> (not res!1076373) (not e!878588))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135830 (= res!1076373 (validMask!0 mask!898))))

(assert (=> start!135830 e!878588))

(assert (=> start!135830 true))

(declare-datatypes ((array!105389 0))(
  ( (array!105390 (arr!50834 (Array (_ BitVec 32) (_ BitVec 64))) (size!51384 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105389)

(declare-fun array_inv!39561 (array!105389) Bool)

(assert (=> start!135830 (array_inv!39561 _keys!605)))

(declare-fun b!1575280 () Bool)

(declare-fun res!1076371 () Bool)

(assert (=> b!1575280 (=> (not res!1076371) (not e!878588))))

(assert (=> b!1575280 (= res!1076371 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51384 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575281 () Bool)

(declare-fun res!1076372 () Bool)

(assert (=> b!1575281 (=> (not res!1076372) (not e!878588))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575281 (= res!1076372 (validKeyInArray!0 k0!761))))

(declare-datatypes ((SeekEntryResult!13699 0))(
  ( (MissingZero!13699 (index!57194 (_ BitVec 32))) (Found!13699 (index!57195 (_ BitVec 32))) (Intermediate!13699 (undefined!14511 Bool) (index!57196 (_ BitVec 32)) (x!142153 (_ BitVec 32))) (Undefined!13699) (MissingVacant!13699 (index!57197 (_ BitVec 32))) )
))
(declare-fun lt!675133 () SeekEntryResult!13699)

(declare-fun b!1575282 () Bool)

(get-info :version)

(assert (=> b!1575282 (= e!878588 (and ((_ is Intermediate!13699) lt!675133) (not (undefined!14511 lt!675133)) (= (select (arr!50834 _keys!605) (index!57196 lt!675133)) k0!761) (or (bvslt (index!57196 lt!675133) #b00000000000000000000000000000000) (bvsge (index!57196 lt!675133) (size!51384 _keys!605)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105389 (_ BitVec 32)) SeekEntryResult!13699)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575282 (= lt!675133 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135830 res!1076373) b!1575280))

(assert (= (and b!1575280 res!1076371) b!1575281))

(assert (= (and b!1575281 res!1076372) b!1575282))

(declare-fun m!1448341 () Bool)

(assert (=> start!135830 m!1448341))

(declare-fun m!1448343 () Bool)

(assert (=> start!135830 m!1448343))

(declare-fun m!1448345 () Bool)

(assert (=> b!1575281 m!1448345))

(declare-fun m!1448347 () Bool)

(assert (=> b!1575282 m!1448347))

(declare-fun m!1448349 () Bool)

(assert (=> b!1575282 m!1448349))

(assert (=> b!1575282 m!1448349))

(declare-fun m!1448351 () Bool)

(assert (=> b!1575282 m!1448351))

(check-sat (not b!1575281) (not start!135830) (not b!1575282))
(check-sat)
(get-model)

(declare-fun d!165397 () Bool)

(assert (=> d!165397 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575281 d!165397))

(declare-fun d!165399 () Bool)

(assert (=> d!165399 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135830 d!165399))

(declare-fun d!165405 () Bool)

(assert (=> d!165405 (= (array_inv!39561 _keys!605) (bvsge (size!51384 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135830 d!165405))

(declare-fun b!1575324 () Bool)

(declare-fun e!878615 () Bool)

(declare-fun e!878614 () Bool)

(assert (=> b!1575324 (= e!878615 e!878614)))

(declare-fun res!1076393 () Bool)

(declare-fun lt!675146 () SeekEntryResult!13699)

(assert (=> b!1575324 (= res!1076393 (and ((_ is Intermediate!13699) lt!675146) (not (undefined!14511 lt!675146)) (bvslt (x!142153 lt!675146) #b01111111111111111111111111111110) (bvsge (x!142153 lt!675146) #b00000000000000000000000000000000) (bvsge (x!142153 lt!675146) #b00000000000000000000000000000000)))))

(assert (=> b!1575324 (=> (not res!1076393) (not e!878614))))

(declare-fun b!1575325 () Bool)

(assert (=> b!1575325 (and (bvsge (index!57196 lt!675146) #b00000000000000000000000000000000) (bvslt (index!57196 lt!675146) (size!51384 _keys!605)))))

(declare-fun res!1076392 () Bool)

(assert (=> b!1575325 (= res!1076392 (= (select (arr!50834 _keys!605) (index!57196 lt!675146)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!878616 () Bool)

(assert (=> b!1575325 (=> res!1076392 e!878616)))

(declare-fun d!165407 () Bool)

(assert (=> d!165407 e!878615))

(declare-fun c!145733 () Bool)

(assert (=> d!165407 (= c!145733 (and ((_ is Intermediate!13699) lt!675146) (undefined!14511 lt!675146)))))

(declare-fun e!878613 () SeekEntryResult!13699)

(assert (=> d!165407 (= lt!675146 e!878613)))

(declare-fun c!145732 () Bool)

(assert (=> d!165407 (= c!145732 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675145 () (_ BitVec 64))

(assert (=> d!165407 (= lt!675145 (select (arr!50834 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165407 (validMask!0 mask!898)))

(assert (=> d!165407 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!675146)))

(declare-fun b!1575326 () Bool)

(assert (=> b!1575326 (and (bvsge (index!57196 lt!675146) #b00000000000000000000000000000000) (bvslt (index!57196 lt!675146) (size!51384 _keys!605)))))

(declare-fun res!1076391 () Bool)

(assert (=> b!1575326 (= res!1076391 (= (select (arr!50834 _keys!605) (index!57196 lt!675146)) k0!761))))

(assert (=> b!1575326 (=> res!1076391 e!878616)))

(assert (=> b!1575326 (= e!878614 e!878616)))

(declare-fun b!1575327 () Bool)

(assert (=> b!1575327 (= e!878615 (bvsge (x!142153 lt!675146) #b01111111111111111111111111111110))))

(declare-fun b!1575328 () Bool)

(declare-fun e!878617 () SeekEntryResult!13699)

(assert (=> b!1575328 (= e!878617 (Intermediate!13699 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575329 () Bool)

(assert (=> b!1575329 (= e!878613 (Intermediate!13699 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575330 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575330 (= e!878617 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1575331 () Bool)

(assert (=> b!1575331 (= e!878613 e!878617)))

(declare-fun c!145734 () Bool)

(assert (=> b!1575331 (= c!145734 (or (= lt!675145 k0!761) (= (bvadd lt!675145 lt!675145) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1575332 () Bool)

(assert (=> b!1575332 (and (bvsge (index!57196 lt!675146) #b00000000000000000000000000000000) (bvslt (index!57196 lt!675146) (size!51384 _keys!605)))))

(assert (=> b!1575332 (= e!878616 (= (select (arr!50834 _keys!605) (index!57196 lt!675146)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!165407 c!145732) b!1575329))

(assert (= (and d!165407 (not c!145732)) b!1575331))

(assert (= (and b!1575331 c!145734) b!1575328))

(assert (= (and b!1575331 (not c!145734)) b!1575330))

(assert (= (and d!165407 c!145733) b!1575327))

(assert (= (and d!165407 (not c!145733)) b!1575324))

(assert (= (and b!1575324 res!1076393) b!1575326))

(assert (= (and b!1575326 (not res!1076391)) b!1575325))

(assert (= (and b!1575325 (not res!1076392)) b!1575332))

(assert (=> b!1575330 m!1448349))

(declare-fun m!1448365 () Bool)

(assert (=> b!1575330 m!1448365))

(assert (=> b!1575330 m!1448365))

(declare-fun m!1448367 () Bool)

(assert (=> b!1575330 m!1448367))

(declare-fun m!1448369 () Bool)

(assert (=> b!1575325 m!1448369))

(assert (=> b!1575326 m!1448369))

(assert (=> b!1575332 m!1448369))

(assert (=> d!165407 m!1448349))

(declare-fun m!1448371 () Bool)

(assert (=> d!165407 m!1448371))

(assert (=> d!165407 m!1448341))

(assert (=> b!1575282 d!165407))

(declare-fun d!165421 () Bool)

(declare-fun lt!675158 () (_ BitVec 32))

(declare-fun lt!675157 () (_ BitVec 32))

(assert (=> d!165421 (= lt!675158 (bvmul (bvxor lt!675157 (bvlshr lt!675157 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165421 (= lt!675157 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165421 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076398 (let ((h!38264 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142157 (bvmul (bvxor h!38264 (bvlshr h!38264 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142157 (bvlshr x!142157 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076398 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076398 #b00000000000000000000000000000000))))))

(assert (=> d!165421 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!675158 (bvlshr lt!675158 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1575282 d!165421))

(check-sat (not d!165407) (not b!1575330))
(check-sat)
