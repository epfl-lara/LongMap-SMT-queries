; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68874 () Bool)

(assert start!68874)

(declare-fun res!547670 () Bool)

(declare-fun e!445055 () Bool)

(assert (=> start!68874 (=> (not res!547670) (not e!445055))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68874 (= res!547670 (validMask!0 mask!3266))))

(assert (=> start!68874 e!445055))

(assert (=> start!68874 true))

(declare-datatypes ((array!43664 0))(
  ( (array!43665 (arr!20912 (Array (_ BitVec 32) (_ BitVec 64))) (size!21333 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43664)

(declare-fun array_inv!16708 (array!43664) Bool)

(assert (=> start!68874 (array_inv!16708 a!3170)))

(declare-fun b!803146 () Bool)

(declare-fun res!547675 () Bool)

(assert (=> b!803146 (=> (not res!547675) (not e!445055))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803146 (= res!547675 (validKeyInArray!0 k!2044))))

(declare-fun b!803147 () Bool)

(declare-fun res!547668 () Bool)

(assert (=> b!803147 (=> (not res!547668) (not e!445055))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!803147 (= res!547668 (validKeyInArray!0 (select (arr!20912 a!3170) j!153)))))

(declare-fun b!803148 () Bool)

(declare-fun res!547667 () Bool)

(declare-fun e!445056 () Bool)

(assert (=> b!803148 (=> (not res!547667) (not e!445056))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!803148 (= res!547667 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21333 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20912 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21333 a!3170)) (= (select (arr!20912 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803149 () Bool)

(declare-fun e!445058 () Bool)

(declare-fun e!445057 () Bool)

(assert (=> b!803149 (= e!445058 e!445057)))

(declare-fun res!547676 () Bool)

(assert (=> b!803149 (=> (not res!547676) (not e!445057))))

(declare-datatypes ((SeekEntryResult!8503 0))(
  ( (MissingZero!8503 (index!36380 (_ BitVec 32))) (Found!8503 (index!36381 (_ BitVec 32))) (Intermediate!8503 (undefined!9315 Bool) (index!36382 (_ BitVec 32)) (x!67221 (_ BitVec 32))) (Undefined!8503) (MissingVacant!8503 (index!36383 (_ BitVec 32))) )
))
(declare-fun lt!359381 () SeekEntryResult!8503)

(declare-fun lt!359389 () SeekEntryResult!8503)

(assert (=> b!803149 (= res!547676 (= lt!359381 lt!359389))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43664 (_ BitVec 32)) SeekEntryResult!8503)

(assert (=> b!803149 (= lt!359389 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20912 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43664 (_ BitVec 32)) SeekEntryResult!8503)

(assert (=> b!803149 (= lt!359381 (seekEntryOrOpen!0 (select (arr!20912 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!359382 () SeekEntryResult!8503)

(declare-fun lt!359390 () SeekEntryResult!8503)

(declare-fun b!803150 () Bool)

(declare-fun e!445054 () Bool)

(assert (=> b!803150 (= e!445054 (not (or (not (= lt!359390 lt!359382)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20912 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!359385 () (_ BitVec 32))

(declare-fun lt!359387 () array!43664)

(declare-fun lt!359386 () (_ BitVec 64))

(assert (=> b!803150 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359385 vacantAfter!23 lt!359386 lt!359387 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359385 vacantBefore!23 (select (arr!20912 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27546 0))(
  ( (Unit!27547) )
))
(declare-fun lt!359388 () Unit!27546)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43664 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27546)

(assert (=> b!803150 (= lt!359388 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359385 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803150 (= lt!359385 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803151 () Bool)

(declare-fun res!547674 () Bool)

(assert (=> b!803151 (=> (not res!547674) (not e!445055))))

(declare-fun arrayContainsKey!0 (array!43664 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803151 (= res!547674 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803152 () Bool)

(assert (=> b!803152 (= e!445055 e!445056)))

(declare-fun res!547666 () Bool)

(assert (=> b!803152 (=> (not res!547666) (not e!445056))))

(declare-fun lt!359383 () SeekEntryResult!8503)

(assert (=> b!803152 (= res!547666 (or (= lt!359383 (MissingZero!8503 i!1163)) (= lt!359383 (MissingVacant!8503 i!1163))))))

(assert (=> b!803152 (= lt!359383 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!803153 () Bool)

(assert (=> b!803153 (= e!445057 e!445054)))

(declare-fun res!547671 () Bool)

(assert (=> b!803153 (=> (not res!547671) (not e!445054))))

(assert (=> b!803153 (= res!547671 (and (= lt!359389 lt!359382) (not (= (select (arr!20912 a!3170) index!1236) (select (arr!20912 a!3170) j!153)))))))

(assert (=> b!803153 (= lt!359382 (Found!8503 j!153))))

(declare-fun b!803154 () Bool)

(declare-fun res!547665 () Bool)

(assert (=> b!803154 (=> (not res!547665) (not e!445055))))

(assert (=> b!803154 (= res!547665 (and (= (size!21333 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21333 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21333 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803155 () Bool)

(assert (=> b!803155 (= e!445056 e!445058)))

(declare-fun res!547672 () Bool)

(assert (=> b!803155 (=> (not res!547672) (not e!445058))))

(declare-fun lt!359384 () SeekEntryResult!8503)

(assert (=> b!803155 (= res!547672 (= lt!359384 lt!359390))))

(assert (=> b!803155 (= lt!359390 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359386 lt!359387 mask!3266))))

(assert (=> b!803155 (= lt!359384 (seekEntryOrOpen!0 lt!359386 lt!359387 mask!3266))))

(assert (=> b!803155 (= lt!359386 (select (store (arr!20912 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!803155 (= lt!359387 (array!43665 (store (arr!20912 a!3170) i!1163 k!2044) (size!21333 a!3170)))))

(declare-fun b!803156 () Bool)

(declare-fun res!547673 () Bool)

(assert (=> b!803156 (=> (not res!547673) (not e!445056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43664 (_ BitVec 32)) Bool)

(assert (=> b!803156 (= res!547673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803157 () Bool)

(declare-fun res!547669 () Bool)

(assert (=> b!803157 (=> (not res!547669) (not e!445056))))

(declare-datatypes ((List!14875 0))(
  ( (Nil!14872) (Cons!14871 (h!16000 (_ BitVec 64)) (t!21190 List!14875)) )
))
(declare-fun arrayNoDuplicates!0 (array!43664 (_ BitVec 32) List!14875) Bool)

(assert (=> b!803157 (= res!547669 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14872))))

(assert (= (and start!68874 res!547670) b!803154))

(assert (= (and b!803154 res!547665) b!803147))

(assert (= (and b!803147 res!547668) b!803146))

(assert (= (and b!803146 res!547675) b!803151))

(assert (= (and b!803151 res!547674) b!803152))

(assert (= (and b!803152 res!547666) b!803156))

(assert (= (and b!803156 res!547673) b!803157))

(assert (= (and b!803157 res!547669) b!803148))

(assert (= (and b!803148 res!547667) b!803155))

(assert (= (and b!803155 res!547672) b!803149))

(assert (= (and b!803149 res!547676) b!803153))

(assert (= (and b!803153 res!547671) b!803150))

(declare-fun m!744793 () Bool)

(assert (=> b!803149 m!744793))

(assert (=> b!803149 m!744793))

(declare-fun m!744795 () Bool)

(assert (=> b!803149 m!744795))

(assert (=> b!803149 m!744793))

(declare-fun m!744797 () Bool)

(assert (=> b!803149 m!744797))

(declare-fun m!744799 () Bool)

(assert (=> b!803152 m!744799))

(declare-fun m!744801 () Bool)

(assert (=> b!803151 m!744801))

(declare-fun m!744803 () Bool)

(assert (=> b!803155 m!744803))

(declare-fun m!744805 () Bool)

(assert (=> b!803155 m!744805))

(declare-fun m!744807 () Bool)

(assert (=> b!803155 m!744807))

(declare-fun m!744809 () Bool)

(assert (=> b!803155 m!744809))

(declare-fun m!744811 () Bool)

(assert (=> b!803148 m!744811))

(declare-fun m!744813 () Bool)

(assert (=> b!803148 m!744813))

(assert (=> b!803147 m!744793))

(assert (=> b!803147 m!744793))

(declare-fun m!744815 () Bool)

(assert (=> b!803147 m!744815))

(declare-fun m!744817 () Bool)

(assert (=> b!803146 m!744817))

(declare-fun m!744819 () Bool)

(assert (=> start!68874 m!744819))

(declare-fun m!744821 () Bool)

(assert (=> start!68874 m!744821))

(declare-fun m!744823 () Bool)

(assert (=> b!803150 m!744823))

(assert (=> b!803150 m!744793))

(assert (=> b!803150 m!744793))

(declare-fun m!744825 () Bool)

(assert (=> b!803150 m!744825))

(declare-fun m!744827 () Bool)

(assert (=> b!803150 m!744827))

(declare-fun m!744829 () Bool)

(assert (=> b!803150 m!744829))

(declare-fun m!744831 () Bool)

(assert (=> b!803150 m!744831))

(assert (=> b!803150 m!744807))

(declare-fun m!744833 () Bool)

(assert (=> b!803153 m!744833))

(assert (=> b!803153 m!744793))

(declare-fun m!744835 () Bool)

(assert (=> b!803157 m!744835))

(declare-fun m!744837 () Bool)

(assert (=> b!803156 m!744837))

(push 1)

(assert (not b!803147))

(assert (not b!803156))

