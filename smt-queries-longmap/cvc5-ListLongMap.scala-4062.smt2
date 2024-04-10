; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55600 () Bool)

(assert start!55600)

(declare-fun b!609483 () Bool)

(declare-fun e!349071 () Bool)

(declare-fun e!349070 () Bool)

(assert (=> b!609483 (= e!349071 e!349070)))

(declare-fun res!392017 () Bool)

(assert (=> b!609483 (=> res!392017 e!349070)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!278615 () (_ BitVec 64))

(declare-fun lt!278610 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37331 0))(
  ( (array!37332 (arr!17916 (Array (_ BitVec 32) (_ BitVec 64))) (size!18280 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37331)

(assert (=> b!609483 (= res!392017 (or (not (= (select (arr!17916 a!2986) j!136) lt!278610)) (not (= (select (arr!17916 a!2986) j!136) lt!278615)) (bvsge j!136 index!984)))))

(declare-fun b!609484 () Bool)

(declare-fun res!392000 () Bool)

(declare-fun e!349065 () Bool)

(assert (=> b!609484 (=> (not res!392000) (not e!349065))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!609484 (= res!392000 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17916 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!609485 () Bool)

(declare-fun res!392001 () Bool)

(declare-fun e!349064 () Bool)

(assert (=> b!609485 (=> res!392001 e!349064)))

(declare-datatypes ((List!11957 0))(
  ( (Nil!11954) (Cons!11953 (h!12998 (_ BitVec 64)) (t!18185 List!11957)) )
))
(declare-fun contains!3033 (List!11957 (_ BitVec 64)) Bool)

(assert (=> b!609485 (= res!392001 (contains!3033 Nil!11954 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!609487 () Bool)

(declare-datatypes ((Unit!19516 0))(
  ( (Unit!19517) )
))
(declare-fun e!349063 () Unit!19516)

(declare-fun Unit!19518 () Unit!19516)

(assert (=> b!609487 (= e!349063 Unit!19518)))

(declare-fun lt!278617 () array!37331)

(declare-fun lt!278614 () Unit!19516)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37331 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19516)

(assert (=> b!609487 (= lt!278614 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278617 (select (arr!17916 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!609487 (arrayContainsKey!0 lt!278617 (select (arr!17916 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278619 () Unit!19516)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37331 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11957) Unit!19516)

(assert (=> b!609487 (= lt!278619 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11954))))

(declare-fun arrayNoDuplicates!0 (array!37331 (_ BitVec 32) List!11957) Bool)

(assert (=> b!609487 (arrayNoDuplicates!0 lt!278617 #b00000000000000000000000000000000 Nil!11954)))

(declare-fun lt!278622 () Unit!19516)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37331 (_ BitVec 32) (_ BitVec 32)) Unit!19516)

(assert (=> b!609487 (= lt!278622 (lemmaNoDuplicateFromThenFromBigger!0 lt!278617 #b00000000000000000000000000000000 j!136))))

(assert (=> b!609487 (arrayNoDuplicates!0 lt!278617 j!136 Nil!11954)))

(declare-fun lt!278618 () Unit!19516)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37331 (_ BitVec 64) (_ BitVec 32) List!11957) Unit!19516)

(assert (=> b!609487 (= lt!278618 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278617 (select (arr!17916 a!2986) j!136) j!136 Nil!11954))))

(assert (=> b!609487 false))

(declare-fun b!609488 () Bool)

(declare-fun res!392012 () Bool)

(declare-fun e!349072 () Bool)

(assert (=> b!609488 (=> (not res!392012) (not e!349072))))

(assert (=> b!609488 (= res!392012 (and (= (size!18280 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18280 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18280 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!609489 () Bool)

(declare-fun res!392003 () Bool)

(assert (=> b!609489 (=> (not res!392003) (not e!349072))))

(assert (=> b!609489 (= res!392003 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!609490 () Bool)

(declare-fun e!349062 () Bool)

(assert (=> b!609490 (= e!349070 e!349062)))

(declare-fun res!392021 () Bool)

(assert (=> b!609490 (=> (not res!392021) (not e!349062))))

(assert (=> b!609490 (= res!392021 (arrayContainsKey!0 lt!278617 (select (arr!17916 a!2986) j!136) j!136))))

(declare-fun b!609491 () Bool)

(declare-fun e!349068 () Bool)

(assert (=> b!609491 (= e!349068 e!349064)))

(declare-fun res!392016 () Bool)

(assert (=> b!609491 (=> res!392016 e!349064)))

(assert (=> b!609491 (= res!392016 (or (bvsge (size!18280 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18280 a!2986))))))

(assert (=> b!609491 (arrayContainsKey!0 lt!278617 (select (arr!17916 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278626 () Unit!19516)

(assert (=> b!609491 (= lt!278626 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278617 (select (arr!17916 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!349074 () Bool)

(assert (=> b!609491 e!349074))

(declare-fun res!392019 () Bool)

(assert (=> b!609491 (=> (not res!392019) (not e!349074))))

(assert (=> b!609491 (= res!392019 (arrayContainsKey!0 lt!278617 (select (arr!17916 a!2986) j!136) j!136))))

(declare-fun b!609492 () Bool)

(declare-fun res!392009 () Bool)

(assert (=> b!609492 (=> res!392009 e!349064)))

(declare-fun noDuplicate!339 (List!11957) Bool)

(assert (=> b!609492 (= res!392009 (not (noDuplicate!339 Nil!11954)))))

(declare-fun b!609493 () Bool)

(declare-fun e!349069 () Bool)

(assert (=> b!609493 (= e!349069 e!349068)))

(declare-fun res!392011 () Bool)

(assert (=> b!609493 (=> res!392011 e!349068)))

(assert (=> b!609493 (= res!392011 (bvsge index!984 j!136))))

(declare-fun lt!278624 () Unit!19516)

(assert (=> b!609493 (= lt!278624 e!349063)))

(declare-fun c!69110 () Bool)

(assert (=> b!609493 (= c!69110 (bvslt j!136 index!984))))

(declare-fun b!609494 () Bool)

(declare-fun e!349066 () Bool)

(assert (=> b!609494 (= e!349066 e!349069)))

(declare-fun res!391999 () Bool)

(assert (=> b!609494 (=> res!391999 e!349069)))

(assert (=> b!609494 (= res!391999 (or (not (= (select (arr!17916 a!2986) j!136) lt!278610)) (not (= (select (arr!17916 a!2986) j!136) lt!278615))))))

(assert (=> b!609494 e!349071))

(declare-fun res!392005 () Bool)

(assert (=> b!609494 (=> (not res!392005) (not e!349071))))

(assert (=> b!609494 (= res!392005 (= lt!278615 (select (arr!17916 a!2986) j!136)))))

(assert (=> b!609494 (= lt!278615 (select (store (arr!17916 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!609495 () Bool)

(declare-fun e!349075 () Bool)

(declare-fun e!349067 () Bool)

(assert (=> b!609495 (= e!349075 e!349067)))

(declare-fun res!392007 () Bool)

(assert (=> b!609495 (=> (not res!392007) (not e!349067))))

(declare-datatypes ((SeekEntryResult!6356 0))(
  ( (MissingZero!6356 (index!27699 (_ BitVec 32))) (Found!6356 (index!27700 (_ BitVec 32))) (Intermediate!6356 (undefined!7168 Bool) (index!27701 (_ BitVec 32)) (x!56505 (_ BitVec 32))) (Undefined!6356) (MissingVacant!6356 (index!27702 (_ BitVec 32))) )
))
(declare-fun lt!278611 () SeekEntryResult!6356)

(assert (=> b!609495 (= res!392007 (and (= lt!278611 (Found!6356 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17916 a!2986) index!984) (select (arr!17916 a!2986) j!136))) (not (= (select (arr!17916 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37331 (_ BitVec 32)) SeekEntryResult!6356)

(assert (=> b!609495 (= lt!278611 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17916 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!392020 () Bool)

(assert (=> start!55600 (=> (not res!392020) (not e!349072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55600 (= res!392020 (validMask!0 mask!3053))))

(assert (=> start!55600 e!349072))

(assert (=> start!55600 true))

(declare-fun array_inv!13712 (array!37331) Bool)

(assert (=> start!55600 (array_inv!13712 a!2986)))

(declare-fun b!609486 () Bool)

(declare-fun res!392008 () Bool)

(assert (=> b!609486 (=> (not res!392008) (not e!349065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37331 (_ BitVec 32)) Bool)

(assert (=> b!609486 (= res!392008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!609496 () Bool)

(declare-fun res!392015 () Bool)

(assert (=> b!609496 (=> res!392015 e!349064)))

(assert (=> b!609496 (= res!392015 (contains!3033 Nil!11954 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!609497 () Bool)

(declare-fun Unit!19519 () Unit!19516)

(assert (=> b!609497 (= e!349063 Unit!19519)))

(declare-fun b!609498 () Bool)

(assert (=> b!609498 (= e!349072 e!349065)))

(declare-fun res!392004 () Bool)

(assert (=> b!609498 (=> (not res!392004) (not e!349065))))

(declare-fun lt!278623 () SeekEntryResult!6356)

(assert (=> b!609498 (= res!392004 (or (= lt!278623 (MissingZero!6356 i!1108)) (= lt!278623 (MissingVacant!6356 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37331 (_ BitVec 32)) SeekEntryResult!6356)

(assert (=> b!609498 (= lt!278623 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!609499 () Bool)

(assert (=> b!609499 (= e!349062 (arrayContainsKey!0 lt!278617 (select (arr!17916 a!2986) j!136) index!984))))

(declare-fun b!609500 () Bool)

(assert (=> b!609500 (= e!349074 (arrayContainsKey!0 lt!278617 (select (arr!17916 a!2986) j!136) index!984))))

(declare-fun b!609501 () Bool)

(declare-fun e!349077 () Unit!19516)

(declare-fun Unit!19520 () Unit!19516)

(assert (=> b!609501 (= e!349077 Unit!19520)))

(declare-fun b!609502 () Bool)

(declare-fun e!349073 () Bool)

(declare-fun lt!278625 () SeekEntryResult!6356)

(assert (=> b!609502 (= e!349073 (= lt!278611 lt!278625))))

(declare-fun b!609503 () Bool)

(assert (=> b!609503 (= e!349064 true)))

(declare-fun lt!278621 () Bool)

(assert (=> b!609503 (= lt!278621 (contains!3033 Nil!11954 k!1786))))

(declare-fun b!609504 () Bool)

(declare-fun res!392013 () Bool)

(assert (=> b!609504 (=> (not res!392013) (not e!349065))))

(assert (=> b!609504 (= res!392013 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11954))))

(declare-fun b!609505 () Bool)

(declare-fun Unit!19521 () Unit!19516)

(assert (=> b!609505 (= e!349077 Unit!19521)))

(assert (=> b!609505 false))

(declare-fun b!609506 () Bool)

(declare-fun res!392014 () Bool)

(assert (=> b!609506 (=> (not res!392014) (not e!349072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!609506 (= res!392014 (validKeyInArray!0 (select (arr!17916 a!2986) j!136)))))

(declare-fun b!609507 () Bool)

(assert (=> b!609507 (= e!349067 (not e!349066))))

(declare-fun res!392018 () Bool)

(assert (=> b!609507 (=> res!392018 e!349066)))

(declare-fun lt!278612 () SeekEntryResult!6356)

(assert (=> b!609507 (= res!392018 (not (= lt!278612 (Found!6356 index!984))))))

(declare-fun lt!278616 () Unit!19516)

(assert (=> b!609507 (= lt!278616 e!349077)))

(declare-fun c!69109 () Bool)

(assert (=> b!609507 (= c!69109 (= lt!278612 Undefined!6356))))

(assert (=> b!609507 (= lt!278612 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278610 lt!278617 mask!3053))))

(assert (=> b!609507 e!349073))

(declare-fun res!392010 () Bool)

(assert (=> b!609507 (=> (not res!392010) (not e!349073))))

(declare-fun lt!278620 () (_ BitVec 32))

(assert (=> b!609507 (= res!392010 (= lt!278625 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278620 vacantSpotIndex!68 lt!278610 lt!278617 mask!3053)))))

(assert (=> b!609507 (= lt!278625 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278620 vacantSpotIndex!68 (select (arr!17916 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!609507 (= lt!278610 (select (store (arr!17916 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!278613 () Unit!19516)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37331 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19516)

(assert (=> b!609507 (= lt!278613 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278620 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!609507 (= lt!278620 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!609508 () Bool)

(assert (=> b!609508 (= e!349065 e!349075)))

(declare-fun res!392002 () Bool)

(assert (=> b!609508 (=> (not res!392002) (not e!349075))))

(assert (=> b!609508 (= res!392002 (= (select (store (arr!17916 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!609508 (= lt!278617 (array!37332 (store (arr!17916 a!2986) i!1108 k!1786) (size!18280 a!2986)))))

(declare-fun b!609509 () Bool)

(declare-fun res!392006 () Bool)

(assert (=> b!609509 (=> (not res!392006) (not e!349072))))

(assert (=> b!609509 (= res!392006 (validKeyInArray!0 k!1786))))

(assert (= (and start!55600 res!392020) b!609488))

(assert (= (and b!609488 res!392012) b!609506))

(assert (= (and b!609506 res!392014) b!609509))

(assert (= (and b!609509 res!392006) b!609489))

(assert (= (and b!609489 res!392003) b!609498))

(assert (= (and b!609498 res!392004) b!609486))

(assert (= (and b!609486 res!392008) b!609504))

(assert (= (and b!609504 res!392013) b!609484))

(assert (= (and b!609484 res!392000) b!609508))

(assert (= (and b!609508 res!392002) b!609495))

(assert (= (and b!609495 res!392007) b!609507))

(assert (= (and b!609507 res!392010) b!609502))

(assert (= (and b!609507 c!69109) b!609505))

(assert (= (and b!609507 (not c!69109)) b!609501))

(assert (= (and b!609507 (not res!392018)) b!609494))

(assert (= (and b!609494 res!392005) b!609483))

(assert (= (and b!609483 (not res!392017)) b!609490))

(assert (= (and b!609490 res!392021) b!609499))

(assert (= (and b!609494 (not res!391999)) b!609493))

(assert (= (and b!609493 c!69110) b!609487))

(assert (= (and b!609493 (not c!69110)) b!609497))

(assert (= (and b!609493 (not res!392011)) b!609491))

(assert (= (and b!609491 res!392019) b!609500))

(assert (= (and b!609491 (not res!392016)) b!609492))

(assert (= (and b!609492 (not res!392009)) b!609485))

(assert (= (and b!609485 (not res!392001)) b!609496))

(assert (= (and b!609496 (not res!392015)) b!609503))

(declare-fun m!585995 () Bool)

(assert (=> b!609506 m!585995))

(assert (=> b!609506 m!585995))

(declare-fun m!585997 () Bool)

(assert (=> b!609506 m!585997))

(declare-fun m!585999 () Bool)

(assert (=> b!609484 m!585999))

(declare-fun m!586001 () Bool)

(assert (=> b!609507 m!586001))

(declare-fun m!586003 () Bool)

(assert (=> b!609507 m!586003))

(assert (=> b!609507 m!585995))

(declare-fun m!586005 () Bool)

(assert (=> b!609507 m!586005))

(assert (=> b!609507 m!585995))

(declare-fun m!586007 () Bool)

(assert (=> b!609507 m!586007))

(declare-fun m!586009 () Bool)

(assert (=> b!609507 m!586009))

(declare-fun m!586011 () Bool)

(assert (=> b!609507 m!586011))

(declare-fun m!586013 () Bool)

(assert (=> b!609507 m!586013))

(declare-fun m!586015 () Bool)

(assert (=> b!609492 m!586015))

(assert (=> b!609491 m!585995))

(assert (=> b!609491 m!585995))

(declare-fun m!586017 () Bool)

(assert (=> b!609491 m!586017))

(assert (=> b!609491 m!585995))

(declare-fun m!586019 () Bool)

(assert (=> b!609491 m!586019))

(assert (=> b!609491 m!585995))

(declare-fun m!586021 () Bool)

(assert (=> b!609491 m!586021))

(declare-fun m!586023 () Bool)

(assert (=> b!609504 m!586023))

(assert (=> b!609483 m!585995))

(declare-fun m!586025 () Bool)

(assert (=> b!609503 m!586025))

(assert (=> b!609499 m!585995))

(assert (=> b!609499 m!585995))

(declare-fun m!586027 () Bool)

(assert (=> b!609499 m!586027))

(declare-fun m!586029 () Bool)

(assert (=> b!609489 m!586029))

(assert (=> b!609487 m!585995))

(declare-fun m!586031 () Bool)

(assert (=> b!609487 m!586031))

(declare-fun m!586033 () Bool)

(assert (=> b!609487 m!586033))

(assert (=> b!609487 m!585995))

(assert (=> b!609487 m!585995))

(declare-fun m!586035 () Bool)

(assert (=> b!609487 m!586035))

(declare-fun m!586037 () Bool)

(assert (=> b!609487 m!586037))

(assert (=> b!609487 m!585995))

(declare-fun m!586039 () Bool)

(assert (=> b!609487 m!586039))

(declare-fun m!586041 () Bool)

(assert (=> b!609487 m!586041))

(declare-fun m!586043 () Bool)

(assert (=> b!609487 m!586043))

(assert (=> b!609494 m!585995))

(assert (=> b!609494 m!586005))

(declare-fun m!586045 () Bool)

(assert (=> b!609494 m!586045))

(declare-fun m!586047 () Bool)

(assert (=> start!55600 m!586047))

(declare-fun m!586049 () Bool)

(assert (=> start!55600 m!586049))

(declare-fun m!586051 () Bool)

(assert (=> b!609509 m!586051))

(declare-fun m!586053 () Bool)

(assert (=> b!609496 m!586053))

(assert (=> b!609500 m!585995))

(assert (=> b!609500 m!585995))

(assert (=> b!609500 m!586027))

(assert (=> b!609508 m!586005))

(declare-fun m!586055 () Bool)

(assert (=> b!609508 m!586055))

(assert (=> b!609490 m!585995))

(assert (=> b!609490 m!585995))

(assert (=> b!609490 m!586021))

(declare-fun m!586057 () Bool)

(assert (=> b!609498 m!586057))

(declare-fun m!586059 () Bool)

(assert (=> b!609486 m!586059))

(declare-fun m!586061 () Bool)

(assert (=> b!609485 m!586061))

(declare-fun m!586063 () Bool)

(assert (=> b!609495 m!586063))

(assert (=> b!609495 m!585995))

(assert (=> b!609495 m!585995))

(declare-fun m!586065 () Bool)

(assert (=> b!609495 m!586065))

(push 1)

