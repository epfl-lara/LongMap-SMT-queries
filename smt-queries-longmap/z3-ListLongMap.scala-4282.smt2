; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59658 () Bool)

(assert start!59658)

(declare-fun b!659099 () Bool)

(assert (=> b!659099 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38754 0))(
  ( (array!38755 (arr!18571 (Array (_ BitVec 32) (_ BitVec 64))) (size!18935 (_ BitVec 32))) )
))
(declare-fun lt!308336 () array!38754)

(declare-datatypes ((Unit!22893 0))(
  ( (Unit!22894) )
))
(declare-fun lt!308342 () Unit!22893)

(declare-fun a!2986 () array!38754)

(declare-datatypes ((List!12519 0))(
  ( (Nil!12516) (Cons!12515 (h!13563 (_ BitVec 64)) (t!18739 List!12519)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38754 (_ BitVec 64) (_ BitVec 32) List!12519) Unit!22893)

(assert (=> b!659099 (= lt!308342 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308336 (select (arr!18571 a!2986) j!136) j!136 Nil!12516))))

(declare-fun arrayNoDuplicates!0 (array!38754 (_ BitVec 32) List!12519) Bool)

(assert (=> b!659099 (arrayNoDuplicates!0 lt!308336 j!136 Nil!12516)))

(declare-fun lt!308333 () Unit!22893)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38754 (_ BitVec 32) (_ BitVec 32)) Unit!22893)

(assert (=> b!659099 (= lt!308333 (lemmaNoDuplicateFromThenFromBigger!0 lt!308336 #b00000000000000000000000000000000 j!136))))

(assert (=> b!659099 (arrayNoDuplicates!0 lt!308336 #b00000000000000000000000000000000 Nil!12516)))

(declare-fun lt!308346 () Unit!22893)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38754 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12519) Unit!22893)

(assert (=> b!659099 (= lt!308346 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12516))))

(declare-fun arrayContainsKey!0 (array!38754 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!659099 (arrayContainsKey!0 lt!308336 (select (arr!18571 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!308347 () Unit!22893)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38754 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22893)

(assert (=> b!659099 (= lt!308347 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308336 (select (arr!18571 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!378652 () Unit!22893)

(declare-fun Unit!22895 () Unit!22893)

(assert (=> b!659099 (= e!378652 Unit!22895)))

(declare-fun b!659100 () Bool)

(declare-fun e!378657 () Bool)

(assert (=> b!659100 (= e!378657 (not true))))

(declare-fun lt!308340 () Unit!22893)

(declare-fun e!378659 () Unit!22893)

(assert (=> b!659100 (= lt!308340 e!378659)))

(declare-fun c!76223 () Bool)

(declare-datatypes ((SeekEntryResult!6967 0))(
  ( (MissingZero!6967 (index!30233 (_ BitVec 32))) (Found!6967 (index!30234 (_ BitVec 32))) (Intermediate!6967 (undefined!7779 Bool) (index!30235 (_ BitVec 32)) (x!59173 (_ BitVec 32))) (Undefined!6967) (MissingVacant!6967 (index!30236 (_ BitVec 32))) )
))
(declare-fun lt!308345 () SeekEntryResult!6967)

(assert (=> b!659100 (= c!76223 (= lt!308345 (Found!6967 index!984)))))

(declare-fun lt!308349 () Unit!22893)

(declare-fun e!378653 () Unit!22893)

(assert (=> b!659100 (= lt!308349 e!378653)))

(declare-fun c!76220 () Bool)

(assert (=> b!659100 (= c!76220 (= lt!308345 Undefined!6967))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!308331 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38754 (_ BitVec 32)) SeekEntryResult!6967)

(assert (=> b!659100 (= lt!308345 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!308331 lt!308336 mask!3053))))

(declare-fun e!378656 () Bool)

(assert (=> b!659100 e!378656))

(declare-fun res!427410 () Bool)

(assert (=> b!659100 (=> (not res!427410) (not e!378656))))

(declare-fun lt!308332 () SeekEntryResult!6967)

(declare-fun lt!308343 () (_ BitVec 32))

(assert (=> b!659100 (= res!427410 (= lt!308332 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308343 vacantSpotIndex!68 lt!308331 lt!308336 mask!3053)))))

(assert (=> b!659100 (= lt!308332 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308343 vacantSpotIndex!68 (select (arr!18571 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!659100 (= lt!308331 (select (store (arr!18571 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!308344 () Unit!22893)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38754 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22893)

(assert (=> b!659100 (= lt!308344 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!308343 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!659100 (= lt!308343 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!659101 () Bool)

(declare-fun Unit!22896 () Unit!22893)

(assert (=> b!659101 (= e!378659 Unit!22896)))

(declare-fun b!659102 () Bool)

(declare-fun res!427406 () Bool)

(declare-fun e!378651 () Bool)

(assert (=> b!659102 (=> (not res!427406) (not e!378651))))

(assert (=> b!659102 (= res!427406 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18571 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659103 () Bool)

(declare-fun res!427399 () Bool)

(assert (=> b!659103 (=> (not res!427399) (not e!378651))))

(assert (=> b!659103 (= res!427399 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12516))))

(declare-fun b!659104 () Bool)

(declare-fun e!378663 () Bool)

(assert (=> b!659104 (= e!378663 e!378657)))

(declare-fun res!427405 () Bool)

(assert (=> b!659104 (=> (not res!427405) (not e!378657))))

(declare-fun lt!308334 () SeekEntryResult!6967)

(assert (=> b!659104 (= res!427405 (and (= lt!308334 (Found!6967 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18571 a!2986) index!984) (select (arr!18571 a!2986) j!136))) (not (= (select (arr!18571 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!659104 (= lt!308334 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18571 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!659105 () Bool)

(declare-fun res!427398 () Bool)

(declare-fun e!378661 () Bool)

(assert (=> b!659105 (=> (not res!427398) (not e!378661))))

(assert (=> b!659105 (= res!427398 (and (= (size!18935 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18935 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18935 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!659106 () Bool)

(declare-fun res!427402 () Bool)

(assert (=> b!659106 (=> (not res!427402) (not e!378661))))

(assert (=> b!659106 (= res!427402 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!659107 () Bool)

(declare-fun res!427403 () Bool)

(assert (=> b!659107 (=> (not res!427403) (not e!378661))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!659107 (= res!427403 (validKeyInArray!0 k0!1786))))

(declare-fun b!659108 () Bool)

(declare-fun Unit!22897 () Unit!22893)

(assert (=> b!659108 (= e!378653 Unit!22897)))

(declare-fun b!659109 () Bool)

(declare-fun e!378655 () Bool)

(assert (=> b!659109 (= e!378655 (arrayContainsKey!0 lt!308336 (select (arr!18571 a!2986) j!136) index!984))))

(declare-fun b!659110 () Bool)

(declare-fun res!427404 () Bool)

(assert (=> b!659110 (= res!427404 (arrayContainsKey!0 lt!308336 (select (arr!18571 a!2986) j!136) j!136))))

(assert (=> b!659110 (=> (not res!427404) (not e!378655))))

(declare-fun e!378660 () Bool)

(assert (=> b!659110 (= e!378660 e!378655)))

(declare-fun b!659111 () Bool)

(declare-fun res!427396 () Bool)

(assert (=> b!659111 (=> (not res!427396) (not e!378651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38754 (_ BitVec 32)) Bool)

(assert (=> b!659111 (= res!427396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!659112 () Bool)

(assert (=> b!659112 (= e!378661 e!378651)))

(declare-fun res!427397 () Bool)

(assert (=> b!659112 (=> (not res!427397) (not e!378651))))

(declare-fun lt!308350 () SeekEntryResult!6967)

(assert (=> b!659112 (= res!427397 (or (= lt!308350 (MissingZero!6967 i!1108)) (= lt!308350 (MissingVacant!6967 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38754 (_ BitVec 32)) SeekEntryResult!6967)

(assert (=> b!659112 (= lt!308350 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!659113 () Bool)

(assert (=> b!659113 (= e!378651 e!378663)))

(declare-fun res!427409 () Bool)

(assert (=> b!659113 (=> (not res!427409) (not e!378663))))

(assert (=> b!659113 (= res!427409 (= (select (store (arr!18571 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!659113 (= lt!308336 (array!38755 (store (arr!18571 a!2986) i!1108 k0!1786) (size!18935 a!2986)))))

(declare-fun b!659114 () Bool)

(declare-fun e!378654 () Unit!22893)

(declare-fun Unit!22898 () Unit!22893)

(assert (=> b!659114 (= e!378654 Unit!22898)))

(declare-fun b!659115 () Bool)

(declare-fun Unit!22899 () Unit!22893)

(assert (=> b!659115 (= e!378653 Unit!22899)))

(assert (=> b!659115 false))

(declare-fun b!659116 () Bool)

(declare-fun res!427407 () Bool)

(assert (=> b!659116 (= res!427407 (bvsge j!136 index!984))))

(assert (=> b!659116 (=> res!427407 e!378660)))

(declare-fun e!378662 () Bool)

(assert (=> b!659116 (= e!378662 e!378660)))

(declare-fun b!659117 () Bool)

(assert (=> b!659117 false))

(declare-fun lt!308338 () Unit!22893)

(assert (=> b!659117 (= lt!308338 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308336 (select (arr!18571 a!2986) j!136) index!984 Nil!12516))))

(assert (=> b!659117 (arrayNoDuplicates!0 lt!308336 index!984 Nil!12516)))

(declare-fun lt!308339 () Unit!22893)

(assert (=> b!659117 (= lt!308339 (lemmaNoDuplicateFromThenFromBigger!0 lt!308336 #b00000000000000000000000000000000 index!984))))

(assert (=> b!659117 (arrayNoDuplicates!0 lt!308336 #b00000000000000000000000000000000 Nil!12516)))

(declare-fun lt!308341 () Unit!22893)

(assert (=> b!659117 (= lt!308341 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12516))))

(assert (=> b!659117 (arrayContainsKey!0 lt!308336 (select (arr!18571 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!308335 () Unit!22893)

(assert (=> b!659117 (= lt!308335 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308336 (select (arr!18571 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!378658 () Bool)

(assert (=> b!659117 e!378658))

(declare-fun res!427411 () Bool)

(assert (=> b!659117 (=> (not res!427411) (not e!378658))))

(assert (=> b!659117 (= res!427411 (arrayContainsKey!0 lt!308336 (select (arr!18571 a!2986) j!136) j!136))))

(declare-fun Unit!22900 () Unit!22893)

(assert (=> b!659117 (= e!378654 Unit!22900)))

(declare-fun b!659118 () Bool)

(assert (=> b!659118 (= e!378656 (= lt!308334 lt!308332))))

(declare-fun b!659119 () Bool)

(assert (=> b!659119 (= e!378658 (arrayContainsKey!0 lt!308336 (select (arr!18571 a!2986) j!136) index!984))))

(declare-fun b!659120 () Bool)

(declare-fun res!427401 () Bool)

(assert (=> b!659120 (=> (not res!427401) (not e!378661))))

(assert (=> b!659120 (= res!427401 (validKeyInArray!0 (select (arr!18571 a!2986) j!136)))))

(declare-fun b!659121 () Bool)

(declare-fun Unit!22901 () Unit!22893)

(assert (=> b!659121 (= e!378652 Unit!22901)))

(declare-fun res!427400 () Bool)

(assert (=> start!59658 (=> (not res!427400) (not e!378661))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59658 (= res!427400 (validMask!0 mask!3053))))

(assert (=> start!59658 e!378661))

(assert (=> start!59658 true))

(declare-fun array_inv!14430 (array!38754) Bool)

(assert (=> start!59658 (array_inv!14430 a!2986)))

(declare-fun b!659122 () Bool)

(declare-fun Unit!22902 () Unit!22893)

(assert (=> b!659122 (= e!378659 Unit!22902)))

(declare-fun res!427408 () Bool)

(assert (=> b!659122 (= res!427408 (= (select (store (arr!18571 a!2986) i!1108 k0!1786) index!984) (select (arr!18571 a!2986) j!136)))))

(assert (=> b!659122 (=> (not res!427408) (not e!378662))))

(assert (=> b!659122 e!378662))

(declare-fun c!76221 () Bool)

(assert (=> b!659122 (= c!76221 (bvslt j!136 index!984))))

(declare-fun lt!308348 () Unit!22893)

(assert (=> b!659122 (= lt!308348 e!378652)))

(declare-fun c!76222 () Bool)

(assert (=> b!659122 (= c!76222 (bvslt index!984 j!136))))

(declare-fun lt!308337 () Unit!22893)

(assert (=> b!659122 (= lt!308337 e!378654)))

(assert (=> b!659122 false))

(assert (= (and start!59658 res!427400) b!659105))

(assert (= (and b!659105 res!427398) b!659120))

(assert (= (and b!659120 res!427401) b!659107))

(assert (= (and b!659107 res!427403) b!659106))

(assert (= (and b!659106 res!427402) b!659112))

(assert (= (and b!659112 res!427397) b!659111))

(assert (= (and b!659111 res!427396) b!659103))

(assert (= (and b!659103 res!427399) b!659102))

(assert (= (and b!659102 res!427406) b!659113))

(assert (= (and b!659113 res!427409) b!659104))

(assert (= (and b!659104 res!427405) b!659100))

(assert (= (and b!659100 res!427410) b!659118))

(assert (= (and b!659100 c!76220) b!659115))

(assert (= (and b!659100 (not c!76220)) b!659108))

(assert (= (and b!659100 c!76223) b!659122))

(assert (= (and b!659100 (not c!76223)) b!659101))

(assert (= (and b!659122 res!427408) b!659116))

(assert (= (and b!659116 (not res!427407)) b!659110))

(assert (= (and b!659110 res!427404) b!659109))

(assert (= (and b!659122 c!76221) b!659099))

(assert (= (and b!659122 (not c!76221)) b!659121))

(assert (= (and b!659122 c!76222) b!659117))

(assert (= (and b!659122 (not c!76222)) b!659114))

(assert (= (and b!659117 res!427411) b!659119))

(declare-fun m!632539 () Bool)

(assert (=> b!659102 m!632539))

(declare-fun m!632541 () Bool)

(assert (=> b!659119 m!632541))

(assert (=> b!659119 m!632541))

(declare-fun m!632543 () Bool)

(assert (=> b!659119 m!632543))

(assert (=> b!659120 m!632541))

(assert (=> b!659120 m!632541))

(declare-fun m!632545 () Bool)

(assert (=> b!659120 m!632545))

(declare-fun m!632547 () Bool)

(assert (=> start!59658 m!632547))

(declare-fun m!632549 () Bool)

(assert (=> start!59658 m!632549))

(declare-fun m!632551 () Bool)

(assert (=> b!659112 m!632551))

(declare-fun m!632553 () Bool)

(assert (=> b!659113 m!632553))

(declare-fun m!632555 () Bool)

(assert (=> b!659113 m!632555))

(declare-fun m!632557 () Bool)

(assert (=> b!659104 m!632557))

(assert (=> b!659104 m!632541))

(assert (=> b!659104 m!632541))

(declare-fun m!632559 () Bool)

(assert (=> b!659104 m!632559))

(assert (=> b!659109 m!632541))

(assert (=> b!659109 m!632541))

(assert (=> b!659109 m!632543))

(declare-fun m!632561 () Bool)

(assert (=> b!659100 m!632561))

(declare-fun m!632563 () Bool)

(assert (=> b!659100 m!632563))

(assert (=> b!659100 m!632541))

(assert (=> b!659100 m!632553))

(declare-fun m!632565 () Bool)

(assert (=> b!659100 m!632565))

(declare-fun m!632567 () Bool)

(assert (=> b!659100 m!632567))

(assert (=> b!659100 m!632541))

(declare-fun m!632569 () Bool)

(assert (=> b!659100 m!632569))

(declare-fun m!632571 () Bool)

(assert (=> b!659100 m!632571))

(declare-fun m!632573 () Bool)

(assert (=> b!659099 m!632573))

(assert (=> b!659099 m!632541))

(declare-fun m!632575 () Bool)

(assert (=> b!659099 m!632575))

(assert (=> b!659099 m!632541))

(declare-fun m!632577 () Bool)

(assert (=> b!659099 m!632577))

(declare-fun m!632579 () Bool)

(assert (=> b!659099 m!632579))

(assert (=> b!659099 m!632541))

(declare-fun m!632581 () Bool)

(assert (=> b!659099 m!632581))

(declare-fun m!632583 () Bool)

(assert (=> b!659099 m!632583))

(assert (=> b!659099 m!632541))

(declare-fun m!632585 () Bool)

(assert (=> b!659099 m!632585))

(assert (=> b!659117 m!632573))

(assert (=> b!659117 m!632541))

(declare-fun m!632587 () Bool)

(assert (=> b!659117 m!632587))

(declare-fun m!632589 () Bool)

(assert (=> b!659117 m!632589))

(assert (=> b!659117 m!632541))

(assert (=> b!659117 m!632541))

(declare-fun m!632591 () Bool)

(assert (=> b!659117 m!632591))

(declare-fun m!632593 () Bool)

(assert (=> b!659117 m!632593))

(assert (=> b!659117 m!632541))

(declare-fun m!632595 () Bool)

(assert (=> b!659117 m!632595))

(assert (=> b!659117 m!632541))

(declare-fun m!632597 () Bool)

(assert (=> b!659117 m!632597))

(assert (=> b!659117 m!632583))

(assert (=> b!659122 m!632553))

(declare-fun m!632599 () Bool)

(assert (=> b!659122 m!632599))

(assert (=> b!659122 m!632541))

(assert (=> b!659110 m!632541))

(assert (=> b!659110 m!632541))

(assert (=> b!659110 m!632597))

(declare-fun m!632601 () Bool)

(assert (=> b!659111 m!632601))

(declare-fun m!632603 () Bool)

(assert (=> b!659107 m!632603))

(declare-fun m!632605 () Bool)

(assert (=> b!659106 m!632605))

(declare-fun m!632607 () Bool)

(assert (=> b!659103 m!632607))

(check-sat (not b!659104) (not b!659099) (not b!659100) (not b!659103) (not b!659107) (not b!659112) (not b!659117) (not b!659109) (not b!659120) (not b!659110) (not start!59658) (not b!659106) (not b!659119) (not b!659111))
(check-sat)
