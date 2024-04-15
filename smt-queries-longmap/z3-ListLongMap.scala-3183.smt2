; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44712 () Bool)

(assert start!44712)

(declare-fun b!490595 () Bool)

(declare-fun res!293674 () Bool)

(declare-fun e!288321 () Bool)

(assert (=> b!490595 (=> (not res!293674) (not e!288321))))

(declare-datatypes ((array!31781 0))(
  ( (array!31782 (arr!15278 (Array (_ BitVec 32) (_ BitVec 64))) (size!15643 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31781)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31781 (_ BitVec 32)) Bool)

(assert (=> b!490595 (= res!293674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490596 () Bool)

(declare-fun res!293676 () Bool)

(declare-fun e!288324 () Bool)

(assert (=> b!490596 (=> (not res!293676) (not e!288324))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31781 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490596 (= res!293676 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490597 () Bool)

(declare-fun res!293678 () Bool)

(assert (=> b!490597 (=> (not res!293678) (not e!288324))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490597 (= res!293678 (validKeyInArray!0 (select (arr!15278 a!3235) j!176)))))

(declare-fun b!490598 () Bool)

(declare-fun res!293673 () Bool)

(assert (=> b!490598 (=> (not res!293673) (not e!288321))))

(declare-datatypes ((List!9475 0))(
  ( (Nil!9472) (Cons!9471 (h!10333 (_ BitVec 64)) (t!15694 List!9475)) )
))
(declare-fun arrayNoDuplicates!0 (array!31781 (_ BitVec 32) List!9475) Bool)

(assert (=> b!490598 (= res!293673 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9472))))

(declare-fun res!293679 () Bool)

(assert (=> start!44712 (=> (not res!293679) (not e!288324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44712 (= res!293679 (validMask!0 mask!3524))))

(assert (=> start!44712 e!288324))

(assert (=> start!44712 true))

(declare-fun array_inv!11161 (array!31781) Bool)

(assert (=> start!44712 (array_inv!11161 a!3235)))

(declare-fun b!490599 () Bool)

(declare-fun e!288323 () Bool)

(assert (=> b!490599 (= e!288321 (not e!288323))))

(declare-fun res!293681 () Bool)

(assert (=> b!490599 (=> res!293681 e!288323)))

(declare-fun lt!221548 () (_ BitVec 64))

(declare-fun lt!221544 () array!31781)

(declare-datatypes ((SeekEntryResult!3742 0))(
  ( (MissingZero!3742 (index!17147 (_ BitVec 32))) (Found!3742 (index!17148 (_ BitVec 32))) (Intermediate!3742 (undefined!4554 Bool) (index!17149 (_ BitVec 32)) (x!46251 (_ BitVec 32))) (Undefined!3742) (MissingVacant!3742 (index!17150 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31781 (_ BitVec 32)) SeekEntryResult!3742)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490599 (= res!293681 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15278 a!3235) j!176) mask!3524) (select (arr!15278 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221548 mask!3524) lt!221548 lt!221544 mask!3524))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490599 (= lt!221548 (select (store (arr!15278 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490599 (= lt!221544 (array!31782 (store (arr!15278 a!3235) i!1204 k0!2280) (size!15643 a!3235)))))

(declare-fun lt!221546 () SeekEntryResult!3742)

(assert (=> b!490599 (= lt!221546 (Found!3742 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31781 (_ BitVec 32)) SeekEntryResult!3742)

(assert (=> b!490599 (= lt!221546 (seekEntryOrOpen!0 (select (arr!15278 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!490599 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14416 0))(
  ( (Unit!14417) )
))
(declare-fun lt!221543 () Unit!14416)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31781 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14416)

(assert (=> b!490599 (= lt!221543 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490600 () Bool)

(declare-fun res!293680 () Bool)

(assert (=> b!490600 (=> (not res!293680) (not e!288324))))

(assert (=> b!490600 (= res!293680 (and (= (size!15643 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15643 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15643 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490601 () Bool)

(assert (=> b!490601 (= e!288324 e!288321)))

(declare-fun res!293677 () Bool)

(assert (=> b!490601 (=> (not res!293677) (not e!288321))))

(declare-fun lt!221545 () SeekEntryResult!3742)

(assert (=> b!490601 (= res!293677 (or (= lt!221545 (MissingZero!3742 i!1204)) (= lt!221545 (MissingVacant!3742 i!1204))))))

(assert (=> b!490601 (= lt!221545 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490602 () Bool)

(assert (=> b!490602 (= e!288323 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!490602 (= lt!221546 (seekEntryOrOpen!0 lt!221548 lt!221544 mask!3524))))

(declare-fun lt!221547 () Unit!14416)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31781 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14416)

(assert (=> b!490602 (= lt!221547 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!490603 () Bool)

(declare-fun res!293675 () Bool)

(assert (=> b!490603 (=> (not res!293675) (not e!288324))))

(assert (=> b!490603 (= res!293675 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44712 res!293679) b!490600))

(assert (= (and b!490600 res!293680) b!490597))

(assert (= (and b!490597 res!293678) b!490603))

(assert (= (and b!490603 res!293675) b!490596))

(assert (= (and b!490596 res!293676) b!490601))

(assert (= (and b!490601 res!293677) b!490595))

(assert (= (and b!490595 res!293674) b!490598))

(assert (= (and b!490598 res!293673) b!490599))

(assert (= (and b!490599 (not res!293681)) b!490602))

(declare-fun m!470425 () Bool)

(assert (=> b!490601 m!470425))

(declare-fun m!470427 () Bool)

(assert (=> b!490599 m!470427))

(declare-fun m!470429 () Bool)

(assert (=> b!490599 m!470429))

(declare-fun m!470431 () Bool)

(assert (=> b!490599 m!470431))

(declare-fun m!470433 () Bool)

(assert (=> b!490599 m!470433))

(declare-fun m!470435 () Bool)

(assert (=> b!490599 m!470435))

(declare-fun m!470437 () Bool)

(assert (=> b!490599 m!470437))

(declare-fun m!470439 () Bool)

(assert (=> b!490599 m!470439))

(assert (=> b!490599 m!470435))

(assert (=> b!490599 m!470433))

(assert (=> b!490599 m!470435))

(declare-fun m!470441 () Bool)

(assert (=> b!490599 m!470441))

(assert (=> b!490599 m!470435))

(declare-fun m!470443 () Bool)

(assert (=> b!490599 m!470443))

(assert (=> b!490599 m!470439))

(declare-fun m!470445 () Bool)

(assert (=> b!490599 m!470445))

(declare-fun m!470447 () Bool)

(assert (=> b!490598 m!470447))

(declare-fun m!470449 () Bool)

(assert (=> start!44712 m!470449))

(declare-fun m!470451 () Bool)

(assert (=> start!44712 m!470451))

(declare-fun m!470453 () Bool)

(assert (=> b!490602 m!470453))

(declare-fun m!470455 () Bool)

(assert (=> b!490602 m!470455))

(assert (=> b!490597 m!470435))

(assert (=> b!490597 m!470435))

(declare-fun m!470457 () Bool)

(assert (=> b!490597 m!470457))

(declare-fun m!470459 () Bool)

(assert (=> b!490596 m!470459))

(declare-fun m!470461 () Bool)

(assert (=> b!490603 m!470461))

(declare-fun m!470463 () Bool)

(assert (=> b!490595 m!470463))

(check-sat (not b!490596) (not b!490599) (not b!490603) (not b!490597) (not b!490595) (not b!490601) (not b!490598) (not b!490602) (not start!44712))
(check-sat)
