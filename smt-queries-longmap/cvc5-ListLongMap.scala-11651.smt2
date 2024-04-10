; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136138 () Bool)

(assert start!136138)

(declare-fun res!1076961 () Bool)

(declare-fun e!879274 () Bool)

(assert (=> start!136138 (=> (not res!1076961) (not e!879274))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136138 (= res!1076961 (validMask!0 mask!898))))

(assert (=> start!136138 e!879274))

(assert (=> start!136138 true))

(declare-datatypes ((array!105485 0))(
  ( (array!105486 (arr!50872 (Array (_ BitVec 32) (_ BitVec 64))) (size!51422 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105485)

(declare-fun array_inv!39599 (array!105485) Bool)

(assert (=> start!136138 (array_inv!39599 _keys!605)))

(declare-fun b!1576441 () Bool)

(declare-fun res!1076960 () Bool)

(assert (=> b!1576441 (=> (not res!1076960) (not e!879274))))

(assert (=> b!1576441 (= res!1076960 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51422 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1576442 () Bool)

(declare-fun res!1076959 () Bool)

(assert (=> b!1576442 (=> (not res!1076959) (not e!879274))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576442 (= res!1076959 (validKeyInArray!0 k!761))))

(declare-fun b!1576443 () Bool)

(declare-fun lt!675609 () Bool)

(declare-datatypes ((SeekEntryResult!13737 0))(
  ( (MissingZero!13737 (index!57346 (_ BitVec 32))) (Found!13737 (index!57347 (_ BitVec 32))) (Intermediate!13737 (undefined!14549 Bool) (index!57348 (_ BitVec 32)) (x!142349 (_ BitVec 32))) (Undefined!13737) (MissingVacant!13737 (index!57349 (_ BitVec 32))) )
))
(declare-fun lt!675610 () SeekEntryResult!13737)

(assert (=> b!1576443 (= e!879274 (and (or lt!675609 (not (undefined!14549 lt!675610))) (or lt!675609 (undefined!14549 lt!675610))))))

(assert (=> b!1576443 (= lt!675609 (not (is-Intermediate!13737 lt!675610)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105485 (_ BitVec 32)) SeekEntryResult!13737)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576443 (= lt!675610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136138 res!1076961) b!1576441))

(assert (= (and b!1576441 res!1076960) b!1576442))

(assert (= (and b!1576442 res!1076959) b!1576443))

(declare-fun m!1449067 () Bool)

(assert (=> start!136138 m!1449067))

(declare-fun m!1449069 () Bool)

(assert (=> start!136138 m!1449069))

(declare-fun m!1449071 () Bool)

(assert (=> b!1576442 m!1449071))

(declare-fun m!1449073 () Bool)

(assert (=> b!1576443 m!1449073))

(assert (=> b!1576443 m!1449073))

(declare-fun m!1449075 () Bool)

(assert (=> b!1576443 m!1449075))

(push 1)

(assert (not b!1576442))

(assert (not b!1576443))

(assert (not start!136138))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165659 () Bool)

(assert (=> d!165659 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576442 d!165659))

(declare-fun b!1576525 () Bool)

(declare-fun e!879326 () SeekEntryResult!13737)

(assert (=> b!1576525 (= e!879326 (Intermediate!13737 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576526 () Bool)

(declare-fun lt!675638 () SeekEntryResult!13737)

(assert (=> b!1576526 (and (bvsge (index!57348 lt!675638) #b00000000000000000000000000000000) (bvslt (index!57348 lt!675638) (size!51422 _keys!605)))))

(declare-fun res!1077003 () Bool)

(assert (=> b!1576526 (= res!1077003 (= (select (arr!50872 _keys!605) (index!57348 lt!675638)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!879325 () Bool)

(assert (=> b!1576526 (=> res!1077003 e!879325)))

(declare-fun b!1576527 () Bool)

(declare-fun e!879323 () SeekEntryResult!13737)

(assert (=> b!1576527 (= e!879323 (Intermediate!13737 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576528 () Bool)

(declare-fun e!879324 () Bool)

(declare-fun e!879327 () Bool)

(assert (=> b!1576528 (= e!879324 e!879327)))

(declare-fun res!1077002 () Bool)

(assert (=> b!1576528 (= res!1077002 (and (is-Intermediate!13737 lt!675638) (not (undefined!14549 lt!675638)) (bvslt (x!142349 lt!675638) #b01111111111111111111111111111110) (bvsge (x!142349 lt!675638) #b00000000000000000000000000000000) (bvsge (x!142349 lt!675638) #b00000000000000000000000000000000)))))

(assert (=> b!1576528 (=> (not res!1077002) (not e!879327))))

(declare-fun b!1576529 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576529 (= e!879326 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun d!165663 () Bool)

(assert (=> d!165663 e!879324))

(declare-fun c!146040 () Bool)

(assert (=> d!165663 (= c!146040 (and (is-Intermediate!13737 lt!675638) (undefined!14549 lt!675638)))))

(assert (=> d!165663 (= lt!675638 e!879323)))

(declare-fun c!146039 () Bool)

(assert (=> d!165663 (= c!146039 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675637 () (_ BitVec 64))

(assert (=> d!165663 (= lt!675637 (select (arr!50872 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165663 (validMask!0 mask!898)))

(assert (=> d!165663 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675638)))

(declare-fun b!1576530 () Bool)

(assert (=> b!1576530 (= e!879324 (bvsge (x!142349 lt!675638) #b01111111111111111111111111111110))))

(declare-fun b!1576531 () Bool)

(assert (=> b!1576531 (and (bvsge (index!57348 lt!675638) #b00000000000000000000000000000000) (bvslt (index!57348 lt!675638) (size!51422 _keys!605)))))

(assert (=> b!1576531 (= e!879325 (= (select (arr!50872 _keys!605) (index!57348 lt!675638)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1576532 () Bool)

(assert (=> b!1576532 (= e!879323 e!879326)))

(declare-fun c!146038 () Bool)

(assert (=> b!1576532 (= c!146038 (or (= lt!675637 k!761) (= (bvadd lt!675637 lt!675637) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576533 () Bool)

(assert (=> b!1576533 (and (bvsge (index!57348 lt!675638) #b00000000000000000000000000000000) (bvslt (index!57348 lt!675638) (size!51422 _keys!605)))))

(declare-fun res!1077004 () Bool)

(assert (=> b!1576533 (= res!1077004 (= (select (arr!50872 _keys!605) (index!57348 lt!675638)) k!761))))

(assert (=> b!1576533 (=> res!1077004 e!879325)))

(assert (=> b!1576533 (= e!879327 e!879325)))

(assert (= (and d!165663 c!146039) b!1576527))

(assert (= (and d!165663 (not c!146039)) b!1576532))

(assert (= (and b!1576532 c!146038) b!1576525))

(assert (= (and b!1576532 (not c!146038)) b!1576529))

(assert (= (and d!165663 c!146040) b!1576530))

(assert (= (and d!165663 (not c!146040)) b!1576528))

(assert (= (and b!1576528 res!1077002) b!1576533))

(assert (= (and b!1576533 (not res!1077004)) b!1576526))

(assert (= (and b!1576526 (not res!1077003)) b!1576531))

(declare-fun m!1449105 () Bool)

(assert (=> b!1576526 m!1449105))

(assert (=> d!165663 m!1449073))

(declare-fun m!1449107 () Bool)

(assert (=> d!165663 m!1449107))

(assert (=> d!165663 m!1449067))

(assert (=> b!1576533 m!1449105))

(assert (=> b!1576529 m!1449073))

(declare-fun m!1449109 () Bool)

(assert (=> b!1576529 m!1449109))

(assert (=> b!1576529 m!1449109))

(declare-fun m!1449111 () Bool)

(assert (=> b!1576529 m!1449111))

(assert (=> b!1576531 m!1449105))

(assert (=> b!1576443 d!165663))

(declare-fun d!165669 () Bool)

(declare-fun lt!675652 () (_ BitVec 32))

(declare-fun lt!675651 () (_ BitVec 32))

(assert (=> d!165669 (= lt!675652 (bvmul (bvxor lt!675651 (bvlshr lt!675651 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165669 (= lt!675651 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165669 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077008 (let ((h!38286 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142356 (bvmul (bvxor h!38286 (bvlshr h!38286 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142356 (bvlshr x!142356 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077008 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077008 #b00000000000000000000000000000000))))))

(assert (=> d!165669 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675652 (bvlshr lt!675652 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1576443 d!165669))

(declare-fun d!165675 () Bool)

(assert (=> d!165675 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136138 d!165675))

(declare-fun d!165681 () Bool)

(assert (=> d!165681 (= (array_inv!39599 _keys!605) (bvsge (size!51422 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136138 d!165681))

(push 1)

(assert (not b!1576529))

(assert (not d!165663))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

