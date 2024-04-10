; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136366 () Bool)

(assert start!136366)

(declare-fun b!1577163 () Bool)

(declare-fun res!1077428 () Bool)

(declare-fun e!879697 () Bool)

(assert (=> b!1577163 (=> (not res!1077428) (not e!879697))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-datatypes ((array!105557 0))(
  ( (array!105558 (arr!50899 (Array (_ BitVec 32) (_ BitVec 64))) (size!51449 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105557)

(declare-fun mask!910 () (_ BitVec 32))

(assert (=> b!1577163 (= res!1077428 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51449 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun lt!675958 () (_ BitVec 32))

(declare-fun b!1577166 () Bool)

(assert (=> b!1577166 (= e!879697 (and (bvsge lt!675958 #b00000000000000000000000000000000) (bvslt lt!675958 (bvadd #b00000000000000000000000000000001 mask!910)) (bvslt (bvadd #b00000000000000000000000000000001 x!458) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577166 (= lt!675958 (nextIndex!0 ee!12 x!458 mask!910))))

(declare-fun res!1077429 () Bool)

(assert (=> start!136366 (=> (not res!1077429) (not e!879697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136366 (= res!1077429 (validMask!0 mask!910))))

(assert (=> start!136366 e!879697))

(assert (=> start!136366 true))

(declare-fun array_inv!39626 (array!105557) Bool)

(assert (=> start!136366 (array_inv!39626 _keys!610)))

(declare-fun b!1577164 () Bool)

(declare-fun res!1077427 () Bool)

(assert (=> b!1577164 (=> (not res!1077427) (not e!879697))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577164 (= res!1077427 (validKeyInArray!0 k!768))))

(declare-fun b!1577165 () Bool)

(declare-fun res!1077426 () Bool)

(assert (=> b!1577165 (=> (not res!1077426) (not e!879697))))

(assert (=> b!1577165 (= res!1077426 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50899 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50899 _keys!610) ee!12) (select (arr!50899 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136366 res!1077429) b!1577163))

(assert (= (and b!1577163 res!1077428) b!1577164))

(assert (= (and b!1577164 res!1077427) b!1577165))

(assert (= (and b!1577165 res!1077426) b!1577166))

(declare-fun m!1449481 () Bool)

(assert (=> b!1577166 m!1449481))

(declare-fun m!1449483 () Bool)

(assert (=> start!136366 m!1449483))

(declare-fun m!1449485 () Bool)

(assert (=> start!136366 m!1449485))

(declare-fun m!1449487 () Bool)

(assert (=> b!1577164 m!1449487))

(declare-fun m!1449489 () Bool)

(assert (=> b!1577165 m!1449489))

(push 1)

(assert (not b!1577164))

(assert (not start!136366))

(assert (not b!1577166))

(check-sat)

(pop 1)

(push 1)

(check-sat)

