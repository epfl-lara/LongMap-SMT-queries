; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68678 () Bool)

(assert start!68678)

(declare-fun b!799548 () Bool)

(declare-fun res!544077 () Bool)

(declare-fun e!443382 () Bool)

(assert (=> b!799548 (=> (not res!544077) (not e!443382))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799548 (= res!544077 (validKeyInArray!0 k!2044))))

(declare-fun b!799549 () Bool)

(declare-fun e!443380 () Bool)

(assert (=> b!799549 (= e!443382 e!443380)))

(declare-fun res!544075 () Bool)

(assert (=> b!799549 (=> (not res!544075) (not e!443380))))

(declare-datatypes ((SeekEntryResult!8405 0))(
  ( (MissingZero!8405 (index!35988 (_ BitVec 32))) (Found!8405 (index!35989 (_ BitVec 32))) (Intermediate!8405 (undefined!9217 Bool) (index!35990 (_ BitVec 32)) (x!66867 (_ BitVec 32))) (Undefined!8405) (MissingVacant!8405 (index!35991 (_ BitVec 32))) )
))
(declare-fun lt!357060 () SeekEntryResult!8405)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799549 (= res!544075 (or (= lt!357060 (MissingZero!8405 i!1163)) (= lt!357060 (MissingVacant!8405 i!1163))))))

(declare-datatypes ((array!43468 0))(
  ( (array!43469 (arr!20814 (Array (_ BitVec 32) (_ BitVec 64))) (size!21235 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43468)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43468 (_ BitVec 32)) SeekEntryResult!8405)

(assert (=> b!799549 (= lt!357060 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!799550 () Bool)

(declare-fun e!443383 () Bool)

(declare-fun e!443384 () Bool)

(assert (=> b!799550 (= e!443383 e!443384)))

(declare-fun res!544076 () Bool)

(assert (=> b!799550 (=> (not res!544076) (not e!443384))))

(declare-fun lt!357059 () SeekEntryResult!8405)

(declare-fun lt!357064 () SeekEntryResult!8405)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!799550 (= res!544076 (and (= lt!357059 lt!357064) (= lt!357064 (Found!8405 j!153)) (not (= (select (arr!20814 a!3170) index!1236) (select (arr!20814 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43468 (_ BitVec 32)) SeekEntryResult!8405)

(assert (=> b!799550 (= lt!357064 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20814 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799550 (= lt!357059 (seekEntryOrOpen!0 (select (arr!20814 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!544070 () Bool)

(assert (=> start!68678 (=> (not res!544070) (not e!443382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68678 (= res!544070 (validMask!0 mask!3266))))

(assert (=> start!68678 e!443382))

(assert (=> start!68678 true))

(declare-fun array_inv!16610 (array!43468) Bool)

(assert (=> start!68678 (array_inv!16610 a!3170)))

(declare-fun b!799551 () Bool)

(declare-fun res!544074 () Bool)

(assert (=> b!799551 (=> (not res!544074) (not e!443382))))

(assert (=> b!799551 (= res!544074 (and (= (size!21235 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21235 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21235 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799552 () Bool)

(assert (=> b!799552 (= e!443380 e!443383)))

(declare-fun res!544079 () Bool)

(assert (=> b!799552 (=> (not res!544079) (not e!443383))))

(declare-fun lt!357065 () (_ BitVec 64))

(declare-fun lt!357063 () SeekEntryResult!8405)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!357062 () array!43468)

(assert (=> b!799552 (= res!544079 (= lt!357063 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357065 lt!357062 mask!3266)))))

(assert (=> b!799552 (= lt!357063 (seekEntryOrOpen!0 lt!357065 lt!357062 mask!3266))))

(assert (=> b!799552 (= lt!357065 (select (store (arr!20814 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!799552 (= lt!357062 (array!43469 (store (arr!20814 a!3170) i!1163 k!2044) (size!21235 a!3170)))))

(declare-fun b!799553 () Bool)

(declare-fun res!544071 () Bool)

(assert (=> b!799553 (=> (not res!544071) (not e!443382))))

(declare-fun arrayContainsKey!0 (array!43468 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799553 (= res!544071 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799554 () Bool)

(declare-fun res!544073 () Bool)

(assert (=> b!799554 (=> (not res!544073) (not e!443380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43468 (_ BitVec 32)) Bool)

(assert (=> b!799554 (= res!544073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799555 () Bool)

(declare-fun res!544069 () Bool)

(declare-fun e!443381 () Bool)

(assert (=> b!799555 (=> (not res!544069) (not e!443381))))

(declare-fun lt!357058 () (_ BitVec 32))

(assert (=> b!799555 (= res!544069 (= lt!357063 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357058 vacantAfter!23 lt!357065 lt!357062 mask!3266)))))

(declare-fun b!799556 () Bool)

(assert (=> b!799556 (= e!443384 e!443381)))

(declare-fun res!544068 () Bool)

(assert (=> b!799556 (=> (not res!544068) (not e!443381))))

(assert (=> b!799556 (= res!544068 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357058 #b00000000000000000000000000000000) (bvslt lt!357058 (size!21235 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799556 (= lt!357058 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!799557 () Bool)

(assert (=> b!799557 (= e!443381 false)))

(declare-fun lt!357061 () SeekEntryResult!8405)

(assert (=> b!799557 (= lt!357061 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357058 vacantBefore!23 (select (arr!20814 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799558 () Bool)

(declare-fun res!544067 () Bool)

(assert (=> b!799558 (=> (not res!544067) (not e!443380))))

(declare-datatypes ((List!14777 0))(
  ( (Nil!14774) (Cons!14773 (h!15902 (_ BitVec 64)) (t!21092 List!14777)) )
))
(declare-fun arrayNoDuplicates!0 (array!43468 (_ BitVec 32) List!14777) Bool)

(assert (=> b!799558 (= res!544067 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14774))))

(declare-fun b!799559 () Bool)

(declare-fun res!544072 () Bool)

(assert (=> b!799559 (=> (not res!544072) (not e!443382))))

(assert (=> b!799559 (= res!544072 (validKeyInArray!0 (select (arr!20814 a!3170) j!153)))))

(declare-fun b!799560 () Bool)

(declare-fun res!544078 () Bool)

(assert (=> b!799560 (=> (not res!544078) (not e!443380))))

(assert (=> b!799560 (= res!544078 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21235 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20814 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21235 a!3170)) (= (select (arr!20814 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68678 res!544070) b!799551))

(assert (= (and b!799551 res!544074) b!799559))

(assert (= (and b!799559 res!544072) b!799548))

(assert (= (and b!799548 res!544077) b!799553))

(assert (= (and b!799553 res!544071) b!799549))

(assert (= (and b!799549 res!544075) b!799554))

(assert (= (and b!799554 res!544073) b!799558))

(assert (= (and b!799558 res!544067) b!799560))

(assert (= (and b!799560 res!544078) b!799552))

(assert (= (and b!799552 res!544079) b!799550))

(assert (= (and b!799550 res!544076) b!799556))

(assert (= (and b!799556 res!544068) b!799555))

(assert (= (and b!799555 res!544069) b!799557))

(declare-fun m!740567 () Bool)

(assert (=> start!68678 m!740567))

(declare-fun m!740569 () Bool)

(assert (=> start!68678 m!740569))

(declare-fun m!740571 () Bool)

(assert (=> b!799560 m!740571))

(declare-fun m!740573 () Bool)

(assert (=> b!799560 m!740573))

(declare-fun m!740575 () Bool)

(assert (=> b!799550 m!740575))

(declare-fun m!740577 () Bool)

(assert (=> b!799550 m!740577))

(assert (=> b!799550 m!740577))

(declare-fun m!740579 () Bool)

(assert (=> b!799550 m!740579))

(assert (=> b!799550 m!740577))

(declare-fun m!740581 () Bool)

(assert (=> b!799550 m!740581))

(declare-fun m!740583 () Bool)

(assert (=> b!799556 m!740583))

(declare-fun m!740585 () Bool)

(assert (=> b!799554 m!740585))

(declare-fun m!740587 () Bool)

(assert (=> b!799552 m!740587))

(declare-fun m!740589 () Bool)

(assert (=> b!799552 m!740589))

(declare-fun m!740591 () Bool)

(assert (=> b!799552 m!740591))

(declare-fun m!740593 () Bool)

(assert (=> b!799552 m!740593))

(declare-fun m!740595 () Bool)

(assert (=> b!799558 m!740595))

(declare-fun m!740597 () Bool)

(assert (=> b!799548 m!740597))

(declare-fun m!740599 () Bool)

(assert (=> b!799549 m!740599))

(assert (=> b!799557 m!740577))

(assert (=> b!799557 m!740577))

(declare-fun m!740601 () Bool)

(assert (=> b!799557 m!740601))

(declare-fun m!740603 () Bool)

(assert (=> b!799553 m!740603))

(declare-fun m!740605 () Bool)

(assert (=> b!799555 m!740605))

(assert (=> b!799559 m!740577))

(assert (=> b!799559 m!740577))

(declare-fun m!740607 () Bool)

(assert (=> b!799559 m!740607))

(push 1)

