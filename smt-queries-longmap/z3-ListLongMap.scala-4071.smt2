; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55926 () Bool)

(assert start!55926)

(declare-fun b!612538 () Bool)

(declare-fun e!351113 () Bool)

(declare-fun e!351101 () Bool)

(assert (=> b!612538 (= e!351113 e!351101)))

(declare-fun res!394090 () Bool)

(assert (=> b!612538 (=> (not res!394090) (not e!351101))))

(declare-datatypes ((SeekEntryResult!6384 0))(
  ( (MissingZero!6384 (index!27820 (_ BitVec 32))) (Found!6384 (index!27821 (_ BitVec 32))) (Intermediate!6384 (undefined!7196 Bool) (index!27822 (_ BitVec 32)) (x!56632 (_ BitVec 32))) (Undefined!6384) (MissingVacant!6384 (index!27823 (_ BitVec 32))) )
))
(declare-fun lt!280493 () SeekEntryResult!6384)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37396 0))(
  ( (array!37397 (arr!17944 (Array (_ BitVec 32) (_ BitVec 64))) (size!18308 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37396)

(assert (=> b!612538 (= res!394090 (and (= lt!280493 (Found!6384 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17944 a!2986) index!984) (select (arr!17944 a!2986) j!136))) (not (= (select (arr!17944 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37396 (_ BitVec 32)) SeekEntryResult!6384)

(assert (=> b!612538 (= lt!280493 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17944 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!612539 () Bool)

(declare-fun e!351105 () Bool)

(assert (=> b!612539 (= e!351101 (not e!351105))))

(declare-fun res!394106 () Bool)

(assert (=> b!612539 (=> res!394106 e!351105)))

(declare-fun lt!280500 () SeekEntryResult!6384)

(assert (=> b!612539 (= res!394106 (not (= lt!280500 (Found!6384 index!984))))))

(declare-datatypes ((Unit!19684 0))(
  ( (Unit!19685) )
))
(declare-fun lt!280507 () Unit!19684)

(declare-fun e!351109 () Unit!19684)

(assert (=> b!612539 (= lt!280507 e!351109)))

(declare-fun c!69592 () Bool)

(assert (=> b!612539 (= c!69592 (= lt!280500 Undefined!6384))))

(declare-fun lt!280503 () array!37396)

(declare-fun lt!280496 () (_ BitVec 64))

(assert (=> b!612539 (= lt!280500 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!280496 lt!280503 mask!3053))))

(declare-fun e!351102 () Bool)

(assert (=> b!612539 e!351102))

(declare-fun res!394103 () Bool)

(assert (=> b!612539 (=> (not res!394103) (not e!351102))))

(declare-fun lt!280495 () (_ BitVec 32))

(declare-fun lt!280499 () SeekEntryResult!6384)

(assert (=> b!612539 (= res!394103 (= lt!280499 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280495 vacantSpotIndex!68 lt!280496 lt!280503 mask!3053)))))

(assert (=> b!612539 (= lt!280499 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280495 vacantSpotIndex!68 (select (arr!17944 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!612539 (= lt!280496 (select (store (arr!17944 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!280494 () Unit!19684)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37396 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19684)

(assert (=> b!612539 (= lt!280494 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!280495 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!612539 (= lt!280495 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!612540 () Bool)

(declare-fun e!351110 () Bool)

(declare-fun arrayContainsKey!0 (array!37396 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!612540 (= e!351110 (arrayContainsKey!0 lt!280503 (select (arr!17944 a!2986) j!136) index!984))))

(declare-fun b!612541 () Bool)

(declare-fun e!351103 () Unit!19684)

(declare-fun Unit!19686 () Unit!19684)

(assert (=> b!612541 (= e!351103 Unit!19686)))

(declare-fun b!612542 () Bool)

(declare-fun e!351100 () Bool)

(declare-fun e!351108 () Bool)

(assert (=> b!612542 (= e!351100 e!351108)))

(declare-fun res!394100 () Bool)

(assert (=> b!612542 (=> res!394100 e!351108)))

(declare-fun lt!280502 () (_ BitVec 64))

(assert (=> b!612542 (= res!394100 (or (not (= (select (arr!17944 a!2986) j!136) lt!280496)) (not (= (select (arr!17944 a!2986) j!136) lt!280502)) (bvsge j!136 index!984)))))

(declare-fun b!612543 () Bool)

(declare-fun res!394097 () Bool)

(declare-fun e!351107 () Bool)

(assert (=> b!612543 (=> (not res!394097) (not e!351107))))

(declare-datatypes ((List!11985 0))(
  ( (Nil!11982) (Cons!11981 (h!13026 (_ BitVec 64)) (t!18213 List!11985)) )
))
(declare-fun arrayNoDuplicates!0 (array!37396 (_ BitVec 32) List!11985) Bool)

(assert (=> b!612543 (= res!394097 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11982))))

(declare-fun res!394093 () Bool)

(declare-fun e!351111 () Bool)

(assert (=> start!55926 (=> (not res!394093) (not e!351111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55926 (= res!394093 (validMask!0 mask!3053))))

(assert (=> start!55926 e!351111))

(assert (=> start!55926 true))

(declare-fun array_inv!13740 (array!37396) Bool)

(assert (=> start!55926 (array_inv!13740 a!2986)))

(declare-fun b!612544 () Bool)

(declare-fun e!351112 () Bool)

(assert (=> b!612544 (= e!351108 e!351112)))

(declare-fun res!394104 () Bool)

(assert (=> b!612544 (=> (not res!394104) (not e!351112))))

(assert (=> b!612544 (= res!394104 (arrayContainsKey!0 lt!280503 (select (arr!17944 a!2986) j!136) j!136))))

(declare-fun b!612545 () Bool)

(declare-fun res!394099 () Bool)

(assert (=> b!612545 (=> (not res!394099) (not e!351111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!612545 (= res!394099 (validKeyInArray!0 k0!1786))))

(declare-fun b!612546 () Bool)

(assert (=> b!612546 (= e!351111 e!351107)))

(declare-fun res!394098 () Bool)

(assert (=> b!612546 (=> (not res!394098) (not e!351107))))

(declare-fun lt!280505 () SeekEntryResult!6384)

(assert (=> b!612546 (= res!394098 (or (= lt!280505 (MissingZero!6384 i!1108)) (= lt!280505 (MissingVacant!6384 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37396 (_ BitVec 32)) SeekEntryResult!6384)

(assert (=> b!612546 (= lt!280505 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!612547 () Bool)

(declare-fun res!394105 () Bool)

(assert (=> b!612547 (=> (not res!394105) (not e!351111))))

(assert (=> b!612547 (= res!394105 (and (= (size!18308 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18308 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18308 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!612548 () Bool)

(declare-fun Unit!19687 () Unit!19684)

(assert (=> b!612548 (= e!351103 Unit!19687)))

(declare-fun lt!280498 () Unit!19684)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37396 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19684)

(assert (=> b!612548 (= lt!280498 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280503 (select (arr!17944 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!612548 (arrayContainsKey!0 lt!280503 (select (arr!17944 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!280491 () Unit!19684)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37396 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11985) Unit!19684)

(assert (=> b!612548 (= lt!280491 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11982))))

(assert (=> b!612548 (arrayNoDuplicates!0 lt!280503 #b00000000000000000000000000000000 Nil!11982)))

(declare-fun lt!280506 () Unit!19684)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37396 (_ BitVec 32) (_ BitVec 32)) Unit!19684)

(assert (=> b!612548 (= lt!280506 (lemmaNoDuplicateFromThenFromBigger!0 lt!280503 #b00000000000000000000000000000000 j!136))))

(assert (=> b!612548 (arrayNoDuplicates!0 lt!280503 j!136 Nil!11982)))

(declare-fun lt!280492 () Unit!19684)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37396 (_ BitVec 64) (_ BitVec 32) List!11985) Unit!19684)

(assert (=> b!612548 (= lt!280492 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!280503 (select (arr!17944 a!2986) j!136) j!136 Nil!11982))))

(assert (=> b!612548 false))

(declare-fun b!612549 () Bool)

(declare-fun res!394095 () Bool)

(assert (=> b!612549 (=> (not res!394095) (not e!351107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37396 (_ BitVec 32)) Bool)

(assert (=> b!612549 (= res!394095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!612550 () Bool)

(declare-fun e!351106 () Bool)

(assert (=> b!612550 (= e!351105 e!351106)))

(declare-fun res!394091 () Bool)

(assert (=> b!612550 (=> res!394091 e!351106)))

(assert (=> b!612550 (= res!394091 (or (not (= (select (arr!17944 a!2986) j!136) lt!280496)) (not (= (select (arr!17944 a!2986) j!136) lt!280502))))))

(assert (=> b!612550 e!351100))

(declare-fun res!394096 () Bool)

(assert (=> b!612550 (=> (not res!394096) (not e!351100))))

(assert (=> b!612550 (= res!394096 (= lt!280502 (select (arr!17944 a!2986) j!136)))))

(assert (=> b!612550 (= lt!280502 (select (store (arr!17944 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!612551 () Bool)

(declare-fun Unit!19688 () Unit!19684)

(assert (=> b!612551 (= e!351109 Unit!19688)))

(assert (=> b!612551 false))

(declare-fun b!612552 () Bool)

(assert (=> b!612552 (= e!351107 e!351113)))

(declare-fun res!394102 () Bool)

(assert (=> b!612552 (=> (not res!394102) (not e!351113))))

(assert (=> b!612552 (= res!394102 (= (select (store (arr!17944 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!612552 (= lt!280503 (array!37397 (store (arr!17944 a!2986) i!1108 k0!1786) (size!18308 a!2986)))))

(declare-fun b!612553 () Bool)

(assert (=> b!612553 (= e!351112 (arrayContainsKey!0 lt!280503 (select (arr!17944 a!2986) j!136) index!984))))

(declare-fun b!612554 () Bool)

(assert (=> b!612554 (= e!351102 (= lt!280493 lt!280499))))

(declare-fun b!612555 () Bool)

(declare-fun e!351114 () Bool)

(assert (=> b!612555 (= e!351106 e!351114)))

(declare-fun res!394101 () Bool)

(assert (=> b!612555 (=> res!394101 e!351114)))

(assert (=> b!612555 (= res!394101 (bvsge index!984 j!136))))

(declare-fun lt!280504 () Unit!19684)

(assert (=> b!612555 (= lt!280504 e!351103)))

(declare-fun c!69593 () Bool)

(assert (=> b!612555 (= c!69593 (bvslt j!136 index!984))))

(declare-fun b!612556 () Bool)

(declare-fun res!394089 () Bool)

(assert (=> b!612556 (=> (not res!394089) (not e!351107))))

(assert (=> b!612556 (= res!394089 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17944 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!612557 () Bool)

(declare-fun res!394088 () Bool)

(assert (=> b!612557 (=> (not res!394088) (not e!351111))))

(assert (=> b!612557 (= res!394088 (validKeyInArray!0 (select (arr!17944 a!2986) j!136)))))

(declare-fun b!612558 () Bool)

(declare-fun Unit!19689 () Unit!19684)

(assert (=> b!612558 (= e!351109 Unit!19689)))

(declare-fun b!612559 () Bool)

(assert (=> b!612559 (= e!351114 true)))

(assert (=> b!612559 (arrayNoDuplicates!0 lt!280503 #b00000000000000000000000000000000 Nil!11982)))

(declare-fun lt!280497 () Unit!19684)

(assert (=> b!612559 (= lt!280497 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11982))))

(assert (=> b!612559 (arrayContainsKey!0 lt!280503 (select (arr!17944 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!280501 () Unit!19684)

(assert (=> b!612559 (= lt!280501 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280503 (select (arr!17944 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!612559 e!351110))

(declare-fun res!394092 () Bool)

(assert (=> b!612559 (=> (not res!394092) (not e!351110))))

(assert (=> b!612559 (= res!394092 (arrayContainsKey!0 lt!280503 (select (arr!17944 a!2986) j!136) j!136))))

(declare-fun b!612560 () Bool)

(declare-fun res!394094 () Bool)

(assert (=> b!612560 (=> (not res!394094) (not e!351111))))

(assert (=> b!612560 (= res!394094 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!55926 res!394093) b!612547))

(assert (= (and b!612547 res!394105) b!612557))

(assert (= (and b!612557 res!394088) b!612545))

(assert (= (and b!612545 res!394099) b!612560))

(assert (= (and b!612560 res!394094) b!612546))

(assert (= (and b!612546 res!394098) b!612549))

(assert (= (and b!612549 res!394095) b!612543))

(assert (= (and b!612543 res!394097) b!612556))

(assert (= (and b!612556 res!394089) b!612552))

(assert (= (and b!612552 res!394102) b!612538))

(assert (= (and b!612538 res!394090) b!612539))

(assert (= (and b!612539 res!394103) b!612554))

(assert (= (and b!612539 c!69592) b!612551))

(assert (= (and b!612539 (not c!69592)) b!612558))

(assert (= (and b!612539 (not res!394106)) b!612550))

(assert (= (and b!612550 res!394096) b!612542))

(assert (= (and b!612542 (not res!394100)) b!612544))

(assert (= (and b!612544 res!394104) b!612553))

(assert (= (and b!612550 (not res!394091)) b!612555))

(assert (= (and b!612555 c!69593) b!612548))

(assert (= (and b!612555 (not c!69593)) b!612541))

(assert (= (and b!612555 (not res!394101)) b!612559))

(assert (= (and b!612559 res!394092) b!612540))

(declare-fun m!588879 () Bool)

(assert (=> b!612539 m!588879))

(declare-fun m!588881 () Bool)

(assert (=> b!612539 m!588881))

(declare-fun m!588883 () Bool)

(assert (=> b!612539 m!588883))

(declare-fun m!588885 () Bool)

(assert (=> b!612539 m!588885))

(declare-fun m!588887 () Bool)

(assert (=> b!612539 m!588887))

(declare-fun m!588889 () Bool)

(assert (=> b!612539 m!588889))

(assert (=> b!612539 m!588881))

(declare-fun m!588891 () Bool)

(assert (=> b!612539 m!588891))

(declare-fun m!588893 () Bool)

(assert (=> b!612539 m!588893))

(assert (=> b!612557 m!588881))

(assert (=> b!612557 m!588881))

(declare-fun m!588895 () Bool)

(assert (=> b!612557 m!588895))

(assert (=> b!612544 m!588881))

(assert (=> b!612544 m!588881))

(declare-fun m!588897 () Bool)

(assert (=> b!612544 m!588897))

(declare-fun m!588899 () Bool)

(assert (=> b!612559 m!588899))

(assert (=> b!612559 m!588881))

(assert (=> b!612559 m!588881))

(declare-fun m!588901 () Bool)

(assert (=> b!612559 m!588901))

(assert (=> b!612559 m!588881))

(assert (=> b!612559 m!588897))

(assert (=> b!612559 m!588881))

(declare-fun m!588903 () Bool)

(assert (=> b!612559 m!588903))

(declare-fun m!588905 () Bool)

(assert (=> b!612559 m!588905))

(declare-fun m!588907 () Bool)

(assert (=> b!612543 m!588907))

(assert (=> b!612540 m!588881))

(assert (=> b!612540 m!588881))

(declare-fun m!588909 () Bool)

(assert (=> b!612540 m!588909))

(declare-fun m!588911 () Bool)

(assert (=> b!612538 m!588911))

(assert (=> b!612538 m!588881))

(assert (=> b!612538 m!588881))

(declare-fun m!588913 () Bool)

(assert (=> b!612538 m!588913))

(declare-fun m!588915 () Bool)

(assert (=> b!612556 m!588915))

(declare-fun m!588917 () Bool)

(assert (=> b!612545 m!588917))

(declare-fun m!588919 () Bool)

(assert (=> b!612546 m!588919))

(assert (=> b!612542 m!588881))

(assert (=> b!612552 m!588885))

(declare-fun m!588921 () Bool)

(assert (=> b!612552 m!588921))

(assert (=> b!612553 m!588881))

(assert (=> b!612553 m!588881))

(assert (=> b!612553 m!588909))

(declare-fun m!588923 () Bool)

(assert (=> b!612560 m!588923))

(declare-fun m!588925 () Bool)

(assert (=> start!55926 m!588925))

(declare-fun m!588927 () Bool)

(assert (=> start!55926 m!588927))

(declare-fun m!588929 () Bool)

(assert (=> b!612549 m!588929))

(assert (=> b!612550 m!588881))

(assert (=> b!612550 m!588885))

(declare-fun m!588931 () Bool)

(assert (=> b!612550 m!588931))

(assert (=> b!612548 m!588899))

(assert (=> b!612548 m!588881))

(assert (=> b!612548 m!588881))

(declare-fun m!588933 () Bool)

(assert (=> b!612548 m!588933))

(declare-fun m!588935 () Bool)

(assert (=> b!612548 m!588935))

(assert (=> b!612548 m!588881))

(declare-fun m!588937 () Bool)

(assert (=> b!612548 m!588937))

(assert (=> b!612548 m!588905))

(declare-fun m!588939 () Bool)

(assert (=> b!612548 m!588939))

(assert (=> b!612548 m!588881))

(declare-fun m!588941 () Bool)

(assert (=> b!612548 m!588941))

(check-sat (not b!612553) (not b!612544) (not b!612543) (not b!612546) (not start!55926) (not b!612557) (not b!612549) (not b!612538) (not b!612540) (not b!612560) (not b!612559) (not b!612539) (not b!612545) (not b!612548))
(check-sat)
