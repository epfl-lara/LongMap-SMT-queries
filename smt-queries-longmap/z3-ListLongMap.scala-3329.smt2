; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45956 () Bool)

(assert start!45956)

(declare-fun b!508778 () Bool)

(declare-fun res!309679 () Bool)

(declare-fun e!297615 () Bool)

(assert (=> b!508778 (=> (not res!309679) (not e!297615))))

(declare-datatypes ((array!32668 0))(
  ( (array!32669 (arr!15712 (Array (_ BitVec 32) (_ BitVec 64))) (size!16076 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32668)

(declare-datatypes ((List!9777 0))(
  ( (Nil!9774) (Cons!9773 (h!10650 (_ BitVec 64)) (t!15997 List!9777)) )
))
(declare-fun arrayNoDuplicates!0 (array!32668 (_ BitVec 32) List!9777) Bool)

(assert (=> b!508778 (= res!309679 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9774))))

(declare-fun b!508779 () Bool)

(declare-fun res!309684 () Bool)

(declare-fun e!297616 () Bool)

(assert (=> b!508779 (=> (not res!309684) (not e!297616))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508779 (= res!309684 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508780 () Bool)

(declare-fun res!309681 () Bool)

(assert (=> b!508780 (=> (not res!309681) (not e!297616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508780 (= res!309681 (validKeyInArray!0 k0!2280))))

(declare-fun b!508781 () Bool)

(assert (=> b!508781 (= e!297615 (not true))))

(declare-fun e!297617 () Bool)

(assert (=> b!508781 e!297617))

(declare-fun res!309680 () Bool)

(assert (=> b!508781 (=> (not res!309680) (not e!297617))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32668 (_ BitVec 32)) Bool)

(assert (=> b!508781 (= res!309680 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15589 0))(
  ( (Unit!15590) )
))
(declare-fun lt!232383 () Unit!15589)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32668 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15589)

(assert (=> b!508781 (= lt!232383 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508782 () Bool)

(declare-fun res!309682 () Bool)

(assert (=> b!508782 (=> (not res!309682) (not e!297615))))

(assert (=> b!508782 (= res!309682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508783 () Bool)

(declare-fun res!309683 () Bool)

(assert (=> b!508783 (=> (not res!309683) (not e!297616))))

(assert (=> b!508783 (= res!309683 (validKeyInArray!0 (select (arr!15712 a!3235) j!176)))))

(declare-fun res!309677 () Bool)

(assert (=> start!45956 (=> (not res!309677) (not e!297616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45956 (= res!309677 (validMask!0 mask!3524))))

(assert (=> start!45956 e!297616))

(assert (=> start!45956 true))

(declare-fun array_inv!11571 (array!32668) Bool)

(assert (=> start!45956 (array_inv!11571 a!3235)))

(declare-fun b!508784 () Bool)

(declare-fun res!309685 () Bool)

(assert (=> b!508784 (=> (not res!309685) (not e!297616))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508784 (= res!309685 (and (= (size!16076 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16076 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16076 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508785 () Bool)

(declare-datatypes ((SeekEntryResult!4135 0))(
  ( (MissingZero!4135 (index!18728 (_ BitVec 32))) (Found!4135 (index!18729 (_ BitVec 32))) (Intermediate!4135 (undefined!4947 Bool) (index!18730 (_ BitVec 32)) (x!47853 (_ BitVec 32))) (Undefined!4135) (MissingVacant!4135 (index!18731 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32668 (_ BitVec 32)) SeekEntryResult!4135)

(assert (=> b!508785 (= e!297617 (= (seekEntryOrOpen!0 (select (arr!15712 a!3235) j!176) a!3235 mask!3524) (Found!4135 j!176)))))

(declare-fun b!508786 () Bool)

(assert (=> b!508786 (= e!297616 e!297615)))

(declare-fun res!309678 () Bool)

(assert (=> b!508786 (=> (not res!309678) (not e!297615))))

(declare-fun lt!232384 () SeekEntryResult!4135)

(assert (=> b!508786 (= res!309678 (or (= lt!232384 (MissingZero!4135 i!1204)) (= lt!232384 (MissingVacant!4135 i!1204))))))

(assert (=> b!508786 (= lt!232384 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45956 res!309677) b!508784))

(assert (= (and b!508784 res!309685) b!508783))

(assert (= (and b!508783 res!309683) b!508780))

(assert (= (and b!508780 res!309681) b!508779))

(assert (= (and b!508779 res!309684) b!508786))

(assert (= (and b!508786 res!309678) b!508782))

(assert (= (and b!508782 res!309682) b!508778))

(assert (= (and b!508778 res!309679) b!508781))

(assert (= (and b!508781 res!309680) b!508785))

(declare-fun m!489763 () Bool)

(assert (=> b!508778 m!489763))

(declare-fun m!489765 () Bool)

(assert (=> b!508786 m!489765))

(declare-fun m!489767 () Bool)

(assert (=> b!508779 m!489767))

(declare-fun m!489769 () Bool)

(assert (=> b!508781 m!489769))

(declare-fun m!489771 () Bool)

(assert (=> b!508781 m!489771))

(declare-fun m!489773 () Bool)

(assert (=> b!508783 m!489773))

(assert (=> b!508783 m!489773))

(declare-fun m!489775 () Bool)

(assert (=> b!508783 m!489775))

(declare-fun m!489777 () Bool)

(assert (=> b!508782 m!489777))

(declare-fun m!489779 () Bool)

(assert (=> b!508780 m!489779))

(assert (=> b!508785 m!489773))

(assert (=> b!508785 m!489773))

(declare-fun m!489781 () Bool)

(assert (=> b!508785 m!489781))

(declare-fun m!489783 () Bool)

(assert (=> start!45956 m!489783))

(declare-fun m!489785 () Bool)

(assert (=> start!45956 m!489785))

(check-sat (not b!508785) (not b!508779) (not b!508778) (not b!508782) (not b!508780) (not start!45956) (not b!508786) (not b!508783) (not b!508781))
(check-sat)
