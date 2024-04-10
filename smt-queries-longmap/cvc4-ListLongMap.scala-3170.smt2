; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44650 () Bool)

(assert start!44650)

(declare-fun b!489867 () Bool)

(declare-fun res!292809 () Bool)

(declare-fun e!288053 () Bool)

(assert (=> b!489867 (=> (not res!292809) (not e!288053))))

(declare-datatypes ((array!31709 0))(
  ( (array!31710 (arr!15242 (Array (_ BitVec 32) (_ BitVec 64))) (size!15606 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31709)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489867 (= res!292809 (validKeyInArray!0 (select (arr!15242 a!3235) j!176)))))

(declare-fun b!489868 () Bool)

(declare-fun res!292808 () Bool)

(assert (=> b!489868 (=> (not res!292808) (not e!288053))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!489868 (= res!292808 (validKeyInArray!0 k!2280))))

(declare-fun b!489869 () Bool)

(declare-fun res!292805 () Bool)

(assert (=> b!489869 (=> (not res!292805) (not e!288053))))

(declare-fun arrayContainsKey!0 (array!31709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489869 (= res!292805 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489870 () Bool)

(declare-fun res!292810 () Bool)

(declare-fun e!288052 () Bool)

(assert (=> b!489870 (=> (not res!292810) (not e!288052))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31709 (_ BitVec 32)) Bool)

(assert (=> b!489870 (= res!292810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!292806 () Bool)

(assert (=> start!44650 (=> (not res!292806) (not e!288053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44650 (= res!292806 (validMask!0 mask!3524))))

(assert (=> start!44650 e!288053))

(assert (=> start!44650 true))

(declare-fun array_inv!11038 (array!31709) Bool)

(assert (=> start!44650 (array_inv!11038 a!3235)))

(declare-fun b!489871 () Bool)

(assert (=> b!489871 (= e!288053 e!288052)))

(declare-fun res!292811 () Bool)

(assert (=> b!489871 (=> (not res!292811) (not e!288052))))

(declare-datatypes ((SeekEntryResult!3709 0))(
  ( (MissingZero!3709 (index!17015 (_ BitVec 32))) (Found!3709 (index!17016 (_ BitVec 32))) (Intermediate!3709 (undefined!4521 Bool) (index!17017 (_ BitVec 32)) (x!46119 (_ BitVec 32))) (Undefined!3709) (MissingVacant!3709 (index!17018 (_ BitVec 32))) )
))
(declare-fun lt!221115 () SeekEntryResult!3709)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489871 (= res!292811 (or (= lt!221115 (MissingZero!3709 i!1204)) (= lt!221115 (MissingVacant!3709 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31709 (_ BitVec 32)) SeekEntryResult!3709)

(assert (=> b!489871 (= lt!221115 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun e!288051 () Bool)

(declare-fun b!489872 () Bool)

(assert (=> b!489872 (= e!288051 (= (seekEntryOrOpen!0 (select (arr!15242 a!3235) j!176) a!3235 mask!3524) (Found!3709 j!176)))))

(declare-fun b!489873 () Bool)

(declare-fun res!292803 () Bool)

(assert (=> b!489873 (=> (not res!292803) (not e!288052))))

(declare-datatypes ((List!9400 0))(
  ( (Nil!9397) (Cons!9396 (h!10258 (_ BitVec 64)) (t!15628 List!9400)) )
))
(declare-fun arrayNoDuplicates!0 (array!31709 (_ BitVec 32) List!9400) Bool)

(assert (=> b!489873 (= res!292803 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9397))))

(declare-fun b!489874 () Bool)

(declare-fun res!292804 () Bool)

(assert (=> b!489874 (=> (not res!292804) (not e!288053))))

(assert (=> b!489874 (= res!292804 (and (= (size!15606 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15606 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15606 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489875 () Bool)

(assert (=> b!489875 (= e!288052 (not true))))

(declare-fun lt!221112 () SeekEntryResult!3709)

(declare-fun lt!221114 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31709 (_ BitVec 32)) SeekEntryResult!3709)

(assert (=> b!489875 (= lt!221112 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221114 (select (store (arr!15242 a!3235) i!1204 k!2280) j!176) (array!31710 (store (arr!15242 a!3235) i!1204 k!2280) (size!15606 a!3235)) mask!3524))))

(declare-fun lt!221116 () SeekEntryResult!3709)

(declare-fun lt!221113 () (_ BitVec 32))

(assert (=> b!489875 (= lt!221116 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221113 (select (arr!15242 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489875 (= lt!221114 (toIndex!0 (select (store (arr!15242 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!489875 (= lt!221113 (toIndex!0 (select (arr!15242 a!3235) j!176) mask!3524))))

(assert (=> b!489875 e!288051))

(declare-fun res!292807 () Bool)

(assert (=> b!489875 (=> (not res!292807) (not e!288051))))

(assert (=> b!489875 (= res!292807 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14364 0))(
  ( (Unit!14365) )
))
(declare-fun lt!221111 () Unit!14364)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31709 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14364)

(assert (=> b!489875 (= lt!221111 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44650 res!292806) b!489874))

(assert (= (and b!489874 res!292804) b!489867))

(assert (= (and b!489867 res!292809) b!489868))

(assert (= (and b!489868 res!292808) b!489869))

(assert (= (and b!489869 res!292805) b!489871))

(assert (= (and b!489871 res!292811) b!489870))

(assert (= (and b!489870 res!292810) b!489873))

(assert (= (and b!489873 res!292803) b!489875))

(assert (= (and b!489875 res!292807) b!489872))

(declare-fun m!469785 () Bool)

(assert (=> b!489870 m!469785))

(declare-fun m!469787 () Bool)

(assert (=> b!489873 m!469787))

(declare-fun m!469789 () Bool)

(assert (=> b!489871 m!469789))

(declare-fun m!469791 () Bool)

(assert (=> b!489875 m!469791))

(declare-fun m!469793 () Bool)

(assert (=> b!489875 m!469793))

(declare-fun m!469795 () Bool)

(assert (=> b!489875 m!469795))

(declare-fun m!469797 () Bool)

(assert (=> b!489875 m!469797))

(declare-fun m!469799 () Bool)

(assert (=> b!489875 m!469799))

(assert (=> b!489875 m!469797))

(assert (=> b!489875 m!469797))

(declare-fun m!469801 () Bool)

(assert (=> b!489875 m!469801))

(assert (=> b!489875 m!469795))

(declare-fun m!469803 () Bool)

(assert (=> b!489875 m!469803))

(assert (=> b!489875 m!469795))

(declare-fun m!469805 () Bool)

(assert (=> b!489875 m!469805))

(declare-fun m!469807 () Bool)

(assert (=> b!489875 m!469807))

(declare-fun m!469809 () Bool)

(assert (=> start!44650 m!469809))

(declare-fun m!469811 () Bool)

(assert (=> start!44650 m!469811))

(assert (=> b!489867 m!469797))

(assert (=> b!489867 m!469797))

(declare-fun m!469813 () Bool)

(assert (=> b!489867 m!469813))

(declare-fun m!469815 () Bool)

(assert (=> b!489868 m!469815))

(declare-fun m!469817 () Bool)

(assert (=> b!489869 m!469817))

(assert (=> b!489872 m!469797))

(assert (=> b!489872 m!469797))

(declare-fun m!469819 () Bool)

(assert (=> b!489872 m!469819))

(push 1)

(assert (not start!44650))

(assert (not b!489867))

(assert (not b!489872))

(assert (not b!489869))

(assert (not b!489875))

(assert (not b!489870))

(assert (not b!489871))

(assert (not b!489873))

(assert (not b!489868))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

