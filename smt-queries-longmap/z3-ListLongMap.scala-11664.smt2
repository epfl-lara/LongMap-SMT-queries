; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136392 () Bool)

(assert start!136392)

(declare-fun res!1077561 () Bool)

(declare-fun e!879776 () Bool)

(assert (=> start!136392 (=> (not res!1077561) (not e!879776))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136392 (= res!1077561 (validMask!0 mask!910))))

(assert (=> start!136392 e!879776))

(assert (=> start!136392 true))

(declare-datatypes ((array!105583 0))(
  ( (array!105584 (arr!50912 (Array (_ BitVec 32) (_ BitVec 64))) (size!51462 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105583)

(declare-fun array_inv!39639 (array!105583) Bool)

(assert (=> start!136392 (array_inv!39639 _keys!610)))

(declare-fun b!1577296 () Bool)

(declare-fun res!1077559 () Bool)

(assert (=> b!1577296 (=> (not res!1077559) (not e!879776))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1577296 (= res!1077559 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51462 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577297 () Bool)

(declare-fun res!1077560 () Bool)

(assert (=> b!1577297 (=> (not res!1077560) (not e!879776))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577297 (= res!1077560 (validKeyInArray!0 k0!768))))

(declare-fun b!1577298 () Bool)

(assert (=> b!1577298 (= e!879776 (and (bvslt x!458 #b01111111111111111111111111111110) (or (= (select (arr!50912 _keys!610) ee!12) k0!768) (= (bvadd (select (arr!50912 _keys!610) ee!12) (select (arr!50912 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50912 _keys!610) ee!12) k0!768)) (bvsge ee!12 (size!51462 _keys!610))))))

(assert (= (and start!136392 res!1077561) b!1577296))

(assert (= (and b!1577296 res!1077559) b!1577297))

(assert (= (and b!1577297 res!1077560) b!1577298))

(declare-fun m!1449591 () Bool)

(assert (=> start!136392 m!1449591))

(declare-fun m!1449593 () Bool)

(assert (=> start!136392 m!1449593))

(declare-fun m!1449595 () Bool)

(assert (=> b!1577297 m!1449595))

(declare-fun m!1449597 () Bool)

(assert (=> b!1577298 m!1449597))

(check-sat (not b!1577297) (not start!136392))
(check-sat)
