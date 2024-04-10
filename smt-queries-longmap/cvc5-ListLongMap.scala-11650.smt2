; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136096 () Bool)

(assert start!136096)

(declare-fun res!1076895 () Bool)

(declare-fun e!879178 () Bool)

(assert (=> start!136096 (=> (not res!1076895) (not e!879178))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136096 (= res!1076895 (validMask!0 mask!898))))

(assert (=> start!136096 e!879178))

(assert (=> start!136096 true))

(declare-datatypes ((array!105476 0))(
  ( (array!105477 (arr!50869 (Array (_ BitVec 32) (_ BitVec 64))) (size!51419 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105476)

(declare-fun array_inv!39596 (array!105476) Bool)

(assert (=> start!136096 (array_inv!39596 _keys!605)))

(declare-fun b!1576274 () Bool)

(declare-fun e!879177 () Bool)

(assert (=> b!1576274 (= e!879178 e!879177)))

(declare-fun res!1076896 () Bool)

(assert (=> b!1576274 (=> (not res!1076896) (not e!879177))))

(declare-datatypes ((SeekEntryResult!13734 0))(
  ( (MissingZero!13734 (index!57334 (_ BitVec 32))) (Found!13734 (index!57335 (_ BitVec 32))) (Intermediate!13734 (undefined!14546 Bool) (index!57336 (_ BitVec 32)) (x!142329 (_ BitVec 32))) (Undefined!13734) (MissingVacant!13734 (index!57337 (_ BitVec 32))) )
))
(declare-fun lt!675538 () SeekEntryResult!13734)

(declare-fun k!761 () (_ BitVec 64))

(assert (=> b!1576274 (= res!1076896 (and (not (undefined!14546 lt!675538)) (is-Intermediate!13734 lt!675538) (not (= (select (arr!50869 _keys!605) (index!57336 lt!675538)) k!761)) (not (= (select (arr!50869 _keys!605) (index!57336 lt!675538)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50869 _keys!605) (index!57336 lt!675538)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!57336 lt!675538) #b00000000000000000000000000000000) (bvslt (index!57336 lt!675538) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105476 (_ BitVec 32)) SeekEntryResult!13734)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576274 (= lt!675538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(declare-fun lt!675537 () SeekEntryResult!13734)

(declare-fun b!1576275 () Bool)

(assert (=> b!1576275 (= e!879177 (and (not (is-Undefined!13734 lt!675537)) (ite (is-Found!13734 lt!675537) (not (= (select (arr!50869 _keys!605) (index!57335 lt!675537)) k!761)) (ite (is-MissingZero!13734 lt!675537) (not (= (select (arr!50869 _keys!605) (index!57334 lt!675537)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (is-MissingVacant!13734 lt!675537)) (not (= (select (arr!50869 _keys!605) (index!57337 lt!675537)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105476 (_ BitVec 32)) SeekEntryResult!13734)

(assert (=> b!1576275 (= lt!675537 (seekKeyOrZeroReturnVacant!0 (x!142329 lt!675538) (index!57336 lt!675538) (index!57336 lt!675538) k!761 _keys!605 mask!898))))

(declare-fun b!1576272 () Bool)

(declare-fun res!1076898 () Bool)

(assert (=> b!1576272 (=> (not res!1076898) (not e!879178))))

(assert (=> b!1576272 (= res!1076898 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51419 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1576273 () Bool)

(declare-fun res!1076897 () Bool)

(assert (=> b!1576273 (=> (not res!1076897) (not e!879178))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576273 (= res!1076897 (validKeyInArray!0 k!761))))

(assert (= (and start!136096 res!1076895) b!1576272))

(assert (= (and b!1576272 res!1076898) b!1576273))

(assert (= (and b!1576273 res!1076897) b!1576274))

(assert (= (and b!1576274 res!1076896) b!1576275))

(declare-fun m!1448959 () Bool)

(assert (=> start!136096 m!1448959))

(declare-fun m!1448961 () Bool)

(assert (=> start!136096 m!1448961))

(declare-fun m!1448963 () Bool)

(assert (=> b!1576274 m!1448963))

(declare-fun m!1448965 () Bool)

(assert (=> b!1576274 m!1448965))

(assert (=> b!1576274 m!1448965))

(declare-fun m!1448967 () Bool)

(assert (=> b!1576274 m!1448967))

(declare-fun m!1448969 () Bool)

(assert (=> b!1576275 m!1448969))

(declare-fun m!1448971 () Bool)

(assert (=> b!1576275 m!1448971))

(declare-fun m!1448973 () Bool)

(assert (=> b!1576275 m!1448973))

(declare-fun m!1448975 () Bool)

(assert (=> b!1576275 m!1448975))

(declare-fun m!1448977 () Bool)

(assert (=> b!1576273 m!1448977))

(push 1)

(assert (not b!1576275))

(assert (not start!136096))

(assert (not b!1576273))

(assert (not b!1576274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1576339 () Bool)

(declare-fun e!879221 () SeekEntryResult!13734)

(assert (=> b!1576339 (= e!879221 Undefined!13734)))

(declare-fun b!1576340 () Bool)

(declare-fun c!145979 () Bool)

(declare-fun lt!675562 () (_ BitVec 64))

(assert (=> b!1576340 (= c!145979 (= lt!675562 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!879220 () SeekEntryResult!13734)

(declare-fun e!879219 () SeekEntryResult!13734)

(assert (=> b!1576340 (= e!879220 e!879219)))

(declare-fun b!1576341 () Bool)

(assert (=> b!1576341 (= e!879219 (MissingVacant!13734 (index!57336 lt!675538)))))

(declare-fun b!1576342 () Bool)

(assert (=> b!1576342 (= e!879221 e!879220)))

(declare-fun c!145978 () Bool)

(assert (=> b!1576342 (= c!145978 (= lt!675562 k!761))))

(declare-fun d!165621 () Bool)

(declare-fun lt!675561 () SeekEntryResult!13734)

(assert (=> d!165621 (and (or (is-Undefined!13734 lt!675561) (not (is-Found!13734 lt!675561)) (and (bvsge (index!57335 lt!675561) #b00000000000000000000000000000000) (bvslt (index!57335 lt!675561) (size!51419 _keys!605)))) (or (is-Undefined!13734 lt!675561) (is-Found!13734 lt!675561) (not (is-MissingVacant!13734 lt!675561)) (not (= (index!57337 lt!675561) (index!57336 lt!675538))) (and (bvsge (index!57337 lt!675561) #b00000000000000000000000000000000) (bvslt (index!57337 lt!675561) (size!51419 _keys!605)))) (or (is-Undefined!13734 lt!675561) (ite (is-Found!13734 lt!675561) (= (select (arr!50869 _keys!605) (index!57335 lt!675561)) k!761) (and (is-MissingVacant!13734 lt!675561) (= (index!57337 lt!675561) (index!57336 lt!675538)) (= (select (arr!50869 _keys!605) (index!57337 lt!675561)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!165621 (= lt!675561 e!879221)))

(declare-fun c!145980 () Bool)

(assert (=> d!165621 (= c!145980 (bvsge (x!142329 lt!675538) #b01111111111111111111111111111110))))

(assert (=> d!165621 (= lt!675562 (select (arr!50869 _keys!605) (index!57336 lt!675538)))))

(assert (=> d!165621 (validMask!0 mask!898)))

(assert (=> d!165621 (= (seekKeyOrZeroReturnVacant!0 (x!142329 lt!675538) (index!57336 lt!675538) (index!57336 lt!675538) k!761 _keys!605 mask!898) lt!675561)))

(declare-fun b!1576343 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576343 (= e!879219 (seekKeyOrZeroReturnVacant!0 (bvadd (x!142329 lt!675538) #b00000000000000000000000000000001) (nextIndex!0 (index!57336 lt!675538) (x!142329 lt!675538) mask!898) (index!57336 lt!675538) k!761 _keys!605 mask!898))))

(declare-fun b!1576344 () Bool)

(assert (=> b!1576344 (= e!879220 (Found!13734 (index!57336 lt!675538)))))

(assert (= (and d!165621 c!145980) b!1576339))

(assert (= (and d!165621 (not c!145980)) b!1576342))

(assert (= (and b!1576342 c!145978) b!1576344))

(assert (= (and b!1576342 (not c!145978)) b!1576340))

(assert (= (and b!1576340 c!145979) b!1576341))

(assert (= (and b!1576340 (not c!145979)) b!1576343))

(declare-fun m!1449027 () Bool)

(assert (=> d!165621 m!1449027))

(declare-fun m!1449029 () Bool)

(assert (=> d!165621 m!1449029))

(assert (=> d!165621 m!1448963))

(assert (=> d!165621 m!1448959))

(declare-fun m!1449031 () Bool)

(assert (=> b!1576343 m!1449031))

(assert (=> b!1576343 m!1449031))

(declare-fun m!1449033 () Bool)

(assert (=> b!1576343 m!1449033))

(assert (=> b!1576275 d!165621))

(declare-fun d!165627 () Bool)

(assert (=> d!165627 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136096 d!165627))

(declare-fun d!165631 () Bool)

(assert (=> d!165631 (= (array_inv!39596 _keys!605) (bvsge (size!51419 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136096 d!165631))

(declare-fun d!165633 () Bool)

(assert (=> d!165633 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576273 d!165633))

(declare-fun b!1576408 () Bool)

(declare-fun e!879257 () SeekEntryResult!13734)

(assert (=> b!1576408 (= e!879257 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1576409 () Bool)

(declare-fun e!879260 () Bool)

(declare-fun e!879256 () Bool)

(assert (=> b!1576409 (= e!879260 e!879256)))

(declare-fun res!1076951 () Bool)

(declare-fun lt!675591 () SeekEntryResult!13734)

(assert (=> b!1576409 (= res!1076951 (and (is-Intermediate!13734 lt!675591) (not (undefined!14546 lt!675591)) (bvslt (x!142329 lt!675591) #b01111111111111111111111111111110) (bvsge (x!142329 lt!675591) #b00000000000000000000000000000000) (bvsge (x!142329 lt!675591) #b00000000000000000000000000000000)))))

(assert (=> b!1576409 (=> (not res!1076951) (not e!879256))))

(declare-fun b!1576410 () Bool)

(declare-fun e!879259 () SeekEntryResult!13734)

(assert (=> b!1576410 (= e!879259 e!879257)))

(declare-fun c!146006 () Bool)

(declare-fun lt!675592 () (_ BitVec 64))

(assert (=> b!1576410 (= c!146006 (or (= lt!675592 k!761) (= (bvadd lt!675592 lt!675592) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576411 () Bool)

(assert (=> b!1576411 (and (bvsge (index!57336 lt!675591) #b00000000000000000000000000000000) (bvslt (index!57336 lt!675591) (size!51419 _keys!605)))))

(declare-fun e!879258 () Bool)

(assert (=> b!1576411 (= e!879258 (= (select (arr!50869 _keys!605) (index!57336 lt!675591)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1576412 () Bool)

(assert (=> b!1576412 (and (bvsge (index!57336 lt!675591) #b00000000000000000000000000000000) (bvslt (index!57336 lt!675591) (size!51419 _keys!605)))))

(declare-fun res!1076949 () Bool)

(assert (=> b!1576412 (= res!1076949 (= (select (arr!50869 _keys!605) (index!57336 lt!675591)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1576412 (=> res!1076949 e!879258)))

(declare-fun b!1576414 () Bool)

(assert (=> b!1576414 (= e!879259 (Intermediate!13734 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun d!165635 () Bool)

(assert (=> d!165635 e!879260))

(declare-fun c!146005 () Bool)

(assert (=> d!165635 (= c!146005 (and (is-Intermediate!13734 lt!675591) (undefined!14546 lt!675591)))))

(assert (=> d!165635 (= lt!675591 e!879259)))

(declare-fun c!146007 () Bool)

(assert (=> d!165635 (= c!146007 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165635 (= lt!675592 (select (arr!50869 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165635 (validMask!0 mask!898)))

(assert (=> d!165635 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675591)))

(declare-fun b!1576413 () Bool)

(assert (=> b!1576413 (and (bvsge (index!57336 lt!675591) #b00000000000000000000000000000000) (bvslt (index!57336 lt!675591) (size!51419 _keys!605)))))

(declare-fun res!1076950 () Bool)

(assert (=> b!1576413 (= res!1076950 (= (select (arr!50869 _keys!605) (index!57336 lt!675591)) k!761))))

(assert (=> b!1576413 (=> res!1076950 e!879258)))

(assert (=> b!1576413 (= e!879256 e!879258)))

(declare-fun b!1576415 () Bool)

(assert (=> b!1576415 (= e!879260 (bvsge (x!142329 lt!675591) #b01111111111111111111111111111110))))

(declare-fun b!1576416 () Bool)

(assert (=> b!1576416 (= e!879257 (Intermediate!13734 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(assert (= (and d!165635 c!146007) b!1576414))

(assert (= (and d!165635 (not c!146007)) b!1576410))

(assert (= (and b!1576410 c!146006) b!1576416))

(assert (= (and b!1576410 (not c!146006)) b!1576408))

(assert (= (and d!165635 c!146005) b!1576415))

(assert (= (and d!165635 (not c!146005)) b!1576409))

(assert (= (and b!1576409 res!1076951) b!1576413))

(assert (= (and b!1576413 (not res!1076950)) b!1576412))

(assert (= (and b!1576412 (not res!1076949)) b!1576411))

(declare-fun m!1449051 () Bool)

(assert (=> b!1576411 m!1449051))

(assert (=> d!165635 m!1448965))

(declare-fun m!1449053 () Bool)

(assert (=> d!165635 m!1449053))

(assert (=> d!165635 m!1448959))

(assert (=> b!1576408 m!1448965))

(declare-fun m!1449055 () Bool)

(assert (=> b!1576408 m!1449055))

(assert (=> b!1576408 m!1449055))

(declare-fun m!1449057 () Bool)

(assert (=> b!1576408 m!1449057))

(assert (=> b!1576413 m!1449051))

(assert (=> b!1576412 m!1449051))

(assert (=> b!1576274 d!165635))

(declare-fun d!165651 () Bool)

(declare-fun lt!675598 () (_ BitVec 32))

(declare-fun lt!675597 () (_ BitVec 32))

(assert (=> d!165651 (= lt!675598 (bvmul (bvxor lt!675597 (bvlshr lt!675597 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165651 (= lt!675597 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165651 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076952 (let ((h!38284 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142339 (bvmul (bvxor h!38284 (bvlshr h!38284 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142339 (bvlshr x!142339 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076952 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076952 #b00000000000000000000000000000000))))))

(assert (=> d!165651 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675598 (bvlshr lt!675598 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1576274 d!165651))

(push 1)

