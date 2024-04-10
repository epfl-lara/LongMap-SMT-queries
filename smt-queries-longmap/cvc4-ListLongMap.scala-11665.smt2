; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136400 () Bool)

(assert start!136400)

(declare-fun res!1077597 () Bool)

(declare-fun e!879799 () Bool)

(assert (=> start!136400 (=> (not res!1077597) (not e!879799))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136400 (= res!1077597 (validMask!0 mask!910))))

(assert (=> start!136400 e!879799))

(assert (=> start!136400 true))

(declare-datatypes ((array!105591 0))(
  ( (array!105592 (arr!50916 (Array (_ BitVec 32) (_ BitVec 64))) (size!51466 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105591)

(declare-fun array_inv!39643 (array!105591) Bool)

(assert (=> start!136400 (array_inv!39643 _keys!610)))

(declare-fun b!1577332 () Bool)

(declare-fun res!1077596 () Bool)

(assert (=> b!1577332 (=> (not res!1077596) (not e!879799))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1577332 (= res!1077596 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51466 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577333 () Bool)

(declare-fun res!1077595 () Bool)

(assert (=> b!1577333 (=> (not res!1077595) (not e!879799))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577333 (= res!1077595 (validKeyInArray!0 k!768))))

(declare-fun b!1577334 () Bool)

(assert (=> b!1577334 (= e!879799 (and (bvslt x!458 #b01111111111111111111111111111110) (or (= (select (arr!50916 _keys!610) ee!12) k!768) (= (bvadd (select (arr!50916 _keys!610) ee!12) (select (arr!50916 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50916 _keys!610) ee!12) k!768)) (not (= (select (arr!50916 _keys!610) ee!12) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge ee!12 (size!51466 _keys!610))))))

(assert (= (and start!136400 res!1077597) b!1577332))

(assert (= (and b!1577332 res!1077596) b!1577333))

(assert (= (and b!1577333 res!1077595) b!1577334))

(declare-fun m!1449623 () Bool)

(assert (=> start!136400 m!1449623))

(declare-fun m!1449625 () Bool)

(assert (=> start!136400 m!1449625))

(declare-fun m!1449627 () Bool)

(assert (=> b!1577333 m!1449627))

(declare-fun m!1449629 () Bool)

(assert (=> b!1577334 m!1449629))

(push 1)

(assert (not b!1577333))

(assert (not start!136400))

(check-sat)

(pop 1)

(push 1)

(check-sat)

