; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136360 () Bool)

(assert start!136360)

(declare-fun res!1077449 () Bool)

(declare-fun e!879589 () Bool)

(assert (=> start!136360 (=> (not res!1077449) (not e!879589))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136360 (= res!1077449 (validMask!0 mask!910))))

(assert (=> start!136360 e!879589))

(assert (=> start!136360 true))

(declare-datatypes ((array!105518 0))(
  ( (array!105519 (arr!50879 (Array (_ BitVec 32) (_ BitVec 64))) (size!51431 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105518)

(declare-fun array_inv!39815 (array!105518) Bool)

(assert (=> start!136360 (array_inv!39815 _keys!610)))

(declare-fun b!1577001 () Bool)

(declare-fun res!1077448 () Bool)

(assert (=> b!1577001 (=> (not res!1077448) (not e!879589))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1577001 (= res!1077448 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51431 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577002 () Bool)

(declare-fun res!1077450 () Bool)

(assert (=> b!1577002 (=> (not res!1077450) (not e!879589))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577002 (= res!1077450 (validKeyInArray!0 k0!768))))

(declare-fun b!1577003 () Bool)

(assert (=> b!1577003 (= e!879589 (and (bvslt x!458 #b01111111111111111111111111111110) (or (= (select (arr!50879 _keys!610) ee!12) k0!768) (= (bvadd (select (arr!50879 _keys!610) ee!12) (select (arr!50879 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50879 _keys!610) ee!12) k0!768)) (not (= (select (arr!50879 _keys!610) ee!12) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge ee!12 (size!51431 _keys!610))))))

(assert (= (and start!136360 res!1077449) b!1577001))

(assert (= (and b!1577001 res!1077448) b!1577002))

(assert (= (and b!1577002 res!1077450) b!1577003))

(declare-fun m!1448715 () Bool)

(assert (=> start!136360 m!1448715))

(declare-fun m!1448717 () Bool)

(assert (=> start!136360 m!1448717))

(declare-fun m!1448719 () Bool)

(assert (=> b!1577002 m!1448719))

(declare-fun m!1448721 () Bool)

(assert (=> b!1577003 m!1448721))

(check-sat (not b!1577002) (not start!136360))
(check-sat)
