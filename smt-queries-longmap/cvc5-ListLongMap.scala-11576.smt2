; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134888 () Bool)

(assert start!134888)

(declare-fun res!1074079 () Bool)

(declare-fun e!876548 () Bool)

(assert (=> start!134888 (=> (not res!1074079) (not e!876548))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134888 (= res!1074079 (validMask!0 mask!889))))

(assert (=> start!134888 e!876548))

(assert (=> start!134888 true))

(declare-datatypes ((array!104958 0))(
  ( (array!104959 (arr!50647 (Array (_ BitVec 32) (_ BitVec 64))) (size!51197 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104958)

(declare-fun array_inv!39374 (array!104958) Bool)

(assert (=> start!134888 (array_inv!39374 _keys!600)))

(declare-fun b!1572013 () Bool)

(declare-fun res!1074081 () Bool)

(assert (=> b!1572013 (=> (not res!1074081) (not e!876548))))

(assert (=> b!1572013 (= res!1074081 (= (size!51197 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572014 () Bool)

(declare-fun res!1074080 () Bool)

(assert (=> b!1572014 (=> (not res!1074080) (not e!876548))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572014 (= res!1074080 (validKeyInArray!0 k!754))))

(declare-fun b!1572015 () Bool)

(assert (=> b!1572015 (= e!876548 false)))

(declare-datatypes ((SeekEntryResult!13560 0))(
  ( (MissingZero!13560 (index!56638 (_ BitVec 32))) (Found!13560 (index!56639 (_ BitVec 32))) (Intermediate!13560 (undefined!14372 Bool) (index!56640 (_ BitVec 32)) (x!141410 (_ BitVec 32))) (Undefined!13560) (MissingVacant!13560 (index!56641 (_ BitVec 32))) )
))
(declare-fun lt!673825 () SeekEntryResult!13560)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104958 (_ BitVec 32)) SeekEntryResult!13560)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572015 (= lt!673825 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134888 res!1074079) b!1572013))

(assert (= (and b!1572013 res!1074081) b!1572014))

(assert (= (and b!1572014 res!1074080) b!1572015))

(declare-fun m!1445857 () Bool)

(assert (=> start!134888 m!1445857))

(declare-fun m!1445859 () Bool)

(assert (=> start!134888 m!1445859))

(declare-fun m!1445861 () Bool)

(assert (=> b!1572014 m!1445861))

(declare-fun m!1445863 () Bool)

(assert (=> b!1572015 m!1445863))

(assert (=> b!1572015 m!1445863))

(declare-fun m!1445865 () Bool)

(assert (=> b!1572015 m!1445865))

(push 1)

(assert (not start!134888))

(assert (not b!1572015))

(assert (not b!1572014))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

