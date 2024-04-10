; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58878 () Bool)

(assert start!58878)

(declare-fun b!649539 () Bool)

(declare-datatypes ((Unit!22122 0))(
  ( (Unit!22123) )
))
(declare-fun e!372567 () Unit!22122)

(declare-fun Unit!22124 () Unit!22122)

(assert (=> b!649539 (= e!372567 Unit!22124)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38540 0))(
  ( (array!38541 (arr!18476 (Array (_ BitVec 32) (_ BitVec 64))) (size!18840 (_ BitVec 32))) )
))
(declare-fun lt!301642 () array!38540)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38540)

(declare-fun lt!301635 () Unit!22122)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38540 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22122)

(assert (=> b!649539 (= lt!301635 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301642 (select (arr!18476 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!649539 (arrayContainsKey!0 lt!301642 (select (arr!18476 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!301643 () Unit!22122)

(declare-datatypes ((List!12517 0))(
  ( (Nil!12514) (Cons!12513 (h!13558 (_ BitVec 64)) (t!18745 List!12517)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38540 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12517) Unit!22122)

(assert (=> b!649539 (= lt!301643 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12514))))

(declare-fun arrayNoDuplicates!0 (array!38540 (_ BitVec 32) List!12517) Bool)

(assert (=> b!649539 (arrayNoDuplicates!0 lt!301642 #b00000000000000000000000000000000 Nil!12514)))

(declare-fun lt!301636 () Unit!22122)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38540 (_ BitVec 32) (_ BitVec 32)) Unit!22122)

(assert (=> b!649539 (= lt!301636 (lemmaNoDuplicateFromThenFromBigger!0 lt!301642 #b00000000000000000000000000000000 j!136))))

(assert (=> b!649539 (arrayNoDuplicates!0 lt!301642 j!136 Nil!12514)))

(declare-fun lt!301640 () Unit!22122)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38540 (_ BitVec 64) (_ BitVec 32) List!12517) Unit!22122)

(assert (=> b!649539 (= lt!301640 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301642 (select (arr!18476 a!2986) j!136) j!136 Nil!12514))))

(assert (=> b!649539 false))

(declare-fun b!649540 () Bool)

(declare-fun res!421040 () Bool)

(declare-fun e!372563 () Bool)

(assert (=> b!649540 (=> (not res!421040) (not e!372563))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38540 (_ BitVec 32)) Bool)

(assert (=> b!649540 (= res!421040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!649541 () Bool)

(declare-fun e!372560 () Bool)

(declare-fun e!372573 () Bool)

(assert (=> b!649541 (= e!372560 e!372573)))

(declare-fun res!421032 () Bool)

(assert (=> b!649541 (=> res!421032 e!372573)))

(declare-fun lt!301637 () (_ BitVec 64))

(declare-fun lt!301648 () (_ BitVec 64))

(assert (=> b!649541 (= res!421032 (or (not (= (select (arr!18476 a!2986) j!136) lt!301637)) (not (= (select (arr!18476 a!2986) j!136) lt!301648)) (bvsge j!136 index!984)))))

(declare-fun b!649542 () Bool)

(declare-fun res!421031 () Bool)

(declare-fun e!372561 () Bool)

(assert (=> b!649542 (=> res!421031 e!372561)))

(declare-fun contains!3172 (List!12517 (_ BitVec 64)) Bool)

(assert (=> b!649542 (= res!421031 (contains!3172 Nil!12514 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!649543 () Bool)

(declare-fun e!372558 () Bool)

(assert (=> b!649543 (= e!372558 e!372561)))

(declare-fun res!421025 () Bool)

(assert (=> b!649543 (=> res!421025 e!372561)))

(assert (=> b!649543 (= res!421025 (or (bvsge (size!18840 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18840 a!2986))))))

(assert (=> b!649543 (arrayContainsKey!0 lt!301642 (select (arr!18476 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301647 () Unit!22122)

(assert (=> b!649543 (= lt!301647 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301642 (select (arr!18476 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!372568 () Bool)

(assert (=> b!649543 e!372568))

(declare-fun res!421028 () Bool)

(assert (=> b!649543 (=> (not res!421028) (not e!372568))))

(assert (=> b!649543 (= res!421028 (arrayContainsKey!0 lt!301642 (select (arr!18476 a!2986) j!136) j!136))))

(declare-fun b!649544 () Bool)

(declare-fun res!421035 () Bool)

(assert (=> b!649544 (=> (not res!421035) (not e!372563))))

(assert (=> b!649544 (= res!421035 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12514))))

(declare-fun b!649545 () Bool)

(declare-fun e!372559 () Bool)

(declare-fun e!372562 () Bool)

(assert (=> b!649545 (= e!372559 e!372562)))

(declare-fun res!421038 () Bool)

(assert (=> b!649545 (=> (not res!421038) (not e!372562))))

(declare-datatypes ((SeekEntryResult!6916 0))(
  ( (MissingZero!6916 (index!30011 (_ BitVec 32))) (Found!6916 (index!30012 (_ BitVec 32))) (Intermediate!6916 (undefined!7728 Bool) (index!30013 (_ BitVec 32)) (x!58793 (_ BitVec 32))) (Undefined!6916) (MissingVacant!6916 (index!30014 (_ BitVec 32))) )
))
(declare-fun lt!301641 () SeekEntryResult!6916)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!649545 (= res!421038 (and (= lt!301641 (Found!6916 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18476 a!2986) index!984) (select (arr!18476 a!2986) j!136))) (not (= (select (arr!18476 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38540 (_ BitVec 32)) SeekEntryResult!6916)

(assert (=> b!649545 (= lt!301641 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18476 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!649546 () Bool)

(declare-fun res!421036 () Bool)

(declare-fun e!372569 () Bool)

(assert (=> b!649546 (=> (not res!421036) (not e!372569))))

(assert (=> b!649546 (= res!421036 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!649547 () Bool)

(declare-fun e!372566 () Bool)

(assert (=> b!649547 (= e!372566 (arrayContainsKey!0 lt!301642 (select (arr!18476 a!2986) j!136) index!984))))

(declare-fun b!649549 () Bool)

(declare-fun res!421034 () Bool)

(assert (=> b!649549 (=> res!421034 e!372561)))

(assert (=> b!649549 (= res!421034 (contains!3172 Nil!12514 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!649550 () Bool)

(declare-fun e!372570 () Unit!22122)

(declare-fun Unit!22125 () Unit!22122)

(assert (=> b!649550 (= e!372570 Unit!22125)))

(assert (=> b!649550 false))

(declare-fun b!649551 () Bool)

(declare-fun Unit!22126 () Unit!22122)

(assert (=> b!649551 (= e!372567 Unit!22126)))

(declare-fun b!649552 () Bool)

(declare-fun Unit!22127 () Unit!22122)

(assert (=> b!649552 (= e!372570 Unit!22127)))

(declare-fun b!649553 () Bool)

(declare-fun e!372565 () Bool)

(assert (=> b!649553 (= e!372562 (not e!372565))))

(declare-fun res!421022 () Bool)

(assert (=> b!649553 (=> res!421022 e!372565)))

(declare-fun lt!301644 () SeekEntryResult!6916)

(assert (=> b!649553 (= res!421022 (not (= lt!301644 (Found!6916 index!984))))))

(declare-fun lt!301646 () Unit!22122)

(assert (=> b!649553 (= lt!301646 e!372570)))

(declare-fun c!74627 () Bool)

(assert (=> b!649553 (= c!74627 (= lt!301644 Undefined!6916))))

(assert (=> b!649553 (= lt!301644 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301637 lt!301642 mask!3053))))

(declare-fun e!372571 () Bool)

(assert (=> b!649553 e!372571))

(declare-fun res!421030 () Bool)

(assert (=> b!649553 (=> (not res!421030) (not e!372571))))

(declare-fun lt!301638 () (_ BitVec 32))

(declare-fun lt!301645 () SeekEntryResult!6916)

(assert (=> b!649553 (= res!421030 (= lt!301645 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301638 vacantSpotIndex!68 lt!301637 lt!301642 mask!3053)))))

(assert (=> b!649553 (= lt!301645 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301638 vacantSpotIndex!68 (select (arr!18476 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!649553 (= lt!301637 (select (store (arr!18476 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!301639 () Unit!22122)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38540 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22122)

(assert (=> b!649553 (= lt!301639 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301638 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!649553 (= lt!301638 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!649554 () Bool)

(declare-fun res!421029 () Bool)

(assert (=> b!649554 (=> (not res!421029) (not e!372569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!649554 (= res!421029 (validKeyInArray!0 (select (arr!18476 a!2986) j!136)))))

(declare-fun b!649555 () Bool)

(assert (=> b!649555 (= e!372561 true)))

(declare-fun lt!301632 () Bool)

(assert (=> b!649555 (= lt!301632 (contains!3172 Nil!12514 k!1786))))

(declare-fun b!649556 () Bool)

(declare-fun res!421026 () Bool)

(assert (=> b!649556 (=> res!421026 e!372561)))

(declare-fun noDuplicate!434 (List!12517) Bool)

(assert (=> b!649556 (= res!421026 (not (noDuplicate!434 Nil!12514)))))

(declare-fun b!649557 () Bool)

(assert (=> b!649557 (= e!372569 e!372563)))

(declare-fun res!421033 () Bool)

(assert (=> b!649557 (=> (not res!421033) (not e!372563))))

(declare-fun lt!301633 () SeekEntryResult!6916)

(assert (=> b!649557 (= res!421033 (or (= lt!301633 (MissingZero!6916 i!1108)) (= lt!301633 (MissingVacant!6916 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38540 (_ BitVec 32)) SeekEntryResult!6916)

(assert (=> b!649557 (= lt!301633 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!649558 () Bool)

(declare-fun e!372564 () Bool)

(assert (=> b!649558 (= e!372565 e!372564)))

(declare-fun res!421024 () Bool)

(assert (=> b!649558 (=> res!421024 e!372564)))

(assert (=> b!649558 (= res!421024 (or (not (= (select (arr!18476 a!2986) j!136) lt!301637)) (not (= (select (arr!18476 a!2986) j!136) lt!301648))))))

(assert (=> b!649558 e!372560))

(declare-fun res!421027 () Bool)

(assert (=> b!649558 (=> (not res!421027) (not e!372560))))

(assert (=> b!649558 (= res!421027 (= lt!301648 (select (arr!18476 a!2986) j!136)))))

(assert (=> b!649558 (= lt!301648 (select (store (arr!18476 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!649559 () Bool)

(assert (=> b!649559 (= e!372563 e!372559)))

(declare-fun res!421039 () Bool)

(assert (=> b!649559 (=> (not res!421039) (not e!372559))))

(assert (=> b!649559 (= res!421039 (= (select (store (arr!18476 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!649559 (= lt!301642 (array!38541 (store (arr!18476 a!2986) i!1108 k!1786) (size!18840 a!2986)))))

(declare-fun b!649560 () Bool)

(declare-fun res!421023 () Bool)

(assert (=> b!649560 (=> (not res!421023) (not e!372563))))

(assert (=> b!649560 (= res!421023 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18476 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!649561 () Bool)

(assert (=> b!649561 (= e!372564 e!372558)))

(declare-fun res!421037 () Bool)

(assert (=> b!649561 (=> res!421037 e!372558)))

(assert (=> b!649561 (= res!421037 (bvsge index!984 j!136))))

(declare-fun lt!301634 () Unit!22122)

(assert (=> b!649561 (= lt!301634 e!372567)))

(declare-fun c!74626 () Bool)

(assert (=> b!649561 (= c!74626 (bvslt j!136 index!984))))

(declare-fun b!649562 () Bool)

(assert (=> b!649562 (= e!372568 (arrayContainsKey!0 lt!301642 (select (arr!18476 a!2986) j!136) index!984))))

(declare-fun b!649548 () Bool)

(assert (=> b!649548 (= e!372573 e!372566)))

(declare-fun res!421041 () Bool)

(assert (=> b!649548 (=> (not res!421041) (not e!372566))))

(assert (=> b!649548 (= res!421041 (arrayContainsKey!0 lt!301642 (select (arr!18476 a!2986) j!136) j!136))))

(declare-fun res!421042 () Bool)

(assert (=> start!58878 (=> (not res!421042) (not e!372569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58878 (= res!421042 (validMask!0 mask!3053))))

(assert (=> start!58878 e!372569))

(assert (=> start!58878 true))

(declare-fun array_inv!14272 (array!38540) Bool)

(assert (=> start!58878 (array_inv!14272 a!2986)))

(declare-fun b!649563 () Bool)

(assert (=> b!649563 (= e!372571 (= lt!301641 lt!301645))))

(declare-fun b!649564 () Bool)

(declare-fun res!421021 () Bool)

(assert (=> b!649564 (=> (not res!421021) (not e!372569))))

(assert (=> b!649564 (= res!421021 (validKeyInArray!0 k!1786))))

(declare-fun b!649565 () Bool)

(declare-fun res!421043 () Bool)

(assert (=> b!649565 (=> (not res!421043) (not e!372569))))

(assert (=> b!649565 (= res!421043 (and (= (size!18840 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18840 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18840 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!58878 res!421042) b!649565))

(assert (= (and b!649565 res!421043) b!649554))

(assert (= (and b!649554 res!421029) b!649564))

(assert (= (and b!649564 res!421021) b!649546))

(assert (= (and b!649546 res!421036) b!649557))

(assert (= (and b!649557 res!421033) b!649540))

(assert (= (and b!649540 res!421040) b!649544))

(assert (= (and b!649544 res!421035) b!649560))

(assert (= (and b!649560 res!421023) b!649559))

(assert (= (and b!649559 res!421039) b!649545))

(assert (= (and b!649545 res!421038) b!649553))

(assert (= (and b!649553 res!421030) b!649563))

(assert (= (and b!649553 c!74627) b!649550))

(assert (= (and b!649553 (not c!74627)) b!649552))

(assert (= (and b!649553 (not res!421022)) b!649558))

(assert (= (and b!649558 res!421027) b!649541))

(assert (= (and b!649541 (not res!421032)) b!649548))

(assert (= (and b!649548 res!421041) b!649547))

(assert (= (and b!649558 (not res!421024)) b!649561))

(assert (= (and b!649561 c!74626) b!649539))

(assert (= (and b!649561 (not c!74626)) b!649551))

(assert (= (and b!649561 (not res!421037)) b!649543))

(assert (= (and b!649543 res!421028) b!649562))

(assert (= (and b!649543 (not res!421025)) b!649556))

(assert (= (and b!649556 (not res!421026)) b!649542))

(assert (= (and b!649542 (not res!421031)) b!649549))

(assert (= (and b!649549 (not res!421034)) b!649555))

(declare-fun m!622781 () Bool)

(assert (=> b!649549 m!622781))

(declare-fun m!622783 () Bool)

(assert (=> b!649546 m!622783))

(declare-fun m!622785 () Bool)

(assert (=> b!649559 m!622785))

(declare-fun m!622787 () Bool)

(assert (=> b!649559 m!622787))

(declare-fun m!622789 () Bool)

(assert (=> b!649555 m!622789))

(declare-fun m!622791 () Bool)

(assert (=> b!649554 m!622791))

(assert (=> b!649554 m!622791))

(declare-fun m!622793 () Bool)

(assert (=> b!649554 m!622793))

(declare-fun m!622795 () Bool)

(assert (=> b!649557 m!622795))

(declare-fun m!622797 () Bool)

(assert (=> b!649560 m!622797))

(declare-fun m!622799 () Bool)

(assert (=> b!649544 m!622799))

(assert (=> b!649539 m!622791))

(declare-fun m!622801 () Bool)

(assert (=> b!649539 m!622801))

(assert (=> b!649539 m!622791))

(assert (=> b!649539 m!622791))

(declare-fun m!622803 () Bool)

(assert (=> b!649539 m!622803))

(declare-fun m!622805 () Bool)

(assert (=> b!649539 m!622805))

(declare-fun m!622807 () Bool)

(assert (=> b!649539 m!622807))

(assert (=> b!649539 m!622791))

(declare-fun m!622809 () Bool)

(assert (=> b!649539 m!622809))

(declare-fun m!622811 () Bool)

(assert (=> b!649539 m!622811))

(declare-fun m!622813 () Bool)

(assert (=> b!649539 m!622813))

(assert (=> b!649548 m!622791))

(assert (=> b!649548 m!622791))

(declare-fun m!622815 () Bool)

(assert (=> b!649548 m!622815))

(declare-fun m!622817 () Bool)

(assert (=> b!649540 m!622817))

(assert (=> b!649558 m!622791))

(assert (=> b!649558 m!622785))

(declare-fun m!622819 () Bool)

(assert (=> b!649558 m!622819))

(declare-fun m!622821 () Bool)

(assert (=> start!58878 m!622821))

(declare-fun m!622823 () Bool)

(assert (=> start!58878 m!622823))

(declare-fun m!622825 () Bool)

(assert (=> b!649542 m!622825))

(declare-fun m!622827 () Bool)

(assert (=> b!649556 m!622827))

(assert (=> b!649562 m!622791))

(assert (=> b!649562 m!622791))

(declare-fun m!622829 () Bool)

(assert (=> b!649562 m!622829))

(assert (=> b!649541 m!622791))

(declare-fun m!622831 () Bool)

(assert (=> b!649564 m!622831))

(assert (=> b!649547 m!622791))

(assert (=> b!649547 m!622791))

(assert (=> b!649547 m!622829))

(declare-fun m!622833 () Bool)

(assert (=> b!649553 m!622833))

(declare-fun m!622835 () Bool)

(assert (=> b!649553 m!622835))

(assert (=> b!649553 m!622791))

(declare-fun m!622837 () Bool)

(assert (=> b!649553 m!622837))

(assert (=> b!649553 m!622791))

(declare-fun m!622839 () Bool)

(assert (=> b!649553 m!622839))

(declare-fun m!622841 () Bool)

(assert (=> b!649553 m!622841))

(assert (=> b!649553 m!622785))

(declare-fun m!622843 () Bool)

(assert (=> b!649553 m!622843))

(declare-fun m!622845 () Bool)

(assert (=> b!649545 m!622845))

(assert (=> b!649545 m!622791))

(assert (=> b!649545 m!622791))

(declare-fun m!622847 () Bool)

(assert (=> b!649545 m!622847))

(assert (=> b!649543 m!622791))

(assert (=> b!649543 m!622791))

(declare-fun m!622849 () Bool)

(assert (=> b!649543 m!622849))

(assert (=> b!649543 m!622791))

(declare-fun m!622851 () Bool)

(assert (=> b!649543 m!622851))

(assert (=> b!649543 m!622791))

(assert (=> b!649543 m!622815))

(push 1)

