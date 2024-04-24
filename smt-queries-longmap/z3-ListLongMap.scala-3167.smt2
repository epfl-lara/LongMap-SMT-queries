; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44618 () Bool)

(assert start!44618)

(declare-fun b!489509 () Bool)

(declare-fun res!292507 () Bool)

(declare-fun e!287883 () Bool)

(assert (=> b!489509 (=> (not res!292507) (not e!287883))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489509 (= res!292507 (validKeyInArray!0 k0!2280))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!489510 () Bool)

(declare-datatypes ((array!31678 0))(
  ( (array!31679 (arr!15226 (Array (_ BitVec 32) (_ BitVec 64))) (size!15590 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31678)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!287880 () Bool)

(declare-datatypes ((SeekEntryResult!3649 0))(
  ( (MissingZero!3649 (index!16775 (_ BitVec 32))) (Found!3649 (index!16776 (_ BitVec 32))) (Intermediate!3649 (undefined!4461 Bool) (index!16777 (_ BitVec 32)) (x!46032 (_ BitVec 32))) (Undefined!3649) (MissingVacant!3649 (index!16778 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31678 (_ BitVec 32)) SeekEntryResult!3649)

(assert (=> b!489510 (= e!287880 (= (seekEntryOrOpen!0 (select (arr!15226 a!3235) j!176) a!3235 mask!3524) (Found!3649 j!176)))))

(declare-fun b!489511 () Bool)

(declare-fun res!292504 () Bool)

(declare-fun e!287881 () Bool)

(assert (=> b!489511 (=> (not res!292504) (not e!287881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31678 (_ BitVec 32)) Bool)

(assert (=> b!489511 (= res!292504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489513 () Bool)

(assert (=> b!489513 (= e!287883 e!287881)))

(declare-fun res!292506 () Bool)

(assert (=> b!489513 (=> (not res!292506) (not e!287881))))

(declare-fun lt!220929 () SeekEntryResult!3649)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489513 (= res!292506 (or (= lt!220929 (MissingZero!3649 i!1204)) (= lt!220929 (MissingVacant!3649 i!1204))))))

(assert (=> b!489513 (= lt!220929 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489514 () Bool)

(declare-fun res!292501 () Bool)

(assert (=> b!489514 (=> (not res!292501) (not e!287883))))

(assert (=> b!489514 (= res!292501 (and (= (size!15590 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15590 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15590 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489515 () Bool)

(declare-fun res!292499 () Bool)

(assert (=> b!489515 (=> (not res!292499) (not e!287881))))

(declare-datatypes ((List!9291 0))(
  ( (Nil!9288) (Cons!9287 (h!10149 (_ BitVec 64)) (t!15511 List!9291)) )
))
(declare-fun arrayNoDuplicates!0 (array!31678 (_ BitVec 32) List!9291) Bool)

(assert (=> b!489515 (= res!292499 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9288))))

(declare-fun res!292505 () Bool)

(assert (=> start!44618 (=> (not res!292505) (not e!287883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44618 (= res!292505 (validMask!0 mask!3524))))

(assert (=> start!44618 e!287883))

(assert (=> start!44618 true))

(declare-fun array_inv!11085 (array!31678) Bool)

(assert (=> start!44618 (array_inv!11085 a!3235)))

(declare-fun b!489512 () Bool)

(assert (=> b!489512 (= e!287881 (not true))))

(declare-fun lt!220928 () (_ BitVec 32))

(declare-fun lt!220925 () SeekEntryResult!3649)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31678 (_ BitVec 32)) SeekEntryResult!3649)

(assert (=> b!489512 (= lt!220925 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220928 (select (store (arr!15226 a!3235) i!1204 k0!2280) j!176) (array!31679 (store (arr!15226 a!3235) i!1204 k0!2280) (size!15590 a!3235)) mask!3524))))

(declare-fun lt!220930 () SeekEntryResult!3649)

(declare-fun lt!220927 () (_ BitVec 32))

(assert (=> b!489512 (= lt!220930 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220927 (select (arr!15226 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489512 (= lt!220928 (toIndex!0 (select (store (arr!15226 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489512 (= lt!220927 (toIndex!0 (select (arr!15226 a!3235) j!176) mask!3524))))

(assert (=> b!489512 e!287880))

(declare-fun res!292502 () Bool)

(assert (=> b!489512 (=> (not res!292502) (not e!287880))))

(assert (=> b!489512 (= res!292502 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14305 0))(
  ( (Unit!14306) )
))
(declare-fun lt!220926 () Unit!14305)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31678 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14305)

(assert (=> b!489512 (= lt!220926 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489516 () Bool)

(declare-fun res!292503 () Bool)

(assert (=> b!489516 (=> (not res!292503) (not e!287883))))

(assert (=> b!489516 (= res!292503 (validKeyInArray!0 (select (arr!15226 a!3235) j!176)))))

(declare-fun b!489517 () Bool)

(declare-fun res!292500 () Bool)

(assert (=> b!489517 (=> (not res!292500) (not e!287883))))

(declare-fun arrayContainsKey!0 (array!31678 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489517 (= res!292500 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44618 res!292505) b!489514))

(assert (= (and b!489514 res!292501) b!489516))

(assert (= (and b!489516 res!292503) b!489509))

(assert (= (and b!489509 res!292507) b!489517))

(assert (= (and b!489517 res!292500) b!489513))

(assert (= (and b!489513 res!292506) b!489511))

(assert (= (and b!489511 res!292504) b!489515))

(assert (= (and b!489515 res!292499) b!489512))

(assert (= (and b!489512 res!292502) b!489510))

(declare-fun m!469573 () Bool)

(assert (=> b!489512 m!469573))

(declare-fun m!469575 () Bool)

(assert (=> b!489512 m!469575))

(declare-fun m!469577 () Bool)

(assert (=> b!489512 m!469577))

(declare-fun m!469579 () Bool)

(assert (=> b!489512 m!469579))

(declare-fun m!469581 () Bool)

(assert (=> b!489512 m!469581))

(assert (=> b!489512 m!469573))

(declare-fun m!469583 () Bool)

(assert (=> b!489512 m!469583))

(assert (=> b!489512 m!469573))

(assert (=> b!489512 m!469581))

(declare-fun m!469585 () Bool)

(assert (=> b!489512 m!469585))

(assert (=> b!489512 m!469581))

(declare-fun m!469587 () Bool)

(assert (=> b!489512 m!469587))

(declare-fun m!469589 () Bool)

(assert (=> b!489512 m!469589))

(assert (=> b!489516 m!469573))

(assert (=> b!489516 m!469573))

(declare-fun m!469591 () Bool)

(assert (=> b!489516 m!469591))

(declare-fun m!469593 () Bool)

(assert (=> b!489515 m!469593))

(declare-fun m!469595 () Bool)

(assert (=> b!489511 m!469595))

(declare-fun m!469597 () Bool)

(assert (=> start!44618 m!469597))

(declare-fun m!469599 () Bool)

(assert (=> start!44618 m!469599))

(declare-fun m!469601 () Bool)

(assert (=> b!489513 m!469601))

(assert (=> b!489510 m!469573))

(assert (=> b!489510 m!469573))

(declare-fun m!469603 () Bool)

(assert (=> b!489510 m!469603))

(declare-fun m!469605 () Bool)

(assert (=> b!489517 m!469605))

(declare-fun m!469607 () Bool)

(assert (=> b!489509 m!469607))

(check-sat (not start!44618) (not b!489511) (not b!489512) (not b!489516) (not b!489515) (not b!489517) (not b!489510) (not b!489509) (not b!489513))
(check-sat)
