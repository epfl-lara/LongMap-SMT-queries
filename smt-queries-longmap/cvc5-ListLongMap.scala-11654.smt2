; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136676 () Bool)

(assert start!136676)

(declare-fun b!1579248 () Bool)

(declare-fun e!881010 () Bool)

(declare-datatypes ((SeekEntryResult!13696 0))(
  ( (MissingZero!13696 (index!57182 (_ BitVec 32))) (Found!13696 (index!57183 (_ BitVec 32))) (Intermediate!13696 (undefined!14508 Bool) (index!57184 (_ BitVec 32)) (x!142401 (_ BitVec 32))) (Undefined!13696) (MissingVacant!13696 (index!57185 (_ BitVec 32))) )
))
(declare-fun lt!676717 () SeekEntryResult!13696)

(declare-datatypes ((array!105642 0))(
  ( (array!105643 (arr!50937 (Array (_ BitVec 32) (_ BitVec 64))) (size!51488 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105642)

(assert (=> b!1579248 (= e!881010 (and (not (is-Undefined!13696 lt!676717)) (not (is-Found!13696 lt!676717)) (not (is-MissingZero!13696 lt!676717)) (is-MissingVacant!13696 lt!676717) (or (bvslt (index!57185 lt!676717) #b00000000000000000000000000000000) (bvsge (index!57185 lt!676717) (size!51488 _keys!605)))))))

(declare-fun err!206 () SeekEntryResult!13696)

(assert (=> b!1579248 (= lt!676717 err!206)))

(assert (=> b!1579248 true))

(declare-fun b!1579247 () Bool)

(declare-fun e!881011 () Bool)

(assert (=> b!1579247 (= e!881011 e!881010)))

(declare-fun res!1078035 () Bool)

(assert (=> b!1579247 (=> (not res!1078035) (not e!881010))))

(declare-fun lt!676718 () Bool)

(declare-fun lt!676719 () SeekEntryResult!13696)

(assert (=> b!1579247 (= res!1078035 (and (or lt!676718 (not (undefined!14508 lt!676719))) (or lt!676718 (undefined!14508 lt!676719))))))

(assert (=> b!1579247 (= lt!676718 (not (is-Intermediate!13696 lt!676719)))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105642 (_ BitVec 32)) SeekEntryResult!13696)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1579247 (= lt!676719 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1579245 () Bool)

(declare-fun res!1078037 () Bool)

(assert (=> b!1579245 (=> (not res!1078037) (not e!881011))))

(assert (=> b!1579245 (= res!1078037 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51488 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun res!1078034 () Bool)

(assert (=> start!136676 (=> (not res!1078034) (not e!881011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136676 (= res!1078034 (validMask!0 mask!898))))

(assert (=> start!136676 e!881011))

(assert (=> start!136676 true))

(declare-fun array_inv!39892 (array!105642) Bool)

(assert (=> start!136676 (array_inv!39892 _keys!605)))

(declare-fun b!1579246 () Bool)

(declare-fun res!1078036 () Bool)

(assert (=> b!1579246 (=> (not res!1078036) (not e!881011))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1579246 (= res!1078036 (validKeyInArray!0 k!761))))

(assert (= (and start!136676 res!1078034) b!1579245))

(assert (= (and b!1579245 res!1078037) b!1579246))

(assert (= (and b!1579246 res!1078036) b!1579247))

(assert (= (and b!1579247 res!1078035) b!1579248))

(declare-fun m!1451507 () Bool)

(assert (=> b!1579247 m!1451507))

(assert (=> b!1579247 m!1451507))

(declare-fun m!1451509 () Bool)

(assert (=> b!1579247 m!1451509))

(declare-fun m!1451511 () Bool)

(assert (=> start!136676 m!1451511))

(declare-fun m!1451513 () Bool)

(assert (=> start!136676 m!1451513))

(declare-fun m!1451515 () Bool)

(assert (=> b!1579246 m!1451515))

(push 1)

(assert (not b!1579246))

(assert (not b!1579247))

(assert (not start!136676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166469 () Bool)

(assert (=> d!166469 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1579246 d!166469))

(declare-fun b!1579306 () Bool)

(declare-fun lt!676734 () SeekEntryResult!13696)

(assert (=> b!1579306 (and (bvsge (index!57184 lt!676734) #b00000000000000000000000000000000) (bvslt (index!57184 lt!676734) (size!51488 _keys!605)))))

(declare-fun res!1078055 () Bool)

(assert (=> b!1579306 (= res!1078055 (= (select (arr!50937 _keys!605) (index!57184 lt!676734)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!881048 () Bool)

(assert (=> b!1579306 (=> res!1078055 e!881048)))

(declare-fun b!1579307 () Bool)

(declare-fun e!881044 () SeekEntryResult!13696)

(assert (=> b!1579307 (= e!881044 (Intermediate!13696 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1579308 () Bool)

(declare-fun e!881046 () SeekEntryResult!13696)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1579308 (= e!881046 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1579309 () Bool)

(assert (=> b!1579309 (and (bvsge (index!57184 lt!676734) #b00000000000000000000000000000000) (bvslt (index!57184 lt!676734) (size!51488 _keys!605)))))

(assert (=> b!1579309 (= e!881048 (= (select (arr!50937 _keys!605) (index!57184 lt!676734)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!166471 () Bool)

(declare-fun e!881047 () Bool)

(assert (=> d!166471 e!881047))

(declare-fun c!146919 () Bool)

(assert (=> d!166471 (= c!146919 (and (is-Intermediate!13696 lt!676734) (undefined!14508 lt!676734)))))

(assert (=> d!166471 (= lt!676734 e!881044)))

(declare-fun c!146920 () Bool)

(assert (=> d!166471 (= c!146920 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!676735 () (_ BitVec 64))

(assert (=> d!166471 (= lt!676735 (select (arr!50937 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!166471 (validMask!0 mask!898)))

(assert (=> d!166471 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!676734)))

(declare-fun b!1579310 () Bool)

(assert (=> b!1579310 (= e!881044 e!881046)))

(declare-fun c!146921 () Bool)

(assert (=> b!1579310 (= c!146921 (or (= lt!676735 k!761) (= (bvadd lt!676735 lt!676735) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1579311 () Bool)

(assert (=> b!1579311 (and (bvsge (index!57184 lt!676734) #b00000000000000000000000000000000) (bvslt (index!57184 lt!676734) (size!51488 _keys!605)))))

(declare-fun res!1078054 () Bool)

(assert (=> b!1579311 (= res!1078054 (= (select (arr!50937 _keys!605) (index!57184 lt!676734)) k!761))))

(assert (=> b!1579311 (=> res!1078054 e!881048)))

(declare-fun e!881045 () Bool)

(assert (=> b!1579311 (= e!881045 e!881048)))

(declare-fun b!1579312 () Bool)

(assert (=> b!1579312 (= e!881047 (bvsge (x!142401 lt!676734) #b01111111111111111111111111111110))))

(declare-fun b!1579313 () Bool)

(assert (=> b!1579313 (= e!881047 e!881045)))

(declare-fun res!1078056 () Bool)

(assert (=> b!1579313 (= res!1078056 (and (is-Intermediate!13696 lt!676734) (not (undefined!14508 lt!676734)) (bvslt (x!142401 lt!676734) #b01111111111111111111111111111110) (bvsge (x!142401 lt!676734) #b00000000000000000000000000000000) (bvsge (x!142401 lt!676734) #b00000000000000000000000000000000)))))

(assert (=> b!1579313 (=> (not res!1078056) (not e!881045))))

(declare-fun b!1579314 () Bool)

(assert (=> b!1579314 (= e!881046 (Intermediate!13696 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(assert (= (and d!166471 c!146920) b!1579307))

(assert (= (and d!166471 (not c!146920)) b!1579310))

(assert (= (and b!1579310 c!146921) b!1579314))

(assert (= (and b!1579310 (not c!146921)) b!1579308))

(assert (= (and d!166471 c!146919) b!1579312))

(assert (= (and d!166471 (not c!146919)) b!1579313))

(assert (= (and b!1579313 res!1078056) b!1579311))

(assert (= (and b!1579311 (not res!1078054)) b!1579306))

(assert (= (and b!1579306 (not res!1078055)) b!1579309))

(assert (=> d!166471 m!1451507))

(declare-fun m!1451525 () Bool)

(assert (=> d!166471 m!1451525))

(assert (=> d!166471 m!1451511))

(assert (=> b!1579308 m!1451507))

(declare-fun m!1451527 () Bool)

(assert (=> b!1579308 m!1451527))

(assert (=> b!1579308 m!1451527))

(declare-fun m!1451529 () Bool)

(assert (=> b!1579308 m!1451529))

(declare-fun m!1451531 () Bool)

(assert (=> b!1579311 m!1451531))

(assert (=> b!1579309 m!1451531))

(assert (=> b!1579306 m!1451531))

(assert (=> b!1579247 d!166471))

(declare-fun d!166477 () Bool)

(declare-fun lt!676749 () (_ BitVec 32))

(declare-fun lt!676748 () (_ BitVec 32))

(assert (=> d!166477 (= lt!676749 (bvmul (bvxor lt!676748 (bvlshr lt!676748 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!166477 (= lt!676748 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!166477 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1078063 (let ((h!38345 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142406 (bvmul (bvxor h!38345 (bvlshr h!38345 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142406 (bvlshr x!142406 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1078063 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1078063 #b00000000000000000000000000000000))))))

(assert (=> d!166477 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!676749 (bvlshr lt!676749 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1579247 d!166477))

(declare-fun d!166483 () Bool)

(assert (=> d!166483 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136676 d!166483))

(declare-fun d!166493 () Bool)

(assert (=> d!166493 (= (array_inv!39892 _keys!605) (bvsge (size!51488 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136676 d!166493))

(push 1)

(assert (not d!166471))

(assert (not b!1579308))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

