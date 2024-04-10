; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136336 () Bool)

(assert start!136336)

(declare-fun b!1577127 () Bool)

(declare-fun res!1077390 () Bool)

(declare-fun e!879679 () Bool)

(assert (=> b!1577127 (=> (not res!1077390) (not e!879679))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-datatypes ((array!105548 0))(
  ( (array!105549 (arr!50896 (Array (_ BitVec 32) (_ BitVec 64))) (size!51446 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105548)

(declare-fun mask!910 () (_ BitVec 32))

(assert (=> b!1577127 (= res!1077390 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51446 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun res!1077392 () Bool)

(assert (=> start!136336 (=> (not res!1077392) (not e!879679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136336 (= res!1077392 (validMask!0 mask!910))))

(assert (=> start!136336 e!879679))

(assert (=> start!136336 true))

(declare-fun array_inv!39623 (array!105548) Bool)

(assert (=> start!136336 (array_inv!39623 _keys!610)))

(declare-fun b!1577129 () Bool)

(declare-fun res!1077391 () Bool)

(assert (=> b!1577129 (=> (not res!1077391) (not e!879679))))

(declare-fun k!768 () (_ BitVec 64))

(assert (=> b!1577129 (= res!1077391 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50896 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50896 _keys!610) ee!12) (select (arr!50896 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577130 () Bool)

(declare-fun lt!675940 () (_ BitVec 32))

(assert (=> b!1577130 (= e!879679 (or (bvslt lt!675940 #b00000000000000000000000000000000) (bvsge lt!675940 (bvadd #b00000000000000000000000000000001 mask!910))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577130 (= lt!675940 (nextIndex!0 ee!12 x!458 mask!910))))

(declare-fun b!1577128 () Bool)

(declare-fun res!1077393 () Bool)

(assert (=> b!1577128 (=> (not res!1077393) (not e!879679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577128 (= res!1077393 (validKeyInArray!0 k!768))))

(assert (= (and start!136336 res!1077392) b!1577127))

(assert (= (and b!1577127 res!1077390) b!1577128))

(assert (= (and b!1577128 res!1077393) b!1577129))

(assert (= (and b!1577129 res!1077391) b!1577130))

(declare-fun m!1449445 () Bool)

(assert (=> start!136336 m!1449445))

(declare-fun m!1449447 () Bool)

(assert (=> start!136336 m!1449447))

(declare-fun m!1449449 () Bool)

(assert (=> b!1577129 m!1449449))

(declare-fun m!1449451 () Bool)

(assert (=> b!1577130 m!1449451))

(declare-fun m!1449453 () Bool)

(assert (=> b!1577128 m!1449453))

(push 1)

(assert (not b!1577128))

(assert (not b!1577130))

(assert (not start!136336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165825 () Bool)

(assert (=> d!165825 (= (validKeyInArray!0 k!768) (and (not (= k!768 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!768 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577128 d!165825))

(declare-fun d!165827 () Bool)

(declare-fun lt!675952 () (_ BitVec 32))

(assert (=> d!165827 (and (bvsge lt!675952 #b00000000000000000000000000000000) (bvslt lt!675952 (bvadd mask!910 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!165827 (= lt!675952 (choose!52 ee!12 x!458 mask!910))))

(assert (=> d!165827 (validMask!0 mask!910)))

(assert (=> d!165827 (= (nextIndex!0 ee!12 x!458 mask!910) lt!675952)))

(declare-fun bs!45554 () Bool)

(assert (= bs!45554 d!165827))

(declare-fun m!1449477 () Bool)

(assert (=> bs!45554 m!1449477))

(assert (=> bs!45554 m!1449445))

(assert (=> b!1577130 d!165827))

(declare-fun d!165829 () Bool)

(assert (=> d!165829 (= (validMask!0 mask!910) (and (or (= mask!910 #b00000000000000000000000000000111) (= mask!910 #b00000000000000000000000000001111) (= mask!910 #b00000000000000000000000000011111) (= mask!910 #b00000000000000000000000000111111) (= mask!910 #b00000000000000000000000001111111) (= mask!910 #b00000000000000000000000011111111) (= mask!910 #b00000000000000000000000111111111) (= mask!910 #b00000000000000000000001111111111) (= mask!910 #b00000000000000000000011111111111) (= mask!910 #b00000000000000000000111111111111) (= mask!910 #b00000000000000000001111111111111) (= mask!910 #b00000000000000000011111111111111) (= mask!910 #b00000000000000000111111111111111) (= mask!910 #b00000000000000001111111111111111) (= mask!910 #b00000000000000011111111111111111) (= mask!910 #b00000000000000111111111111111111) (= mask!910 #b00000000000001111111111111111111) (= mask!910 #b00000000000011111111111111111111) (= mask!910 #b00000000000111111111111111111111) (= mask!910 #b00000000001111111111111111111111) (= mask!910 #b00000000011111111111111111111111) (= mask!910 #b00000000111111111111111111111111) (= mask!910 #b00000001111111111111111111111111) (= mask!910 #b00000011111111111111111111111111) (= mask!910 #b00000111111111111111111111111111) (= mask!910 #b00001111111111111111111111111111) (= mask!910 #b00011111111111111111111111111111) (= mask!910 #b00111111111111111111111111111111)) (bvsle mask!910 #b00111111111111111111111111111111)))))

(assert (=> start!136336 d!165829))

(declare-fun d!165837 () Bool)

(assert (=> d!165837 (= (array_inv!39623 _keys!610) (bvsge (size!51446 _keys!610) #b00000000000000000000000000000000))))

(assert (=> start!136336 d!165837))

(push 1)

