; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135796 () Bool)

(assert start!135796)

(declare-fun res!1076325 () Bool)

(declare-fun e!878531 () Bool)

(assert (=> start!135796 (=> (not res!1076325) (not e!878531))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135796 (= res!1076325 (validMask!0 mask!898))))

(assert (=> start!135796 e!878531))

(assert (=> start!135796 true))

(declare-datatypes ((array!105382 0))(
  ( (array!105383 (arr!50832 (Array (_ BitVec 32) (_ BitVec 64))) (size!51382 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105382)

(declare-fun array_inv!39559 (array!105382) Bool)

(assert (=> start!135796 (array_inv!39559 _keys!605)))

(declare-fun b!1575181 () Bool)

(declare-fun res!1076324 () Bool)

(assert (=> b!1575181 (=> (not res!1076324) (not e!878531))))

(assert (=> b!1575181 (= res!1076324 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51382 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575182 () Bool)

(declare-fun res!1076323 () Bool)

(assert (=> b!1575182 (=> (not res!1076323) (not e!878531))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575182 (= res!1076323 (validKeyInArray!0 k!761))))

(declare-fun b!1575183 () Bool)

(declare-datatypes ((SeekEntryResult!13697 0))(
  ( (MissingZero!13697 (index!57186 (_ BitVec 32))) (Found!13697 (index!57187 (_ BitVec 32))) (Intermediate!13697 (undefined!14509 Bool) (index!57188 (_ BitVec 32)) (x!142137 (_ BitVec 32))) (Undefined!13697) (MissingVacant!13697 (index!57189 (_ BitVec 32))) )
))
(declare-fun lt!675091 () SeekEntryResult!13697)

(assert (=> b!1575183 (= e!878531 (and (is-Intermediate!13697 lt!675091) (not (undefined!14509 lt!675091)) (or (bvslt (index!57188 lt!675091) #b00000000000000000000000000000000) (bvsge (index!57188 lt!675091) (size!51382 _keys!605)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105382 (_ BitVec 32)) SeekEntryResult!13697)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575183 (= lt!675091 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135796 res!1076325) b!1575181))

(assert (= (and b!1575181 res!1076324) b!1575182))

(assert (= (and b!1575182 res!1076323) b!1575183))

(declare-fun m!1448295 () Bool)

(assert (=> start!135796 m!1448295))

(declare-fun m!1448297 () Bool)

(assert (=> start!135796 m!1448297))

(declare-fun m!1448299 () Bool)

(assert (=> b!1575182 m!1448299))

(declare-fun m!1448301 () Bool)

(assert (=> b!1575183 m!1448301))

(assert (=> b!1575183 m!1448301))

(declare-fun m!1448303 () Bool)

(assert (=> b!1575183 m!1448303))

(push 1)

(assert (not b!1575182))

(assert (not start!135796))

(assert (not b!1575183))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165371 () Bool)

(assert (=> d!165371 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575182 d!165371))

(declare-fun d!165373 () Bool)

(assert (=> d!165373 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135796 d!165373))

(declare-fun d!165383 () Bool)

(assert (=> d!165383 (= (array_inv!39559 _keys!605) (bvsge (size!51382 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135796 d!165383))

(declare-fun b!1575256 () Bool)

(declare-fun e!878574 () SeekEntryResult!13697)

(assert (=> b!1575256 (= e!878574 (Intermediate!13697 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575257 () Bool)

(declare-fun e!878575 () SeekEntryResult!13697)

(assert (=> b!1575257 (= e!878574 e!878575)))

(declare-fun c!145719 () Bool)

(declare-fun lt!675115 () (_ BitVec 64))

(assert (=> b!1575257 (= c!145719 (or (= lt!675115 k!761) (= (bvadd lt!675115 lt!675115) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!165385 () Bool)

(declare-fun e!878576 () Bool)

(assert (=> d!165385 e!878576))

(declare-fun c!145718 () Bool)

(declare-fun lt!675114 () SeekEntryResult!13697)

(assert (=> d!165385 (= c!145718 (and (is-Intermediate!13697 lt!675114) (undefined!14509 lt!675114)))))

(assert (=> d!165385 (= lt!675114 e!878574)))

(declare-fun c!145717 () Bool)

(assert (=> d!165385 (= c!145717 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165385 (= lt!675115 (select (arr!50832 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165385 (validMask!0 mask!898)))

(assert (=> d!165385 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675114)))

(declare-fun b!1575258 () Bool)

(assert (=> b!1575258 (= e!878576 (bvsge (x!142137 lt!675114) #b01111111111111111111111111111110))))

(declare-fun b!1575259 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575259 (= e!878575 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1575260 () Bool)

(declare-fun e!878572 () Bool)

(assert (=> b!1575260 (= e!878576 e!878572)))

(declare-fun res!1076352 () Bool)

(assert (=> b!1575260 (= res!1076352 (and (is-Intermediate!13697 lt!675114) (not (undefined!14509 lt!675114)) (bvslt (x!142137 lt!675114) #b01111111111111111111111111111110) (bvsge (x!142137 lt!675114) #b00000000000000000000000000000000) (bvsge (x!142137 lt!675114) #b00000000000000000000000000000000)))))

(assert (=> b!1575260 (=> (not res!1076352) (not e!878572))))

(declare-fun b!1575261 () Bool)

(assert (=> b!1575261 (and (bvsge (index!57188 lt!675114) #b00000000000000000000000000000000) (bvslt (index!57188 lt!675114) (size!51382 _keys!605)))))

(declare-fun e!878573 () Bool)

(assert (=> b!1575261 (= e!878573 (= (select (arr!50832 _keys!605) (index!57188 lt!675114)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1575262 () Bool)

(assert (=> b!1575262 (and (bvsge (index!57188 lt!675114) #b00000000000000000000000000000000) (bvslt (index!57188 lt!675114) (size!51382 _keys!605)))))

(declare-fun res!1076353 () Bool)

(assert (=> b!1575262 (= res!1076353 (= (select (arr!50832 _keys!605) (index!57188 lt!675114)) k!761))))

(assert (=> b!1575262 (=> res!1076353 e!878573)))

(assert (=> b!1575262 (= e!878572 e!878573)))

(declare-fun b!1575263 () Bool)

(assert (=> b!1575263 (= e!878575 (Intermediate!13697 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575264 () Bool)

(assert (=> b!1575264 (and (bvsge (index!57188 lt!675114) #b00000000000000000000000000000000) (bvslt (index!57188 lt!675114) (size!51382 _keys!605)))))

(declare-fun res!1076354 () Bool)

(assert (=> b!1575264 (= res!1076354 (= (select (arr!50832 _keys!605) (index!57188 lt!675114)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1575264 (=> res!1076354 e!878573)))

(assert (= (and d!165385 c!145717) b!1575256))

(assert (= (and d!165385 (not c!145717)) b!1575257))

(assert (= (and b!1575257 c!145719) b!1575263))

(assert (= (and b!1575257 (not c!145719)) b!1575259))

(assert (= (and d!165385 c!145718) b!1575258))

(assert (= (and d!165385 (not c!145718)) b!1575260))

(assert (= (and b!1575260 res!1076352) b!1575262))

(assert (= (and b!1575262 (not res!1076353)) b!1575264))

(assert (= (and b!1575264 (not res!1076354)) b!1575261))

(declare-fun m!1448321 () Bool)

(assert (=> b!1575264 m!1448321))

(assert (=> b!1575262 m!1448321))

(assert (=> b!1575261 m!1448321))

(assert (=> b!1575259 m!1448301))

(declare-fun m!1448323 () Bool)

(assert (=> b!1575259 m!1448323))

(assert (=> b!1575259 m!1448323))

(declare-fun m!1448325 () Bool)

(assert (=> b!1575259 m!1448325))

(assert (=> d!165385 m!1448301))

(declare-fun m!1448327 () Bool)

(assert (=> d!165385 m!1448327))

(assert (=> d!165385 m!1448295))

(assert (=> b!1575183 d!165385))

(declare-fun d!165393 () Bool)

(declare-fun lt!675127 () (_ BitVec 32))

(declare-fun lt!675126 () (_ BitVec 32))

(assert (=> d!165393 (= lt!675127 (bvmul (bvxor lt!675126 (bvlshr lt!675126 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165393 (= lt!675126 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165393 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076355 (let ((h!38263 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142143 (bvmul (bvxor h!38263 (bvlshr h!38263 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142143 (bvlshr x!142143 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076355 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076355 #b00000000000000000000000000000000))))))

(assert (=> d!165393 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675127 (bvlshr lt!675127 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1575183 d!165393))

(push 1)

(assert (not b!1575259))

(assert (not d!165385))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

