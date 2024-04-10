; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134824 () Bool)

(assert start!134824)

(declare-fun res!1073896 () Bool)

(declare-fun e!876401 () Bool)

(assert (=> start!134824 (=> (not res!1073896) (not e!876401))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134824 (= res!1073896 (validMask!0 mask!889))))

(assert (=> start!134824 e!876401))

(assert (=> start!134824 true))

(declare-datatypes ((array!104921 0))(
  ( (array!104922 (arr!50630 (Array (_ BitVec 32) (_ BitVec 64))) (size!51180 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104921)

(declare-fun array_inv!39357 (array!104921) Bool)

(assert (=> start!134824 (array_inv!39357 _keys!600)))

(declare-fun b!1571779 () Bool)

(declare-fun res!1073897 () Bool)

(assert (=> b!1571779 (=> (not res!1073897) (not e!876401))))

(assert (=> b!1571779 (= res!1073897 (= (size!51180 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571780 () Bool)

(declare-fun res!1073898 () Bool)

(assert (=> b!1571780 (=> (not res!1073898) (not e!876401))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571780 (= res!1073898 (validKeyInArray!0 k0!754))))

(declare-fun b!1571781 () Bool)

(assert (=> b!1571781 (= e!876401 false)))

(declare-fun lt!673738 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571781 (= lt!673738 (toIndex!0 k0!754 mask!889))))

(assert (= (and start!134824 res!1073896) b!1571779))

(assert (= (and b!1571779 res!1073897) b!1571780))

(assert (= (and b!1571780 res!1073898) b!1571781))

(declare-fun m!1445655 () Bool)

(assert (=> start!134824 m!1445655))

(declare-fun m!1445657 () Bool)

(assert (=> start!134824 m!1445657))

(declare-fun m!1445659 () Bool)

(assert (=> b!1571780 m!1445659))

(declare-fun m!1445661 () Bool)

(assert (=> b!1571781 m!1445661))

(check-sat (not b!1571780) (not b!1571781) (not start!134824))
(check-sat)
