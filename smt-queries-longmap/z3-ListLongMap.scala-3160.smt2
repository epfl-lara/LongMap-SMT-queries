; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44522 () Bool)

(assert start!44522)

(declare-fun b!488750 () Bool)

(declare-fun res!291856 () Bool)

(declare-fun e!287496 () Bool)

(assert (=> b!488750 (=> (not res!291856) (not e!287496))))

(declare-datatypes ((array!31633 0))(
  ( (array!31634 (arr!15205 (Array (_ BitVec 32) (_ BitVec 64))) (size!15569 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31633)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488750 (= res!291856 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488751 () Bool)

(declare-fun res!291858 () Bool)

(assert (=> b!488751 (=> (not res!291858) (not e!287496))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488751 (= res!291858 (validKeyInArray!0 (select (arr!15205 a!3235) j!176)))))

(declare-fun res!291855 () Bool)

(assert (=> start!44522 (=> (not res!291855) (not e!287496))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44522 (= res!291855 (validMask!0 mask!3524))))

(assert (=> start!44522 e!287496))

(assert (=> start!44522 true))

(declare-fun array_inv!11064 (array!31633) Bool)

(assert (=> start!44522 (array_inv!11064 a!3235)))

(declare-fun b!488752 () Bool)

(declare-fun e!287493 () Bool)

(declare-datatypes ((SeekEntryResult!3628 0))(
  ( (MissingZero!3628 (index!16691 (_ BitVec 32))) (Found!3628 (index!16692 (_ BitVec 32))) (Intermediate!3628 (undefined!4440 Bool) (index!16693 (_ BitVec 32)) (x!45952 (_ BitVec 32))) (Undefined!3628) (MissingVacant!3628 (index!16694 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31633 (_ BitVec 32)) SeekEntryResult!3628)

(assert (=> b!488752 (= e!287493 (= (seekEntryOrOpen!0 (select (arr!15205 a!3235) j!176) a!3235 mask!3524) (Found!3628 j!176)))))

(declare-fun b!488753 () Bool)

(declare-fun res!291853 () Bool)

(declare-fun e!287494 () Bool)

(assert (=> b!488753 (=> (not res!291853) (not e!287494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31633 (_ BitVec 32)) Bool)

(assert (=> b!488753 (= res!291853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488754 () Bool)

(declare-fun res!291852 () Bool)

(assert (=> b!488754 (=> (not res!291852) (not e!287496))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488754 (= res!291852 (and (= (size!15569 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15569 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15569 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488755 () Bool)

(assert (=> b!488755 (= e!287496 e!287494)))

(declare-fun res!291854 () Bool)

(assert (=> b!488755 (=> (not res!291854) (not e!287494))))

(declare-fun lt!220550 () SeekEntryResult!3628)

(assert (=> b!488755 (= res!291854 (or (= lt!220550 (MissingZero!3628 i!1204)) (= lt!220550 (MissingVacant!3628 i!1204))))))

(assert (=> b!488755 (= lt!220550 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!488756 () Bool)

(declare-fun res!291857 () Bool)

(assert (=> b!488756 (=> (not res!291857) (not e!287494))))

(declare-datatypes ((List!9270 0))(
  ( (Nil!9267) (Cons!9266 (h!10125 (_ BitVec 64)) (t!15490 List!9270)) )
))
(declare-fun arrayNoDuplicates!0 (array!31633 (_ BitVec 32) List!9270) Bool)

(assert (=> b!488756 (= res!291857 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9267))))

(declare-fun b!488757 () Bool)

(declare-fun res!291859 () Bool)

(assert (=> b!488757 (=> (not res!291859) (not e!287496))))

(assert (=> b!488757 (= res!291859 (validKeyInArray!0 k0!2280))))

(declare-fun b!488758 () Bool)

(assert (=> b!488758 (= e!287494 (not true))))

(declare-fun lt!220551 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488758 (= lt!220551 (toIndex!0 (select (store (arr!15205 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!488758 e!287493))

(declare-fun res!291851 () Bool)

(assert (=> b!488758 (=> (not res!291851) (not e!287493))))

(assert (=> b!488758 (= res!291851 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14263 0))(
  ( (Unit!14264) )
))
(declare-fun lt!220552 () Unit!14263)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31633 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14263)

(assert (=> b!488758 (= lt!220552 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44522 res!291855) b!488754))

(assert (= (and b!488754 res!291852) b!488751))

(assert (= (and b!488751 res!291858) b!488757))

(assert (= (and b!488757 res!291859) b!488750))

(assert (= (and b!488750 res!291856) b!488755))

(assert (= (and b!488755 res!291854) b!488753))

(assert (= (and b!488753 res!291853) b!488756))

(assert (= (and b!488756 res!291857) b!488758))

(assert (= (and b!488758 res!291851) b!488752))

(declare-fun m!468721 () Bool)

(assert (=> b!488756 m!468721))

(declare-fun m!468723 () Bool)

(assert (=> b!488758 m!468723))

(declare-fun m!468725 () Bool)

(assert (=> b!488758 m!468725))

(declare-fun m!468727 () Bool)

(assert (=> b!488758 m!468727))

(declare-fun m!468729 () Bool)

(assert (=> b!488758 m!468729))

(assert (=> b!488758 m!468727))

(declare-fun m!468731 () Bool)

(assert (=> b!488758 m!468731))

(declare-fun m!468733 () Bool)

(assert (=> b!488757 m!468733))

(declare-fun m!468735 () Bool)

(assert (=> b!488753 m!468735))

(declare-fun m!468737 () Bool)

(assert (=> b!488751 m!468737))

(assert (=> b!488751 m!468737))

(declare-fun m!468739 () Bool)

(assert (=> b!488751 m!468739))

(declare-fun m!468741 () Bool)

(assert (=> start!44522 m!468741))

(declare-fun m!468743 () Bool)

(assert (=> start!44522 m!468743))

(assert (=> b!488752 m!468737))

(assert (=> b!488752 m!468737))

(declare-fun m!468745 () Bool)

(assert (=> b!488752 m!468745))

(declare-fun m!468747 () Bool)

(assert (=> b!488755 m!468747))

(declare-fun m!468749 () Bool)

(assert (=> b!488750 m!468749))

(check-sat (not start!44522) (not b!488753) (not b!488750) (not b!488757) (not b!488755) (not b!488751) (not b!488752) (not b!488756) (not b!488758))
(check-sat)
