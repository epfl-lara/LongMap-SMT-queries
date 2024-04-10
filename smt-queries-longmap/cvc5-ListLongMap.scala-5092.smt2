; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69158 () Bool)

(assert start!69158)

(declare-fun res!550570 () Bool)

(declare-fun e!446592 () Bool)

(assert (=> start!69158 (=> (not res!550570) (not e!446592))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69158 (= res!550570 (validMask!0 mask!3266))))

(assert (=> start!69158 e!446592))

(assert (=> start!69158 true))

(declare-datatypes ((array!43858 0))(
  ( (array!43859 (arr!21006 (Array (_ BitVec 32) (_ BitVec 64))) (size!21427 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43858)

(declare-fun array_inv!16802 (array!43858) Bool)

(assert (=> start!69158 (array_inv!16802 a!3170)))

(declare-fun b!806438 () Bool)

(declare-fun res!550564 () Bool)

(assert (=> b!806438 (=> (not res!550564) (not e!446592))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43858 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806438 (= res!550564 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806439 () Bool)

(declare-fun res!550567 () Bool)

(assert (=> b!806439 (=> (not res!550567) (not e!446592))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!806439 (= res!550567 (and (= (size!21427 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21427 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21427 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806440 () Bool)

(declare-fun e!446591 () Bool)

(declare-fun e!446594 () Bool)

(assert (=> b!806440 (= e!446591 e!446594)))

(declare-fun res!550566 () Bool)

(assert (=> b!806440 (=> (not res!550566) (not e!446594))))

(declare-datatypes ((SeekEntryResult!8597 0))(
  ( (MissingZero!8597 (index!36756 (_ BitVec 32))) (Found!8597 (index!36757 (_ BitVec 32))) (Intermediate!8597 (undefined!9409 Bool) (index!36758 (_ BitVec 32)) (x!67577 (_ BitVec 32))) (Undefined!8597) (MissingVacant!8597 (index!36759 (_ BitVec 32))) )
))
(declare-fun lt!361142 () SeekEntryResult!8597)

(declare-fun lt!361141 () SeekEntryResult!8597)

(assert (=> b!806440 (= res!550566 (= lt!361142 lt!361141))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361138 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!361136 () array!43858)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43858 (_ BitVec 32)) SeekEntryResult!8597)

(assert (=> b!806440 (= lt!361141 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361138 lt!361136 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43858 (_ BitVec 32)) SeekEntryResult!8597)

(assert (=> b!806440 (= lt!361142 (seekEntryOrOpen!0 lt!361138 lt!361136 mask!3266))))

(assert (=> b!806440 (= lt!361138 (select (store (arr!21006 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!806440 (= lt!361136 (array!43859 (store (arr!21006 a!3170) i!1163 k!2044) (size!21427 a!3170)))))

(declare-fun b!806441 () Bool)

(declare-fun res!550562 () Bool)

(assert (=> b!806441 (=> (not res!550562) (not e!446591))))

(declare-datatypes ((List!14969 0))(
  ( (Nil!14966) (Cons!14965 (h!16094 (_ BitVec 64)) (t!21284 List!14969)) )
))
(declare-fun arrayNoDuplicates!0 (array!43858 (_ BitVec 32) List!14969) Bool)

(assert (=> b!806441 (= res!550562 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14966))))

(declare-fun b!806442 () Bool)

(declare-fun res!550565 () Bool)

(assert (=> b!806442 (=> (not res!550565) (not e!446592))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806442 (= res!550565 (validKeyInArray!0 k!2044))))

(declare-fun b!806443 () Bool)

(declare-fun res!550561 () Bool)

(assert (=> b!806443 (=> (not res!550561) (not e!446592))))

(assert (=> b!806443 (= res!550561 (validKeyInArray!0 (select (arr!21006 a!3170) j!153)))))

(declare-fun b!806444 () Bool)

(declare-fun e!446593 () Bool)

(assert (=> b!806444 (= e!446594 e!446593)))

(declare-fun res!550568 () Bool)

(assert (=> b!806444 (=> (not res!550568) (not e!446593))))

(declare-fun lt!361137 () SeekEntryResult!8597)

(declare-fun lt!361139 () SeekEntryResult!8597)

(assert (=> b!806444 (= res!550568 (and (= lt!361139 lt!361137) (= lt!361137 (Found!8597 j!153)) (= (select (arr!21006 a!3170) index!1236) (select (arr!21006 a!3170) j!153))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!806444 (= lt!361137 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21006 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!806444 (= lt!361139 (seekEntryOrOpen!0 (select (arr!21006 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806445 () Bool)

(declare-fun res!550571 () Bool)

(assert (=> b!806445 (=> (not res!550571) (not e!446591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43858 (_ BitVec 32)) Bool)

(assert (=> b!806445 (= res!550571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806446 () Bool)

(assert (=> b!806446 (= e!446592 e!446591)))

(declare-fun res!550563 () Bool)

(assert (=> b!806446 (=> (not res!550563) (not e!446591))))

(declare-fun lt!361140 () SeekEntryResult!8597)

(assert (=> b!806446 (= res!550563 (or (= lt!361140 (MissingZero!8597 i!1163)) (= lt!361140 (MissingVacant!8597 i!1163))))))

(assert (=> b!806446 (= lt!361140 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!806447 () Bool)

(declare-fun res!550569 () Bool)

(assert (=> b!806447 (=> (not res!550569) (not e!446591))))

(assert (=> b!806447 (= res!550569 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21427 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21006 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21427 a!3170)) (= (select (arr!21006 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806448 () Bool)

(assert (=> b!806448 (= e!446593 (not true))))

(assert (=> b!806448 (= lt!361141 (Found!8597 index!1236))))

(assert (= (and start!69158 res!550570) b!806439))

(assert (= (and b!806439 res!550567) b!806443))

(assert (= (and b!806443 res!550561) b!806442))

(assert (= (and b!806442 res!550565) b!806438))

(assert (= (and b!806438 res!550564) b!806446))

(assert (= (and b!806446 res!550563) b!806445))

(assert (= (and b!806445 res!550571) b!806441))

(assert (= (and b!806441 res!550562) b!806447))

(assert (= (and b!806447 res!550569) b!806440))

(assert (= (and b!806440 res!550566) b!806444))

(assert (= (and b!806444 res!550568) b!806448))

(declare-fun m!748361 () Bool)

(assert (=> b!806438 m!748361))

(declare-fun m!748363 () Bool)

(assert (=> b!806440 m!748363))

(declare-fun m!748365 () Bool)

(assert (=> b!806440 m!748365))

(declare-fun m!748367 () Bool)

(assert (=> b!806440 m!748367))

(declare-fun m!748369 () Bool)

(assert (=> b!806440 m!748369))

(declare-fun m!748371 () Bool)

(assert (=> b!806443 m!748371))

(assert (=> b!806443 m!748371))

(declare-fun m!748373 () Bool)

(assert (=> b!806443 m!748373))

(declare-fun m!748375 () Bool)

(assert (=> b!806441 m!748375))

(declare-fun m!748377 () Bool)

(assert (=> b!806445 m!748377))

(declare-fun m!748379 () Bool)

(assert (=> b!806444 m!748379))

(assert (=> b!806444 m!748371))

(assert (=> b!806444 m!748371))

(declare-fun m!748381 () Bool)

(assert (=> b!806444 m!748381))

(assert (=> b!806444 m!748371))

(declare-fun m!748383 () Bool)

(assert (=> b!806444 m!748383))

(declare-fun m!748385 () Bool)

(assert (=> start!69158 m!748385))

(declare-fun m!748387 () Bool)

(assert (=> start!69158 m!748387))

(declare-fun m!748389 () Bool)

(assert (=> b!806442 m!748389))

(declare-fun m!748391 () Bool)

(assert (=> b!806447 m!748391))

(declare-fun m!748393 () Bool)

(assert (=> b!806447 m!748393))

(declare-fun m!748395 () Bool)

(assert (=> b!806446 m!748395))

(push 1)

