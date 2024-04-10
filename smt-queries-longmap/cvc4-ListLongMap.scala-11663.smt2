; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136388 () Bool)

(assert start!136388)

(declare-fun res!1077542 () Bool)

(declare-fun e!879763 () Bool)

(assert (=> start!136388 (=> (not res!1077542) (not e!879763))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136388 (= res!1077542 (validMask!0 mask!910))))

(assert (=> start!136388 e!879763))

(assert (=> start!136388 true))

(declare-datatypes ((array!105579 0))(
  ( (array!105580 (arr!50910 (Array (_ BitVec 32) (_ BitVec 64))) (size!51460 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105579)

(declare-fun array_inv!39637 (array!105579) Bool)

(assert (=> start!136388 (array_inv!39637 _keys!610)))

(declare-fun b!1577278 () Bool)

(declare-fun res!1077541 () Bool)

(assert (=> b!1577278 (=> (not res!1077541) (not e!879763))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1577278 (= res!1077541 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51460 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577279 () Bool)

(declare-fun res!1077543 () Bool)

(assert (=> b!1577279 (=> (not res!1077543) (not e!879763))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577279 (= res!1077543 (validKeyInArray!0 k!768))))

(declare-fun b!1577280 () Bool)

(assert (=> b!1577280 (= e!879763 (and (bvslt x!458 #b01111111111111111111111111111110) (or (= (select (arr!50910 _keys!610) ee!12) k!768) (= (bvadd (select (arr!50910 _keys!610) ee!12) (select (arr!50910 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge ee!12 (size!51460 _keys!610))))))

(assert (= (and start!136388 res!1077542) b!1577278))

(assert (= (and b!1577278 res!1077541) b!1577279))

(assert (= (and b!1577279 res!1077543) b!1577280))

(declare-fun m!1449575 () Bool)

(assert (=> start!136388 m!1449575))

(declare-fun m!1449577 () Bool)

(assert (=> start!136388 m!1449577))

(declare-fun m!1449579 () Bool)

(assert (=> b!1577279 m!1449579))

(declare-fun m!1449581 () Bool)

(assert (=> b!1577280 m!1449581))

(push 1)

(assert (not b!1577279))

(assert (not start!136388))

(check-sat)

(pop 1)

(push 1)

(check-sat)

