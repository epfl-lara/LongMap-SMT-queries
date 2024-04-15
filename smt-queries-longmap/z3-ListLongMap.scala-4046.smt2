; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55134 () Bool)

(assert start!55134)

(declare-fun res!388186 () Bool)

(declare-fun e!345651 () Bool)

(assert (=> start!55134 (=> (not res!388186) (not e!345651))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55134 (= res!388186 (validMask!0 mask!3053))))

(assert (=> start!55134 e!345651))

(assert (=> start!55134 true))

(declare-datatypes ((array!37221 0))(
  ( (array!37222 (arr!17867 (Array (_ BitVec 32) (_ BitVec 64))) (size!18232 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37221)

(declare-fun array_inv!13750 (array!37221) Bool)

(assert (=> start!55134 (array_inv!13750 a!2986)))

(declare-fun b!604104 () Bool)

(declare-fun e!345637 () Bool)

(declare-datatypes ((SeekEntryResult!6304 0))(
  ( (MissingZero!6304 (index!27479 (_ BitVec 32))) (Found!6304 (index!27480 (_ BitVec 32))) (Intermediate!6304 (undefined!7116 Bool) (index!27481 (_ BitVec 32)) (x!56284 (_ BitVec 32))) (Undefined!6304) (MissingVacant!6304 (index!27482 (_ BitVec 32))) )
))
(declare-fun lt!275395 () SeekEntryResult!6304)

(declare-fun lt!275384 () SeekEntryResult!6304)

(assert (=> b!604104 (= e!345637 (= lt!275395 lt!275384))))

(declare-fun b!604105 () Bool)

(declare-datatypes ((Unit!19206 0))(
  ( (Unit!19207) )
))
(declare-fun e!345647 () Unit!19206)

(declare-fun Unit!19208 () Unit!19206)

(assert (=> b!604105 (= e!345647 Unit!19208)))

(declare-fun b!604106 () Bool)

(declare-fun e!345646 () Bool)

(assert (=> b!604106 (= e!345651 e!345646)))

(declare-fun res!388178 () Bool)

(assert (=> b!604106 (=> (not res!388178) (not e!345646))))

(declare-fun lt!275388 () SeekEntryResult!6304)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!604106 (= res!388178 (or (= lt!275388 (MissingZero!6304 i!1108)) (= lt!275388 (MissingVacant!6304 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37221 (_ BitVec 32)) SeekEntryResult!6304)

(assert (=> b!604106 (= lt!275388 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!604107 () Bool)

(declare-fun e!345638 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!604107 (= e!345638 (or (bvslt (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 index!984) (size!18232 a!2986))))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!275382 () array!37221)

(declare-fun arrayContainsKey!0 (array!37221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!604107 (arrayContainsKey!0 lt!275382 (select (arr!17867 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!275389 () Unit!19206)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37221 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19206)

(assert (=> b!604107 (= lt!275389 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275382 (select (arr!17867 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!345643 () Bool)

(assert (=> b!604107 e!345643))

(declare-fun res!388190 () Bool)

(assert (=> b!604107 (=> (not res!388190) (not e!345643))))

(assert (=> b!604107 (= res!388190 (arrayContainsKey!0 lt!275382 (select (arr!17867 a!2986) j!136) j!136))))

(declare-fun b!604108 () Bool)

(declare-fun res!388195 () Bool)

(assert (=> b!604108 (=> (not res!388195) (not e!345646))))

(declare-datatypes ((List!11947 0))(
  ( (Nil!11944) (Cons!11943 (h!12988 (_ BitVec 64)) (t!18166 List!11947)) )
))
(declare-fun arrayNoDuplicates!0 (array!37221 (_ BitVec 32) List!11947) Bool)

(assert (=> b!604108 (= res!388195 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11944))))

(declare-fun b!604109 () Bool)

(declare-fun e!345648 () Bool)

(assert (=> b!604109 (= e!345648 (arrayContainsKey!0 lt!275382 (select (arr!17867 a!2986) j!136) index!984))))

(declare-fun b!604110 () Bool)

(declare-fun res!388182 () Bool)

(assert (=> b!604110 (=> (not res!388182) (not e!345651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!604110 (= res!388182 (validKeyInArray!0 k0!1786))))

(declare-fun b!604111 () Bool)

(declare-fun res!388184 () Bool)

(assert (=> b!604111 (=> (not res!388184) (not e!345651))))

(assert (=> b!604111 (= res!388184 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!604112 () Bool)

(declare-fun Unit!19209 () Unit!19206)

(assert (=> b!604112 (= e!345647 Unit!19209)))

(declare-fun lt!275387 () Unit!19206)

(assert (=> b!604112 (= lt!275387 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275382 (select (arr!17867 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!604112 (arrayContainsKey!0 lt!275382 (select (arr!17867 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275390 () Unit!19206)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37221 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11947) Unit!19206)

(assert (=> b!604112 (= lt!275390 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11944))))

(assert (=> b!604112 (arrayNoDuplicates!0 lt!275382 #b00000000000000000000000000000000 Nil!11944)))

(declare-fun lt!275391 () Unit!19206)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37221 (_ BitVec 32) (_ BitVec 32)) Unit!19206)

(assert (=> b!604112 (= lt!275391 (lemmaNoDuplicateFromThenFromBigger!0 lt!275382 #b00000000000000000000000000000000 j!136))))

(assert (=> b!604112 (arrayNoDuplicates!0 lt!275382 j!136 Nil!11944)))

(declare-fun lt!275383 () Unit!19206)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37221 (_ BitVec 64) (_ BitVec 32) List!11947) Unit!19206)

(assert (=> b!604112 (= lt!275383 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275382 (select (arr!17867 a!2986) j!136) j!136 Nil!11944))))

(assert (=> b!604112 false))

(declare-fun b!604113 () Bool)

(declare-fun res!388181 () Bool)

(assert (=> b!604113 (=> (not res!388181) (not e!345646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37221 (_ BitVec 32)) Bool)

(assert (=> b!604113 (= res!388181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!604114 () Bool)

(declare-fun e!345644 () Bool)

(declare-fun e!345640 () Bool)

(assert (=> b!604114 (= e!345644 e!345640)))

(declare-fun res!388187 () Bool)

(assert (=> b!604114 (=> res!388187 e!345640)))

(declare-fun lt!275392 () (_ BitVec 64))

(declare-fun lt!275394 () (_ BitVec 64))

(assert (=> b!604114 (= res!388187 (or (not (= (select (arr!17867 a!2986) j!136) lt!275394)) (not (= (select (arr!17867 a!2986) j!136) lt!275392))))))

(declare-fun e!345645 () Bool)

(assert (=> b!604114 e!345645))

(declare-fun res!388191 () Bool)

(assert (=> b!604114 (=> (not res!388191) (not e!345645))))

(assert (=> b!604114 (= res!388191 (= lt!275392 (select (arr!17867 a!2986) j!136)))))

(assert (=> b!604114 (= lt!275392 (select (store (arr!17867 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!604115 () Bool)

(declare-fun e!345641 () Bool)

(assert (=> b!604115 (= e!345641 (not e!345644))))

(declare-fun res!388196 () Bool)

(assert (=> b!604115 (=> res!388196 e!345644)))

(declare-fun lt!275381 () SeekEntryResult!6304)

(assert (=> b!604115 (= res!388196 (not (= lt!275381 (Found!6304 index!984))))))

(declare-fun lt!275380 () Unit!19206)

(declare-fun e!345649 () Unit!19206)

(assert (=> b!604115 (= lt!275380 e!345649)))

(declare-fun c!68330 () Bool)

(assert (=> b!604115 (= c!68330 (= lt!275381 Undefined!6304))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37221 (_ BitVec 32)) SeekEntryResult!6304)

(assert (=> b!604115 (= lt!275381 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275394 lt!275382 mask!3053))))

(assert (=> b!604115 e!345637))

(declare-fun res!388193 () Bool)

(assert (=> b!604115 (=> (not res!388193) (not e!345637))))

(declare-fun lt!275393 () (_ BitVec 32))

(assert (=> b!604115 (= res!388193 (= lt!275384 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275393 vacantSpotIndex!68 lt!275394 lt!275382 mask!3053)))))

(assert (=> b!604115 (= lt!275384 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275393 vacantSpotIndex!68 (select (arr!17867 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!604115 (= lt!275394 (select (store (arr!17867 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!275385 () Unit!19206)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37221 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19206)

(assert (=> b!604115 (= lt!275385 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275393 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!604115 (= lt!275393 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!604116 () Bool)

(assert (=> b!604116 (= e!345643 (arrayContainsKey!0 lt!275382 (select (arr!17867 a!2986) j!136) index!984))))

(declare-fun b!604117 () Bool)

(declare-fun e!345639 () Bool)

(assert (=> b!604117 (= e!345639 e!345648)))

(declare-fun res!388194 () Bool)

(assert (=> b!604117 (=> (not res!388194) (not e!345648))))

(assert (=> b!604117 (= res!388194 (arrayContainsKey!0 lt!275382 (select (arr!17867 a!2986) j!136) j!136))))

(declare-fun b!604118 () Bool)

(declare-fun res!388185 () Bool)

(assert (=> b!604118 (=> (not res!388185) (not e!345651))))

(assert (=> b!604118 (= res!388185 (and (= (size!18232 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18232 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18232 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!604119 () Bool)

(declare-fun Unit!19210 () Unit!19206)

(assert (=> b!604119 (= e!345649 Unit!19210)))

(assert (=> b!604119 false))

(declare-fun b!604120 () Bool)

(declare-fun e!345642 () Bool)

(assert (=> b!604120 (= e!345646 e!345642)))

(declare-fun res!388192 () Bool)

(assert (=> b!604120 (=> (not res!388192) (not e!345642))))

(assert (=> b!604120 (= res!388192 (= (select (store (arr!17867 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604120 (= lt!275382 (array!37222 (store (arr!17867 a!2986) i!1108 k0!1786) (size!18232 a!2986)))))

(declare-fun b!604121 () Bool)

(declare-fun Unit!19211 () Unit!19206)

(assert (=> b!604121 (= e!345649 Unit!19211)))

(declare-fun b!604122 () Bool)

(declare-fun res!388188 () Bool)

(assert (=> b!604122 (=> (not res!388188) (not e!345646))))

(assert (=> b!604122 (= res!388188 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17867 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!604123 () Bool)

(declare-fun res!388179 () Bool)

(assert (=> b!604123 (=> (not res!388179) (not e!345651))))

(assert (=> b!604123 (= res!388179 (validKeyInArray!0 (select (arr!17867 a!2986) j!136)))))

(declare-fun b!604124 () Bool)

(assert (=> b!604124 (= e!345645 e!345639)))

(declare-fun res!388183 () Bool)

(assert (=> b!604124 (=> res!388183 e!345639)))

(assert (=> b!604124 (= res!388183 (or (not (= (select (arr!17867 a!2986) j!136) lt!275394)) (not (= (select (arr!17867 a!2986) j!136) lt!275392)) (bvsge j!136 index!984)))))

(declare-fun b!604125 () Bool)

(assert (=> b!604125 (= e!345640 e!345638)))

(declare-fun res!388180 () Bool)

(assert (=> b!604125 (=> res!388180 e!345638)))

(assert (=> b!604125 (= res!388180 (bvsge index!984 j!136))))

(declare-fun lt!275386 () Unit!19206)

(assert (=> b!604125 (= lt!275386 e!345647)))

(declare-fun c!68331 () Bool)

(assert (=> b!604125 (= c!68331 (bvslt j!136 index!984))))

(declare-fun b!604126 () Bool)

(assert (=> b!604126 (= e!345642 e!345641)))

(declare-fun res!388189 () Bool)

(assert (=> b!604126 (=> (not res!388189) (not e!345641))))

(assert (=> b!604126 (= res!388189 (and (= lt!275395 (Found!6304 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17867 a!2986) index!984) (select (arr!17867 a!2986) j!136))) (not (= (select (arr!17867 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!604126 (= lt!275395 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17867 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!55134 res!388186) b!604118))

(assert (= (and b!604118 res!388185) b!604123))

(assert (= (and b!604123 res!388179) b!604110))

(assert (= (and b!604110 res!388182) b!604111))

(assert (= (and b!604111 res!388184) b!604106))

(assert (= (and b!604106 res!388178) b!604113))

(assert (= (and b!604113 res!388181) b!604108))

(assert (= (and b!604108 res!388195) b!604122))

(assert (= (and b!604122 res!388188) b!604120))

(assert (= (and b!604120 res!388192) b!604126))

(assert (= (and b!604126 res!388189) b!604115))

(assert (= (and b!604115 res!388193) b!604104))

(assert (= (and b!604115 c!68330) b!604119))

(assert (= (and b!604115 (not c!68330)) b!604121))

(assert (= (and b!604115 (not res!388196)) b!604114))

(assert (= (and b!604114 res!388191) b!604124))

(assert (= (and b!604124 (not res!388183)) b!604117))

(assert (= (and b!604117 res!388194) b!604109))

(assert (= (and b!604114 (not res!388187)) b!604125))

(assert (= (and b!604125 c!68331) b!604112))

(assert (= (and b!604125 (not c!68331)) b!604105))

(assert (= (and b!604125 (not res!388180)) b!604107))

(assert (= (and b!604107 res!388190) b!604116))

(declare-fun m!580513 () Bool)

(assert (=> b!604123 m!580513))

(assert (=> b!604123 m!580513))

(declare-fun m!580515 () Bool)

(assert (=> b!604123 m!580515))

(declare-fun m!580517 () Bool)

(assert (=> b!604111 m!580517))

(assert (=> b!604114 m!580513))

(declare-fun m!580519 () Bool)

(assert (=> b!604114 m!580519))

(declare-fun m!580521 () Bool)

(assert (=> b!604114 m!580521))

(declare-fun m!580523 () Bool)

(assert (=> start!55134 m!580523))

(declare-fun m!580525 () Bool)

(assert (=> start!55134 m!580525))

(assert (=> b!604124 m!580513))

(declare-fun m!580527 () Bool)

(assert (=> b!604122 m!580527))

(declare-fun m!580529 () Bool)

(assert (=> b!604106 m!580529))

(declare-fun m!580531 () Bool)

(assert (=> b!604126 m!580531))

(assert (=> b!604126 m!580513))

(assert (=> b!604126 m!580513))

(declare-fun m!580533 () Bool)

(assert (=> b!604126 m!580533))

(declare-fun m!580535 () Bool)

(assert (=> b!604110 m!580535))

(assert (=> b!604112 m!580513))

(declare-fun m!580537 () Bool)

(assert (=> b!604112 m!580537))

(assert (=> b!604112 m!580513))

(assert (=> b!604112 m!580513))

(declare-fun m!580539 () Bool)

(assert (=> b!604112 m!580539))

(declare-fun m!580541 () Bool)

(assert (=> b!604112 m!580541))

(declare-fun m!580543 () Bool)

(assert (=> b!604112 m!580543))

(assert (=> b!604112 m!580513))

(declare-fun m!580545 () Bool)

(assert (=> b!604112 m!580545))

(declare-fun m!580547 () Bool)

(assert (=> b!604112 m!580547))

(declare-fun m!580549 () Bool)

(assert (=> b!604112 m!580549))

(assert (=> b!604107 m!580513))

(assert (=> b!604107 m!580513))

(declare-fun m!580551 () Bool)

(assert (=> b!604107 m!580551))

(assert (=> b!604107 m!580513))

(declare-fun m!580553 () Bool)

(assert (=> b!604107 m!580553))

(assert (=> b!604107 m!580513))

(declare-fun m!580555 () Bool)

(assert (=> b!604107 m!580555))

(declare-fun m!580557 () Bool)

(assert (=> b!604115 m!580557))

(declare-fun m!580559 () Bool)

(assert (=> b!604115 m!580559))

(assert (=> b!604115 m!580513))

(assert (=> b!604115 m!580519))

(declare-fun m!580561 () Bool)

(assert (=> b!604115 m!580561))

(assert (=> b!604115 m!580513))

(declare-fun m!580563 () Bool)

(assert (=> b!604115 m!580563))

(declare-fun m!580565 () Bool)

(assert (=> b!604115 m!580565))

(declare-fun m!580567 () Bool)

(assert (=> b!604115 m!580567))

(assert (=> b!604109 m!580513))

(assert (=> b!604109 m!580513))

(declare-fun m!580569 () Bool)

(assert (=> b!604109 m!580569))

(declare-fun m!580571 () Bool)

(assert (=> b!604113 m!580571))

(assert (=> b!604116 m!580513))

(assert (=> b!604116 m!580513))

(assert (=> b!604116 m!580569))

(assert (=> b!604117 m!580513))

(assert (=> b!604117 m!580513))

(assert (=> b!604117 m!580555))

(declare-fun m!580573 () Bool)

(assert (=> b!604108 m!580573))

(assert (=> b!604120 m!580519))

(declare-fun m!580575 () Bool)

(assert (=> b!604120 m!580575))

(check-sat (not b!604113) (not b!604109) (not start!55134) (not b!604107) (not b!604110) (not b!604117) (not b!604115) (not b!604111) (not b!604116) (not b!604123) (not b!604108) (not b!604126) (not b!604106) (not b!604112))
(check-sat)
