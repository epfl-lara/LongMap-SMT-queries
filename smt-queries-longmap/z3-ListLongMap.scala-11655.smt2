; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136284 () Bool)

(assert start!136284)

(declare-datatypes ((array!105523 0))(
  ( (array!105524 (arr!50885 (Array (_ BitVec 32) (_ BitVec 64))) (size!51435 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105523)

(declare-fun b!1576917 () Bool)

(declare-fun e!879565 () Bool)

(declare-datatypes ((SeekEntryResult!13750 0))(
  ( (MissingZero!13750 (index!57398 (_ BitVec 32))) (Found!13750 (index!57399 (_ BitVec 32))) (Intermediate!13750 (undefined!14562 Bool) (index!57400 (_ BitVec 32)) (x!142418 (_ BitVec 32))) (Undefined!13750) (MissingVacant!13750 (index!57401 (_ BitVec 32))) )
))
(declare-fun lt!675864 () SeekEntryResult!13750)

(declare-fun k0!761 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1576917 (= e!879565 (and (not ((_ is Undefined!13750) lt!675864)) (ite ((_ is Found!13750) lt!675864) (not (= (select (arr!50885 _keys!605) (index!57399 lt!675864)) k0!761)) (ite ((_ is MissingZero!13750) lt!675864) (not (= (select (arr!50885 _keys!605) (index!57398 lt!675864)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not ((_ is MissingVacant!13750) lt!675864)) (not (= (select (arr!50885 _keys!605) (index!57401 lt!675864)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun err!214 () SeekEntryResult!13750)

(assert (=> b!1576917 (= lt!675864 err!214)))

(assert (=> b!1576917 true))

(declare-fun b!1576916 () Bool)

(declare-fun e!879566 () Bool)

(assert (=> b!1576916 (= e!879566 e!879565)))

(declare-fun res!1077229 () Bool)

(assert (=> b!1576916 (=> (not res!1077229) (not e!879565))))

(declare-fun lt!675865 () Bool)

(declare-fun lt!675863 () SeekEntryResult!13750)

(assert (=> b!1576916 (= res!1077229 (and (or lt!675865 (not (undefined!14562 lt!675863))) (or lt!675865 (undefined!14562 lt!675863))))))

(assert (=> b!1576916 (= lt!675865 (not ((_ is Intermediate!13750) lt!675863)))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105523 (_ BitVec 32)) SeekEntryResult!13750)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576916 (= lt!675863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1576915 () Bool)

(declare-fun res!1077231 () Bool)

(assert (=> b!1576915 (=> (not res!1077231) (not e!879566))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576915 (= res!1077231 (validKeyInArray!0 k0!761))))

(declare-fun res!1077228 () Bool)

(assert (=> start!136284 (=> (not res!1077228) (not e!879566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136284 (= res!1077228 (validMask!0 mask!898))))

(assert (=> start!136284 e!879566))

(assert (=> start!136284 true))

(declare-fun array_inv!39612 (array!105523) Bool)

(assert (=> start!136284 (array_inv!39612 _keys!605)))

(declare-fun b!1576914 () Bool)

(declare-fun res!1077230 () Bool)

(assert (=> b!1576914 (=> (not res!1077230) (not e!879566))))

(assert (=> b!1576914 (= res!1077230 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51435 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(assert (= (and start!136284 res!1077228) b!1576914))

(assert (= (and b!1576914 res!1077230) b!1576915))

(assert (= (and b!1576915 res!1077231) b!1576916))

(assert (= (and b!1576916 res!1077229) b!1576917))

(declare-fun m!1449299 () Bool)

(assert (=> b!1576917 m!1449299))

(declare-fun m!1449301 () Bool)

(assert (=> b!1576917 m!1449301))

(declare-fun m!1449303 () Bool)

(assert (=> b!1576917 m!1449303))

(declare-fun m!1449305 () Bool)

(assert (=> b!1576916 m!1449305))

(assert (=> b!1576916 m!1449305))

(declare-fun m!1449307 () Bool)

(assert (=> b!1576916 m!1449307))

(declare-fun m!1449309 () Bool)

(assert (=> b!1576915 m!1449309))

(declare-fun m!1449311 () Bool)

(assert (=> start!136284 m!1449311))

(declare-fun m!1449313 () Bool)

(assert (=> start!136284 m!1449313))

(check-sat (not b!1576916) (not b!1576915) (not start!136284))
(check-sat)
(get-model)

(declare-fun b!1576956 () Bool)

(declare-fun e!879592 () SeekEntryResult!13750)

(assert (=> b!1576956 (= e!879592 (Intermediate!13750 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576957 () Bool)

(declare-fun lt!675883 () SeekEntryResult!13750)

(assert (=> b!1576957 (and (bvsge (index!57400 lt!675883) #b00000000000000000000000000000000) (bvslt (index!57400 lt!675883) (size!51435 _keys!605)))))

(declare-fun res!1077250 () Bool)

(assert (=> b!1576957 (= res!1077250 (= (select (arr!50885 _keys!605) (index!57400 lt!675883)) k0!761))))

(declare-fun e!879594 () Bool)

(assert (=> b!1576957 (=> res!1077250 e!879594)))

(declare-fun e!879593 () Bool)

(assert (=> b!1576957 (= e!879593 e!879594)))

(declare-fun b!1576958 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576958 (= e!879592 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1576959 () Bool)

(assert (=> b!1576959 (and (bvsge (index!57400 lt!675883) #b00000000000000000000000000000000) (bvslt (index!57400 lt!675883) (size!51435 _keys!605)))))

(declare-fun res!1077252 () Bool)

(assert (=> b!1576959 (= res!1077252 (= (select (arr!50885 _keys!605) (index!57400 lt!675883)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1576959 (=> res!1077252 e!879594)))

(declare-fun d!165783 () Bool)

(declare-fun e!879591 () Bool)

(assert (=> d!165783 e!879591))

(declare-fun c!146137 () Bool)

(assert (=> d!165783 (= c!146137 (and ((_ is Intermediate!13750) lt!675883) (undefined!14562 lt!675883)))))

(declare-fun e!879590 () SeekEntryResult!13750)

(assert (=> d!165783 (= lt!675883 e!879590)))

(declare-fun c!146135 () Bool)

(assert (=> d!165783 (= c!146135 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675884 () (_ BitVec 64))

(assert (=> d!165783 (= lt!675884 (select (arr!50885 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165783 (validMask!0 mask!898)))

(assert (=> d!165783 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!675883)))

(declare-fun b!1576960 () Bool)

(assert (=> b!1576960 (= e!879591 e!879593)))

(declare-fun res!1077251 () Bool)

(assert (=> b!1576960 (= res!1077251 (and ((_ is Intermediate!13750) lt!675883) (not (undefined!14562 lt!675883)) (bvslt (x!142418 lt!675883) #b01111111111111111111111111111110) (bvsge (x!142418 lt!675883) #b00000000000000000000000000000000) (bvsge (x!142418 lt!675883) #b00000000000000000000000000000000)))))

(assert (=> b!1576960 (=> (not res!1077251) (not e!879593))))

(declare-fun b!1576961 () Bool)

(assert (=> b!1576961 (= e!879591 (bvsge (x!142418 lt!675883) #b01111111111111111111111111111110))))

(declare-fun b!1576962 () Bool)

(assert (=> b!1576962 (= e!879590 e!879592)))

(declare-fun c!146136 () Bool)

(assert (=> b!1576962 (= c!146136 (or (= lt!675884 k0!761) (= (bvadd lt!675884 lt!675884) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576963 () Bool)

(assert (=> b!1576963 (and (bvsge (index!57400 lt!675883) #b00000000000000000000000000000000) (bvslt (index!57400 lt!675883) (size!51435 _keys!605)))))

(assert (=> b!1576963 (= e!879594 (= (select (arr!50885 _keys!605) (index!57400 lt!675883)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1576964 () Bool)

(assert (=> b!1576964 (= e!879590 (Intermediate!13750 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(assert (= (and d!165783 c!146135) b!1576964))

(assert (= (and d!165783 (not c!146135)) b!1576962))

(assert (= (and b!1576962 c!146136) b!1576956))

(assert (= (and b!1576962 (not c!146136)) b!1576958))

(assert (= (and d!165783 c!146137) b!1576961))

(assert (= (and d!165783 (not c!146137)) b!1576960))

(assert (= (and b!1576960 res!1077251) b!1576957))

(assert (= (and b!1576957 (not res!1077250)) b!1576959))

(assert (= (and b!1576959 (not res!1077252)) b!1576963))

(declare-fun m!1449331 () Bool)

(assert (=> b!1576963 m!1449331))

(assert (=> b!1576957 m!1449331))

(assert (=> d!165783 m!1449305))

(declare-fun m!1449333 () Bool)

(assert (=> d!165783 m!1449333))

(assert (=> d!165783 m!1449311))

(assert (=> b!1576958 m!1449305))

(declare-fun m!1449335 () Bool)

(assert (=> b!1576958 m!1449335))

(assert (=> b!1576958 m!1449335))

(declare-fun m!1449337 () Bool)

(assert (=> b!1576958 m!1449337))

(assert (=> b!1576959 m!1449331))

(assert (=> b!1576916 d!165783))

(declare-fun d!165791 () Bool)

(declare-fun lt!675892 () (_ BitVec 32))

(declare-fun lt!675891 () (_ BitVec 32))

(assert (=> d!165791 (= lt!675892 (bvmul (bvxor lt!675891 (bvlshr lt!675891 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165791 (= lt!675891 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165791 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077259 (let ((h!38297 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142422 (bvmul (bvxor h!38297 (bvlshr h!38297 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142422 (bvlshr x!142422 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077259 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077259 #b00000000000000000000000000000000))))))

(assert (=> d!165791 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!675892 (bvlshr lt!675892 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1576916 d!165791))

(declare-fun d!165793 () Bool)

(assert (=> d!165793 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576915 d!165793))

(declare-fun d!165797 () Bool)

(assert (=> d!165797 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136284 d!165797))

(declare-fun d!165807 () Bool)

(assert (=> d!165807 (= (array_inv!39612 _keys!605) (bvsge (size!51435 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136284 d!165807))

(check-sat (not d!165783) (not b!1576958))
(check-sat)
