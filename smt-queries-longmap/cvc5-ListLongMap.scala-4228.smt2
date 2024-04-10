; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58136 () Bool)

(assert start!58136)

(declare-fun res!416305 () Bool)

(declare-fun e!368024 () Bool)

(assert (=> start!58136 (=> (not res!416305) (not e!368024))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58136 (= res!416305 (validMask!0 mask!3053))))

(assert (=> start!58136 e!368024))

(assert (=> start!58136 true))

(declare-datatypes ((array!38395 0))(
  ( (array!38396 (arr!18414 (Array (_ BitVec 32) (_ BitVec 64))) (size!18778 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38395)

(declare-fun array_inv!14210 (array!38395) Bool)

(assert (=> start!58136 (array_inv!14210 a!2986)))

(declare-fun b!642608 () Bool)

(declare-fun res!416306 () Bool)

(assert (=> b!642608 (=> (not res!416306) (not e!368024))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!642608 (= res!416306 (and (= (size!18778 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18778 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18778 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!642609 () Bool)

(declare-fun e!368028 () Bool)

(declare-fun e!368029 () Bool)

(assert (=> b!642609 (= e!368028 e!368029)))

(declare-fun res!416319 () Bool)

(assert (=> b!642609 (=> res!416319 e!368029)))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!642609 (= res!416319 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!21750 0))(
  ( (Unit!21751) )
))
(declare-fun lt!297638 () Unit!21750)

(declare-fun e!368019 () Unit!21750)

(assert (=> b!642609 (= lt!297638 e!368019)))

(declare-fun c!73519 () Bool)

(assert (=> b!642609 (= c!73519 (bvslt j!136 index!984))))

(declare-fun b!642610 () Bool)

(declare-fun e!368027 () Bool)

(declare-fun e!368023 () Bool)

(assert (=> b!642610 (= e!368027 (not e!368023))))

(declare-fun res!416316 () Bool)

(assert (=> b!642610 (=> res!416316 e!368023)))

(declare-datatypes ((SeekEntryResult!6854 0))(
  ( (MissingZero!6854 (index!29742 (_ BitVec 32))) (Found!6854 (index!29743 (_ BitVec 32))) (Intermediate!6854 (undefined!7666 Bool) (index!29744 (_ BitVec 32)) (x!58508 (_ BitVec 32))) (Undefined!6854) (MissingVacant!6854 (index!29745 (_ BitVec 32))) )
))
(declare-fun lt!297639 () SeekEntryResult!6854)

(assert (=> b!642610 (= res!416316 (not (= lt!297639 (Found!6854 index!984))))))

(declare-fun lt!297644 () Unit!21750)

(declare-fun e!368031 () Unit!21750)

(assert (=> b!642610 (= lt!297644 e!368031)))

(declare-fun c!73520 () Bool)

(assert (=> b!642610 (= c!73520 (= lt!297639 Undefined!6854))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!297640 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!297645 () array!38395)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38395 (_ BitVec 32)) SeekEntryResult!6854)

(assert (=> b!642610 (= lt!297639 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297640 lt!297645 mask!3053))))

(declare-fun e!368030 () Bool)

(assert (=> b!642610 e!368030))

(declare-fun res!416314 () Bool)

(assert (=> b!642610 (=> (not res!416314) (not e!368030))))

(declare-fun lt!297649 () SeekEntryResult!6854)

(declare-fun lt!297641 () (_ BitVec 32))

(assert (=> b!642610 (= res!416314 (= lt!297649 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297641 vacantSpotIndex!68 lt!297640 lt!297645 mask!3053)))))

(assert (=> b!642610 (= lt!297649 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297641 vacantSpotIndex!68 (select (arr!18414 a!2986) j!136) a!2986 mask!3053))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!642610 (= lt!297640 (select (store (arr!18414 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!297646 () Unit!21750)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38395 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21750)

(assert (=> b!642610 (= lt!297646 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297641 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!642610 (= lt!297641 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!642611 () Bool)

(declare-fun res!416304 () Bool)

(declare-fun e!368020 () Bool)

(assert (=> b!642611 (=> (not res!416304) (not e!368020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38395 (_ BitVec 32)) Bool)

(assert (=> b!642611 (= res!416304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!642612 () Bool)

(declare-fun arrayContainsKey!0 (array!38395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!642612 (= e!368029 (arrayContainsKey!0 lt!297645 (select (arr!18414 a!2986) j!136) j!136))))

(declare-fun b!642613 () Bool)

(declare-fun e!368025 () Bool)

(assert (=> b!642613 (= e!368020 e!368025)))

(declare-fun res!416307 () Bool)

(assert (=> b!642613 (=> (not res!416307) (not e!368025))))

(assert (=> b!642613 (= res!416307 (= (select (store (arr!18414 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642613 (= lt!297645 (array!38396 (store (arr!18414 a!2986) i!1108 k!1786) (size!18778 a!2986)))))

(declare-fun b!642614 () Bool)

(declare-fun res!416310 () Bool)

(assert (=> b!642614 (=> (not res!416310) (not e!368024))))

(assert (=> b!642614 (= res!416310 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!642615 () Bool)

(declare-fun res!416320 () Bool)

(assert (=> b!642615 (=> (not res!416320) (not e!368020))))

(declare-datatypes ((List!12455 0))(
  ( (Nil!12452) (Cons!12451 (h!13496 (_ BitVec 64)) (t!18683 List!12455)) )
))
(declare-fun arrayNoDuplicates!0 (array!38395 (_ BitVec 32) List!12455) Bool)

(assert (=> b!642615 (= res!416320 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12452))))

(declare-fun b!642616 () Bool)

(declare-fun Unit!21752 () Unit!21750)

(assert (=> b!642616 (= e!368019 Unit!21752)))

(declare-fun lt!297635 () Unit!21750)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38395 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21750)

(assert (=> b!642616 (= lt!297635 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297645 (select (arr!18414 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!642616 (arrayContainsKey!0 lt!297645 (select (arr!18414 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297642 () Unit!21750)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38395 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12455) Unit!21750)

(assert (=> b!642616 (= lt!297642 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12452))))

(assert (=> b!642616 (arrayNoDuplicates!0 lt!297645 #b00000000000000000000000000000000 Nil!12452)))

(declare-fun lt!297637 () Unit!21750)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38395 (_ BitVec 32) (_ BitVec 32)) Unit!21750)

(assert (=> b!642616 (= lt!297637 (lemmaNoDuplicateFromThenFromBigger!0 lt!297645 #b00000000000000000000000000000000 j!136))))

(assert (=> b!642616 (arrayNoDuplicates!0 lt!297645 j!136 Nil!12452)))

(declare-fun lt!297647 () Unit!21750)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38395 (_ BitVec 64) (_ BitVec 32) List!12455) Unit!21750)

(assert (=> b!642616 (= lt!297647 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!297645 (select (arr!18414 a!2986) j!136) j!136 Nil!12452))))

(assert (=> b!642616 false))

(declare-fun b!642617 () Bool)

(declare-fun res!416315 () Bool)

(assert (=> b!642617 (=> (not res!416315) (not e!368024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!642617 (= res!416315 (validKeyInArray!0 k!1786))))

(declare-fun b!642618 () Bool)

(assert (=> b!642618 (= e!368025 e!368027)))

(declare-fun res!416321 () Bool)

(assert (=> b!642618 (=> (not res!416321) (not e!368027))))

(declare-fun lt!297648 () SeekEntryResult!6854)

(assert (=> b!642618 (= res!416321 (and (= lt!297648 (Found!6854 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18414 a!2986) index!984) (select (arr!18414 a!2986) j!136))) (not (= (select (arr!18414 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!642618 (= lt!297648 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18414 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!642619 () Bool)

(declare-fun e!368018 () Bool)

(declare-fun e!368026 () Bool)

(assert (=> b!642619 (= e!368018 e!368026)))

(declare-fun res!416313 () Bool)

(assert (=> b!642619 (=> res!416313 e!368026)))

(declare-fun lt!297636 () (_ BitVec 64))

(assert (=> b!642619 (= res!416313 (or (not (= (select (arr!18414 a!2986) j!136) lt!297640)) (not (= (select (arr!18414 a!2986) j!136) lt!297636)) (bvsge j!136 index!984)))))

(declare-fun b!642620 () Bool)

(assert (=> b!642620 (= e!368030 (= lt!297648 lt!297649))))

(declare-fun b!642621 () Bool)

(declare-fun e!368021 () Bool)

(assert (=> b!642621 (= e!368026 e!368021)))

(declare-fun res!416318 () Bool)

(assert (=> b!642621 (=> (not res!416318) (not e!368021))))

(assert (=> b!642621 (= res!416318 (arrayContainsKey!0 lt!297645 (select (arr!18414 a!2986) j!136) j!136))))

(declare-fun b!642622 () Bool)

(declare-fun Unit!21753 () Unit!21750)

(assert (=> b!642622 (= e!368031 Unit!21753)))

(declare-fun b!642623 () Bool)

(assert (=> b!642623 (= e!368024 e!368020)))

(declare-fun res!416317 () Bool)

(assert (=> b!642623 (=> (not res!416317) (not e!368020))))

(declare-fun lt!297643 () SeekEntryResult!6854)

(assert (=> b!642623 (= res!416317 (or (= lt!297643 (MissingZero!6854 i!1108)) (= lt!297643 (MissingVacant!6854 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38395 (_ BitVec 32)) SeekEntryResult!6854)

(assert (=> b!642623 (= lt!297643 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!642624 () Bool)

(assert (=> b!642624 (= e!368021 (arrayContainsKey!0 lt!297645 (select (arr!18414 a!2986) j!136) index!984))))

(declare-fun b!642625 () Bool)

(declare-fun res!416309 () Bool)

(assert (=> b!642625 (=> (not res!416309) (not e!368020))))

(assert (=> b!642625 (= res!416309 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18414 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!642626 () Bool)

(declare-fun res!416311 () Bool)

(assert (=> b!642626 (=> (not res!416311) (not e!368024))))

(assert (=> b!642626 (= res!416311 (validKeyInArray!0 (select (arr!18414 a!2986) j!136)))))

(declare-fun b!642627 () Bool)

(assert (=> b!642627 (= e!368023 e!368028)))

(declare-fun res!416312 () Bool)

(assert (=> b!642627 (=> res!416312 e!368028)))

(assert (=> b!642627 (= res!416312 (or (not (= (select (arr!18414 a!2986) j!136) lt!297640)) (not (= (select (arr!18414 a!2986) j!136) lt!297636))))))

(assert (=> b!642627 e!368018))

(declare-fun res!416308 () Bool)

(assert (=> b!642627 (=> (not res!416308) (not e!368018))))

(assert (=> b!642627 (= res!416308 (= lt!297636 (select (arr!18414 a!2986) j!136)))))

(assert (=> b!642627 (= lt!297636 (select (store (arr!18414 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!642628 () Bool)

(declare-fun Unit!21754 () Unit!21750)

(assert (=> b!642628 (= e!368019 Unit!21754)))

(declare-fun b!642629 () Bool)

(declare-fun Unit!21755 () Unit!21750)

(assert (=> b!642629 (= e!368031 Unit!21755)))

(assert (=> b!642629 false))

(assert (= (and start!58136 res!416305) b!642608))

(assert (= (and b!642608 res!416306) b!642626))

(assert (= (and b!642626 res!416311) b!642617))

(assert (= (and b!642617 res!416315) b!642614))

(assert (= (and b!642614 res!416310) b!642623))

(assert (= (and b!642623 res!416317) b!642611))

(assert (= (and b!642611 res!416304) b!642615))

(assert (= (and b!642615 res!416320) b!642625))

(assert (= (and b!642625 res!416309) b!642613))

(assert (= (and b!642613 res!416307) b!642618))

(assert (= (and b!642618 res!416321) b!642610))

(assert (= (and b!642610 res!416314) b!642620))

(assert (= (and b!642610 c!73520) b!642629))

(assert (= (and b!642610 (not c!73520)) b!642622))

(assert (= (and b!642610 (not res!416316)) b!642627))

(assert (= (and b!642627 res!416308) b!642619))

(assert (= (and b!642619 (not res!416313)) b!642621))

(assert (= (and b!642621 res!416318) b!642624))

(assert (= (and b!642627 (not res!416312)) b!642609))

(assert (= (and b!642609 c!73519) b!642616))

(assert (= (and b!642609 (not c!73519)) b!642628))

(assert (= (and b!642609 (not res!416319)) b!642612))

(declare-fun m!616385 () Bool)

(assert (=> b!642623 m!616385))

(declare-fun m!616387 () Bool)

(assert (=> b!642626 m!616387))

(assert (=> b!642626 m!616387))

(declare-fun m!616389 () Bool)

(assert (=> b!642626 m!616389))

(declare-fun m!616391 () Bool)

(assert (=> b!642615 m!616391))

(assert (=> b!642612 m!616387))

(assert (=> b!642612 m!616387))

(declare-fun m!616393 () Bool)

(assert (=> b!642612 m!616393))

(assert (=> b!642624 m!616387))

(assert (=> b!642624 m!616387))

(declare-fun m!616395 () Bool)

(assert (=> b!642624 m!616395))

(declare-fun m!616397 () Bool)

(assert (=> b!642617 m!616397))

(declare-fun m!616399 () Bool)

(assert (=> b!642613 m!616399))

(declare-fun m!616401 () Bool)

(assert (=> b!642613 m!616401))

(declare-fun m!616403 () Bool)

(assert (=> b!642625 m!616403))

(declare-fun m!616405 () Bool)

(assert (=> b!642611 m!616405))

(declare-fun m!616407 () Bool)

(assert (=> start!58136 m!616407))

(declare-fun m!616409 () Bool)

(assert (=> start!58136 m!616409))

(assert (=> b!642627 m!616387))

(assert (=> b!642627 m!616399))

(declare-fun m!616411 () Bool)

(assert (=> b!642627 m!616411))

(assert (=> b!642621 m!616387))

(assert (=> b!642621 m!616387))

(assert (=> b!642621 m!616393))

(declare-fun m!616413 () Bool)

(assert (=> b!642610 m!616413))

(declare-fun m!616415 () Bool)

(assert (=> b!642610 m!616415))

(assert (=> b!642610 m!616387))

(assert (=> b!642610 m!616387))

(declare-fun m!616417 () Bool)

(assert (=> b!642610 m!616417))

(declare-fun m!616419 () Bool)

(assert (=> b!642610 m!616419))

(declare-fun m!616421 () Bool)

(assert (=> b!642610 m!616421))

(declare-fun m!616423 () Bool)

(assert (=> b!642610 m!616423))

(assert (=> b!642610 m!616399))

(assert (=> b!642616 m!616387))

(assert (=> b!642616 m!616387))

(declare-fun m!616425 () Bool)

(assert (=> b!642616 m!616425))

(declare-fun m!616427 () Bool)

(assert (=> b!642616 m!616427))

(declare-fun m!616429 () Bool)

(assert (=> b!642616 m!616429))

(declare-fun m!616431 () Bool)

(assert (=> b!642616 m!616431))

(assert (=> b!642616 m!616387))

(declare-fun m!616433 () Bool)

(assert (=> b!642616 m!616433))

(assert (=> b!642616 m!616387))

(declare-fun m!616435 () Bool)

(assert (=> b!642616 m!616435))

(declare-fun m!616437 () Bool)

(assert (=> b!642616 m!616437))

(declare-fun m!616439 () Bool)

(assert (=> b!642614 m!616439))

(assert (=> b!642619 m!616387))

(declare-fun m!616441 () Bool)

(assert (=> b!642618 m!616441))

(assert (=> b!642618 m!616387))

(assert (=> b!642618 m!616387))

(declare-fun m!616443 () Bool)

(assert (=> b!642618 m!616443))

(push 1)

(assert (not start!58136))

(assert (not b!642616))

(assert (not b!642611))

(assert (not b!642621))

(assert (not b!642610))

(assert (not b!642618))

(assert (not b!642617))

(assert (not b!642614))

(assert (not b!642623))

(assert (not b!642615))

(assert (not b!642626))

(assert (not b!642624))

(assert (not b!642612))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90807 () Bool)

(declare-fun res!416457 () Bool)

(declare-fun e!368162 () Bool)

(assert (=> d!90807 (=> res!416457 e!368162)))

(assert (=> d!90807 (= res!416457 (= (select (arr!18414 lt!297645) index!984) (select (arr!18414 a!2986) j!136)))))

(assert (=> d!90807 (= (arrayContainsKey!0 lt!297645 (select (arr!18414 a!2986) j!136) index!984) e!368162)))

(declare-fun b!642827 () Bool)

(declare-fun e!368163 () Bool)

(assert (=> b!642827 (= e!368162 e!368163)))

(declare-fun res!416458 () Bool)

(assert (=> b!642827 (=> (not res!416458) (not e!368163))))

(assert (=> b!642827 (= res!416458 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18778 lt!297645)))))

(declare-fun b!642828 () Bool)

(assert (=> b!642828 (= e!368163 (arrayContainsKey!0 lt!297645 (select (arr!18414 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90807 (not res!416457)) b!642827))

(assert (= (and b!642827 res!416458) b!642828))

(declare-fun m!616619 () Bool)

(assert (=> d!90807 m!616619))

(assert (=> b!642828 m!616387))

(declare-fun m!616621 () Bool)

(assert (=> b!642828 m!616621))

(assert (=> b!642624 d!90807))

(declare-fun d!90809 () Bool)

(declare-fun res!416460 () Bool)

(declare-fun e!368165 () Bool)

(assert (=> d!90809 (=> res!416460 e!368165)))

(assert (=> d!90809 (= res!416460 (= (select (arr!18414 lt!297645) j!136) (select (arr!18414 a!2986) j!136)))))

(assert (=> d!90809 (= (arrayContainsKey!0 lt!297645 (select (arr!18414 a!2986) j!136) j!136) e!368165)))

(declare-fun b!642830 () Bool)

(declare-fun e!368166 () Bool)

(assert (=> b!642830 (= e!368165 e!368166)))

(declare-fun res!416461 () Bool)

(assert (=> b!642830 (=> (not res!416461) (not e!368166))))

(assert (=> b!642830 (= res!416461 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18778 lt!297645)))))

(declare-fun b!642831 () Bool)

(assert (=> b!642831 (= e!368166 (arrayContainsKey!0 lt!297645 (select (arr!18414 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90809 (not res!416460)) b!642830))

(assert (= (and b!642830 res!416461) b!642831))

(declare-fun m!616627 () Bool)

(assert (=> d!90809 m!616627))

(assert (=> b!642831 m!616387))

(declare-fun m!616629 () Bool)

(assert (=> b!642831 m!616629))

(assert (=> b!642612 d!90809))

(declare-fun b!642917 () Bool)

(declare-fun e!368219 () SeekEntryResult!6854)

(declare-fun lt!297800 () SeekEntryResult!6854)

(assert (=> b!642917 (= e!368219 (MissingZero!6854 (index!29744 lt!297800)))))

(declare-fun b!642918 () Bool)

(declare-fun e!368221 () SeekEntryResult!6854)

(declare-fun e!368220 () SeekEntryResult!6854)

(assert (=> b!642918 (= e!368221 e!368220)))

(declare-fun lt!297802 () (_ BitVec 64))

(assert (=> b!642918 (= lt!297802 (select (arr!18414 a!2986) (index!29744 lt!297800)))))

(declare-fun c!73586 () Bool)

(assert (=> b!642918 (= c!73586 (= lt!297802 k!1786))))

(declare-fun b!642919 () Bool)

(assert (=> b!642919 (= e!368221 Undefined!6854)))

(declare-fun b!642920 () Bool)

(assert (=> b!642920 (= e!368219 (seekKeyOrZeroReturnVacant!0 (x!58508 lt!297800) (index!29744 lt!297800) (index!29744 lt!297800) k!1786 a!2986 mask!3053))))

(declare-fun d!90813 () Bool)

(declare-fun lt!297801 () SeekEntryResult!6854)

(assert (=> d!90813 (and (or (is-Undefined!6854 lt!297801) (not (is-Found!6854 lt!297801)) (and (bvsge (index!29743 lt!297801) #b00000000000000000000000000000000) (bvslt (index!29743 lt!297801) (size!18778 a!2986)))) (or (is-Undefined!6854 lt!297801) (is-Found!6854 lt!297801) (not (is-MissingZero!6854 lt!297801)) (and (bvsge (index!29742 lt!297801) #b00000000000000000000000000000000) (bvslt (index!29742 lt!297801) (size!18778 a!2986)))) (or (is-Undefined!6854 lt!297801) (is-Found!6854 lt!297801) (is-MissingZero!6854 lt!297801) (not (is-MissingVacant!6854 lt!297801)) (and (bvsge (index!29745 lt!297801) #b00000000000000000000000000000000) (bvslt (index!29745 lt!297801) (size!18778 a!2986)))) (or (is-Undefined!6854 lt!297801) (ite (is-Found!6854 lt!297801) (= (select (arr!18414 a!2986) (index!29743 lt!297801)) k!1786) (ite (is-MissingZero!6854 lt!297801) (= (select (arr!18414 a!2986) (index!29742 lt!297801)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6854 lt!297801) (= (select (arr!18414 a!2986) (index!29745 lt!297801)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!90813 (= lt!297801 e!368221)))

(declare-fun c!73587 () Bool)

(assert (=> d!90813 (= c!73587 (and (is-Intermediate!6854 lt!297800) (undefined!7666 lt!297800)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38395 (_ BitVec 32)) SeekEntryResult!6854)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90813 (= lt!297800 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!90813 (validMask!0 mask!3053)))

(assert (=> d!90813 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!297801)))

(declare-fun b!642921 () Bool)

(declare-fun c!73585 () Bool)

(assert (=> b!642921 (= c!73585 (= lt!297802 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642921 (= e!368220 e!368219)))

(declare-fun b!642922 () Bool)

(assert (=> b!642922 (= e!368220 (Found!6854 (index!29744 lt!297800)))))

(assert (= (and d!90813 c!73587) b!642919))

(assert (= (and d!90813 (not c!73587)) b!642918))

(assert (= (and b!642918 c!73586) b!642922))

(assert (= (and b!642918 (not c!73586)) b!642921))

(assert (= (and b!642921 c!73585) b!642917))

(assert (= (and b!642921 (not c!73585)) b!642920))

(declare-fun m!616681 () Bool)

(assert (=> b!642918 m!616681))

(declare-fun m!616683 () Bool)

(assert (=> b!642920 m!616683))

(declare-fun m!616685 () Bool)

(assert (=> d!90813 m!616685))

(assert (=> d!90813 m!616407))

(declare-fun m!616687 () Bool)

(assert (=> d!90813 m!616687))

(declare-fun m!616689 () Bool)

(assert (=> d!90813 m!616689))

(declare-fun m!616691 () Bool)

(assert (=> d!90813 m!616691))

(declare-fun m!616693 () Bool)

(assert (=> d!90813 m!616693))

(assert (=> d!90813 m!616687))

(assert (=> b!642623 d!90813))

(declare-fun b!642962 () Bool)

(declare-fun e!368251 () Bool)

(declare-fun e!368250 () Bool)

(assert (=> b!642962 (= e!368251 e!368250)))

(declare-fun lt!297821 () (_ BitVec 64))

(assert (=> b!642962 (= lt!297821 (select (arr!18414 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!297822 () Unit!21750)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38395 (_ BitVec 64) (_ BitVec 32)) Unit!21750)

(assert (=> b!642962 (= lt!297822 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!297821 #b00000000000000000000000000000000))))

(assert (=> b!642962 (arrayContainsKey!0 a!2986 lt!297821 #b00000000000000000000000000000000)))

(declare-fun lt!297823 () Unit!21750)

(assert (=> b!642962 (= lt!297823 lt!297822)))

(declare-fun res!416499 () Bool)

(assert (=> b!642962 (= res!416499 (= (seekEntryOrOpen!0 (select (arr!18414 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6854 #b00000000000000000000000000000000)))))

(assert (=> b!642962 (=> (not res!416499) (not e!368250))))

(declare-fun b!642963 () Bool)

(declare-fun call!33576 () Bool)

(assert (=> b!642963 (= e!368250 call!33576)))

(declare-fun b!642964 () Bool)

(assert (=> b!642964 (= e!368251 call!33576)))

(declare-fun bm!33573 () Bool)

(assert (=> bm!33573 (= call!33576 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!90839 () Bool)

(declare-fun res!416498 () Bool)

(declare-fun e!368252 () Bool)

(assert (=> d!90839 (=> res!416498 e!368252)))

(assert (=> d!90839 (= res!416498 (bvsge #b00000000000000000000000000000000 (size!18778 a!2986)))))

(assert (=> d!90839 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!368252)))

(declare-fun b!642965 () Bool)

(assert (=> b!642965 (= e!368252 e!368251)))

(declare-fun c!73599 () Bool)

(assert (=> b!642965 (= c!73599 (validKeyInArray!0 (select (arr!18414 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90839 (not res!416498)) b!642965))

(assert (= (and b!642965 c!73599) b!642962))

(assert (= (and b!642965 (not c!73599)) b!642964))

(assert (= (and b!642962 res!416499) b!642963))

(assert (= (or b!642963 b!642964) bm!33573))

(declare-fun m!616707 () Bool)

(assert (=> b!642962 m!616707))

(declare-fun m!616709 () Bool)

(assert (=> b!642962 m!616709))

(declare-fun m!616711 () Bool)

(assert (=> b!642962 m!616711))

(assert (=> b!642962 m!616707))

(declare-fun m!616713 () Bool)

(assert (=> b!642962 m!616713))

(declare-fun m!616715 () Bool)

(assert (=> bm!33573 m!616715))

(assert (=> b!642965 m!616707))

(assert (=> b!642965 m!616707))

(declare-fun m!616717 () Bool)

(assert (=> b!642965 m!616717))

(assert (=> b!642611 d!90839))

(declare-fun e!368275 () SeekEntryResult!6854)

(declare-fun b!643002 () Bool)

(assert (=> b!643002 (= e!368275 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!297640 lt!297645 mask!3053))))

(declare-fun b!643003 () Bool)

(declare-fun e!368274 () SeekEntryResult!6854)

(assert (=> b!643003 (= e!368274 Undefined!6854)))

(declare-fun b!643005 () Bool)

(declare-fun e!368273 () SeekEntryResult!6854)

(assert (=> b!643005 (= e!368274 e!368273)))

(declare-fun c!73617 () Bool)

(declare-fun lt!297842 () (_ BitVec 64))

(assert (=> b!643005 (= c!73617 (= lt!297842 lt!297640))))

(declare-fun b!643006 () Bool)

(declare-fun c!73616 () Bool)

(assert (=> b!643006 (= c!73616 (= lt!297842 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643006 (= e!368273 e!368275)))

(declare-fun b!643007 () Bool)

(assert (=> b!643007 (= e!368273 (Found!6854 index!984))))

(declare-fun b!643004 () Bool)

(assert (=> b!643004 (= e!368275 (MissingVacant!6854 vacantSpotIndex!68))))

(declare-fun d!90845 () Bool)

(declare-fun lt!297841 () SeekEntryResult!6854)

(assert (=> d!90845 (and (or (is-Undefined!6854 lt!297841) (not (is-Found!6854 lt!297841)) (and (bvsge (index!29743 lt!297841) #b00000000000000000000000000000000) (bvslt (index!29743 lt!297841) (size!18778 lt!297645)))) (or (is-Undefined!6854 lt!297841) (is-Found!6854 lt!297841) (not (is-MissingVacant!6854 lt!297841)) (not (= (index!29745 lt!297841) vacantSpotIndex!68)) (and (bvsge (index!29745 lt!297841) #b00000000000000000000000000000000) (bvslt (index!29745 lt!297841) (size!18778 lt!297645)))) (or (is-Undefined!6854 lt!297841) (ite (is-Found!6854 lt!297841) (= (select (arr!18414 lt!297645) (index!29743 lt!297841)) lt!297640) (and (is-MissingVacant!6854 lt!297841) (= (index!29745 lt!297841) vacantSpotIndex!68) (= (select (arr!18414 lt!297645) (index!29745 lt!297841)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90845 (= lt!297841 e!368274)))

(declare-fun c!73618 () Bool)

(assert (=> d!90845 (= c!73618 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90845 (= lt!297842 (select (arr!18414 lt!297645) index!984))))

(assert (=> d!90845 (validMask!0 mask!3053)))

(assert (=> d!90845 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297640 lt!297645 mask!3053) lt!297841)))

(assert (= (and d!90845 c!73618) b!643003))

(assert (= (and d!90845 (not c!73618)) b!643005))

(assert (= (and b!643005 c!73617) b!643007))

(assert (= (and b!643005 (not c!73617)) b!643006))

(assert (= (and b!643006 c!73616) b!643004))

(assert (= (and b!643006 (not c!73616)) b!643002))

(assert (=> b!643002 m!616413))

(assert (=> b!643002 m!616413))

(declare-fun m!616763 () Bool)

(assert (=> b!643002 m!616763))

(declare-fun m!616765 () Bool)

(assert (=> d!90845 m!616765))

(declare-fun m!616767 () Bool)

(assert (=> d!90845 m!616767))

(assert (=> d!90845 m!616619))

(assert (=> d!90845 m!616407))

(assert (=> b!642610 d!90845))

(declare-fun e!368278 () SeekEntryResult!6854)

(declare-fun b!643008 () Bool)

(assert (=> b!643008 (= e!368278 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!297641 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18414 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!643009 () Bool)

(declare-fun e!368277 () SeekEntryResult!6854)

(assert (=> b!643009 (= e!368277 Undefined!6854)))

(declare-fun b!643011 () Bool)

(declare-fun e!368276 () SeekEntryResult!6854)

(assert (=> b!643011 (= e!368277 e!368276)))

(declare-fun c!73620 () Bool)

(declare-fun lt!297844 () (_ BitVec 64))

(assert (=> b!643011 (= c!73620 (= lt!297844 (select (arr!18414 a!2986) j!136)))))

(declare-fun b!643012 () Bool)

(declare-fun c!73619 () Bool)

(assert (=> b!643012 (= c!73619 (= lt!297844 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643012 (= e!368276 e!368278)))

(declare-fun b!643013 () Bool)

(assert (=> b!643013 (= e!368276 (Found!6854 lt!297641))))

(declare-fun b!643010 () Bool)

(assert (=> b!643010 (= e!368278 (MissingVacant!6854 vacantSpotIndex!68))))

(declare-fun lt!297843 () SeekEntryResult!6854)

(declare-fun d!90857 () Bool)

(assert (=> d!90857 (and (or (is-Undefined!6854 lt!297843) (not (is-Found!6854 lt!297843)) (and (bvsge (index!29743 lt!297843) #b00000000000000000000000000000000) (bvslt (index!29743 lt!297843) (size!18778 a!2986)))) (or (is-Undefined!6854 lt!297843) (is-Found!6854 lt!297843) (not (is-MissingVacant!6854 lt!297843)) (not (= (index!29745 lt!297843) vacantSpotIndex!68)) (and (bvsge (index!29745 lt!297843) #b00000000000000000000000000000000) (bvslt (index!29745 lt!297843) (size!18778 a!2986)))) (or (is-Undefined!6854 lt!297843) (ite (is-Found!6854 lt!297843) (= (select (arr!18414 a!2986) (index!29743 lt!297843)) (select (arr!18414 a!2986) j!136)) (and (is-MissingVacant!6854 lt!297843) (= (index!29745 lt!297843) vacantSpotIndex!68) (= (select (arr!18414 a!2986) (index!29745 lt!297843)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90857 (= lt!297843 e!368277)))

(declare-fun c!73621 () Bool)

(assert (=> d!90857 (= c!73621 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90857 (= lt!297844 (select (arr!18414 a!2986) lt!297641))))

(assert (=> d!90857 (validMask!0 mask!3053)))

(assert (=> d!90857 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297641 vacantSpotIndex!68 (select (arr!18414 a!2986) j!136) a!2986 mask!3053) lt!297843)))

(assert (= (and d!90857 c!73621) b!643009))

(assert (= (and d!90857 (not c!73621)) b!643011))

(assert (= (and b!643011 c!73620) b!643013))

(assert (= (and b!643011 (not c!73620)) b!643012))

(assert (= (and b!643012 c!73619) b!643010))

(assert (= (and b!643012 (not c!73619)) b!643008))

(declare-fun m!616769 () Bool)

(assert (=> b!643008 m!616769))

(assert (=> b!643008 m!616769))

(assert (=> b!643008 m!616387))

(declare-fun m!616771 () Bool)

(assert (=> b!643008 m!616771))

(declare-fun m!616773 () Bool)

(assert (=> d!90857 m!616773))

(declare-fun m!616775 () Bool)

(assert (=> d!90857 m!616775))

(declare-fun m!616777 () Bool)

(assert (=> d!90857 m!616777))

(assert (=> d!90857 m!616407))

(assert (=> b!642610 d!90857))

(declare-fun d!90859 () Bool)

(declare-fun lt!297849 () (_ BitVec 32))

(assert (=> d!90859 (and (bvsge lt!297849 #b00000000000000000000000000000000) (bvslt lt!297849 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90859 (= lt!297849 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!90859 (validMask!0 mask!3053)))

(assert (=> d!90859 (= (nextIndex!0 index!984 x!910 mask!3053) lt!297849)))

(declare-fun bs!19233 () Bool)

(assert (= bs!19233 d!90859))

(declare-fun m!616779 () Bool)

(assert (=> bs!19233 m!616779))

(assert (=> bs!19233 m!616407))

(assert (=> b!642610 d!90859))

(declare-fun e!368283 () SeekEntryResult!6854)

(declare-fun b!643016 () Bool)

(assert (=> b!643016 (= e!368283 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!297641 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!297640 lt!297645 mask!3053))))

(declare-fun b!643017 () Bool)

(declare-fun e!368282 () SeekEntryResult!6854)

(assert (=> b!643017 (= e!368282 Undefined!6854)))

(declare-fun b!643019 () Bool)

(declare-fun e!368281 () SeekEntryResult!6854)

(assert (=> b!643019 (= e!368282 e!368281)))

(declare-fun c!73623 () Bool)

(declare-fun lt!297851 () (_ BitVec 64))

(assert (=> b!643019 (= c!73623 (= lt!297851 lt!297640))))

(declare-fun b!643020 () Bool)

(declare-fun c!73622 () Bool)

(assert (=> b!643020 (= c!73622 (= lt!297851 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643020 (= e!368281 e!368283)))

(declare-fun b!643021 () Bool)

(assert (=> b!643021 (= e!368281 (Found!6854 lt!297641))))

(declare-fun b!643018 () Bool)

(assert (=> b!643018 (= e!368283 (MissingVacant!6854 vacantSpotIndex!68))))

(declare-fun d!90861 () Bool)

(declare-fun lt!297850 () SeekEntryResult!6854)

(assert (=> d!90861 (and (or (is-Undefined!6854 lt!297850) (not (is-Found!6854 lt!297850)) (and (bvsge (index!29743 lt!297850) #b00000000000000000000000000000000) (bvslt (index!29743 lt!297850) (size!18778 lt!297645)))) (or (is-Undefined!6854 lt!297850) (is-Found!6854 lt!297850) (not (is-MissingVacant!6854 lt!297850)) (not (= (index!29745 lt!297850) vacantSpotIndex!68)) (and (bvsge (index!29745 lt!297850) #b00000000000000000000000000000000) (bvslt (index!29745 lt!297850) (size!18778 lt!297645)))) (or (is-Undefined!6854 lt!297850) (ite (is-Found!6854 lt!297850) (= (select (arr!18414 lt!297645) (index!29743 lt!297850)) lt!297640) (and (is-MissingVacant!6854 lt!297850) (= (index!29745 lt!297850) vacantSpotIndex!68) (= (select (arr!18414 lt!297645) (index!29745 lt!297850)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90861 (= lt!297850 e!368282)))

(declare-fun c!73624 () Bool)

(assert (=> d!90861 (= c!73624 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90861 (= lt!297851 (select (arr!18414 lt!297645) lt!297641))))

(assert (=> d!90861 (validMask!0 mask!3053)))

(assert (=> d!90861 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297641 vacantSpotIndex!68 lt!297640 lt!297645 mask!3053) lt!297850)))

(assert (= (and d!90861 c!73624) b!643017))

(assert (= (and d!90861 (not c!73624)) b!643019))

(assert (= (and b!643019 c!73623) b!643021))

(assert (= (and b!643019 (not c!73623)) b!643020))

(assert (= (and b!643020 c!73622) b!643018))

