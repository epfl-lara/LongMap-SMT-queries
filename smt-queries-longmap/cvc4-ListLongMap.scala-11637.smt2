; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135756 () Bool)

(assert start!135756)

(declare-fun res!1076186 () Bool)

(declare-fun e!878327 () Bool)

(assert (=> start!135756 (=> (not res!1076186) (not e!878327))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135756 (= res!1076186 (validMask!0 mask!898))))

(assert (=> start!135756 e!878327))

(assert (=> start!135756 true))

(declare-datatypes ((array!105310 0))(
  ( (array!105311 (arr!50796 (Array (_ BitVec 32) (_ BitVec 64))) (size!51348 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105310)

(declare-fun array_inv!39732 (array!105310) Bool)

(assert (=> start!135756 (array_inv!39732 _keys!605)))

(declare-fun b!1574859 () Bool)

(declare-fun res!1076185 () Bool)

(assert (=> b!1574859 (=> (not res!1076185) (not e!878327))))

(assert (=> b!1574859 (= res!1076185 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51348 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574860 () Bool)

(declare-fun res!1076187 () Bool)

(assert (=> b!1574860 (=> (not res!1076187) (not e!878327))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574860 (= res!1076187 (validKeyInArray!0 k!761))))

(declare-fun b!1574861 () Bool)

(declare-datatypes ((SeekEntryResult!13696 0))(
  ( (MissingZero!13696 (index!57182 (_ BitVec 32))) (Found!13696 (index!57183 (_ BitVec 32))) (Intermediate!13696 (undefined!14508 Bool) (index!57184 (_ BitVec 32)) (x!142131 (_ BitVec 32))) (Undefined!13696) (MissingVacant!13696 (index!57185 (_ BitVec 32))) )
))
(declare-fun lt!674802 () SeekEntryResult!13696)

(assert (=> b!1574861 (= e!878327 (and (is-Intermediate!13696 lt!674802) (not (undefined!14508 lt!674802)) (or (bvslt (index!57184 lt!674802) #b00000000000000000000000000000000) (bvsge (index!57184 lt!674802) (size!51348 _keys!605)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105310 (_ BitVec 32)) SeekEntryResult!13696)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574861 (= lt!674802 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135756 res!1076186) b!1574859))

(assert (= (and b!1574859 res!1076185) b!1574860))

(assert (= (and b!1574860 res!1076187) b!1574861))

(declare-fun m!1447393 () Bool)

(assert (=> start!135756 m!1447393))

(declare-fun m!1447395 () Bool)

(assert (=> start!135756 m!1447395))

(declare-fun m!1447397 () Bool)

(assert (=> b!1574860 m!1447397))

(declare-fun m!1447399 () Bool)

(assert (=> b!1574861 m!1447399))

(assert (=> b!1574861 m!1447399))

(declare-fun m!1447401 () Bool)

(assert (=> b!1574861 m!1447401))

(push 1)

(assert (not b!1574861))

(assert (not start!135756))

(assert (not b!1574860))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1574943 () Bool)

(declare-fun e!878377 () SeekEntryResult!13696)

(assert (=> b!1574943 (= e!878377 (Intermediate!13696 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1574944 () Bool)

(declare-fun e!878378 () SeekEntryResult!13696)

(assert (=> b!1574944 (= e!878378 e!878377)))

(declare-fun c!145630 () Bool)

(declare-fun lt!674833 () (_ BitVec 64))

(assert (=> b!1574944 (= c!145630 (or (= lt!674833 k!761) (= (bvadd lt!674833 lt!674833) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1574945 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574945 (= e!878377 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1574946 () Bool)

(declare-fun lt!674832 () SeekEntryResult!13696)

(assert (=> b!1574946 (and (bvsge (index!57184 lt!674832) #b00000000000000000000000000000000) (bvslt (index!57184 lt!674832) (size!51348 _keys!605)))))

(declare-fun e!878376 () Bool)

(assert (=> b!1574946 (= e!878376 (= (select (arr!50796 _keys!605) (index!57184 lt!674832)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1574947 () Bool)

(assert (=> b!1574947 (= e!878378 (Intermediate!13696 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1574948 () Bool)

(assert (=> b!1574948 (and (bvsge (index!57184 lt!674832) #b00000000000000000000000000000000) (bvslt (index!57184 lt!674832) (size!51348 _keys!605)))))

(declare-fun res!1076224 () Bool)

(assert (=> b!1574948 (= res!1076224 (= (select (arr!50796 _keys!605) (index!57184 lt!674832)) k!761))))

(assert (=> b!1574948 (=> res!1076224 e!878376)))

(declare-fun e!878374 () Bool)

(assert (=> b!1574948 (= e!878374 e!878376)))

(declare-fun b!1574949 () Bool)

(declare-fun e!878375 () Bool)

(assert (=> b!1574949 (= e!878375 (bvsge (x!142131 lt!674832) #b01111111111111111111111111111110))))

(declare-fun b!1574950 () Bool)

(assert (=> b!1574950 (and (bvsge (index!57184 lt!674832) #b00000000000000000000000000000000) (bvslt (index!57184 lt!674832) (size!51348 _keys!605)))))

(declare-fun res!1076223 () Bool)

(assert (=> b!1574950 (= res!1076223 (= (select (arr!50796 _keys!605) (index!57184 lt!674832)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1574950 (=> res!1076223 e!878376)))

(declare-fun b!1574951 () Bool)

(assert (=> b!1574951 (= e!878375 e!878374)))

(declare-fun res!1076225 () Bool)

(assert (=> b!1574951 (= res!1076225 (and (is-Intermediate!13696 lt!674832) (not (undefined!14508 lt!674832)) (bvslt (x!142131 lt!674832) #b01111111111111111111111111111110) (bvsge (x!142131 lt!674832) #b00000000000000000000000000000000) (bvsge (x!142131 lt!674832) #b00000000000000000000000000000000)))))

(assert (=> b!1574951 (=> (not res!1076225) (not e!878374))))

(declare-fun d!165127 () Bool)

(assert (=> d!165127 e!878375))

(declare-fun c!145629 () Bool)

(assert (=> d!165127 (= c!145629 (and (is-Intermediate!13696 lt!674832) (undefined!14508 lt!674832)))))

(assert (=> d!165127 (= lt!674832 e!878378)))

(declare-fun c!145628 () Bool)

(assert (=> d!165127 (= c!145628 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165127 (= lt!674833 (select (arr!50796 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165127 (validMask!0 mask!898)))

(assert (=> d!165127 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!674832)))

(assert (= (and d!165127 c!145628) b!1574947))

(assert (= (and d!165127 (not c!145628)) b!1574944))

(assert (= (and b!1574944 c!145630) b!1574943))

(assert (= (and b!1574944 (not c!145630)) b!1574945))

(assert (= (and d!165127 c!145629) b!1574949))

(assert (= (and d!165127 (not c!145629)) b!1574951))

(assert (= (and b!1574951 res!1076225) b!1574948))

(assert (= (and b!1574948 (not res!1076224)) b!1574950))

(assert (= (and b!1574950 (not res!1076223)) b!1574946))

(assert (=> d!165127 m!1447399))

(declare-fun m!1447429 () Bool)

(assert (=> d!165127 m!1447429))

(assert (=> d!165127 m!1447393))

(assert (=> b!1574945 m!1447399))

(declare-fun m!1447431 () Bool)

(assert (=> b!1574945 m!1447431))

(assert (=> b!1574945 m!1447431))

(declare-fun m!1447433 () Bool)

(assert (=> b!1574945 m!1447433))

(declare-fun m!1447435 () Bool)

(assert (=> b!1574950 m!1447435))

(assert (=> b!1574946 m!1447435))

(assert (=> b!1574948 m!1447435))

(assert (=> b!1574861 d!165127))

(declare-fun d!165137 () Bool)

(declare-fun lt!674841 () (_ BitVec 32))

(declare-fun lt!674840 () (_ BitVec 32))

(assert (=> d!165137 (= lt!674841 (bvmul (bvxor lt!674840 (bvlshr lt!674840 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165137 (= lt!674840 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165137 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076226 (let ((h!38305 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142138 (bvmul (bvxor h!38305 (bvlshr h!38305 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142138 (bvlshr x!142138 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076226 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076226 #b00000000000000000000000000000000))))))

(assert (=> d!165137 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!674841 (bvlshr lt!674841 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1574861 d!165137))

(declare-fun d!165139 () Bool)

(assert (=> d!165139 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135756 d!165139))

(declare-fun d!165149 () Bool)

(assert (=> d!165149 (= (array_inv!39732 _keys!605) (bvsge (size!51348 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135756 d!165149))

(declare-fun d!165151 () Bool)

(assert (=> d!165151 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1574860 d!165151))

(push 1)

(assert (not b!1574945))

(assert (not d!165127))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

