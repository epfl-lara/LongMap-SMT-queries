; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44358 () Bool)

(assert start!44358)

(declare-fun b!487364 () Bool)

(declare-fun res!290785 () Bool)

(declare-fun e!286748 () Bool)

(assert (=> b!487364 (=> (not res!290785) (not e!286748))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31574 0))(
  ( (array!31575 (arr!15179 (Array (_ BitVec 32) (_ BitVec 64))) (size!15544 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31574)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!487364 (= res!290785 (and (= (size!15544 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15544 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15544 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!290783 () Bool)

(assert (=> start!44358 (=> (not res!290783) (not e!286748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44358 (= res!290783 (validMask!0 mask!3524))))

(assert (=> start!44358 e!286748))

(assert (=> start!44358 true))

(declare-fun array_inv!11062 (array!31574) Bool)

(assert (=> start!44358 (array_inv!11062 a!3235)))

(declare-fun b!487365 () Bool)

(declare-fun res!290782 () Bool)

(assert (=> b!487365 (=> (not res!290782) (not e!286748))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487365 (= res!290782 (validKeyInArray!0 (select (arr!15179 a!3235) j!176)))))

(declare-fun b!487366 () Bool)

(declare-fun res!290784 () Bool)

(assert (=> b!487366 (=> (not res!290784) (not e!286748))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31574 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487366 (= res!290784 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487367 () Bool)

(declare-fun e!286747 () Bool)

(declare-datatypes ((SeekEntryResult!3643 0))(
  ( (MissingZero!3643 (index!16751 (_ BitVec 32))) (Found!3643 (index!16752 (_ BitVec 32))) (Intermediate!3643 (undefined!4455 Bool) (index!16753 (_ BitVec 32)) (x!45882 (_ BitVec 32))) (Undefined!3643) (MissingVacant!3643 (index!16754 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31574 (_ BitVec 32)) SeekEntryResult!3643)

(assert (=> b!487367 (= e!286747 (= (seekEntryOrOpen!0 (select (arr!15179 a!3235) j!176) a!3235 mask!3524) (Found!3643 j!176)))))

(declare-fun b!487368 () Bool)

(declare-fun res!290786 () Bool)

(declare-fun e!286746 () Bool)

(assert (=> b!487368 (=> (not res!290786) (not e!286746))))

(declare-datatypes ((List!9376 0))(
  ( (Nil!9373) (Cons!9372 (h!10228 (_ BitVec 64)) (t!15595 List!9376)) )
))
(declare-fun arrayNoDuplicates!0 (array!31574 (_ BitVec 32) List!9376) Bool)

(assert (=> b!487368 (= res!290786 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9373))))

(declare-fun b!487369 () Bool)

(declare-fun res!290781 () Bool)

(assert (=> b!487369 (=> (not res!290781) (not e!286748))))

(assert (=> b!487369 (= res!290781 (validKeyInArray!0 k0!2280))))

(declare-fun b!487370 () Bool)

(assert (=> b!487370 (= e!286748 e!286746)))

(declare-fun res!290778 () Bool)

(assert (=> b!487370 (=> (not res!290778) (not e!286746))))

(declare-fun lt!219872 () SeekEntryResult!3643)

(assert (=> b!487370 (= res!290778 (or (= lt!219872 (MissingZero!3643 i!1204)) (= lt!219872 (MissingVacant!3643 i!1204))))))

(assert (=> b!487370 (= lt!219872 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!487371 () Bool)

(assert (=> b!487371 (= e!286746 (not true))))

(declare-fun lt!219873 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!487371 (= lt!219873 (toIndex!0 (select (arr!15179 a!3235) j!176) mask!3524))))

(assert (=> b!487371 e!286747))

(declare-fun res!290779 () Bool)

(assert (=> b!487371 (=> (not res!290779) (not e!286747))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31574 (_ BitVec 32)) Bool)

(assert (=> b!487371 (= res!290779 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14218 0))(
  ( (Unit!14219) )
))
(declare-fun lt!219874 () Unit!14218)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31574 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14218)

(assert (=> b!487371 (= lt!219874 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487372 () Bool)

(declare-fun res!290780 () Bool)

(assert (=> b!487372 (=> (not res!290780) (not e!286746))))

(assert (=> b!487372 (= res!290780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44358 res!290783) b!487364))

(assert (= (and b!487364 res!290785) b!487365))

(assert (= (and b!487365 res!290782) b!487369))

(assert (= (and b!487369 res!290781) b!487366))

(assert (= (and b!487366 res!290784) b!487370))

(assert (= (and b!487370 res!290778) b!487372))

(assert (= (and b!487372 res!290780) b!487368))

(assert (= (and b!487368 res!290786) b!487371))

(assert (= (and b!487371 res!290779) b!487367))

(declare-fun m!466675 () Bool)

(assert (=> b!487370 m!466675))

(declare-fun m!466677 () Bool)

(assert (=> b!487366 m!466677))

(declare-fun m!466679 () Bool)

(assert (=> start!44358 m!466679))

(declare-fun m!466681 () Bool)

(assert (=> start!44358 m!466681))

(declare-fun m!466683 () Bool)

(assert (=> b!487371 m!466683))

(assert (=> b!487371 m!466683))

(declare-fun m!466685 () Bool)

(assert (=> b!487371 m!466685))

(declare-fun m!466687 () Bool)

(assert (=> b!487371 m!466687))

(declare-fun m!466689 () Bool)

(assert (=> b!487371 m!466689))

(assert (=> b!487365 m!466683))

(assert (=> b!487365 m!466683))

(declare-fun m!466691 () Bool)

(assert (=> b!487365 m!466691))

(declare-fun m!466693 () Bool)

(assert (=> b!487369 m!466693))

(assert (=> b!487367 m!466683))

(assert (=> b!487367 m!466683))

(declare-fun m!466695 () Bool)

(assert (=> b!487367 m!466695))

(declare-fun m!466697 () Bool)

(assert (=> b!487372 m!466697))

(declare-fun m!466699 () Bool)

(assert (=> b!487368 m!466699))

(check-sat (not b!487370) (not start!44358) (not b!487369) (not b!487365) (not b!487371) (not b!487367) (not b!487366) (not b!487368) (not b!487372))
(check-sat)
