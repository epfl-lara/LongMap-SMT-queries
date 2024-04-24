; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45938 () Bool)

(assert start!45938)

(declare-fun b!508535 () Bool)

(declare-fun res!309441 () Bool)

(declare-fun e!297507 () Bool)

(assert (=> b!508535 (=> (not res!309441) (not e!297507))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32650 0))(
  ( (array!32651 (arr!15703 (Array (_ BitVec 32) (_ BitVec 64))) (size!16067 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32650)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!508535 (= res!309441 (and (= (size!16067 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16067 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16067 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508536 () Bool)

(declare-fun res!309439 () Bool)

(assert (=> b!508536 (=> (not res!309439) (not e!297507))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508536 (= res!309439 (validKeyInArray!0 k0!2280))))

(declare-fun e!297508 () Bool)

(declare-fun b!508537 () Bool)

(declare-datatypes ((SeekEntryResult!4126 0))(
  ( (MissingZero!4126 (index!18692 (_ BitVec 32))) (Found!4126 (index!18693 (_ BitVec 32))) (Intermediate!4126 (undefined!4938 Bool) (index!18694 (_ BitVec 32)) (x!47820 (_ BitVec 32))) (Undefined!4126) (MissingVacant!4126 (index!18695 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32650 (_ BitVec 32)) SeekEntryResult!4126)

(assert (=> b!508537 (= e!297508 (= (seekEntryOrOpen!0 (select (arr!15703 a!3235) j!176) a!3235 mask!3524) (Found!4126 j!176)))))

(declare-fun b!508538 () Bool)

(declare-fun e!297509 () Bool)

(assert (=> b!508538 (= e!297507 e!297509)))

(declare-fun res!309438 () Bool)

(assert (=> b!508538 (=> (not res!309438) (not e!297509))))

(declare-fun lt!232321 () SeekEntryResult!4126)

(assert (=> b!508538 (= res!309438 (or (= lt!232321 (MissingZero!4126 i!1204)) (= lt!232321 (MissingVacant!4126 i!1204))))))

(assert (=> b!508538 (= lt!232321 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!309437 () Bool)

(assert (=> start!45938 (=> (not res!309437) (not e!297507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45938 (= res!309437 (validMask!0 mask!3524))))

(assert (=> start!45938 e!297507))

(assert (=> start!45938 true))

(declare-fun array_inv!11562 (array!32650) Bool)

(assert (=> start!45938 (array_inv!11562 a!3235)))

(declare-fun b!508539 () Bool)

(declare-fun res!309436 () Bool)

(assert (=> b!508539 (=> (not res!309436) (not e!297507))))

(declare-fun arrayContainsKey!0 (array!32650 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508539 (= res!309436 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508540 () Bool)

(declare-fun res!309442 () Bool)

(assert (=> b!508540 (=> (not res!309442) (not e!297509))))

(declare-datatypes ((List!9768 0))(
  ( (Nil!9765) (Cons!9764 (h!10641 (_ BitVec 64)) (t!15988 List!9768)) )
))
(declare-fun arrayNoDuplicates!0 (array!32650 (_ BitVec 32) List!9768) Bool)

(assert (=> b!508540 (= res!309442 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9765))))

(declare-fun b!508541 () Bool)

(declare-fun res!309440 () Bool)

(assert (=> b!508541 (=> (not res!309440) (not e!297509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32650 (_ BitVec 32)) Bool)

(assert (=> b!508541 (= res!309440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508542 () Bool)

(declare-fun res!309435 () Bool)

(assert (=> b!508542 (=> (not res!309435) (not e!297507))))

(assert (=> b!508542 (= res!309435 (validKeyInArray!0 (select (arr!15703 a!3235) j!176)))))

(declare-fun b!508543 () Bool)

(assert (=> b!508543 (= e!297509 (not true))))

(assert (=> b!508543 e!297508))

(declare-fun res!309434 () Bool)

(assert (=> b!508543 (=> (not res!309434) (not e!297508))))

(assert (=> b!508543 (= res!309434 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15571 0))(
  ( (Unit!15572) )
))
(declare-fun lt!232320 () Unit!15571)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32650 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15571)

(assert (=> b!508543 (= lt!232320 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45938 res!309437) b!508535))

(assert (= (and b!508535 res!309441) b!508542))

(assert (= (and b!508542 res!309435) b!508536))

(assert (= (and b!508536 res!309439) b!508539))

(assert (= (and b!508539 res!309436) b!508538))

(assert (= (and b!508538 res!309438) b!508541))

(assert (= (and b!508541 res!309440) b!508540))

(assert (= (and b!508540 res!309442) b!508543))

(assert (= (and b!508543 res!309434) b!508537))

(declare-fun m!489541 () Bool)

(assert (=> b!508536 m!489541))

(declare-fun m!489543 () Bool)

(assert (=> b!508538 m!489543))

(declare-fun m!489545 () Bool)

(assert (=> b!508540 m!489545))

(declare-fun m!489547 () Bool)

(assert (=> b!508537 m!489547))

(assert (=> b!508537 m!489547))

(declare-fun m!489549 () Bool)

(assert (=> b!508537 m!489549))

(declare-fun m!489551 () Bool)

(assert (=> b!508543 m!489551))

(declare-fun m!489553 () Bool)

(assert (=> b!508543 m!489553))

(declare-fun m!489555 () Bool)

(assert (=> b!508541 m!489555))

(declare-fun m!489557 () Bool)

(assert (=> start!45938 m!489557))

(declare-fun m!489559 () Bool)

(assert (=> start!45938 m!489559))

(declare-fun m!489561 () Bool)

(assert (=> b!508539 m!489561))

(assert (=> b!508542 m!489547))

(assert (=> b!508542 m!489547))

(declare-fun m!489563 () Bool)

(assert (=> b!508542 m!489563))

(check-sat (not b!508537) (not b!508542) (not b!508536) (not b!508539) (not b!508543) (not start!45938) (not b!508541) (not b!508538) (not b!508540))
(check-sat)
