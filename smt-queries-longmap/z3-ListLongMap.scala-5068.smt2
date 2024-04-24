; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69086 () Bool)

(assert start!69086)

(declare-fun b!804806 () Bool)

(declare-fun e!446005 () Bool)

(assert (=> b!804806 (= e!446005 (not true))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!360312 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43708 0))(
  ( (array!43709 (arr!20929 (Array (_ BitVec 32) (_ BitVec 64))) (size!21349 (_ BitVec 32))) )
))
(declare-fun lt!360315 () array!43708)

(declare-fun a!3170 () array!43708)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!360311 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8476 0))(
  ( (MissingZero!8476 (index!36272 (_ BitVec 32))) (Found!8476 (index!36273 (_ BitVec 32))) (Intermediate!8476 (undefined!9288 Bool) (index!36274 (_ BitVec 32)) (x!67272 (_ BitVec 32))) (Undefined!8476) (MissingVacant!8476 (index!36275 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43708 (_ BitVec 32)) SeekEntryResult!8476)

(assert (=> b!804806 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!360311 vacantAfter!23 lt!360312 lt!360315 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!360311 vacantBefore!23 (select (arr!20929 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((Unit!27577 0))(
  ( (Unit!27578) )
))
(declare-fun lt!360316 () Unit!27577)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43708 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27577)

(assert (=> b!804806 (= lt!360316 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!360311 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!804806 (= lt!360311 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!804807 () Bool)

(declare-fun res!548785 () Bool)

(declare-fun e!446003 () Bool)

(assert (=> b!804807 (=> (not res!548785) (not e!446003))))

(declare-fun arrayContainsKey!0 (array!43708 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804807 (= res!548785 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804808 () Bool)

(declare-fun res!548779 () Bool)

(declare-fun e!446002 () Bool)

(assert (=> b!804808 (=> (not res!548779) (not e!446002))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43708 (_ BitVec 32)) Bool)

(assert (=> b!804808 (= res!548779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!548782 () Bool)

(assert (=> start!69086 (=> (not res!548782) (not e!446003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69086 (= res!548782 (validMask!0 mask!3266))))

(assert (=> start!69086 e!446003))

(assert (=> start!69086 true))

(declare-fun array_inv!16788 (array!43708) Bool)

(assert (=> start!69086 (array_inv!16788 a!3170)))

(declare-fun b!804809 () Bool)

(declare-fun e!446001 () Bool)

(assert (=> b!804809 (= e!446002 e!446001)))

(declare-fun res!548781 () Bool)

(assert (=> b!804809 (=> (not res!548781) (not e!446001))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43708 (_ BitVec 32)) SeekEntryResult!8476)

(assert (=> b!804809 (= res!548781 (= (seekEntryOrOpen!0 lt!360312 lt!360315 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360312 lt!360315 mask!3266)))))

(assert (=> b!804809 (= lt!360312 (select (store (arr!20929 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!804809 (= lt!360315 (array!43709 (store (arr!20929 a!3170) i!1163 k0!2044) (size!21349 a!3170)))))

(declare-fun b!804810 () Bool)

(declare-fun res!548777 () Bool)

(assert (=> b!804810 (=> (not res!548777) (not e!446003))))

(assert (=> b!804810 (= res!548777 (and (= (size!21349 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21349 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21349 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804811 () Bool)

(declare-fun res!548778 () Bool)

(assert (=> b!804811 (=> (not res!548778) (not e!446003))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804811 (= res!548778 (validKeyInArray!0 (select (arr!20929 a!3170) j!153)))))

(declare-fun b!804812 () Bool)

(assert (=> b!804812 (= e!446001 e!446005)))

(declare-fun res!548784 () Bool)

(assert (=> b!804812 (=> (not res!548784) (not e!446005))))

(declare-fun lt!360317 () SeekEntryResult!8476)

(declare-fun lt!360313 () SeekEntryResult!8476)

(assert (=> b!804812 (= res!548784 (and (= lt!360313 lt!360317) (= lt!360317 (Found!8476 j!153)) (not (= (select (arr!20929 a!3170) index!1236) (select (arr!20929 a!3170) j!153)))))))

(assert (=> b!804812 (= lt!360317 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20929 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!804812 (= lt!360313 (seekEntryOrOpen!0 (select (arr!20929 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!804813 () Bool)

(declare-fun res!548783 () Bool)

(assert (=> b!804813 (=> (not res!548783) (not e!446002))))

(assert (=> b!804813 (= res!548783 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21349 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20929 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21349 a!3170)) (= (select (arr!20929 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!804814 () Bool)

(declare-fun res!548780 () Bool)

(assert (=> b!804814 (=> (not res!548780) (not e!446002))))

(declare-datatypes ((List!14799 0))(
  ( (Nil!14796) (Cons!14795 (h!15930 (_ BitVec 64)) (t!21106 List!14799)) )
))
(declare-fun arrayNoDuplicates!0 (array!43708 (_ BitVec 32) List!14799) Bool)

(assert (=> b!804814 (= res!548780 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14796))))

(declare-fun b!804815 () Bool)

(declare-fun res!548786 () Bool)

(assert (=> b!804815 (=> (not res!548786) (not e!446003))))

(assert (=> b!804815 (= res!548786 (validKeyInArray!0 k0!2044))))

(declare-fun b!804816 () Bool)

(assert (=> b!804816 (= e!446003 e!446002)))

(declare-fun res!548787 () Bool)

(assert (=> b!804816 (=> (not res!548787) (not e!446002))))

(declare-fun lt!360314 () SeekEntryResult!8476)

(assert (=> b!804816 (= res!548787 (or (= lt!360314 (MissingZero!8476 i!1163)) (= lt!360314 (MissingVacant!8476 i!1163))))))

(assert (=> b!804816 (= lt!360314 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!69086 res!548782) b!804810))

(assert (= (and b!804810 res!548777) b!804811))

(assert (= (and b!804811 res!548778) b!804815))

(assert (= (and b!804815 res!548786) b!804807))

(assert (= (and b!804807 res!548785) b!804816))

(assert (= (and b!804816 res!548787) b!804808))

(assert (= (and b!804808 res!548779) b!804814))

(assert (= (and b!804814 res!548780) b!804813))

(assert (= (and b!804813 res!548783) b!804809))

(assert (= (and b!804809 res!548781) b!804812))

(assert (= (and b!804812 res!548784) b!804806))

(declare-fun m!747031 () Bool)

(assert (=> b!804809 m!747031))

(declare-fun m!747033 () Bool)

(assert (=> b!804809 m!747033))

(declare-fun m!747035 () Bool)

(assert (=> b!804809 m!747035))

(declare-fun m!747037 () Bool)

(assert (=> b!804809 m!747037))

(declare-fun m!747039 () Bool)

(assert (=> b!804816 m!747039))

(declare-fun m!747041 () Bool)

(assert (=> b!804815 m!747041))

(declare-fun m!747043 () Bool)

(assert (=> b!804806 m!747043))

(declare-fun m!747045 () Bool)

(assert (=> b!804806 m!747045))

(assert (=> b!804806 m!747045))

(declare-fun m!747047 () Bool)

(assert (=> b!804806 m!747047))

(declare-fun m!747049 () Bool)

(assert (=> b!804806 m!747049))

(declare-fun m!747051 () Bool)

(assert (=> b!804806 m!747051))

(declare-fun m!747053 () Bool)

(assert (=> b!804808 m!747053))

(declare-fun m!747055 () Bool)

(assert (=> start!69086 m!747055))

(declare-fun m!747057 () Bool)

(assert (=> start!69086 m!747057))

(declare-fun m!747059 () Bool)

(assert (=> b!804814 m!747059))

(declare-fun m!747061 () Bool)

(assert (=> b!804807 m!747061))

(declare-fun m!747063 () Bool)

(assert (=> b!804813 m!747063))

(declare-fun m!747065 () Bool)

(assert (=> b!804813 m!747065))

(assert (=> b!804811 m!747045))

(assert (=> b!804811 m!747045))

(declare-fun m!747067 () Bool)

(assert (=> b!804811 m!747067))

(declare-fun m!747069 () Bool)

(assert (=> b!804812 m!747069))

(assert (=> b!804812 m!747045))

(assert (=> b!804812 m!747045))

(declare-fun m!747071 () Bool)

(assert (=> b!804812 m!747071))

(assert (=> b!804812 m!747045))

(declare-fun m!747073 () Bool)

(assert (=> b!804812 m!747073))

(check-sat (not b!804806) (not b!804816) (not b!804812) (not b!804807) (not b!804808) (not start!69086) (not b!804815) (not b!804809) (not b!804811) (not b!804814))
(check-sat)
