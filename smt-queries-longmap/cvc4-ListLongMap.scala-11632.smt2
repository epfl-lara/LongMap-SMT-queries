; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135736 () Bool)

(assert start!135736)

(declare-fun res!1076159 () Bool)

(declare-fun e!878395 () Bool)

(assert (=> start!135736 (=> (not res!1076159) (not e!878395))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135736 (= res!1076159 (validMask!0 mask!898))))

(assert (=> start!135736 e!878395))

(assert (=> start!135736 true))

(declare-datatypes ((array!105349 0))(
  ( (array!105350 (arr!50817 (Array (_ BitVec 32) (_ BitVec 64))) (size!51367 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105349)

(declare-fun array_inv!39544 (array!105349) Bool)

(assert (=> start!135736 (array_inv!39544 _keys!605)))

(declare-fun b!1574965 () Bool)

(declare-fun res!1076160 () Bool)

(assert (=> b!1574965 (=> (not res!1076160) (not e!878395))))

(assert (=> b!1574965 (= res!1076160 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51367 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574966 () Bool)

(declare-fun res!1076158 () Bool)

(assert (=> b!1574966 (=> (not res!1076158) (not e!878395))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574966 (= res!1076158 (validKeyInArray!0 k!761))))

(declare-datatypes ((SeekEntryResult!13682 0))(
  ( (MissingZero!13682 (index!57126 (_ BitVec 32))) (Found!13682 (index!57127 (_ BitVec 32))) (Intermediate!13682 (undefined!14494 Bool) (index!57128 (_ BitVec 32)) (x!142076 (_ BitVec 32))) (Undefined!13682) (MissingVacant!13682 (index!57129 (_ BitVec 32))) )
))
(declare-fun lt!675010 () SeekEntryResult!13682)

(declare-fun b!1574967 () Bool)

(assert (=> b!1574967 (= e!878395 (and (is-Intermediate!13682 lt!675010) (not (undefined!14494 lt!675010)) (not (= (select (arr!50817 _keys!605) (index!57128 lt!675010)) k!761)) (not (= (select (arr!50817 _keys!605) (index!57128 lt!675010)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50817 _keys!605) (index!57128 lt!675010)) #b1000000000000000000000000000000000000000000000000000000000000000) (or (bvslt (index!57128 lt!675010) #b00000000000000000000000000000000) (bvsge (index!57128 lt!675010) (bvadd #b00000000000000000000000000000001 mask!898)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105349 (_ BitVec 32)) SeekEntryResult!13682)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574967 (= lt!675010 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135736 res!1076159) b!1574965))

(assert (= (and b!1574965 res!1076160) b!1574966))

(assert (= (and b!1574966 res!1076158) b!1574967))

(declare-fun m!1448119 () Bool)

(assert (=> start!135736 m!1448119))

(declare-fun m!1448121 () Bool)

(assert (=> start!135736 m!1448121))

(declare-fun m!1448123 () Bool)

(assert (=> b!1574966 m!1448123))

(declare-fun m!1448125 () Bool)

(assert (=> b!1574967 m!1448125))

(declare-fun m!1448127 () Bool)

(assert (=> b!1574967 m!1448127))

(assert (=> b!1574967 m!1448127))

(declare-fun m!1448129 () Bool)

(assert (=> b!1574967 m!1448129))

(push 1)

(assert (not b!1574966))

(assert (not b!1574967))

(assert (not start!135736))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165329 () Bool)

(assert (=> d!165329 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1574966 d!165329))

(declare-fun b!1575040 () Bool)

(declare-fun e!878441 () SeekEntryResult!13682)

(declare-fun e!878438 () SeekEntryResult!13682)

(assert (=> b!1575040 (= e!878441 e!878438)))

(declare-fun c!145690 () Bool)

(declare-fun lt!675039 () (_ BitVec 64))

(assert (=> b!1575040 (= c!145690 (or (= lt!675039 k!761) (= (bvadd lt!675039 lt!675039) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1575041 () Bool)

(assert (=> b!1575041 (= e!878438 (Intermediate!13682 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575042 () Bool)

(declare-fun e!878440 () Bool)

(declare-fun e!878439 () Bool)

(assert (=> b!1575042 (= e!878440 e!878439)))

(declare-fun res!1076189 () Bool)

(declare-fun lt!675040 () SeekEntryResult!13682)

(assert (=> b!1575042 (= res!1076189 (and (is-Intermediate!13682 lt!675040) (not (undefined!14494 lt!675040)) (bvslt (x!142076 lt!675040) #b01111111111111111111111111111110) (bvsge (x!142076 lt!675040) #b00000000000000000000000000000000) (bvsge (x!142076 lt!675040) #b00000000000000000000000000000000)))))

(assert (=> b!1575042 (=> (not res!1076189) (not e!878439))))

(declare-fun b!1575043 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575043 (= e!878438 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1575044 () Bool)

(assert (=> b!1575044 (and (bvsge (index!57128 lt!675040) #b00000000000000000000000000000000) (bvslt (index!57128 lt!675040) (size!51367 _keys!605)))))

(declare-fun res!1076187 () Bool)

(assert (=> b!1575044 (= res!1076187 (= (select (arr!50817 _keys!605) (index!57128 lt!675040)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!878437 () Bool)

(assert (=> b!1575044 (=> res!1076187 e!878437)))

(declare-fun d!165331 () Bool)

(assert (=> d!165331 e!878440))

(declare-fun c!145692 () Bool)

(assert (=> d!165331 (= c!145692 (and (is-Intermediate!13682 lt!675040) (undefined!14494 lt!675040)))))

(assert (=> d!165331 (= lt!675040 e!878441)))

(declare-fun c!145691 () Bool)

(assert (=> d!165331 (= c!145691 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165331 (= lt!675039 (select (arr!50817 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165331 (validMask!0 mask!898)))

(assert (=> d!165331 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675040)))

(declare-fun b!1575045 () Bool)

(assert (=> b!1575045 (= e!878441 (Intermediate!13682 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575046 () Bool)

(assert (=> b!1575046 (and (bvsge (index!57128 lt!675040) #b00000000000000000000000000000000) (bvslt (index!57128 lt!675040) (size!51367 _keys!605)))))

(assert (=> b!1575046 (= e!878437 (= (select (arr!50817 _keys!605) (index!57128 lt!675040)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1575047 () Bool)

(assert (=> b!1575047 (= e!878440 (bvsge (x!142076 lt!675040) #b01111111111111111111111111111110))))

(declare-fun b!1575048 () Bool)

(assert (=> b!1575048 (and (bvsge (index!57128 lt!675040) #b00000000000000000000000000000000) (bvslt (index!57128 lt!675040) (size!51367 _keys!605)))))

(declare-fun res!1076188 () Bool)

(assert (=> b!1575048 (= res!1076188 (= (select (arr!50817 _keys!605) (index!57128 lt!675040)) k!761))))

(assert (=> b!1575048 (=> res!1076188 e!878437)))

(assert (=> b!1575048 (= e!878439 e!878437)))

(assert (= (and d!165331 c!145691) b!1575045))

(assert (= (and d!165331 (not c!145691)) b!1575040))

(assert (= (and b!1575040 c!145690) b!1575041))

(assert (= (and b!1575040 (not c!145690)) b!1575043))

(assert (= (and d!165331 c!145692) b!1575047))

(assert (= (and d!165331 (not c!145692)) b!1575042))

(assert (= (and b!1575042 res!1076189) b!1575048))

(assert (= (and b!1575048 (not res!1076188)) b!1575044))

(assert (= (and b!1575044 (not res!1076187)) b!1575046))

(assert (=> d!165331 m!1448127))

(declare-fun m!1448147 () Bool)

(assert (=> d!165331 m!1448147))

(assert (=> d!165331 m!1448119))

(assert (=> b!1575043 m!1448127))

(declare-fun m!1448149 () Bool)

(assert (=> b!1575043 m!1448149))

(assert (=> b!1575043 m!1448149))

(declare-fun m!1448151 () Bool)

(assert (=> b!1575043 m!1448151))

(declare-fun m!1448153 () Bool)

(assert (=> b!1575048 m!1448153))

(assert (=> b!1575046 m!1448153))

(assert (=> b!1575044 m!1448153))

(assert (=> b!1574967 d!165331))

(declare-fun d!165349 () Bool)

(declare-fun lt!675046 () (_ BitVec 32))

(declare-fun lt!675045 () (_ BitVec 32))

(assert (=> d!165349 (= lt!675046 (bvmul (bvxor lt!675045 (bvlshr lt!675045 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165349 (= lt!675045 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165349 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076190 (let ((h!38260 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142082 (bvmul (bvxor h!38260 (bvlshr h!38260 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142082 (bvlshr x!142082 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076190 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076190 #b00000000000000000000000000000000))))))

(assert (=> d!165349 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675046 (bvlshr lt!675046 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1574967 d!165349))

(declare-fun d!165351 () Bool)

(assert (=> d!165351 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135736 d!165351))

(declare-fun d!165353 () Bool)

(assert (=> d!165353 (= (array_inv!39544 _keys!605) (bvsge (size!51367 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135736 d!165353))

(push 1)

