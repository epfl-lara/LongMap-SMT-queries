; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59606 () Bool)

(assert start!59606)

(declare-fun b!659091 () Bool)

(declare-fun e!378639 () Bool)

(declare-datatypes ((SeekEntryResult!7019 0))(
  ( (MissingZero!7019 (index!30441 (_ BitVec 32))) (Found!7019 (index!30442 (_ BitVec 32))) (Intermediate!7019 (undefined!7831 Bool) (index!30443 (_ BitVec 32)) (x!59230 (_ BitVec 32))) (Undefined!7019) (MissingVacant!7019 (index!30444 (_ BitVec 32))) )
))
(declare-fun lt!308421 () SeekEntryResult!7019)

(declare-fun lt!308422 () SeekEntryResult!7019)

(assert (=> b!659091 (= e!378639 (= lt!308421 lt!308422))))

(declare-fun b!659092 () Bool)

(declare-fun res!427438 () Bool)

(declare-fun e!378648 () Bool)

(assert (=> b!659092 (=> (not res!427438) (not e!378648))))

(declare-datatypes ((array!38764 0))(
  ( (array!38765 (arr!18579 (Array (_ BitVec 32) (_ BitVec 64))) (size!18943 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38764)

(declare-datatypes ((List!12620 0))(
  ( (Nil!12617) (Cons!12616 (h!13661 (_ BitVec 64)) (t!18848 List!12620)) )
))
(declare-fun arrayNoDuplicates!0 (array!38764 (_ BitVec 32) List!12620) Bool)

(assert (=> b!659092 (= res!427438 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12617))))

(declare-fun b!659093 () Bool)

(assert (=> b!659093 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!308412 () array!38764)

(declare-datatypes ((Unit!22944 0))(
  ( (Unit!22945) )
))
(declare-fun lt!308409 () Unit!22944)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38764 (_ BitVec 64) (_ BitVec 32) List!12620) Unit!22944)

(assert (=> b!659093 (= lt!308409 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308412 (select (arr!18579 a!2986) j!136) index!984 Nil!12617))))

(assert (=> b!659093 (arrayNoDuplicates!0 lt!308412 index!984 Nil!12617)))

(declare-fun lt!308418 () Unit!22944)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38764 (_ BitVec 32) (_ BitVec 32)) Unit!22944)

(assert (=> b!659093 (= lt!308418 (lemmaNoDuplicateFromThenFromBigger!0 lt!308412 #b00000000000000000000000000000000 index!984))))

(assert (=> b!659093 (arrayNoDuplicates!0 lt!308412 #b00000000000000000000000000000000 Nil!12617)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!308425 () Unit!22944)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38764 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12620) Unit!22944)

(assert (=> b!659093 (= lt!308425 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12617))))

(declare-fun arrayContainsKey!0 (array!38764 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!659093 (arrayContainsKey!0 lt!308412 (select (arr!18579 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!308419 () Unit!22944)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38764 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22944)

(assert (=> b!659093 (= lt!308419 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308412 (select (arr!18579 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!378636 () Bool)

(assert (=> b!659093 e!378636))

(declare-fun res!427437 () Bool)

(assert (=> b!659093 (=> (not res!427437) (not e!378636))))

(assert (=> b!659093 (= res!427437 (arrayContainsKey!0 lt!308412 (select (arr!18579 a!2986) j!136) j!136))))

(declare-fun e!378645 () Unit!22944)

(declare-fun Unit!22946 () Unit!22944)

(assert (=> b!659093 (= e!378645 Unit!22946)))

(declare-fun b!659094 () Bool)

(assert (=> b!659094 false))

(declare-fun lt!308426 () Unit!22944)

(assert (=> b!659094 (= lt!308426 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308412 (select (arr!18579 a!2986) j!136) j!136 Nil!12617))))

(assert (=> b!659094 (arrayNoDuplicates!0 lt!308412 j!136 Nil!12617)))

(declare-fun lt!308424 () Unit!22944)

(assert (=> b!659094 (= lt!308424 (lemmaNoDuplicateFromThenFromBigger!0 lt!308412 #b00000000000000000000000000000000 j!136))))

(assert (=> b!659094 (arrayNoDuplicates!0 lt!308412 #b00000000000000000000000000000000 Nil!12617)))

(declare-fun lt!308427 () Unit!22944)

(assert (=> b!659094 (= lt!308427 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12617))))

(assert (=> b!659094 (arrayContainsKey!0 lt!308412 (select (arr!18579 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!308423 () Unit!22944)

(assert (=> b!659094 (= lt!308423 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308412 (select (arr!18579 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!378646 () Unit!22944)

(declare-fun Unit!22947 () Unit!22944)

(assert (=> b!659094 (= e!378646 Unit!22947)))

(declare-fun b!659095 () Bool)

(declare-fun e!378647 () Unit!22944)

(declare-fun Unit!22948 () Unit!22944)

(assert (=> b!659095 (= e!378647 Unit!22948)))

(declare-fun res!427429 () Bool)

(declare-fun e!378638 () Bool)

(assert (=> start!59606 (=> (not res!427429) (not e!378638))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59606 (= res!427429 (validMask!0 mask!3053))))

(assert (=> start!59606 e!378638))

(assert (=> start!59606 true))

(declare-fun array_inv!14375 (array!38764) Bool)

(assert (=> start!59606 (array_inv!14375 a!2986)))

(declare-fun b!659096 () Bool)

(declare-fun e!378641 () Bool)

(assert (=> b!659096 (= e!378648 e!378641)))

(declare-fun res!427440 () Bool)

(assert (=> b!659096 (=> (not res!427440) (not e!378641))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!659096 (= res!427440 (= (select (store (arr!18579 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!659096 (= lt!308412 (array!38765 (store (arr!18579 a!2986) i!1108 k!1786) (size!18943 a!2986)))))

(declare-fun b!659097 () Bool)

(declare-fun res!427433 () Bool)

(assert (=> b!659097 (= res!427433 (arrayContainsKey!0 lt!308412 (select (arr!18579 a!2986) j!136) j!136))))

(declare-fun e!378644 () Bool)

(assert (=> b!659097 (=> (not res!427433) (not e!378644))))

(declare-fun e!378642 () Bool)

(assert (=> b!659097 (= e!378642 e!378644)))

(declare-fun b!659098 () Bool)

(declare-fun res!427441 () Bool)

(assert (=> b!659098 (=> (not res!427441) (not e!378638))))

(assert (=> b!659098 (= res!427441 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!659099 () Bool)

(declare-fun Unit!22949 () Unit!22944)

(assert (=> b!659099 (= e!378645 Unit!22949)))

(declare-fun b!659100 () Bool)

(declare-fun res!427442 () Bool)

(assert (=> b!659100 (=> (not res!427442) (not e!378648))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!659100 (= res!427442 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18579 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659101 () Bool)

(declare-fun res!427430 () Bool)

(assert (=> b!659101 (= res!427430 (bvsge j!136 index!984))))

(assert (=> b!659101 (=> res!427430 e!378642)))

(declare-fun e!378640 () Bool)

(assert (=> b!659101 (= e!378640 e!378642)))

(declare-fun b!659102 () Bool)

(declare-fun res!427439 () Bool)

(assert (=> b!659102 (=> (not res!427439) (not e!378638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!659102 (= res!427439 (validKeyInArray!0 k!1786))))

(declare-fun b!659103 () Bool)

(declare-fun Unit!22950 () Unit!22944)

(assert (=> b!659103 (= e!378646 Unit!22950)))

(declare-fun lt!308413 () SeekEntryResult!7019)

(declare-fun b!659104 () Bool)

(declare-fun e!378635 () Bool)

(assert (=> b!659104 (= e!378635 (not (or (= lt!308413 (MissingVacant!7019 vacantSpotIndex!68)) (= lt!308421 lt!308413))))))

(declare-fun lt!308420 () Unit!22944)

(assert (=> b!659104 (= lt!308420 e!378647)))

(declare-fun c!76200 () Bool)

(assert (=> b!659104 (= c!76200 (= lt!308413 (Found!7019 index!984)))))

(declare-fun lt!308414 () Unit!22944)

(declare-fun e!378637 () Unit!22944)

(assert (=> b!659104 (= lt!308414 e!378637)))

(declare-fun c!76202 () Bool)

(assert (=> b!659104 (= c!76202 (= lt!308413 Undefined!7019))))

(declare-fun lt!308411 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38764 (_ BitVec 32)) SeekEntryResult!7019)

(assert (=> b!659104 (= lt!308413 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!308411 lt!308412 mask!3053))))

(assert (=> b!659104 e!378639))

(declare-fun res!427434 () Bool)

(assert (=> b!659104 (=> (not res!427434) (not e!378639))))

(declare-fun lt!308417 () (_ BitVec 32))

(assert (=> b!659104 (= res!427434 (= lt!308422 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308417 vacantSpotIndex!68 lt!308411 lt!308412 mask!3053)))))

(assert (=> b!659104 (= lt!308422 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308417 vacantSpotIndex!68 (select (arr!18579 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!659104 (= lt!308411 (select (store (arr!18579 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!308415 () Unit!22944)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38764 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22944)

(assert (=> b!659104 (= lt!308415 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!308417 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!659104 (= lt!308417 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!659105 () Bool)

(assert (=> b!659105 (= e!378638 e!378648)))

(declare-fun res!427428 () Bool)

(assert (=> b!659105 (=> (not res!427428) (not e!378648))))

(declare-fun lt!308428 () SeekEntryResult!7019)

(assert (=> b!659105 (= res!427428 (or (= lt!308428 (MissingZero!7019 i!1108)) (= lt!308428 (MissingVacant!7019 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38764 (_ BitVec 32)) SeekEntryResult!7019)

(assert (=> b!659105 (= lt!308428 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!659106 () Bool)

(declare-fun Unit!22951 () Unit!22944)

(assert (=> b!659106 (= e!378647 Unit!22951)))

(declare-fun res!427432 () Bool)

(assert (=> b!659106 (= res!427432 (= (select (store (arr!18579 a!2986) i!1108 k!1786) index!984) (select (arr!18579 a!2986) j!136)))))

(assert (=> b!659106 (=> (not res!427432) (not e!378640))))

(assert (=> b!659106 e!378640))

(declare-fun c!76199 () Bool)

(assert (=> b!659106 (= c!76199 (bvslt j!136 index!984))))

(declare-fun lt!308416 () Unit!22944)

(assert (=> b!659106 (= lt!308416 e!378646)))

(declare-fun c!76201 () Bool)

(assert (=> b!659106 (= c!76201 (bvslt index!984 j!136))))

(declare-fun lt!308410 () Unit!22944)

(assert (=> b!659106 (= lt!308410 e!378645)))

(assert (=> b!659106 false))

(declare-fun b!659107 () Bool)

(declare-fun res!427431 () Bool)

(assert (=> b!659107 (=> (not res!427431) (not e!378638))))

(assert (=> b!659107 (= res!427431 (and (= (size!18943 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18943 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18943 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!659108 () Bool)

(declare-fun Unit!22952 () Unit!22944)

(assert (=> b!659108 (= e!378637 Unit!22952)))

(declare-fun b!659109 () Bool)

(assert (=> b!659109 (= e!378641 e!378635)))

(declare-fun res!427436 () Bool)

(assert (=> b!659109 (=> (not res!427436) (not e!378635))))

(assert (=> b!659109 (= res!427436 (and (= lt!308421 (Found!7019 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18579 a!2986) index!984) (select (arr!18579 a!2986) j!136))) (not (= (select (arr!18579 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!659109 (= lt!308421 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18579 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!659110 () Bool)

(declare-fun res!427427 () Bool)

(assert (=> b!659110 (=> (not res!427427) (not e!378648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38764 (_ BitVec 32)) Bool)

(assert (=> b!659110 (= res!427427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!659111 () Bool)

(assert (=> b!659111 (= e!378636 (arrayContainsKey!0 lt!308412 (select (arr!18579 a!2986) j!136) index!984))))

(declare-fun b!659112 () Bool)

(declare-fun res!427435 () Bool)

(assert (=> b!659112 (=> (not res!427435) (not e!378638))))

(assert (=> b!659112 (= res!427435 (validKeyInArray!0 (select (arr!18579 a!2986) j!136)))))

(declare-fun b!659113 () Bool)

(assert (=> b!659113 (= e!378644 (arrayContainsKey!0 lt!308412 (select (arr!18579 a!2986) j!136) index!984))))

(declare-fun b!659114 () Bool)

(declare-fun Unit!22953 () Unit!22944)

(assert (=> b!659114 (= e!378637 Unit!22953)))

(assert (=> b!659114 false))

(assert (= (and start!59606 res!427429) b!659107))

(assert (= (and b!659107 res!427431) b!659112))

(assert (= (and b!659112 res!427435) b!659102))

(assert (= (and b!659102 res!427439) b!659098))

(assert (= (and b!659098 res!427441) b!659105))

(assert (= (and b!659105 res!427428) b!659110))

(assert (= (and b!659110 res!427427) b!659092))

(assert (= (and b!659092 res!427438) b!659100))

(assert (= (and b!659100 res!427442) b!659096))

(assert (= (and b!659096 res!427440) b!659109))

(assert (= (and b!659109 res!427436) b!659104))

(assert (= (and b!659104 res!427434) b!659091))

(assert (= (and b!659104 c!76202) b!659114))

(assert (= (and b!659104 (not c!76202)) b!659108))

(assert (= (and b!659104 c!76200) b!659106))

(assert (= (and b!659104 (not c!76200)) b!659095))

(assert (= (and b!659106 res!427432) b!659101))

(assert (= (and b!659101 (not res!427430)) b!659097))

(assert (= (and b!659097 res!427433) b!659113))

(assert (= (and b!659106 c!76199) b!659094))

(assert (= (and b!659106 (not c!76199)) b!659103))

(assert (= (and b!659106 c!76201) b!659093))

(assert (= (and b!659106 (not c!76201)) b!659099))

(assert (= (and b!659093 res!427437) b!659111))

(declare-fun m!632057 () Bool)

(assert (=> b!659110 m!632057))

(declare-fun m!632059 () Bool)

(assert (=> b!659100 m!632059))

(declare-fun m!632061 () Bool)

(assert (=> b!659104 m!632061))

(declare-fun m!632063 () Bool)

(assert (=> b!659104 m!632063))

(declare-fun m!632065 () Bool)

(assert (=> b!659104 m!632065))

(declare-fun m!632067 () Bool)

(assert (=> b!659104 m!632067))

(assert (=> b!659104 m!632065))

(declare-fun m!632069 () Bool)

(assert (=> b!659104 m!632069))

(declare-fun m!632071 () Bool)

(assert (=> b!659104 m!632071))

(declare-fun m!632073 () Bool)

(assert (=> b!659104 m!632073))

(declare-fun m!632075 () Bool)

(assert (=> b!659104 m!632075))

(declare-fun m!632077 () Bool)

(assert (=> b!659109 m!632077))

(assert (=> b!659109 m!632065))

(assert (=> b!659109 m!632065))

(declare-fun m!632079 () Bool)

(assert (=> b!659109 m!632079))

(declare-fun m!632081 () Bool)

(assert (=> b!659098 m!632081))

(declare-fun m!632083 () Bool)

(assert (=> b!659093 m!632083))

(assert (=> b!659093 m!632065))

(declare-fun m!632085 () Bool)

(assert (=> b!659093 m!632085))

(declare-fun m!632087 () Bool)

(assert (=> b!659093 m!632087))

(assert (=> b!659093 m!632065))

(declare-fun m!632089 () Bool)

(assert (=> b!659093 m!632089))

(assert (=> b!659093 m!632065))

(declare-fun m!632091 () Bool)

(assert (=> b!659093 m!632091))

(assert (=> b!659093 m!632065))

(declare-fun m!632093 () Bool)

(assert (=> b!659093 m!632093))

(declare-fun m!632095 () Bool)

(assert (=> b!659093 m!632095))

(declare-fun m!632097 () Bool)

(assert (=> b!659093 m!632097))

(assert (=> b!659093 m!632065))

(assert (=> b!659097 m!632065))

(assert (=> b!659097 m!632065))

(assert (=> b!659097 m!632091))

(assert (=> b!659094 m!632065))

(declare-fun m!632099 () Bool)

(assert (=> b!659094 m!632099))

(declare-fun m!632101 () Bool)

(assert (=> b!659094 m!632101))

(assert (=> b!659094 m!632065))

(declare-fun m!632103 () Bool)

(assert (=> b!659094 m!632103))

(assert (=> b!659094 m!632095))

(assert (=> b!659094 m!632097))

(assert (=> b!659094 m!632065))

(declare-fun m!632105 () Bool)

(assert (=> b!659094 m!632105))

(assert (=> b!659094 m!632065))

(declare-fun m!632107 () Bool)

(assert (=> b!659094 m!632107))

(declare-fun m!632109 () Bool)

(assert (=> b!659105 m!632109))

(declare-fun m!632111 () Bool)

(assert (=> start!59606 m!632111))

(declare-fun m!632113 () Bool)

(assert (=> start!59606 m!632113))

(declare-fun m!632115 () Bool)

(assert (=> b!659102 m!632115))

(assert (=> b!659111 m!632065))

(assert (=> b!659111 m!632065))

(declare-fun m!632117 () Bool)

(assert (=> b!659111 m!632117))

(assert (=> b!659113 m!632065))

(assert (=> b!659113 m!632065))

(assert (=> b!659113 m!632117))

(assert (=> b!659096 m!632067))

(declare-fun m!632119 () Bool)

(assert (=> b!659096 m!632119))

(assert (=> b!659106 m!632067))

(declare-fun m!632121 () Bool)

(assert (=> b!659106 m!632121))

(assert (=> b!659106 m!632065))

(declare-fun m!632123 () Bool)

(assert (=> b!659092 m!632123))

(assert (=> b!659112 m!632065))

(assert (=> b!659112 m!632065))

(declare-fun m!632125 () Bool)

(assert (=> b!659112 m!632125))

(push 1)

(assert (not b!659102))

(assert (not b!659110))

(assert (not b!659098))

(assert (not b!659104))

(assert (not b!659112))

(assert (not b!659092))

(assert (not b!659109))

(assert (not b!659097))

(assert (not start!59606))

(assert (not b!659105))

(assert (not b!659094))

(assert (not b!659111))

(assert (not b!659113))

(assert (not b!659093))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!659349 () Bool)

(declare-fun e!378801 () Bool)

(declare-fun e!378800 () Bool)

(assert (=> b!659349 (= e!378801 e!378800)))

(declare-fun lt!308587 () (_ BitVec 64))

(assert (=> b!659349 (= lt!308587 (select (arr!18579 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!308588 () Unit!22944)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38764 (_ BitVec 64) (_ BitVec 32)) Unit!22944)

(assert (=> b!659349 (= lt!308588 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!308587 #b00000000000000000000000000000000))))

(assert (=> b!659349 (arrayContainsKey!0 a!2986 lt!308587 #b00000000000000000000000000000000)))

(declare-fun lt!308589 () Unit!22944)

(assert (=> b!659349 (= lt!308589 lt!308588)))

(declare-fun res!427584 () Bool)

(assert (=> b!659349 (= res!427584 (= (seekEntryOrOpen!0 (select (arr!18579 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!7019 #b00000000000000000000000000000000)))))

(assert (=> b!659349 (=> (not res!427584) (not e!378800))))

(declare-fun b!659350 () Bool)

(declare-fun call!33898 () Bool)

(assert (=> b!659350 (= e!378801 call!33898)))

(declare-fun b!659351 () Bool)

(assert (=> b!659351 (= e!378800 call!33898)))

(declare-fun bm!33895 () Bool)

(assert (=> bm!33895 (= call!33898 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!659348 () Bool)

(declare-fun e!378802 () Bool)

(assert (=> b!659348 (= e!378802 e!378801)))

(declare-fun c!76249 () Bool)

(assert (=> b!659348 (= c!76249 (validKeyInArray!0 (select (arr!18579 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!92977 () Bool)

(declare-fun res!427585 () Bool)

(assert (=> d!92977 (=> res!427585 e!378802)))

(assert (=> d!92977 (= res!427585 (bvsge #b00000000000000000000000000000000 (size!18943 a!2986)))))

(assert (=> d!92977 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!378802)))

(assert (= (and d!92977 (not res!427585)) b!659348))

(assert (= (and b!659348 c!76249) b!659349))

(assert (= (and b!659348 (not c!76249)) b!659350))

(assert (= (and b!659349 res!427584) b!659351))

(assert (= (or b!659351 b!659350) bm!33895))

(declare-fun m!632345 () Bool)

(assert (=> b!659349 m!632345))

(declare-fun m!632347 () Bool)

(assert (=> b!659349 m!632347))

(declare-fun m!632349 () Bool)

(assert (=> b!659349 m!632349))

(assert (=> b!659349 m!632345))

(declare-fun m!632351 () Bool)

(assert (=> b!659349 m!632351))

(declare-fun m!632353 () Bool)

(assert (=> bm!33895 m!632353))

(assert (=> b!659348 m!632345))

(assert (=> b!659348 m!632345))

(declare-fun m!632355 () Bool)

(assert (=> b!659348 m!632355))

(assert (=> b!659110 d!92977))

(declare-fun d!92991 () Bool)

(declare-fun res!427593 () Bool)

(declare-fun e!378810 () Bool)

(assert (=> d!92991 (=> res!427593 e!378810)))

(assert (=> d!92991 (= res!427593 (= (select (arr!18579 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!92991 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!378810)))

(declare-fun b!659359 () Bool)

(declare-fun e!378811 () Bool)

(assert (=> b!659359 (= e!378810 e!378811)))

(declare-fun res!427594 () Bool)

(assert (=> b!659359 (=> (not res!427594) (not e!378811))))

(assert (=> b!659359 (= res!427594 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18943 a!2986)))))

(declare-fun b!659360 () Bool)

(assert (=> b!659360 (= e!378811 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!92991 (not res!427593)) b!659359))

(assert (= (and b!659359 res!427594) b!659360))

(assert (=> d!92991 m!632345))

(declare-fun m!632361 () Bool)

(assert (=> b!659360 m!632361))

(assert (=> b!659098 d!92991))

(declare-fun b!659403 () Bool)

(declare-fun e!378835 () SeekEntryResult!7019)

(assert (=> b!659403 (= e!378835 Undefined!7019)))

(declare-fun b!659404 () Bool)

(declare-fun e!378837 () SeekEntryResult!7019)

(assert (=> b!659404 (= e!378835 e!378837)))

(declare-fun lt!308608 () (_ BitVec 64))

(declare-fun c!76270 () Bool)

(assert (=> b!659404 (= c!76270 (= lt!308608 (select (arr!18579 a!2986) j!136)))))

(declare-fun e!378836 () SeekEntryResult!7019)

(declare-fun b!659405 () Bool)

(assert (=> b!659405 (= e!378836 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18579 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!659406 () Bool)

(assert (=> b!659406 (= e!378837 (Found!7019 index!984))))

(declare-fun b!659407 () Bool)

(assert (=> b!659407 (= e!378836 (MissingVacant!7019 vacantSpotIndex!68))))

(declare-fun lt!308609 () SeekEntryResult!7019)

(declare-fun d!92995 () Bool)

(assert (=> d!92995 (and (or (is-Undefined!7019 lt!308609) (not (is-Found!7019 lt!308609)) (and (bvsge (index!30442 lt!308609) #b00000000000000000000000000000000) (bvslt (index!30442 lt!308609) (size!18943 a!2986)))) (or (is-Undefined!7019 lt!308609) (is-Found!7019 lt!308609) (not (is-MissingVacant!7019 lt!308609)) (not (= (index!30444 lt!308609) vacantSpotIndex!68)) (and (bvsge (index!30444 lt!308609) #b00000000000000000000000000000000) (bvslt (index!30444 lt!308609) (size!18943 a!2986)))) (or (is-Undefined!7019 lt!308609) (ite (is-Found!7019 lt!308609) (= (select (arr!18579 a!2986) (index!30442 lt!308609)) (select (arr!18579 a!2986) j!136)) (and (is-MissingVacant!7019 lt!308609) (= (index!30444 lt!308609) vacantSpotIndex!68) (= (select (arr!18579 a!2986) (index!30444 lt!308609)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92995 (= lt!308609 e!378835)))

(declare-fun c!76269 () Bool)

(assert (=> d!92995 (= c!76269 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92995 (= lt!308608 (select (arr!18579 a!2986) index!984))))

(assert (=> d!92995 (validMask!0 mask!3053)))

(assert (=> d!92995 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18579 a!2986) j!136) a!2986 mask!3053) lt!308609)))

(declare-fun b!659402 () Bool)

(declare-fun c!76268 () Bool)

(assert (=> b!659402 (= c!76268 (= lt!308608 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!659402 (= e!378837 e!378836)))

(assert (= (and d!92995 c!76269) b!659403))

(assert (= (and d!92995 (not c!76269)) b!659404))

(assert (= (and b!659404 c!76270) b!659406))

(assert (= (and b!659404 (not c!76270)) b!659402))

(assert (= (and b!659402 c!76268) b!659407))

(assert (= (and b!659402 (not c!76268)) b!659405))

(assert (=> b!659405 m!632061))

(assert (=> b!659405 m!632061))

(assert (=> b!659405 m!632065))

(declare-fun m!632389 () Bool)

(assert (=> b!659405 m!632389))

(declare-fun m!632391 () Bool)

(assert (=> d!92995 m!632391))

(declare-fun m!632393 () Bool)

(assert (=> d!92995 m!632393))

(assert (=> d!92995 m!632077))

(assert (=> d!92995 m!632111))

(assert (=> b!659109 d!92995))

(declare-fun d!93005 () Bool)

(declare-fun res!427600 () Bool)

(declare-fun e!378838 () Bool)

(assert (=> d!93005 (=> res!427600 e!378838)))

(assert (=> d!93005 (= res!427600 (= (select (arr!18579 lt!308412) j!136) (select (arr!18579 a!2986) j!136)))))

(assert (=> d!93005 (= (arrayContainsKey!0 lt!308412 (select (arr!18579 a!2986) j!136) j!136) e!378838)))

(declare-fun b!659408 () Bool)

(declare-fun e!378839 () Bool)

(assert (=> b!659408 (= e!378838 e!378839)))

(declare-fun res!427601 () Bool)

(assert (=> b!659408 (=> (not res!427601) (not e!378839))))

(assert (=> b!659408 (= res!427601 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18943 lt!308412)))))

(declare-fun b!659409 () Bool)

(assert (=> b!659409 (= e!378839 (arrayContainsKey!0 lt!308412 (select (arr!18579 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!93005 (not res!427600)) b!659408))

(assert (= (and b!659408 res!427601) b!659409))

(declare-fun m!632395 () Bool)

(assert (=> d!93005 m!632395))

(assert (=> b!659409 m!632065))

(declare-fun m!632397 () Bool)

(assert (=> b!659409 m!632397))

(assert (=> b!659097 d!93005))

(declare-fun d!93007 () Bool)

(assert (=> d!93007 (arrayContainsKey!0 lt!308412 (select (arr!18579 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!308612 () Unit!22944)

(declare-fun choose!114 (array!38764 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22944)

(assert (=> d!93007 (= lt!308612 (choose!114 lt!308412 (select (arr!18579 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!93007 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!93007 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308412 (select (arr!18579 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!308612)))

(declare-fun bs!19607 () Bool)

(assert (= bs!19607 d!93007))

(assert (=> bs!19607 m!632065))

(assert (=> bs!19607 m!632103))

(assert (=> bs!19607 m!632065))

(declare-fun m!632399 () Bool)

(assert (=> bs!19607 m!632399))

(assert (=> b!659094 d!93007))

(declare-fun b!659432 () Bool)

(declare-fun e!378854 () Bool)

(declare-fun call!33901 () Bool)

(assert (=> b!659432 (= e!378854 call!33901)))

(declare-fun b!659433 () Bool)

(declare-fun e!378855 () Bool)

(assert (=> b!659433 (= e!378855 e!378854)))

(declare-fun c!76279 () Bool)

(assert (=> b!659433 (= c!76279 (validKeyInArray!0 (select (arr!18579 lt!308412) j!136)))))

(declare-fun b!659434 () Bool)

(assert (=> b!659434 (= e!378854 call!33901)))

(declare-fun b!659435 () Bool)

(declare-fun e!378856 () Bool)

(assert (=> b!659435 (= e!378856 e!378855)))

(declare-fun res!427610 () Bool)

(assert (=> b!659435 (=> (not res!427610) (not e!378855))))

(declare-fun e!378857 () Bool)

(assert (=> b!659435 (= res!427610 (not e!378857))))

(declare-fun res!427609 () Bool)

(assert (=> b!659435 (=> (not res!427609) (not e!378857))))

(assert (=> b!659435 (= res!427609 (validKeyInArray!0 (select (arr!18579 lt!308412) j!136)))))

(declare-fun bm!33898 () Bool)

(assert (=> bm!33898 (= call!33901 (arrayNoDuplicates!0 lt!308412 (bvadd j!136 #b00000000000000000000000000000001) (ite c!76279 (Cons!12616 (select (arr!18579 lt!308412) j!136) Nil!12617) Nil!12617)))))

(declare-fun d!93009 () Bool)

(declare-fun res!427608 () Bool)

(assert (=> d!93009 (=> res!427608 e!378856)))

(assert (=> d!93009 (= res!427608 (bvsge j!136 (size!18943 lt!308412)))))

(assert (=> d!93009 (= (arrayNoDuplicates!0 lt!308412 j!136 Nil!12617) e!378856)))

(declare-fun b!659436 () Bool)

(declare-fun contains!3199 (List!12620 (_ BitVec 64)) Bool)

(assert (=> b!659436 (= e!378857 (contains!3199 Nil!12617 (select (arr!18579 lt!308412) j!136)))))

(assert (= (and d!93009 (not res!427608)) b!659435))

(assert (= (and b!659435 res!427609) b!659436))

(assert (= (and b!659435 res!427610) b!659433))

(assert (= (and b!659433 c!76279) b!659432))

(assert (= (and b!659433 (not c!76279)) b!659434))

(assert (= (or b!659432 b!659434) bm!33898))

(assert (=> b!659433 m!632395))

(assert (=> b!659433 m!632395))

(declare-fun m!632401 () Bool)

(assert (=> b!659433 m!632401))

(assert (=> b!659435 m!632395))

(assert (=> b!659435 m!632395))

(assert (=> b!659435 m!632401))

(assert (=> bm!33898 m!632395))

(declare-fun m!632403 () Bool)

(assert (=> bm!33898 m!632403))

(assert (=> b!659436 m!632395))

(assert (=> b!659436 m!632395))

(declare-fun m!632405 () Bool)

(assert (=> b!659436 m!632405))

(assert (=> b!659094 d!93009))

(declare-fun d!93011 () Bool)

(assert (=> d!93011 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18943 lt!308412)) (not (= (select (arr!18579 lt!308412) j!136) (select (arr!18579 a!2986) j!136))))))

(declare-fun lt!308629 () Unit!22944)

(declare-fun choose!21 (array!38764 (_ BitVec 64) (_ BitVec 32) List!12620) Unit!22944)

(assert (=> d!93011 (= lt!308629 (choose!21 lt!308412 (select (arr!18579 a!2986) j!136) j!136 Nil!12617))))

(assert (=> d!93011 (bvslt (size!18943 lt!308412) #b01111111111111111111111111111111)))

(assert (=> d!93011 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308412 (select (arr!18579 a!2986) j!136) j!136 Nil!12617) lt!308629)))

(declare-fun bs!19609 () Bool)

(assert (= bs!19609 d!93011))

(assert (=> bs!19609 m!632395))

(assert (=> bs!19609 m!632065))

(declare-fun m!632431 () Bool)

(assert (=> bs!19609 m!632431))

(assert (=> b!659094 d!93011))

(declare-fun d!93021 () Bool)

(declare-fun res!427617 () Bool)

(declare-fun e!378870 () Bool)

(assert (=> d!93021 (=> res!427617 e!378870)))

(assert (=> d!93021 (= res!427617 (= (select (arr!18579 lt!308412) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18579 a!2986) j!136)))))

(assert (=> d!93021 (= (arrayContainsKey!0 lt!308412 (select (arr!18579 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!378870)))

(declare-fun b!659455 () Bool)

(declare-fun e!378871 () Bool)

(assert (=> b!659455 (= e!378870 e!378871)))

(declare-fun res!427618 () Bool)

(assert (=> b!659455 (=> (not res!427618) (not e!378871))))

(assert (=> b!659455 (= res!427618 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18943 lt!308412)))))

(declare-fun b!659456 () Bool)

(assert (=> b!659456 (= e!378871 (arrayContainsKey!0 lt!308412 (select (arr!18579 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!93021 (not res!427617)) b!659455))

(assert (= (and b!659455 res!427618) b!659456))

(declare-fun m!632437 () Bool)

(assert (=> d!93021 m!632437))

(assert (=> b!659456 m!632065))

(declare-fun m!632439 () Bool)

(assert (=> b!659456 m!632439))

(assert (=> b!659094 d!93021))

(declare-fun d!93025 () Bool)

(assert (=> d!93025 (arrayNoDuplicates!0 lt!308412 j!136 Nil!12617)))

(declare-fun lt!308639 () Unit!22944)

(declare-fun choose!39 (array!38764 (_ BitVec 32) (_ BitVec 32)) Unit!22944)

(assert (=> d!93025 (= lt!308639 (choose!39 lt!308412 #b00000000000000000000000000000000 j!136))))

(assert (=> d!93025 (bvslt (size!18943 lt!308412) #b01111111111111111111111111111111)))

(assert (=> d!93025 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!308412 #b00000000000000000000000000000000 j!136) lt!308639)))

(declare-fun bs!19612 () Bool)

(assert (= bs!19612 d!93025))

(assert (=> bs!19612 m!632101))

(declare-fun m!632475 () Bool)

(assert (=> bs!19612 m!632475))

(assert (=> b!659094 d!93025))

(declare-fun b!659480 () Bool)

(declare-fun e!378887 () Bool)

(declare-fun call!33904 () Bool)

(assert (=> b!659480 (= e!378887 call!33904)))

(declare-fun b!659481 () Bool)

(declare-fun e!378888 () Bool)

(assert (=> b!659481 (= e!378888 e!378887)))

(declare-fun c!76294 () Bool)

(assert (=> b!659481 (= c!76294 (validKeyInArray!0 (select (arr!18579 lt!308412) #b00000000000000000000000000000000)))))

(declare-fun b!659482 () Bool)

(assert (=> b!659482 (= e!378887 call!33904)))

(declare-fun b!659483 () Bool)

(declare-fun e!378889 () Bool)

(assert (=> b!659483 (= e!378889 e!378888)))

(declare-fun res!427628 () Bool)

(assert (=> b!659483 (=> (not res!427628) (not e!378888))))

(declare-fun e!378890 () Bool)

(assert (=> b!659483 (= res!427628 (not e!378890))))

(declare-fun res!427627 () Bool)

(assert (=> b!659483 (=> (not res!427627) (not e!378890))))

(assert (=> b!659483 (= res!427627 (validKeyInArray!0 (select (arr!18579 lt!308412) #b00000000000000000000000000000000)))))

(declare-fun bm!33901 () Bool)

(assert (=> bm!33901 (= call!33904 (arrayNoDuplicates!0 lt!308412 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!76294 (Cons!12616 (select (arr!18579 lt!308412) #b00000000000000000000000000000000) Nil!12617) Nil!12617)))))

(declare-fun d!93037 () Bool)

(declare-fun res!427626 () Bool)

(assert (=> d!93037 (=> res!427626 e!378889)))

(assert (=> d!93037 (= res!427626 (bvsge #b00000000000000000000000000000000 (size!18943 lt!308412)))))

(assert (=> d!93037 (= (arrayNoDuplicates!0 lt!308412 #b00000000000000000000000000000000 Nil!12617) e!378889)))

(declare-fun b!659484 () Bool)

(assert (=> b!659484 (= e!378890 (contains!3199 Nil!12617 (select (arr!18579 lt!308412) #b00000000000000000000000000000000)))))

(assert (= (and d!93037 (not res!427626)) b!659483))

(assert (= (and b!659483 res!427627) b!659484))

(assert (= (and b!659483 res!427628) b!659481))

(assert (= (and b!659481 c!76294) b!659480))

(assert (= (and b!659481 (not c!76294)) b!659482))

(assert (= (or b!659480 b!659482) bm!33901))

(declare-fun m!632479 () Bool)

(assert (=> b!659481 m!632479))

(assert (=> b!659481 m!632479))

(declare-fun m!632481 () Bool)

(assert (=> b!659481 m!632481))

(assert (=> b!659483 m!632479))

(assert (=> b!659483 m!632479))

(assert (=> b!659483 m!632481))

(assert (=> bm!33901 m!632479))

(declare-fun m!632483 () Bool)

(assert (=> bm!33901 m!632483))

(assert (=> b!659484 m!632479))

(assert (=> b!659484 m!632479))

(declare-fun m!632485 () Bool)

(assert (=> b!659484 m!632485))

(assert (=> b!659094 d!93037))

(declare-fun d!93045 () Bool)

(declare-fun e!378898 () Bool)

(assert (=> d!93045 e!378898))

(declare-fun res!427633 () Bool)

(assert (=> d!93045 (=> (not res!427633) (not e!378898))))

(assert (=> d!93045 (= res!427633 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18943 a!2986))))))

(declare-fun lt!308647 () Unit!22944)

(declare-fun choose!41 (array!38764 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12620) Unit!22944)

(assert (=> d!93045 (= lt!308647 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12617))))

(assert (=> d!93045 (bvslt (size!18943 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!93045 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12617) lt!308647)))

(declare-fun b!659495 () Bool)

(assert (=> b!659495 (= e!378898 (arrayNoDuplicates!0 (array!38765 (store (arr!18579 a!2986) i!1108 k!1786) (size!18943 a!2986)) #b00000000000000000000000000000000 Nil!12617))))

(assert (= (and d!93045 res!427633) b!659495))

(declare-fun m!632499 () Bool)

(assert (=> d!93045 m!632499))

(assert (=> b!659495 m!632067))

(declare-fun m!632501 () Bool)

(assert (=> b!659495 m!632501))

(assert (=> b!659094 d!93045))

(declare-fun b!659533 () Bool)

(declare-fun e!378926 () SeekEntryResult!7019)

(assert (=> b!659533 (= e!378926 Undefined!7019)))

(declare-fun b!659534 () Bool)

(declare-fun e!378924 () SeekEntryResult!7019)

(declare-fun lt!308669 () SeekEntryResult!7019)

(assert (=> b!659534 (= e!378924 (MissingZero!7019 (index!30443 lt!308669)))))

(declare-fun d!93057 () Bool)

(declare-fun lt!308670 () SeekEntryResult!7019)

(assert (=> d!93057 (and (or (is-Undefined!7019 lt!308670) (not (is-Found!7019 lt!308670)) (and (bvsge (index!30442 lt!308670) #b00000000000000000000000000000000) (bvslt (index!30442 lt!308670) (size!18943 a!2986)))) (or (is-Undefined!7019 lt!308670) (is-Found!7019 lt!308670) (not (is-MissingZero!7019 lt!308670)) (and (bvsge (index!30441 lt!308670) #b00000000000000000000000000000000) (bvslt (index!30441 lt!308670) (size!18943 a!2986)))) (or (is-Undefined!7019 lt!308670) (is-Found!7019 lt!308670) (is-MissingZero!7019 lt!308670) (not (is-MissingVacant!7019 lt!308670)) (and (bvsge (index!30444 lt!308670) #b00000000000000000000000000000000) (bvslt (index!30444 lt!308670) (size!18943 a!2986)))) (or (is-Undefined!7019 lt!308670) (ite (is-Found!7019 lt!308670) (= (select (arr!18579 a!2986) (index!30442 lt!308670)) k!1786) (ite (is-MissingZero!7019 lt!308670) (= (select (arr!18579 a!2986) (index!30441 lt!308670)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7019 lt!308670) (= (select (arr!18579 a!2986) (index!30444 lt!308670)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!93057 (= lt!308670 e!378926)))

(declare-fun c!76311 () Bool)

(assert (=> d!93057 (= c!76311 (and (is-Intermediate!7019 lt!308669) (undefined!7831 lt!308669)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38764 (_ BitVec 32)) SeekEntryResult!7019)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!93057 (= lt!308669 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!93057 (validMask!0 mask!3053)))

(assert (=> d!93057 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!308670)))

(declare-fun b!659535 () Bool)

(declare-fun e!378925 () SeekEntryResult!7019)

(assert (=> b!659535 (= e!378925 (Found!7019 (index!30443 lt!308669)))))

(declare-fun b!659536 () Bool)

(assert (=> b!659536 (= e!378926 e!378925)))

(declare-fun lt!308671 () (_ BitVec 64))

(assert (=> b!659536 (= lt!308671 (select (arr!18579 a!2986) (index!30443 lt!308669)))))

(declare-fun c!76312 () Bool)

(assert (=> b!659536 (= c!76312 (= lt!308671 k!1786))))

(declare-fun b!659537 () Bool)

(declare-fun c!76310 () Bool)

(assert (=> b!659537 (= c!76310 (= lt!308671 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!659537 (= e!378925 e!378924)))

(declare-fun b!659538 () Bool)

(assert (=> b!659538 (= e!378924 (seekKeyOrZeroReturnVacant!0 (x!59230 lt!308669) (index!30443 lt!308669) (index!30443 lt!308669) k!1786 a!2986 mask!3053))))

(assert (= (and d!93057 c!76311) b!659533))

(assert (= (and d!93057 (not c!76311)) b!659536))

(assert (= (and b!659536 c!76312) b!659535))

(assert (= (and b!659536 (not c!76312)) b!659537))

(assert (= (and b!659537 c!76310) b!659534))

(assert (= (and b!659537 (not c!76310)) b!659538))

(declare-fun m!632517 () Bool)

(assert (=> d!93057 m!632517))

(declare-fun m!632519 () Bool)

(assert (=> d!93057 m!632519))

(assert (=> d!93057 m!632517))

(declare-fun m!632521 () Bool)

(assert (=> d!93057 m!632521))

(assert (=> d!93057 m!632111))

(declare-fun m!632523 () Bool)

(assert (=> d!93057 m!632523))

(declare-fun m!632525 () Bool)

(assert (=> d!93057 m!632525))

(declare-fun m!632527 () Bool)

(assert (=> b!659536 m!632527))

(declare-fun m!632529 () Bool)

(assert (=> b!659538 m!632529))

(assert (=> b!659105 d!93057))

(declare-fun d!93069 () Bool)

(assert (=> d!93069 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59606 d!93069))

(declare-fun d!93087 () Bool)

(assert (=> d!93087 (= (array_inv!14375 a!2986) (bvsge (size!18943 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59606 d!93087))

(declare-fun d!93089 () Bool)

(assert (=> d!93089 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (size!18943 lt!308412)) (not (= (select (arr!18579 lt!308412) index!984) (select (arr!18579 a!2986) j!136))))))

(declare-fun lt!308678 () Unit!22944)

(assert (=> d!93089 (= lt!308678 (choose!21 lt!308412 (select (arr!18579 a!2986) j!136) index!984 Nil!12617))))

(assert (=> d!93089 (bvslt (size!18943 lt!308412) #b01111111111111111111111111111111)))

(assert (=> d!93089 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308412 (select (arr!18579 a!2986) j!136) index!984 Nil!12617) lt!308678)))

(declare-fun bs!19617 () Bool)

(assert (= bs!19617 d!93089))

(declare-fun m!632559 () Bool)

(assert (=> bs!19617 m!632559))

(assert (=> bs!19617 m!632065))

(declare-fun m!632561 () Bool)

(assert (=> bs!19617 m!632561))

(assert (=> b!659093 d!93089))

(declare-fun d!93091 () Bool)

(declare-fun res!427658 () Bool)

(declare-fun e!378940 () Bool)

(assert (=> d!93091 (=> res!427658 e!378940)))

(assert (=> d!93091 (= res!427658 (= (select (arr!18579 lt!308412) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18579 a!2986) j!136)))))

(assert (=> d!93091 (= (arrayContainsKey!0 lt!308412 (select (arr!18579 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!378940)))

(declare-fun b!659554 () Bool)

(declare-fun e!378941 () Bool)

(assert (=> b!659554 (= e!378940 e!378941)))

(declare-fun res!427659 () Bool)

(assert (=> b!659554 (=> (not res!427659) (not e!378941))))

(assert (=> b!659554 (= res!427659 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18943 lt!308412)))))

(declare-fun b!659555 () Bool)

(assert (=> b!659555 (= e!378941 (arrayContainsKey!0 lt!308412 (select (arr!18579 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!93091 (not res!427658)) b!659554))

(assert (= (and b!659554 res!427659) b!659555))

(declare-fun m!632563 () Bool)

(assert (=> d!93091 m!632563))

(assert (=> b!659555 m!632065))

(declare-fun m!632565 () Bool)

(assert (=> b!659555 m!632565))

(assert (=> b!659093 d!93091))

(declare-fun d!93093 () Bool)

(assert (=> d!93093 (arrayContainsKey!0 lt!308412 (select (arr!18579 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!308679 () Unit!22944)

(assert (=> d!93093 (= lt!308679 (choose!114 lt!308412 (select (arr!18579 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!93093 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!93093 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308412 (select (arr!18579 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!308679)))

(declare-fun bs!19618 () Bool)

(assert (= bs!19618 d!93093))

(assert (=> bs!19618 m!632065))

(assert (=> bs!19618 m!632089))

(assert (=> bs!19618 m!632065))

(declare-fun m!632567 () Bool)

(assert (=> bs!19618 m!632567))

(assert (=> b!659093 d!93093))

(declare-fun d!93095 () Bool)

(assert (=> d!93095 (arrayNoDuplicates!0 lt!308412 index!984 Nil!12617)))

(declare-fun lt!308680 () Unit!22944)

(assert (=> d!93095 (= lt!308680 (choose!39 lt!308412 #b00000000000000000000000000000000 index!984))))

(assert (=> d!93095 (bvslt (size!18943 lt!308412) #b01111111111111111111111111111111)))

(assert (=> d!93095 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!308412 #b00000000000000000000000000000000 index!984) lt!308680)))

(declare-fun bs!19619 () Bool)

(assert (= bs!19619 d!93095))

(assert (=> bs!19619 m!632087))

(declare-fun m!632569 () Bool)

(assert (=> bs!19619 m!632569))

(assert (=> b!659093 d!93095))

(assert (=> b!659093 d!93005))

(declare-fun b!659556 () Bool)

(declare-fun e!378942 () Bool)

(declare-fun call!33913 () Bool)

(assert (=> b!659556 (= e!378942 call!33913)))

(declare-fun b!659557 () Bool)

(declare-fun e!378943 () Bool)

(assert (=> b!659557 (= e!378943 e!378942)))

(declare-fun c!76315 () Bool)

(assert (=> b!659557 (= c!76315 (validKeyInArray!0 (select (arr!18579 lt!308412) index!984)))))

(declare-fun b!659558 () Bool)

(assert (=> b!659558 (= e!378942 call!33913)))

(declare-fun b!659559 () Bool)

(declare-fun e!378944 () Bool)

(assert (=> b!659559 (= e!378944 e!378943)))

(declare-fun res!427662 () Bool)

(assert (=> b!659559 (=> (not res!427662) (not e!378943))))

(declare-fun e!378945 () Bool)

(assert (=> b!659559 (= res!427662 (not e!378945))))

(declare-fun res!427661 () Bool)

(assert (=> b!659559 (=> (not res!427661) (not e!378945))))

(assert (=> b!659559 (= res!427661 (validKeyInArray!0 (select (arr!18579 lt!308412) index!984)))))

(declare-fun bm!33910 () Bool)

(assert (=> bm!33910 (= call!33913 (arrayNoDuplicates!0 lt!308412 (bvadd index!984 #b00000000000000000000000000000001) (ite c!76315 (Cons!12616 (select (arr!18579 lt!308412) index!984) Nil!12617) Nil!12617)))))

(declare-fun d!93097 () Bool)

(declare-fun res!427660 () Bool)

(assert (=> d!93097 (=> res!427660 e!378944)))

(assert (=> d!93097 (= res!427660 (bvsge index!984 (size!18943 lt!308412)))))

(assert (=> d!93097 (= (arrayNoDuplicates!0 lt!308412 index!984 Nil!12617) e!378944)))

(declare-fun b!659560 () Bool)

(assert (=> b!659560 (= e!378945 (contains!3199 Nil!12617 (select (arr!18579 lt!308412) index!984)))))

(assert (= (and d!93097 (not res!427660)) b!659559))

(assert (= (and b!659559 res!427661) b!659560))

(assert (= (and b!659559 res!427662) b!659557))

(assert (= (and b!659557 c!76315) b!659556))

(assert (= (and b!659557 (not c!76315)) b!659558))

(assert (= (or b!659556 b!659558) bm!33910))

(assert (=> b!659557 m!632559))

(assert (=> b!659557 m!632559))

(declare-fun m!632571 () Bool)

(assert (=> b!659557 m!632571))

(assert (=> b!659559 m!632559))

(assert (=> b!659559 m!632559))

(assert (=> b!659559 m!632571))

(assert (=> bm!33910 m!632559))

(declare-fun m!632573 () Bool)

(assert (=> bm!33910 m!632573))

(assert (=> b!659560 m!632559))

(assert (=> b!659560 m!632559))

(declare-fun m!632575 () Bool)

(assert (=> b!659560 m!632575))

(assert (=> b!659093 d!93097))

(assert (=> b!659093 d!93037))

(assert (=> b!659093 d!93045))

(declare-fun b!659562 () Bool)

(declare-fun e!378946 () SeekEntryResult!7019)

(assert (=> b!659562 (= e!378946 Undefined!7019)))

(declare-fun b!659563 () Bool)

(declare-fun e!378948 () SeekEntryResult!7019)

(assert (=> b!659563 (= e!378946 e!378948)))

(declare-fun c!76318 () Bool)

(declare-fun lt!308681 () (_ BitVec 64))

(assert (=> b!659563 (= c!76318 (= lt!308681 lt!308411))))

(declare-fun b!659564 () Bool)

(declare-fun e!378947 () SeekEntryResult!7019)

(assert (=> b!659564 (= e!378947 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!308417 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!308411 lt!308412 mask!3053))))

(declare-fun b!659565 () Bool)

(assert (=> b!659565 (= e!378948 (Found!7019 lt!308417))))

(declare-fun b!659566 () Bool)

(assert (=> b!659566 (= e!378947 (MissingVacant!7019 vacantSpotIndex!68))))

(declare-fun d!93099 () Bool)

(declare-fun lt!308682 () SeekEntryResult!7019)

(assert (=> d!93099 (and (or (is-Undefined!7019 lt!308682) (not (is-Found!7019 lt!308682)) (and (bvsge (index!30442 lt!308682) #b00000000000000000000000000000000) (bvslt (index!30442 lt!308682) (size!18943 lt!308412)))) (or (is-Undefined!7019 lt!308682) (is-Found!7019 lt!308682) (not (is-MissingVacant!7019 lt!308682)) (not (= (index!30444 lt!308682) vacantSpotIndex!68)) (and (bvsge (index!30444 lt!308682) #b00000000000000000000000000000000) (bvslt (index!30444 lt!308682) (size!18943 lt!308412)))) (or (is-Undefined!7019 lt!308682) (ite (is-Found!7019 lt!308682) (= (select (arr!18579 lt!308412) (index!30442 lt!308682)) lt!308411) (and (is-MissingVacant!7019 lt!308682) (= (index!30444 lt!308682) vacantSpotIndex!68) (= (select (arr!18579 lt!308412) (index!30444 lt!308682)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!93099 (= lt!308682 e!378946)))

(declare-fun c!76317 () Bool)

(assert (=> d!93099 (= c!76317 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!93099 (= lt!308681 (select (arr!18579 lt!308412) lt!308417))))

(assert (=> d!93099 (validMask!0 mask!3053)))

(assert (=> d!93099 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308417 vacantSpotIndex!68 lt!308411 lt!308412 mask!3053) lt!308682)))

(declare-fun b!659561 () Bool)

(declare-fun c!76316 () Bool)

(assert (=> b!659561 (= c!76316 (= lt!308681 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!659561 (= e!378948 e!378947)))

(assert (= (and d!93099 c!76317) b!659562))

(assert (= (and d!93099 (not c!76317)) b!659563))

(assert (= (and b!659563 c!76318) b!659565))

