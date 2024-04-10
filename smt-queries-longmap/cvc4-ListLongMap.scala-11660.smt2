; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136370 () Bool)

(assert start!136370)

(declare-fun b!1577189 () Bool)

(declare-fun res!1077451 () Bool)

(declare-fun e!879710 () Bool)

(assert (=> b!1577189 (=> (not res!1077451) (not e!879710))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun k!768 () (_ BitVec 64))

(declare-datatypes ((array!105561 0))(
  ( (array!105562 (arr!50901 (Array (_ BitVec 32) (_ BitVec 64))) (size!51451 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105561)

(assert (=> b!1577189 (= res!1077451 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50901 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50901 _keys!610) ee!12) (select (arr!50901 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577187 () Bool)

(declare-fun res!1077452 () Bool)

(assert (=> b!1577187 (=> (not res!1077452) (not e!879710))))

(declare-fun mask!910 () (_ BitVec 32))

(assert (=> b!1577187 (= res!1077452 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51451 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577188 () Bool)

(declare-fun res!1077450 () Bool)

(assert (=> b!1577188 (=> (not res!1077450) (not e!879710))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577188 (= res!1077450 (validKeyInArray!0 k!768))))

(declare-fun res!1077453 () Bool)

(assert (=> start!136370 (=> (not res!1077453) (not e!879710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136370 (= res!1077453 (validMask!0 mask!910))))

(assert (=> start!136370 e!879710))

(assert (=> start!136370 true))

(declare-fun array_inv!39628 (array!105561) Bool)

(assert (=> start!136370 (array_inv!39628 _keys!610)))

(declare-fun b!1577190 () Bool)

(declare-fun lt!675964 () (_ BitVec 32))

(assert (=> b!1577190 (= e!879710 (and (bvsge lt!675964 #b00000000000000000000000000000000) (bvslt lt!675964 (bvadd #b00000000000000000000000000000001 mask!910)) (bvslt (bvadd #b00000000000000000000000000000001 x!458) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577190 (= lt!675964 (nextIndex!0 ee!12 x!458 mask!910))))

(assert (= (and start!136370 res!1077453) b!1577187))

(assert (= (and b!1577187 res!1077452) b!1577188))

(assert (= (and b!1577188 res!1077450) b!1577189))

(assert (= (and b!1577189 res!1077451) b!1577190))

(declare-fun m!1449501 () Bool)

(assert (=> b!1577189 m!1449501))

(declare-fun m!1449503 () Bool)

(assert (=> b!1577188 m!1449503))

(declare-fun m!1449505 () Bool)

(assert (=> start!136370 m!1449505))

(declare-fun m!1449507 () Bool)

(assert (=> start!136370 m!1449507))

(declare-fun m!1449509 () Bool)

(assert (=> b!1577190 m!1449509))

(push 1)

(assert (not start!136370))

(assert (not b!1577190))

(assert (not b!1577188))

(check-sat)

(pop 1)

(push 1)

(check-sat)

