; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55968 () Bool)

(assert start!55968)

(declare-fun b!612471 () Bool)

(declare-fun res!393969 () Bool)

(declare-fun e!351050 () Bool)

(assert (=> b!612471 (=> (not res!393969) (not e!351050))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37383 0))(
  ( (array!37384 (arr!17935 (Array (_ BitVec 32) (_ BitVec 64))) (size!18299 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37383)

(assert (=> b!612471 (= res!393969 (and (= (size!18299 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18299 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18299 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!612472 () Bool)

(declare-fun e!351051 () Bool)

(assert (=> b!612472 (= e!351051 true)))

(declare-fun lt!280400 () array!37383)

(declare-datatypes ((List!11883 0))(
  ( (Nil!11880) (Cons!11879 (h!12927 (_ BitVec 64)) (t!18103 List!11883)) )
))
(declare-fun arrayNoDuplicates!0 (array!37383 (_ BitVec 32) List!11883) Bool)

(assert (=> b!612472 (arrayNoDuplicates!0 lt!280400 #b00000000000000000000000000000000 Nil!11880)))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((Unit!19639 0))(
  ( (Unit!19640) )
))
(declare-fun lt!280389 () Unit!19639)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37383 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11883) Unit!19639)

(assert (=> b!612472 (= lt!280389 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11880))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!612472 (arrayContainsKey!0 lt!280400 (select (arr!17935 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!280401 () Unit!19639)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37383 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19639)

(assert (=> b!612472 (= lt!280401 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280400 (select (arr!17935 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!351049 () Bool)

(assert (=> b!612472 e!351049))

(declare-fun res!393977 () Bool)

(assert (=> b!612472 (=> (not res!393977) (not e!351049))))

(assert (=> b!612472 (= res!393977 (arrayContainsKey!0 lt!280400 (select (arr!17935 a!2986) j!136) j!136))))

(declare-fun b!612474 () Bool)

(declare-fun e!351062 () Bool)

(declare-datatypes ((SeekEntryResult!6331 0))(
  ( (MissingZero!6331 (index!27608 (_ BitVec 32))) (Found!6331 (index!27609 (_ BitVec 32))) (Intermediate!6331 (undefined!7143 Bool) (index!27610 (_ BitVec 32)) (x!56574 (_ BitVec 32))) (Undefined!6331) (MissingVacant!6331 (index!27611 (_ BitVec 32))) )
))
(declare-fun lt!280402 () SeekEntryResult!6331)

(declare-fun lt!280399 () SeekEntryResult!6331)

(assert (=> b!612474 (= e!351062 (= lt!280402 lt!280399))))

(declare-fun b!612475 () Bool)

(declare-fun e!351056 () Bool)

(assert (=> b!612475 (= e!351056 e!351051)))

(declare-fun res!393968 () Bool)

(assert (=> b!612475 (=> res!393968 e!351051)))

(assert (=> b!612475 (= res!393968 (bvsge index!984 j!136))))

(declare-fun lt!280392 () Unit!19639)

(declare-fun e!351052 () Unit!19639)

(assert (=> b!612475 (= lt!280392 e!351052)))

(declare-fun c!69623 () Bool)

(assert (=> b!612475 (= c!69623 (bvslt j!136 index!984))))

(declare-fun b!612476 () Bool)

(declare-fun res!393964 () Bool)

(assert (=> b!612476 (=> (not res!393964) (not e!351050))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!612476 (= res!393964 (validKeyInArray!0 (select (arr!17935 a!2986) j!136)))))

(declare-fun b!612477 () Bool)

(declare-fun e!351059 () Bool)

(declare-fun e!351063 () Bool)

(assert (=> b!612477 (= e!351059 e!351063)))

(declare-fun res!393973 () Bool)

(assert (=> b!612477 (=> (not res!393973) (not e!351063))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!612477 (= res!393973 (= (select (store (arr!17935 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!612477 (= lt!280400 (array!37384 (store (arr!17935 a!2986) i!1108 k0!1786) (size!18299 a!2986)))))

(declare-fun b!612478 () Bool)

(declare-fun res!393975 () Bool)

(assert (=> b!612478 (=> (not res!393975) (not e!351050))))

(assert (=> b!612478 (= res!393975 (validKeyInArray!0 k0!1786))))

(declare-fun b!612479 () Bool)

(declare-fun e!351054 () Bool)

(declare-fun e!351055 () Bool)

(assert (=> b!612479 (= e!351054 (not e!351055))))

(declare-fun res!393974 () Bool)

(assert (=> b!612479 (=> res!393974 e!351055)))

(declare-fun lt!280396 () SeekEntryResult!6331)

(assert (=> b!612479 (= res!393974 (not (= lt!280396 (Found!6331 index!984))))))

(declare-fun lt!280390 () Unit!19639)

(declare-fun e!351057 () Unit!19639)

(assert (=> b!612479 (= lt!280390 e!351057)))

(declare-fun c!69622 () Bool)

(assert (=> b!612479 (= c!69622 (= lt!280396 Undefined!6331))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!280394 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37383 (_ BitVec 32)) SeekEntryResult!6331)

(assert (=> b!612479 (= lt!280396 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!280394 lt!280400 mask!3053))))

(assert (=> b!612479 e!351062))

(declare-fun res!393982 () Bool)

(assert (=> b!612479 (=> (not res!393982) (not e!351062))))

(declare-fun lt!280404 () (_ BitVec 32))

(assert (=> b!612479 (= res!393982 (= lt!280399 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280404 vacantSpotIndex!68 lt!280394 lt!280400 mask!3053)))))

(assert (=> b!612479 (= lt!280399 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280404 vacantSpotIndex!68 (select (arr!17935 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!612479 (= lt!280394 (select (store (arr!17935 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!280403 () Unit!19639)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37383 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19639)

(assert (=> b!612479 (= lt!280403 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!280404 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!612479 (= lt!280404 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!612480 () Bool)

(assert (=> b!612480 (= e!351063 e!351054)))

(declare-fun res!393980 () Bool)

(assert (=> b!612480 (=> (not res!393980) (not e!351054))))

(assert (=> b!612480 (= res!393980 (and (= lt!280402 (Found!6331 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17935 a!2986) index!984) (select (arr!17935 a!2986) j!136))) (not (= (select (arr!17935 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!612480 (= lt!280402 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17935 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!612481 () Bool)

(declare-fun res!393970 () Bool)

(assert (=> b!612481 (=> (not res!393970) (not e!351059))))

(assert (=> b!612481 (= res!393970 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17935 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!612482 () Bool)

(declare-fun Unit!19641 () Unit!19639)

(assert (=> b!612482 (= e!351057 Unit!19641)))

(declare-fun b!612483 () Bool)

(declare-fun Unit!19642 () Unit!19639)

(assert (=> b!612483 (= e!351057 Unit!19642)))

(assert (=> b!612483 false))

(declare-fun b!612484 () Bool)

(declare-fun e!351060 () Bool)

(assert (=> b!612484 (= e!351060 (arrayContainsKey!0 lt!280400 (select (arr!17935 a!2986) j!136) index!984))))

(declare-fun b!612485 () Bool)

(assert (=> b!612485 (= e!351055 e!351056)))

(declare-fun res!393971 () Bool)

(assert (=> b!612485 (=> res!393971 e!351056)))

(declare-fun lt!280405 () (_ BitVec 64))

(assert (=> b!612485 (= res!393971 (or (not (= (select (arr!17935 a!2986) j!136) lt!280394)) (not (= (select (arr!17935 a!2986) j!136) lt!280405))))))

(declare-fun e!351058 () Bool)

(assert (=> b!612485 e!351058))

(declare-fun res!393967 () Bool)

(assert (=> b!612485 (=> (not res!393967) (not e!351058))))

(assert (=> b!612485 (= res!393967 (= lt!280405 (select (arr!17935 a!2986) j!136)))))

(assert (=> b!612485 (= lt!280405 (select (store (arr!17935 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!612486 () Bool)

(declare-fun e!351061 () Bool)

(assert (=> b!612486 (= e!351061 e!351060)))

(declare-fun res!393979 () Bool)

(assert (=> b!612486 (=> (not res!393979) (not e!351060))))

(assert (=> b!612486 (= res!393979 (arrayContainsKey!0 lt!280400 (select (arr!17935 a!2986) j!136) j!136))))

(declare-fun b!612487 () Bool)

(declare-fun res!393972 () Bool)

(assert (=> b!612487 (=> (not res!393972) (not e!351059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37383 (_ BitVec 32)) Bool)

(assert (=> b!612487 (= res!393972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!393981 () Bool)

(assert (=> start!55968 (=> (not res!393981) (not e!351050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55968 (= res!393981 (validMask!0 mask!3053))))

(assert (=> start!55968 e!351050))

(assert (=> start!55968 true))

(declare-fun array_inv!13794 (array!37383) Bool)

(assert (=> start!55968 (array_inv!13794 a!2986)))

(declare-fun b!612473 () Bool)

(declare-fun Unit!19643 () Unit!19639)

(assert (=> b!612473 (= e!351052 Unit!19643)))

(declare-fun lt!280391 () Unit!19639)

(assert (=> b!612473 (= lt!280391 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280400 (select (arr!17935 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!612473 (arrayContainsKey!0 lt!280400 (select (arr!17935 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!280393 () Unit!19639)

(assert (=> b!612473 (= lt!280393 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11880))))

(assert (=> b!612473 (arrayNoDuplicates!0 lt!280400 #b00000000000000000000000000000000 Nil!11880)))

(declare-fun lt!280398 () Unit!19639)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37383 (_ BitVec 32) (_ BitVec 32)) Unit!19639)

(assert (=> b!612473 (= lt!280398 (lemmaNoDuplicateFromThenFromBigger!0 lt!280400 #b00000000000000000000000000000000 j!136))))

(assert (=> b!612473 (arrayNoDuplicates!0 lt!280400 j!136 Nil!11880)))

(declare-fun lt!280395 () Unit!19639)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37383 (_ BitVec 64) (_ BitVec 32) List!11883) Unit!19639)

(assert (=> b!612473 (= lt!280395 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!280400 (select (arr!17935 a!2986) j!136) j!136 Nil!11880))))

(assert (=> b!612473 false))

(declare-fun b!612488 () Bool)

(assert (=> b!612488 (= e!351049 (arrayContainsKey!0 lt!280400 (select (arr!17935 a!2986) j!136) index!984))))

(declare-fun b!612489 () Bool)

(assert (=> b!612489 (= e!351050 e!351059)))

(declare-fun res!393965 () Bool)

(assert (=> b!612489 (=> (not res!393965) (not e!351059))))

(declare-fun lt!280397 () SeekEntryResult!6331)

(assert (=> b!612489 (= res!393965 (or (= lt!280397 (MissingZero!6331 i!1108)) (= lt!280397 (MissingVacant!6331 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37383 (_ BitVec 32)) SeekEntryResult!6331)

(assert (=> b!612489 (= lt!280397 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!612490 () Bool)

(declare-fun res!393978 () Bool)

(assert (=> b!612490 (=> (not res!393978) (not e!351050))))

(assert (=> b!612490 (= res!393978 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!612491 () Bool)

(declare-fun Unit!19644 () Unit!19639)

(assert (=> b!612491 (= e!351052 Unit!19644)))

(declare-fun b!612492 () Bool)

(declare-fun res!393976 () Bool)

(assert (=> b!612492 (=> (not res!393976) (not e!351059))))

(assert (=> b!612492 (= res!393976 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11880))))

(declare-fun b!612493 () Bool)

(assert (=> b!612493 (= e!351058 e!351061)))

(declare-fun res!393966 () Bool)

(assert (=> b!612493 (=> res!393966 e!351061)))

(assert (=> b!612493 (= res!393966 (or (not (= (select (arr!17935 a!2986) j!136) lt!280394)) (not (= (select (arr!17935 a!2986) j!136) lt!280405)) (bvsge j!136 index!984)))))

(assert (= (and start!55968 res!393981) b!612471))

(assert (= (and b!612471 res!393969) b!612476))

(assert (= (and b!612476 res!393964) b!612478))

(assert (= (and b!612478 res!393975) b!612490))

(assert (= (and b!612490 res!393978) b!612489))

(assert (= (and b!612489 res!393965) b!612487))

(assert (= (and b!612487 res!393972) b!612492))

(assert (= (and b!612492 res!393976) b!612481))

(assert (= (and b!612481 res!393970) b!612477))

(assert (= (and b!612477 res!393973) b!612480))

(assert (= (and b!612480 res!393980) b!612479))

(assert (= (and b!612479 res!393982) b!612474))

(assert (= (and b!612479 c!69622) b!612483))

(assert (= (and b!612479 (not c!69622)) b!612482))

(assert (= (and b!612479 (not res!393974)) b!612485))

(assert (= (and b!612485 res!393967) b!612493))

(assert (= (and b!612493 (not res!393966)) b!612486))

(assert (= (and b!612486 res!393979) b!612484))

(assert (= (and b!612485 (not res!393971)) b!612475))

(assert (= (and b!612475 c!69623) b!612473))

(assert (= (and b!612475 (not c!69623)) b!612491))

(assert (= (and b!612475 (not res!393968)) b!612472))

(assert (= (and b!612472 res!393977) b!612488))

(declare-fun m!589109 () Bool)

(assert (=> b!612487 m!589109))

(declare-fun m!589111 () Bool)

(assert (=> b!612480 m!589111))

(declare-fun m!589113 () Bool)

(assert (=> b!612480 m!589113))

(assert (=> b!612480 m!589113))

(declare-fun m!589115 () Bool)

(assert (=> b!612480 m!589115))

(declare-fun m!589117 () Bool)

(assert (=> b!612490 m!589117))

(assert (=> b!612472 m!589113))

(declare-fun m!589119 () Bool)

(assert (=> b!612472 m!589119))

(assert (=> b!612472 m!589113))

(declare-fun m!589121 () Bool)

(assert (=> b!612472 m!589121))

(assert (=> b!612472 m!589113))

(declare-fun m!589123 () Bool)

(assert (=> b!612472 m!589123))

(assert (=> b!612472 m!589113))

(declare-fun m!589125 () Bool)

(assert (=> b!612472 m!589125))

(declare-fun m!589127 () Bool)

(assert (=> b!612472 m!589127))

(declare-fun m!589129 () Bool)

(assert (=> b!612477 m!589129))

(declare-fun m!589131 () Bool)

(assert (=> b!612477 m!589131))

(declare-fun m!589133 () Bool)

(assert (=> b!612478 m!589133))

(declare-fun m!589135 () Bool)

(assert (=> b!612492 m!589135))

(assert (=> b!612476 m!589113))

(assert (=> b!612476 m!589113))

(declare-fun m!589137 () Bool)

(assert (=> b!612476 m!589137))

(declare-fun m!589139 () Bool)

(assert (=> start!55968 m!589139))

(declare-fun m!589141 () Bool)

(assert (=> start!55968 m!589141))

(assert (=> b!612484 m!589113))

(assert (=> b!612484 m!589113))

(declare-fun m!589143 () Bool)

(assert (=> b!612484 m!589143))

(assert (=> b!612493 m!589113))

(assert (=> b!612485 m!589113))

(assert (=> b!612485 m!589129))

(declare-fun m!589145 () Bool)

(assert (=> b!612485 m!589145))

(assert (=> b!612486 m!589113))

(assert (=> b!612486 m!589113))

(assert (=> b!612486 m!589123))

(assert (=> b!612473 m!589113))

(assert (=> b!612473 m!589113))

(declare-fun m!589147 () Bool)

(assert (=> b!612473 m!589147))

(assert (=> b!612473 m!589121))

(declare-fun m!589149 () Bool)

(assert (=> b!612473 m!589149))

(declare-fun m!589151 () Bool)

(assert (=> b!612473 m!589151))

(assert (=> b!612473 m!589127))

(assert (=> b!612473 m!589113))

(declare-fun m!589153 () Bool)

(assert (=> b!612473 m!589153))

(assert (=> b!612473 m!589113))

(declare-fun m!589155 () Bool)

(assert (=> b!612473 m!589155))

(declare-fun m!589157 () Bool)

(assert (=> b!612481 m!589157))

(assert (=> b!612488 m!589113))

(assert (=> b!612488 m!589113))

(assert (=> b!612488 m!589143))

(declare-fun m!589159 () Bool)

(assert (=> b!612479 m!589159))

(declare-fun m!589161 () Bool)

(assert (=> b!612479 m!589161))

(assert (=> b!612479 m!589129))

(assert (=> b!612479 m!589113))

(declare-fun m!589163 () Bool)

(assert (=> b!612479 m!589163))

(assert (=> b!612479 m!589113))

(declare-fun m!589165 () Bool)

(assert (=> b!612479 m!589165))

(declare-fun m!589167 () Bool)

(assert (=> b!612479 m!589167))

(declare-fun m!589169 () Bool)

(assert (=> b!612479 m!589169))

(declare-fun m!589171 () Bool)

(assert (=> b!612489 m!589171))

(check-sat (not b!612484) (not b!612476) (not b!612489) (not b!612490) (not b!612486) (not b!612480) (not b!612478) (not b!612492) (not b!612472) (not b!612488) (not start!55968) (not b!612479) (not b!612487) (not b!612473))
(check-sat)
