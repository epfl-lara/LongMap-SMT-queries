; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135094 () Bool)

(assert start!135094)

(declare-fun res!1074586 () Bool)

(declare-fun e!876986 () Bool)

(assert (=> start!135094 (=> (not res!1074586) (not e!876986))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135094 (= res!1074586 (validMask!0 mask!889))))

(assert (=> start!135094 e!876986))

(assert (=> start!135094 true))

(declare-datatypes ((array!105056 0))(
  ( (array!105057 (arr!50690 (Array (_ BitVec 32) (_ BitVec 64))) (size!51240 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105056)

(declare-fun array_inv!39417 (array!105056) Bool)

(assert (=> start!135094 (array_inv!39417 _keys!600)))

(declare-fun b!1572724 () Bool)

(declare-fun res!1074587 () Bool)

(assert (=> b!1572724 (=> (not res!1074587) (not e!876986))))

(assert (=> b!1572724 (= res!1074587 (= (size!51240 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572725 () Bool)

(declare-fun res!1074588 () Bool)

(assert (=> b!1572725 (=> (not res!1074588) (not e!876986))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572725 (= res!1074588 (validKeyInArray!0 k0!754))))

(declare-fun b!1572726 () Bool)

(assert (=> b!1572726 (= e!876986 false)))

(declare-datatypes ((SeekEntryResult!13603 0))(
  ( (MissingZero!13603 (index!56810 (_ BitVec 32))) (Found!13603 (index!56811 (_ BitVec 32))) (Intermediate!13603 (undefined!14415 Bool) (index!56812 (_ BitVec 32)) (x!141589 (_ BitVec 32))) (Undefined!13603) (MissingVacant!13603 (index!56813 (_ BitVec 32))) )
))
(declare-fun lt!674098 () SeekEntryResult!13603)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105056 (_ BitVec 32)) SeekEntryResult!13603)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572726 (= lt!674098 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!135094 res!1074586) b!1572724))

(assert (= (and b!1572724 res!1074587) b!1572725))

(assert (= (and b!1572725 res!1074588) b!1572726))

(declare-fun m!1446401 () Bool)

(assert (=> start!135094 m!1446401))

(declare-fun m!1446403 () Bool)

(assert (=> start!135094 m!1446403))

(declare-fun m!1446405 () Bool)

(assert (=> b!1572725 m!1446405))

(declare-fun m!1446407 () Bool)

(assert (=> b!1572726 m!1446407))

(assert (=> b!1572726 m!1446407))

(declare-fun m!1446409 () Bool)

(assert (=> b!1572726 m!1446409))

(check-sat (not b!1572725) (not b!1572726) (not start!135094))
(check-sat)
