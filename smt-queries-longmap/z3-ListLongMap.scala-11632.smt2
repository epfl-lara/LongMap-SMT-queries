; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136156 () Bool)

(assert start!136156)

(declare-fun res!1077000 () Bool)

(declare-fun e!879893 () Bool)

(assert (=> start!136156 (=> (not res!1077000) (not e!879893))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136156 (= res!1077000 (validMask!0 mask!898))))

(assert (=> start!136156 e!879893))

(assert (=> start!136156 true))

(declare-datatypes ((array!105470 0))(
  ( (array!105471 (arr!50869 (Array (_ BitVec 32) (_ BitVec 64))) (size!51420 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105470)

(declare-fun array_inv!39824 (array!105470) Bool)

(assert (=> start!136156 (array_inv!39824 _keys!605)))

(declare-fun b!1577383 () Bool)

(declare-fun res!1077001 () Bool)

(assert (=> b!1577383 (=> (not res!1077001) (not e!879893))))

(assert (=> b!1577383 (= res!1077001 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51420 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1577384 () Bool)

(declare-fun res!1077002 () Bool)

(assert (=> b!1577384 (=> (not res!1077002) (not e!879893))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577384 (= res!1077002 (validKeyInArray!0 k0!761))))

(declare-fun b!1577385 () Bool)

(declare-datatypes ((SeekEntryResult!13628 0))(
  ( (MissingZero!13628 (index!56910 (_ BitVec 32))) (Found!13628 (index!56911 (_ BitVec 32))) (Intermediate!13628 (undefined!14440 Bool) (index!56912 (_ BitVec 32)) (x!142073 (_ BitVec 32))) (Undefined!13628) (MissingVacant!13628 (index!56913 (_ BitVec 32))) )
))
(declare-fun lt!675912 () SeekEntryResult!13628)

(get-info :version)

(assert (=> b!1577385 (= e!879893 (and ((_ is Intermediate!13628) lt!675912) (not (undefined!14440 lt!675912)) (not (= (select (arr!50869 _keys!605) (index!56912 lt!675912)) k0!761)) (not (= (select (arr!50869 _keys!605) (index!56912 lt!675912)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50869 _keys!605) (index!56912 lt!675912)) #b1000000000000000000000000000000000000000000000000000000000000000) (or (bvslt (index!56912 lt!675912) #b00000000000000000000000000000000) (bvsge (index!56912 lt!675912) (bvadd #b00000000000000000000000000000001 mask!898)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105470 (_ BitVec 32)) SeekEntryResult!13628)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577385 (= lt!675912 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!136156 res!1077000) b!1577383))

(assert (= (and b!1577383 res!1077001) b!1577384))

(assert (= (and b!1577384 res!1077002) b!1577385))

(declare-fun m!1450353 () Bool)

(assert (=> start!136156 m!1450353))

(declare-fun m!1450355 () Bool)

(assert (=> start!136156 m!1450355))

(declare-fun m!1450357 () Bool)

(assert (=> b!1577384 m!1450357))

(declare-fun m!1450359 () Bool)

(assert (=> b!1577385 m!1450359))

(declare-fun m!1450361 () Bool)

(assert (=> b!1577385 m!1450361))

(assert (=> b!1577385 m!1450361))

(declare-fun m!1450363 () Bool)

(assert (=> b!1577385 m!1450363))

(check-sat (not b!1577384) (not start!136156) (not b!1577385))
(check-sat)
(get-model)

(declare-fun d!166039 () Bool)

(assert (=> d!166039 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577384 d!166039))

(declare-fun d!166041 () Bool)

(assert (=> d!166041 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136156 d!166041))

(declare-fun d!166051 () Bool)

(assert (=> d!166051 (= (array_inv!39824 _keys!605) (bvsge (size!51420 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136156 d!166051))

(declare-fun b!1577422 () Bool)

(declare-fun lt!675924 () SeekEntryResult!13628)

(assert (=> b!1577422 (and (bvsge (index!56912 lt!675924) #b00000000000000000000000000000000) (bvslt (index!56912 lt!675924) (size!51420 _keys!605)))))

(declare-fun res!1077027 () Bool)

(assert (=> b!1577422 (= res!1077027 (= (select (arr!50869 _keys!605) (index!56912 lt!675924)) k0!761))))

(declare-fun e!879919 () Bool)

(assert (=> b!1577422 (=> res!1077027 e!879919)))

(declare-fun e!879917 () Bool)

(assert (=> b!1577422 (= e!879917 e!879919)))

(declare-fun b!1577423 () Bool)

(declare-fun e!879918 () SeekEntryResult!13628)

(declare-fun e!879916 () SeekEntryResult!13628)

(assert (=> b!1577423 (= e!879918 e!879916)))

(declare-fun c!146474 () Bool)

(declare-fun lt!675923 () (_ BitVec 64))

(assert (=> b!1577423 (= c!146474 (or (= lt!675923 k0!761) (= (bvadd lt!675923 lt!675923) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577424 () Bool)

(assert (=> b!1577424 (and (bvsge (index!56912 lt!675924) #b00000000000000000000000000000000) (bvslt (index!56912 lt!675924) (size!51420 _keys!605)))))

(declare-fun res!1077029 () Bool)

(assert (=> b!1577424 (= res!1077029 (= (select (arr!50869 _keys!605) (index!56912 lt!675924)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1577424 (=> res!1077029 e!879919)))

(declare-fun b!1577425 () Bool)

(declare-fun e!879920 () Bool)

(assert (=> b!1577425 (= e!879920 (bvsge (x!142073 lt!675924) #b01111111111111111111111111111110))))

(declare-fun b!1577426 () Bool)

(assert (=> b!1577426 (= e!879916 (Intermediate!13628 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun d!166053 () Bool)

(assert (=> d!166053 e!879920))

(declare-fun c!146473 () Bool)

(assert (=> d!166053 (= c!146473 (and ((_ is Intermediate!13628) lt!675924) (undefined!14440 lt!675924)))))

(assert (=> d!166053 (= lt!675924 e!879918)))

(declare-fun c!146472 () Bool)

(assert (=> d!166053 (= c!146472 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!166053 (= lt!675923 (select (arr!50869 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!166053 (validMask!0 mask!898)))

(assert (=> d!166053 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!675924)))

(declare-fun b!1577427 () Bool)

(assert (=> b!1577427 (and (bvsge (index!56912 lt!675924) #b00000000000000000000000000000000) (bvslt (index!56912 lt!675924) (size!51420 _keys!605)))))

(assert (=> b!1577427 (= e!879919 (= (select (arr!50869 _keys!605) (index!56912 lt!675924)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1577428 () Bool)

(assert (=> b!1577428 (= e!879920 e!879917)))

(declare-fun res!1077028 () Bool)

(assert (=> b!1577428 (= res!1077028 (and ((_ is Intermediate!13628) lt!675924) (not (undefined!14440 lt!675924)) (bvslt (x!142073 lt!675924) #b01111111111111111111111111111110) (bvsge (x!142073 lt!675924) #b00000000000000000000000000000000) (bvsge (x!142073 lt!675924) #b00000000000000000000000000000000)))))

(assert (=> b!1577428 (=> (not res!1077028) (not e!879917))))

(declare-fun b!1577429 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577429 (= e!879916 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1577430 () Bool)

(assert (=> b!1577430 (= e!879918 (Intermediate!13628 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(assert (= (and d!166053 c!146472) b!1577430))

(assert (= (and d!166053 (not c!146472)) b!1577423))

(assert (= (and b!1577423 c!146474) b!1577426))

(assert (= (and b!1577423 (not c!146474)) b!1577429))

(assert (= (and d!166053 c!146473) b!1577425))

(assert (= (and d!166053 (not c!146473)) b!1577428))

(assert (= (and b!1577428 res!1077028) b!1577422))

(assert (= (and b!1577422 (not res!1077027)) b!1577424))

(assert (= (and b!1577424 (not res!1077029)) b!1577427))

(assert (=> b!1577429 m!1450361))

(declare-fun m!1450389 () Bool)

(assert (=> b!1577429 m!1450389))

(assert (=> b!1577429 m!1450389))

(declare-fun m!1450391 () Bool)

(assert (=> b!1577429 m!1450391))

(declare-fun m!1450393 () Bool)

(assert (=> b!1577427 m!1450393))

(assert (=> b!1577422 m!1450393))

(assert (=> d!166053 m!1450361))

(declare-fun m!1450395 () Bool)

(assert (=> d!166053 m!1450395))

(assert (=> d!166053 m!1450353))

(assert (=> b!1577424 m!1450393))

(assert (=> b!1577385 d!166053))

(declare-fun d!166063 () Bool)

(declare-fun lt!675930 () (_ BitVec 32))

(declare-fun lt!675929 () (_ BitVec 32))

(assert (=> d!166063 (= lt!675930 (bvmul (bvxor lt!675929 (bvlshr lt!675929 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!166063 (= lt!675929 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!166063 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077030 (let ((h!38308 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142077 (bvmul (bvxor h!38308 (bvlshr h!38308 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142077 (bvlshr x!142077 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077030 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077030 #b00000000000000000000000000000000))))))

(assert (=> d!166063 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!675930 (bvlshr lt!675930 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1577385 d!166063))

(check-sat (not b!1577429) (not d!166053))
(check-sat)
