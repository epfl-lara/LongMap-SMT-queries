; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134986 () Bool)

(assert start!134986)

(declare-fun res!1074310 () Bool)

(declare-fun e!876751 () Bool)

(assert (=> start!134986 (=> (not res!1074310) (not e!876751))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134986 (= res!1074310 (validMask!0 mask!889))))

(assert (=> start!134986 e!876751))

(assert (=> start!134986 true))

(declare-datatypes ((array!105002 0))(
  ( (array!105003 (arr!50666 (Array (_ BitVec 32) (_ BitVec 64))) (size!51216 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105002)

(declare-fun array_inv!39393 (array!105002) Bool)

(assert (=> start!134986 (array_inv!39393 _keys!600)))

(declare-fun b!1572346 () Bool)

(declare-fun res!1074311 () Bool)

(assert (=> b!1572346 (=> (not res!1074311) (not e!876751))))

(assert (=> b!1572346 (= res!1074311 (= (size!51216 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572347 () Bool)

(declare-fun res!1074312 () Bool)

(assert (=> b!1572347 (=> (not res!1074312) (not e!876751))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572347 (= res!1074312 (validKeyInArray!0 k0!754))))

(declare-fun b!1572348 () Bool)

(assert (=> b!1572348 (= e!876751 false)))

(declare-datatypes ((SeekEntryResult!13579 0))(
  ( (MissingZero!13579 (index!56714 (_ BitVec 32))) (Found!13579 (index!56715 (_ BitVec 32))) (Intermediate!13579 (undefined!14391 Bool) (index!56716 (_ BitVec 32)) (x!141489 (_ BitVec 32))) (Undefined!13579) (MissingVacant!13579 (index!56717 (_ BitVec 32))) )
))
(declare-fun lt!673954 () SeekEntryResult!13579)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105002 (_ BitVec 32)) SeekEntryResult!13579)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572348 (= lt!673954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!134986 res!1074310) b!1572346))

(assert (= (and b!1572346 res!1074311) b!1572347))

(assert (= (and b!1572347 res!1074312) b!1572348))

(declare-fun m!1446107 () Bool)

(assert (=> start!134986 m!1446107))

(declare-fun m!1446109 () Bool)

(assert (=> start!134986 m!1446109))

(declare-fun m!1446111 () Bool)

(assert (=> b!1572347 m!1446111))

(declare-fun m!1446113 () Bool)

(assert (=> b!1572348 m!1446113))

(assert (=> b!1572348 m!1446113))

(declare-fun m!1446115 () Bool)

(assert (=> b!1572348 m!1446115))

(check-sat (not start!134986) (not b!1572348) (not b!1572347))
