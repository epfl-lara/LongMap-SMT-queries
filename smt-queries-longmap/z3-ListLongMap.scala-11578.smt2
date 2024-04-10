; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134902 () Bool)

(assert start!134902)

(declare-fun res!1074142 () Bool)

(declare-fun e!876590 () Bool)

(assert (=> start!134902 (=> (not res!1074142) (not e!876590))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134902 (= res!1074142 (validMask!0 mask!889))))

(assert (=> start!134902 e!876590))

(assert (=> start!134902 true))

(declare-datatypes ((array!104972 0))(
  ( (array!104973 (arr!50654 (Array (_ BitVec 32) (_ BitVec 64))) (size!51204 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104972)

(declare-fun array_inv!39381 (array!104972) Bool)

(assert (=> start!134902 (array_inv!39381 _keys!600)))

(declare-fun b!1572076 () Bool)

(declare-fun res!1074143 () Bool)

(assert (=> b!1572076 (=> (not res!1074143) (not e!876590))))

(assert (=> b!1572076 (= res!1074143 (= (size!51204 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572077 () Bool)

(declare-fun res!1074144 () Bool)

(assert (=> b!1572077 (=> (not res!1074144) (not e!876590))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572077 (= res!1074144 (validKeyInArray!0 k0!754))))

(declare-fun b!1572078 () Bool)

(assert (=> b!1572078 (= e!876590 false)))

(declare-datatypes ((SeekEntryResult!13567 0))(
  ( (MissingZero!13567 (index!56666 (_ BitVec 32))) (Found!13567 (index!56667 (_ BitVec 32))) (Intermediate!13567 (undefined!14379 Bool) (index!56668 (_ BitVec 32)) (x!141433 (_ BitVec 32))) (Undefined!13567) (MissingVacant!13567 (index!56669 (_ BitVec 32))) )
))
(declare-fun lt!673846 () SeekEntryResult!13567)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104972 (_ BitVec 32)) SeekEntryResult!13567)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572078 (= lt!673846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!134902 res!1074142) b!1572076))

(assert (= (and b!1572076 res!1074143) b!1572077))

(assert (= (and b!1572077 res!1074144) b!1572078))

(declare-fun m!1445927 () Bool)

(assert (=> start!134902 m!1445927))

(declare-fun m!1445929 () Bool)

(assert (=> start!134902 m!1445929))

(declare-fun m!1445931 () Bool)

(assert (=> b!1572077 m!1445931))

(declare-fun m!1445933 () Bool)

(assert (=> b!1572078 m!1445933))

(assert (=> b!1572078 m!1445933))

(declare-fun m!1445935 () Bool)

(assert (=> b!1572078 m!1445935))

(check-sat (not b!1572077) (not start!134902) (not b!1572078))
(check-sat)
