; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136398 () Bool)

(assert start!136398)

(declare-fun res!1077586 () Bool)

(declare-fun e!879794 () Bool)

(assert (=> start!136398 (=> (not res!1077586) (not e!879794))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136398 (= res!1077586 (validMask!0 mask!910))))

(assert (=> start!136398 e!879794))

(assert (=> start!136398 true))

(declare-datatypes ((array!105589 0))(
  ( (array!105590 (arr!50915 (Array (_ BitVec 32) (_ BitVec 64))) (size!51465 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105589)

(declare-fun array_inv!39642 (array!105589) Bool)

(assert (=> start!136398 (array_inv!39642 _keys!610)))

(declare-fun b!1577323 () Bool)

(declare-fun res!1077588 () Bool)

(assert (=> b!1577323 (=> (not res!1077588) (not e!879794))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1577323 (= res!1077588 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51465 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577324 () Bool)

(declare-fun res!1077587 () Bool)

(assert (=> b!1577324 (=> (not res!1077587) (not e!879794))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577324 (= res!1077587 (validKeyInArray!0 k0!768))))

(declare-fun b!1577325 () Bool)

(assert (=> b!1577325 (= e!879794 (and (bvslt x!458 #b01111111111111111111111111111110) (or (= (select (arr!50915 _keys!610) ee!12) k0!768) (= (bvadd (select (arr!50915 _keys!610) ee!12) (select (arr!50915 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50915 _keys!610) ee!12) k0!768)) (not (= (select (arr!50915 _keys!610) ee!12) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge ee!12 (size!51465 _keys!610))))))

(assert (= (and start!136398 res!1077586) b!1577323))

(assert (= (and b!1577323 res!1077588) b!1577324))

(assert (= (and b!1577324 res!1077587) b!1577325))

(declare-fun m!1449615 () Bool)

(assert (=> start!136398 m!1449615))

(declare-fun m!1449617 () Bool)

(assert (=> start!136398 m!1449617))

(declare-fun m!1449619 () Bool)

(assert (=> b!1577324 m!1449619))

(declare-fun m!1449621 () Bool)

(assert (=> b!1577325 m!1449621))

(check-sat (not start!136398) (not b!1577324))
(check-sat)
