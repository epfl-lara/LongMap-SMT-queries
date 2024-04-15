; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134790 () Bool)

(assert start!134790)

(declare-fun res!1073841 () Bool)

(declare-fun e!876251 () Bool)

(assert (=> start!134790 (=> (not res!1073841) (not e!876251))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134790 (= res!1073841 (validMask!0 mask!889))))

(assert (=> start!134790 e!876251))

(assert (=> start!134790 true))

(declare-datatypes ((array!104865 0))(
  ( (array!104866 (arr!50603 (Array (_ BitVec 32) (_ BitVec 64))) (size!51155 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104865)

(declare-fun array_inv!39539 (array!104865) Bool)

(assert (=> start!134790 (array_inv!39539 _keys!600)))

(declare-fun b!1571538 () Bool)

(declare-fun res!1073839 () Bool)

(assert (=> b!1571538 (=> (not res!1073839) (not e!876251))))

(assert (=> b!1571538 (= res!1073839 (= (size!51155 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571539 () Bool)

(declare-fun res!1073840 () Bool)

(assert (=> b!1571539 (=> (not res!1073840) (not e!876251))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571539 (= res!1073840 (validKeyInArray!0 k0!754))))

(declare-fun b!1571540 () Bool)

(assert (=> b!1571540 (= e!876251 false)))

(declare-datatypes ((SeekEntryResult!13551 0))(
  ( (MissingZero!13551 (index!56602 (_ BitVec 32))) (Found!13551 (index!56603 (_ BitVec 32))) (Intermediate!13551 (undefined!14363 Bool) (index!56604 (_ BitVec 32)) (x!141366 (_ BitVec 32))) (Undefined!13551) (MissingVacant!13551 (index!56605 (_ BitVec 32))) )
))
(declare-fun lt!673476 () SeekEntryResult!13551)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104865 (_ BitVec 32)) SeekEntryResult!13551)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571540 (= lt!673476 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!134790 res!1073841) b!1571538))

(assert (= (and b!1571538 res!1073839) b!1571539))

(assert (= (and b!1571539 res!1073840) b!1571540))

(declare-fun m!1444845 () Bool)

(assert (=> start!134790 m!1444845))

(declare-fun m!1444847 () Bool)

(assert (=> start!134790 m!1444847))

(declare-fun m!1444849 () Bool)

(assert (=> b!1571539 m!1444849))

(declare-fun m!1444851 () Bool)

(assert (=> b!1571540 m!1444851))

(assert (=> b!1571540 m!1444851))

(declare-fun m!1444853 () Bool)

(assert (=> b!1571540 m!1444853))

(check-sat (not start!134790) (not b!1571540) (not b!1571539))
(check-sat)
