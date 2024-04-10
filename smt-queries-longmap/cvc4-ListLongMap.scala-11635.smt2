; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135784 () Bool)

(assert start!135784)

(declare-fun res!1076270 () Bool)

(declare-fun e!878495 () Bool)

(assert (=> start!135784 (=> (not res!1076270) (not e!878495))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135784 (= res!1076270 (validMask!0 mask!898))))

(assert (=> start!135784 e!878495))

(assert (=> start!135784 true))

(declare-datatypes ((array!105370 0))(
  ( (array!105371 (arr!50826 (Array (_ BitVec 32) (_ BitVec 64))) (size!51376 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105370)

(declare-fun array_inv!39553 (array!105370) Bool)

(assert (=> start!135784 (array_inv!39553 _keys!605)))

(declare-fun b!1575127 () Bool)

(declare-fun res!1076271 () Bool)

(assert (=> b!1575127 (=> (not res!1076271) (not e!878495))))

(assert (=> b!1575127 (= res!1076271 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51376 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575128 () Bool)

(declare-fun res!1076269 () Bool)

(assert (=> b!1575128 (=> (not res!1076269) (not e!878495))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575128 (= res!1076269 (validKeyInArray!0 k!761))))

(declare-fun b!1575129 () Bool)

(assert (=> b!1575129 (= e!878495 false)))

(declare-datatypes ((SeekEntryResult!13691 0))(
  ( (MissingZero!13691 (index!57162 (_ BitVec 32))) (Found!13691 (index!57163 (_ BitVec 32))) (Intermediate!13691 (undefined!14503 Bool) (index!57164 (_ BitVec 32)) (x!142115 (_ BitVec 32))) (Undefined!13691) (MissingVacant!13691 (index!57165 (_ BitVec 32))) )
))
(declare-fun lt!675073 () SeekEntryResult!13691)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105370 (_ BitVec 32)) SeekEntryResult!13691)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575129 (= lt!675073 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135784 res!1076270) b!1575127))

(assert (= (and b!1575127 res!1076271) b!1575128))

(assert (= (and b!1575128 res!1076269) b!1575129))

(declare-fun m!1448235 () Bool)

(assert (=> start!135784 m!1448235))

(declare-fun m!1448237 () Bool)

(assert (=> start!135784 m!1448237))

(declare-fun m!1448239 () Bool)

(assert (=> b!1575128 m!1448239))

(declare-fun m!1448241 () Bool)

(assert (=> b!1575129 m!1448241))

(assert (=> b!1575129 m!1448241))

(declare-fun m!1448243 () Bool)

(assert (=> b!1575129 m!1448243))

(push 1)

(assert (not start!135784))

(assert (not b!1575128))

(assert (not b!1575129))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

