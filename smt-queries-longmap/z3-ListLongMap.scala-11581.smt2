; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134980 () Bool)

(assert start!134980)

(declare-fun res!1074284 () Bool)

(declare-fun e!876733 () Bool)

(assert (=> start!134980 (=> (not res!1074284) (not e!876733))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134980 (= res!1074284 (validMask!0 mask!889))))

(assert (=> start!134980 e!876733))

(assert (=> start!134980 true))

(declare-datatypes ((array!104996 0))(
  ( (array!104997 (arr!50663 (Array (_ BitVec 32) (_ BitVec 64))) (size!51213 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104996)

(declare-fun array_inv!39390 (array!104996) Bool)

(assert (=> start!134980 (array_inv!39390 _keys!600)))

(declare-fun b!1572319 () Bool)

(declare-fun res!1074283 () Bool)

(assert (=> b!1572319 (=> (not res!1074283) (not e!876733))))

(assert (=> b!1572319 (= res!1074283 (= (size!51213 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572320 () Bool)

(declare-fun res!1074285 () Bool)

(assert (=> b!1572320 (=> (not res!1074285) (not e!876733))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572320 (= res!1074285 (validKeyInArray!0 k0!754))))

(declare-fun b!1572321 () Bool)

(assert (=> b!1572321 (= e!876733 false)))

(declare-datatypes ((SeekEntryResult!13576 0))(
  ( (MissingZero!13576 (index!56702 (_ BitVec 32))) (Found!13576 (index!56703 (_ BitVec 32))) (Intermediate!13576 (undefined!14388 Bool) (index!56704 (_ BitVec 32)) (x!141478 (_ BitVec 32))) (Undefined!13576) (MissingVacant!13576 (index!56705 (_ BitVec 32))) )
))
(declare-fun lt!673945 () SeekEntryResult!13576)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104996 (_ BitVec 32)) SeekEntryResult!13576)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572321 (= lt!673945 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!134980 res!1074284) b!1572319))

(assert (= (and b!1572319 res!1074283) b!1572320))

(assert (= (and b!1572320 res!1074285) b!1572321))

(declare-fun m!1446077 () Bool)

(assert (=> start!134980 m!1446077))

(declare-fun m!1446079 () Bool)

(assert (=> start!134980 m!1446079))

(declare-fun m!1446081 () Bool)

(assert (=> b!1572320 m!1446081))

(declare-fun m!1446083 () Bool)

(assert (=> b!1572321 m!1446083))

(assert (=> b!1572321 m!1446083))

(declare-fun m!1446085 () Bool)

(assert (=> b!1572321 m!1446085))

(check-sat (not b!1572321) (not start!134980) (not b!1572320))
(check-sat)
