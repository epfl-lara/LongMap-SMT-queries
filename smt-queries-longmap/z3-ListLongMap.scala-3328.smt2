; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45962 () Bool)

(assert start!45962)

(declare-fun b!508785 () Bool)

(declare-fun res!309630 () Bool)

(declare-fun e!297631 () Bool)

(assert (=> b!508785 (=> (not res!309630) (not e!297631))))

(declare-datatypes ((array!32673 0))(
  ( (array!32674 (arr!15715 (Array (_ BitVec 32) (_ BitVec 64))) (size!16079 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32673)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508785 (= res!309630 (validKeyInArray!0 (select (arr!15715 a!3235) j!176)))))

(declare-fun b!508786 () Bool)

(declare-fun res!309634 () Bool)

(assert (=> b!508786 (=> (not res!309634) (not e!297631))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!508786 (= res!309634 (validKeyInArray!0 k0!2280))))

(declare-fun b!508787 () Bool)

(declare-fun e!297630 () Bool)

(assert (=> b!508787 (= e!297631 e!297630)))

(declare-fun res!309637 () Bool)

(assert (=> b!508787 (=> (not res!309637) (not e!297630))))

(declare-datatypes ((SeekEntryResult!4182 0))(
  ( (MissingZero!4182 (index!18916 (_ BitVec 32))) (Found!4182 (index!18917 (_ BitVec 32))) (Intermediate!4182 (undefined!4994 Bool) (index!18918 (_ BitVec 32)) (x!47895 (_ BitVec 32))) (Undefined!4182) (MissingVacant!4182 (index!18919 (_ BitVec 32))) )
))
(declare-fun lt!232355 () SeekEntryResult!4182)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508787 (= res!309637 (or (= lt!232355 (MissingZero!4182 i!1204)) (= lt!232355 (MissingVacant!4182 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32673 (_ BitVec 32)) SeekEntryResult!4182)

(assert (=> b!508787 (= lt!232355 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508788 () Bool)

(assert (=> b!508788 (= e!297630 (not true))))

(declare-fun lt!232357 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!508788 (= lt!232357 (toIndex!0 (select (arr!15715 a!3235) j!176) mask!3524))))

(declare-fun e!297633 () Bool)

(assert (=> b!508788 e!297633))

(declare-fun res!309631 () Bool)

(assert (=> b!508788 (=> (not res!309631) (not e!297633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32673 (_ BitVec 32)) Bool)

(assert (=> b!508788 (= res!309631 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15622 0))(
  ( (Unit!15623) )
))
(declare-fun lt!232356 () Unit!15622)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32673 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15622)

(assert (=> b!508788 (= lt!232356 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508789 () Bool)

(declare-fun res!309633 () Bool)

(assert (=> b!508789 (=> (not res!309633) (not e!297630))))

(declare-datatypes ((List!9873 0))(
  ( (Nil!9870) (Cons!9869 (h!10746 (_ BitVec 64)) (t!16101 List!9873)) )
))
(declare-fun arrayNoDuplicates!0 (array!32673 (_ BitVec 32) List!9873) Bool)

(assert (=> b!508789 (= res!309633 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9870))))

(declare-fun b!508790 () Bool)

(assert (=> b!508790 (= e!297633 (= (seekEntryOrOpen!0 (select (arr!15715 a!3235) j!176) a!3235 mask!3524) (Found!4182 j!176)))))

(declare-fun res!309635 () Bool)

(assert (=> start!45962 (=> (not res!309635) (not e!297631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45962 (= res!309635 (validMask!0 mask!3524))))

(assert (=> start!45962 e!297631))

(assert (=> start!45962 true))

(declare-fun array_inv!11511 (array!32673) Bool)

(assert (=> start!45962 (array_inv!11511 a!3235)))

(declare-fun b!508791 () Bool)

(declare-fun res!309638 () Bool)

(assert (=> b!508791 (=> (not res!309638) (not e!297631))))

(assert (=> b!508791 (= res!309638 (and (= (size!16079 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16079 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16079 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508792 () Bool)

(declare-fun res!309632 () Bool)

(assert (=> b!508792 (=> (not res!309632) (not e!297631))))

(declare-fun arrayContainsKey!0 (array!32673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508792 (= res!309632 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508793 () Bool)

(declare-fun res!309636 () Bool)

(assert (=> b!508793 (=> (not res!309636) (not e!297630))))

(assert (=> b!508793 (= res!309636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45962 res!309635) b!508791))

(assert (= (and b!508791 res!309638) b!508785))

(assert (= (and b!508785 res!309630) b!508786))

(assert (= (and b!508786 res!309634) b!508792))

(assert (= (and b!508792 res!309632) b!508787))

(assert (= (and b!508787 res!309637) b!508793))

(assert (= (and b!508793 res!309636) b!508789))

(assert (= (and b!508789 res!309633) b!508788))

(assert (= (and b!508788 res!309631) b!508790))

(declare-fun m!489527 () Bool)

(assert (=> b!508786 m!489527))

(declare-fun m!489529 () Bool)

(assert (=> b!508787 m!489529))

(declare-fun m!489531 () Bool)

(assert (=> b!508785 m!489531))

(assert (=> b!508785 m!489531))

(declare-fun m!489533 () Bool)

(assert (=> b!508785 m!489533))

(declare-fun m!489535 () Bool)

(assert (=> b!508793 m!489535))

(declare-fun m!489537 () Bool)

(assert (=> b!508792 m!489537))

(declare-fun m!489539 () Bool)

(assert (=> start!45962 m!489539))

(declare-fun m!489541 () Bool)

(assert (=> start!45962 m!489541))

(assert (=> b!508790 m!489531))

(assert (=> b!508790 m!489531))

(declare-fun m!489543 () Bool)

(assert (=> b!508790 m!489543))

(declare-fun m!489545 () Bool)

(assert (=> b!508789 m!489545))

(assert (=> b!508788 m!489531))

(assert (=> b!508788 m!489531))

(declare-fun m!489547 () Bool)

(assert (=> b!508788 m!489547))

(declare-fun m!489549 () Bool)

(assert (=> b!508788 m!489549))

(declare-fun m!489551 () Bool)

(assert (=> b!508788 m!489551))

(check-sat (not b!508788) (not b!508793) (not b!508785) (not b!508792) (not b!508790) (not start!45962) (not b!508789) (not b!508786) (not b!508787))
(check-sat)
