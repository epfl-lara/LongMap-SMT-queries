; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136178 () Bool)

(assert start!136178)

(declare-fun b!1576381 () Bool)

(declare-fun e!879231 () Bool)

(declare-fun e!879232 () Bool)

(assert (=> b!1576381 (= e!879231 e!879232)))

(declare-fun res!1076981 () Bool)

(assert (=> b!1576381 (=> (not res!1076981) (not e!879232))))

(declare-fun lt!675461 () Bool)

(declare-datatypes ((SeekEntryResult!13745 0))(
  ( (MissingZero!13745 (index!57378 (_ BitVec 32))) (Found!13745 (index!57379 (_ BitVec 32))) (Intermediate!13745 (undefined!14557 Bool) (index!57380 (_ BitVec 32)) (x!142380 (_ BitVec 32))) (Undefined!13745) (MissingVacant!13745 (index!57381 (_ BitVec 32))) )
))
(declare-fun lt!675460 () SeekEntryResult!13745)

(assert (=> b!1576381 (= res!1076981 (and (or lt!675461 (not (undefined!14557 lt!675460))) (or lt!675461 (undefined!14557 lt!675460))))))

(assert (=> b!1576381 (= lt!675461 (not (is-Intermediate!13745 lt!675460)))))

(declare-datatypes ((array!105438 0))(
  ( (array!105439 (arr!50845 (Array (_ BitVec 32) (_ BitVec 64))) (size!51397 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105438)

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105438 (_ BitVec 32)) SeekEntryResult!13745)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576381 (= lt!675460 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(declare-fun res!1076980 () Bool)

(assert (=> start!136178 (=> (not res!1076980) (not e!879231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136178 (= res!1076980 (validMask!0 mask!898))))

(assert (=> start!136178 e!879231))

(assert (=> start!136178 true))

(declare-fun array_inv!39781 (array!105438) Bool)

(assert (=> start!136178 (array_inv!39781 _keys!605)))

(declare-fun b!1576379 () Bool)

(declare-fun res!1076982 () Bool)

(assert (=> b!1576379 (=> (not res!1076982) (not e!879231))))

(assert (=> b!1576379 (= res!1076982 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51397 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1576382 () Bool)

(declare-fun lt!675462 () SeekEntryResult!13745)

(assert (=> b!1576382 (= e!879232 (and (not (is-Undefined!13745 lt!675462)) (not (is-Found!13745 lt!675462)) (is-MissingZero!13745 lt!675462) (or (bvslt (index!57378 lt!675462) #b00000000000000000000000000000000) (bvsge (index!57378 lt!675462) (size!51397 _keys!605)))))))

(declare-fun err!194 () SeekEntryResult!13745)

(assert (=> b!1576382 (= lt!675462 err!194)))

(assert (=> b!1576382 true))

(declare-fun b!1576380 () Bool)

(declare-fun res!1076979 () Bool)

(assert (=> b!1576380 (=> (not res!1076979) (not e!879231))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576380 (= res!1076979 (validKeyInArray!0 k!761))))

(assert (= (and start!136178 res!1076980) b!1576379))

(assert (= (and b!1576379 res!1076982) b!1576380))

(assert (= (and b!1576380 res!1076979) b!1576381))

(assert (= (and b!1576381 res!1076981) b!1576382))

(declare-fun m!1448303 () Bool)

(assert (=> b!1576381 m!1448303))

(assert (=> b!1576381 m!1448303))

(declare-fun m!1448305 () Bool)

(assert (=> b!1576381 m!1448305))

(declare-fun m!1448307 () Bool)

(assert (=> start!136178 m!1448307))

(declare-fun m!1448309 () Bool)

(assert (=> start!136178 m!1448309))

(declare-fun m!1448311 () Bool)

(assert (=> b!1576380 m!1448311))

(push 1)

(assert (not b!1576380))

(assert (not start!136178))

(assert (not b!1576381))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165481 () Bool)

(assert (=> d!165481 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576380 d!165481))

(declare-fun d!165483 () Bool)

(assert (=> d!165483 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136178 d!165483))

(declare-fun d!165493 () Bool)

(assert (=> d!165493 (= (array_inv!39781 _keys!605) (bvsge (size!51397 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136178 d!165493))

(declare-fun b!1576436 () Bool)

(declare-fun lt!675477 () SeekEntryResult!13745)

(assert (=> b!1576436 (and (bvsge (index!57380 lt!675477) #b00000000000000000000000000000000) (bvslt (index!57380 lt!675477) (size!51397 _keys!605)))))

(declare-fun res!1077001 () Bool)

(assert (=> b!1576436 (= res!1077001 (= (select (arr!50845 _keys!605) (index!57380 lt!675477)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!879267 () Bool)

(assert (=> b!1576436 (=> res!1077001 e!879267)))

(declare-fun b!1576437 () Bool)

(assert (=> b!1576437 (and (bvsge (index!57380 lt!675477) #b00000000000000000000000000000000) (bvslt (index!57380 lt!675477) (size!51397 _keys!605)))))

(declare-fun res!1077000 () Bool)

(assert (=> b!1576437 (= res!1077000 (= (select (arr!50845 _keys!605) (index!57380 lt!675477)) k!761))))

(assert (=> b!1576437 (=> res!1077000 e!879267)))

(declare-fun e!879265 () Bool)

(assert (=> b!1576437 (= e!879265 e!879267)))

(declare-fun b!1576438 () Bool)

(declare-fun e!879264 () SeekEntryResult!13745)

(assert (=> b!1576438 (= e!879264 (Intermediate!13745 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576439 () Bool)

(declare-fun e!879266 () Bool)

(assert (=> b!1576439 (= e!879266 (bvsge (x!142380 lt!675477) #b01111111111111111111111111111110))))

(declare-fun b!1576440 () Bool)

(declare-fun e!879263 () SeekEntryResult!13745)

(assert (=> b!1576440 (= e!879264 e!879263)))

(declare-fun c!146002 () Bool)

(declare-fun lt!675478 () (_ BitVec 64))

(assert (=> b!1576440 (= c!146002 (or (= lt!675478 k!761) (= (bvadd lt!675478 lt!675478) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576441 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576441 (= e!879263 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1576443 () Bool)

(assert (=> b!1576443 (= e!879263 (Intermediate!13745 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576444 () Bool)

(assert (=> b!1576444 (= e!879266 e!879265)))

(declare-fun res!1076999 () Bool)

(assert (=> b!1576444 (= res!1076999 (and (is-Intermediate!13745 lt!675477) (not (undefined!14557 lt!675477)) (bvslt (x!142380 lt!675477) #b01111111111111111111111111111110) (bvsge (x!142380 lt!675477) #b00000000000000000000000000000000) (bvsge (x!142380 lt!675477) #b00000000000000000000000000000000)))))

(assert (=> b!1576444 (=> (not res!1076999) (not e!879265))))

(declare-fun d!165495 () Bool)

(assert (=> d!165495 e!879266))

(declare-fun c!146003 () Bool)

(assert (=> d!165495 (= c!146003 (and (is-Intermediate!13745 lt!675477) (undefined!14557 lt!675477)))))

(assert (=> d!165495 (= lt!675477 e!879264)))

(declare-fun c!146001 () Bool)

(assert (=> d!165495 (= c!146001 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165495 (= lt!675478 (select (arr!50845 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165495 (validMask!0 mask!898)))

(assert (=> d!165495 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675477)))

(declare-fun b!1576442 () Bool)

(assert (=> b!1576442 (and (bvsge (index!57380 lt!675477) #b00000000000000000000000000000000) (bvslt (index!57380 lt!675477) (size!51397 _keys!605)))))

(assert (=> b!1576442 (= e!879267 (= (select (arr!50845 _keys!605) (index!57380 lt!675477)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!165495 c!146001) b!1576438))

(assert (= (and d!165495 (not c!146001)) b!1576440))

(assert (= (and b!1576440 c!146002) b!1576443))

(assert (= (and b!1576440 (not c!146002)) b!1576441))

(assert (= (and d!165495 c!146003) b!1576439))

(assert (= (and d!165495 (not c!146003)) b!1576444))

(assert (= (and b!1576444 res!1076999) b!1576437))

(assert (= (and b!1576437 (not res!1077000)) b!1576436))

(assert (= (and b!1576436 (not res!1077001)) b!1576442))

(declare-fun m!1448321 () Bool)

(assert (=> b!1576442 m!1448321))

(assert (=> d!165495 m!1448303))

(declare-fun m!1448323 () Bool)

(assert (=> d!165495 m!1448323))

(assert (=> d!165495 m!1448307))

(assert (=> b!1576441 m!1448303))

(declare-fun m!1448325 () Bool)

(assert (=> b!1576441 m!1448325))

(assert (=> b!1576441 m!1448325))

(declare-fun m!1448327 () Bool)

(assert (=> b!1576441 m!1448327))

(assert (=> b!1576436 m!1448321))

(assert (=> b!1576437 m!1448321))

(assert (=> b!1576381 d!165495))

(declare-fun d!165503 () Bool)

(declare-fun lt!675492 () (_ BitVec 32))

(declare-fun lt!675491 () (_ BitVec 32))

(assert (=> d!165503 (= lt!675492 (bvmul (bvxor lt!675491 (bvlshr lt!675491 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165503 (= lt!675491 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165503 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077008 (let ((h!38334 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142385 (bvmul (bvxor h!38334 (bvlshr h!38334 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142385 (bvlshr x!142385 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077008 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077008 #b00000000000000000000000000000000))))))

(assert (=> d!165503 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675492 (bvlshr lt!675492 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1576381 d!165503))

(push 1)

(assert (not d!165495))

(assert (not b!1576441))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

