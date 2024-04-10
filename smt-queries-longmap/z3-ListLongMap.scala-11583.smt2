; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134992 () Bool)

(assert start!134992)

(declare-fun res!1074339 () Bool)

(declare-fun e!876770 () Bool)

(assert (=> start!134992 (=> (not res!1074339) (not e!876770))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134992 (= res!1074339 (validMask!0 mask!889))))

(assert (=> start!134992 e!876770))

(assert (=> start!134992 true))

(declare-datatypes ((array!105008 0))(
  ( (array!105009 (arr!50669 (Array (_ BitVec 32) (_ BitVec 64))) (size!51219 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105008)

(declare-fun array_inv!39396 (array!105008) Bool)

(assert (=> start!134992 (array_inv!39396 _keys!600)))

(declare-fun b!1572373 () Bool)

(declare-fun res!1074338 () Bool)

(assert (=> b!1572373 (=> (not res!1074338) (not e!876770))))

(assert (=> b!1572373 (= res!1074338 (= (size!51219 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572374 () Bool)

(declare-fun res!1074337 () Bool)

(assert (=> b!1572374 (=> (not res!1074337) (not e!876770))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572374 (= res!1074337 (validKeyInArray!0 k0!754))))

(declare-fun b!1572375 () Bool)

(assert (=> b!1572375 (= e!876770 false)))

(declare-datatypes ((SeekEntryResult!13582 0))(
  ( (MissingZero!13582 (index!56726 (_ BitVec 32))) (Found!13582 (index!56727 (_ BitVec 32))) (Intermediate!13582 (undefined!14394 Bool) (index!56728 (_ BitVec 32)) (x!141500 (_ BitVec 32))) (Undefined!13582) (MissingVacant!13582 (index!56729 (_ BitVec 32))) )
))
(declare-fun lt!673963 () SeekEntryResult!13582)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105008 (_ BitVec 32)) SeekEntryResult!13582)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572375 (= lt!673963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!134992 res!1074339) b!1572373))

(assert (= (and b!1572373 res!1074338) b!1572374))

(assert (= (and b!1572374 res!1074337) b!1572375))

(declare-fun m!1446137 () Bool)

(assert (=> start!134992 m!1446137))

(declare-fun m!1446139 () Bool)

(assert (=> start!134992 m!1446139))

(declare-fun m!1446141 () Bool)

(assert (=> b!1572374 m!1446141))

(declare-fun m!1446143 () Bool)

(assert (=> b!1572375 m!1446143))

(assert (=> b!1572375 m!1446143))

(declare-fun m!1446145 () Bool)

(assert (=> b!1572375 m!1446145))

(check-sat (not start!134992) (not b!1572375) (not b!1572374))
(check-sat)
