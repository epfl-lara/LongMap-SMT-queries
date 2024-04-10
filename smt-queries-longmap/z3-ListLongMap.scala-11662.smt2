; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136380 () Bool)

(assert start!136380)

(declare-fun res!1077507 () Bool)

(declare-fun e!879740 () Bool)

(assert (=> start!136380 (=> (not res!1077507) (not e!879740))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136380 (= res!1077507 (validMask!0 mask!910))))

(assert (=> start!136380 e!879740))

(assert (=> start!136380 true))

(declare-datatypes ((array!105571 0))(
  ( (array!105572 (arr!50906 (Array (_ BitVec 32) (_ BitVec 64))) (size!51456 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105571)

(declare-fun array_inv!39633 (array!105571) Bool)

(assert (=> start!136380 (array_inv!39633 _keys!610)))

(declare-fun b!1577242 () Bool)

(declare-fun res!1077505 () Bool)

(assert (=> b!1577242 (=> (not res!1077505) (not e!879740))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1577242 (= res!1077505 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51456 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577243 () Bool)

(declare-fun res!1077506 () Bool)

(assert (=> b!1577243 (=> (not res!1077506) (not e!879740))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577243 (= res!1077506 (validKeyInArray!0 k0!768))))

(declare-fun b!1577244 () Bool)

(assert (=> b!1577244 (= e!879740 (bvsge ee!12 (size!51456 _keys!610)))))

(assert (= (and start!136380 res!1077507) b!1577242))

(assert (= (and b!1577242 res!1077505) b!1577243))

(assert (= (and b!1577243 res!1077506) b!1577244))

(declare-fun m!1449547 () Bool)

(assert (=> start!136380 m!1449547))

(declare-fun m!1449549 () Bool)

(assert (=> start!136380 m!1449549))

(declare-fun m!1449551 () Bool)

(assert (=> b!1577243 m!1449551))

(check-sat (not b!1577243) (not start!136380))
(check-sat)
