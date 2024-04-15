; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134694 () Bool)

(assert start!134694)

(declare-fun res!1073618 () Bool)

(declare-fun e!876106 () Bool)

(assert (=> start!134694 (=> (not res!1073618) (not e!876106))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134694 (= res!1073618 (validMask!0 mask!889))))

(assert (=> start!134694 e!876106))

(assert (=> start!134694 true))

(declare-datatypes ((array!104811 0))(
  ( (array!104812 (arr!50579 (Array (_ BitVec 32) (_ BitVec 64))) (size!51131 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104811)

(declare-fun array_inv!39515 (array!104811) Bool)

(assert (=> start!134694 (array_inv!39515 _keys!600)))

(declare-fun b!1571322 () Bool)

(declare-fun res!1073617 () Bool)

(assert (=> b!1571322 (=> (not res!1073617) (not e!876106))))

(assert (=> b!1571322 (= res!1073617 (= (size!51131 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571323 () Bool)

(declare-fun res!1073619 () Bool)

(assert (=> b!1571323 (=> (not res!1073619) (not e!876106))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571323 (= res!1073619 (validKeyInArray!0 k0!754))))

(declare-fun b!1571324 () Bool)

(assert (=> b!1571324 (= e!876106 false)))

(declare-fun lt!673368 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571324 (= lt!673368 (toIndex!0 k0!754 mask!889))))

(assert (= (and start!134694 res!1073618) b!1571322))

(assert (= (and b!1571322 res!1073617) b!1571323))

(assert (= (and b!1571323 res!1073619) b!1571324))

(declare-fun m!1444635 () Bool)

(assert (=> start!134694 m!1444635))

(declare-fun m!1444637 () Bool)

(assert (=> start!134694 m!1444637))

(declare-fun m!1444639 () Bool)

(assert (=> b!1571323 m!1444639))

(declare-fun m!1444641 () Bool)

(assert (=> b!1571324 m!1444641))

(check-sat (not b!1571324) (not start!134694) (not b!1571323))
(check-sat)
