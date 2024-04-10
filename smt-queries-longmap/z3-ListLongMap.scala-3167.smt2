; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44630 () Bool)

(assert start!44630)

(declare-fun b!489597 () Bool)

(declare-fun res!292539 () Bool)

(declare-fun e!287934 () Bool)

(assert (=> b!489597 (=> (not res!292539) (not e!287934))))

(declare-datatypes ((array!31689 0))(
  ( (array!31690 (arr!15232 (Array (_ BitVec 32) (_ BitVec 64))) (size!15596 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31689)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489597 (= res!292539 (validKeyInArray!0 (select (arr!15232 a!3235) j!176)))))

(declare-fun res!292537 () Bool)

(assert (=> start!44630 (=> (not res!292537) (not e!287934))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44630 (= res!292537 (validMask!0 mask!3524))))

(assert (=> start!44630 e!287934))

(assert (=> start!44630 true))

(declare-fun array_inv!11028 (array!31689) Bool)

(assert (=> start!44630 (array_inv!11028 a!3235)))

(declare-fun b!489598 () Bool)

(declare-fun e!287933 () Bool)

(declare-datatypes ((SeekEntryResult!3699 0))(
  ( (MissingZero!3699 (index!16975 (_ BitVec 32))) (Found!3699 (index!16976 (_ BitVec 32))) (Intermediate!3699 (undefined!4511 Bool) (index!16977 (_ BitVec 32)) (x!46085 (_ BitVec 32))) (Undefined!3699) (MissingVacant!3699 (index!16978 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31689 (_ BitVec 32)) SeekEntryResult!3699)

(assert (=> b!489598 (= e!287933 (= (seekEntryOrOpen!0 (select (arr!15232 a!3235) j!176) a!3235 mask!3524) (Found!3699 j!176)))))

(declare-fun b!489599 () Bool)

(declare-fun res!292535 () Bool)

(declare-fun e!287932 () Bool)

(assert (=> b!489599 (=> (not res!292535) (not e!287932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31689 (_ BitVec 32)) Bool)

(assert (=> b!489599 (= res!292535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489600 () Bool)

(declare-fun res!292536 () Bool)

(assert (=> b!489600 (=> (not res!292536) (not e!287934))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489600 (= res!292536 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489601 () Bool)

(assert (=> b!489601 (= e!287934 e!287932)))

(declare-fun res!292534 () Bool)

(assert (=> b!489601 (=> (not res!292534) (not e!287932))))

(declare-fun lt!220933 () SeekEntryResult!3699)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489601 (= res!292534 (or (= lt!220933 (MissingZero!3699 i!1204)) (= lt!220933 (MissingVacant!3699 i!1204))))))

(assert (=> b!489601 (= lt!220933 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489602 () Bool)

(assert (=> b!489602 (= e!287932 (not true))))

(declare-fun lt!220934 () (_ BitVec 32))

(declare-fun lt!220932 () SeekEntryResult!3699)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31689 (_ BitVec 32)) SeekEntryResult!3699)

(assert (=> b!489602 (= lt!220932 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220934 (select (store (arr!15232 a!3235) i!1204 k0!2280) j!176) (array!31690 (store (arr!15232 a!3235) i!1204 k0!2280) (size!15596 a!3235)) mask!3524))))

(declare-fun lt!220936 () (_ BitVec 32))

(declare-fun lt!220935 () SeekEntryResult!3699)

(assert (=> b!489602 (= lt!220935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220936 (select (arr!15232 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489602 (= lt!220934 (toIndex!0 (select (store (arr!15232 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489602 (= lt!220936 (toIndex!0 (select (arr!15232 a!3235) j!176) mask!3524))))

(assert (=> b!489602 e!287933))

(declare-fun res!292540 () Bool)

(assert (=> b!489602 (=> (not res!292540) (not e!287933))))

(assert (=> b!489602 (= res!292540 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14344 0))(
  ( (Unit!14345) )
))
(declare-fun lt!220931 () Unit!14344)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31689 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14344)

(assert (=> b!489602 (= lt!220931 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489603 () Bool)

(declare-fun res!292533 () Bool)

(assert (=> b!489603 (=> (not res!292533) (not e!287932))))

(declare-datatypes ((List!9390 0))(
  ( (Nil!9387) (Cons!9386 (h!10248 (_ BitVec 64)) (t!15618 List!9390)) )
))
(declare-fun arrayNoDuplicates!0 (array!31689 (_ BitVec 32) List!9390) Bool)

(assert (=> b!489603 (= res!292533 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9387))))

(declare-fun b!489604 () Bool)

(declare-fun res!292538 () Bool)

(assert (=> b!489604 (=> (not res!292538) (not e!287934))))

(assert (=> b!489604 (= res!292538 (and (= (size!15596 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15596 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15596 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489605 () Bool)

(declare-fun res!292541 () Bool)

(assert (=> b!489605 (=> (not res!292541) (not e!287934))))

(assert (=> b!489605 (= res!292541 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44630 res!292537) b!489604))

(assert (= (and b!489604 res!292538) b!489597))

(assert (= (and b!489597 res!292539) b!489605))

(assert (= (and b!489605 res!292541) b!489600))

(assert (= (and b!489600 res!292536) b!489601))

(assert (= (and b!489601 res!292534) b!489599))

(assert (= (and b!489599 res!292535) b!489603))

(assert (= (and b!489603 res!292533) b!489602))

(assert (= (and b!489602 res!292540) b!489598))

(declare-fun m!469425 () Bool)

(assert (=> b!489602 m!469425))

(declare-fun m!469427 () Bool)

(assert (=> b!489602 m!469427))

(declare-fun m!469429 () Bool)

(assert (=> b!489602 m!469429))

(assert (=> b!489602 m!469425))

(declare-fun m!469431 () Bool)

(assert (=> b!489602 m!469431))

(declare-fun m!469433 () Bool)

(assert (=> b!489602 m!469433))

(assert (=> b!489602 m!469431))

(declare-fun m!469435 () Bool)

(assert (=> b!489602 m!469435))

(assert (=> b!489602 m!469425))

(declare-fun m!469437 () Bool)

(assert (=> b!489602 m!469437))

(declare-fun m!469439 () Bool)

(assert (=> b!489602 m!469439))

(assert (=> b!489602 m!469431))

(declare-fun m!469441 () Bool)

(assert (=> b!489602 m!469441))

(declare-fun m!469443 () Bool)

(assert (=> b!489599 m!469443))

(declare-fun m!469445 () Bool)

(assert (=> b!489605 m!469445))

(declare-fun m!469447 () Bool)

(assert (=> b!489601 m!469447))

(declare-fun m!469449 () Bool)

(assert (=> start!44630 m!469449))

(declare-fun m!469451 () Bool)

(assert (=> start!44630 m!469451))

(declare-fun m!469453 () Bool)

(assert (=> b!489603 m!469453))

(assert (=> b!489597 m!469431))

(assert (=> b!489597 m!469431))

(declare-fun m!469455 () Bool)

(assert (=> b!489597 m!469455))

(assert (=> b!489598 m!469431))

(assert (=> b!489598 m!469431))

(declare-fun m!469457 () Bool)

(assert (=> b!489598 m!469457))

(declare-fun m!469459 () Bool)

(assert (=> b!489600 m!469459))

(check-sat (not b!489601) (not b!489602) (not b!489603) (not b!489599) (not b!489605) (not b!489600) (not start!44630) (not b!489597) (not b!489598))
(check-sat)
