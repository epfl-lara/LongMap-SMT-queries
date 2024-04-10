; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136386 () Bool)

(assert start!136386)

(declare-fun res!1077534 () Bool)

(declare-fun e!879757 () Bool)

(assert (=> start!136386 (=> (not res!1077534) (not e!879757))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136386 (= res!1077534 (validMask!0 mask!910))))

(assert (=> start!136386 e!879757))

(assert (=> start!136386 true))

(declare-datatypes ((array!105577 0))(
  ( (array!105578 (arr!50909 (Array (_ BitVec 32) (_ BitVec 64))) (size!51459 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105577)

(declare-fun array_inv!39636 (array!105577) Bool)

(assert (=> start!136386 (array_inv!39636 _keys!610)))

(declare-fun b!1577269 () Bool)

(declare-fun res!1077532 () Bool)

(assert (=> b!1577269 (=> (not res!1077532) (not e!879757))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1577269 (= res!1077532 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51459 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577270 () Bool)

(declare-fun res!1077533 () Bool)

(assert (=> b!1577270 (=> (not res!1077533) (not e!879757))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577270 (= res!1077533 (validKeyInArray!0 k0!768))))

(declare-fun b!1577271 () Bool)

(assert (=> b!1577271 (= e!879757 (and (bvslt x!458 #b01111111111111111111111111111110) (or (= (select (arr!50909 _keys!610) ee!12) k0!768) (= (bvadd (select (arr!50909 _keys!610) ee!12) (select (arr!50909 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge ee!12 (size!51459 _keys!610))))))

(assert (= (and start!136386 res!1077534) b!1577269))

(assert (= (and b!1577269 res!1077532) b!1577270))

(assert (= (and b!1577270 res!1077533) b!1577271))

(declare-fun m!1449567 () Bool)

(assert (=> start!136386 m!1449567))

(declare-fun m!1449569 () Bool)

(assert (=> start!136386 m!1449569))

(declare-fun m!1449571 () Bool)

(assert (=> b!1577270 m!1449571))

(declare-fun m!1449573 () Bool)

(assert (=> b!1577271 m!1449573))

(check-sat (not b!1577270) (not start!136386))
(check-sat)
