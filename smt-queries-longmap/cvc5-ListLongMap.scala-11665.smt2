; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136396 () Bool)

(assert start!136396)

(declare-fun res!1077579 () Bool)

(declare-fun e!879788 () Bool)

(assert (=> start!136396 (=> (not res!1077579) (not e!879788))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136396 (= res!1077579 (validMask!0 mask!910))))

(assert (=> start!136396 e!879788))

(assert (=> start!136396 true))

(declare-datatypes ((array!105587 0))(
  ( (array!105588 (arr!50914 (Array (_ BitVec 32) (_ BitVec 64))) (size!51464 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105587)

(declare-fun array_inv!39641 (array!105587) Bool)

(assert (=> start!136396 (array_inv!39641 _keys!610)))

(declare-fun b!1577314 () Bool)

(declare-fun res!1077578 () Bool)

(assert (=> b!1577314 (=> (not res!1077578) (not e!879788))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1577314 (= res!1077578 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51464 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577315 () Bool)

(declare-fun res!1077577 () Bool)

(assert (=> b!1577315 (=> (not res!1077577) (not e!879788))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577315 (= res!1077577 (validKeyInArray!0 k!768))))

(declare-fun b!1577316 () Bool)

(assert (=> b!1577316 (= e!879788 (and (bvslt x!458 #b01111111111111111111111111111110) (or (= (select (arr!50914 _keys!610) ee!12) k!768) (= (bvadd (select (arr!50914 _keys!610) ee!12) (select (arr!50914 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50914 _keys!610) ee!12) k!768)) (not (= (select (arr!50914 _keys!610) ee!12) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge ee!12 (size!51464 _keys!610))))))

(assert (= (and start!136396 res!1077579) b!1577314))

(assert (= (and b!1577314 res!1077578) b!1577315))

(assert (= (and b!1577315 res!1077577) b!1577316))

(declare-fun m!1449607 () Bool)

(assert (=> start!136396 m!1449607))

(declare-fun m!1449609 () Bool)

(assert (=> start!136396 m!1449609))

(declare-fun m!1449611 () Bool)

(assert (=> b!1577315 m!1449611))

(declare-fun m!1449613 () Bool)

(assert (=> b!1577316 m!1449613))

(push 1)

(assert (not b!1577315))

(assert (not start!136396))

(check-sat)

(pop 1)

(push 1)

(check-sat)

