; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55554 () Bool)

(assert start!55554)

(declare-fun b!607620 () Bool)

(declare-fun e!347970 () Bool)

(declare-fun e!347973 () Bool)

(assert (=> b!607620 (= e!347970 e!347973)))

(declare-fun res!390412 () Bool)

(assert (=> b!607620 (=> (not res!390412) (not e!347973))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37285 0))(
  ( (array!37286 (arr!17893 (Array (_ BitVec 32) (_ BitVec 64))) (size!18257 (_ BitVec 32))) )
))
(declare-fun lt!277440 () array!37285)

(declare-fun a!2986 () array!37285)

(declare-fun arrayContainsKey!0 (array!37285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!607620 (= res!390412 (arrayContainsKey!0 lt!277440 (select (arr!17893 a!2986) j!136) j!136))))

(declare-fun b!607622 () Bool)

(declare-fun res!390417 () Bool)

(declare-fun e!347966 () Bool)

(assert (=> b!607622 (=> (not res!390417) (not e!347966))))

(declare-datatypes ((List!11934 0))(
  ( (Nil!11931) (Cons!11930 (h!12975 (_ BitVec 64)) (t!18162 List!11934)) )
))
(declare-fun arrayNoDuplicates!0 (array!37285 (_ BitVec 32) List!11934) Bool)

(assert (=> b!607622 (= res!390417 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11931))))

(declare-fun b!607623 () Bool)

(declare-fun res!390415 () Bool)

(assert (=> b!607623 (=> (not res!390415) (not e!347966))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!607623 (= res!390415 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17893 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!607624 () Bool)

(declare-fun e!347962 () Bool)

(declare-fun e!347969 () Bool)

(assert (=> b!607624 (= e!347962 (not e!347969))))

(declare-fun res!390418 () Bool)

(assert (=> b!607624 (=> res!390418 e!347969)))

(declare-datatypes ((SeekEntryResult!6333 0))(
  ( (MissingZero!6333 (index!27607 (_ BitVec 32))) (Found!6333 (index!27608 (_ BitVec 32))) (Intermediate!6333 (undefined!7145 Bool) (index!27609 (_ BitVec 32)) (x!56418 (_ BitVec 32))) (Undefined!6333) (MissingVacant!6333 (index!27610 (_ BitVec 32))) )
))
(declare-fun lt!277451 () SeekEntryResult!6333)

(assert (=> b!607624 (= res!390418 (not (= lt!277451 (Found!6333 index!984))))))

(declare-datatypes ((Unit!19378 0))(
  ( (Unit!19379) )
))
(declare-fun lt!277448 () Unit!19378)

(declare-fun e!347965 () Unit!19378)

(assert (=> b!607624 (= lt!277448 e!347965)))

(declare-fun c!68971 () Bool)

(assert (=> b!607624 (= c!68971 (= lt!277451 Undefined!6333))))

(declare-fun lt!277447 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37285 (_ BitVec 32)) SeekEntryResult!6333)

(assert (=> b!607624 (= lt!277451 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277447 lt!277440 mask!3053))))

(declare-fun e!347967 () Bool)

(assert (=> b!607624 e!347967))

(declare-fun res!390413 () Bool)

(assert (=> b!607624 (=> (not res!390413) (not e!347967))))

(declare-fun lt!277450 () (_ BitVec 32))

(declare-fun lt!277443 () SeekEntryResult!6333)

(assert (=> b!607624 (= res!390413 (= lt!277443 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277450 vacantSpotIndex!68 lt!277447 lt!277440 mask!3053)))))

(assert (=> b!607624 (= lt!277443 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277450 vacantSpotIndex!68 (select (arr!17893 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!607624 (= lt!277447 (select (store (arr!17893 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!277449 () Unit!19378)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37285 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19378)

(assert (=> b!607624 (= lt!277449 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277450 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!607624 (= lt!277450 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!607625 () Bool)

(declare-fun e!347961 () Bool)

(assert (=> b!607625 (= e!347961 e!347966)))

(declare-fun res!390421 () Bool)

(assert (=> b!607625 (=> (not res!390421) (not e!347966))))

(declare-fun lt!277446 () SeekEntryResult!6333)

(assert (=> b!607625 (= res!390421 (or (= lt!277446 (MissingZero!6333 i!1108)) (= lt!277446 (MissingVacant!6333 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37285 (_ BitVec 32)) SeekEntryResult!6333)

(assert (=> b!607625 (= lt!277446 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!607626 () Bool)

(declare-fun res!390430 () Bool)

(assert (=> b!607626 (=> (not res!390430) (not e!347966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37285 (_ BitVec 32)) Bool)

(assert (=> b!607626 (= res!390430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!607627 () Bool)

(declare-fun res!390428 () Bool)

(assert (=> b!607627 (=> (not res!390428) (not e!347961))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!607627 (= res!390428 (validKeyInArray!0 k0!1786))))

(declare-fun b!607628 () Bool)

(declare-fun e!347968 () Bool)

(assert (=> b!607628 (= e!347966 e!347968)))

(declare-fun res!390426 () Bool)

(assert (=> b!607628 (=> (not res!390426) (not e!347968))))

(assert (=> b!607628 (= res!390426 (= (select (store (arr!17893 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!607628 (= lt!277440 (array!37286 (store (arr!17893 a!2986) i!1108 k0!1786) (size!18257 a!2986)))))

(declare-fun b!607629 () Bool)

(declare-fun e!347960 () Bool)

(declare-fun e!347963 () Bool)

(assert (=> b!607629 (= e!347960 e!347963)))

(declare-fun res!390429 () Bool)

(assert (=> b!607629 (=> res!390429 e!347963)))

(assert (=> b!607629 (= res!390429 (or (bvsge (size!18257 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18257 a!2986))))))

(assert (=> b!607629 (arrayContainsKey!0 lt!277440 (select (arr!17893 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277453 () Unit!19378)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37285 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19378)

(assert (=> b!607629 (= lt!277453 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277440 (select (arr!17893 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!347959 () Bool)

(assert (=> b!607629 e!347959))

(declare-fun res!390419 () Bool)

(assert (=> b!607629 (=> (not res!390419) (not e!347959))))

(assert (=> b!607629 (= res!390419 (arrayContainsKey!0 lt!277440 (select (arr!17893 a!2986) j!136) j!136))))

(declare-fun b!607630 () Bool)

(declare-fun Unit!19380 () Unit!19378)

(assert (=> b!607630 (= e!347965 Unit!19380)))

(declare-fun b!607631 () Bool)

(declare-fun res!390432 () Bool)

(assert (=> b!607631 (=> res!390432 e!347963)))

(declare-fun noDuplicate!316 (List!11934) Bool)

(assert (=> b!607631 (= res!390432 (not (noDuplicate!316 Nil!11931)))))

(declare-fun res!390416 () Bool)

(assert (=> start!55554 (=> (not res!390416) (not e!347961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55554 (= res!390416 (validMask!0 mask!3053))))

(assert (=> start!55554 e!347961))

(assert (=> start!55554 true))

(declare-fun array_inv!13689 (array!37285) Bool)

(assert (=> start!55554 (array_inv!13689 a!2986)))

(declare-fun b!607621 () Bool)

(declare-fun res!390427 () Bool)

(assert (=> b!607621 (=> (not res!390427) (not e!347961))))

(assert (=> b!607621 (= res!390427 (and (= (size!18257 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18257 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18257 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!607632 () Bool)

(declare-fun lt!277441 () SeekEntryResult!6333)

(assert (=> b!607632 (= e!347967 (= lt!277441 lt!277443))))

(declare-fun b!607633 () Bool)

(declare-fun e!347964 () Bool)

(assert (=> b!607633 (= e!347969 e!347964)))

(declare-fun res!390422 () Bool)

(assert (=> b!607633 (=> res!390422 e!347964)))

(declare-fun lt!277452 () (_ BitVec 64))

(assert (=> b!607633 (= res!390422 (or (not (= (select (arr!17893 a!2986) j!136) lt!277447)) (not (= (select (arr!17893 a!2986) j!136) lt!277452))))))

(declare-fun e!347958 () Bool)

(assert (=> b!607633 e!347958))

(declare-fun res!390433 () Bool)

(assert (=> b!607633 (=> (not res!390433) (not e!347958))))

(assert (=> b!607633 (= res!390433 (= lt!277452 (select (arr!17893 a!2986) j!136)))))

(assert (=> b!607633 (= lt!277452 (select (store (arr!17893 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!607634 () Bool)

(declare-fun Unit!19381 () Unit!19378)

(assert (=> b!607634 (= e!347965 Unit!19381)))

(assert (=> b!607634 false))

(declare-fun b!607635 () Bool)

(assert (=> b!607635 (= e!347959 (arrayContainsKey!0 lt!277440 (select (arr!17893 a!2986) j!136) index!984))))

(declare-fun b!607636 () Bool)

(assert (=> b!607636 (= e!347958 e!347970)))

(declare-fun res!390423 () Bool)

(assert (=> b!607636 (=> res!390423 e!347970)))

(assert (=> b!607636 (= res!390423 (or (not (= (select (arr!17893 a!2986) j!136) lt!277447)) (not (= (select (arr!17893 a!2986) j!136) lt!277452)) (bvsge j!136 index!984)))))

(declare-fun b!607637 () Bool)

(declare-fun res!390431 () Bool)

(assert (=> b!607637 (=> (not res!390431) (not e!347961))))

(assert (=> b!607637 (= res!390431 (validKeyInArray!0 (select (arr!17893 a!2986) j!136)))))

(declare-fun b!607638 () Bool)

(assert (=> b!607638 (= e!347964 e!347960)))

(declare-fun res!390434 () Bool)

(assert (=> b!607638 (=> res!390434 e!347960)))

(assert (=> b!607638 (= res!390434 (bvsge index!984 j!136))))

(declare-fun lt!277442 () Unit!19378)

(declare-fun e!347971 () Unit!19378)

(assert (=> b!607638 (= lt!277442 e!347971)))

(declare-fun c!68972 () Bool)

(assert (=> b!607638 (= c!68972 (bvslt j!136 index!984))))

(declare-fun b!607639 () Bool)

(declare-fun Unit!19382 () Unit!19378)

(assert (=> b!607639 (= e!347971 Unit!19382)))

(declare-fun b!607640 () Bool)

(declare-fun res!390414 () Bool)

(assert (=> b!607640 (=> (not res!390414) (not e!347961))))

(assert (=> b!607640 (= res!390414 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!607641 () Bool)

(assert (=> b!607641 (= e!347973 (arrayContainsKey!0 lt!277440 (select (arr!17893 a!2986) j!136) index!984))))

(declare-fun b!607642 () Bool)

(declare-fun Unit!19383 () Unit!19378)

(assert (=> b!607642 (= e!347971 Unit!19383)))

(declare-fun lt!277444 () Unit!19378)

(assert (=> b!607642 (= lt!277444 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277440 (select (arr!17893 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!607642 (arrayContainsKey!0 lt!277440 (select (arr!17893 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277437 () Unit!19378)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37285 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11934) Unit!19378)

(assert (=> b!607642 (= lt!277437 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11931))))

(assert (=> b!607642 (arrayNoDuplicates!0 lt!277440 #b00000000000000000000000000000000 Nil!11931)))

(declare-fun lt!277439 () Unit!19378)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37285 (_ BitVec 32) (_ BitVec 32)) Unit!19378)

(assert (=> b!607642 (= lt!277439 (lemmaNoDuplicateFromThenFromBigger!0 lt!277440 #b00000000000000000000000000000000 j!136))))

(assert (=> b!607642 (arrayNoDuplicates!0 lt!277440 j!136 Nil!11931)))

(declare-fun lt!277445 () Unit!19378)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37285 (_ BitVec 64) (_ BitVec 32) List!11934) Unit!19378)

(assert (=> b!607642 (= lt!277445 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277440 (select (arr!17893 a!2986) j!136) j!136 Nil!11931))))

(assert (=> b!607642 false))

(declare-fun b!607643 () Bool)

(declare-fun res!390424 () Bool)

(assert (=> b!607643 (=> res!390424 e!347963)))

(declare-fun contains!3010 (List!11934 (_ BitVec 64)) Bool)

(assert (=> b!607643 (= res!390424 (contains!3010 Nil!11931 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607644 () Bool)

(declare-fun res!390425 () Bool)

(assert (=> b!607644 (=> res!390425 e!347963)))

(assert (=> b!607644 (= res!390425 (contains!3010 Nil!11931 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607645 () Bool)

(assert (=> b!607645 (= e!347963 true)))

(declare-fun lt!277438 () Bool)

(assert (=> b!607645 (= lt!277438 (contains!3010 Nil!11931 k0!1786))))

(declare-fun b!607646 () Bool)

(assert (=> b!607646 (= e!347968 e!347962)))

(declare-fun res!390420 () Bool)

(assert (=> b!607646 (=> (not res!390420) (not e!347962))))

(assert (=> b!607646 (= res!390420 (and (= lt!277441 (Found!6333 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17893 a!2986) index!984) (select (arr!17893 a!2986) j!136))) (not (= (select (arr!17893 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!607646 (= lt!277441 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17893 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!55554 res!390416) b!607621))

(assert (= (and b!607621 res!390427) b!607637))

(assert (= (and b!607637 res!390431) b!607627))

(assert (= (and b!607627 res!390428) b!607640))

(assert (= (and b!607640 res!390414) b!607625))

(assert (= (and b!607625 res!390421) b!607626))

(assert (= (and b!607626 res!390430) b!607622))

(assert (= (and b!607622 res!390417) b!607623))

(assert (= (and b!607623 res!390415) b!607628))

(assert (= (and b!607628 res!390426) b!607646))

(assert (= (and b!607646 res!390420) b!607624))

(assert (= (and b!607624 res!390413) b!607632))

(assert (= (and b!607624 c!68971) b!607634))

(assert (= (and b!607624 (not c!68971)) b!607630))

(assert (= (and b!607624 (not res!390418)) b!607633))

(assert (= (and b!607633 res!390433) b!607636))

(assert (= (and b!607636 (not res!390423)) b!607620))

(assert (= (and b!607620 res!390412) b!607641))

(assert (= (and b!607633 (not res!390422)) b!607638))

(assert (= (and b!607638 c!68972) b!607642))

(assert (= (and b!607638 (not c!68972)) b!607639))

(assert (= (and b!607638 (not res!390434)) b!607629))

(assert (= (and b!607629 res!390419) b!607635))

(assert (= (and b!607629 (not res!390429)) b!607631))

(assert (= (and b!607631 (not res!390432)) b!607644))

(assert (= (and b!607644 (not res!390425)) b!607643))

(assert (= (and b!607643 (not res!390424)) b!607645))

(declare-fun m!584339 () Bool)

(assert (=> b!607623 m!584339))

(declare-fun m!584341 () Bool)

(assert (=> b!607628 m!584341))

(declare-fun m!584343 () Bool)

(assert (=> b!607628 m!584343))

(declare-fun m!584345 () Bool)

(assert (=> b!607642 m!584345))

(declare-fun m!584347 () Bool)

(assert (=> b!607642 m!584347))

(declare-fun m!584349 () Bool)

(assert (=> b!607642 m!584349))

(assert (=> b!607642 m!584345))

(declare-fun m!584351 () Bool)

(assert (=> b!607642 m!584351))

(declare-fun m!584353 () Bool)

(assert (=> b!607642 m!584353))

(assert (=> b!607642 m!584345))

(declare-fun m!584355 () Bool)

(assert (=> b!607642 m!584355))

(declare-fun m!584357 () Bool)

(assert (=> b!607642 m!584357))

(assert (=> b!607642 m!584345))

(declare-fun m!584359 () Bool)

(assert (=> b!607642 m!584359))

(assert (=> b!607636 m!584345))

(declare-fun m!584361 () Bool)

(assert (=> b!607624 m!584361))

(declare-fun m!584363 () Bool)

(assert (=> b!607624 m!584363))

(declare-fun m!584365 () Bool)

(assert (=> b!607624 m!584365))

(assert (=> b!607624 m!584345))

(declare-fun m!584367 () Bool)

(assert (=> b!607624 m!584367))

(assert (=> b!607624 m!584341))

(declare-fun m!584369 () Bool)

(assert (=> b!607624 m!584369))

(assert (=> b!607624 m!584345))

(declare-fun m!584371 () Bool)

(assert (=> b!607624 m!584371))

(assert (=> b!607620 m!584345))

(assert (=> b!607620 m!584345))

(declare-fun m!584373 () Bool)

(assert (=> b!607620 m!584373))

(declare-fun m!584375 () Bool)

(assert (=> b!607625 m!584375))

(declare-fun m!584377 () Bool)

(assert (=> b!607622 m!584377))

(assert (=> b!607637 m!584345))

(assert (=> b!607637 m!584345))

(declare-fun m!584379 () Bool)

(assert (=> b!607637 m!584379))

(declare-fun m!584381 () Bool)

(assert (=> b!607640 m!584381))

(declare-fun m!584383 () Bool)

(assert (=> b!607631 m!584383))

(declare-fun m!584385 () Bool)

(assert (=> b!607644 m!584385))

(declare-fun m!584387 () Bool)

(assert (=> start!55554 m!584387))

(declare-fun m!584389 () Bool)

(assert (=> start!55554 m!584389))

(assert (=> b!607629 m!584345))

(assert (=> b!607629 m!584345))

(declare-fun m!584391 () Bool)

(assert (=> b!607629 m!584391))

(assert (=> b!607629 m!584345))

(declare-fun m!584393 () Bool)

(assert (=> b!607629 m!584393))

(assert (=> b!607629 m!584345))

(assert (=> b!607629 m!584373))

(declare-fun m!584395 () Bool)

(assert (=> b!607626 m!584395))

(assert (=> b!607641 m!584345))

(assert (=> b!607641 m!584345))

(declare-fun m!584397 () Bool)

(assert (=> b!607641 m!584397))

(declare-fun m!584399 () Bool)

(assert (=> b!607646 m!584399))

(assert (=> b!607646 m!584345))

(assert (=> b!607646 m!584345))

(declare-fun m!584401 () Bool)

(assert (=> b!607646 m!584401))

(declare-fun m!584403 () Bool)

(assert (=> b!607645 m!584403))

(declare-fun m!584405 () Bool)

(assert (=> b!607627 m!584405))

(declare-fun m!584407 () Bool)

(assert (=> b!607643 m!584407))

(assert (=> b!607635 m!584345))

(assert (=> b!607635 m!584345))

(assert (=> b!607635 m!584397))

(assert (=> b!607633 m!584345))

(assert (=> b!607633 m!584341))

(declare-fun m!584409 () Bool)

(assert (=> b!607633 m!584409))

(check-sat (not b!607645) (not b!607627) (not b!607624) (not b!607637) (not b!607641) (not b!607622) (not b!607642) (not b!607644) (not b!607643) (not b!607620) (not start!55554) (not b!607646) (not b!607625) (not b!607635) (not b!607629) (not b!607626) (not b!607640) (not b!607631))
(check-sat)
