; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44622 () Bool)

(assert start!44622)

(declare-fun b!489380 () Bool)

(declare-fun res!292461 () Bool)

(declare-fun e!287783 () Bool)

(assert (=> b!489380 (=> (not res!292461) (not e!287783))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31691 0))(
  ( (array!31692 (arr!15233 (Array (_ BitVec 32) (_ BitVec 64))) (size!15598 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31691)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!489380 (= res!292461 (and (= (size!15598 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15598 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15598 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489381 () Bool)

(declare-fun res!292458 () Bool)

(declare-fun e!287781 () Bool)

(assert (=> b!489381 (=> (not res!292458) (not e!287781))))

(declare-datatypes ((List!9430 0))(
  ( (Nil!9427) (Cons!9426 (h!10288 (_ BitVec 64)) (t!15649 List!9430)) )
))
(declare-fun arrayNoDuplicates!0 (array!31691 (_ BitVec 32) List!9430) Bool)

(assert (=> b!489381 (= res!292458 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9427))))

(declare-fun b!489383 () Bool)

(declare-fun res!292460 () Bool)

(assert (=> b!489383 (=> (not res!292460) (not e!287783))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489383 (= res!292460 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489384 () Bool)

(assert (=> b!489384 (= e!287783 e!287781)))

(declare-fun res!292464 () Bool)

(assert (=> b!489384 (=> (not res!292464) (not e!287781))))

(declare-datatypes ((SeekEntryResult!3697 0))(
  ( (MissingZero!3697 (index!16967 (_ BitVec 32))) (Found!3697 (index!16968 (_ BitVec 32))) (Intermediate!3697 (undefined!4509 Bool) (index!16969 (_ BitVec 32)) (x!46086 (_ BitVec 32))) (Undefined!3697) (MissingVacant!3697 (index!16970 (_ BitVec 32))) )
))
(declare-fun lt!220733 () SeekEntryResult!3697)

(assert (=> b!489384 (= res!292464 (or (= lt!220733 (MissingZero!3697 i!1204)) (= lt!220733 (MissingVacant!3697 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31691 (_ BitVec 32)) SeekEntryResult!3697)

(assert (=> b!489384 (= lt!220733 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489385 () Bool)

(declare-fun res!292466 () Bool)

(assert (=> b!489385 (=> (not res!292466) (not e!287781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31691 (_ BitVec 32)) Bool)

(assert (=> b!489385 (= res!292466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489386 () Bool)

(declare-fun res!292459 () Bool)

(assert (=> b!489386 (=> (not res!292459) (not e!287783))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489386 (= res!292459 (validKeyInArray!0 k0!2280))))

(declare-fun b!489382 () Bool)

(declare-fun e!287782 () Bool)

(assert (=> b!489382 (= e!287782 (= (seekEntryOrOpen!0 (select (arr!15233 a!3235) j!176) a!3235 mask!3524) (Found!3697 j!176)))))

(declare-fun res!292462 () Bool)

(assert (=> start!44622 (=> (not res!292462) (not e!287783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44622 (= res!292462 (validMask!0 mask!3524))))

(assert (=> start!44622 e!287783))

(assert (=> start!44622 true))

(declare-fun array_inv!11116 (array!31691) Bool)

(assert (=> start!44622 (array_inv!11116 a!3235)))

(declare-fun b!489387 () Bool)

(declare-fun res!292465 () Bool)

(assert (=> b!489387 (=> (not res!292465) (not e!287783))))

(assert (=> b!489387 (= res!292465 (validKeyInArray!0 (select (arr!15233 a!3235) j!176)))))

(declare-fun b!489388 () Bool)

(assert (=> b!489388 (= e!287781 (not true))))

(declare-fun lt!220737 () (_ BitVec 32))

(declare-fun lt!220734 () SeekEntryResult!3697)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31691 (_ BitVec 32)) SeekEntryResult!3697)

(assert (=> b!489388 (= lt!220734 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220737 (select (store (arr!15233 a!3235) i!1204 k0!2280) j!176) (array!31692 (store (arr!15233 a!3235) i!1204 k0!2280) (size!15598 a!3235)) mask!3524))))

(declare-fun lt!220736 () SeekEntryResult!3697)

(declare-fun lt!220738 () (_ BitVec 32))

(assert (=> b!489388 (= lt!220736 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220738 (select (arr!15233 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489388 (= lt!220737 (toIndex!0 (select (store (arr!15233 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489388 (= lt!220738 (toIndex!0 (select (arr!15233 a!3235) j!176) mask!3524))))

(assert (=> b!489388 e!287782))

(declare-fun res!292463 () Bool)

(assert (=> b!489388 (=> (not res!292463) (not e!287782))))

(assert (=> b!489388 (= res!292463 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14326 0))(
  ( (Unit!14327) )
))
(declare-fun lt!220735 () Unit!14326)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31691 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14326)

(assert (=> b!489388 (= lt!220735 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44622 res!292462) b!489380))

(assert (= (and b!489380 res!292461) b!489387))

(assert (= (and b!489387 res!292465) b!489386))

(assert (= (and b!489386 res!292459) b!489383))

(assert (= (and b!489383 res!292460) b!489384))

(assert (= (and b!489384 res!292464) b!489385))

(assert (= (and b!489385 res!292466) b!489381))

(assert (= (and b!489381 res!292458) b!489388))

(assert (= (and b!489388 res!292463) b!489382))

(declare-fun m!468745 () Bool)

(assert (=> start!44622 m!468745))

(declare-fun m!468747 () Bool)

(assert (=> start!44622 m!468747))

(declare-fun m!468749 () Bool)

(assert (=> b!489384 m!468749))

(declare-fun m!468751 () Bool)

(assert (=> b!489383 m!468751))

(declare-fun m!468753 () Bool)

(assert (=> b!489386 m!468753))

(declare-fun m!468755 () Bool)

(assert (=> b!489382 m!468755))

(assert (=> b!489382 m!468755))

(declare-fun m!468757 () Bool)

(assert (=> b!489382 m!468757))

(declare-fun m!468759 () Bool)

(assert (=> b!489388 m!468759))

(declare-fun m!468761 () Bool)

(assert (=> b!489388 m!468761))

(declare-fun m!468763 () Bool)

(assert (=> b!489388 m!468763))

(assert (=> b!489388 m!468755))

(declare-fun m!468765 () Bool)

(assert (=> b!489388 m!468765))

(assert (=> b!489388 m!468755))

(declare-fun m!468767 () Bool)

(assert (=> b!489388 m!468767))

(assert (=> b!489388 m!468763))

(declare-fun m!468769 () Bool)

(assert (=> b!489388 m!468769))

(assert (=> b!489388 m!468763))

(declare-fun m!468771 () Bool)

(assert (=> b!489388 m!468771))

(assert (=> b!489388 m!468755))

(declare-fun m!468773 () Bool)

(assert (=> b!489388 m!468773))

(assert (=> b!489387 m!468755))

(assert (=> b!489387 m!468755))

(declare-fun m!468775 () Bool)

(assert (=> b!489387 m!468775))

(declare-fun m!468777 () Bool)

(assert (=> b!489381 m!468777))

(declare-fun m!468779 () Bool)

(assert (=> b!489385 m!468779))

(check-sat (not b!489384) (not b!489385) (not start!44622) (not b!489381) (not b!489382) (not b!489387) (not b!489383) (not b!489386) (not b!489388))
(check-sat)
