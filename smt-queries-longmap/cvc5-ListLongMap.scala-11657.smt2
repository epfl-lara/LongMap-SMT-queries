; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136324 () Bool)

(assert start!136324)

(declare-fun b!1577055 () Bool)

(declare-fun res!1077318 () Bool)

(declare-fun e!879644 () Bool)

(assert (=> b!1577055 (=> (not res!1077318) (not e!879644))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun mask!910 () (_ BitVec 32))

(declare-datatypes ((array!105536 0))(
  ( (array!105537 (arr!50890 (Array (_ BitVec 32) (_ BitVec 64))) (size!51440 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105536)

(assert (=> b!1577055 (= res!1077318 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51440 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577057 () Bool)

(declare-fun res!1077321 () Bool)

(assert (=> b!1577057 (=> (not res!1077321) (not e!879644))))

(declare-fun k!768 () (_ BitVec 64))

(assert (=> b!1577057 (= res!1077321 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50890 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50890 _keys!610) ee!12) (select (arr!50890 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577056 () Bool)

(declare-fun res!1077320 () Bool)

(assert (=> b!1577056 (=> (not res!1077320) (not e!879644))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577056 (= res!1077320 (validKeyInArray!0 k!768))))

(declare-fun res!1077319 () Bool)

(assert (=> start!136324 (=> (not res!1077319) (not e!879644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136324 (= res!1077319 (validMask!0 mask!910))))

(assert (=> start!136324 e!879644))

(assert (=> start!136324 true))

(declare-fun array_inv!39617 (array!105536) Bool)

(assert (=> start!136324 (array_inv!39617 _keys!610)))

(declare-fun b!1577058 () Bool)

(assert (=> b!1577058 (= e!879644 false)))

(declare-fun lt!675922 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577058 (= lt!675922 (nextIndex!0 ee!12 x!458 mask!910))))

(assert (= (and start!136324 res!1077319) b!1577055))

(assert (= (and b!1577055 res!1077318) b!1577056))

(assert (= (and b!1577056 res!1077320) b!1577057))

(assert (= (and b!1577057 res!1077321) b!1577058))

(declare-fun m!1449385 () Bool)

(assert (=> b!1577057 m!1449385))

(declare-fun m!1449387 () Bool)

(assert (=> b!1577056 m!1449387))

(declare-fun m!1449389 () Bool)

(assert (=> start!136324 m!1449389))

(declare-fun m!1449391 () Bool)

(assert (=> start!136324 m!1449391))

(declare-fun m!1449393 () Bool)

(assert (=> b!1577058 m!1449393))

(push 1)

(assert (not b!1577058))

(assert (not start!136324))

(assert (not b!1577056))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

