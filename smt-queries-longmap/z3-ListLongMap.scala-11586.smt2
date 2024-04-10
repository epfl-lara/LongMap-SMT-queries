; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135070 () Bool)

(assert start!135070)

(declare-fun res!1074478 () Bool)

(declare-fun e!876913 () Bool)

(assert (=> start!135070 (=> (not res!1074478) (not e!876913))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135070 (= res!1074478 (validMask!0 mask!889))))

(assert (=> start!135070 e!876913))

(assert (=> start!135070 true))

(declare-datatypes ((array!105032 0))(
  ( (array!105033 (arr!50678 (Array (_ BitVec 32) (_ BitVec 64))) (size!51228 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105032)

(declare-fun array_inv!39405 (array!105032) Bool)

(assert (=> start!135070 (array_inv!39405 _keys!600)))

(declare-fun b!1572616 () Bool)

(declare-fun res!1074479 () Bool)

(assert (=> b!1572616 (=> (not res!1074479) (not e!876913))))

(assert (=> b!1572616 (= res!1074479 (= (size!51228 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572617 () Bool)

(declare-fun res!1074480 () Bool)

(assert (=> b!1572617 (=> (not res!1074480) (not e!876913))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572617 (= res!1074480 (validKeyInArray!0 k0!754))))

(declare-fun b!1572618 () Bool)

(assert (=> b!1572618 (= e!876913 false)))

(declare-datatypes ((SeekEntryResult!13591 0))(
  ( (MissingZero!13591 (index!56762 (_ BitVec 32))) (Found!13591 (index!56763 (_ BitVec 32))) (Intermediate!13591 (undefined!14403 Bool) (index!56764 (_ BitVec 32)) (x!141545 (_ BitVec 32))) (Undefined!13591) (MissingVacant!13591 (index!56765 (_ BitVec 32))) )
))
(declare-fun lt!674062 () SeekEntryResult!13591)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105032 (_ BitVec 32)) SeekEntryResult!13591)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572618 (= lt!674062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!135070 res!1074478) b!1572616))

(assert (= (and b!1572616 res!1074479) b!1572617))

(assert (= (and b!1572617 res!1074480) b!1572618))

(declare-fun m!1446281 () Bool)

(assert (=> start!135070 m!1446281))

(declare-fun m!1446283 () Bool)

(assert (=> start!135070 m!1446283))

(declare-fun m!1446285 () Bool)

(assert (=> b!1572617 m!1446285))

(declare-fun m!1446287 () Bool)

(assert (=> b!1572618 m!1446287))

(assert (=> b!1572618 m!1446287))

(declare-fun m!1446289 () Bool)

(assert (=> b!1572618 m!1446289))

(check-sat (not start!135070) (not b!1572618) (not b!1572617))
(check-sat)
