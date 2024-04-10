; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69012 () Bool)

(assert start!69012)

(declare-fun b!805119 () Bool)

(declare-fun res!549644 () Bool)

(declare-fun e!445919 () Bool)

(assert (=> b!805119 (=> (not res!549644) (not e!445919))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805119 (= res!549644 (validKeyInArray!0 k!2044))))

(declare-fun b!805120 () Bool)

(declare-fun res!549645 () Bool)

(declare-fun e!445922 () Bool)

(assert (=> b!805120 (=> (not res!549645) (not e!445922))))

(declare-datatypes ((array!43802 0))(
  ( (array!43803 (arr!20981 (Array (_ BitVec 32) (_ BitVec 64))) (size!21402 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43802)

(declare-datatypes ((List!14944 0))(
  ( (Nil!14941) (Cons!14940 (h!16069 (_ BitVec 64)) (t!21259 List!14944)) )
))
(declare-fun arrayNoDuplicates!0 (array!43802 (_ BitVec 32) List!14944) Bool)

(assert (=> b!805120 (= res!549645 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14941))))

(declare-fun b!805122 () Bool)

(declare-fun res!549638 () Bool)

(assert (=> b!805122 (=> (not res!549638) (not e!445922))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!805122 (= res!549638 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21402 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20981 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21402 a!3170)) (= (select (arr!20981 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805123 () Bool)

(declare-fun res!549640 () Bool)

(assert (=> b!805123 (=> (not res!549640) (not e!445919))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!805123 (= res!549640 (validKeyInArray!0 (select (arr!20981 a!3170) j!153)))))

(declare-fun b!805124 () Bool)

(declare-fun res!549641 () Bool)

(assert (=> b!805124 (=> (not res!549641) (not e!445922))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43802 (_ BitVec 32)) Bool)

(assert (=> b!805124 (= res!549641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805125 () Bool)

(declare-fun res!549646 () Bool)

(assert (=> b!805125 (=> (not res!549646) (not e!445919))))

(assert (=> b!805125 (= res!549646 (and (= (size!21402 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21402 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21402 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805126 () Bool)

(declare-fun res!549639 () Bool)

(assert (=> b!805126 (=> (not res!549639) (not e!445919))))

(declare-fun arrayContainsKey!0 (array!43802 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805126 (= res!549639 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!549643 () Bool)

(assert (=> start!69012 (=> (not res!549643) (not e!445919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69012 (= res!549643 (validMask!0 mask!3266))))

(assert (=> start!69012 e!445919))

(assert (=> start!69012 true))

(declare-fun array_inv!16777 (array!43802) Bool)

(assert (=> start!69012 (array_inv!16777 a!3170)))

(declare-fun b!805121 () Bool)

(assert (=> b!805121 (= e!445919 e!445922)))

(declare-fun res!549647 () Bool)

(assert (=> b!805121 (=> (not res!549647) (not e!445922))))

(declare-datatypes ((SeekEntryResult!8572 0))(
  ( (MissingZero!8572 (index!36656 (_ BitVec 32))) (Found!8572 (index!36657 (_ BitVec 32))) (Intermediate!8572 (undefined!9384 Bool) (index!36658 (_ BitVec 32)) (x!67474 (_ BitVec 32))) (Undefined!8572) (MissingVacant!8572 (index!36659 (_ BitVec 32))) )
))
(declare-fun lt!360469 () SeekEntryResult!8572)

(assert (=> b!805121 (= res!549647 (or (= lt!360469 (MissingZero!8572 i!1163)) (= lt!360469 (MissingVacant!8572 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43802 (_ BitVec 32)) SeekEntryResult!8572)

(assert (=> b!805121 (= lt!360469 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!805127 () Bool)

(declare-fun e!445921 () Bool)

(assert (=> b!805127 (= e!445922 e!445921)))

(declare-fun res!549642 () Bool)

(assert (=> b!805127 (=> (not res!549642) (not e!445921))))

(declare-fun lt!360468 () array!43802)

(declare-fun lt!360466 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43802 (_ BitVec 32)) SeekEntryResult!8572)

(assert (=> b!805127 (= res!549642 (= (seekEntryOrOpen!0 lt!360466 lt!360468 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360466 lt!360468 mask!3266)))))

(assert (=> b!805127 (= lt!360466 (select (store (arr!20981 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!805127 (= lt!360468 (array!43803 (store (arr!20981 a!3170) i!1163 k!2044) (size!21402 a!3170)))))

(declare-fun b!805128 () Bool)

(assert (=> b!805128 (= e!445921 false)))

(declare-fun lt!360470 () SeekEntryResult!8572)

(assert (=> b!805128 (= lt!360470 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20981 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360467 () SeekEntryResult!8572)

(assert (=> b!805128 (= lt!360467 (seekEntryOrOpen!0 (select (arr!20981 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!69012 res!549643) b!805125))

(assert (= (and b!805125 res!549646) b!805123))

(assert (= (and b!805123 res!549640) b!805119))

(assert (= (and b!805119 res!549644) b!805126))

(assert (= (and b!805126 res!549639) b!805121))

(assert (= (and b!805121 res!549647) b!805124))

(assert (= (and b!805124 res!549641) b!805120))

(assert (= (and b!805120 res!549645) b!805122))

(assert (= (and b!805122 res!549638) b!805127))

(assert (= (and b!805127 res!549642) b!805128))

(declare-fun m!747025 () Bool)

(assert (=> b!805123 m!747025))

(assert (=> b!805123 m!747025))

(declare-fun m!747027 () Bool)

(assert (=> b!805123 m!747027))

(declare-fun m!747029 () Bool)

(assert (=> b!805124 m!747029))

(declare-fun m!747031 () Bool)

(assert (=> b!805122 m!747031))

(declare-fun m!747033 () Bool)

(assert (=> b!805122 m!747033))

(declare-fun m!747035 () Bool)

(assert (=> b!805119 m!747035))

(assert (=> b!805128 m!747025))

(assert (=> b!805128 m!747025))

(declare-fun m!747037 () Bool)

(assert (=> b!805128 m!747037))

(assert (=> b!805128 m!747025))

(declare-fun m!747039 () Bool)

(assert (=> b!805128 m!747039))

(declare-fun m!747041 () Bool)

(assert (=> b!805120 m!747041))

(declare-fun m!747043 () Bool)

(assert (=> b!805127 m!747043))

(declare-fun m!747045 () Bool)

(assert (=> b!805127 m!747045))

(declare-fun m!747047 () Bool)

(assert (=> b!805127 m!747047))

(declare-fun m!747049 () Bool)

(assert (=> b!805127 m!747049))

(declare-fun m!747051 () Bool)

(assert (=> start!69012 m!747051))

(declare-fun m!747053 () Bool)

(assert (=> start!69012 m!747053))

(declare-fun m!747055 () Bool)

(assert (=> b!805126 m!747055))

(declare-fun m!747057 () Bool)

(assert (=> b!805121 m!747057))

(push 1)

(assert (not b!805127))

(assert (not b!805126))

(assert (not b!805123))

(assert (not b!805121))

