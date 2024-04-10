; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135734 () Bool)

(assert start!135734)

(declare-fun res!1076149 () Bool)

(declare-fun e!878389 () Bool)

(assert (=> start!135734 (=> (not res!1076149) (not e!878389))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135734 (= res!1076149 (validMask!0 mask!898))))

(assert (=> start!135734 e!878389))

(assert (=> start!135734 true))

(declare-datatypes ((array!105347 0))(
  ( (array!105348 (arr!50816 (Array (_ BitVec 32) (_ BitVec 64))) (size!51366 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105347)

(declare-fun array_inv!39543 (array!105347) Bool)

(assert (=> start!135734 (array_inv!39543 _keys!605)))

(declare-fun b!1574956 () Bool)

(declare-fun res!1076151 () Bool)

(assert (=> b!1574956 (=> (not res!1076151) (not e!878389))))

(assert (=> b!1574956 (= res!1076151 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51366 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574957 () Bool)

(declare-fun res!1076150 () Bool)

(assert (=> b!1574957 (=> (not res!1076150) (not e!878389))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574957 (= res!1076150 (validKeyInArray!0 k0!761))))

(declare-fun b!1574958 () Bool)

(declare-datatypes ((SeekEntryResult!13681 0))(
  ( (MissingZero!13681 (index!57122 (_ BitVec 32))) (Found!13681 (index!57123 (_ BitVec 32))) (Intermediate!13681 (undefined!14493 Bool) (index!57124 (_ BitVec 32)) (x!142075 (_ BitVec 32))) (Undefined!13681) (MissingVacant!13681 (index!57125 (_ BitVec 32))) )
))
(declare-fun lt!675007 () SeekEntryResult!13681)

(get-info :version)

(assert (=> b!1574958 (= e!878389 (and ((_ is Intermediate!13681) lt!675007) (not (undefined!14493 lt!675007)) (not (= (select (arr!50816 _keys!605) (index!57124 lt!675007)) k0!761)) (not (= (select (arr!50816 _keys!605) (index!57124 lt!675007)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50816 _keys!605) (index!57124 lt!675007)) #b1000000000000000000000000000000000000000000000000000000000000000) (or (bvslt (index!57124 lt!675007) #b00000000000000000000000000000000) (bvsge (index!57124 lt!675007) (bvadd #b00000000000000000000000000000001 mask!898)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105347 (_ BitVec 32)) SeekEntryResult!13681)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574958 (= lt!675007 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135734 res!1076149) b!1574956))

(assert (= (and b!1574956 res!1076151) b!1574957))

(assert (= (and b!1574957 res!1076150) b!1574958))

(declare-fun m!1448107 () Bool)

(assert (=> start!135734 m!1448107))

(declare-fun m!1448109 () Bool)

(assert (=> start!135734 m!1448109))

(declare-fun m!1448111 () Bool)

(assert (=> b!1574957 m!1448111))

(declare-fun m!1448113 () Bool)

(assert (=> b!1574958 m!1448113))

(declare-fun m!1448115 () Bool)

(assert (=> b!1574958 m!1448115))

(assert (=> b!1574958 m!1448115))

(declare-fun m!1448117 () Bool)

(assert (=> b!1574958 m!1448117))

(check-sat (not b!1574958) (not start!135734) (not b!1574957))
(check-sat)
(get-model)

(declare-fun b!1574994 () Bool)

(declare-fun lt!675019 () SeekEntryResult!13681)

(assert (=> b!1574994 (and (bvsge (index!57124 lt!675019) #b00000000000000000000000000000000) (bvslt (index!57124 lt!675019) (size!51366 _keys!605)))))

(declare-fun e!878414 () Bool)

(assert (=> b!1574994 (= e!878414 (= (select (arr!50816 _keys!605) (index!57124 lt!675019)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!878413 () SeekEntryResult!13681)

(declare-fun b!1574995 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574995 (= e!878413 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1574996 () Bool)

(assert (=> b!1574996 (and (bvsge (index!57124 lt!675019) #b00000000000000000000000000000000) (bvslt (index!57124 lt!675019) (size!51366 _keys!605)))))

(declare-fun res!1076167 () Bool)

(assert (=> b!1574996 (= res!1076167 (= (select (arr!50816 _keys!605) (index!57124 lt!675019)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1574996 (=> res!1076167 e!878414)))

(declare-fun b!1574997 () Bool)

(declare-fun e!878412 () SeekEntryResult!13681)

(assert (=> b!1574997 (= e!878412 e!878413)))

(declare-fun c!145677 () Bool)

(declare-fun lt!675020 () (_ BitVec 64))

(assert (=> b!1574997 (= c!145677 (or (= lt!675020 k0!761) (= (bvadd lt!675020 lt!675020) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1574998 () Bool)

(declare-fun e!878415 () Bool)

(assert (=> b!1574998 (= e!878415 (bvsge (x!142075 lt!675019) #b01111111111111111111111111111110))))

(declare-fun d!165325 () Bool)

(assert (=> d!165325 e!878415))

(declare-fun c!145676 () Bool)

(assert (=> d!165325 (= c!145676 (and ((_ is Intermediate!13681) lt!675019) (undefined!14493 lt!675019)))))

(assert (=> d!165325 (= lt!675019 e!878412)))

(declare-fun c!145678 () Bool)

(assert (=> d!165325 (= c!145678 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165325 (= lt!675020 (select (arr!50816 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165325 (validMask!0 mask!898)))

(assert (=> d!165325 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!675019)))

(declare-fun b!1574999 () Bool)

(assert (=> b!1574999 (and (bvsge (index!57124 lt!675019) #b00000000000000000000000000000000) (bvslt (index!57124 lt!675019) (size!51366 _keys!605)))))

(declare-fun res!1076169 () Bool)

(assert (=> b!1574999 (= res!1076169 (= (select (arr!50816 _keys!605) (index!57124 lt!675019)) k0!761))))

(assert (=> b!1574999 (=> res!1076169 e!878414)))

(declare-fun e!878411 () Bool)

(assert (=> b!1574999 (= e!878411 e!878414)))

(declare-fun b!1575000 () Bool)

(assert (=> b!1575000 (= e!878412 (Intermediate!13681 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575001 () Bool)

(assert (=> b!1575001 (= e!878413 (Intermediate!13681 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575002 () Bool)

(assert (=> b!1575002 (= e!878415 e!878411)))

(declare-fun res!1076168 () Bool)

(assert (=> b!1575002 (= res!1076168 (and ((_ is Intermediate!13681) lt!675019) (not (undefined!14493 lt!675019)) (bvslt (x!142075 lt!675019) #b01111111111111111111111111111110) (bvsge (x!142075 lt!675019) #b00000000000000000000000000000000) (bvsge (x!142075 lt!675019) #b00000000000000000000000000000000)))))

(assert (=> b!1575002 (=> (not res!1076168) (not e!878411))))

(assert (= (and d!165325 c!145678) b!1575000))

(assert (= (and d!165325 (not c!145678)) b!1574997))

(assert (= (and b!1574997 c!145677) b!1575001))

(assert (= (and b!1574997 (not c!145677)) b!1574995))

(assert (= (and d!165325 c!145676) b!1574998))

(assert (= (and d!165325 (not c!145676)) b!1575002))

(assert (= (and b!1575002 res!1076168) b!1574999))

(assert (= (and b!1574999 (not res!1076169)) b!1574996))

(assert (= (and b!1574996 (not res!1076167)) b!1574994))

(declare-fun m!1448131 () Bool)

(assert (=> b!1574996 m!1448131))

(assert (=> b!1574994 m!1448131))

(assert (=> d!165325 m!1448115))

(declare-fun m!1448133 () Bool)

(assert (=> d!165325 m!1448133))

(assert (=> d!165325 m!1448107))

(assert (=> b!1574999 m!1448131))

(assert (=> b!1574995 m!1448115))

(declare-fun m!1448135 () Bool)

(assert (=> b!1574995 m!1448135))

(assert (=> b!1574995 m!1448135))

(declare-fun m!1448137 () Bool)

(assert (=> b!1574995 m!1448137))

(assert (=> b!1574958 d!165325))

(declare-fun d!165333 () Bool)

(declare-fun lt!675028 () (_ BitVec 32))

(declare-fun lt!675027 () (_ BitVec 32))

(assert (=> d!165333 (= lt!675028 (bvmul (bvxor lt!675027 (bvlshr lt!675027 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165333 (= lt!675027 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165333 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076176 (let ((h!38258 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142079 (bvmul (bvxor h!38258 (bvlshr h!38258 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142079 (bvlshr x!142079 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076176 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076176 #b00000000000000000000000000000000))))))

(assert (=> d!165333 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!675028 (bvlshr lt!675028 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1574958 d!165333))

(declare-fun d!165337 () Bool)

(assert (=> d!165337 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135734 d!165337))

(declare-fun d!165341 () Bool)

(assert (=> d!165341 (= (array_inv!39543 _keys!605) (bvsge (size!51366 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135734 d!165341))

(declare-fun d!165343 () Bool)

(assert (=> d!165343 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1574957 d!165343))

(check-sat (not d!165325) (not b!1574995))
(check-sat)
