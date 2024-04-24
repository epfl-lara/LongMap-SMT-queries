; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45950 () Bool)

(assert start!45950)

(declare-fun b!508697 () Bool)

(declare-fun e!297579 () Bool)

(declare-fun e!297582 () Bool)

(assert (=> b!508697 (= e!297579 e!297582)))

(declare-fun res!309600 () Bool)

(assert (=> b!508697 (=> (not res!309600) (not e!297582))))

(declare-datatypes ((SeekEntryResult!4132 0))(
  ( (MissingZero!4132 (index!18716 (_ BitVec 32))) (Found!4132 (index!18717 (_ BitVec 32))) (Intermediate!4132 (undefined!4944 Bool) (index!18718 (_ BitVec 32)) (x!47842 (_ BitVec 32))) (Undefined!4132) (MissingVacant!4132 (index!18719 (_ BitVec 32))) )
))
(declare-fun lt!232360 () SeekEntryResult!4132)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508697 (= res!309600 (or (= lt!232360 (MissingZero!4132 i!1204)) (= lt!232360 (MissingVacant!4132 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32662 0))(
  ( (array!32663 (arr!15709 (Array (_ BitVec 32) (_ BitVec 64))) (size!16073 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32662)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32662 (_ BitVec 32)) SeekEntryResult!4132)

(assert (=> b!508697 (= lt!232360 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508698 () Bool)

(assert (=> b!508698 (= e!297582 (not true))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!232358 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!508698 (= lt!232358 (toIndex!0 (select (arr!15709 a!3235) j!176) mask!3524))))

(declare-fun e!297581 () Bool)

(assert (=> b!508698 e!297581))

(declare-fun res!309599 () Bool)

(assert (=> b!508698 (=> (not res!309599) (not e!297581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32662 (_ BitVec 32)) Bool)

(assert (=> b!508698 (= res!309599 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15583 0))(
  ( (Unit!15584) )
))
(declare-fun lt!232359 () Unit!15583)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32662 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15583)

(assert (=> b!508698 (= lt!232359 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508700 () Bool)

(declare-fun res!309602 () Bool)

(assert (=> b!508700 (=> (not res!309602) (not e!297579))))

(declare-fun arrayContainsKey!0 (array!32662 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508700 (= res!309602 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508701 () Bool)

(declare-fun res!309598 () Bool)

(assert (=> b!508701 (=> (not res!309598) (not e!297582))))

(assert (=> b!508701 (= res!309598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508702 () Bool)

(declare-fun res!309596 () Bool)

(assert (=> b!508702 (=> (not res!309596) (not e!297579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508702 (= res!309596 (validKeyInArray!0 (select (arr!15709 a!3235) j!176)))))

(declare-fun b!508703 () Bool)

(declare-fun res!309604 () Bool)

(assert (=> b!508703 (=> (not res!309604) (not e!297579))))

(assert (=> b!508703 (= res!309604 (validKeyInArray!0 k0!2280))))

(declare-fun b!508704 () Bool)

(declare-fun res!309597 () Bool)

(assert (=> b!508704 (=> (not res!309597) (not e!297582))))

(declare-datatypes ((List!9774 0))(
  ( (Nil!9771) (Cons!9770 (h!10647 (_ BitVec 64)) (t!15994 List!9774)) )
))
(declare-fun arrayNoDuplicates!0 (array!32662 (_ BitVec 32) List!9774) Bool)

(assert (=> b!508704 (= res!309597 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9771))))

(declare-fun b!508705 () Bool)

(assert (=> b!508705 (= e!297581 (= (seekEntryOrOpen!0 (select (arr!15709 a!3235) j!176) a!3235 mask!3524) (Found!4132 j!176)))))

(declare-fun res!309601 () Bool)

(assert (=> start!45950 (=> (not res!309601) (not e!297579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45950 (= res!309601 (validMask!0 mask!3524))))

(assert (=> start!45950 e!297579))

(assert (=> start!45950 true))

(declare-fun array_inv!11568 (array!32662) Bool)

(assert (=> start!45950 (array_inv!11568 a!3235)))

(declare-fun b!508699 () Bool)

(declare-fun res!309603 () Bool)

(assert (=> b!508699 (=> (not res!309603) (not e!297579))))

(assert (=> b!508699 (= res!309603 (and (= (size!16073 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16073 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16073 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45950 res!309601) b!508699))

(assert (= (and b!508699 res!309603) b!508702))

(assert (= (and b!508702 res!309596) b!508703))

(assert (= (and b!508703 res!309604) b!508700))

(assert (= (and b!508700 res!309602) b!508697))

(assert (= (and b!508697 res!309600) b!508701))

(assert (= (and b!508701 res!309598) b!508704))

(assert (= (and b!508704 res!309597) b!508698))

(assert (= (and b!508698 res!309599) b!508705))

(declare-fun m!489685 () Bool)

(assert (=> b!508697 m!489685))

(declare-fun m!489687 () Bool)

(assert (=> b!508703 m!489687))

(declare-fun m!489689 () Bool)

(assert (=> b!508700 m!489689))

(declare-fun m!489691 () Bool)

(assert (=> start!45950 m!489691))

(declare-fun m!489693 () Bool)

(assert (=> start!45950 m!489693))

(declare-fun m!489695 () Bool)

(assert (=> b!508698 m!489695))

(assert (=> b!508698 m!489695))

(declare-fun m!489697 () Bool)

(assert (=> b!508698 m!489697))

(declare-fun m!489699 () Bool)

(assert (=> b!508698 m!489699))

(declare-fun m!489701 () Bool)

(assert (=> b!508698 m!489701))

(assert (=> b!508702 m!489695))

(assert (=> b!508702 m!489695))

(declare-fun m!489703 () Bool)

(assert (=> b!508702 m!489703))

(declare-fun m!489705 () Bool)

(assert (=> b!508704 m!489705))

(declare-fun m!489707 () Bool)

(assert (=> b!508701 m!489707))

(assert (=> b!508705 m!489695))

(assert (=> b!508705 m!489695))

(declare-fun m!489709 () Bool)

(assert (=> b!508705 m!489709))

(check-sat (not b!508697) (not start!45950) (not b!508703) (not b!508702) (not b!508704) (not b!508701) (not b!508700) (not b!508698) (not b!508705))
(check-sat)
