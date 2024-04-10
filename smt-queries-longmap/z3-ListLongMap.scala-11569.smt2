; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134818 () Bool)

(assert start!134818)

(declare-fun res!1073871 () Bool)

(declare-fun e!876382 () Bool)

(assert (=> start!134818 (=> (not res!1073871) (not e!876382))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134818 (= res!1073871 (validMask!0 mask!889))))

(assert (=> start!134818 e!876382))

(assert (=> start!134818 true))

(declare-datatypes ((array!104915 0))(
  ( (array!104916 (arr!50627 (Array (_ BitVec 32) (_ BitVec 64))) (size!51177 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104915)

(declare-fun array_inv!39354 (array!104915) Bool)

(assert (=> start!134818 (array_inv!39354 _keys!600)))

(declare-fun b!1571752 () Bool)

(declare-fun res!1073870 () Bool)

(assert (=> b!1571752 (=> (not res!1073870) (not e!876382))))

(assert (=> b!1571752 (= res!1073870 (= (size!51177 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571753 () Bool)

(declare-fun res!1073869 () Bool)

(assert (=> b!1571753 (=> (not res!1073869) (not e!876382))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571753 (= res!1073869 (validKeyInArray!0 k0!754))))

(declare-fun b!1571754 () Bool)

(assert (=> b!1571754 (= e!876382 false)))

(declare-fun lt!673729 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571754 (= lt!673729 (toIndex!0 k0!754 mask!889))))

(assert (= (and start!134818 res!1073871) b!1571752))

(assert (= (and b!1571752 res!1073870) b!1571753))

(assert (= (and b!1571753 res!1073869) b!1571754))

(declare-fun m!1445631 () Bool)

(assert (=> start!134818 m!1445631))

(declare-fun m!1445633 () Bool)

(assert (=> start!134818 m!1445633))

(declare-fun m!1445635 () Bool)

(assert (=> b!1571753 m!1445635))

(declare-fun m!1445637 () Bool)

(assert (=> b!1571754 m!1445637))

(check-sat (not start!134818) (not b!1571754) (not b!1571753))
