; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134650 () Bool)

(assert start!134650)

(declare-fun b!1571370 () Bool)

(declare-fun res!1073608 () Bool)

(declare-fun e!876158 () Bool)

(assert (=> b!1571370 (=> (not res!1073608) (not e!876158))))

(declare-datatypes ((array!104852 0))(
  ( (array!104853 (arr!50603 (Array (_ BitVec 32) (_ BitVec 64))) (size!51153 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104852)

(declare-fun mask!4043 () (_ BitVec 32))

(assert (=> b!1571370 (= res!1073608 (= (size!51153 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1571372 () Bool)

(declare-fun res!1073610 () Bool)

(assert (=> b!1571372 (=> (not res!1073610) (not e!876158))))

(declare-fun k0!2731 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571372 (= res!1073610 (validKeyInArray!0 k0!2731))))

(declare-fun b!1571373 () Bool)

(assert (=> b!1571373 (= e!876158 false)))

(declare-datatypes ((SeekEntryResult!13540 0))(
  ( (MissingZero!13540 (index!56558 (_ BitVec 32))) (Found!13540 (index!56559 (_ BitVec 32))) (Intermediate!13540 (undefined!14352 Bool) (index!56560 (_ BitVec 32)) (x!141258 (_ BitVec 32))) (Undefined!13540) (MissingVacant!13540 (index!56561 (_ BitVec 32))) )
))
(declare-fun lt!673558 () SeekEntryResult!13540)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104852 (_ BitVec 32)) SeekEntryResult!13540)

(assert (=> b!1571373 (= lt!673558 (seekEntryOrOpen!0 k0!2731 a!3462 mask!4043))))

(declare-fun b!1571371 () Bool)

(declare-fun res!1073609 () Bool)

(assert (=> b!1571371 (=> (not res!1073609) (not e!876158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104852 (_ BitVec 32)) Bool)

(assert (=> b!1571371 (= res!1073609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(declare-fun res!1073607 () Bool)

(assert (=> start!134650 (=> (not res!1073607) (not e!876158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134650 (= res!1073607 (validMask!0 mask!4043))))

(assert (=> start!134650 e!876158))

(assert (=> start!134650 true))

(declare-fun array_inv!39330 (array!104852) Bool)

(assert (=> start!134650 (array_inv!39330 a!3462)))

(assert (= (and start!134650 res!1073607) b!1571370))

(assert (= (and b!1571370 res!1073608) b!1571371))

(assert (= (and b!1571371 res!1073609) b!1571372))

(assert (= (and b!1571372 res!1073610) b!1571373))

(declare-fun m!1445339 () Bool)

(assert (=> b!1571372 m!1445339))

(declare-fun m!1445341 () Bool)

(assert (=> b!1571373 m!1445341))

(declare-fun m!1445343 () Bool)

(assert (=> b!1571371 m!1445343))

(declare-fun m!1445345 () Bool)

(assert (=> start!134650 m!1445345))

(declare-fun m!1445347 () Bool)

(assert (=> start!134650 m!1445347))

(check-sat (not b!1571371) (not b!1571373) (not start!134650) (not b!1571372))
(check-sat)
