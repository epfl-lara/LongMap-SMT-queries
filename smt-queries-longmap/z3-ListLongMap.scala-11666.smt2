; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136366 () Bool)

(assert start!136366)

(declare-fun res!1077475 () Bool)

(declare-fun e!879607 () Bool)

(assert (=> start!136366 (=> (not res!1077475) (not e!879607))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136366 (= res!1077475 (validMask!0 mask!910))))

(assert (=> start!136366 e!879607))

(assert (=> start!136366 true))

(declare-datatypes ((array!105524 0))(
  ( (array!105525 (arr!50882 (Array (_ BitVec 32) (_ BitVec 64))) (size!51434 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105524)

(declare-fun array_inv!39818 (array!105524) Bool)

(assert (=> start!136366 (array_inv!39818 _keys!610)))

(declare-fun b!1577028 () Bool)

(declare-fun res!1077476 () Bool)

(assert (=> b!1577028 (=> (not res!1077476) (not e!879607))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1577028 (= res!1077476 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51434 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577029 () Bool)

(declare-fun res!1077477 () Bool)

(assert (=> b!1577029 (=> (not res!1077477) (not e!879607))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577029 (= res!1077477 (validKeyInArray!0 k0!768))))

(declare-fun b!1577030 () Bool)

(assert (=> b!1577030 (= e!879607 (and (bvslt x!458 #b01111111111111111111111111111110) (or (= (select (arr!50882 _keys!610) ee!12) k0!768) (= (bvadd (select (arr!50882 _keys!610) ee!12) (select (arr!50882 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50882 _keys!610) ee!12) k0!768)) (not (= (select (arr!50882 _keys!610) ee!12) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50882 _keys!610) ee!12) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136366 res!1077475) b!1577028))

(assert (= (and b!1577028 res!1077476) b!1577029))

(assert (= (and b!1577029 res!1077477) b!1577030))

(declare-fun m!1448739 () Bool)

(assert (=> start!136366 m!1448739))

(declare-fun m!1448741 () Bool)

(assert (=> start!136366 m!1448741))

(declare-fun m!1448743 () Bool)

(assert (=> b!1577029 m!1448743))

(declare-fun m!1448745 () Bool)

(assert (=> b!1577030 m!1448745))

(check-sat (not b!1577029) (not start!136366))
(check-sat)
