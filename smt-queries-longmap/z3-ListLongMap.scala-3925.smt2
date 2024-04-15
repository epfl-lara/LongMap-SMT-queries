; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53544 () Bool)

(assert start!53544)

(declare-fun b!582839 () Bool)

(declare-fun res!370802 () Bool)

(declare-fun e!334038 () Bool)

(assert (=> b!582839 (=> (not res!370802) (not e!334038))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36459 0))(
  ( (array!36460 (arr!17504 (Array (_ BitVec 32) (_ BitVec 64))) (size!17869 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36459)

(assert (=> b!582839 (= res!370802 (and (= (size!17869 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17869 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17869 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582840 () Bool)

(declare-fun e!334036 () Bool)

(assert (=> b!582840 (= e!334038 e!334036)))

(declare-fun res!370803 () Bool)

(assert (=> b!582840 (=> (not res!370803) (not e!334036))))

(declare-datatypes ((SeekEntryResult!5941 0))(
  ( (MissingZero!5941 (index!25991 (_ BitVec 32))) (Found!5941 (index!25992 (_ BitVec 32))) (Intermediate!5941 (undefined!6753 Bool) (index!25993 (_ BitVec 32)) (x!54845 (_ BitVec 32))) (Undefined!5941) (MissingVacant!5941 (index!25994 (_ BitVec 32))) )
))
(declare-fun lt!265029 () SeekEntryResult!5941)

(assert (=> b!582840 (= res!370803 (or (= lt!265029 (MissingZero!5941 i!1108)) (= lt!265029 (MissingVacant!5941 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36459 (_ BitVec 32)) SeekEntryResult!5941)

(assert (=> b!582840 (= lt!265029 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582841 () Bool)

(declare-fun res!370805 () Bool)

(assert (=> b!582841 (=> (not res!370805) (not e!334036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36459 (_ BitVec 32)) Bool)

(assert (=> b!582841 (= res!370805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582842 () Bool)

(declare-fun res!370801 () Bool)

(assert (=> b!582842 (=> (not res!370801) (not e!334038))))

(declare-fun arrayContainsKey!0 (array!36459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582842 (= res!370801 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582843 () Bool)

(declare-fun res!370797 () Bool)

(assert (=> b!582843 (=> (not res!370797) (not e!334036))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582843 (= res!370797 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17504 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17504 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582844 () Bool)

(declare-fun res!370800 () Bool)

(assert (=> b!582844 (=> (not res!370800) (not e!334036))))

(declare-datatypes ((List!11584 0))(
  ( (Nil!11581) (Cons!11580 (h!12625 (_ BitVec 64)) (t!17803 List!11584)) )
))
(declare-fun arrayNoDuplicates!0 (array!36459 (_ BitVec 32) List!11584) Bool)

(assert (=> b!582844 (= res!370800 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11581))))

(declare-fun b!582845 () Bool)

(declare-fun res!370798 () Bool)

(assert (=> b!582845 (=> (not res!370798) (not e!334038))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582845 (= res!370798 (validKeyInArray!0 k0!1786))))

(declare-fun res!370804 () Bool)

(assert (=> start!53544 (=> (not res!370804) (not e!334038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53544 (= res!370804 (validMask!0 mask!3053))))

(assert (=> start!53544 e!334038))

(assert (=> start!53544 true))

(declare-fun array_inv!13387 (array!36459) Bool)

(assert (=> start!53544 (array_inv!13387 a!2986)))

(declare-fun b!582846 () Bool)

(assert (=> b!582846 (= e!334036 false)))

(declare-fun lt!265030 () SeekEntryResult!5941)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36459 (_ BitVec 32)) SeekEntryResult!5941)

(assert (=> b!582846 (= lt!265030 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17504 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582847 () Bool)

(declare-fun res!370799 () Bool)

(assert (=> b!582847 (=> (not res!370799) (not e!334038))))

(assert (=> b!582847 (= res!370799 (validKeyInArray!0 (select (arr!17504 a!2986) j!136)))))

(assert (= (and start!53544 res!370804) b!582839))

(assert (= (and b!582839 res!370802) b!582847))

(assert (= (and b!582847 res!370799) b!582845))

(assert (= (and b!582845 res!370798) b!582842))

(assert (= (and b!582842 res!370801) b!582840))

(assert (= (and b!582840 res!370803) b!582841))

(assert (= (and b!582841 res!370805) b!582844))

(assert (= (and b!582844 res!370800) b!582843))

(assert (= (and b!582843 res!370797) b!582846))

(declare-fun m!560803 () Bool)

(assert (=> b!582847 m!560803))

(assert (=> b!582847 m!560803))

(declare-fun m!560805 () Bool)

(assert (=> b!582847 m!560805))

(declare-fun m!560807 () Bool)

(assert (=> b!582842 m!560807))

(declare-fun m!560809 () Bool)

(assert (=> start!53544 m!560809))

(declare-fun m!560811 () Bool)

(assert (=> start!53544 m!560811))

(declare-fun m!560813 () Bool)

(assert (=> b!582845 m!560813))

(declare-fun m!560815 () Bool)

(assert (=> b!582840 m!560815))

(declare-fun m!560817 () Bool)

(assert (=> b!582843 m!560817))

(declare-fun m!560819 () Bool)

(assert (=> b!582843 m!560819))

(declare-fun m!560821 () Bool)

(assert (=> b!582843 m!560821))

(declare-fun m!560823 () Bool)

(assert (=> b!582841 m!560823))

(declare-fun m!560825 () Bool)

(assert (=> b!582844 m!560825))

(assert (=> b!582846 m!560803))

(assert (=> b!582846 m!560803))

(declare-fun m!560827 () Bool)

(assert (=> b!582846 m!560827))

(check-sat (not b!582842) (not b!582841) (not start!53544) (not b!582845) (not b!582844) (not b!582840) (not b!582847) (not b!582846))
(check-sat)
