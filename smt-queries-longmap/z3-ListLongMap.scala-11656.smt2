; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136744 () Bool)

(assert start!136744)

(declare-fun res!1078141 () Bool)

(declare-fun e!881135 () Bool)

(assert (=> start!136744 (=> (not res!1078141) (not e!881135))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136744 (= res!1078141 (validMask!0 mask!910))))

(assert (=> start!136744 e!881135))

(assert (=> start!136744 true))

(declare-datatypes ((array!105656 0))(
  ( (array!105657 (arr!50941 (Array (_ BitVec 32) (_ BitVec 64))) (size!51492 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105656)

(declare-fun array_inv!39896 (array!105656) Bool)

(assert (=> start!136744 (array_inv!39896 _keys!610)))

(declare-fun b!1579453 () Bool)

(declare-fun res!1078140 () Bool)

(assert (=> b!1579453 (=> (not res!1078140) (not e!881135))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1579453 (= res!1078140 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51492 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1579454 () Bool)

(declare-fun res!1078142 () Bool)

(assert (=> b!1579454 (=> (not res!1078142) (not e!881135))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1579454 (= res!1078142 (validKeyInArray!0 k0!768))))

(declare-fun b!1579455 () Bool)

(assert (=> b!1579455 (= e!881135 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50941 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50941 _keys!610) ee!12) (select (arr!50941 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 x!458) #b00000000000000000000000000000000)))))

(assert (= (and start!136744 res!1078141) b!1579453))

(assert (= (and b!1579453 res!1078140) b!1579454))

(assert (= (and b!1579454 res!1078142) b!1579455))

(declare-fun m!1451613 () Bool)

(assert (=> start!136744 m!1451613))

(declare-fun m!1451615 () Bool)

(assert (=> start!136744 m!1451615))

(declare-fun m!1451617 () Bool)

(assert (=> b!1579454 m!1451617))

(declare-fun m!1451619 () Bool)

(assert (=> b!1579455 m!1451619))

(check-sat (not b!1579454) (not start!136744))
(check-sat)
