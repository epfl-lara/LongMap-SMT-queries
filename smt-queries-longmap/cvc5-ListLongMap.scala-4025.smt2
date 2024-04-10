; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54856 () Bool)

(assert start!54856)

(declare-fun res!384504 () Bool)

(declare-fun e!342756 () Bool)

(assert (=> start!54856 (=> (not res!384504) (not e!342756))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54856 (= res!384504 (validMask!0 mask!3053))))

(assert (=> start!54856 e!342756))

(assert (=> start!54856 true))

(declare-datatypes ((array!37091 0))(
  ( (array!37092 (arr!17805 (Array (_ BitVec 32) (_ BitVec 64))) (size!18169 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37091)

(declare-fun array_inv!13601 (array!37091) Bool)

(assert (=> start!54856 (array_inv!13601 a!2986)))

(declare-fun b!599525 () Bool)

(declare-fun e!342754 () Bool)

(declare-fun e!342758 () Bool)

(assert (=> b!599525 (= e!342754 e!342758)))

(declare-fun res!384506 () Bool)

(assert (=> b!599525 (=> (not res!384506) (not e!342758))))

(declare-fun lt!272553 () array!37091)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599525 (= res!384506 (arrayContainsKey!0 lt!272553 (select (arr!17805 a!2986) j!136) j!136))))

(declare-fun b!599526 () Bool)

(declare-fun res!384510 () Bool)

(declare-fun e!342763 () Bool)

(assert (=> b!599526 (=> res!384510 e!342763)))

(declare-datatypes ((List!11846 0))(
  ( (Nil!11843) (Cons!11842 (h!12887 (_ BitVec 64)) (t!18074 List!11846)) )
))
(declare-fun contains!2962 (List!11846 (_ BitVec 64)) Bool)

(assert (=> b!599526 (= res!384510 (contains!2962 Nil!11843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599527 () Bool)

(declare-fun res!384493 () Bool)

(assert (=> b!599527 (=> (not res!384493) (not e!342756))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!599527 (= res!384493 (and (= (size!18169 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18169 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18169 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!599528 () Bool)

(declare-fun res!384501 () Bool)

(declare-fun e!342753 () Bool)

(assert (=> b!599528 (=> (not res!384501) (not e!342753))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!599528 (= res!384501 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17805 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!599529 () Bool)

(assert (=> b!599529 (= e!342758 (arrayContainsKey!0 lt!272553 (select (arr!17805 a!2986) j!136) index!984))))

(declare-fun b!599530 () Bool)

(declare-datatypes ((Unit!18898 0))(
  ( (Unit!18899) )
))
(declare-fun e!342764 () Unit!18898)

(declare-fun Unit!18900 () Unit!18898)

(assert (=> b!599530 (= e!342764 Unit!18900)))

(assert (=> b!599530 false))

(declare-fun b!599531 () Bool)

(declare-fun e!342759 () Bool)

(declare-fun e!342760 () Bool)

(assert (=> b!599531 (= e!342759 (not e!342760))))

(declare-fun res!384511 () Bool)

(assert (=> b!599531 (=> res!384511 e!342760)))

(declare-datatypes ((SeekEntryResult!6245 0))(
  ( (MissingZero!6245 (index!27237 (_ BitVec 32))) (Found!6245 (index!27238 (_ BitVec 32))) (Intermediate!6245 (undefined!7057 Bool) (index!27239 (_ BitVec 32)) (x!56044 (_ BitVec 32))) (Undefined!6245) (MissingVacant!6245 (index!27240 (_ BitVec 32))) )
))
(declare-fun lt!272560 () SeekEntryResult!6245)

(assert (=> b!599531 (= res!384511 (not (= lt!272560 (Found!6245 index!984))))))

(declare-fun lt!272558 () Unit!18898)

(assert (=> b!599531 (= lt!272558 e!342764)))

(declare-fun c!67883 () Bool)

(assert (=> b!599531 (= c!67883 (= lt!272560 Undefined!6245))))

(declare-fun lt!272554 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37091 (_ BitVec 32)) SeekEntryResult!6245)

(assert (=> b!599531 (= lt!272560 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272554 lt!272553 mask!3053))))

(declare-fun e!342757 () Bool)

(assert (=> b!599531 e!342757))

(declare-fun res!384507 () Bool)

(assert (=> b!599531 (=> (not res!384507) (not e!342757))))

(declare-fun lt!272562 () SeekEntryResult!6245)

(declare-fun lt!272550 () (_ BitVec 32))

(assert (=> b!599531 (= res!384507 (= lt!272562 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272550 vacantSpotIndex!68 lt!272554 lt!272553 mask!3053)))))

(assert (=> b!599531 (= lt!272562 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272550 vacantSpotIndex!68 (select (arr!17805 a!2986) j!136) a!2986 mask!3053))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!599531 (= lt!272554 (select (store (arr!17805 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!272556 () Unit!18898)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37091 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18898)

(assert (=> b!599531 (= lt!272556 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272550 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599531 (= lt!272550 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!599532 () Bool)

(declare-fun e!342765 () Bool)

(assert (=> b!599532 (= e!342760 e!342765)))

(declare-fun res!384494 () Bool)

(assert (=> b!599532 (=> res!384494 e!342765)))

(declare-fun lt!272552 () (_ BitVec 64))

(assert (=> b!599532 (= res!384494 (or (not (= (select (arr!17805 a!2986) j!136) lt!272554)) (not (= (select (arr!17805 a!2986) j!136) lt!272552)) (bvsge j!136 index!984)))))

(declare-fun e!342761 () Bool)

(assert (=> b!599532 e!342761))

(declare-fun res!384505 () Bool)

(assert (=> b!599532 (=> (not res!384505) (not e!342761))))

(assert (=> b!599532 (= res!384505 (= lt!272552 (select (arr!17805 a!2986) j!136)))))

(assert (=> b!599532 (= lt!272552 (select (store (arr!17805 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!599533 () Bool)

(declare-fun Unit!18901 () Unit!18898)

(assert (=> b!599533 (= e!342764 Unit!18901)))

(declare-fun b!599534 () Bool)

(assert (=> b!599534 (= e!342756 e!342753)))

(declare-fun res!384500 () Bool)

(assert (=> b!599534 (=> (not res!384500) (not e!342753))))

(declare-fun lt!272561 () SeekEntryResult!6245)

(assert (=> b!599534 (= res!384500 (or (= lt!272561 (MissingZero!6245 i!1108)) (= lt!272561 (MissingVacant!6245 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37091 (_ BitVec 32)) SeekEntryResult!6245)

(assert (=> b!599534 (= lt!272561 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!599535 () Bool)

(assert (=> b!599535 (= e!342765 e!342763)))

(declare-fun res!384498 () Bool)

(assert (=> b!599535 (=> res!384498 e!342763)))

(assert (=> b!599535 (= res!384498 (or (bvsge (size!18169 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18169 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!37091 (_ BitVec 32) List!11846) Bool)

(assert (=> b!599535 (arrayNoDuplicates!0 lt!272553 j!136 Nil!11843)))

(declare-fun lt!272563 () Unit!18898)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37091 (_ BitVec 32) (_ BitVec 32)) Unit!18898)

(assert (=> b!599535 (= lt!272563 (lemmaNoDuplicateFromThenFromBigger!0 lt!272553 #b00000000000000000000000000000000 j!136))))

(assert (=> b!599535 (arrayNoDuplicates!0 lt!272553 #b00000000000000000000000000000000 Nil!11843)))

(declare-fun lt!272551 () Unit!18898)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37091 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11846) Unit!18898)

(assert (=> b!599535 (= lt!272551 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11843))))

(assert (=> b!599535 (arrayContainsKey!0 lt!272553 (select (arr!17805 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272559 () Unit!18898)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37091 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18898)

(assert (=> b!599535 (= lt!272559 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272553 (select (arr!17805 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599536 () Bool)

(declare-fun res!384499 () Bool)

(assert (=> b!599536 (=> (not res!384499) (not e!342753))))

(assert (=> b!599536 (= res!384499 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11843))))

(declare-fun b!599537 () Bool)

(declare-fun e!342762 () Bool)

(assert (=> b!599537 (= e!342762 e!342759)))

(declare-fun res!384502 () Bool)

(assert (=> b!599537 (=> (not res!384502) (not e!342759))))

(declare-fun lt!272557 () SeekEntryResult!6245)

(assert (=> b!599537 (= res!384502 (and (= lt!272557 (Found!6245 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17805 a!2986) index!984) (select (arr!17805 a!2986) j!136))) (not (= (select (arr!17805 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!599537 (= lt!272557 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17805 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!599538 () Bool)

(assert (=> b!599538 (= e!342753 e!342762)))

(declare-fun res!384509 () Bool)

(assert (=> b!599538 (=> (not res!384509) (not e!342762))))

(assert (=> b!599538 (= res!384509 (= (select (store (arr!17805 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!599538 (= lt!272553 (array!37092 (store (arr!17805 a!2986) i!1108 k!1786) (size!18169 a!2986)))))

(declare-fun b!599539 () Bool)

(declare-fun res!384497 () Bool)

(assert (=> b!599539 (=> (not res!384497) (not e!342756))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599539 (= res!384497 (validKeyInArray!0 k!1786))))

(declare-fun b!599540 () Bool)

(declare-fun res!384508 () Bool)

(assert (=> b!599540 (=> res!384508 e!342763)))

(declare-fun noDuplicate!279 (List!11846) Bool)

(assert (=> b!599540 (= res!384508 (not (noDuplicate!279 Nil!11843)))))

(declare-fun b!599541 () Bool)

(declare-fun res!384512 () Bool)

(assert (=> b!599541 (=> (not res!384512) (not e!342756))))

(assert (=> b!599541 (= res!384512 (validKeyInArray!0 (select (arr!17805 a!2986) j!136)))))

(declare-fun b!599542 () Bool)

(assert (=> b!599542 (= e!342763 true)))

(declare-fun lt!272555 () Bool)

(assert (=> b!599542 (= lt!272555 (contains!2962 Nil!11843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599543 () Bool)

(declare-fun res!384503 () Bool)

(assert (=> b!599543 (=> (not res!384503) (not e!342756))))

(assert (=> b!599543 (= res!384503 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599544 () Bool)

(assert (=> b!599544 (= e!342761 e!342754)))

(declare-fun res!384496 () Bool)

(assert (=> b!599544 (=> res!384496 e!342754)))

(assert (=> b!599544 (= res!384496 (or (not (= (select (arr!17805 a!2986) j!136) lt!272554)) (not (= (select (arr!17805 a!2986) j!136) lt!272552)) (bvsge j!136 index!984)))))

(declare-fun b!599545 () Bool)

(assert (=> b!599545 (= e!342757 (= lt!272557 lt!272562))))

(declare-fun b!599546 () Bool)

(declare-fun res!384495 () Bool)

(assert (=> b!599546 (=> (not res!384495) (not e!342753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37091 (_ BitVec 32)) Bool)

(assert (=> b!599546 (= res!384495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!54856 res!384504) b!599527))

(assert (= (and b!599527 res!384493) b!599541))

(assert (= (and b!599541 res!384512) b!599539))

(assert (= (and b!599539 res!384497) b!599543))

(assert (= (and b!599543 res!384503) b!599534))

(assert (= (and b!599534 res!384500) b!599546))

(assert (= (and b!599546 res!384495) b!599536))

(assert (= (and b!599536 res!384499) b!599528))

(assert (= (and b!599528 res!384501) b!599538))

(assert (= (and b!599538 res!384509) b!599537))

(assert (= (and b!599537 res!384502) b!599531))

(assert (= (and b!599531 res!384507) b!599545))

(assert (= (and b!599531 c!67883) b!599530))

(assert (= (and b!599531 (not c!67883)) b!599533))

(assert (= (and b!599531 (not res!384511)) b!599532))

(assert (= (and b!599532 res!384505) b!599544))

(assert (= (and b!599544 (not res!384496)) b!599525))

(assert (= (and b!599525 res!384506) b!599529))

(assert (= (and b!599532 (not res!384494)) b!599535))

(assert (= (and b!599535 (not res!384498)) b!599540))

(assert (= (and b!599540 (not res!384508)) b!599526))

(assert (= (and b!599526 (not res!384510)) b!599542))

(declare-fun m!576773 () Bool)

(assert (=> b!599536 m!576773))

(declare-fun m!576775 () Bool)

(assert (=> b!599543 m!576775))

(declare-fun m!576777 () Bool)

(assert (=> b!599538 m!576777))

(declare-fun m!576779 () Bool)

(assert (=> b!599538 m!576779))

(declare-fun m!576781 () Bool)

(assert (=> b!599532 m!576781))

(assert (=> b!599532 m!576777))

(declare-fun m!576783 () Bool)

(assert (=> b!599532 m!576783))

(declare-fun m!576785 () Bool)

(assert (=> b!599534 m!576785))

(declare-fun m!576787 () Bool)

(assert (=> b!599528 m!576787))

(assert (=> b!599541 m!576781))

(assert (=> b!599541 m!576781))

(declare-fun m!576789 () Bool)

(assert (=> b!599541 m!576789))

(declare-fun m!576791 () Bool)

(assert (=> b!599537 m!576791))

(assert (=> b!599537 m!576781))

(assert (=> b!599537 m!576781))

(declare-fun m!576793 () Bool)

(assert (=> b!599537 m!576793))

(declare-fun m!576795 () Bool)

(assert (=> b!599526 m!576795))

(declare-fun m!576797 () Bool)

(assert (=> b!599540 m!576797))

(declare-fun m!576799 () Bool)

(assert (=> start!54856 m!576799))

(declare-fun m!576801 () Bool)

(assert (=> start!54856 m!576801))

(declare-fun m!576803 () Bool)

(assert (=> b!599546 m!576803))

(assert (=> b!599525 m!576781))

(assert (=> b!599525 m!576781))

(declare-fun m!576805 () Bool)

(assert (=> b!599525 m!576805))

(declare-fun m!576807 () Bool)

(assert (=> b!599539 m!576807))

(assert (=> b!599535 m!576781))

(declare-fun m!576809 () Bool)

(assert (=> b!599535 m!576809))

(assert (=> b!599535 m!576781))

(declare-fun m!576811 () Bool)

(assert (=> b!599535 m!576811))

(declare-fun m!576813 () Bool)

(assert (=> b!599535 m!576813))

(assert (=> b!599535 m!576781))

(declare-fun m!576815 () Bool)

(assert (=> b!599535 m!576815))

(declare-fun m!576817 () Bool)

(assert (=> b!599535 m!576817))

(declare-fun m!576819 () Bool)

(assert (=> b!599535 m!576819))

(declare-fun m!576821 () Bool)

(assert (=> b!599542 m!576821))

(assert (=> b!599529 m!576781))

(assert (=> b!599529 m!576781))

(declare-fun m!576823 () Bool)

(assert (=> b!599529 m!576823))

(declare-fun m!576825 () Bool)

(assert (=> b!599531 m!576825))

(declare-fun m!576827 () Bool)

(assert (=> b!599531 m!576827))

(assert (=> b!599531 m!576781))

(declare-fun m!576829 () Bool)

(assert (=> b!599531 m!576829))

(assert (=> b!599531 m!576781))

(assert (=> b!599531 m!576777))

(declare-fun m!576831 () Bool)

(assert (=> b!599531 m!576831))

(declare-fun m!576833 () Bool)

(assert (=> b!599531 m!576833))

(declare-fun m!576835 () Bool)

(assert (=> b!599531 m!576835))

(assert (=> b!599544 m!576781))

(push 1)

