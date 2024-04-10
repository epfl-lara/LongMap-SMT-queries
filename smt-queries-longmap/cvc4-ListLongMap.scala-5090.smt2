; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69102 () Bool)

(assert start!69102)

(declare-fun b!806036 () Bool)

(declare-fun e!446362 () Bool)

(declare-fun e!446363 () Bool)

(assert (=> b!806036 (= e!446362 e!446363)))

(declare-fun res!550357 () Bool)

(assert (=> b!806036 (=> (not res!550357) (not e!446363))))

(declare-datatypes ((SeekEntryResult!8593 0))(
  ( (MissingZero!8593 (index!36740 (_ BitVec 32))) (Found!8593 (index!36741 (_ BitVec 32))) (Intermediate!8593 (undefined!9405 Bool) (index!36742 (_ BitVec 32)) (x!67554 (_ BitVec 32))) (Undefined!8593) (MissingVacant!8593 (index!36743 (_ BitVec 32))) )
))
(declare-fun lt!360953 () SeekEntryResult!8593)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!806036 (= res!550357 (or (= lt!360953 (MissingZero!8593 i!1163)) (= lt!360953 (MissingVacant!8593 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!43847 0))(
  ( (array!43848 (arr!21002 (Array (_ BitVec 32) (_ BitVec 64))) (size!21423 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43847)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43847 (_ BitVec 32)) SeekEntryResult!8593)

(assert (=> b!806036 (= lt!360953 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!806037 () Bool)

(declare-fun res!550364 () Bool)

(assert (=> b!806037 (=> (not res!550364) (not e!446362))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806037 (= res!550364 (validKeyInArray!0 (select (arr!21002 a!3170) j!153)))))

(declare-fun b!806038 () Bool)

(declare-fun res!550359 () Bool)

(assert (=> b!806038 (=> (not res!550359) (not e!446362))))

(assert (=> b!806038 (= res!550359 (and (= (size!21423 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21423 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21423 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!550358 () Bool)

(assert (=> start!69102 (=> (not res!550358) (not e!446362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69102 (= res!550358 (validMask!0 mask!3266))))

(assert (=> start!69102 e!446362))

(assert (=> start!69102 true))

(declare-fun array_inv!16798 (array!43847) Bool)

(assert (=> start!69102 (array_inv!16798 a!3170)))

(declare-fun b!806039 () Bool)

(declare-fun res!550360 () Bool)

(assert (=> b!806039 (=> (not res!550360) (not e!446362))))

(assert (=> b!806039 (= res!550360 (validKeyInArray!0 k!2044))))

(declare-fun b!806040 () Bool)

(declare-fun res!550363 () Bool)

(assert (=> b!806040 (=> (not res!550363) (not e!446363))))

(declare-datatypes ((List!14965 0))(
  ( (Nil!14962) (Cons!14961 (h!16090 (_ BitVec 64)) (t!21280 List!14965)) )
))
(declare-fun arrayNoDuplicates!0 (array!43847 (_ BitVec 32) List!14965) Bool)

(assert (=> b!806040 (= res!550363 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14962))))

(declare-fun b!806041 () Bool)

(declare-fun e!446359 () Bool)

(declare-fun e!446361 () Bool)

(assert (=> b!806041 (= e!446359 e!446361)))

(declare-fun res!550362 () Bool)

(assert (=> b!806041 (=> (not res!550362) (not e!446361))))

(declare-fun lt!360949 () SeekEntryResult!8593)

(declare-fun lt!360952 () SeekEntryResult!8593)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!806041 (= res!550362 (and (= lt!360949 lt!360952) (= lt!360952 (Found!8593 j!153)) (= (select (arr!21002 a!3170) index!1236) (select (arr!21002 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43847 (_ BitVec 32)) SeekEntryResult!8593)

(assert (=> b!806041 (= lt!360952 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21002 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!806041 (= lt!360949 (seekEntryOrOpen!0 (select (arr!21002 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806042 () Bool)

(declare-fun res!550366 () Bool)

(assert (=> b!806042 (=> (not res!550366) (not e!446362))))

(declare-fun arrayContainsKey!0 (array!43847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806042 (= res!550366 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806043 () Bool)

(assert (=> b!806043 (= e!446361 (not true))))

(declare-fun lt!360948 () SeekEntryResult!8593)

(assert (=> b!806043 (= lt!360948 (Found!8593 index!1236))))

(declare-fun b!806044 () Bool)

(declare-fun res!550365 () Bool)

(assert (=> b!806044 (=> (not res!550365) (not e!446363))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!806044 (= res!550365 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21423 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21002 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21423 a!3170)) (= (select (arr!21002 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806045 () Bool)

(declare-fun res!550361 () Bool)

(assert (=> b!806045 (=> (not res!550361) (not e!446363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43847 (_ BitVec 32)) Bool)

(assert (=> b!806045 (= res!550361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806046 () Bool)

(assert (=> b!806046 (= e!446363 e!446359)))

(declare-fun res!550367 () Bool)

(assert (=> b!806046 (=> (not res!550367) (not e!446359))))

(declare-fun lt!360951 () SeekEntryResult!8593)

(assert (=> b!806046 (= res!550367 (= lt!360951 lt!360948))))

(declare-fun lt!360950 () (_ BitVec 64))

(declare-fun lt!360947 () array!43847)

(assert (=> b!806046 (= lt!360948 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360950 lt!360947 mask!3266))))

(assert (=> b!806046 (= lt!360951 (seekEntryOrOpen!0 lt!360950 lt!360947 mask!3266))))

(assert (=> b!806046 (= lt!360950 (select (store (arr!21002 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!806046 (= lt!360947 (array!43848 (store (arr!21002 a!3170) i!1163 k!2044) (size!21423 a!3170)))))

(assert (= (and start!69102 res!550358) b!806038))

(assert (= (and b!806038 res!550359) b!806037))

(assert (= (and b!806037 res!550364) b!806039))

(assert (= (and b!806039 res!550360) b!806042))

(assert (= (and b!806042 res!550366) b!806036))

(assert (= (and b!806036 res!550357) b!806045))

(assert (= (and b!806045 res!550361) b!806040))

(assert (= (and b!806040 res!550363) b!806044))

(assert (= (and b!806044 res!550365) b!806046))

(assert (= (and b!806046 res!550367) b!806041))

(assert (= (and b!806041 res!550362) b!806043))

(declare-fun m!747989 () Bool)

(assert (=> b!806041 m!747989))

(declare-fun m!747991 () Bool)

(assert (=> b!806041 m!747991))

(assert (=> b!806041 m!747991))

(declare-fun m!747993 () Bool)

(assert (=> b!806041 m!747993))

(assert (=> b!806041 m!747991))

(declare-fun m!747995 () Bool)

(assert (=> b!806041 m!747995))

(declare-fun m!747997 () Bool)

(assert (=> b!806040 m!747997))

(declare-fun m!747999 () Bool)

(assert (=> b!806042 m!747999))

(declare-fun m!748001 () Bool)

(assert (=> b!806046 m!748001))

(declare-fun m!748003 () Bool)

(assert (=> b!806046 m!748003))

(declare-fun m!748005 () Bool)

(assert (=> b!806046 m!748005))

(declare-fun m!748007 () Bool)

(assert (=> b!806046 m!748007))

(declare-fun m!748009 () Bool)

(assert (=> b!806036 m!748009))

(declare-fun m!748011 () Bool)

(assert (=> start!69102 m!748011))

(declare-fun m!748013 () Bool)

(assert (=> start!69102 m!748013))

(assert (=> b!806037 m!747991))

(assert (=> b!806037 m!747991))

(declare-fun m!748015 () Bool)

(assert (=> b!806037 m!748015))

(declare-fun m!748017 () Bool)

(assert (=> b!806045 m!748017))

(declare-fun m!748019 () Bool)

(assert (=> b!806039 m!748019))

(declare-fun m!748021 () Bool)

(assert (=> b!806044 m!748021))

(declare-fun m!748023 () Bool)

(assert (=> b!806044 m!748023))

(push 1)

(assert (not b!806039))

(assert (not b!806041))

(assert (not b!806040))

(assert (not b!806037))

(assert (not b!806042))

(assert (not start!69102))

(assert (not b!806036))

(assert (not b!806046))

(assert (not b!806045))

(check-sat)

