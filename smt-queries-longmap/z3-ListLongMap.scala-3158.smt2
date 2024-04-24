; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44510 () Bool)

(assert start!44510)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31621 0))(
  ( (array!31622 (arr!15199 (Array (_ BitVec 32) (_ BitVec 64))) (size!15563 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31621)

(declare-fun e!287422 () Bool)

(declare-fun b!488588 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3622 0))(
  ( (MissingZero!3622 (index!16667 (_ BitVec 32))) (Found!3622 (index!16668 (_ BitVec 32))) (Intermediate!3622 (undefined!4434 Bool) (index!16669 (_ BitVec 32)) (x!45930 (_ BitVec 32))) (Undefined!3622) (MissingVacant!3622 (index!16670 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31621 (_ BitVec 32)) SeekEntryResult!3622)

(assert (=> b!488588 (= e!287422 (= (seekEntryOrOpen!0 (select (arr!15199 a!3235) j!176) a!3235 mask!3524) (Found!3622 j!176)))))

(declare-fun b!488589 () Bool)

(declare-fun res!291694 () Bool)

(declare-fun e!287421 () Bool)

(assert (=> b!488589 (=> (not res!291694) (not e!287421))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488589 (= res!291694 (validKeyInArray!0 k0!2280))))

(declare-fun b!488590 () Bool)

(declare-fun res!291695 () Bool)

(assert (=> b!488590 (=> (not res!291695) (not e!287421))))

(assert (=> b!488590 (= res!291695 (validKeyInArray!0 (select (arr!15199 a!3235) j!176)))))

(declare-fun res!291691 () Bool)

(assert (=> start!44510 (=> (not res!291691) (not e!287421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44510 (= res!291691 (validMask!0 mask!3524))))

(assert (=> start!44510 e!287421))

(assert (=> start!44510 true))

(declare-fun array_inv!11058 (array!31621) Bool)

(assert (=> start!44510 (array_inv!11058 a!3235)))

(declare-fun b!488591 () Bool)

(declare-fun e!287424 () Bool)

(assert (=> b!488591 (= e!287424 (not true))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!220498 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488591 (= lt!220498 (toIndex!0 (select (store (arr!15199 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!488591 e!287422))

(declare-fun res!291697 () Bool)

(assert (=> b!488591 (=> (not res!291697) (not e!287422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31621 (_ BitVec 32)) Bool)

(assert (=> b!488591 (= res!291697 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14251 0))(
  ( (Unit!14252) )
))
(declare-fun lt!220497 () Unit!14251)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31621 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14251)

(assert (=> b!488591 (= lt!220497 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488592 () Bool)

(declare-fun res!291693 () Bool)

(assert (=> b!488592 (=> (not res!291693) (not e!287424))))

(declare-datatypes ((List!9264 0))(
  ( (Nil!9261) (Cons!9260 (h!10119 (_ BitVec 64)) (t!15484 List!9264)) )
))
(declare-fun arrayNoDuplicates!0 (array!31621 (_ BitVec 32) List!9264) Bool)

(assert (=> b!488592 (= res!291693 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9261))))

(declare-fun b!488593 () Bool)

(declare-fun res!291689 () Bool)

(assert (=> b!488593 (=> (not res!291689) (not e!287424))))

(assert (=> b!488593 (= res!291689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488594 () Bool)

(assert (=> b!488594 (= e!287421 e!287424)))

(declare-fun res!291696 () Bool)

(assert (=> b!488594 (=> (not res!291696) (not e!287424))))

(declare-fun lt!220496 () SeekEntryResult!3622)

(assert (=> b!488594 (= res!291696 (or (= lt!220496 (MissingZero!3622 i!1204)) (= lt!220496 (MissingVacant!3622 i!1204))))))

(assert (=> b!488594 (= lt!220496 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!488595 () Bool)

(declare-fun res!291690 () Bool)

(assert (=> b!488595 (=> (not res!291690) (not e!287421))))

(declare-fun arrayContainsKey!0 (array!31621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488595 (= res!291690 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488596 () Bool)

(declare-fun res!291692 () Bool)

(assert (=> b!488596 (=> (not res!291692) (not e!287421))))

(assert (=> b!488596 (= res!291692 (and (= (size!15563 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15563 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15563 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44510 res!291691) b!488596))

(assert (= (and b!488596 res!291692) b!488590))

(assert (= (and b!488590 res!291695) b!488589))

(assert (= (and b!488589 res!291694) b!488595))

(assert (= (and b!488595 res!291690) b!488594))

(assert (= (and b!488594 res!291696) b!488593))

(assert (= (and b!488593 res!291689) b!488592))

(assert (= (and b!488592 res!291693) b!488591))

(assert (= (and b!488591 res!291697) b!488588))

(declare-fun m!468541 () Bool)

(assert (=> b!488593 m!468541))

(declare-fun m!468543 () Bool)

(assert (=> b!488595 m!468543))

(declare-fun m!468545 () Bool)

(assert (=> b!488591 m!468545))

(declare-fun m!468547 () Bool)

(assert (=> b!488591 m!468547))

(declare-fun m!468549 () Bool)

(assert (=> b!488591 m!468549))

(declare-fun m!468551 () Bool)

(assert (=> b!488591 m!468551))

(assert (=> b!488591 m!468549))

(declare-fun m!468553 () Bool)

(assert (=> b!488591 m!468553))

(declare-fun m!468555 () Bool)

(assert (=> b!488594 m!468555))

(declare-fun m!468557 () Bool)

(assert (=> b!488589 m!468557))

(declare-fun m!468559 () Bool)

(assert (=> start!44510 m!468559))

(declare-fun m!468561 () Bool)

(assert (=> start!44510 m!468561))

(declare-fun m!468563 () Bool)

(assert (=> b!488590 m!468563))

(assert (=> b!488590 m!468563))

(declare-fun m!468565 () Bool)

(assert (=> b!488590 m!468565))

(assert (=> b!488588 m!468563))

(assert (=> b!488588 m!468563))

(declare-fun m!468567 () Bool)

(assert (=> b!488588 m!468567))

(declare-fun m!468569 () Bool)

(assert (=> b!488592 m!468569))

(check-sat (not b!488593) (not b!488589) (not b!488588) (not b!488590) (not b!488592) (not start!44510) (not b!488591) (not b!488594) (not b!488595))
(check-sat)
