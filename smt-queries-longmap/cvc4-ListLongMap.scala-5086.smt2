; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69030 () Bool)

(assert start!69030)

(declare-fun b!805389 () Bool)

(declare-fun res!549910 () Bool)

(declare-fun e!446029 () Bool)

(assert (=> b!805389 (=> (not res!549910) (not e!446029))))

(declare-datatypes ((array!43820 0))(
  ( (array!43821 (arr!20990 (Array (_ BitVec 32) (_ BitVec 64))) (size!21411 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43820)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43820 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805389 (= res!549910 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805390 () Bool)

(declare-fun res!549909 () Bool)

(declare-fun e!446028 () Bool)

(assert (=> b!805390 (=> (not res!549909) (not e!446028))))

(declare-datatypes ((List!14953 0))(
  ( (Nil!14950) (Cons!14949 (h!16078 (_ BitVec 64)) (t!21268 List!14953)) )
))
(declare-fun arrayNoDuplicates!0 (array!43820 (_ BitVec 32) List!14953) Bool)

(assert (=> b!805390 (= res!549909 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14950))))

(declare-fun b!805391 () Bool)

(declare-fun res!549917 () Bool)

(assert (=> b!805391 (=> (not res!549917) (not e!446028))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43820 (_ BitVec 32)) Bool)

(assert (=> b!805391 (= res!549917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805392 () Bool)

(declare-fun e!446030 () Bool)

(assert (=> b!805392 (= e!446028 e!446030)))

(declare-fun res!549914 () Bool)

(assert (=> b!805392 (=> (not res!549914) (not e!446030))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!360604 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!360602 () array!43820)

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8581 0))(
  ( (MissingZero!8581 (index!36692 (_ BitVec 32))) (Found!8581 (index!36693 (_ BitVec 32))) (Intermediate!8581 (undefined!9393 Bool) (index!36694 (_ BitVec 32)) (x!67507 (_ BitVec 32))) (Undefined!8581) (MissingVacant!8581 (index!36695 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43820 (_ BitVec 32)) SeekEntryResult!8581)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43820 (_ BitVec 32)) SeekEntryResult!8581)

(assert (=> b!805392 (= res!549914 (= (seekEntryOrOpen!0 lt!360604 lt!360602 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360604 lt!360602 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!805392 (= lt!360604 (select (store (arr!20990 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!805392 (= lt!360602 (array!43821 (store (arr!20990 a!3170) i!1163 k!2044) (size!21411 a!3170)))))

(declare-fun b!805393 () Bool)

(declare-fun res!549908 () Bool)

(assert (=> b!805393 (=> (not res!549908) (not e!446029))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805393 (= res!549908 (validKeyInArray!0 (select (arr!20990 a!3170) j!153)))))

(declare-fun b!805394 () Bool)

(assert (=> b!805394 (= e!446029 e!446028)))

(declare-fun res!549915 () Bool)

(assert (=> b!805394 (=> (not res!549915) (not e!446028))))

(declare-fun lt!360601 () SeekEntryResult!8581)

(assert (=> b!805394 (= res!549915 (or (= lt!360601 (MissingZero!8581 i!1163)) (= lt!360601 (MissingVacant!8581 i!1163))))))

(assert (=> b!805394 (= lt!360601 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!805395 () Bool)

(declare-fun res!549916 () Bool)

(assert (=> b!805395 (=> (not res!549916) (not e!446029))))

(assert (=> b!805395 (= res!549916 (and (= (size!21411 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21411 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21411 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!549912 () Bool)

(assert (=> start!69030 (=> (not res!549912) (not e!446029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69030 (= res!549912 (validMask!0 mask!3266))))

(assert (=> start!69030 e!446029))

(assert (=> start!69030 true))

(declare-fun array_inv!16786 (array!43820) Bool)

(assert (=> start!69030 (array_inv!16786 a!3170)))

(declare-fun b!805396 () Bool)

(assert (=> b!805396 (= e!446030 false)))

(declare-fun lt!360605 () SeekEntryResult!8581)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!805396 (= lt!360605 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20990 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360603 () SeekEntryResult!8581)

(assert (=> b!805396 (= lt!360603 (seekEntryOrOpen!0 (select (arr!20990 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805397 () Bool)

(declare-fun res!549913 () Bool)

(assert (=> b!805397 (=> (not res!549913) (not e!446028))))

(assert (=> b!805397 (= res!549913 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21411 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20990 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21411 a!3170)) (= (select (arr!20990 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805398 () Bool)

(declare-fun res!549911 () Bool)

(assert (=> b!805398 (=> (not res!549911) (not e!446029))))

(assert (=> b!805398 (= res!549911 (validKeyInArray!0 k!2044))))

(assert (= (and start!69030 res!549912) b!805395))

(assert (= (and b!805395 res!549916) b!805393))

(assert (= (and b!805393 res!549908) b!805398))

(assert (= (and b!805398 res!549911) b!805389))

(assert (= (and b!805389 res!549910) b!805394))

(assert (= (and b!805394 res!549915) b!805391))

(assert (= (and b!805391 res!549917) b!805390))

(assert (= (and b!805390 res!549909) b!805397))

(assert (= (and b!805397 res!549913) b!805392))

(assert (= (and b!805392 res!549914) b!805396))

(declare-fun m!747331 () Bool)

(assert (=> b!805396 m!747331))

(assert (=> b!805396 m!747331))

(declare-fun m!747333 () Bool)

(assert (=> b!805396 m!747333))

(assert (=> b!805396 m!747331))

(declare-fun m!747335 () Bool)

(assert (=> b!805396 m!747335))

(assert (=> b!805393 m!747331))

(assert (=> b!805393 m!747331))

(declare-fun m!747337 () Bool)

(assert (=> b!805393 m!747337))

(declare-fun m!747339 () Bool)

(assert (=> start!69030 m!747339))

(declare-fun m!747341 () Bool)

(assert (=> start!69030 m!747341))

(declare-fun m!747343 () Bool)

(assert (=> b!805397 m!747343))

(declare-fun m!747345 () Bool)

(assert (=> b!805397 m!747345))

(declare-fun m!747347 () Bool)

(assert (=> b!805391 m!747347))

(declare-fun m!747349 () Bool)

(assert (=> b!805398 m!747349))

(declare-fun m!747351 () Bool)

(assert (=> b!805389 m!747351))

(declare-fun m!747353 () Bool)

(assert (=> b!805394 m!747353))

(declare-fun m!747355 () Bool)

(assert (=> b!805392 m!747355))

(declare-fun m!747357 () Bool)

(assert (=> b!805392 m!747357))

(declare-fun m!747359 () Bool)

(assert (=> b!805392 m!747359))

(declare-fun m!747361 () Bool)

(assert (=> b!805392 m!747361))

(declare-fun m!747363 () Bool)

(assert (=> b!805390 m!747363))

(push 1)

(assert (not b!805389))

(assert (not b!805394))

(assert (not b!805392))

