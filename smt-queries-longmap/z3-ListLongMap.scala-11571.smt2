; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134830 () Bool)

(assert start!134830)

(declare-fun res!1073924 () Bool)

(declare-fun e!876418 () Bool)

(assert (=> start!134830 (=> (not res!1073924) (not e!876418))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134830 (= res!1073924 (validMask!0 mask!889))))

(assert (=> start!134830 e!876418))

(assert (=> start!134830 true))

(declare-datatypes ((array!104927 0))(
  ( (array!104928 (arr!50633 (Array (_ BitVec 32) (_ BitVec 64))) (size!51183 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104927)

(declare-fun array_inv!39360 (array!104927) Bool)

(assert (=> start!134830 (array_inv!39360 _keys!600)))

(declare-fun b!1571806 () Bool)

(declare-fun res!1073923 () Bool)

(assert (=> b!1571806 (=> (not res!1073923) (not e!876418))))

(assert (=> b!1571806 (= res!1073923 (= (size!51183 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571807 () Bool)

(declare-fun res!1073925 () Bool)

(assert (=> b!1571807 (=> (not res!1073925) (not e!876418))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571807 (= res!1073925 (validKeyInArray!0 k0!754))))

(declare-fun b!1571808 () Bool)

(assert (=> b!1571808 (= e!876418 false)))

(declare-datatypes ((SeekEntryResult!13546 0))(
  ( (MissingZero!13546 (index!56582 (_ BitVec 32))) (Found!13546 (index!56583 (_ BitVec 32))) (Intermediate!13546 (undefined!14358 Bool) (index!56584 (_ BitVec 32)) (x!141350 (_ BitVec 32))) (Undefined!13546) (MissingVacant!13546 (index!56585 (_ BitVec 32))) )
))
(declare-fun lt!673747 () SeekEntryResult!13546)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104927 (_ BitVec 32)) SeekEntryResult!13546)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571808 (= lt!673747 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!134830 res!1073924) b!1571806))

(assert (= (and b!1571806 res!1073923) b!1571807))

(assert (= (and b!1571807 res!1073925) b!1571808))

(declare-fun m!1445681 () Bool)

(assert (=> start!134830 m!1445681))

(declare-fun m!1445683 () Bool)

(assert (=> start!134830 m!1445683))

(declare-fun m!1445685 () Bool)

(assert (=> b!1571807 m!1445685))

(declare-fun m!1445687 () Bool)

(assert (=> b!1571808 m!1445687))

(assert (=> b!1571808 m!1445687))

(declare-fun m!1445689 () Bool)

(assert (=> b!1571808 m!1445689))

(check-sat (not start!134830) (not b!1571808) (not b!1571807))
(check-sat)
