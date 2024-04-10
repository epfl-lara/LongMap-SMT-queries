; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136408 () Bool)

(assert start!136408)

(declare-fun b!1577370 () Bool)

(declare-fun res!1077634 () Bool)

(declare-fun e!879824 () Bool)

(assert (=> b!1577370 (=> (not res!1077634) (not e!879824))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-datatypes ((array!105599 0))(
  ( (array!105600 (arr!50920 (Array (_ BitVec 32) (_ BitVec 64))) (size!51470 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105599)

(declare-fun mask!910 () (_ BitVec 32))

(assert (=> b!1577370 (= res!1077634 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51470 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577371 () Bool)

(declare-fun res!1077635 () Bool)

(assert (=> b!1577371 (=> (not res!1077635) (not e!879824))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577371 (= res!1077635 (validKeyInArray!0 k!768))))

(declare-fun b!1577372 () Bool)

(declare-fun res!1077633 () Bool)

(assert (=> b!1577372 (=> (not res!1077633) (not e!879824))))

(assert (=> b!1577372 (= res!1077633 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50920 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50920 _keys!610) ee!12) (select (arr!50920 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577373 () Bool)

(assert (=> b!1577373 (= e!879824 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!458)) (bvsub #b01111111111111111111111111111110 x!458)))))

(declare-fun lt!675976 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577373 (= lt!675976 (nextIndex!0 ee!12 x!458 mask!910))))

(declare-fun res!1077636 () Bool)

(assert (=> start!136408 (=> (not res!1077636) (not e!879824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136408 (= res!1077636 (validMask!0 mask!910))))

(assert (=> start!136408 e!879824))

(assert (=> start!136408 true))

(declare-fun array_inv!39647 (array!105599) Bool)

(assert (=> start!136408 (array_inv!39647 _keys!610)))

(assert (= (and start!136408 res!1077636) b!1577370))

(assert (= (and b!1577370 res!1077634) b!1577371))

(assert (= (and b!1577371 res!1077635) b!1577372))

(assert (= (and b!1577372 res!1077633) b!1577373))

(declare-fun m!1449655 () Bool)

(assert (=> b!1577371 m!1449655))

(declare-fun m!1449657 () Bool)

(assert (=> b!1577372 m!1449657))

(declare-fun m!1449659 () Bool)

(assert (=> b!1577373 m!1449659))

(declare-fun m!1449661 () Bool)

(assert (=> start!136408 m!1449661))

(declare-fun m!1449663 () Bool)

(assert (=> start!136408 m!1449663))

(push 1)

(assert (not b!1577373))

(assert (not start!136408))

(assert (not b!1577371))

(check-sat)

(pop 1)

(push 1)

(check-sat)

