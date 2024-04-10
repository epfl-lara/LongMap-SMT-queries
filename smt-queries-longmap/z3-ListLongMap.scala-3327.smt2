; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45956 () Bool)

(assert start!45956)

(declare-fun res!309555 () Bool)

(declare-fun e!297594 () Bool)

(assert (=> start!45956 (=> (not res!309555) (not e!297594))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45956 (= res!309555 (validMask!0 mask!3524))))

(assert (=> start!45956 e!297594))

(assert (=> start!45956 true))

(declare-datatypes ((array!32667 0))(
  ( (array!32668 (arr!15712 (Array (_ BitVec 32) (_ BitVec 64))) (size!16076 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32667)

(declare-fun array_inv!11508 (array!32667) Bool)

(assert (=> start!45956 (array_inv!11508 a!3235)))

(declare-fun b!508704 () Bool)

(declare-fun res!309550 () Bool)

(assert (=> b!508704 (=> (not res!309550) (not e!297594))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508704 (= res!309550 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508705 () Bool)

(declare-fun e!297595 () Bool)

(assert (=> b!508705 (= e!297594 e!297595)))

(declare-fun res!309549 () Bool)

(assert (=> b!508705 (=> (not res!309549) (not e!297595))))

(declare-datatypes ((SeekEntryResult!4179 0))(
  ( (MissingZero!4179 (index!18904 (_ BitVec 32))) (Found!4179 (index!18905 (_ BitVec 32))) (Intermediate!4179 (undefined!4991 Bool) (index!18906 (_ BitVec 32)) (x!47884 (_ BitVec 32))) (Undefined!4179) (MissingVacant!4179 (index!18907 (_ BitVec 32))) )
))
(declare-fun lt!232333 () SeekEntryResult!4179)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508705 (= res!309549 (or (= lt!232333 (MissingZero!4179 i!1204)) (= lt!232333 (MissingVacant!4179 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32667 (_ BitVec 32)) SeekEntryResult!4179)

(assert (=> b!508705 (= lt!232333 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508706 () Bool)

(declare-fun res!309553 () Bool)

(assert (=> b!508706 (=> (not res!309553) (not e!297595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32667 (_ BitVec 32)) Bool)

(assert (=> b!508706 (= res!309553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508707 () Bool)

(assert (=> b!508707 (= e!297595 (not true))))

(declare-fun e!297596 () Bool)

(assert (=> b!508707 e!297596))

(declare-fun res!309552 () Bool)

(assert (=> b!508707 (=> (not res!309552) (not e!297596))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!508707 (= res!309552 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15616 0))(
  ( (Unit!15617) )
))
(declare-fun lt!232332 () Unit!15616)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32667 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15616)

(assert (=> b!508707 (= lt!232332 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508708 () Bool)

(declare-fun res!309557 () Bool)

(assert (=> b!508708 (=> (not res!309557) (not e!297594))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508708 (= res!309557 (validKeyInArray!0 k0!2280))))

(declare-fun b!508709 () Bool)

(assert (=> b!508709 (= e!297596 (= (seekEntryOrOpen!0 (select (arr!15712 a!3235) j!176) a!3235 mask!3524) (Found!4179 j!176)))))

(declare-fun b!508710 () Bool)

(declare-fun res!309556 () Bool)

(assert (=> b!508710 (=> (not res!309556) (not e!297594))))

(assert (=> b!508710 (= res!309556 (validKeyInArray!0 (select (arr!15712 a!3235) j!176)))))

(declare-fun b!508711 () Bool)

(declare-fun res!309554 () Bool)

(assert (=> b!508711 (=> (not res!309554) (not e!297595))))

(declare-datatypes ((List!9870 0))(
  ( (Nil!9867) (Cons!9866 (h!10743 (_ BitVec 64)) (t!16098 List!9870)) )
))
(declare-fun arrayNoDuplicates!0 (array!32667 (_ BitVec 32) List!9870) Bool)

(assert (=> b!508711 (= res!309554 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9867))))

(declare-fun b!508712 () Bool)

(declare-fun res!309551 () Bool)

(assert (=> b!508712 (=> (not res!309551) (not e!297594))))

(assert (=> b!508712 (= res!309551 (and (= (size!16076 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16076 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16076 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45956 res!309555) b!508712))

(assert (= (and b!508712 res!309551) b!508710))

(assert (= (and b!508710 res!309556) b!508708))

(assert (= (and b!508708 res!309557) b!508704))

(assert (= (and b!508704 res!309550) b!508705))

(assert (= (and b!508705 res!309549) b!508706))

(assert (= (and b!508706 res!309553) b!508711))

(assert (= (and b!508711 res!309554) b!508707))

(assert (= (and b!508707 res!309552) b!508709))

(declare-fun m!489453 () Bool)

(assert (=> b!508705 m!489453))

(declare-fun m!489455 () Bool)

(assert (=> b!508711 m!489455))

(declare-fun m!489457 () Bool)

(assert (=> b!508710 m!489457))

(assert (=> b!508710 m!489457))

(declare-fun m!489459 () Bool)

(assert (=> b!508710 m!489459))

(declare-fun m!489461 () Bool)

(assert (=> b!508707 m!489461))

(declare-fun m!489463 () Bool)

(assert (=> b!508707 m!489463))

(assert (=> b!508709 m!489457))

(assert (=> b!508709 m!489457))

(declare-fun m!489465 () Bool)

(assert (=> b!508709 m!489465))

(declare-fun m!489467 () Bool)

(assert (=> b!508706 m!489467))

(declare-fun m!489469 () Bool)

(assert (=> start!45956 m!489469))

(declare-fun m!489471 () Bool)

(assert (=> start!45956 m!489471))

(declare-fun m!489473 () Bool)

(assert (=> b!508704 m!489473))

(declare-fun m!489475 () Bool)

(assert (=> b!508708 m!489475))

(check-sat (not b!508705) (not b!508709) (not b!508711) (not b!508704) (not b!508706) (not start!45956) (not b!508707) (not b!508708) (not b!508710))
(check-sat)
