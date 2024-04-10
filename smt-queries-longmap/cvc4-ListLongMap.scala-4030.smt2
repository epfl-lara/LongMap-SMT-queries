; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54890 () Bool)

(assert start!54890)

(declare-fun b!600647 () Bool)

(declare-fun res!385514 () Bool)

(declare-fun e!343418 () Bool)

(assert (=> b!600647 (=> (not res!385514) (not e!343418))))

(declare-datatypes ((array!37125 0))(
  ( (array!37126 (arr!17822 (Array (_ BitVec 32) (_ BitVec 64))) (size!18186 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37125)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600647 (= res!385514 (validKeyInArray!0 (select (arr!17822 a!2986) j!136)))))

(declare-fun b!600648 () Bool)

(declare-datatypes ((Unit!18966 0))(
  ( (Unit!18967) )
))
(declare-fun e!343427 () Unit!18966)

(declare-fun Unit!18968 () Unit!18966)

(assert (=> b!600648 (= e!343427 Unit!18968)))

(declare-fun b!600649 () Bool)

(declare-fun e!343423 () Bool)

(declare-fun e!343426 () Bool)

(assert (=> b!600649 (= e!343423 e!343426)))

(declare-fun res!385521 () Bool)

(assert (=> b!600649 (=> res!385521 e!343426)))

(declare-fun lt!273264 () (_ BitVec 64))

(declare-fun lt!273275 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!600649 (= res!385521 (or (not (= (select (arr!17822 a!2986) j!136) lt!273264)) (not (= (select (arr!17822 a!2986) j!136) lt!273275)) (bvsge j!136 index!984)))))

(declare-fun e!343417 () Bool)

(assert (=> b!600649 e!343417))

(declare-fun res!385513 () Bool)

(assert (=> b!600649 (=> (not res!385513) (not e!343417))))

(assert (=> b!600649 (= res!385513 (= lt!273275 (select (arr!17822 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!600649 (= lt!273275 (select (store (arr!17822 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!600650 () Bool)

(declare-fun res!385516 () Bool)

(declare-fun e!343420 () Bool)

(assert (=> b!600650 (=> res!385516 e!343420)))

(declare-datatypes ((List!11863 0))(
  ( (Nil!11860) (Cons!11859 (h!12904 (_ BitVec 64)) (t!18091 List!11863)) )
))
(declare-fun noDuplicate!296 (List!11863) Bool)

(assert (=> b!600650 (= res!385516 (not (noDuplicate!296 Nil!11860)))))

(declare-fun b!600651 () Bool)

(declare-fun e!343422 () Bool)

(declare-fun e!343419 () Bool)

(assert (=> b!600651 (= e!343422 e!343419)))

(declare-fun res!385515 () Bool)

(assert (=> b!600651 (=> (not res!385515) (not e!343419))))

(declare-fun lt!273276 () array!37125)

(declare-fun arrayContainsKey!0 (array!37125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600651 (= res!385515 (arrayContainsKey!0 lt!273276 (select (arr!17822 a!2986) j!136) j!136))))

(declare-fun b!600652 () Bool)

(declare-fun res!385525 () Bool)

(declare-fun e!343425 () Bool)

(assert (=> b!600652 (=> (not res!385525) (not e!343425))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37125 (_ BitVec 32)) Bool)

(assert (=> b!600652 (= res!385525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!600653 () Bool)

(assert (=> b!600653 (= e!343417 e!343422)))

(declare-fun res!385522 () Bool)

(assert (=> b!600653 (=> res!385522 e!343422)))

(assert (=> b!600653 (= res!385522 (or (not (= (select (arr!17822 a!2986) j!136) lt!273264)) (not (= (select (arr!17822 a!2986) j!136) lt!273275)) (bvsge j!136 index!984)))))

(declare-fun b!600654 () Bool)

(declare-fun Unit!18969 () Unit!18966)

(assert (=> b!600654 (= e!343427 Unit!18969)))

(assert (=> b!600654 false))

(declare-fun b!600655 () Bool)

(declare-fun res!385519 () Bool)

(assert (=> b!600655 (=> res!385519 e!343420)))

(declare-fun contains!2979 (List!11863 (_ BitVec 64)) Bool)

(assert (=> b!600655 (= res!385519 (contains!2979 Nil!11860 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!385528 () Bool)

(assert (=> start!54890 (=> (not res!385528) (not e!343418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54890 (= res!385528 (validMask!0 mask!3053))))

(assert (=> start!54890 e!343418))

(assert (=> start!54890 true))

(declare-fun array_inv!13618 (array!37125) Bool)

(assert (=> start!54890 (array_inv!13618 a!2986)))

(declare-fun b!600656 () Bool)

(declare-fun res!385530 () Bool)

(assert (=> b!600656 (=> (not res!385530) (not e!343418))))

(assert (=> b!600656 (= res!385530 (validKeyInArray!0 k!1786))))

(declare-fun b!600657 () Bool)

(declare-fun e!343421 () Bool)

(declare-datatypes ((SeekEntryResult!6262 0))(
  ( (MissingZero!6262 (index!27305 (_ BitVec 32))) (Found!6262 (index!27306 (_ BitVec 32))) (Intermediate!6262 (undefined!7074 Bool) (index!27307 (_ BitVec 32)) (x!56101 (_ BitVec 32))) (Undefined!6262) (MissingVacant!6262 (index!27308 (_ BitVec 32))) )
))
(declare-fun lt!273265 () SeekEntryResult!6262)

(declare-fun lt!273268 () SeekEntryResult!6262)

(assert (=> b!600657 (= e!343421 (= lt!273265 lt!273268))))

(declare-fun b!600658 () Bool)

(declare-fun e!343428 () Bool)

(assert (=> b!600658 (= e!343425 e!343428)))

(declare-fun res!385531 () Bool)

(assert (=> b!600658 (=> (not res!385531) (not e!343428))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!600658 (= res!385531 (= (select (store (arr!17822 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!600658 (= lt!273276 (array!37126 (store (arr!17822 a!2986) i!1108 k!1786) (size!18186 a!2986)))))

(declare-fun b!600659 () Bool)

(assert (=> b!600659 (= e!343420 true)))

(declare-fun lt!273267 () Bool)

(assert (=> b!600659 (= lt!273267 (contains!2979 Nil!11860 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600660 () Bool)

(declare-fun res!385527 () Bool)

(assert (=> b!600660 (=> (not res!385527) (not e!343418))))

(assert (=> b!600660 (= res!385527 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!600661 () Bool)

(assert (=> b!600661 (= e!343426 e!343420)))

(declare-fun res!385523 () Bool)

(assert (=> b!600661 (=> res!385523 e!343420)))

(assert (=> b!600661 (= res!385523 (or (bvsge (size!18186 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18186 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!37125 (_ BitVec 32) List!11863) Bool)

(assert (=> b!600661 (arrayNoDuplicates!0 lt!273276 j!136 Nil!11860)))

(declare-fun lt!273277 () Unit!18966)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37125 (_ BitVec 32) (_ BitVec 32)) Unit!18966)

(assert (=> b!600661 (= lt!273277 (lemmaNoDuplicateFromThenFromBigger!0 lt!273276 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600661 (arrayNoDuplicates!0 lt!273276 #b00000000000000000000000000000000 Nil!11860)))

(declare-fun lt!273273 () Unit!18966)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37125 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11863) Unit!18966)

(assert (=> b!600661 (= lt!273273 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11860))))

(assert (=> b!600661 (arrayContainsKey!0 lt!273276 (select (arr!17822 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273270 () Unit!18966)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37125 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18966)

(assert (=> b!600661 (= lt!273270 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273276 (select (arr!17822 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!600662 () Bool)

(assert (=> b!600662 (= e!343418 e!343425)))

(declare-fun res!385520 () Bool)

(assert (=> b!600662 (=> (not res!385520) (not e!343425))))

(declare-fun lt!273266 () SeekEntryResult!6262)

(assert (=> b!600662 (= res!385520 (or (= lt!273266 (MissingZero!6262 i!1108)) (= lt!273266 (MissingVacant!6262 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37125 (_ BitVec 32)) SeekEntryResult!6262)

(assert (=> b!600662 (= lt!273266 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!600663 () Bool)

(declare-fun e!343416 () Bool)

(assert (=> b!600663 (= e!343428 e!343416)))

(declare-fun res!385526 () Bool)

(assert (=> b!600663 (=> (not res!385526) (not e!343416))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!600663 (= res!385526 (and (= lt!273265 (Found!6262 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17822 a!2986) index!984) (select (arr!17822 a!2986) j!136))) (not (= (select (arr!17822 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37125 (_ BitVec 32)) SeekEntryResult!6262)

(assert (=> b!600663 (= lt!273265 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17822 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!600664 () Bool)

(declare-fun res!385524 () Bool)

(assert (=> b!600664 (=> (not res!385524) (not e!343418))))

(assert (=> b!600664 (= res!385524 (and (= (size!18186 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18186 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18186 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!600665 () Bool)

(assert (=> b!600665 (= e!343419 (arrayContainsKey!0 lt!273276 (select (arr!17822 a!2986) j!136) index!984))))

(declare-fun b!600666 () Bool)

(declare-fun res!385517 () Bool)

(assert (=> b!600666 (=> (not res!385517) (not e!343425))))

(assert (=> b!600666 (= res!385517 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11860))))

(declare-fun b!600667 () Bool)

(declare-fun res!385529 () Bool)

(assert (=> b!600667 (=> (not res!385529) (not e!343425))))

(assert (=> b!600667 (= res!385529 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17822 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!600668 () Bool)

(assert (=> b!600668 (= e!343416 (not e!343423))))

(declare-fun res!385518 () Bool)

(assert (=> b!600668 (=> res!385518 e!343423)))

(declare-fun lt!273269 () SeekEntryResult!6262)

(assert (=> b!600668 (= res!385518 (not (= lt!273269 (Found!6262 index!984))))))

(declare-fun lt!273272 () Unit!18966)

(assert (=> b!600668 (= lt!273272 e!343427)))

(declare-fun c!67934 () Bool)

(assert (=> b!600668 (= c!67934 (= lt!273269 Undefined!6262))))

(assert (=> b!600668 (= lt!273269 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273264 lt!273276 mask!3053))))

(assert (=> b!600668 e!343421))

(declare-fun res!385532 () Bool)

(assert (=> b!600668 (=> (not res!385532) (not e!343421))))

(declare-fun lt!273271 () (_ BitVec 32))

(assert (=> b!600668 (= res!385532 (= lt!273268 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273271 vacantSpotIndex!68 lt!273264 lt!273276 mask!3053)))))

(assert (=> b!600668 (= lt!273268 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273271 vacantSpotIndex!68 (select (arr!17822 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!600668 (= lt!273264 (select (store (arr!17822 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!273274 () Unit!18966)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37125 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18966)

(assert (=> b!600668 (= lt!273274 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273271 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600668 (= lt!273271 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!54890 res!385528) b!600664))

(assert (= (and b!600664 res!385524) b!600647))

(assert (= (and b!600647 res!385514) b!600656))

(assert (= (and b!600656 res!385530) b!600660))

(assert (= (and b!600660 res!385527) b!600662))

(assert (= (and b!600662 res!385520) b!600652))

(assert (= (and b!600652 res!385525) b!600666))

(assert (= (and b!600666 res!385517) b!600667))

(assert (= (and b!600667 res!385529) b!600658))

(assert (= (and b!600658 res!385531) b!600663))

(assert (= (and b!600663 res!385526) b!600668))

(assert (= (and b!600668 res!385532) b!600657))

(assert (= (and b!600668 c!67934) b!600654))

(assert (= (and b!600668 (not c!67934)) b!600648))

(assert (= (and b!600668 (not res!385518)) b!600649))

(assert (= (and b!600649 res!385513) b!600653))

(assert (= (and b!600653 (not res!385522)) b!600651))

(assert (= (and b!600651 res!385515) b!600665))

(assert (= (and b!600649 (not res!385521)) b!600661))

(assert (= (and b!600661 (not res!385523)) b!600650))

(assert (= (and b!600650 (not res!385516)) b!600655))

(assert (= (and b!600655 (not res!385519)) b!600659))

(declare-fun m!577861 () Bool)

(assert (=> b!600653 m!577861))

(declare-fun m!577863 () Bool)

(assert (=> b!600650 m!577863))

(declare-fun m!577865 () Bool)

(assert (=> b!600668 m!577865))

(declare-fun m!577867 () Bool)

(assert (=> b!600668 m!577867))

(assert (=> b!600668 m!577861))

(declare-fun m!577869 () Bool)

(assert (=> b!600668 m!577869))

(assert (=> b!600668 m!577861))

(declare-fun m!577871 () Bool)

(assert (=> b!600668 m!577871))

(declare-fun m!577873 () Bool)

(assert (=> b!600668 m!577873))

(declare-fun m!577875 () Bool)

(assert (=> b!600668 m!577875))

(declare-fun m!577877 () Bool)

(assert (=> b!600668 m!577877))

(declare-fun m!577879 () Bool)

(assert (=> b!600667 m!577879))

(assert (=> b!600649 m!577861))

(assert (=> b!600649 m!577877))

(declare-fun m!577881 () Bool)

(assert (=> b!600649 m!577881))

(assert (=> b!600658 m!577877))

(declare-fun m!577883 () Bool)

(assert (=> b!600658 m!577883))

(declare-fun m!577885 () Bool)

(assert (=> b!600662 m!577885))

(declare-fun m!577887 () Bool)

(assert (=> b!600660 m!577887))

(assert (=> b!600665 m!577861))

(assert (=> b!600665 m!577861))

(declare-fun m!577889 () Bool)

(assert (=> b!600665 m!577889))

(declare-fun m!577891 () Bool)

(assert (=> b!600663 m!577891))

(assert (=> b!600663 m!577861))

(assert (=> b!600663 m!577861))

(declare-fun m!577893 () Bool)

(assert (=> b!600663 m!577893))

(declare-fun m!577895 () Bool)

(assert (=> b!600652 m!577895))

(declare-fun m!577897 () Bool)

(assert (=> b!600659 m!577897))

(declare-fun m!577899 () Bool)

(assert (=> b!600655 m!577899))

(assert (=> b!600661 m!577861))

(assert (=> b!600661 m!577861))

(declare-fun m!577901 () Bool)

(assert (=> b!600661 m!577901))

(declare-fun m!577903 () Bool)

(assert (=> b!600661 m!577903))

(declare-fun m!577905 () Bool)

(assert (=> b!600661 m!577905))

(assert (=> b!600661 m!577861))

(declare-fun m!577907 () Bool)

(assert (=> b!600661 m!577907))

(declare-fun m!577909 () Bool)

(assert (=> b!600661 m!577909))

(declare-fun m!577911 () Bool)

(assert (=> b!600661 m!577911))

(assert (=> b!600651 m!577861))

(assert (=> b!600651 m!577861))

(declare-fun m!577913 () Bool)

(assert (=> b!600651 m!577913))

(declare-fun m!577915 () Bool)

(assert (=> start!54890 m!577915))

(declare-fun m!577917 () Bool)

(assert (=> start!54890 m!577917))

(declare-fun m!577919 () Bool)

(assert (=> b!600656 m!577919))

(assert (=> b!600647 m!577861))

(assert (=> b!600647 m!577861))

(declare-fun m!577921 () Bool)

(assert (=> b!600647 m!577921))

(declare-fun m!577923 () Bool)

(assert (=> b!600666 m!577923))

(push 1)

