; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69218 () Bool)

(assert start!69218)

(declare-fun b!807437 () Bool)

(declare-fun res!551570 () Bool)

(declare-fun e!447053 () Bool)

(assert (=> b!807437 (=> (not res!551570) (not e!447053))))

(declare-datatypes ((array!43918 0))(
  ( (array!43919 (arr!21036 (Array (_ BitVec 32) (_ BitVec 64))) (size!21457 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43918)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43918 (_ BitVec 32)) Bool)

(assert (=> b!807437 (= res!551570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807438 () Bool)

(declare-fun res!551566 () Bool)

(declare-fun e!447050 () Bool)

(assert (=> b!807438 (=> (not res!551566) (not e!447050))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807438 (= res!551566 (validKeyInArray!0 (select (arr!21036 a!3170) j!153)))))

(declare-fun b!807439 () Bool)

(declare-fun res!551564 () Bool)

(assert (=> b!807439 (=> (not res!551564) (not e!447050))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!807439 (= res!551564 (and (= (size!21457 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21457 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21457 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807440 () Bool)

(declare-fun e!447052 () Bool)

(declare-fun e!447049 () Bool)

(assert (=> b!807440 (= e!447052 e!447049)))

(declare-fun res!551562 () Bool)

(assert (=> b!807440 (=> (not res!551562) (not e!447049))))

(declare-datatypes ((SeekEntryResult!8627 0))(
  ( (MissingZero!8627 (index!36876 (_ BitVec 32))) (Found!8627 (index!36877 (_ BitVec 32))) (Intermediate!8627 (undefined!9439 Bool) (index!36878 (_ BitVec 32)) (x!67687 (_ BitVec 32))) (Undefined!8627) (MissingVacant!8627 (index!36879 (_ BitVec 32))) )
))
(declare-fun lt!361731 () SeekEntryResult!8627)

(declare-fun lt!361732 () SeekEntryResult!8627)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!807440 (= res!551562 (and (= lt!361731 lt!361732) (= lt!361732 (Found!8627 j!153)) (not (= (select (arr!21036 a!3170) index!1236) (select (arr!21036 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43918 (_ BitVec 32)) SeekEntryResult!8627)

(assert (=> b!807440 (= lt!361732 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21036 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43918 (_ BitVec 32)) SeekEntryResult!8627)

(assert (=> b!807440 (= lt!361731 (seekEntryOrOpen!0 (select (arr!21036 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807441 () Bool)

(assert (=> b!807441 (= e!447053 e!447052)))

(declare-fun res!551568 () Bool)

(assert (=> b!807441 (=> (not res!551568) (not e!447052))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361733 () (_ BitVec 64))

(declare-fun lt!361729 () array!43918)

(assert (=> b!807441 (= res!551568 (= (seekEntryOrOpen!0 lt!361733 lt!361729 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361733 lt!361729 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!807441 (= lt!361733 (select (store (arr!21036 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!807441 (= lt!361729 (array!43919 (store (arr!21036 a!3170) i!1163 k!2044) (size!21457 a!3170)))))

(declare-fun res!551560 () Bool)

(assert (=> start!69218 (=> (not res!551560) (not e!447050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69218 (= res!551560 (validMask!0 mask!3266))))

(assert (=> start!69218 e!447050))

(assert (=> start!69218 true))

(declare-fun array_inv!16832 (array!43918) Bool)

(assert (=> start!69218 (array_inv!16832 a!3170)))

(declare-fun b!807442 () Bool)

(declare-fun res!551563 () Bool)

(assert (=> b!807442 (=> (not res!551563) (not e!447050))))

(declare-fun arrayContainsKey!0 (array!43918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807442 (= res!551563 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807443 () Bool)

(declare-fun res!551561 () Bool)

(assert (=> b!807443 (=> (not res!551561) (not e!447053))))

(assert (=> b!807443 (= res!551561 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21457 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21036 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21457 a!3170)) (= (select (arr!21036 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807444 () Bool)

(assert (=> b!807444 (= e!447050 e!447053)))

(declare-fun res!551567 () Bool)

(assert (=> b!807444 (=> (not res!551567) (not e!447053))))

(declare-fun lt!361728 () SeekEntryResult!8627)

(assert (=> b!807444 (= res!551567 (or (= lt!361728 (MissingZero!8627 i!1163)) (= lt!361728 (MissingVacant!8627 i!1163))))))

(assert (=> b!807444 (= lt!361728 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!807445 () Bool)

(declare-fun res!551569 () Bool)

(assert (=> b!807445 (=> (not res!551569) (not e!447050))))

(assert (=> b!807445 (= res!551569 (validKeyInArray!0 k!2044))))

(declare-fun b!807446 () Bool)

(declare-fun res!551565 () Bool)

(assert (=> b!807446 (=> (not res!551565) (not e!447053))))

(declare-datatypes ((List!14999 0))(
  ( (Nil!14996) (Cons!14995 (h!16124 (_ BitVec 64)) (t!21314 List!14999)) )
))
(declare-fun arrayNoDuplicates!0 (array!43918 (_ BitVec 32) List!14999) Bool)

(assert (=> b!807446 (= res!551565 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14996))))

(declare-fun b!807447 () Bool)

(assert (=> b!807447 (= e!447049 false)))

(declare-fun lt!361730 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807447 (= lt!361730 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!69218 res!551560) b!807439))

(assert (= (and b!807439 res!551564) b!807438))

(assert (= (and b!807438 res!551566) b!807445))

(assert (= (and b!807445 res!551569) b!807442))

(assert (= (and b!807442 res!551563) b!807444))

(assert (= (and b!807444 res!551567) b!807437))

(assert (= (and b!807437 res!551570) b!807446))

(assert (= (and b!807446 res!551565) b!807443))

(assert (= (and b!807443 res!551561) b!807441))

(assert (= (and b!807441 res!551568) b!807440))

(assert (= (and b!807440 res!551562) b!807447))

(declare-fun m!749471 () Bool)

(assert (=> b!807447 m!749471))

(declare-fun m!749473 () Bool)

(assert (=> b!807441 m!749473))

(declare-fun m!749475 () Bool)

(assert (=> b!807441 m!749475))

(declare-fun m!749477 () Bool)

(assert (=> b!807441 m!749477))

(declare-fun m!749479 () Bool)

(assert (=> b!807441 m!749479))

(declare-fun m!749481 () Bool)

(assert (=> b!807444 m!749481))

(declare-fun m!749483 () Bool)

(assert (=> b!807446 m!749483))

(declare-fun m!749485 () Bool)

(assert (=> b!807440 m!749485))

(declare-fun m!749487 () Bool)

(assert (=> b!807440 m!749487))

(assert (=> b!807440 m!749487))

(declare-fun m!749489 () Bool)

(assert (=> b!807440 m!749489))

(assert (=> b!807440 m!749487))

(declare-fun m!749491 () Bool)

(assert (=> b!807440 m!749491))

(assert (=> b!807438 m!749487))

(assert (=> b!807438 m!749487))

(declare-fun m!749493 () Bool)

(assert (=> b!807438 m!749493))

(declare-fun m!749495 () Bool)

(assert (=> start!69218 m!749495))

(declare-fun m!749497 () Bool)

(assert (=> start!69218 m!749497))

(declare-fun m!749499 () Bool)

(assert (=> b!807443 m!749499))

(declare-fun m!749501 () Bool)

(assert (=> b!807443 m!749501))

(declare-fun m!749503 () Bool)

(assert (=> b!807442 m!749503))

(declare-fun m!749505 () Bool)

(assert (=> b!807445 m!749505))

(declare-fun m!749507 () Bool)

(assert (=> b!807437 m!749507))

(push 1)

