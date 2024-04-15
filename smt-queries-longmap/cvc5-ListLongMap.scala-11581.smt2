; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134932 () Bool)

(assert start!134932)

(declare-fun res!1074165 () Bool)

(declare-fun e!876542 () Bool)

(assert (=> start!134932 (=> (not res!1074165) (not e!876542))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134932 (= res!1074165 (validMask!0 mask!889))))

(assert (=> start!134932 e!876542))

(assert (=> start!134932 true))

(declare-datatypes ((array!104926 0))(
  ( (array!104927 (arr!50629 (Array (_ BitVec 32) (_ BitVec 64))) (size!51181 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104926)

(declare-fun array_inv!39565 (array!104926) Bool)

(assert (=> start!134932 (array_inv!39565 _keys!600)))

(declare-fun b!1572015 () Bool)

(declare-fun res!1074164 () Bool)

(assert (=> b!1572015 (=> (not res!1074164) (not e!876542))))

(assert (=> b!1572015 (= res!1074164 (= (size!51181 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572016 () Bool)

(declare-fun res!1074163 () Bool)

(assert (=> b!1572016 (=> (not res!1074163) (not e!876542))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572016 (= res!1074163 (validKeyInArray!0 k!754))))

(declare-fun b!1572017 () Bool)

(assert (=> b!1572017 (= e!876542 false)))

(declare-datatypes ((SeekEntryResult!13577 0))(
  ( (MissingZero!13577 (index!56706 (_ BitVec 32))) (Found!13577 (index!56707 (_ BitVec 32))) (Intermediate!13577 (undefined!14389 Bool) (index!56708 (_ BitVec 32)) (x!141474 (_ BitVec 32))) (Undefined!13577) (MissingVacant!13577 (index!56709 (_ BitVec 32))) )
))
(declare-fun lt!673662 () SeekEntryResult!13577)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104926 (_ BitVec 32)) SeekEntryResult!13577)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572017 (= lt!673662 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134932 res!1074165) b!1572015))

(assert (= (and b!1572015 res!1074164) b!1572016))

(assert (= (and b!1572016 res!1074163) b!1572017))

(declare-fun m!1445195 () Bool)

(assert (=> start!134932 m!1445195))

(declare-fun m!1445197 () Bool)

(assert (=> start!134932 m!1445197))

(declare-fun m!1445199 () Bool)

(assert (=> b!1572016 m!1445199))

(declare-fun m!1445201 () Bool)

(assert (=> b!1572017 m!1445201))

(assert (=> b!1572017 m!1445201))

(declare-fun m!1445203 () Bool)

(assert (=> b!1572017 m!1445203))

(push 1)

(assert (not b!1572016))

(assert (not start!134932))

(assert (not b!1572017))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

