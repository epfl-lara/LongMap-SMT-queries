; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134838 () Bool)

(assert start!134838)

(declare-fun res!1073959 () Bool)

(declare-fun e!876442 () Bool)

(assert (=> start!134838 (=> (not res!1073959) (not e!876442))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134838 (= res!1073959 (validMask!0 mask!889))))

(assert (=> start!134838 e!876442))

(assert (=> start!134838 true))

(declare-datatypes ((array!104935 0))(
  ( (array!104936 (arr!50637 (Array (_ BitVec 32) (_ BitVec 64))) (size!51187 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104935)

(declare-fun array_inv!39364 (array!104935) Bool)

(assert (=> start!134838 (array_inv!39364 _keys!600)))

(declare-fun b!1571842 () Bool)

(declare-fun res!1073960 () Bool)

(assert (=> b!1571842 (=> (not res!1073960) (not e!876442))))

(assert (=> b!1571842 (= res!1073960 (= (size!51187 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571843 () Bool)

(declare-fun res!1073961 () Bool)

(assert (=> b!1571843 (=> (not res!1073961) (not e!876442))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571843 (= res!1073961 (validKeyInArray!0 k!754))))

(declare-datatypes ((SeekEntryResult!13550 0))(
  ( (MissingZero!13550 (index!56598 (_ BitVec 32))) (Found!13550 (index!56599 (_ BitVec 32))) (Intermediate!13550 (undefined!14362 Bool) (index!56600 (_ BitVec 32)) (x!141362 (_ BitVec 32))) (Undefined!13550) (MissingVacant!13550 (index!56601 (_ BitVec 32))) )
))
(declare-fun lt!673759 () SeekEntryResult!13550)

(declare-fun b!1571844 () Bool)

(assert (=> b!1571844 (= e!876442 (and (is-Intermediate!13550 lt!673759) (not (undefined!14362 lt!673759)) (not (= (select (arr!50637 _keys!600) (index!56600 lt!673759)) k!754)) (not (= (select (arr!50637 _keys!600) (index!56600 lt!673759)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50637 _keys!600) (index!56600 lt!673759)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56600 lt!673759) #b00000000000000000000000000000000) (bvslt (index!56600 lt!673759) (bvadd #b00000000000000000000000000000001 mask!889)) (bvslt mask!889 #b00000000000000000000000000000000)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104935 (_ BitVec 32)) SeekEntryResult!13550)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571844 (= lt!673759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134838 res!1073959) b!1571842))

(assert (= (and b!1571842 res!1073960) b!1571843))

(assert (= (and b!1571843 res!1073961) b!1571844))

(declare-fun m!1445725 () Bool)

(assert (=> start!134838 m!1445725))

(declare-fun m!1445727 () Bool)

(assert (=> start!134838 m!1445727))

(declare-fun m!1445729 () Bool)

(assert (=> b!1571843 m!1445729))

(declare-fun m!1445731 () Bool)

(assert (=> b!1571844 m!1445731))

(declare-fun m!1445733 () Bool)

(assert (=> b!1571844 m!1445733))

(assert (=> b!1571844 m!1445733))

(declare-fun m!1445735 () Bool)

(assert (=> b!1571844 m!1445735))

(push 1)

(assert (not start!134838))

(assert (not b!1571843))

(assert (not b!1571844))

