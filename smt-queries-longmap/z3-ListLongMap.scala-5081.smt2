; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68998 () Bool)

(assert start!68998)

(declare-fun b!804909 () Bool)

(declare-fun e!445837 () Bool)

(declare-fun e!445838 () Bool)

(assert (=> b!804909 (= e!445837 e!445838)))

(declare-fun res!549429 () Bool)

(assert (=> b!804909 (=> (not res!549429) (not e!445838))))

(declare-datatypes ((SeekEntryResult!8565 0))(
  ( (MissingZero!8565 (index!36628 (_ BitVec 32))) (Found!8565 (index!36629 (_ BitVec 32))) (Intermediate!8565 (undefined!9377 Bool) (index!36630 (_ BitVec 32)) (x!67451 (_ BitVec 32))) (Undefined!8565) (MissingVacant!8565 (index!36631 (_ BitVec 32))) )
))
(declare-fun lt!360363 () SeekEntryResult!8565)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804909 (= res!549429 (or (= lt!360363 (MissingZero!8565 i!1163)) (= lt!360363 (MissingVacant!8565 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43788 0))(
  ( (array!43789 (arr!20974 (Array (_ BitVec 32) (_ BitVec 64))) (size!21395 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43788)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43788 (_ BitVec 32)) SeekEntryResult!8565)

(assert (=> b!804909 (= lt!360363 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804910 () Bool)

(declare-fun res!549431 () Bool)

(assert (=> b!804910 (=> (not res!549431) (not e!445837))))

(declare-fun arrayContainsKey!0 (array!43788 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804910 (= res!549431 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804911 () Bool)

(declare-fun res!549437 () Bool)

(assert (=> b!804911 (=> (not res!549437) (not e!445837))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804911 (= res!549437 (validKeyInArray!0 (select (arr!20974 a!3170) j!153)))))

(declare-fun res!549436 () Bool)

(assert (=> start!68998 (=> (not res!549436) (not e!445837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68998 (= res!549436 (validMask!0 mask!3266))))

(assert (=> start!68998 e!445837))

(assert (=> start!68998 true))

(declare-fun array_inv!16770 (array!43788) Bool)

(assert (=> start!68998 (array_inv!16770 a!3170)))

(declare-fun b!804912 () Bool)

(declare-fun res!549428 () Bool)

(assert (=> b!804912 (=> (not res!549428) (not e!445837))))

(assert (=> b!804912 (= res!549428 (and (= (size!21395 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21395 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21395 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804913 () Bool)

(declare-fun res!549432 () Bool)

(assert (=> b!804913 (=> (not res!549432) (not e!445838))))

(declare-datatypes ((List!14937 0))(
  ( (Nil!14934) (Cons!14933 (h!16062 (_ BitVec 64)) (t!21252 List!14937)) )
))
(declare-fun arrayNoDuplicates!0 (array!43788 (_ BitVec 32) List!14937) Bool)

(assert (=> b!804913 (= res!549432 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14934))))

(declare-fun b!804914 () Bool)

(declare-fun res!549435 () Bool)

(assert (=> b!804914 (=> (not res!549435) (not e!445838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43788 (_ BitVec 32)) Bool)

(assert (=> b!804914 (= res!549435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804915 () Bool)

(declare-fun e!445836 () Bool)

(assert (=> b!804915 (= e!445836 false)))

(declare-fun lt!360361 () SeekEntryResult!8565)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43788 (_ BitVec 32)) SeekEntryResult!8565)

(assert (=> b!804915 (= lt!360361 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20974 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360362 () SeekEntryResult!8565)

(assert (=> b!804915 (= lt!360362 (seekEntryOrOpen!0 (select (arr!20974 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!804916 () Bool)

(assert (=> b!804916 (= e!445838 e!445836)))

(declare-fun res!549430 () Bool)

(assert (=> b!804916 (=> (not res!549430) (not e!445836))))

(declare-fun lt!360365 () array!43788)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!360364 () (_ BitVec 64))

(assert (=> b!804916 (= res!549430 (= (seekEntryOrOpen!0 lt!360364 lt!360365 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360364 lt!360365 mask!3266)))))

(assert (=> b!804916 (= lt!360364 (select (store (arr!20974 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!804916 (= lt!360365 (array!43789 (store (arr!20974 a!3170) i!1163 k0!2044) (size!21395 a!3170)))))

(declare-fun b!804917 () Bool)

(declare-fun res!549434 () Bool)

(assert (=> b!804917 (=> (not res!549434) (not e!445837))))

(assert (=> b!804917 (= res!549434 (validKeyInArray!0 k0!2044))))

(declare-fun b!804918 () Bool)

(declare-fun res!549433 () Bool)

(assert (=> b!804918 (=> (not res!549433) (not e!445838))))

(assert (=> b!804918 (= res!549433 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21395 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20974 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21395 a!3170)) (= (select (arr!20974 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68998 res!549436) b!804912))

(assert (= (and b!804912 res!549428) b!804911))

(assert (= (and b!804911 res!549437) b!804917))

(assert (= (and b!804917 res!549434) b!804910))

(assert (= (and b!804910 res!549431) b!804909))

(assert (= (and b!804909 res!549429) b!804914))

(assert (= (and b!804914 res!549435) b!804913))

(assert (= (and b!804913 res!549432) b!804918))

(assert (= (and b!804918 res!549433) b!804916))

(assert (= (and b!804916 res!549430) b!804915))

(declare-fun m!746787 () Bool)

(assert (=> b!804909 m!746787))

(declare-fun m!746789 () Bool)

(assert (=> b!804918 m!746789))

(declare-fun m!746791 () Bool)

(assert (=> b!804918 m!746791))

(declare-fun m!746793 () Bool)

(assert (=> start!68998 m!746793))

(declare-fun m!746795 () Bool)

(assert (=> start!68998 m!746795))

(declare-fun m!746797 () Bool)

(assert (=> b!804916 m!746797))

(declare-fun m!746799 () Bool)

(assert (=> b!804916 m!746799))

(declare-fun m!746801 () Bool)

(assert (=> b!804916 m!746801))

(declare-fun m!746803 () Bool)

(assert (=> b!804916 m!746803))

(declare-fun m!746805 () Bool)

(assert (=> b!804910 m!746805))

(declare-fun m!746807 () Bool)

(assert (=> b!804914 m!746807))

(declare-fun m!746809 () Bool)

(assert (=> b!804917 m!746809))

(declare-fun m!746811 () Bool)

(assert (=> b!804915 m!746811))

(assert (=> b!804915 m!746811))

(declare-fun m!746813 () Bool)

(assert (=> b!804915 m!746813))

(assert (=> b!804915 m!746811))

(declare-fun m!746815 () Bool)

(assert (=> b!804915 m!746815))

(assert (=> b!804911 m!746811))

(assert (=> b!804911 m!746811))

(declare-fun m!746817 () Bool)

(assert (=> b!804911 m!746817))

(declare-fun m!746819 () Bool)

(assert (=> b!804913 m!746819))

(check-sat (not b!804913) (not b!804917) (not b!804909) (not b!804915) (not b!804910) (not b!804914) (not b!804916) (not b!804911) (not start!68998))
