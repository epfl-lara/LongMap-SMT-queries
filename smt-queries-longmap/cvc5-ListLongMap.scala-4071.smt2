; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55924 () Bool)

(assert start!55924)

(declare-fun b!612469 () Bool)

(declare-fun e!351062 () Bool)

(declare-fun e!351068 () Bool)

(assert (=> b!612469 (= e!351062 e!351068)))

(declare-fun res!394038 () Bool)

(assert (=> b!612469 (=> res!394038 e!351068)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!280454 () (_ BitVec 64))

(declare-fun lt!280452 () (_ BitVec 64))

(declare-datatypes ((array!37394 0))(
  ( (array!37395 (arr!17943 (Array (_ BitVec 32) (_ BitVec 64))) (size!18307 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37394)

(assert (=> b!612469 (= res!394038 (or (not (= (select (arr!17943 a!2986) j!136) lt!280452)) (not (= (select (arr!17943 a!2986) j!136) lt!280454))))))

(declare-fun e!351060 () Bool)

(assert (=> b!612469 e!351060))

(declare-fun res!394032 () Bool)

(assert (=> b!612469 (=> (not res!394032) (not e!351060))))

(assert (=> b!612469 (= res!394032 (= lt!280454 (select (arr!17943 a!2986) j!136)))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!612469 (= lt!280454 (select (store (arr!17943 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!612470 () Bool)

(declare-fun e!351061 () Bool)

(assert (=> b!612470 (= e!351061 (not e!351062))))

(declare-fun res!394043 () Bool)

(assert (=> b!612470 (=> res!394043 e!351062)))

(declare-datatypes ((SeekEntryResult!6383 0))(
  ( (MissingZero!6383 (index!27816 (_ BitVec 32))) (Found!6383 (index!27817 (_ BitVec 32))) (Intermediate!6383 (undefined!7195 Bool) (index!27818 (_ BitVec 32)) (x!56631 (_ BitVec 32))) (Undefined!6383) (MissingVacant!6383 (index!27819 (_ BitVec 32))) )
))
(declare-fun lt!280448 () SeekEntryResult!6383)

(assert (=> b!612470 (= res!394043 (not (= lt!280448 (Found!6383 index!984))))))

(declare-datatypes ((Unit!19678 0))(
  ( (Unit!19679) )
))
(declare-fun lt!280441 () Unit!19678)

(declare-fun e!351065 () Unit!19678)

(assert (=> b!612470 (= lt!280441 e!351065)))

(declare-fun c!69586 () Bool)

(assert (=> b!612470 (= c!69586 (= lt!280448 Undefined!6383))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!280456 () array!37394)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37394 (_ BitVec 32)) SeekEntryResult!6383)

(assert (=> b!612470 (= lt!280448 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!280452 lt!280456 mask!3053))))

(declare-fun e!351067 () Bool)

(assert (=> b!612470 e!351067))

(declare-fun res!394040 () Bool)

(assert (=> b!612470 (=> (not res!394040) (not e!351067))))

(declare-fun lt!280455 () SeekEntryResult!6383)

(declare-fun lt!280442 () (_ BitVec 32))

(assert (=> b!612470 (= res!394040 (= lt!280455 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280442 vacantSpotIndex!68 lt!280452 lt!280456 mask!3053)))))

(assert (=> b!612470 (= lt!280455 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280442 vacantSpotIndex!68 (select (arr!17943 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!612470 (= lt!280452 (select (store (arr!17943 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!280449 () Unit!19678)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37394 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19678)

(assert (=> b!612470 (= lt!280449 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!280442 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!612470 (= lt!280442 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!612471 () Bool)

(declare-fun res!394034 () Bool)

(declare-fun e!351056 () Bool)

(assert (=> b!612471 (=> (not res!394034) (not e!351056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!612471 (= res!394034 (validKeyInArray!0 k!1786))))

(declare-fun b!612473 () Bool)

(declare-fun res!394048 () Bool)

(declare-fun e!351058 () Bool)

(assert (=> b!612473 (=> (not res!394048) (not e!351058))))

(assert (=> b!612473 (= res!394048 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17943 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!612474 () Bool)

(declare-fun Unit!19680 () Unit!19678)

(assert (=> b!612474 (= e!351065 Unit!19680)))

(declare-fun b!612475 () Bool)

(declare-fun e!351057 () Bool)

(assert (=> b!612475 (= e!351068 e!351057)))

(declare-fun res!394045 () Bool)

(assert (=> b!612475 (=> res!394045 e!351057)))

(assert (=> b!612475 (= res!394045 (bvsge index!984 j!136))))

(declare-fun lt!280440 () Unit!19678)

(declare-fun e!351063 () Unit!19678)

(assert (=> b!612475 (= lt!280440 e!351063)))

(declare-fun c!69587 () Bool)

(assert (=> b!612475 (= c!69587 (bvslt j!136 index!984))))

(declare-fun b!612476 () Bool)

(declare-fun Unit!19681 () Unit!19678)

(assert (=> b!612476 (= e!351063 Unit!19681)))

(declare-fun b!612477 () Bool)

(declare-fun res!394049 () Bool)

(assert (=> b!612477 (=> (not res!394049) (not e!351058))))

(declare-datatypes ((List!11984 0))(
  ( (Nil!11981) (Cons!11980 (h!13025 (_ BitVec 64)) (t!18212 List!11984)) )
))
(declare-fun arrayNoDuplicates!0 (array!37394 (_ BitVec 32) List!11984) Bool)

(assert (=> b!612477 (= res!394049 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11981))))

(declare-fun b!612478 () Bool)

(declare-fun e!351064 () Bool)

(declare-fun e!351055 () Bool)

(assert (=> b!612478 (= e!351064 e!351055)))

(declare-fun res!394041 () Bool)

(assert (=> b!612478 (=> (not res!394041) (not e!351055))))

(declare-fun arrayContainsKey!0 (array!37394 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!612478 (= res!394041 (arrayContainsKey!0 lt!280456 (select (arr!17943 a!2986) j!136) j!136))))

(declare-fun b!612479 () Bool)

(declare-fun res!394037 () Bool)

(assert (=> b!612479 (=> (not res!394037) (not e!351056))))

(assert (=> b!612479 (= res!394037 (and (= (size!18307 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18307 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18307 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!612480 () Bool)

(assert (=> b!612480 (= e!351060 e!351064)))

(declare-fun res!394039 () Bool)

(assert (=> b!612480 (=> res!394039 e!351064)))

(assert (=> b!612480 (= res!394039 (or (not (= (select (arr!17943 a!2986) j!136) lt!280452)) (not (= (select (arr!17943 a!2986) j!136) lt!280454)) (bvsge j!136 index!984)))))

(declare-fun b!612481 () Bool)

(assert (=> b!612481 (= e!351057 true)))

(assert (=> b!612481 (arrayNoDuplicates!0 lt!280456 #b00000000000000000000000000000000 Nil!11981)))

(declare-fun lt!280443 () Unit!19678)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37394 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11984) Unit!19678)

(assert (=> b!612481 (= lt!280443 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11981))))

(assert (=> b!612481 (arrayContainsKey!0 lt!280456 (select (arr!17943 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!280450 () Unit!19678)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37394 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19678)

(assert (=> b!612481 (= lt!280450 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280456 (select (arr!17943 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!351059 () Bool)

(assert (=> b!612481 e!351059))

(declare-fun res!394046 () Bool)

(assert (=> b!612481 (=> (not res!394046) (not e!351059))))

(assert (=> b!612481 (= res!394046 (arrayContainsKey!0 lt!280456 (select (arr!17943 a!2986) j!136) j!136))))

(declare-fun b!612482 () Bool)

(declare-fun lt!280444 () SeekEntryResult!6383)

(assert (=> b!612482 (= e!351067 (= lt!280444 lt!280455))))

(declare-fun b!612483 () Bool)

(assert (=> b!612483 (= e!351059 (arrayContainsKey!0 lt!280456 (select (arr!17943 a!2986) j!136) index!984))))

(declare-fun b!612484 () Bool)

(assert (=> b!612484 (= e!351056 e!351058)))

(declare-fun res!394042 () Bool)

(assert (=> b!612484 (=> (not res!394042) (not e!351058))))

(declare-fun lt!280445 () SeekEntryResult!6383)

(assert (=> b!612484 (= res!394042 (or (= lt!280445 (MissingZero!6383 i!1108)) (= lt!280445 (MissingVacant!6383 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37394 (_ BitVec 32)) SeekEntryResult!6383)

(assert (=> b!612484 (= lt!280445 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!612485 () Bool)

(assert (=> b!612485 (= e!351055 (arrayContainsKey!0 lt!280456 (select (arr!17943 a!2986) j!136) index!984))))

(declare-fun res!394033 () Bool)

(assert (=> start!55924 (=> (not res!394033) (not e!351056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55924 (= res!394033 (validMask!0 mask!3053))))

(assert (=> start!55924 e!351056))

(assert (=> start!55924 true))

(declare-fun array_inv!13739 (array!37394) Bool)

(assert (=> start!55924 (array_inv!13739 a!2986)))

(declare-fun b!612472 () Bool)

(declare-fun Unit!19682 () Unit!19678)

(assert (=> b!612472 (= e!351065 Unit!19682)))

(assert (=> b!612472 false))

(declare-fun b!612486 () Bool)

(declare-fun res!394044 () Bool)

(assert (=> b!612486 (=> (not res!394044) (not e!351056))))

(assert (=> b!612486 (= res!394044 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!612487 () Bool)

(declare-fun Unit!19683 () Unit!19678)

(assert (=> b!612487 (= e!351063 Unit!19683)))

(declare-fun lt!280453 () Unit!19678)

(assert (=> b!612487 (= lt!280453 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280456 (select (arr!17943 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!612487 (arrayContainsKey!0 lt!280456 (select (arr!17943 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!280447 () Unit!19678)

(assert (=> b!612487 (= lt!280447 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11981))))

(assert (=> b!612487 (arrayNoDuplicates!0 lt!280456 #b00000000000000000000000000000000 Nil!11981)))

(declare-fun lt!280446 () Unit!19678)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37394 (_ BitVec 32) (_ BitVec 32)) Unit!19678)

(assert (=> b!612487 (= lt!280446 (lemmaNoDuplicateFromThenFromBigger!0 lt!280456 #b00000000000000000000000000000000 j!136))))

(assert (=> b!612487 (arrayNoDuplicates!0 lt!280456 j!136 Nil!11981)))

(declare-fun lt!280451 () Unit!19678)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37394 (_ BitVec 64) (_ BitVec 32) List!11984) Unit!19678)

(assert (=> b!612487 (= lt!280451 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!280456 (select (arr!17943 a!2986) j!136) j!136 Nil!11981))))

(assert (=> b!612487 false))

(declare-fun b!612488 () Bool)

(declare-fun e!351069 () Bool)

(assert (=> b!612488 (= e!351069 e!351061)))

(declare-fun res!394036 () Bool)

(assert (=> b!612488 (=> (not res!394036) (not e!351061))))

(assert (=> b!612488 (= res!394036 (and (= lt!280444 (Found!6383 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17943 a!2986) index!984) (select (arr!17943 a!2986) j!136))) (not (= (select (arr!17943 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!612488 (= lt!280444 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17943 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!612489 () Bool)

(declare-fun res!394031 () Bool)

(assert (=> b!612489 (=> (not res!394031) (not e!351058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37394 (_ BitVec 32)) Bool)

(assert (=> b!612489 (= res!394031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!612490 () Bool)

(assert (=> b!612490 (= e!351058 e!351069)))

(declare-fun res!394035 () Bool)

(assert (=> b!612490 (=> (not res!394035) (not e!351069))))

(assert (=> b!612490 (= res!394035 (= (select (store (arr!17943 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!612490 (= lt!280456 (array!37395 (store (arr!17943 a!2986) i!1108 k!1786) (size!18307 a!2986)))))

(declare-fun b!612491 () Bool)

(declare-fun res!394047 () Bool)

(assert (=> b!612491 (=> (not res!394047) (not e!351056))))

(assert (=> b!612491 (= res!394047 (validKeyInArray!0 (select (arr!17943 a!2986) j!136)))))

(assert (= (and start!55924 res!394033) b!612479))

(assert (= (and b!612479 res!394037) b!612491))

(assert (= (and b!612491 res!394047) b!612471))

(assert (= (and b!612471 res!394034) b!612486))

(assert (= (and b!612486 res!394044) b!612484))

(assert (= (and b!612484 res!394042) b!612489))

(assert (= (and b!612489 res!394031) b!612477))

(assert (= (and b!612477 res!394049) b!612473))

(assert (= (and b!612473 res!394048) b!612490))

(assert (= (and b!612490 res!394035) b!612488))

(assert (= (and b!612488 res!394036) b!612470))

(assert (= (and b!612470 res!394040) b!612482))

(assert (= (and b!612470 c!69586) b!612472))

(assert (= (and b!612470 (not c!69586)) b!612474))

(assert (= (and b!612470 (not res!394043)) b!612469))

(assert (= (and b!612469 res!394032) b!612480))

(assert (= (and b!612480 (not res!394039)) b!612478))

(assert (= (and b!612478 res!394041) b!612485))

(assert (= (and b!612469 (not res!394038)) b!612475))

(assert (= (and b!612475 c!69587) b!612487))

(assert (= (and b!612475 (not c!69587)) b!612476))

(assert (= (and b!612475 (not res!394045)) b!612481))

(assert (= (and b!612481 res!394046) b!612483))

(declare-fun m!588815 () Bool)

(assert (=> b!612489 m!588815))

(declare-fun m!588817 () Bool)

(assert (=> b!612484 m!588817))

(declare-fun m!588819 () Bool)

(assert (=> b!612470 m!588819))

(declare-fun m!588821 () Bool)

(assert (=> b!612470 m!588821))

(declare-fun m!588823 () Bool)

(assert (=> b!612470 m!588823))

(declare-fun m!588825 () Bool)

(assert (=> b!612470 m!588825))

(declare-fun m!588827 () Bool)

(assert (=> b!612470 m!588827))

(declare-fun m!588829 () Bool)

(assert (=> b!612470 m!588829))

(declare-fun m!588831 () Bool)

(assert (=> b!612470 m!588831))

(assert (=> b!612470 m!588823))

(declare-fun m!588833 () Bool)

(assert (=> b!612470 m!588833))

(assert (=> b!612480 m!588823))

(assert (=> b!612490 m!588825))

(declare-fun m!588835 () Bool)

(assert (=> b!612490 m!588835))

(declare-fun m!588837 () Bool)

(assert (=> b!612471 m!588837))

(assert (=> b!612491 m!588823))

(assert (=> b!612491 m!588823))

(declare-fun m!588839 () Bool)

(assert (=> b!612491 m!588839))

(declare-fun m!588841 () Bool)

(assert (=> b!612488 m!588841))

(assert (=> b!612488 m!588823))

(assert (=> b!612488 m!588823))

(declare-fun m!588843 () Bool)

(assert (=> b!612488 m!588843))

(declare-fun m!588845 () Bool)

(assert (=> b!612473 m!588845))

(assert (=> b!612483 m!588823))

(assert (=> b!612483 m!588823))

(declare-fun m!588847 () Bool)

(assert (=> b!612483 m!588847))

(declare-fun m!588849 () Bool)

(assert (=> b!612477 m!588849))

(assert (=> b!612487 m!588823))

(assert (=> b!612487 m!588823))

(declare-fun m!588851 () Bool)

(assert (=> b!612487 m!588851))

(assert (=> b!612487 m!588823))

(declare-fun m!588853 () Bool)

(assert (=> b!612487 m!588853))

(assert (=> b!612487 m!588823))

(declare-fun m!588855 () Bool)

(assert (=> b!612487 m!588855))

(declare-fun m!588857 () Bool)

(assert (=> b!612487 m!588857))

(declare-fun m!588859 () Bool)

(assert (=> b!612487 m!588859))

(declare-fun m!588861 () Bool)

(assert (=> b!612487 m!588861))

(declare-fun m!588863 () Bool)

(assert (=> b!612487 m!588863))

(declare-fun m!588865 () Bool)

(assert (=> start!55924 m!588865))

(declare-fun m!588867 () Bool)

(assert (=> start!55924 m!588867))

(assert (=> b!612481 m!588823))

(assert (=> b!612481 m!588823))

(declare-fun m!588869 () Bool)

(assert (=> b!612481 m!588869))

(assert (=> b!612481 m!588823))

(declare-fun m!588871 () Bool)

(assert (=> b!612481 m!588871))

(assert (=> b!612481 m!588823))

(declare-fun m!588873 () Bool)

(assert (=> b!612481 m!588873))

(assert (=> b!612481 m!588857))

(assert (=> b!612481 m!588859))

(assert (=> b!612485 m!588823))

(assert (=> b!612485 m!588823))

(assert (=> b!612485 m!588847))

(declare-fun m!588875 () Bool)

(assert (=> b!612486 m!588875))

(assert (=> b!612469 m!588823))

(assert (=> b!612469 m!588825))

(declare-fun m!588877 () Bool)

(assert (=> b!612469 m!588877))

(assert (=> b!612478 m!588823))

(assert (=> b!612478 m!588823))

(assert (=> b!612478 m!588871))

(push 1)

