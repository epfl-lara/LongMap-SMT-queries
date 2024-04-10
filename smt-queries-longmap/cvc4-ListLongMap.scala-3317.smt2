; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45850 () Bool)

(assert start!45850)

(declare-fun b!507808 () Bool)

(declare-fun res!308771 () Bool)

(declare-fun e!297168 () Bool)

(assert (=> b!507808 (=> (not res!308771) (not e!297168))))

(declare-datatypes ((array!32606 0))(
  ( (array!32607 (arr!15683 (Array (_ BitVec 32) (_ BitVec 64))) (size!16047 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32606)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32606 (_ BitVec 32)) Bool)

(assert (=> b!507808 (= res!308771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!297166 () Bool)

(declare-fun b!507809 () Bool)

(declare-datatypes ((SeekEntryResult!4150 0))(
  ( (MissingZero!4150 (index!18788 (_ BitVec 32))) (Found!4150 (index!18789 (_ BitVec 32))) (Intermediate!4150 (undefined!4962 Bool) (index!18790 (_ BitVec 32)) (x!47775 (_ BitVec 32))) (Undefined!4150) (MissingVacant!4150 (index!18791 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32606 (_ BitVec 32)) SeekEntryResult!4150)

(assert (=> b!507809 (= e!297166 (= (seekEntryOrOpen!0 (select (arr!15683 a!3235) j!176) a!3235 mask!3524) (Found!4150 j!176)))))

(declare-fun b!507810 () Bool)

(declare-fun res!308770 () Bool)

(assert (=> b!507810 (=> (not res!308770) (not e!297168))))

(declare-datatypes ((List!9841 0))(
  ( (Nil!9838) (Cons!9837 (h!10714 (_ BitVec 64)) (t!16069 List!9841)) )
))
(declare-fun arrayNoDuplicates!0 (array!32606 (_ BitVec 32) List!9841) Bool)

(assert (=> b!507810 (= res!308770 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9838))))

(declare-fun b!507811 () Bool)

(declare-fun res!308768 () Bool)

(declare-fun e!297165 () Bool)

(assert (=> b!507811 (=> (not res!308768) (not e!297165))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507811 (= res!308768 (validKeyInArray!0 k!2280))))

(declare-fun b!507812 () Bool)

(declare-fun e!297163 () Bool)

(assert (=> b!507812 (= e!297163 true)))

(declare-fun lt!232029 () SeekEntryResult!4150)

(declare-fun lt!232026 () array!32606)

(declare-fun lt!232033 () (_ BitVec 64))

(assert (=> b!507812 (= lt!232029 (seekEntryOrOpen!0 lt!232033 lt!232026 mask!3524))))

(assert (=> b!507812 false))

(declare-fun b!507813 () Bool)

(declare-fun e!297164 () Bool)

(assert (=> b!507813 (= e!297164 e!297163)))

(declare-fun res!308769 () Bool)

(assert (=> b!507813 (=> res!308769 e!297163)))

(declare-fun lt!232031 () Bool)

(declare-fun lt!232027 () SeekEntryResult!4150)

(assert (=> b!507813 (= res!308769 (or (and (not lt!232031) (undefined!4962 lt!232027)) (and (not lt!232031) (not (undefined!4962 lt!232027)))))))

(assert (=> b!507813 (= lt!232031 (not (is-Intermediate!4150 lt!232027)))))

(declare-fun b!507814 () Bool)

(assert (=> b!507814 (= e!297165 e!297168)))

(declare-fun res!308777 () Bool)

(assert (=> b!507814 (=> (not res!308777) (not e!297168))))

(declare-fun lt!232032 () SeekEntryResult!4150)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507814 (= res!308777 (or (= lt!232032 (MissingZero!4150 i!1204)) (= lt!232032 (MissingVacant!4150 i!1204))))))

(assert (=> b!507814 (= lt!232032 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!507815 () Bool)

(declare-fun res!308772 () Bool)

(assert (=> b!507815 (=> (not res!308772) (not e!297165))))

(assert (=> b!507815 (= res!308772 (and (= (size!16047 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16047 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16047 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507816 () Bool)

(declare-fun res!308767 () Bool)

(assert (=> b!507816 (=> (not res!308767) (not e!297165))))

(declare-fun arrayContainsKey!0 (array!32606 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507816 (= res!308767 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507817 () Bool)

(assert (=> b!507817 (= e!297168 (not e!297164))))

(declare-fun res!308774 () Bool)

(assert (=> b!507817 (=> res!308774 e!297164)))

(declare-fun lt!232030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32606 (_ BitVec 32)) SeekEntryResult!4150)

(assert (=> b!507817 (= res!308774 (= lt!232027 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232030 lt!232033 lt!232026 mask!3524)))))

(declare-fun lt!232025 () (_ BitVec 32))

(assert (=> b!507817 (= lt!232027 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232025 (select (arr!15683 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507817 (= lt!232030 (toIndex!0 lt!232033 mask!3524))))

(assert (=> b!507817 (= lt!232033 (select (store (arr!15683 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!507817 (= lt!232025 (toIndex!0 (select (arr!15683 a!3235) j!176) mask!3524))))

(assert (=> b!507817 (= lt!232026 (array!32607 (store (arr!15683 a!3235) i!1204 k!2280) (size!16047 a!3235)))))

(assert (=> b!507817 e!297166))

(declare-fun res!308776 () Bool)

(assert (=> b!507817 (=> (not res!308776) (not e!297166))))

(assert (=> b!507817 (= res!308776 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15588 0))(
  ( (Unit!15589) )
))
(declare-fun lt!232028 () Unit!15588)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32606 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15588)

(assert (=> b!507817 (= lt!232028 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!308775 () Bool)

(assert (=> start!45850 (=> (not res!308775) (not e!297165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45850 (= res!308775 (validMask!0 mask!3524))))

(assert (=> start!45850 e!297165))

(assert (=> start!45850 true))

(declare-fun array_inv!11479 (array!32606) Bool)

(assert (=> start!45850 (array_inv!11479 a!3235)))

(declare-fun b!507818 () Bool)

(declare-fun res!308773 () Bool)

(assert (=> b!507818 (=> (not res!308773) (not e!297165))))

(assert (=> b!507818 (= res!308773 (validKeyInArray!0 (select (arr!15683 a!3235) j!176)))))

(assert (= (and start!45850 res!308775) b!507815))

(assert (= (and b!507815 res!308772) b!507818))

(assert (= (and b!507818 res!308773) b!507811))

(assert (= (and b!507811 res!308768) b!507816))

(assert (= (and b!507816 res!308767) b!507814))

(assert (= (and b!507814 res!308777) b!507808))

(assert (= (and b!507808 res!308771) b!507810))

(assert (= (and b!507810 res!308770) b!507817))

(assert (= (and b!507817 res!308776) b!507809))

(assert (= (and b!507817 (not res!308774)) b!507813))

(assert (= (and b!507813 (not res!308769)) b!507812))

(declare-fun m!488635 () Bool)

(assert (=> start!45850 m!488635))

(declare-fun m!488637 () Bool)

(assert (=> start!45850 m!488637))

(declare-fun m!488639 () Bool)

(assert (=> b!507818 m!488639))

(assert (=> b!507818 m!488639))

(declare-fun m!488641 () Bool)

(assert (=> b!507818 m!488641))

(assert (=> b!507809 m!488639))

(assert (=> b!507809 m!488639))

(declare-fun m!488643 () Bool)

(assert (=> b!507809 m!488643))

(declare-fun m!488645 () Bool)

(assert (=> b!507810 m!488645))

(declare-fun m!488647 () Bool)

(assert (=> b!507814 m!488647))

(declare-fun m!488649 () Bool)

(assert (=> b!507808 m!488649))

(declare-fun m!488651 () Bool)

(assert (=> b!507817 m!488651))

(declare-fun m!488653 () Bool)

(assert (=> b!507817 m!488653))

(declare-fun m!488655 () Bool)

(assert (=> b!507817 m!488655))

(declare-fun m!488657 () Bool)

(assert (=> b!507817 m!488657))

(assert (=> b!507817 m!488639))

(declare-fun m!488659 () Bool)

(assert (=> b!507817 m!488659))

(declare-fun m!488661 () Bool)

(assert (=> b!507817 m!488661))

(assert (=> b!507817 m!488639))

(declare-fun m!488663 () Bool)

(assert (=> b!507817 m!488663))

(assert (=> b!507817 m!488639))

(declare-fun m!488665 () Bool)

(assert (=> b!507817 m!488665))

(declare-fun m!488667 () Bool)

(assert (=> b!507816 m!488667))

(declare-fun m!488669 () Bool)

(assert (=> b!507812 m!488669))

(declare-fun m!488671 () Bool)

(assert (=> b!507811 m!488671))

(push 1)

