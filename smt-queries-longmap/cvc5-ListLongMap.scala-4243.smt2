; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58748 () Bool)

(assert start!58748)

(declare-fun b!647781 () Bool)

(declare-fun res!419681 () Bool)

(declare-fun e!371475 () Bool)

(assert (=> b!647781 (=> res!419681 e!371475)))

(declare-datatypes ((List!12500 0))(
  ( (Nil!12497) (Cons!12496 (h!13541 (_ BitVec 64)) (t!18728 List!12500)) )
))
(declare-fun contains!3155 (List!12500 (_ BitVec 64)) Bool)

(assert (=> b!647781 (= res!419681 (contains!3155 Nil!12497 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!647782 () Bool)

(declare-datatypes ((array!38503 0))(
  ( (array!38504 (arr!18459 (Array (_ BitVec 32) (_ BitVec 64))) (size!18823 (_ BitVec 32))) )
))
(declare-fun lt!300621 () array!38503)

(declare-fun e!371477 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38503)

(declare-fun arrayContainsKey!0 (array!38503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!647782 (= e!371477 (arrayContainsKey!0 lt!300621 (select (arr!18459 a!2986) j!136) index!984))))

(declare-fun b!647783 () Bool)

(declare-datatypes ((Unit!22020 0))(
  ( (Unit!22021) )
))
(declare-fun e!371478 () Unit!22020)

(declare-fun Unit!22022 () Unit!22020)

(assert (=> b!647783 (= e!371478 Unit!22022)))

(declare-fun b!647784 () Bool)

(declare-fun e!371473 () Bool)

(declare-fun e!371479 () Bool)

(assert (=> b!647784 (= e!371473 e!371479)))

(declare-fun res!419686 () Bool)

(assert (=> b!647784 (=> (not res!419686) (not e!371479))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!647784 (= res!419686 (= (select (store (arr!18459 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!647784 (= lt!300621 (array!38504 (store (arr!18459 a!2986) i!1108 k!1786) (size!18823 a!2986)))))

(declare-fun b!647785 () Bool)

(declare-fun e!371481 () Bool)

(declare-datatypes ((SeekEntryResult!6899 0))(
  ( (MissingZero!6899 (index!29940 (_ BitVec 32))) (Found!6899 (index!29941 (_ BitVec 32))) (Intermediate!6899 (undefined!7711 Bool) (index!29942 (_ BitVec 32)) (x!58727 (_ BitVec 32))) (Undefined!6899) (MissingVacant!6899 (index!29943 (_ BitVec 32))) )
))
(declare-fun lt!300617 () SeekEntryResult!6899)

(declare-fun lt!300611 () SeekEntryResult!6899)

(assert (=> b!647785 (= e!371481 (= lt!300617 lt!300611))))

(declare-fun b!647786 () Bool)

(declare-fun e!371467 () Bool)

(declare-fun e!371468 () Bool)

(assert (=> b!647786 (= e!371467 e!371468)))

(declare-fun res!419699 () Bool)

(assert (=> b!647786 (=> (not res!419699) (not e!371468))))

(assert (=> b!647786 (= res!419699 (arrayContainsKey!0 lt!300621 (select (arr!18459 a!2986) j!136) j!136))))

(declare-fun b!647787 () Bool)

(declare-fun res!419678 () Bool)

(declare-fun e!371480 () Bool)

(assert (=> b!647787 (=> (not res!419678) (not e!371480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!647787 (= res!419678 (validKeyInArray!0 (select (arr!18459 a!2986) j!136)))))

(declare-fun b!647789 () Bool)

(declare-fun res!419679 () Bool)

(assert (=> b!647789 (=> (not res!419679) (not e!371473))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!647789 (= res!419679 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18459 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!647790 () Bool)

(declare-fun res!419689 () Bool)

(assert (=> b!647790 (=> res!419689 e!371475)))

(declare-fun noDuplicate!417 (List!12500) Bool)

(assert (=> b!647790 (= res!419689 (not (noDuplicate!417 Nil!12497)))))

(declare-fun b!647791 () Bool)

(declare-fun res!419695 () Bool)

(assert (=> b!647791 (=> (not res!419695) (not e!371473))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38503 (_ BitVec 32)) Bool)

(assert (=> b!647791 (= res!419695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!647792 () Bool)

(declare-fun e!371472 () Bool)

(declare-fun e!371476 () Bool)

(assert (=> b!647792 (= e!371472 e!371476)))

(declare-fun res!419684 () Bool)

(assert (=> b!647792 (=> res!419684 e!371476)))

(declare-fun lt!300615 () (_ BitVec 64))

(declare-fun lt!300619 () (_ BitVec 64))

(assert (=> b!647792 (= res!419684 (or (not (= (select (arr!18459 a!2986) j!136) lt!300615)) (not (= (select (arr!18459 a!2986) j!136) lt!300619))))))

(declare-fun e!371469 () Bool)

(assert (=> b!647792 e!371469))

(declare-fun res!419692 () Bool)

(assert (=> b!647792 (=> (not res!419692) (not e!371469))))

(assert (=> b!647792 (= res!419692 (= lt!300619 (select (arr!18459 a!2986) j!136)))))

(assert (=> b!647792 (= lt!300619 (select (store (arr!18459 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!647793 () Bool)

(declare-fun res!419680 () Bool)

(assert (=> b!647793 (=> (not res!419680) (not e!371473))))

(declare-fun arrayNoDuplicates!0 (array!38503 (_ BitVec 32) List!12500) Bool)

(assert (=> b!647793 (= res!419680 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12497))))

(declare-fun b!647794 () Bool)

(declare-fun e!371466 () Unit!22020)

(declare-fun Unit!22023 () Unit!22020)

(assert (=> b!647794 (= e!371466 Unit!22023)))

(declare-fun b!647795 () Bool)

(assert (=> b!647795 (= e!371469 e!371467)))

(declare-fun res!419696 () Bool)

(assert (=> b!647795 (=> res!419696 e!371467)))

(assert (=> b!647795 (= res!419696 (or (not (= (select (arr!18459 a!2986) j!136) lt!300615)) (not (= (select (arr!18459 a!2986) j!136) lt!300619)) (bvsge j!136 index!984)))))

(declare-fun b!647796 () Bool)

(declare-fun res!419698 () Bool)

(assert (=> b!647796 (=> res!419698 e!371475)))

(assert (=> b!647796 (= res!419698 (contains!3155 Nil!12497 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!647797 () Bool)

(declare-fun e!371474 () Bool)

(assert (=> b!647797 (= e!371474 (not e!371472))))

(declare-fun res!419691 () Bool)

(assert (=> b!647797 (=> res!419691 e!371472)))

(declare-fun lt!300613 () SeekEntryResult!6899)

(assert (=> b!647797 (= res!419691 (not (= lt!300613 (Found!6899 index!984))))))

(declare-fun lt!300612 () Unit!22020)

(assert (=> b!647797 (= lt!300612 e!371478)))

(declare-fun c!74420 () Bool)

(assert (=> b!647797 (= c!74420 (= lt!300613 Undefined!6899))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38503 (_ BitVec 32)) SeekEntryResult!6899)

(assert (=> b!647797 (= lt!300613 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300615 lt!300621 mask!3053))))

(assert (=> b!647797 e!371481))

(declare-fun res!419693 () Bool)

(assert (=> b!647797 (=> (not res!419693) (not e!371481))))

(declare-fun lt!300618 () (_ BitVec 32))

(assert (=> b!647797 (= res!419693 (= lt!300611 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300618 vacantSpotIndex!68 lt!300615 lt!300621 mask!3053)))))

(assert (=> b!647797 (= lt!300611 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300618 vacantSpotIndex!68 (select (arr!18459 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!647797 (= lt!300615 (select (store (arr!18459 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!300610 () Unit!22020)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38503 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22020)

(assert (=> b!647797 (= lt!300610 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300618 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!647797 (= lt!300618 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!647798 () Bool)

(assert (=> b!647798 (= e!371468 (arrayContainsKey!0 lt!300621 (select (arr!18459 a!2986) j!136) index!984))))

(declare-fun b!647799 () Bool)

(declare-fun res!419690 () Bool)

(assert (=> b!647799 (=> (not res!419690) (not e!371480))))

(assert (=> b!647799 (= res!419690 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!647800 () Bool)

(assert (=> b!647800 (= e!371479 e!371474)))

(declare-fun res!419685 () Bool)

(assert (=> b!647800 (=> (not res!419685) (not e!371474))))

(assert (=> b!647800 (= res!419685 (and (= lt!300617 (Found!6899 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18459 a!2986) index!984) (select (arr!18459 a!2986) j!136))) (not (= (select (arr!18459 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!647800 (= lt!300617 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18459 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!647801 () Bool)

(declare-fun Unit!22024 () Unit!22020)

(assert (=> b!647801 (= e!371466 Unit!22024)))

(declare-fun lt!300622 () Unit!22020)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38503 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22020)

(assert (=> b!647801 (= lt!300622 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300621 (select (arr!18459 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!647801 (arrayContainsKey!0 lt!300621 (select (arr!18459 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300616 () Unit!22020)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38503 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12500) Unit!22020)

(assert (=> b!647801 (= lt!300616 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12497))))

(assert (=> b!647801 (arrayNoDuplicates!0 lt!300621 #b00000000000000000000000000000000 Nil!12497)))

(declare-fun lt!300614 () Unit!22020)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38503 (_ BitVec 32) (_ BitVec 32)) Unit!22020)

(assert (=> b!647801 (= lt!300614 (lemmaNoDuplicateFromThenFromBigger!0 lt!300621 #b00000000000000000000000000000000 j!136))))

(assert (=> b!647801 (arrayNoDuplicates!0 lt!300621 j!136 Nil!12497)))

(declare-fun lt!300620 () Unit!22020)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38503 (_ BitVec 64) (_ BitVec 32) List!12500) Unit!22020)

(assert (=> b!647801 (= lt!300620 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300621 (select (arr!18459 a!2986) j!136) j!136 Nil!12497))))

(assert (=> b!647801 false))

(declare-fun b!647802 () Bool)

(assert (=> b!647802 (= e!371480 e!371473)))

(declare-fun res!419688 () Bool)

(assert (=> b!647802 (=> (not res!419688) (not e!371473))))

(declare-fun lt!300623 () SeekEntryResult!6899)

(assert (=> b!647802 (= res!419688 (or (= lt!300623 (MissingZero!6899 i!1108)) (= lt!300623 (MissingVacant!6899 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38503 (_ BitVec 32)) SeekEntryResult!6899)

(assert (=> b!647802 (= lt!300623 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!647803 () Bool)

(declare-fun e!371471 () Bool)

(assert (=> b!647803 (= e!371476 e!371471)))

(declare-fun res!419697 () Bool)

(assert (=> b!647803 (=> res!419697 e!371471)))

(assert (=> b!647803 (= res!419697 (bvsge index!984 j!136))))

(declare-fun lt!300624 () Unit!22020)

(assert (=> b!647803 (= lt!300624 e!371466)))

(declare-fun c!74419 () Bool)

(assert (=> b!647803 (= c!74419 (bvslt j!136 index!984))))

(declare-fun b!647804 () Bool)

(declare-fun Unit!22025 () Unit!22020)

(assert (=> b!647804 (= e!371478 Unit!22025)))

(assert (=> b!647804 false))

(declare-fun b!647805 () Bool)

(declare-fun res!419682 () Bool)

(assert (=> b!647805 (=> (not res!419682) (not e!371480))))

(assert (=> b!647805 (= res!419682 (validKeyInArray!0 k!1786))))

(declare-fun res!419677 () Bool)

(assert (=> start!58748 (=> (not res!419677) (not e!371480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58748 (= res!419677 (validMask!0 mask!3053))))

(assert (=> start!58748 e!371480))

(assert (=> start!58748 true))

(declare-fun array_inv!14255 (array!38503) Bool)

(assert (=> start!58748 (array_inv!14255 a!2986)))

(declare-fun b!647788 () Bool)

(assert (=> b!647788 (= e!371471 e!371475)))

(declare-fun res!419694 () Bool)

(assert (=> b!647788 (=> res!419694 e!371475)))

(assert (=> b!647788 (= res!419694 (or (bvsge (size!18823 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18823 a!2986))))))

(assert (=> b!647788 (arrayContainsKey!0 lt!300621 (select (arr!18459 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300625 () Unit!22020)

(assert (=> b!647788 (= lt!300625 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300621 (select (arr!18459 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!647788 e!371477))

(declare-fun res!419687 () Bool)

(assert (=> b!647788 (=> (not res!419687) (not e!371477))))

(assert (=> b!647788 (= res!419687 (arrayContainsKey!0 lt!300621 (select (arr!18459 a!2986) j!136) j!136))))

(declare-fun b!647806 () Bool)

(assert (=> b!647806 (= e!371475 (not (contains!3155 Nil!12497 k!1786)))))

(declare-fun b!647807 () Bool)

(declare-fun res!419683 () Bool)

(assert (=> b!647807 (=> (not res!419683) (not e!371480))))

(assert (=> b!647807 (= res!419683 (and (= (size!18823 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18823 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18823 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!58748 res!419677) b!647807))

(assert (= (and b!647807 res!419683) b!647787))

(assert (= (and b!647787 res!419678) b!647805))

(assert (= (and b!647805 res!419682) b!647799))

(assert (= (and b!647799 res!419690) b!647802))

(assert (= (and b!647802 res!419688) b!647791))

(assert (= (and b!647791 res!419695) b!647793))

(assert (= (and b!647793 res!419680) b!647789))

(assert (= (and b!647789 res!419679) b!647784))

(assert (= (and b!647784 res!419686) b!647800))

(assert (= (and b!647800 res!419685) b!647797))

(assert (= (and b!647797 res!419693) b!647785))

(assert (= (and b!647797 c!74420) b!647804))

(assert (= (and b!647797 (not c!74420)) b!647783))

(assert (= (and b!647797 (not res!419691)) b!647792))

(assert (= (and b!647792 res!419692) b!647795))

(assert (= (and b!647795 (not res!419696)) b!647786))

(assert (= (and b!647786 res!419699) b!647798))

(assert (= (and b!647792 (not res!419684)) b!647803))

(assert (= (and b!647803 c!74419) b!647801))

(assert (= (and b!647803 (not c!74419)) b!647794))

(assert (= (and b!647803 (not res!419697)) b!647788))

(assert (= (and b!647788 res!419687) b!647782))

(assert (= (and b!647788 (not res!419694)) b!647790))

(assert (= (and b!647790 (not res!419689)) b!647781))

(assert (= (and b!647781 (not res!419681)) b!647796))

(assert (= (and b!647796 (not res!419698)) b!647806))

(declare-fun m!621173 () Bool)

(assert (=> b!647792 m!621173))

(declare-fun m!621175 () Bool)

(assert (=> b!647792 m!621175))

(declare-fun m!621177 () Bool)

(assert (=> b!647792 m!621177))

(assert (=> b!647788 m!621173))

(assert (=> b!647788 m!621173))

(declare-fun m!621179 () Bool)

(assert (=> b!647788 m!621179))

(assert (=> b!647788 m!621173))

(declare-fun m!621181 () Bool)

(assert (=> b!647788 m!621181))

(assert (=> b!647788 m!621173))

(declare-fun m!621183 () Bool)

(assert (=> b!647788 m!621183))

(assert (=> b!647786 m!621173))

(assert (=> b!647786 m!621173))

(assert (=> b!647786 m!621183))

(declare-fun m!621185 () Bool)

(assert (=> b!647800 m!621185))

(assert (=> b!647800 m!621173))

(assert (=> b!647800 m!621173))

(declare-fun m!621187 () Bool)

(assert (=> b!647800 m!621187))

(declare-fun m!621189 () Bool)

(assert (=> b!647793 m!621189))

(declare-fun m!621191 () Bool)

(assert (=> b!647790 m!621191))

(declare-fun m!621193 () Bool)

(assert (=> b!647796 m!621193))

(assert (=> b!647784 m!621175))

(declare-fun m!621195 () Bool)

(assert (=> b!647784 m!621195))

(assert (=> b!647795 m!621173))

(declare-fun m!621197 () Bool)

(assert (=> b!647791 m!621197))

(declare-fun m!621199 () Bool)

(assert (=> b!647805 m!621199))

(assert (=> b!647798 m!621173))

(assert (=> b!647798 m!621173))

(declare-fun m!621201 () Bool)

(assert (=> b!647798 m!621201))

(declare-fun m!621203 () Bool)

(assert (=> b!647801 m!621203))

(assert (=> b!647801 m!621173))

(assert (=> b!647801 m!621173))

(declare-fun m!621205 () Bool)

(assert (=> b!647801 m!621205))

(declare-fun m!621207 () Bool)

(assert (=> b!647801 m!621207))

(assert (=> b!647801 m!621173))

(declare-fun m!621209 () Bool)

(assert (=> b!647801 m!621209))

(declare-fun m!621211 () Bool)

(assert (=> b!647801 m!621211))

(declare-fun m!621213 () Bool)

(assert (=> b!647801 m!621213))

(assert (=> b!647801 m!621173))

(declare-fun m!621215 () Bool)

(assert (=> b!647801 m!621215))

(declare-fun m!621217 () Bool)

(assert (=> b!647797 m!621217))

(declare-fun m!621219 () Bool)

(assert (=> b!647797 m!621219))

(declare-fun m!621221 () Bool)

(assert (=> b!647797 m!621221))

(assert (=> b!647797 m!621173))

(assert (=> b!647797 m!621175))

(declare-fun m!621223 () Bool)

(assert (=> b!647797 m!621223))

(assert (=> b!647797 m!621173))

(declare-fun m!621225 () Bool)

(assert (=> b!647797 m!621225))

(declare-fun m!621227 () Bool)

(assert (=> b!647797 m!621227))

(assert (=> b!647787 m!621173))

(assert (=> b!647787 m!621173))

(declare-fun m!621229 () Bool)

(assert (=> b!647787 m!621229))

(declare-fun m!621231 () Bool)

(assert (=> b!647789 m!621231))

(declare-fun m!621233 () Bool)

(assert (=> start!58748 m!621233))

(declare-fun m!621235 () Bool)

(assert (=> start!58748 m!621235))

(assert (=> b!647782 m!621173))

(assert (=> b!647782 m!621173))

(assert (=> b!647782 m!621201))

(declare-fun m!621237 () Bool)

(assert (=> b!647799 m!621237))

(declare-fun m!621239 () Bool)

(assert (=> b!647802 m!621239))

(declare-fun m!621241 () Bool)

(assert (=> b!647806 m!621241))

(declare-fun m!621243 () Bool)

(assert (=> b!647781 m!621243))

(push 1)

(assert (not start!58748))

(assert (not b!647790))

(assert (not b!647805))

(assert (not b!647786))

(assert (not b!647791))

(assert (not b!647797))

(assert (not b!647793))

(assert (not b!647782))

(assert (not b!647798))

(assert (not b!647781))

(assert (not b!647796))

(assert (not b!647800))

(assert (not b!647801))

(assert (not b!647788))

(assert (not b!647799))

(assert (not b!647787))

(assert (not b!647806))

(assert (not b!647802))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91721 () Bool)

(declare-fun lt!300740 () Bool)

(declare-fun content!250 (List!12500) (Set (_ BitVec 64)))

(assert (=> d!91721 (= lt!300740 (set.member k!1786 (content!250 Nil!12497)))))

(declare-fun e!371613 () Bool)

(assert (=> d!91721 (= lt!300740 e!371613)))

(declare-fun res!419857 () Bool)

(assert (=> d!91721 (=> (not res!419857) (not e!371613))))

(assert (=> d!91721 (= res!419857 (is-Cons!12496 Nil!12497))))

(assert (=> d!91721 (= (contains!3155 Nil!12497 k!1786) lt!300740)))

(declare-fun b!648019 () Bool)

(declare-fun e!371612 () Bool)

(assert (=> b!648019 (= e!371613 e!371612)))

(declare-fun res!419858 () Bool)

(assert (=> b!648019 (=> res!419858 e!371612)))

(assert (=> b!648019 (= res!419858 (= (h!13541 Nil!12497) k!1786))))

(declare-fun b!648020 () Bool)

(assert (=> b!648020 (= e!371612 (contains!3155 (t!18728 Nil!12497) k!1786))))

(assert (= (and d!91721 res!419857) b!648019))

(assert (= (and b!648019 (not res!419858)) b!648020))

(declare-fun m!621429 () Bool)

(assert (=> d!91721 m!621429))

(declare-fun m!621431 () Bool)

(assert (=> d!91721 m!621431))

(declare-fun m!621433 () Bool)

(assert (=> b!648020 m!621433))

(assert (=> b!647806 d!91721))

(declare-fun d!91729 () Bool)

(declare-fun lt!300741 () Bool)

(assert (=> d!91729 (= lt!300741 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!250 Nil!12497)))))

(declare-fun e!371619 () Bool)

(assert (=> d!91729 (= lt!300741 e!371619)))

(declare-fun res!419863 () Bool)

(assert (=> d!91729 (=> (not res!419863) (not e!371619))))

(assert (=> d!91729 (= res!419863 (is-Cons!12496 Nil!12497))))

(assert (=> d!91729 (= (contains!3155 Nil!12497 #b1000000000000000000000000000000000000000000000000000000000000000) lt!300741)))

(declare-fun b!648025 () Bool)

(declare-fun e!371618 () Bool)

(assert (=> b!648025 (= e!371619 e!371618)))

(declare-fun res!419864 () Bool)

(assert (=> b!648025 (=> res!419864 e!371618)))

(assert (=> b!648025 (= res!419864 (= (h!13541 Nil!12497) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648026 () Bool)

(assert (=> b!648026 (= e!371618 (contains!3155 (t!18728 Nil!12497) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!91729 res!419863) b!648025))

(assert (= (and b!648025 (not res!419864)) b!648026))

(assert (=> d!91729 m!621429))

(declare-fun m!621439 () Bool)

(assert (=> d!91729 m!621439))

(declare-fun m!621441 () Bool)

(assert (=> b!648026 m!621441))

(assert (=> b!647796 d!91729))

(declare-fun d!91733 () Bool)

(assert (=> d!91733 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!647805 d!91733))

(declare-fun d!91735 () Bool)

(declare-fun res!419876 () Bool)

(declare-fun e!371634 () Bool)

(assert (=> d!91735 (=> res!419876 e!371634)))

(assert (=> d!91735 (= res!419876 (= (select (arr!18459 lt!300621) index!984) (select (arr!18459 a!2986) j!136)))))

(assert (=> d!91735 (= (arrayContainsKey!0 lt!300621 (select (arr!18459 a!2986) j!136) index!984) e!371634)))

(declare-fun b!648044 () Bool)

(declare-fun e!371635 () Bool)

(assert (=> b!648044 (= e!371634 e!371635)))

(declare-fun res!419877 () Bool)

(assert (=> b!648044 (=> (not res!419877) (not e!371635))))

(assert (=> b!648044 (= res!419877 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18823 lt!300621)))))

(declare-fun b!648045 () Bool)

(assert (=> b!648045 (= e!371635 (arrayContainsKey!0 lt!300621 (select (arr!18459 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91735 (not res!419876)) b!648044))

(assert (= (and b!648044 res!419877) b!648045))

(declare-fun m!621449 () Bool)

(assert (=> d!91735 m!621449))

(assert (=> b!648045 m!621173))

(declare-fun m!621453 () Bool)

(assert (=> b!648045 m!621453))

(assert (=> b!647798 d!91735))

(declare-fun d!91737 () Bool)

(assert (=> d!91737 (= (validKeyInArray!0 (select (arr!18459 a!2986) j!136)) (and (not (= (select (arr!18459 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18459 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!647787 d!91737))

(declare-fun d!91741 () Bool)

(declare-fun res!419878 () Bool)

(declare-fun e!371636 () Bool)

(assert (=> d!91741 (=> res!419878 e!371636)))

(assert (=> d!91741 (= res!419878 (= (select (arr!18459 lt!300621) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18459 a!2986) j!136)))))

(assert (=> d!91741 (= (arrayContainsKey!0 lt!300621 (select (arr!18459 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!371636)))

(declare-fun b!648046 () Bool)

(declare-fun e!371637 () Bool)

(assert (=> b!648046 (= e!371636 e!371637)))

(declare-fun res!419879 () Bool)

(assert (=> b!648046 (=> (not res!419879) (not e!371637))))

(assert (=> b!648046 (= res!419879 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18823 lt!300621)))))

(declare-fun b!648047 () Bool)

(assert (=> b!648047 (= e!371637 (arrayContainsKey!0 lt!300621 (select (arr!18459 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91741 (not res!419878)) b!648046))

(assert (= (and b!648046 res!419879) b!648047))

(declare-fun m!621455 () Bool)

(assert (=> d!91741 m!621455))

(assert (=> b!648047 m!621173))

(declare-fun m!621457 () Bool)

(assert (=> b!648047 m!621457))

(assert (=> b!647788 d!91741))

(declare-fun d!91743 () Bool)

(assert (=> d!91743 (arrayContainsKey!0 lt!300621 (select (arr!18459 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300746 () Unit!22020)

(declare-fun choose!114 (array!38503 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22020)

(assert (=> d!91743 (= lt!300746 (choose!114 lt!300621 (select (arr!18459 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!91743 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!91743 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300621 (select (arr!18459 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!300746)))

(declare-fun bs!19355 () Bool)

(assert (= bs!19355 d!91743))

(assert (=> bs!19355 m!621173))

(assert (=> bs!19355 m!621179))

(assert (=> bs!19355 m!621173))

(declare-fun m!621459 () Bool)

(assert (=> bs!19355 m!621459))

(assert (=> b!647788 d!91743))

(declare-fun d!91745 () Bool)

(declare-fun res!419884 () Bool)

(declare-fun e!371642 () Bool)

(assert (=> d!91745 (=> res!419884 e!371642)))

(assert (=> d!91745 (= res!419884 (= (select (arr!18459 lt!300621) j!136) (select (arr!18459 a!2986) j!136)))))

(assert (=> d!91745 (= (arrayContainsKey!0 lt!300621 (select (arr!18459 a!2986) j!136) j!136) e!371642)))

(declare-fun b!648052 () Bool)

(declare-fun e!371643 () Bool)

(assert (=> b!648052 (= e!371642 e!371643)))

(declare-fun res!419885 () Bool)

(assert (=> b!648052 (=> (not res!419885) (not e!371643))))

(assert (=> b!648052 (= res!419885 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18823 lt!300621)))))

(declare-fun b!648053 () Bool)

(assert (=> b!648053 (= e!371643 (arrayContainsKey!0 lt!300621 (select (arr!18459 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91745 (not res!419884)) b!648052))

(assert (= (and b!648052 res!419885) b!648053))

(declare-fun m!621461 () Bool)

(assert (=> d!91745 m!621461))

(assert (=> b!648053 m!621173))

(declare-fun m!621463 () Bool)

(assert (=> b!648053 m!621463))

(assert (=> b!647788 d!91745))

(assert (=> b!647786 d!91745))

(declare-fun d!91747 () Bool)

(declare-fun e!371671 () Bool)

(assert (=> d!91747 e!371671))

(declare-fun res!419908 () Bool)

(assert (=> d!91747 (=> (not res!419908) (not e!371671))))

(assert (=> d!91747 (= res!419908 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18823 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18823 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18823 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18823 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18823 a!2986))))))

(declare-fun lt!300770 () Unit!22020)

(declare-fun choose!9 (array!38503 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22020)

(assert (=> d!91747 (= lt!300770 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300618 vacantSpotIndex!68 mask!3053))))

(assert (=> d!91747 (validMask!0 mask!3053)))

(assert (=> d!91747 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300618 vacantSpotIndex!68 mask!3053) lt!300770)))

(declare-fun b!648086 () Bool)

(assert (=> b!648086 (= e!371671 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300618 vacantSpotIndex!68 (select (arr!18459 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300618 vacantSpotIndex!68 (select (store (arr!18459 a!2986) i!1108 k!1786) j!136) (array!38504 (store (arr!18459 a!2986) i!1108 k!1786) (size!18823 a!2986)) mask!3053)))))

(assert (= (and d!91747 res!419908) b!648086))

(declare-fun m!621513 () Bool)

(assert (=> d!91747 m!621513))

(assert (=> d!91747 m!621233))

(assert (=> b!648086 m!621219))

(assert (=> b!648086 m!621175))

(assert (=> b!648086 m!621219))

(declare-fun m!621515 () Bool)

(assert (=> b!648086 m!621515))

(assert (=> b!648086 m!621173))

(assert (=> b!648086 m!621173))

(assert (=> b!648086 m!621225))

(assert (=> b!647797 d!91747))

(declare-fun b!648133 () Bool)

(declare-fun c!74470 () Bool)

(declare-fun lt!300784 () (_ BitVec 64))

(assert (=> b!648133 (= c!74470 (= lt!300784 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371708 () SeekEntryResult!6899)

(declare-fun e!371710 () SeekEntryResult!6899)

(assert (=> b!648133 (= e!371708 e!371710)))

(declare-fun b!648134 () Bool)

(declare-fun e!371709 () SeekEntryResult!6899)

(assert (=> b!648134 (= e!371709 e!371708)))

(declare-fun c!74469 () Bool)

(assert (=> b!648134 (= c!74469 (= lt!300784 lt!300615))))

(declare-fun d!91769 () Bool)

(declare-fun lt!300783 () SeekEntryResult!6899)

(assert (=> d!91769 (and (or (is-Undefined!6899 lt!300783) (not (is-Found!6899 lt!300783)) (and (bvsge (index!29941 lt!300783) #b00000000000000000000000000000000) (bvslt (index!29941 lt!300783) (size!18823 lt!300621)))) (or (is-Undefined!6899 lt!300783) (is-Found!6899 lt!300783) (not (is-MissingVacant!6899 lt!300783)) (not (= (index!29943 lt!300783) vacantSpotIndex!68)) (and (bvsge (index!29943 lt!300783) #b00000000000000000000000000000000) (bvslt (index!29943 lt!300783) (size!18823 lt!300621)))) (or (is-Undefined!6899 lt!300783) (ite (is-Found!6899 lt!300783) (= (select (arr!18459 lt!300621) (index!29941 lt!300783)) lt!300615) (and (is-MissingVacant!6899 lt!300783) (= (index!29943 lt!300783) vacantSpotIndex!68) (= (select (arr!18459 lt!300621) (index!29943 lt!300783)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91769 (= lt!300783 e!371709)))

(declare-fun c!74468 () Bool)

(assert (=> d!91769 (= c!74468 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91769 (= lt!300784 (select (arr!18459 lt!300621) index!984))))

(assert (=> d!91769 (validMask!0 mask!3053)))

(assert (=> d!91769 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300615 lt!300621 mask!3053) lt!300783)))

(declare-fun b!648135 () Bool)

(assert (=> b!648135 (= e!371708 (Found!6899 index!984))))

(declare-fun b!648136 () Bool)

(assert (=> b!648136 (= e!371710 (MissingVacant!6899 vacantSpotIndex!68))))

(declare-fun b!648137 () Bool)

(assert (=> b!648137 (= e!371709 Undefined!6899)))

(declare-fun b!648138 () Bool)

(assert (=> b!648138 (= e!371710 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!300615 lt!300621 mask!3053))))

(assert (= (and d!91769 c!74468) b!648137))

(assert (= (and d!91769 (not c!74468)) b!648134))

(assert (= (and b!648134 c!74469) b!648135))

(assert (= (and b!648134 (not c!74469)) b!648133))

(assert (= (and b!648133 c!74470) b!648136))

(assert (= (and b!648133 (not c!74470)) b!648138))

(declare-fun m!621541 () Bool)

(assert (=> d!91769 m!621541))

(declare-fun m!621543 () Bool)

(assert (=> d!91769 m!621543))

(assert (=> d!91769 m!621449))

(assert (=> d!91769 m!621233))

(assert (=> b!648138 m!621217))

(assert (=> b!648138 m!621217))

(declare-fun m!621545 () Bool)

(assert (=> b!648138 m!621545))

(assert (=> b!647797 d!91769))

(declare-fun d!91787 () Bool)

(declare-fun lt!300789 () (_ BitVec 32))

(assert (=> d!91787 (and (bvsge lt!300789 #b00000000000000000000000000000000) (bvslt lt!300789 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91787 (= lt!300789 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!91787 (validMask!0 mask!3053)))

(assert (=> d!91787 (= (nextIndex!0 index!984 x!910 mask!3053) lt!300789)))

(declare-fun bs!19360 () Bool)

(assert (= bs!19360 d!91787))

(declare-fun m!621557 () Bool)

(assert (=> bs!19360 m!621557))

(assert (=> bs!19360 m!621233))

(assert (=> b!647797 d!91787))

(declare-fun b!648145 () Bool)

(declare-fun c!74473 () Bool)

(declare-fun lt!300791 () (_ BitVec 64))

(assert (=> b!648145 (= c!74473 (= lt!300791 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371715 () SeekEntryResult!6899)

(declare-fun e!371717 () SeekEntryResult!6899)

(assert (=> b!648145 (= e!371715 e!371717)))

(declare-fun b!648146 () Bool)

(declare-fun e!371716 () SeekEntryResult!6899)

(assert (=> b!648146 (= e!371716 e!371715)))

(declare-fun c!74472 () Bool)

(assert (=> b!648146 (= c!74472 (= lt!300791 lt!300615))))

(declare-fun d!91793 () Bool)

(declare-fun lt!300790 () SeekEntryResult!6899)

(assert (=> d!91793 (and (or (is-Undefined!6899 lt!300790) (not (is-Found!6899 lt!300790)) (and (bvsge (index!29941 lt!300790) #b00000000000000000000000000000000) (bvslt (index!29941 lt!300790) (size!18823 lt!300621)))) (or (is-Undefined!6899 lt!300790) (is-Found!6899 lt!300790) (not (is-MissingVacant!6899 lt!300790)) (not (= (index!29943 lt!300790) vacantSpotIndex!68)) (and (bvsge (index!29943 lt!300790) #b00000000000000000000000000000000) (bvslt (index!29943 lt!300790) (size!18823 lt!300621)))) (or (is-Undefined!6899 lt!300790) (ite (is-Found!6899 lt!300790) (= (select (arr!18459 lt!300621) (index!29941 lt!300790)) lt!300615) (and (is-MissingVacant!6899 lt!300790) (= (index!29943 lt!300790) vacantSpotIndex!68) (= (select (arr!18459 lt!300621) (index!29943 lt!300790)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91793 (= lt!300790 e!371716)))

(declare-fun c!74471 () Bool)

(assert (=> d!91793 (= c!74471 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91793 (= lt!300791 (select (arr!18459 lt!300621) lt!300618))))

(assert (=> d!91793 (validMask!0 mask!3053)))

(assert (=> d!91793 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300618 vacantSpotIndex!68 lt!300615 lt!300621 mask!3053) lt!300790)))

(declare-fun b!648147 () Bool)

(assert (=> b!648147 (= e!371715 (Found!6899 lt!300618))))

(declare-fun b!648148 () Bool)

(assert (=> b!648148 (= e!371717 (MissingVacant!6899 vacantSpotIndex!68))))

(declare-fun b!648149 () Bool)

(assert (=> b!648149 (= e!371716 Undefined!6899)))

(declare-fun b!648150 () Bool)

(assert (=> b!648150 (= e!371717 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!300618 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!300615 lt!300621 mask!3053))))

(assert (= (and d!91793 c!74471) b!648149))

(assert (= (and d!91793 (not c!74471)) b!648146))

(assert (= (and b!648146 c!74472) b!648147))

(assert (= (and b!648146 (not c!74472)) b!648145))

(assert (= (and b!648145 c!74473) b!648148))

(assert (= (and b!648145 (not c!74473)) b!648150))

(declare-fun m!621559 () Bool)

(assert (=> d!91793 m!621559))

(declare-fun m!621561 () Bool)

(assert (=> d!91793 m!621561))

(declare-fun m!621563 () Bool)

(assert (=> d!91793 m!621563))

(assert (=> d!91793 m!621233))

(declare-fun m!621565 () Bool)

(assert (=> b!648150 m!621565))

(assert (=> b!648150 m!621565))

(declare-fun m!621567 () Bool)

(assert (=> b!648150 m!621567))

(assert (=> b!647797 d!91793))

(declare-fun b!648151 () Bool)

(declare-fun c!74476 () Bool)

(declare-fun lt!300793 () (_ BitVec 64))

(assert (=> b!648151 (= c!74476 (= lt!300793 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371718 () SeekEntryResult!6899)

(declare-fun e!371720 () SeekEntryResult!6899)

(assert (=> b!648151 (= e!371718 e!371720)))

(declare-fun b!648152 () Bool)

(declare-fun e!371719 () SeekEntryResult!6899)

(assert (=> b!648152 (= e!371719 e!371718)))

(declare-fun c!74475 () Bool)

(assert (=> b!648152 (= c!74475 (= lt!300793 (select (arr!18459 a!2986) j!136)))))

(declare-fun lt!300792 () SeekEntryResult!6899)

(declare-fun d!91795 () Bool)

(assert (=> d!91795 (and (or (is-Undefined!6899 lt!300792) (not (is-Found!6899 lt!300792)) (and (bvsge (index!29941 lt!300792) #b00000000000000000000000000000000) (bvslt (index!29941 lt!300792) (size!18823 a!2986)))) (or (is-Undefined!6899 lt!300792) (is-Found!6899 lt!300792) (not (is-MissingVacant!6899 lt!300792)) (not (= (index!29943 lt!300792) vacantSpotIndex!68)) (and (bvsge (index!29943 lt!300792) #b00000000000000000000000000000000) (bvslt (index!29943 lt!300792) (size!18823 a!2986)))) (or (is-Undefined!6899 lt!300792) (ite (is-Found!6899 lt!300792) (= (select (arr!18459 a!2986) (index!29941 lt!300792)) (select (arr!18459 a!2986) j!136)) (and (is-MissingVacant!6899 lt!300792) (= (index!29943 lt!300792) vacantSpotIndex!68) (= (select (arr!18459 a!2986) (index!29943 lt!300792)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91795 (= lt!300792 e!371719)))

(declare-fun c!74474 () Bool)

(assert (=> d!91795 (= c!74474 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91795 (= lt!300793 (select (arr!18459 a!2986) lt!300618))))

(assert (=> d!91795 (validMask!0 mask!3053)))

(assert (=> d!91795 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300618 vacantSpotIndex!68 (select (arr!18459 a!2986) j!136) a!2986 mask!3053) lt!300792)))

(declare-fun b!648153 () Bool)

(assert (=> b!648153 (= e!371718 (Found!6899 lt!300618))))

(declare-fun b!648154 () Bool)

(assert (=> b!648154 (= e!371720 (MissingVacant!6899 vacantSpotIndex!68))))

(declare-fun b!648155 () Bool)

(assert (=> b!648155 (= e!371719 Undefined!6899)))

(declare-fun b!648156 () Bool)

(assert (=> b!648156 (= e!371720 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!300618 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18459 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!91795 c!74474) b!648155))

(assert (= (and d!91795 (not c!74474)) b!648152))

(assert (= (and b!648152 c!74475) b!648153))

(assert (= (and b!648152 (not c!74475)) b!648151))

(assert (= (and b!648151 c!74476) b!648154))

(assert (= (and b!648151 (not c!74476)) b!648156))

(declare-fun m!621569 () Bool)

(assert (=> d!91795 m!621569))

(declare-fun m!621571 () Bool)

(assert (=> d!91795 m!621571))

(declare-fun m!621573 () Bool)

(assert (=> d!91795 m!621573))

(assert (=> d!91795 m!621233))

(assert (=> b!648156 m!621565))

(assert (=> b!648156 m!621565))

(assert (=> b!648156 m!621173))

(declare-fun m!621575 () Bool)

(assert (=> b!648156 m!621575))

(assert (=> b!647797 d!91795))

(declare-fun d!91797 () Bool)

(declare-fun res!419941 () Bool)

(declare-fun e!371725 () Bool)

(assert (=> d!91797 (=> res!419941 e!371725)))

(assert (=> d!91797 (= res!419941 (is-Nil!12497 Nil!12497))))

(assert (=> d!91797 (= (noDuplicate!417 Nil!12497) e!371725)))

(declare-fun b!648161 () Bool)

(declare-fun e!371726 () Bool)

(assert (=> b!648161 (= e!371725 e!371726)))

(declare-fun res!419942 () Bool)

(assert (=> b!648161 (=> (not res!419942) (not e!371726))))

(assert (=> b!648161 (= res!419942 (not (contains!3155 (t!18728 Nil!12497) (h!13541 Nil!12497))))))

(declare-fun b!648162 () Bool)

(assert (=> b!648162 (= e!371726 (noDuplicate!417 (t!18728 Nil!12497)))))

(assert (= (and d!91797 (not res!419941)) b!648161))

(assert (= (and b!648161 res!419942) b!648162))

(declare-fun m!621577 () Bool)

(assert (=> b!648161 m!621577))

(declare-fun m!621579 () Bool)

(assert (=> b!648162 m!621579))

(assert (=> b!647790 d!91797))

(declare-fun d!91799 () Bool)

(assert (=> d!91799 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58748 d!91799))

(declare-fun d!91807 () Bool)

(assert (=> d!91807 (= (array_inv!14255 a!2986) (bvsge (size!18823 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58748 d!91807))

(declare-fun d!91811 () Bool)

(assert (=> d!91811 (arrayNoDuplicates!0 lt!300621 j!136 Nil!12497)))

(declare-fun lt!300820 () Unit!22020)

(declare-fun choose!39 (array!38503 (_ BitVec 32) (_ BitVec 32)) Unit!22020)

(assert (=> d!91811 (= lt!300820 (choose!39 lt!300621 #b00000000000000000000000000000000 j!136))))

(assert (=> d!91811 (bvslt (size!18823 lt!300621) #b01111111111111111111111111111111)))

(assert (=> d!91811 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!300621 #b00000000000000000000000000000000 j!136) lt!300820)))

(declare-fun bs!19362 () Bool)

(assert (= bs!19362 d!91811))

(assert (=> bs!19362 m!621207))

(declare-fun m!621613 () Bool)

(assert (=> bs!19362 m!621613))

(assert (=> b!647801 d!91811))

(declare-fun d!91817 () Bool)

(assert (=> d!91817 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18823 lt!300621)) (not (= (select (arr!18459 lt!300621) j!136) (select (arr!18459 a!2986) j!136))))))

(declare-fun lt!300827 () Unit!22020)

(declare-fun choose!21 (array!38503 (_ BitVec 64) (_ BitVec 32) List!12500) Unit!22020)

(assert (=> d!91817 (= lt!300827 (choose!21 lt!300621 (select (arr!18459 a!2986) j!136) j!136 Nil!12497))))

(assert (=> d!91817 (bvslt (size!18823 lt!300621) #b01111111111111111111111111111111)))

(assert (=> d!91817 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300621 (select (arr!18459 a!2986) j!136) j!136 Nil!12497) lt!300827)))

(declare-fun bs!19363 () Bool)

(assert (= bs!19363 d!91817))

(assert (=> bs!19363 m!621461))

(assert (=> bs!19363 m!621173))

(declare-fun m!621629 () Bool)

(assert (=> bs!19363 m!621629))

(assert (=> b!647801 d!91817))

(declare-fun d!91825 () Bool)

(assert (=> d!91825 (arrayContainsKey!0 lt!300621 (select (arr!18459 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300828 () Unit!22020)

(assert (=> d!91825 (= lt!300828 (choose!114 lt!300621 (select (arr!18459 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!91825 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!91825 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300621 (select (arr!18459 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!300828)))

(declare-fun bs!19364 () Bool)

(assert (= bs!19364 d!91825))

(assert (=> bs!19364 m!621173))

(assert (=> bs!19364 m!621205))

(assert (=> bs!19364 m!621173))

(declare-fun m!621631 () Bool)

(assert (=> bs!19364 m!621631))

(assert (=> b!647801 d!91825))

(declare-fun b!648237 () Bool)

(declare-fun e!371778 () Bool)

(assert (=> b!648237 (= e!371778 (contains!3155 Nil!12497 (select (arr!18459 lt!300621) j!136)))))

(declare-fun b!648238 () Bool)

(declare-fun e!371781 () Bool)

(declare-fun call!33721 () Bool)

(assert (=> b!648238 (= e!371781 call!33721)))

(declare-fun b!648239 () Bool)

(declare-fun e!371780 () Bool)

(declare-fun e!371779 () Bool)

(assert (=> b!648239 (= e!371780 e!371779)))

(declare-fun res!419973 () Bool)

(assert (=> b!648239 (=> (not res!419973) (not e!371779))))

(assert (=> b!648239 (= res!419973 (not e!371778))))

(declare-fun res!419971 () Bool)

(assert (=> b!648239 (=> (not res!419971) (not e!371778))))

(assert (=> b!648239 (= res!419971 (validKeyInArray!0 (select (arr!18459 lt!300621) j!136)))))

(declare-fun b!648240 () Bool)

(assert (=> b!648240 (= e!371781 call!33721)))

(declare-fun d!91827 () Bool)

(declare-fun res!419972 () Bool)

(assert (=> d!91827 (=> res!419972 e!371780)))

(assert (=> d!91827 (= res!419972 (bvsge j!136 (size!18823 lt!300621)))))

(assert (=> d!91827 (= (arrayNoDuplicates!0 lt!300621 j!136 Nil!12497) e!371780)))

(declare-fun b!648241 () Bool)

(assert (=> b!648241 (= e!371779 e!371781)))

(declare-fun c!74500 () Bool)

(assert (=> b!648241 (= c!74500 (validKeyInArray!0 (select (arr!18459 lt!300621) j!136)))))

(declare-fun bm!33718 () Bool)

(assert (=> bm!33718 (= call!33721 (arrayNoDuplicates!0 lt!300621 (bvadd j!136 #b00000000000000000000000000000001) (ite c!74500 (Cons!12496 (select (arr!18459 lt!300621) j!136) Nil!12497) Nil!12497)))))

(assert (= (and d!91827 (not res!419972)) b!648239))

(assert (= (and b!648239 res!419971) b!648237))

(assert (= (and b!648239 res!419973) b!648241))

(assert (= (and b!648241 c!74500) b!648240))

(assert (= (and b!648241 (not c!74500)) b!648238))

(assert (= (or b!648240 b!648238) bm!33718))

(assert (=> b!648237 m!621461))

(assert (=> b!648237 m!621461))

(declare-fun m!621637 () Bool)

(assert (=> b!648237 m!621637))

(assert (=> b!648239 m!621461))

(assert (=> b!648239 m!621461))

(declare-fun m!621639 () Bool)

(assert (=> b!648239 m!621639))

(assert (=> b!648241 m!621461))

(assert (=> b!648241 m!621461))

(assert (=> b!648241 m!621639))

(assert (=> bm!33718 m!621461))

(declare-fun m!621641 () Bool)

(assert (=> bm!33718 m!621641))

(assert (=> b!647801 d!91827))

(declare-fun b!648242 () Bool)

(declare-fun e!371782 () Bool)

(assert (=> b!648242 (= e!371782 (contains!3155 Nil!12497 (select (arr!18459 lt!300621) #b00000000000000000000000000000000)))))

(declare-fun b!648243 () Bool)

(declare-fun e!371785 () Bool)

(declare-fun call!33722 () Bool)

(assert (=> b!648243 (= e!371785 call!33722)))

(declare-fun b!648244 () Bool)

(declare-fun e!371784 () Bool)

(declare-fun e!371783 () Bool)

(assert (=> b!648244 (= e!371784 e!371783)))

(declare-fun res!419976 () Bool)

(assert (=> b!648244 (=> (not res!419976) (not e!371783))))

(assert (=> b!648244 (= res!419976 (not e!371782))))

(declare-fun res!419974 () Bool)

(assert (=> b!648244 (=> (not res!419974) (not e!371782))))

(assert (=> b!648244 (= res!419974 (validKeyInArray!0 (select (arr!18459 lt!300621) #b00000000000000000000000000000000)))))

(declare-fun b!648245 () Bool)

(assert (=> b!648245 (= e!371785 call!33722)))

(declare-fun d!91831 () Bool)

(declare-fun res!419975 () Bool)

(assert (=> d!91831 (=> res!419975 e!371784)))

(assert (=> d!91831 (= res!419975 (bvsge #b00000000000000000000000000000000 (size!18823 lt!300621)))))

(assert (=> d!91831 (= (arrayNoDuplicates!0 lt!300621 #b00000000000000000000000000000000 Nil!12497) e!371784)))

(declare-fun b!648246 () Bool)

(assert (=> b!648246 (= e!371783 e!371785)))

(declare-fun c!74501 () Bool)

(assert (=> b!648246 (= c!74501 (validKeyInArray!0 (select (arr!18459 lt!300621) #b00000000000000000000000000000000)))))

(declare-fun bm!33719 () Bool)

(assert (=> bm!33719 (= call!33722 (arrayNoDuplicates!0 lt!300621 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74501 (Cons!12496 (select (arr!18459 lt!300621) #b00000000000000000000000000000000) Nil!12497) Nil!12497)))))

(assert (= (and d!91831 (not res!419975)) b!648244))

(assert (= (and b!648244 res!419974) b!648242))

(assert (= (and b!648244 res!419976) b!648246))

(assert (= (and b!648246 c!74501) b!648245))

(assert (= (and b!648246 (not c!74501)) b!648243))

(assert (= (or b!648245 b!648243) bm!33719))

(declare-fun m!621643 () Bool)

(assert (=> b!648242 m!621643))

(assert (=> b!648242 m!621643))

(declare-fun m!621645 () Bool)

(assert (=> b!648242 m!621645))

(assert (=> b!648244 m!621643))

(assert (=> b!648244 m!621643))

(declare-fun m!621647 () Bool)

(assert (=> b!648244 m!621647))

(assert (=> b!648246 m!621643))

(assert (=> b!648246 m!621643))

(assert (=> b!648246 m!621647))

(assert (=> bm!33719 m!621643))

(declare-fun m!621649 () Bool)

(assert (=> bm!33719 m!621649))

(assert (=> b!647801 d!91831))

(declare-fun d!91833 () Bool)

(declare-fun res!419977 () Bool)

(declare-fun e!371786 () Bool)

(assert (=> d!91833 (=> res!419977 e!371786)))

(assert (=> d!91833 (= res!419977 (= (select (arr!18459 lt!300621) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18459 a!2986) j!136)))))

(assert (=> d!91833 (= (arrayContainsKey!0 lt!300621 (select (arr!18459 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!371786)))

(declare-fun b!648247 () Bool)

(declare-fun e!371787 () Bool)

(assert (=> b!648247 (= e!371786 e!371787)))

(declare-fun res!419978 () Bool)

(assert (=> b!648247 (=> (not res!419978) (not e!371787))))

(assert (=> b!648247 (= res!419978 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18823 lt!300621)))))

(declare-fun b!648248 () Bool)

(assert (=> b!648248 (= e!371787 (arrayContainsKey!0 lt!300621 (select (arr!18459 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91833 (not res!419977)) b!648247))

(assert (= (and b!648247 res!419978) b!648248))

(declare-fun m!621651 () Bool)

(assert (=> d!91833 m!621651))

(assert (=> b!648248 m!621173))

(declare-fun m!621653 () Bool)

(assert (=> b!648248 m!621653))

(assert (=> b!647801 d!91833))

(declare-fun d!91835 () Bool)

(declare-fun e!371790 () Bool)

(assert (=> d!91835 e!371790))

(declare-fun res!419981 () Bool)

(assert (=> d!91835 (=> (not res!419981) (not e!371790))))

(assert (=> d!91835 (= res!419981 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18823 a!2986))))))

(declare-fun lt!300831 () Unit!22020)

(declare-fun choose!41 (array!38503 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12500) Unit!22020)

(assert (=> d!91835 (= lt!300831 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12497))))

(assert (=> d!91835 (bvslt (size!18823 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91835 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12497) lt!300831)))

(declare-fun b!648251 () Bool)

(assert (=> b!648251 (= e!371790 (arrayNoDuplicates!0 (array!38504 (store (arr!18459 a!2986) i!1108 k!1786) (size!18823 a!2986)) #b00000000000000000000000000000000 Nil!12497))))

(assert (= (and d!91835 res!419981) b!648251))

(declare-fun m!621655 () Bool)

(assert (=> d!91835 m!621655))

(assert (=> b!648251 m!621175))

(declare-fun m!621657 () Bool)

(assert (=> b!648251 m!621657))

(assert (=> b!647801 d!91835))

(declare-fun d!91837 () Bool)

(declare-fun res!419982 () Bool)

(declare-fun e!371791 () Bool)

(assert (=> d!91837 (=> res!419982 e!371791)))

(assert (=> d!91837 (= res!419982 (= (select (arr!18459 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!91837 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!371791)))

(declare-fun b!648252 () Bool)

(declare-fun e!371792 () Bool)

(assert (=> b!648252 (= e!371791 e!371792)))

(declare-fun res!419983 () Bool)

(assert (=> b!648252 (=> (not res!419983) (not e!371792))))

(assert (=> b!648252 (= res!419983 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18823 a!2986)))))

(declare-fun b!648253 () Bool)

(assert (=> b!648253 (= e!371792 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91837 (not res!419982)) b!648252))

(assert (= (and b!648252 res!419983) b!648253))

(declare-fun m!621659 () Bool)

(assert (=> d!91837 m!621659))

(declare-fun m!621661 () Bool)

(assert (=> b!648253 m!621661))

(assert (=> b!647799 d!91837))

(declare-fun b!648254 () Bool)

(declare-fun c!74504 () Bool)

(declare-fun lt!300833 () (_ BitVec 64))

(assert (=> b!648254 (= c!74504 (= lt!300833 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371793 () SeekEntryResult!6899)

(declare-fun e!371795 () SeekEntryResult!6899)

(assert (=> b!648254 (= e!371793 e!371795)))

(declare-fun b!648255 () Bool)

(declare-fun e!371794 () SeekEntryResult!6899)

(assert (=> b!648255 (= e!371794 e!371793)))

(declare-fun c!74503 () Bool)

(assert (=> b!648255 (= c!74503 (= lt!300833 (select (arr!18459 a!2986) j!136)))))

(declare-fun lt!300832 () SeekEntryResult!6899)

(declare-fun d!91839 () Bool)

(assert (=> d!91839 (and (or (is-Undefined!6899 lt!300832) (not (is-Found!6899 lt!300832)) (and (bvsge (index!29941 lt!300832) #b00000000000000000000000000000000) (bvslt (index!29941 lt!300832) (size!18823 a!2986)))) (or (is-Undefined!6899 lt!300832) (is-Found!6899 lt!300832) (not (is-MissingVacant!6899 lt!300832)) (not (= (index!29943 lt!300832) vacantSpotIndex!68)) (and (bvsge (index!29943 lt!300832) #b00000000000000000000000000000000) (bvslt (index!29943 lt!300832) (size!18823 a!2986)))) (or (is-Undefined!6899 lt!300832) (ite (is-Found!6899 lt!300832) (= (select (arr!18459 a!2986) (index!29941 lt!300832)) (select (arr!18459 a!2986) j!136)) (and (is-MissingVacant!6899 lt!300832) (= (index!29943 lt!300832) vacantSpotIndex!68) (= (select (arr!18459 a!2986) (index!29943 lt!300832)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91839 (= lt!300832 e!371794)))

(declare-fun c!74502 () Bool)

(assert (=> d!91839 (= c!74502 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91839 (= lt!300833 (select (arr!18459 a!2986) index!984))))

(assert (=> d!91839 (validMask!0 mask!3053)))

(assert (=> d!91839 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18459 a!2986) j!136) a!2986 mask!3053) lt!300832)))

(declare-fun b!648256 () Bool)

(assert (=> b!648256 (= e!371793 (Found!6899 index!984))))

(declare-fun b!648257 () Bool)

(assert (=> b!648257 (= e!371795 (MissingVacant!6899 vacantSpotIndex!68))))

(declare-fun b!648258 () Bool)

(assert (=> b!648258 (= e!371794 Undefined!6899)))

(declare-fun b!648259 () Bool)

(assert (=> b!648259 (= e!371795 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18459 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!91839 c!74502) b!648258))

(assert (= (and d!91839 (not c!74502)) b!648255))

(assert (= (and b!648255 c!74503) b!648256))

(assert (= (and b!648255 (not c!74503)) b!648254))

(assert (= (and b!648254 c!74504) b!648257))

(assert (= (and b!648254 (not c!74504)) b!648259))

(declare-fun m!621663 () Bool)

(assert (=> d!91839 m!621663))

(declare-fun m!621665 () Bool)

(assert (=> d!91839 m!621665))

(assert (=> d!91839 m!621185))

(assert (=> d!91839 m!621233))

(assert (=> b!648259 m!621217))

(assert (=> b!648259 m!621217))

(assert (=> b!648259 m!621173))

(declare-fun m!621667 () Bool)

(assert (=> b!648259 m!621667))

(assert (=> b!647800 d!91839))

(assert (=> b!647782 d!91735))

(declare-fun b!648260 () Bool)

(declare-fun e!371796 () Bool)

(assert (=> b!648260 (= e!371796 (contains!3155 Nil!12497 (select (arr!18459 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!648261 () Bool)

(declare-fun e!371799 () Bool)

(declare-fun call!33723 () Bool)

(assert (=> b!648261 (= e!371799 call!33723)))

(declare-fun b!648262 () Bool)

(declare-fun e!371798 () Bool)

(declare-fun e!371797 () Bool)

(assert (=> b!648262 (= e!371798 e!371797)))

(declare-fun res!419986 () Bool)

(assert (=> b!648262 (=> (not res!419986) (not e!371797))))

(assert (=> b!648262 (= res!419986 (not e!371796))))

(declare-fun res!419984 () Bool)

(assert (=> b!648262 (=> (not res!419984) (not e!371796))))

(assert (=> b!648262 (= res!419984 (validKeyInArray!0 (select (arr!18459 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!648263 () Bool)

(assert (=> b!648263 (= e!371799 call!33723)))

(declare-fun d!91841 () Bool)

(declare-fun res!419985 () Bool)

(assert (=> d!91841 (=> res!419985 e!371798)))

(assert (=> d!91841 (= res!419985 (bvsge #b00000000000000000000000000000000 (size!18823 a!2986)))))

(assert (=> d!91841 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12497) e!371798)))

(declare-fun b!648264 () Bool)

(assert (=> b!648264 (= e!371797 e!371799)))

(declare-fun c!74505 () Bool)

(assert (=> b!648264 (= c!74505 (validKeyInArray!0 (select (arr!18459 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33720 () Bool)

(assert (=> bm!33720 (= call!33723 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74505 (Cons!12496 (select (arr!18459 a!2986) #b00000000000000000000000000000000) Nil!12497) Nil!12497)))))

(assert (= (and d!91841 (not res!419985)) b!648262))

(assert (= (and b!648262 res!419984) b!648260))

(assert (= (and b!648262 res!419986) b!648264))

(assert (= (and b!648264 c!74505) b!648263))

(assert (= (and b!648264 (not c!74505)) b!648261))

(assert (= (or b!648263 b!648261) bm!33720))

(assert (=> b!648260 m!621659))

(assert (=> b!648260 m!621659))

(declare-fun m!621669 () Bool)

(assert (=> b!648260 m!621669))

(assert (=> b!648262 m!621659))

(assert (=> b!648262 m!621659))

(declare-fun m!621671 () Bool)

(assert (=> b!648262 m!621671))

(assert (=> b!648264 m!621659))

(assert (=> b!648264 m!621659))

(assert (=> b!648264 m!621671))

(assert (=> bm!33720 m!621659))

(declare-fun m!621673 () Bool)

(assert (=> bm!33720 m!621673))

(assert (=> b!647793 d!91841))

(declare-fun b!648285 () Bool)

(declare-fun e!371814 () Bool)

(declare-fun e!371813 () Bool)

(assert (=> b!648285 (= e!371814 e!371813)))

(declare-fun c!74514 () Bool)

(assert (=> b!648285 (= c!74514 (validKeyInArray!0 (select (arr!18459 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33723 () Bool)

(declare-fun call!33726 () Bool)

(assert (=> bm!33723 (= call!33726 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!648286 () Bool)

(declare-fun e!371812 () Bool)

(assert (=> b!648286 (= e!371812 call!33726)))

(declare-fun d!91843 () Bool)

(declare-fun res!419992 () Bool)

(assert (=> d!91843 (=> res!419992 e!371814)))

(assert (=> d!91843 (= res!419992 (bvsge #b00000000000000000000000000000000 (size!18823 a!2986)))))

(assert (=> d!91843 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!371814)))

(declare-fun b!648287 () Bool)

(assert (=> b!648287 (= e!371813 e!371812)))

(declare-fun lt!300848 () (_ BitVec 64))

(assert (=> b!648287 (= lt!300848 (select (arr!18459 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!300846 () Unit!22020)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38503 (_ BitVec 64) (_ BitVec 32)) Unit!22020)

(assert (=> b!648287 (= lt!300846 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!300848 #b00000000000000000000000000000000))))

(assert (=> b!648287 (arrayContainsKey!0 a!2986 lt!300848 #b00000000000000000000000000000000)))

(declare-fun lt!300847 () Unit!22020)

(assert (=> b!648287 (= lt!300847 lt!300846)))

(declare-fun res!419991 () Bool)

(assert (=> b!648287 (= res!419991 (= (seekEntryOrOpen!0 (select (arr!18459 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6899 #b00000000000000000000000000000000)))))

(assert (=> b!648287 (=> (not res!419991) (not e!371812))))

(declare-fun b!648288 () Bool)

(assert (=> b!648288 (= e!371813 call!33726)))

(assert (= (and d!91843 (not res!419992)) b!648285))

(assert (= (and b!648285 c!74514) b!648287))

(assert (= (and b!648285 (not c!74514)) b!648288))

(assert (= (and b!648287 res!419991) b!648286))

(assert (= (or b!648286 b!648288) bm!33723))

(assert (=> b!648285 m!621659))

(assert (=> b!648285 m!621659))

(assert (=> b!648285 m!621671))

(declare-fun m!621675 () Bool)

(assert (=> bm!33723 m!621675))

(assert (=> b!648287 m!621659))

(declare-fun m!621677 () Bool)

(assert (=> b!648287 m!621677))

(declare-fun m!621679 () Bool)

(assert (=> b!648287 m!621679))

(assert (=> b!648287 m!621659))

