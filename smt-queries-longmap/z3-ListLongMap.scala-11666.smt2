; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136404 () Bool)

(assert start!136404)

(declare-fun res!1077614 () Bool)

(declare-fun e!879812 () Bool)

(assert (=> start!136404 (=> (not res!1077614) (not e!879812))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136404 (= res!1077614 (validMask!0 mask!910))))

(assert (=> start!136404 e!879812))

(assert (=> start!136404 true))

(declare-datatypes ((array!105595 0))(
  ( (array!105596 (arr!50918 (Array (_ BitVec 32) (_ BitVec 64))) (size!51468 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105595)

(declare-fun array_inv!39645 (array!105595) Bool)

(assert (=> start!136404 (array_inv!39645 _keys!610)))

(declare-fun b!1577350 () Bool)

(declare-fun res!1077615 () Bool)

(assert (=> b!1577350 (=> (not res!1077615) (not e!879812))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1577350 (= res!1077615 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51468 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577351 () Bool)

(declare-fun res!1077613 () Bool)

(assert (=> b!1577351 (=> (not res!1077613) (not e!879812))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577351 (= res!1077613 (validKeyInArray!0 k0!768))))

(declare-fun b!1577352 () Bool)

(assert (=> b!1577352 (= e!879812 (and (bvslt x!458 #b01111111111111111111111111111110) (or (= (select (arr!50918 _keys!610) ee!12) k0!768) (= (bvadd (select (arr!50918 _keys!610) ee!12) (select (arr!50918 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50918 _keys!610) ee!12) k0!768)) (not (= (select (arr!50918 _keys!610) ee!12) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50918 _keys!610) ee!12) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136404 res!1077614) b!1577350))

(assert (= (and b!1577350 res!1077615) b!1577351))

(assert (= (and b!1577351 res!1077613) b!1577352))

(declare-fun m!1449639 () Bool)

(assert (=> start!136404 m!1449639))

(declare-fun m!1449641 () Bool)

(assert (=> start!136404 m!1449641))

(declare-fun m!1449643 () Bool)

(assert (=> b!1577351 m!1449643))

(declare-fun m!1449645 () Bool)

(assert (=> b!1577352 m!1449645))

(check-sat (not b!1577351) (not start!136404))
(check-sat)