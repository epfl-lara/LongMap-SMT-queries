; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134836 () Bool)

(assert start!134836)

(declare-fun res!1073951 () Bool)

(declare-fun e!876436 () Bool)

(assert (=> start!134836 (=> (not res!1073951) (not e!876436))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134836 (= res!1073951 (validMask!0 mask!889))))

(assert (=> start!134836 e!876436))

(assert (=> start!134836 true))

(declare-datatypes ((array!104933 0))(
  ( (array!104934 (arr!50636 (Array (_ BitVec 32) (_ BitVec 64))) (size!51186 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104933)

(declare-fun array_inv!39363 (array!104933) Bool)

(assert (=> start!134836 (array_inv!39363 _keys!600)))

(declare-fun b!1571833 () Bool)

(declare-fun res!1073952 () Bool)

(assert (=> b!1571833 (=> (not res!1073952) (not e!876436))))

(assert (=> b!1571833 (= res!1073952 (= (size!51186 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571834 () Bool)

(declare-fun res!1073950 () Bool)

(assert (=> b!1571834 (=> (not res!1073950) (not e!876436))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571834 (= res!1073950 (validKeyInArray!0 k0!754))))

(declare-datatypes ((SeekEntryResult!13549 0))(
  ( (MissingZero!13549 (index!56594 (_ BitVec 32))) (Found!13549 (index!56595 (_ BitVec 32))) (Intermediate!13549 (undefined!14361 Bool) (index!56596 (_ BitVec 32)) (x!141361 (_ BitVec 32))) (Undefined!13549) (MissingVacant!13549 (index!56597 (_ BitVec 32))) )
))
(declare-fun lt!673756 () SeekEntryResult!13549)

(declare-fun b!1571835 () Bool)

(get-info :version)

(assert (=> b!1571835 (= e!876436 (and ((_ is Intermediate!13549) lt!673756) (not (undefined!14361 lt!673756)) (not (= (select (arr!50636 _keys!600) (index!56596 lt!673756)) k0!754)) (not (= (select (arr!50636 _keys!600) (index!56596 lt!673756)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50636 _keys!600) (index!56596 lt!673756)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56596 lt!673756) #b00000000000000000000000000000000) (bvslt (index!56596 lt!673756) (bvadd #b00000000000000000000000000000001 mask!889)) (bvslt mask!889 #b00000000000000000000000000000000)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104933 (_ BitVec 32)) SeekEntryResult!13549)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571835 (= lt!673756 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!134836 res!1073951) b!1571833))

(assert (= (and b!1571833 res!1073952) b!1571834))

(assert (= (and b!1571834 res!1073950) b!1571835))

(declare-fun m!1445713 () Bool)

(assert (=> start!134836 m!1445713))

(declare-fun m!1445715 () Bool)

(assert (=> start!134836 m!1445715))

(declare-fun m!1445717 () Bool)

(assert (=> b!1571834 m!1445717))

(declare-fun m!1445719 () Bool)

(assert (=> b!1571835 m!1445719))

(declare-fun m!1445721 () Bool)

(assert (=> b!1571835 m!1445721))

(assert (=> b!1571835 m!1445721))

(declare-fun m!1445723 () Bool)

(assert (=> b!1571835 m!1445723))

(check-sat (not b!1571834) (not b!1571835) (not start!134836))
(check-sat)
