; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136100 () Bool)

(assert start!136100)

(declare-fun b!1576298 () Bool)

(declare-fun e!879197 () Bool)

(declare-fun e!879195 () Bool)

(assert (=> b!1576298 (= e!879197 e!879195)))

(declare-fun res!1076921 () Bool)

(assert (=> b!1576298 (=> (not res!1076921) (not e!879195))))

(declare-datatypes ((array!105480 0))(
  ( (array!105481 (arr!50871 (Array (_ BitVec 32) (_ BitVec 64))) (size!51421 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105480)

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun k!761 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13736 0))(
  ( (MissingZero!13736 (index!57342 (_ BitVec 32))) (Found!13736 (index!57343 (_ BitVec 32))) (Intermediate!13736 (undefined!14548 Bool) (index!57344 (_ BitVec 32)) (x!142331 (_ BitVec 32))) (Undefined!13736) (MissingVacant!13736 (index!57345 (_ BitVec 32))) )
))
(declare-fun lt!675549 () SeekEntryResult!13736)

(assert (=> b!1576298 (= res!1076921 (and (not (undefined!14548 lt!675549)) (is-Intermediate!13736 lt!675549) (not (= (select (arr!50871 _keys!605) (index!57344 lt!675549)) k!761)) (not (= (select (arr!50871 _keys!605) (index!57344 lt!675549)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50871 _keys!605) (index!57344 lt!675549)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!57344 lt!675549) #b00000000000000000000000000000000) (bvslt (index!57344 lt!675549) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105480 (_ BitVec 32)) SeekEntryResult!13736)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576298 (= lt!675549 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1576297 () Bool)

(declare-fun res!1076922 () Bool)

(assert (=> b!1576297 (=> (not res!1076922) (not e!879197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576297 (= res!1076922 (validKeyInArray!0 k!761))))

(declare-fun lt!675550 () SeekEntryResult!13736)

(declare-fun b!1576299 () Bool)

(assert (=> b!1576299 (= e!879195 (and (not (is-Undefined!13736 lt!675550)) (ite (is-Found!13736 lt!675550) (not (= (select (arr!50871 _keys!605) (index!57343 lt!675550)) k!761)) (ite (is-MissingZero!13736 lt!675550) (not (= (select (arr!50871 _keys!605) (index!57342 lt!675550)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (is-MissingVacant!13736 lt!675550)) (not (= (select (arr!50871 _keys!605) (index!57345 lt!675550)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105480 (_ BitVec 32)) SeekEntryResult!13736)

(assert (=> b!1576299 (= lt!675550 (seekKeyOrZeroReturnVacant!0 (x!142331 lt!675549) (index!57344 lt!675549) (index!57344 lt!675549) k!761 _keys!605 mask!898))))

(declare-fun res!1076920 () Bool)

(assert (=> start!136100 (=> (not res!1076920) (not e!879197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136100 (= res!1076920 (validMask!0 mask!898))))

(assert (=> start!136100 e!879197))

(assert (=> start!136100 true))

(declare-fun array_inv!39598 (array!105480) Bool)

(assert (=> start!136100 (array_inv!39598 _keys!605)))

(declare-fun b!1576296 () Bool)

(declare-fun res!1076919 () Bool)

(assert (=> b!1576296 (=> (not res!1076919) (not e!879197))))

(assert (=> b!1576296 (= res!1076919 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51421 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(assert (= (and start!136100 res!1076920) b!1576296))

(assert (= (and b!1576296 res!1076919) b!1576297))

(assert (= (and b!1576297 res!1076922) b!1576298))

(assert (= (and b!1576298 res!1076921) b!1576299))

(declare-fun m!1448999 () Bool)

(assert (=> b!1576298 m!1448999))

(declare-fun m!1449001 () Bool)

(assert (=> b!1576298 m!1449001))

(assert (=> b!1576298 m!1449001))

(declare-fun m!1449003 () Bool)

(assert (=> b!1576298 m!1449003))

(declare-fun m!1449005 () Bool)

(assert (=> b!1576297 m!1449005))

(declare-fun m!1449007 () Bool)

(assert (=> b!1576299 m!1449007))

(declare-fun m!1449009 () Bool)

(assert (=> b!1576299 m!1449009))

(declare-fun m!1449011 () Bool)

(assert (=> b!1576299 m!1449011))

(declare-fun m!1449013 () Bool)

(assert (=> b!1576299 m!1449013))

(declare-fun m!1449015 () Bool)

(assert (=> start!136100 m!1449015))

(declare-fun m!1449017 () Bool)

(assert (=> start!136100 m!1449017))

(push 1)

(assert (not b!1576298))

(assert (not b!1576297))

(assert (not start!136100))

(assert (not b!1576299))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1576363 () Bool)

(declare-fun e!879232 () Bool)

(declare-fun e!879236 () Bool)

(assert (=> b!1576363 (= e!879232 e!879236)))

(declare-fun res!1076939 () Bool)

(declare-fun lt!675573 () SeekEntryResult!13736)

(assert (=> b!1576363 (= res!1076939 (and (is-Intermediate!13736 lt!675573) (not (undefined!14548 lt!675573)) (bvslt (x!142331 lt!675573) #b01111111111111111111111111111110) (bvsge (x!142331 lt!675573) #b00000000000000000000000000000000) (bvsge (x!142331 lt!675573) #b00000000000000000000000000000000)))))

(assert (=> b!1576363 (=> (not res!1076939) (not e!879236))))

(declare-fun b!1576364 () Bool)

(declare-fun e!879234 () SeekEntryResult!13736)

(assert (=> b!1576364 (= e!879234 (Intermediate!13736 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576365 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576365 (= e!879234 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun d!165623 () Bool)

(assert (=> d!165623 e!879232))

(declare-fun c!145988 () Bool)

(assert (=> d!165623 (= c!145988 (and (is-Intermediate!13736 lt!675573) (undefined!14548 lt!675573)))))

(declare-fun e!879235 () SeekEntryResult!13736)

(assert (=> d!165623 (= lt!675573 e!879235)))

(declare-fun c!145989 () Bool)

(assert (=> d!165623 (= c!145989 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675574 () (_ BitVec 64))

(assert (=> d!165623 (= lt!675574 (select (arr!50871 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165623 (validMask!0 mask!898)))

(assert (=> d!165623 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675573)))

(declare-fun b!1576366 () Bool)

(assert (=> b!1576366 (= e!879232 (bvsge (x!142331 lt!675573) #b01111111111111111111111111111110))))

(declare-fun b!1576367 () Bool)

(assert (=> b!1576367 (and (bvsge (index!57344 lt!675573) #b00000000000000000000000000000000) (bvslt (index!57344 lt!675573) (size!51421 _keys!605)))))

(declare-fun res!1076941 () Bool)

(assert (=> b!1576367 (= res!1076941 (= (select (arr!50871 _keys!605) (index!57344 lt!675573)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!879233 () Bool)

(assert (=> b!1576367 (=> res!1076941 e!879233)))

(declare-fun b!1576368 () Bool)

(assert (=> b!1576368 (and (bvsge (index!57344 lt!675573) #b00000000000000000000000000000000) (bvslt (index!57344 lt!675573) (size!51421 _keys!605)))))

(assert (=> b!1576368 (= e!879233 (= (select (arr!50871 _keys!605) (index!57344 lt!675573)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1576369 () Bool)

(assert (=> b!1576369 (= e!879235 (Intermediate!13736 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576370 () Bool)

(assert (=> b!1576370 (= e!879235 e!879234)))

(declare-fun c!145987 () Bool)

(assert (=> b!1576370 (= c!145987 (or (= lt!675574 k!761) (= (bvadd lt!675574 lt!675574) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576371 () Bool)

(assert (=> b!1576371 (and (bvsge (index!57344 lt!675573) #b00000000000000000000000000000000) (bvslt (index!57344 lt!675573) (size!51421 _keys!605)))))

(declare-fun res!1076940 () Bool)

(assert (=> b!1576371 (= res!1076940 (= (select (arr!50871 _keys!605) (index!57344 lt!675573)) k!761))))

(assert (=> b!1576371 (=> res!1076940 e!879233)))

(assert (=> b!1576371 (= e!879236 e!879233)))

(assert (= (and d!165623 c!145989) b!1576369))

(assert (= (and d!165623 (not c!145989)) b!1576370))

(assert (= (and b!1576370 c!145987) b!1576364))

(assert (= (and b!1576370 (not c!145987)) b!1576365))

(assert (= (and d!165623 c!145988) b!1576366))

(assert (= (and d!165623 (not c!145988)) b!1576363))

(assert (= (and b!1576363 res!1076939) b!1576371))

(assert (= (and b!1576371 (not res!1076940)) b!1576367))

(assert (= (and b!1576367 (not res!1076941)) b!1576368))

(assert (=> d!165623 m!1449001))

(declare-fun m!1449035 () Bool)

(assert (=> d!165623 m!1449035))

(assert (=> d!165623 m!1449015))

(assert (=> b!1576365 m!1449001))

(declare-fun m!1449037 () Bool)

(assert (=> b!1576365 m!1449037))

(assert (=> b!1576365 m!1449037))

(declare-fun m!1449039 () Bool)

(assert (=> b!1576365 m!1449039))

(declare-fun m!1449041 () Bool)

(assert (=> b!1576371 m!1449041))

(assert (=> b!1576367 m!1449041))

(assert (=> b!1576368 m!1449041))

(assert (=> b!1576298 d!165623))

(declare-fun d!165641 () Bool)

(declare-fun lt!675580 () (_ BitVec 32))

(declare-fun lt!675579 () (_ BitVec 32))

(assert (=> d!165641 (= lt!675580 (bvmul (bvxor lt!675579 (bvlshr lt!675579 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165641 (= lt!675579 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165641 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076942 (let ((h!38283 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142336 (bvmul (bvxor h!38283 (bvlshr h!38283 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142336 (bvlshr x!142336 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076942 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076942 #b00000000000000000000000000000000))))))

(assert (=> d!165641 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675580 (bvlshr lt!675580 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1576298 d!165641))

(declare-fun d!165643 () Bool)

(assert (=> d!165643 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576297 d!165643))

(declare-fun d!165645 () Bool)

(assert (=> d!165645 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136100 d!165645))

(declare-fun d!165647 () Bool)

(assert (=> d!165647 (= (array_inv!39598 _keys!605) (bvsge (size!51421 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136100 d!165647))

(declare-fun b!1576429 () Bool)

(declare-fun e!879269 () SeekEntryResult!13736)

(assert (=> b!1576429 (= e!879269 Undefined!13736)))

(declare-fun b!1576430 () Bool)

(declare-fun e!879267 () SeekEntryResult!13736)

(assert (=> b!1576430 (= e!879267 (seekKeyOrZeroReturnVacant!0 (bvadd (x!142331 lt!675549) #b00000000000000000000000000000001) (nextIndex!0 (index!57344 lt!675549) (x!142331 lt!675549) mask!898) (index!57344 lt!675549) k!761 _keys!605 mask!898))))

(declare-fun d!165649 () Bool)

(declare-fun lt!675604 () SeekEntryResult!13736)

(assert (=> d!165649 (and (or (is-Undefined!13736 lt!675604) (not (is-Found!13736 lt!675604)) (and (bvsge (index!57343 lt!675604) #b00000000000000000000000000000000) (bvslt (index!57343 lt!675604) (size!51421 _keys!605)))) (or (is-Undefined!13736 lt!675604) (is-Found!13736 lt!675604) (not (is-MissingVacant!13736 lt!675604)) (not (= (index!57345 lt!675604) (index!57344 lt!675549))) (and (bvsge (index!57345 lt!675604) #b00000000000000000000000000000000) (bvslt (index!57345 lt!675604) (size!51421 _keys!605)))) (or (is-Undefined!13736 lt!675604) (ite (is-Found!13736 lt!675604) (= (select (arr!50871 _keys!605) (index!57343 lt!675604)) k!761) (and (is-MissingVacant!13736 lt!675604) (= (index!57345 lt!675604) (index!57344 lt!675549)) (= (select (arr!50871 _keys!605) (index!57345 lt!675604)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!165649 (= lt!675604 e!879269)))

(declare-fun c!146016 () Bool)

(assert (=> d!165649 (= c!146016 (bvsge (x!142331 lt!675549) #b01111111111111111111111111111110))))

(declare-fun lt!675603 () (_ BitVec 64))

