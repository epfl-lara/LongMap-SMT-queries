; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69020 () Bool)

(assert start!69020)

(declare-fun b!805239 () Bool)

(declare-fun res!549765 () Bool)

(declare-fun e!445969 () Bool)

(assert (=> b!805239 (=> (not res!549765) (not e!445969))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43810 0))(
  ( (array!43811 (arr!20985 (Array (_ BitVec 32) (_ BitVec 64))) (size!21406 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43810)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!805239 (= res!549765 (and (= (size!21406 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21406 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21406 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805240 () Bool)

(declare-fun res!549767 () Bool)

(assert (=> b!805240 (=> (not res!549767) (not e!445969))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805240 (= res!549767 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805241 () Bool)

(declare-fun res!549758 () Bool)

(assert (=> b!805241 (=> (not res!549758) (not e!445969))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805241 (= res!549758 (validKeyInArray!0 (select (arr!20985 a!3170) j!153)))))

(declare-fun b!805242 () Bool)

(declare-fun res!549762 () Bool)

(declare-fun e!445968 () Bool)

(assert (=> b!805242 (=> (not res!549762) (not e!445968))))

(declare-datatypes ((List!14948 0))(
  ( (Nil!14945) (Cons!14944 (h!16073 (_ BitVec 64)) (t!21263 List!14948)) )
))
(declare-fun arrayNoDuplicates!0 (array!43810 (_ BitVec 32) List!14948) Bool)

(assert (=> b!805242 (= res!549762 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14945))))

(declare-fun b!805243 () Bool)

(declare-fun e!445970 () Bool)

(assert (=> b!805243 (= e!445968 e!445970)))

(declare-fun res!549759 () Bool)

(assert (=> b!805243 (=> (not res!549759) (not e!445970))))

(declare-fun lt!360528 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!360526 () array!43810)

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8576 0))(
  ( (MissingZero!8576 (index!36672 (_ BitVec 32))) (Found!8576 (index!36673 (_ BitVec 32))) (Intermediate!8576 (undefined!9388 Bool) (index!36674 (_ BitVec 32)) (x!67494 (_ BitVec 32))) (Undefined!8576) (MissingVacant!8576 (index!36675 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43810 (_ BitVec 32)) SeekEntryResult!8576)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43810 (_ BitVec 32)) SeekEntryResult!8576)

(assert (=> b!805243 (= res!549759 (= (seekEntryOrOpen!0 lt!360528 lt!360526 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360528 lt!360526 mask!3266)))))

(assert (=> b!805243 (= lt!360528 (select (store (arr!20985 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!805243 (= lt!360526 (array!43811 (store (arr!20985 a!3170) i!1163 k!2044) (size!21406 a!3170)))))

(declare-fun b!805244 () Bool)

(declare-fun res!549764 () Bool)

(assert (=> b!805244 (=> (not res!549764) (not e!445968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43810 (_ BitVec 32)) Bool)

(assert (=> b!805244 (= res!549764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805245 () Bool)

(assert (=> b!805245 (= e!445969 e!445968)))

(declare-fun res!549766 () Bool)

(assert (=> b!805245 (=> (not res!549766) (not e!445968))))

(declare-fun lt!360529 () SeekEntryResult!8576)

(assert (=> b!805245 (= res!549766 (or (= lt!360529 (MissingZero!8576 i!1163)) (= lt!360529 (MissingVacant!8576 i!1163))))))

(assert (=> b!805245 (= lt!360529 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!805246 () Bool)

(assert (=> b!805246 (= e!445970 false)))

(declare-fun lt!360530 () SeekEntryResult!8576)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!805246 (= lt!360530 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20985 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360527 () SeekEntryResult!8576)

(assert (=> b!805246 (= lt!360527 (seekEntryOrOpen!0 (select (arr!20985 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!549763 () Bool)

(assert (=> start!69020 (=> (not res!549763) (not e!445969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69020 (= res!549763 (validMask!0 mask!3266))))

(assert (=> start!69020 e!445969))

(assert (=> start!69020 true))

(declare-fun array_inv!16781 (array!43810) Bool)

(assert (=> start!69020 (array_inv!16781 a!3170)))

(declare-fun b!805247 () Bool)

(declare-fun res!549760 () Bool)

(assert (=> b!805247 (=> (not res!549760) (not e!445969))))

(assert (=> b!805247 (= res!549760 (validKeyInArray!0 k!2044))))

(declare-fun b!805248 () Bool)

(declare-fun res!549761 () Bool)

(assert (=> b!805248 (=> (not res!549761) (not e!445968))))

(assert (=> b!805248 (= res!549761 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21406 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20985 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21406 a!3170)) (= (select (arr!20985 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!69020 res!549763) b!805239))

(assert (= (and b!805239 res!549765) b!805241))

(assert (= (and b!805241 res!549758) b!805247))

(assert (= (and b!805247 res!549760) b!805240))

(assert (= (and b!805240 res!549767) b!805245))

(assert (= (and b!805245 res!549766) b!805244))

(assert (= (and b!805244 res!549764) b!805242))

(assert (= (and b!805242 res!549762) b!805248))

(assert (= (and b!805248 res!549761) b!805243))

(assert (= (and b!805243 res!549759) b!805246))

(declare-fun m!747161 () Bool)

(assert (=> b!805244 m!747161))

(declare-fun m!747163 () Bool)

(assert (=> b!805248 m!747163))

(declare-fun m!747165 () Bool)

(assert (=> b!805248 m!747165))

(declare-fun m!747167 () Bool)

(assert (=> b!805241 m!747167))

(assert (=> b!805241 m!747167))

(declare-fun m!747169 () Bool)

(assert (=> b!805241 m!747169))

(declare-fun m!747171 () Bool)

(assert (=> start!69020 m!747171))

(declare-fun m!747173 () Bool)

(assert (=> start!69020 m!747173))

(declare-fun m!747175 () Bool)

(assert (=> b!805242 m!747175))

(declare-fun m!747177 () Bool)

(assert (=> b!805240 m!747177))

(declare-fun m!747179 () Bool)

(assert (=> b!805245 m!747179))

(declare-fun m!747181 () Bool)

(assert (=> b!805243 m!747181))

(declare-fun m!747183 () Bool)

(assert (=> b!805243 m!747183))

(declare-fun m!747185 () Bool)

(assert (=> b!805243 m!747185))

(declare-fun m!747187 () Bool)

(assert (=> b!805243 m!747187))

(assert (=> b!805246 m!747167))

(assert (=> b!805246 m!747167))

(declare-fun m!747189 () Bool)

(assert (=> b!805246 m!747189))

(assert (=> b!805246 m!747167))

(declare-fun m!747191 () Bool)

(assert (=> b!805246 m!747191))

(declare-fun m!747193 () Bool)

(assert (=> b!805247 m!747193))

(push 1)

(assert (not b!805243))

(assert (not b!805244))

(assert (not b!805240))

(assert (not b!805246))

(assert (not b!805242))

(assert (not b!805241))

(assert (not start!69020))

(assert (not b!805247))

(assert (not b!805245))

(check-sat)

(pop 1)

