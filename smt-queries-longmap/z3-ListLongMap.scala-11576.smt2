; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134890 () Bool)

(assert start!134890)

(declare-fun res!1074088 () Bool)

(declare-fun e!876553 () Bool)

(assert (=> start!134890 (=> (not res!1074088) (not e!876553))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134890 (= res!1074088 (validMask!0 mask!889))))

(assert (=> start!134890 e!876553))

(assert (=> start!134890 true))

(declare-datatypes ((array!104960 0))(
  ( (array!104961 (arr!50648 (Array (_ BitVec 32) (_ BitVec 64))) (size!51198 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104960)

(declare-fun array_inv!39375 (array!104960) Bool)

(assert (=> start!134890 (array_inv!39375 _keys!600)))

(declare-fun b!1572022 () Bool)

(declare-fun res!1074089 () Bool)

(assert (=> b!1572022 (=> (not res!1074089) (not e!876553))))

(assert (=> b!1572022 (= res!1074089 (= (size!51198 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572023 () Bool)

(declare-fun res!1074090 () Bool)

(assert (=> b!1572023 (=> (not res!1074090) (not e!876553))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572023 (= res!1074090 (validKeyInArray!0 k0!754))))

(declare-fun b!1572024 () Bool)

(assert (=> b!1572024 (= e!876553 false)))

(declare-datatypes ((SeekEntryResult!13561 0))(
  ( (MissingZero!13561 (index!56642 (_ BitVec 32))) (Found!13561 (index!56643 (_ BitVec 32))) (Intermediate!13561 (undefined!14373 Bool) (index!56644 (_ BitVec 32)) (x!141411 (_ BitVec 32))) (Undefined!13561) (MissingVacant!13561 (index!56645 (_ BitVec 32))) )
))
(declare-fun lt!673828 () SeekEntryResult!13561)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104960 (_ BitVec 32)) SeekEntryResult!13561)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572024 (= lt!673828 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!134890 res!1074088) b!1572022))

(assert (= (and b!1572022 res!1074089) b!1572023))

(assert (= (and b!1572023 res!1074090) b!1572024))

(declare-fun m!1445867 () Bool)

(assert (=> start!134890 m!1445867))

(declare-fun m!1445869 () Bool)

(assert (=> start!134890 m!1445869))

(declare-fun m!1445871 () Bool)

(assert (=> b!1572023 m!1445871))

(declare-fun m!1445873 () Bool)

(assert (=> b!1572024 m!1445873))

(assert (=> b!1572024 m!1445873))

(declare-fun m!1445875 () Bool)

(assert (=> b!1572024 m!1445875))

(check-sat (not b!1572023) (not start!134890) (not b!1572024))
(check-sat)
