; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55124 () Bool)

(assert start!55124)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!603478 () Bool)

(declare-datatypes ((array!37197 0))(
  ( (array!37198 (arr!17855 (Array (_ BitVec 32) (_ BitVec 64))) (size!18219 (_ BitVec 32))) )
))
(declare-fun lt!275031 () array!37197)

(declare-fun e!345228 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37197)

(declare-fun arrayContainsKey!0 (array!37197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!603478 (= e!345228 (arrayContainsKey!0 lt!275031 (select (arr!17855 a!2986) j!136) index!984))))

(declare-fun b!603479 () Bool)

(declare-datatypes ((Unit!19150 0))(
  ( (Unit!19151) )
))
(declare-fun e!345237 () Unit!19150)

(declare-fun Unit!19152 () Unit!19150)

(assert (=> b!603479 (= e!345237 Unit!19152)))

(declare-fun b!603480 () Bool)

(declare-fun res!387578 () Bool)

(declare-fun e!345239 () Bool)

(assert (=> b!603480 (=> (not res!387578) (not e!345239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603480 (= res!387578 (validKeyInArray!0 (select (arr!17855 a!2986) j!136)))))

(declare-fun b!603481 () Bool)

(declare-fun res!387574 () Bool)

(assert (=> b!603481 (=> (not res!387574) (not e!345239))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!603481 (= res!387574 (validKeyInArray!0 k!1786))))

(declare-fun b!603482 () Bool)

(declare-fun e!345233 () Bool)

(declare-fun e!345231 () Bool)

(assert (=> b!603482 (= e!345233 (not e!345231))))

(declare-fun res!387571 () Bool)

(assert (=> b!603482 (=> res!387571 e!345231)))

(declare-datatypes ((SeekEntryResult!6295 0))(
  ( (MissingZero!6295 (index!27443 (_ BitVec 32))) (Found!6295 (index!27444 (_ BitVec 32))) (Intermediate!6295 (undefined!7107 Bool) (index!27445 (_ BitVec 32)) (x!56240 (_ BitVec 32))) (Undefined!6295) (MissingVacant!6295 (index!27446 (_ BitVec 32))) )
))
(declare-fun lt!275020 () SeekEntryResult!6295)

(assert (=> b!603482 (= res!387571 (not (= lt!275020 (Found!6295 index!984))))))

(declare-fun lt!275023 () Unit!19150)

(declare-fun e!345235 () Unit!19150)

(assert (=> b!603482 (= lt!275023 e!345235)))

(declare-fun c!68324 () Bool)

(assert (=> b!603482 (= c!68324 (= lt!275020 Undefined!6295))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!275028 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37197 (_ BitVec 32)) SeekEntryResult!6295)

(assert (=> b!603482 (= lt!275020 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275028 lt!275031 mask!3053))))

(declare-fun e!345238 () Bool)

(assert (=> b!603482 e!345238))

(declare-fun res!387584 () Bool)

(assert (=> b!603482 (=> (not res!387584) (not e!345238))))

(declare-fun lt!275022 () (_ BitVec 32))

(declare-fun lt!275032 () SeekEntryResult!6295)

(assert (=> b!603482 (= res!387584 (= lt!275032 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275022 vacantSpotIndex!68 lt!275028 lt!275031 mask!3053)))))

(assert (=> b!603482 (= lt!275032 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275022 vacantSpotIndex!68 (select (arr!17855 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!603482 (= lt!275028 (select (store (arr!17855 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!275026 () Unit!19150)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37197 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19150)

(assert (=> b!603482 (= lt!275026 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275022 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603482 (= lt!275022 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!387569 () Bool)

(assert (=> start!55124 (=> (not res!387569) (not e!345239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55124 (= res!387569 (validMask!0 mask!3053))))

(assert (=> start!55124 e!345239))

(assert (=> start!55124 true))

(declare-fun array_inv!13651 (array!37197) Bool)

(assert (=> start!55124 (array_inv!13651 a!2986)))

(declare-fun b!603483 () Bool)

(declare-fun Unit!19153 () Unit!19150)

(assert (=> b!603483 (= e!345235 Unit!19153)))

(assert (=> b!603483 false))

(declare-fun b!603484 () Bool)

(declare-fun e!345232 () Bool)

(assert (=> b!603484 (= e!345239 e!345232)))

(declare-fun res!387581 () Bool)

(assert (=> b!603484 (=> (not res!387581) (not e!345232))))

(declare-fun lt!275029 () SeekEntryResult!6295)

(assert (=> b!603484 (= res!387581 (or (= lt!275029 (MissingZero!6295 i!1108)) (= lt!275029 (MissingVacant!6295 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37197 (_ BitVec 32)) SeekEntryResult!6295)

(assert (=> b!603484 (= lt!275029 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!603485 () Bool)

(declare-fun e!345227 () Bool)

(assert (=> b!603485 (= e!345227 e!345233)))

(declare-fun res!387572 () Bool)

(assert (=> b!603485 (=> (not res!387572) (not e!345233))))

(declare-fun lt!275027 () SeekEntryResult!6295)

(assert (=> b!603485 (= res!387572 (and (= lt!275027 (Found!6295 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17855 a!2986) index!984) (select (arr!17855 a!2986) j!136))) (not (= (select (arr!17855 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!603485 (= lt!275027 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17855 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!603486 () Bool)

(declare-fun e!345229 () Bool)

(declare-fun e!345236 () Bool)

(assert (=> b!603486 (= e!345229 e!345236)))

(declare-fun res!387582 () Bool)

(assert (=> b!603486 (=> res!387582 e!345236)))

(assert (=> b!603486 (= res!387582 (bvsge index!984 j!136))))

(declare-fun lt!275030 () Unit!19150)

(assert (=> b!603486 (= lt!275030 e!345237)))

(declare-fun c!68323 () Bool)

(assert (=> b!603486 (= c!68323 (bvslt j!136 index!984))))

(declare-fun b!603487 () Bool)

(declare-fun res!387575 () Bool)

(assert (=> b!603487 (=> (not res!387575) (not e!345232))))

(declare-datatypes ((List!11896 0))(
  ( (Nil!11893) (Cons!11892 (h!12937 (_ BitVec 64)) (t!18124 List!11896)) )
))
(declare-fun arrayNoDuplicates!0 (array!37197 (_ BitVec 32) List!11896) Bool)

(assert (=> b!603487 (= res!387575 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11893))))

(declare-fun b!603488 () Bool)

(assert (=> b!603488 (= e!345238 (= lt!275027 lt!275032))))

(declare-fun b!603489 () Bool)

(declare-fun Unit!19154 () Unit!19150)

(assert (=> b!603489 (= e!345235 Unit!19154)))

(declare-fun b!603490 () Bool)

(declare-fun Unit!19155 () Unit!19150)

(assert (=> b!603490 (= e!345237 Unit!19155)))

(declare-fun lt!275021 () Unit!19150)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37197 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19150)

(assert (=> b!603490 (= lt!275021 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275031 (select (arr!17855 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!603490 (arrayContainsKey!0 lt!275031 (select (arr!17855 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275025 () Unit!19150)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37197 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11896) Unit!19150)

(assert (=> b!603490 (= lt!275025 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11893))))

(assert (=> b!603490 (arrayNoDuplicates!0 lt!275031 #b00000000000000000000000000000000 Nil!11893)))

(declare-fun lt!275024 () Unit!19150)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37197 (_ BitVec 32) (_ BitVec 32)) Unit!19150)

(assert (=> b!603490 (= lt!275024 (lemmaNoDuplicateFromThenFromBigger!0 lt!275031 #b00000000000000000000000000000000 j!136))))

(assert (=> b!603490 (arrayNoDuplicates!0 lt!275031 j!136 Nil!11893)))

(declare-fun lt!275018 () Unit!19150)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37197 (_ BitVec 64) (_ BitVec 32) List!11896) Unit!19150)

(assert (=> b!603490 (= lt!275018 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275031 (select (arr!17855 a!2986) j!136) j!136 Nil!11893))))

(assert (=> b!603490 false))

(declare-fun b!603491 () Bool)

(declare-fun res!387577 () Bool)

(assert (=> b!603491 (=> (not res!387577) (not e!345239))))

(assert (=> b!603491 (= res!387577 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603492 () Bool)

(declare-fun res!387573 () Bool)

(assert (=> b!603492 (=> (not res!387573) (not e!345232))))

(assert (=> b!603492 (= res!387573 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17855 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!603493 () Bool)

(assert (=> b!603493 (= e!345232 e!345227)))

(declare-fun res!387579 () Bool)

(assert (=> b!603493 (=> (not res!387579) (not e!345227))))

(assert (=> b!603493 (= res!387579 (= (select (store (arr!17855 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!603493 (= lt!275031 (array!37198 (store (arr!17855 a!2986) i!1108 k!1786) (size!18219 a!2986)))))

(declare-fun b!603494 () Bool)

(assert (=> b!603494 (= e!345231 e!345229)))

(declare-fun res!387580 () Bool)

(assert (=> b!603494 (=> res!387580 e!345229)))

(declare-fun lt!275019 () (_ BitVec 64))

(assert (=> b!603494 (= res!387580 (or (not (= (select (arr!17855 a!2986) j!136) lt!275028)) (not (= (select (arr!17855 a!2986) j!136) lt!275019))))))

(declare-fun e!345226 () Bool)

(assert (=> b!603494 e!345226))

(declare-fun res!387576 () Bool)

(assert (=> b!603494 (=> (not res!387576) (not e!345226))))

(assert (=> b!603494 (= res!387576 (= lt!275019 (select (arr!17855 a!2986) j!136)))))

(assert (=> b!603494 (= lt!275019 (select (store (arr!17855 a!2986) i!1108 k!1786) index!984))))

(declare-fun e!345234 () Bool)

(declare-fun b!603495 () Bool)

(assert (=> b!603495 (= e!345234 (arrayContainsKey!0 lt!275031 (select (arr!17855 a!2986) j!136) index!984))))

(declare-fun b!603496 () Bool)

(declare-fun e!345240 () Bool)

(assert (=> b!603496 (= e!345226 e!345240)))

(declare-fun res!387566 () Bool)

(assert (=> b!603496 (=> res!387566 e!345240)))

(assert (=> b!603496 (= res!387566 (or (not (= (select (arr!17855 a!2986) j!136) lt!275028)) (not (= (select (arr!17855 a!2986) j!136) lt!275019)) (bvsge j!136 index!984)))))

(declare-fun b!603497 () Bool)

(declare-fun res!387567 () Bool)

(assert (=> b!603497 (=> (not res!387567) (not e!345232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37197 (_ BitVec 32)) Bool)

(assert (=> b!603497 (= res!387567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!603498 () Bool)

(assert (=> b!603498 (= e!345240 e!345228)))

(declare-fun res!387583 () Bool)

(assert (=> b!603498 (=> (not res!387583) (not e!345228))))

(assert (=> b!603498 (= res!387583 (arrayContainsKey!0 lt!275031 (select (arr!17855 a!2986) j!136) j!136))))

(declare-fun b!603499 () Bool)

(declare-fun res!387570 () Bool)

(assert (=> b!603499 (=> (not res!387570) (not e!345239))))

(assert (=> b!603499 (= res!387570 (and (= (size!18219 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18219 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18219 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!603500 () Bool)

(assert (=> b!603500 (= e!345236 true)))

(assert (=> b!603500 e!345234))

(declare-fun res!387568 () Bool)

(assert (=> b!603500 (=> (not res!387568) (not e!345234))))

(assert (=> b!603500 (= res!387568 (arrayContainsKey!0 lt!275031 (select (arr!17855 a!2986) j!136) j!136))))

(assert (= (and start!55124 res!387569) b!603499))

(assert (= (and b!603499 res!387570) b!603480))

(assert (= (and b!603480 res!387578) b!603481))

(assert (= (and b!603481 res!387574) b!603491))

(assert (= (and b!603491 res!387577) b!603484))

(assert (= (and b!603484 res!387581) b!603497))

(assert (= (and b!603497 res!387567) b!603487))

(assert (= (and b!603487 res!387575) b!603492))

(assert (= (and b!603492 res!387573) b!603493))

(assert (= (and b!603493 res!387579) b!603485))

(assert (= (and b!603485 res!387572) b!603482))

(assert (= (and b!603482 res!387584) b!603488))

(assert (= (and b!603482 c!68324) b!603483))

(assert (= (and b!603482 (not c!68324)) b!603489))

(assert (= (and b!603482 (not res!387571)) b!603494))

(assert (= (and b!603494 res!387576) b!603496))

(assert (= (and b!603496 (not res!387566)) b!603498))

(assert (= (and b!603498 res!387583) b!603478))

(assert (= (and b!603494 (not res!387580)) b!603486))

(assert (= (and b!603486 c!68323) b!603490))

(assert (= (and b!603486 (not c!68323)) b!603479))

(assert (= (and b!603486 (not res!387582)) b!603500))

(assert (= (and b!603500 res!387568) b!603495))

(declare-fun m!580493 () Bool)

(assert (=> b!603494 m!580493))

(declare-fun m!580495 () Bool)

(assert (=> b!603494 m!580495))

(declare-fun m!580497 () Bool)

(assert (=> b!603494 m!580497))

(declare-fun m!580499 () Bool)

(assert (=> b!603497 m!580499))

(declare-fun m!580501 () Bool)

(assert (=> b!603491 m!580501))

(assert (=> b!603495 m!580493))

(assert (=> b!603495 m!580493))

(declare-fun m!580503 () Bool)

(assert (=> b!603495 m!580503))

(assert (=> b!603498 m!580493))

(assert (=> b!603498 m!580493))

(declare-fun m!580505 () Bool)

(assert (=> b!603498 m!580505))

(declare-fun m!580507 () Bool)

(assert (=> b!603482 m!580507))

(declare-fun m!580509 () Bool)

(assert (=> b!603482 m!580509))

(assert (=> b!603482 m!580493))

(declare-fun m!580511 () Bool)

(assert (=> b!603482 m!580511))

(assert (=> b!603482 m!580495))

(declare-fun m!580513 () Bool)

(assert (=> b!603482 m!580513))

(declare-fun m!580515 () Bool)

(assert (=> b!603482 m!580515))

(assert (=> b!603482 m!580493))

(declare-fun m!580517 () Bool)

(assert (=> b!603482 m!580517))

(declare-fun m!580519 () Bool)

(assert (=> b!603487 m!580519))

(declare-fun m!580521 () Bool)

(assert (=> b!603484 m!580521))

(declare-fun m!580523 () Bool)

(assert (=> start!55124 m!580523))

(declare-fun m!580525 () Bool)

(assert (=> start!55124 m!580525))

(declare-fun m!580527 () Bool)

(assert (=> b!603492 m!580527))

(assert (=> b!603478 m!580493))

(assert (=> b!603478 m!580493))

(assert (=> b!603478 m!580503))

(declare-fun m!580529 () Bool)

(assert (=> b!603485 m!580529))

(assert (=> b!603485 m!580493))

(assert (=> b!603485 m!580493))

(declare-fun m!580531 () Bool)

(assert (=> b!603485 m!580531))

(declare-fun m!580533 () Bool)

(assert (=> b!603490 m!580533))

(assert (=> b!603490 m!580493))

(assert (=> b!603490 m!580493))

(declare-fun m!580535 () Bool)

(assert (=> b!603490 m!580535))

(assert (=> b!603490 m!580493))

(declare-fun m!580537 () Bool)

(assert (=> b!603490 m!580537))

(assert (=> b!603490 m!580493))

(declare-fun m!580539 () Bool)

(assert (=> b!603490 m!580539))

(declare-fun m!580541 () Bool)

(assert (=> b!603490 m!580541))

(declare-fun m!580543 () Bool)

(assert (=> b!603490 m!580543))

(declare-fun m!580545 () Bool)

(assert (=> b!603490 m!580545))

(assert (=> b!603480 m!580493))

(assert (=> b!603480 m!580493))

(declare-fun m!580547 () Bool)

(assert (=> b!603480 m!580547))

(declare-fun m!580549 () Bool)

(assert (=> b!603481 m!580549))

(assert (=> b!603493 m!580495))

(declare-fun m!580551 () Bool)

(assert (=> b!603493 m!580551))

(assert (=> b!603496 m!580493))

(assert (=> b!603500 m!580493))

(assert (=> b!603500 m!580493))

(assert (=> b!603500 m!580505))

(push 1)

