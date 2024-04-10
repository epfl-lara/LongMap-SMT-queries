; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69024 () Bool)

(assert start!69024)

(declare-fun b!805299 () Bool)

(declare-fun res!549827 () Bool)

(declare-fun e!445991 () Bool)

(assert (=> b!805299 (=> (not res!549827) (not e!445991))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43814 0))(
  ( (array!43815 (arr!20987 (Array (_ BitVec 32) (_ BitVec 64))) (size!21408 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43814)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!805299 (= res!549827 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21408 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20987 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21408 a!3170)) (= (select (arr!20987 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805300 () Bool)

(declare-fun res!549822 () Bool)

(declare-fun e!445994 () Bool)

(assert (=> b!805300 (=> (not res!549822) (not e!445994))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805300 (= res!549822 (validKeyInArray!0 (select (arr!20987 a!3170) j!153)))))

(declare-fun res!549826 () Bool)

(assert (=> start!69024 (=> (not res!549826) (not e!445994))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69024 (= res!549826 (validMask!0 mask!3266))))

(assert (=> start!69024 e!445994))

(assert (=> start!69024 true))

(declare-fun array_inv!16783 (array!43814) Bool)

(assert (=> start!69024 (array_inv!16783 a!3170)))

(declare-fun b!805301 () Bool)

(declare-fun res!549820 () Bool)

(assert (=> b!805301 (=> (not res!549820) (not e!445991))))

(declare-datatypes ((List!14950 0))(
  ( (Nil!14947) (Cons!14946 (h!16075 (_ BitVec 64)) (t!21265 List!14950)) )
))
(declare-fun arrayNoDuplicates!0 (array!43814 (_ BitVec 32) List!14950) Bool)

(assert (=> b!805301 (= res!549820 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14947))))

(declare-fun b!805302 () Bool)

(declare-fun res!549821 () Bool)

(assert (=> b!805302 (=> (not res!549821) (not e!445994))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805302 (= res!549821 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805303 () Bool)

(declare-fun e!445992 () Bool)

(assert (=> b!805303 (= e!445991 e!445992)))

(declare-fun res!549823 () Bool)

(assert (=> b!805303 (=> (not res!549823) (not e!445992))))

(declare-fun lt!360557 () array!43814)

(declare-fun lt!360556 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8578 0))(
  ( (MissingZero!8578 (index!36680 (_ BitVec 32))) (Found!8578 (index!36681 (_ BitVec 32))) (Intermediate!8578 (undefined!9390 Bool) (index!36682 (_ BitVec 32)) (x!67496 (_ BitVec 32))) (Undefined!8578) (MissingVacant!8578 (index!36683 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43814 (_ BitVec 32)) SeekEntryResult!8578)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43814 (_ BitVec 32)) SeekEntryResult!8578)

(assert (=> b!805303 (= res!549823 (= (seekEntryOrOpen!0 lt!360556 lt!360557 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360556 lt!360557 mask!3266)))))

(assert (=> b!805303 (= lt!360556 (select (store (arr!20987 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!805303 (= lt!360557 (array!43815 (store (arr!20987 a!3170) i!1163 k!2044) (size!21408 a!3170)))))

(declare-fun b!805304 () Bool)

(declare-fun res!549819 () Bool)

(assert (=> b!805304 (=> (not res!549819) (not e!445994))))

(assert (=> b!805304 (= res!549819 (validKeyInArray!0 k!2044))))

(declare-fun b!805305 () Bool)

(declare-fun res!549825 () Bool)

(assert (=> b!805305 (=> (not res!549825) (not e!445994))))

(assert (=> b!805305 (= res!549825 (and (= (size!21408 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21408 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21408 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805306 () Bool)

(declare-fun res!549824 () Bool)

(assert (=> b!805306 (=> (not res!549824) (not e!445991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43814 (_ BitVec 32)) Bool)

(assert (=> b!805306 (= res!549824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805307 () Bool)

(assert (=> b!805307 (= e!445992 false)))

(declare-fun lt!360558 () SeekEntryResult!8578)

(assert (=> b!805307 (= lt!360558 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20987 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360559 () SeekEntryResult!8578)

(assert (=> b!805307 (= lt!360559 (seekEntryOrOpen!0 (select (arr!20987 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805308 () Bool)

(assert (=> b!805308 (= e!445994 e!445991)))

(declare-fun res!549818 () Bool)

(assert (=> b!805308 (=> (not res!549818) (not e!445991))))

(declare-fun lt!360560 () SeekEntryResult!8578)

(assert (=> b!805308 (= res!549818 (or (= lt!360560 (MissingZero!8578 i!1163)) (= lt!360560 (MissingVacant!8578 i!1163))))))

(assert (=> b!805308 (= lt!360560 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!69024 res!549826) b!805305))

(assert (= (and b!805305 res!549825) b!805300))

(assert (= (and b!805300 res!549822) b!805304))

(assert (= (and b!805304 res!549819) b!805302))

(assert (= (and b!805302 res!549821) b!805308))

(assert (= (and b!805308 res!549818) b!805306))

(assert (= (and b!805306 res!549824) b!805301))

(assert (= (and b!805301 res!549820) b!805299))

(assert (= (and b!805299 res!549827) b!805303))

(assert (= (and b!805303 res!549823) b!805307))

(declare-fun m!747229 () Bool)

(assert (=> start!69024 m!747229))

(declare-fun m!747231 () Bool)

(assert (=> start!69024 m!747231))

(declare-fun m!747233 () Bool)

(assert (=> b!805302 m!747233))

(declare-fun m!747235 () Bool)

(assert (=> b!805299 m!747235))

(declare-fun m!747237 () Bool)

(assert (=> b!805299 m!747237))

(declare-fun m!747239 () Bool)

(assert (=> b!805307 m!747239))

(assert (=> b!805307 m!747239))

(declare-fun m!747241 () Bool)

(assert (=> b!805307 m!747241))

(assert (=> b!805307 m!747239))

(declare-fun m!747243 () Bool)

(assert (=> b!805307 m!747243))

(declare-fun m!747245 () Bool)

(assert (=> b!805303 m!747245))

(declare-fun m!747247 () Bool)

(assert (=> b!805303 m!747247))

(declare-fun m!747249 () Bool)

(assert (=> b!805303 m!747249))

(declare-fun m!747251 () Bool)

(assert (=> b!805303 m!747251))

(declare-fun m!747253 () Bool)

(assert (=> b!805301 m!747253))

(declare-fun m!747255 () Bool)

(assert (=> b!805304 m!747255))

(declare-fun m!747257 () Bool)

(assert (=> b!805306 m!747257))

(assert (=> b!805300 m!747239))

(assert (=> b!805300 m!747239))

(declare-fun m!747259 () Bool)

(assert (=> b!805300 m!747259))

(declare-fun m!747261 () Bool)

(assert (=> b!805308 m!747261))

(push 1)

(assert (not b!805308))

(assert (not b!805302))

