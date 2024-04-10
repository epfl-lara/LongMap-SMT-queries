; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135792 () Bool)

(assert start!135792)

(declare-fun res!1076306 () Bool)

(declare-fun e!878518 () Bool)

(assert (=> start!135792 (=> (not res!1076306) (not e!878518))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135792 (= res!1076306 (validMask!0 mask!898))))

(assert (=> start!135792 e!878518))

(assert (=> start!135792 true))

(declare-datatypes ((array!105378 0))(
  ( (array!105379 (arr!50830 (Array (_ BitVec 32) (_ BitVec 64))) (size!51380 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105378)

(declare-fun array_inv!39557 (array!105378) Bool)

(assert (=> start!135792 (array_inv!39557 _keys!605)))

(declare-fun b!1575163 () Bool)

(declare-fun res!1076305 () Bool)

(assert (=> b!1575163 (=> (not res!1076305) (not e!878518))))

(assert (=> b!1575163 (= res!1076305 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51380 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575164 () Bool)

(declare-fun res!1076307 () Bool)

(assert (=> b!1575164 (=> (not res!1076307) (not e!878518))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575164 (= res!1076307 (validKeyInArray!0 k!761))))

(declare-fun b!1575165 () Bool)

(declare-datatypes ((SeekEntryResult!13695 0))(
  ( (MissingZero!13695 (index!57178 (_ BitVec 32))) (Found!13695 (index!57179 (_ BitVec 32))) (Intermediate!13695 (undefined!14507 Bool) (index!57180 (_ BitVec 32)) (x!142135 (_ BitVec 32))) (Undefined!13695) (MissingVacant!13695 (index!57181 (_ BitVec 32))) )
))
(declare-fun lt!675085 () SeekEntryResult!13695)

(assert (=> b!1575165 (= e!878518 (and (is-Intermediate!13695 lt!675085) (not (undefined!14507 lt!675085)) (or (bvslt (index!57180 lt!675085) #b00000000000000000000000000000000) (bvsge (index!57180 lt!675085) (size!51380 _keys!605)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105378 (_ BitVec 32)) SeekEntryResult!13695)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575165 (= lt!675085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135792 res!1076306) b!1575163))

(assert (= (and b!1575163 res!1076305) b!1575164))

(assert (= (and b!1575164 res!1076307) b!1575165))

(declare-fun m!1448275 () Bool)

(assert (=> start!135792 m!1448275))

(declare-fun m!1448277 () Bool)

(assert (=> start!135792 m!1448277))

(declare-fun m!1448279 () Bool)

(assert (=> b!1575164 m!1448279))

(declare-fun m!1448281 () Bool)

(assert (=> b!1575165 m!1448281))

(assert (=> b!1575165 m!1448281))

(declare-fun m!1448283 () Bool)

(assert (=> b!1575165 m!1448283))

(push 1)

(assert (not b!1575164))

(assert (not start!135792))

(assert (not b!1575165))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165367 () Bool)

(assert (=> d!165367 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575164 d!165367))

(declare-fun d!165369 () Bool)

(assert (=> d!165369 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135792 d!165369))

(declare-fun d!165379 () Bool)

(assert (=> d!165379 (= (array_inv!39557 _keys!605) (bvsge (size!51380 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135792 d!165379))

(declare-fun b!1575237 () Bool)

(declare-fun lt!675106 () SeekEntryResult!13695)

(assert (=> b!1575237 (and (bvsge (index!57180 lt!675106) #b00000000000000000000000000000000) (bvslt (index!57180 lt!675106) (size!51380 _keys!605)))))

(declare-fun res!1076343 () Bool)

(assert (=> b!1575237 (= res!1076343 (= (select (arr!50830 _keys!605) (index!57180 lt!675106)) k!761))))

(declare-fun e!878561 () Bool)

(assert (=> b!1575237 (=> res!1076343 e!878561)))

(declare-fun e!878564 () Bool)

(assert (=> b!1575237 (= e!878564 e!878561)))

(declare-fun d!165381 () Bool)

(declare-fun e!878565 () Bool)

(assert (=> d!165381 e!878565))

(declare-fun c!145714 () Bool)

(assert (=> d!165381 (= c!145714 (and (is-Intermediate!13695 lt!675106) (undefined!14507 lt!675106)))))

(declare-fun e!878562 () SeekEntryResult!13695)

(assert (=> d!165381 (= lt!675106 e!878562)))

(declare-fun c!145712 () Bool)

(assert (=> d!165381 (= c!145712 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675107 () (_ BitVec 64))

(assert (=> d!165381 (= lt!675107 (select (arr!50830 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165381 (validMask!0 mask!898)))

(assert (=> d!165381 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675106)))

(declare-fun b!1575238 () Bool)

(assert (=> b!1575238 (and (bvsge (index!57180 lt!675106) #b00000000000000000000000000000000) (bvslt (index!57180 lt!675106) (size!51380 _keys!605)))))

(declare-fun res!1076344 () Bool)

(assert (=> b!1575238 (= res!1076344 (= (select (arr!50830 _keys!605) (index!57180 lt!675106)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1575238 (=> res!1076344 e!878561)))

(declare-fun b!1575239 () Bool)

(declare-fun e!878563 () SeekEntryResult!13695)

(assert (=> b!1575239 (= e!878562 e!878563)))

(declare-fun c!145713 () Bool)

(assert (=> b!1575239 (= c!145713 (or (= lt!675107 k!761) (= (bvadd lt!675107 lt!675107) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1575240 () Bool)

(assert (=> b!1575240 (= e!878563 (Intermediate!13695 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575241 () Bool)

(assert (=> b!1575241 (= e!878562 (Intermediate!13695 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575242 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575242 (= e!878563 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1575243 () Bool)

(assert (=> b!1575243 (= e!878565 (bvsge (x!142135 lt!675106) #b01111111111111111111111111111110))))

(declare-fun b!1575244 () Bool)

(assert (=> b!1575244 (and (bvsge (index!57180 lt!675106) #b00000000000000000000000000000000) (bvslt (index!57180 lt!675106) (size!51380 _keys!605)))))

(assert (=> b!1575244 (= e!878561 (= (select (arr!50830 _keys!605) (index!57180 lt!675106)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1575245 () Bool)

(assert (=> b!1575245 (= e!878565 e!878564)))

(declare-fun res!1076342 () Bool)

(assert (=> b!1575245 (= res!1076342 (and (is-Intermediate!13695 lt!675106) (not (undefined!14507 lt!675106)) (bvslt (x!142135 lt!675106) #b01111111111111111111111111111110) (bvsge (x!142135 lt!675106) #b00000000000000000000000000000000) (bvsge (x!142135 lt!675106) #b00000000000000000000000000000000)))))

(assert (=> b!1575245 (=> (not res!1076342) (not e!878564))))

(assert (= (and d!165381 c!145712) b!1575241))

(assert (= (and d!165381 (not c!145712)) b!1575239))

(assert (= (and b!1575239 c!145713) b!1575240))

(assert (= (and b!1575239 (not c!145713)) b!1575242))

(assert (= (and d!165381 c!145714) b!1575243))

(assert (= (and d!165381 (not c!145714)) b!1575245))

(assert (= (and b!1575245 res!1076342) b!1575237))

(assert (= (and b!1575237 (not res!1076343)) b!1575238))

(assert (= (and b!1575238 (not res!1076344)) b!1575244))

(assert (=> b!1575242 m!1448281))

(declare-fun m!1448313 () Bool)

(assert (=> b!1575242 m!1448313))

(assert (=> b!1575242 m!1448313))

(declare-fun m!1448315 () Bool)

(assert (=> b!1575242 m!1448315))

(declare-fun m!1448317 () Bool)

(assert (=> b!1575237 m!1448317))

(assert (=> b!1575244 m!1448317))

(assert (=> d!165381 m!1448281))

(declare-fun m!1448319 () Bool)

(assert (=> d!165381 m!1448319))

(assert (=> d!165381 m!1448275))

(assert (=> b!1575238 m!1448317))

(assert (=> b!1575165 d!165381))

(declare-fun d!165389 () Bool)

(declare-fun lt!675121 () (_ BitVec 32))

(declare-fun lt!675120 () (_ BitVec 32))

(assert (=> d!165389 (= lt!675121 (bvmul (bvxor lt!675120 (bvlshr lt!675120 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165389 (= lt!675120 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165389 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076351 (let ((h!38262 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142142 (bvmul (bvxor h!38262 (bvlshr h!38262 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142142 (bvlshr x!142142 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076351 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076351 #b00000000000000000000000000000000))))))

(assert (=> d!165389 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675121 (bvlshr lt!675121 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1575165 d!165389))

(push 1)

(assert (not d!165381))

(assert (not b!1575242))

(check-sat)

(pop 1)

(push 1)

(check-sat)

