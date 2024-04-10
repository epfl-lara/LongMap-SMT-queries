; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134896 () Bool)

(assert start!134896)

(declare-fun res!1074116 () Bool)

(declare-fun e!876571 () Bool)

(assert (=> start!134896 (=> (not res!1074116) (not e!876571))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134896 (= res!1074116 (validMask!0 mask!889))))

(assert (=> start!134896 e!876571))

(assert (=> start!134896 true))

(declare-datatypes ((array!104966 0))(
  ( (array!104967 (arr!50651 (Array (_ BitVec 32) (_ BitVec 64))) (size!51201 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104966)

(declare-fun array_inv!39378 (array!104966) Bool)

(assert (=> start!134896 (array_inv!39378 _keys!600)))

(declare-fun b!1572049 () Bool)

(declare-fun res!1074115 () Bool)

(assert (=> b!1572049 (=> (not res!1074115) (not e!876571))))

(assert (=> b!1572049 (= res!1074115 (= (size!51201 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572050 () Bool)

(declare-fun res!1074117 () Bool)

(assert (=> b!1572050 (=> (not res!1074117) (not e!876571))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572050 (= res!1074117 (validKeyInArray!0 k0!754))))

(declare-fun b!1572051 () Bool)

(assert (=> b!1572051 (= e!876571 false)))

(declare-datatypes ((SeekEntryResult!13564 0))(
  ( (MissingZero!13564 (index!56654 (_ BitVec 32))) (Found!13564 (index!56655 (_ BitVec 32))) (Intermediate!13564 (undefined!14376 Bool) (index!56656 (_ BitVec 32)) (x!141422 (_ BitVec 32))) (Undefined!13564) (MissingVacant!13564 (index!56657 (_ BitVec 32))) )
))
(declare-fun lt!673837 () SeekEntryResult!13564)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104966 (_ BitVec 32)) SeekEntryResult!13564)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572051 (= lt!673837 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!134896 res!1074116) b!1572049))

(assert (= (and b!1572049 res!1074115) b!1572050))

(assert (= (and b!1572050 res!1074117) b!1572051))

(declare-fun m!1445897 () Bool)

(assert (=> start!134896 m!1445897))

(declare-fun m!1445899 () Bool)

(assert (=> start!134896 m!1445899))

(declare-fun m!1445901 () Bool)

(assert (=> b!1572050 m!1445901))

(declare-fun m!1445903 () Bool)

(assert (=> b!1572051 m!1445903))

(assert (=> b!1572051 m!1445903))

(declare-fun m!1445905 () Bool)

(assert (=> b!1572051 m!1445905))

(check-sat (not start!134896) (not b!1572051) (not b!1572050))
(check-sat)
