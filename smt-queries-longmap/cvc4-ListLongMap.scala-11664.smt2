; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136394 () Bool)

(assert start!136394)

(declare-fun res!1077569 () Bool)

(declare-fun e!879781 () Bool)

(assert (=> start!136394 (=> (not res!1077569) (not e!879781))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136394 (= res!1077569 (validMask!0 mask!910))))

(assert (=> start!136394 e!879781))

(assert (=> start!136394 true))

(declare-datatypes ((array!105585 0))(
  ( (array!105586 (arr!50913 (Array (_ BitVec 32) (_ BitVec 64))) (size!51463 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105585)

(declare-fun array_inv!39640 (array!105585) Bool)

(assert (=> start!136394 (array_inv!39640 _keys!610)))

(declare-fun b!1577305 () Bool)

(declare-fun res!1077568 () Bool)

(assert (=> b!1577305 (=> (not res!1077568) (not e!879781))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1577305 (= res!1077568 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51463 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577306 () Bool)

(declare-fun res!1077570 () Bool)

(assert (=> b!1577306 (=> (not res!1077570) (not e!879781))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577306 (= res!1077570 (validKeyInArray!0 k!768))))

(declare-fun b!1577307 () Bool)

(assert (=> b!1577307 (= e!879781 (and (bvslt x!458 #b01111111111111111111111111111110) (or (= (select (arr!50913 _keys!610) ee!12) k!768) (= (bvadd (select (arr!50913 _keys!610) ee!12) (select (arr!50913 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50913 _keys!610) ee!12) k!768)) (bvsge ee!12 (size!51463 _keys!610))))))

(assert (= (and start!136394 res!1077569) b!1577305))

(assert (= (and b!1577305 res!1077568) b!1577306))

(assert (= (and b!1577306 res!1077570) b!1577307))

(declare-fun m!1449599 () Bool)

(assert (=> start!136394 m!1449599))

(declare-fun m!1449601 () Bool)

(assert (=> start!136394 m!1449601))

(declare-fun m!1449603 () Bool)

(assert (=> b!1577306 m!1449603))

(declare-fun m!1449605 () Bool)

(assert (=> b!1577307 m!1449605))

(push 1)

(assert (not b!1577306))

(assert (not start!136394))

(check-sat)

(pop 1)

(push 1)

(check-sat)

