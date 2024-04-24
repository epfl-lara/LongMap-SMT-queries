; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50256 () Bool)

(assert start!50256)

(declare-fun b!549777 () Bool)

(declare-fun e!317522 () Bool)

(assert (=> b!549777 (= e!317522 false)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34656 0))(
  ( (array!34657 (arr!16642 (Array (_ BitVec 32) (_ BitVec 64))) (size!17006 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34656)

(declare-fun lt!250327 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5047 0))(
  ( (MissingZero!5047 (index!22415 (_ BitVec 32))) (Found!5047 (index!22416 (_ BitVec 32))) (Intermediate!5047 (undefined!5859 Bool) (index!22417 (_ BitVec 32)) (x!51500 (_ BitVec 32))) (Undefined!5047) (MissingVacant!5047 (index!22418 (_ BitVec 32))) )
))
(declare-fun lt!250330 () SeekEntryResult!5047)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34656 (_ BitVec 32)) SeekEntryResult!5047)

(assert (=> b!549777 (= lt!250330 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250327 (select (store (arr!16642 a!3118) i!1132 k0!1914) j!142) (array!34657 (store (arr!16642 a!3118) i!1132 k0!1914) (size!17006 a!3118)) mask!3119))))

(declare-fun lt!250328 () (_ BitVec 32))

(declare-fun lt!250329 () SeekEntryResult!5047)

(assert (=> b!549777 (= lt!250329 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250328 (select (arr!16642 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549777 (= lt!250327 (toIndex!0 (select (store (arr!16642 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!549777 (= lt!250328 (toIndex!0 (select (arr!16642 a!3118) j!142) mask!3119))))

(declare-fun b!549778 () Bool)

(declare-fun res!342821 () Bool)

(declare-fun e!317521 () Bool)

(assert (=> b!549778 (=> (not res!342821) (not e!317521))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549778 (= res!342821 (validKeyInArray!0 k0!1914))))

(declare-fun b!549779 () Bool)

(declare-fun res!342822 () Bool)

(assert (=> b!549779 (=> (not res!342822) (not e!317521))))

(assert (=> b!549779 (= res!342822 (and (= (size!17006 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17006 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17006 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!342820 () Bool)

(assert (=> start!50256 (=> (not res!342820) (not e!317521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50256 (= res!342820 (validMask!0 mask!3119))))

(assert (=> start!50256 e!317521))

(assert (=> start!50256 true))

(declare-fun array_inv!12501 (array!34656) Bool)

(assert (=> start!50256 (array_inv!12501 a!3118)))

(declare-fun b!549780 () Bool)

(declare-fun res!342817 () Bool)

(assert (=> b!549780 (=> (not res!342817) (not e!317522))))

(declare-datatypes ((List!10629 0))(
  ( (Nil!10626) (Cons!10625 (h!11601 (_ BitVec 64)) (t!16849 List!10629)) )
))
(declare-fun arrayNoDuplicates!0 (array!34656 (_ BitVec 32) List!10629) Bool)

(assert (=> b!549780 (= res!342817 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10626))))

(declare-fun b!549781 () Bool)

(declare-fun res!342819 () Bool)

(assert (=> b!549781 (=> (not res!342819) (not e!317521))))

(declare-fun arrayContainsKey!0 (array!34656 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549781 (= res!342819 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549782 () Bool)

(declare-fun res!342816 () Bool)

(assert (=> b!549782 (=> (not res!342816) (not e!317521))))

(assert (=> b!549782 (= res!342816 (validKeyInArray!0 (select (arr!16642 a!3118) j!142)))))

(declare-fun b!549783 () Bool)

(declare-fun res!342818 () Bool)

(assert (=> b!549783 (=> (not res!342818) (not e!317522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34656 (_ BitVec 32)) Bool)

(assert (=> b!549783 (= res!342818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549784 () Bool)

(assert (=> b!549784 (= e!317521 e!317522)))

(declare-fun res!342823 () Bool)

(assert (=> b!549784 (=> (not res!342823) (not e!317522))))

(declare-fun lt!250326 () SeekEntryResult!5047)

(assert (=> b!549784 (= res!342823 (or (= lt!250326 (MissingZero!5047 i!1132)) (= lt!250326 (MissingVacant!5047 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34656 (_ BitVec 32)) SeekEntryResult!5047)

(assert (=> b!549784 (= lt!250326 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!50256 res!342820) b!549779))

(assert (= (and b!549779 res!342822) b!549782))

(assert (= (and b!549782 res!342816) b!549778))

(assert (= (and b!549778 res!342821) b!549781))

(assert (= (and b!549781 res!342819) b!549784))

(assert (= (and b!549784 res!342823) b!549783))

(assert (= (and b!549783 res!342818) b!549780))

(assert (= (and b!549780 res!342817) b!549777))

(declare-fun m!526799 () Bool)

(assert (=> b!549777 m!526799))

(declare-fun m!526801 () Bool)

(assert (=> b!549777 m!526801))

(assert (=> b!549777 m!526799))

(declare-fun m!526803 () Bool)

(assert (=> b!549777 m!526803))

(assert (=> b!549777 m!526803))

(declare-fun m!526805 () Bool)

(assert (=> b!549777 m!526805))

(declare-fun m!526807 () Bool)

(assert (=> b!549777 m!526807))

(assert (=> b!549777 m!526799))

(declare-fun m!526809 () Bool)

(assert (=> b!549777 m!526809))

(assert (=> b!549777 m!526803))

(declare-fun m!526811 () Bool)

(assert (=> b!549777 m!526811))

(assert (=> b!549782 m!526799))

(assert (=> b!549782 m!526799))

(declare-fun m!526813 () Bool)

(assert (=> b!549782 m!526813))

(declare-fun m!526815 () Bool)

(assert (=> b!549780 m!526815))

(declare-fun m!526817 () Bool)

(assert (=> b!549781 m!526817))

(declare-fun m!526819 () Bool)

(assert (=> b!549778 m!526819))

(declare-fun m!526821 () Bool)

(assert (=> b!549783 m!526821))

(declare-fun m!526823 () Bool)

(assert (=> b!549784 m!526823))

(declare-fun m!526825 () Bool)

(assert (=> start!50256 m!526825))

(declare-fun m!526827 () Bool)

(assert (=> start!50256 m!526827))

(check-sat (not b!549783) (not start!50256) (not b!549782) (not b!549780) (not b!549784) (not b!549781) (not b!549778) (not b!549777))
(check-sat)
