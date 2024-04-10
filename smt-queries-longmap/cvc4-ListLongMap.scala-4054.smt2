; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55556 () Bool)

(assert start!55556)

(declare-fun b!607701 () Bool)

(declare-fun res!390502 () Bool)

(declare-fun e!348020 () Bool)

(assert (=> b!607701 (=> res!390502 e!348020)))

(declare-datatypes ((List!11935 0))(
  ( (Nil!11932) (Cons!11931 (h!12976 (_ BitVec 64)) (t!18163 List!11935)) )
))
(declare-fun contains!3011 (List!11935 (_ BitVec 64)) Bool)

(assert (=> b!607701 (= res!390502 (contains!3011 Nil!11932 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607702 () Bool)

(declare-fun res!390481 () Bool)

(declare-fun e!348006 () Bool)

(assert (=> b!607702 (=> (not res!390481) (not e!348006))))

(declare-datatypes ((array!37287 0))(
  ( (array!37288 (arr!17894 (Array (_ BitVec 32) (_ BitVec 64))) (size!18258 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37287)

(declare-fun arrayNoDuplicates!0 (array!37287 (_ BitVec 32) List!11935) Bool)

(assert (=> b!607702 (= res!390481 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11932))))

(declare-fun b!607703 () Bool)

(declare-fun e!348021 () Bool)

(assert (=> b!607703 (= e!348021 e!348020)))

(declare-fun res!390499 () Bool)

(assert (=> b!607703 (=> res!390499 e!348020)))

(assert (=> b!607703 (= res!390499 (or (bvsge (size!18258 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18258 a!2986))))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!277494 () array!37287)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!607703 (arrayContainsKey!0 lt!277494 (select (arr!17894 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-datatypes ((Unit!19384 0))(
  ( (Unit!19385) )
))
(declare-fun lt!277492 () Unit!19384)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37287 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19384)

(assert (=> b!607703 (= lt!277492 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277494 (select (arr!17894 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!348019 () Bool)

(assert (=> b!607703 e!348019))

(declare-fun res!390496 () Bool)

(assert (=> b!607703 (=> (not res!390496) (not e!348019))))

(assert (=> b!607703 (= res!390496 (arrayContainsKey!0 lt!277494 (select (arr!17894 a!2986) j!136) j!136))))

(declare-fun b!607705 () Bool)

(declare-fun res!390483 () Bool)

(declare-fun e!348017 () Bool)

(assert (=> b!607705 (=> (not res!390483) (not e!348017))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!607705 (= res!390483 (validKeyInArray!0 (select (arr!17894 a!2986) j!136)))))

(declare-fun b!607706 () Bool)

(declare-fun res!390486 () Bool)

(assert (=> b!607706 (=> res!390486 e!348020)))

(declare-fun noDuplicate!317 (List!11935) Bool)

(assert (=> b!607706 (= res!390486 (not (noDuplicate!317 Nil!11932)))))

(declare-fun b!607707 () Bool)

(declare-fun e!348014 () Bool)

(declare-fun e!348018 () Bool)

(assert (=> b!607707 (= e!348014 e!348018)))

(declare-fun res!390482 () Bool)

(assert (=> b!607707 (=> (not res!390482) (not e!348018))))

(assert (=> b!607707 (= res!390482 (arrayContainsKey!0 lt!277494 (select (arr!17894 a!2986) j!136) j!136))))

(declare-fun b!607708 () Bool)

(declare-fun e!348010 () Bool)

(declare-fun e!348007 () Bool)

(assert (=> b!607708 (= e!348010 (not e!348007))))

(declare-fun res!390494 () Bool)

(assert (=> b!607708 (=> res!390494 e!348007)))

(declare-datatypes ((SeekEntryResult!6334 0))(
  ( (MissingZero!6334 (index!27611 (_ BitVec 32))) (Found!6334 (index!27612 (_ BitVec 32))) (Intermediate!6334 (undefined!7146 Bool) (index!27613 (_ BitVec 32)) (x!56419 (_ BitVec 32))) (Undefined!6334) (MissingVacant!6334 (index!27614 (_ BitVec 32))) )
))
(declare-fun lt!277489 () SeekEntryResult!6334)

(assert (=> b!607708 (= res!390494 (not (= lt!277489 (Found!6334 index!984))))))

(declare-fun lt!277496 () Unit!19384)

(declare-fun e!348011 () Unit!19384)

(assert (=> b!607708 (= lt!277496 e!348011)))

(declare-fun c!68977 () Bool)

(assert (=> b!607708 (= c!68977 (= lt!277489 Undefined!6334))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!277501 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37287 (_ BitVec 32)) SeekEntryResult!6334)

(assert (=> b!607708 (= lt!277489 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277501 lt!277494 mask!3053))))

(declare-fun e!348009 () Bool)

(assert (=> b!607708 e!348009))

(declare-fun res!390492 () Bool)

(assert (=> b!607708 (=> (not res!390492) (not e!348009))))

(declare-fun lt!277502 () SeekEntryResult!6334)

(declare-fun lt!277490 () (_ BitVec 32))

(assert (=> b!607708 (= res!390492 (= lt!277502 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277490 vacantSpotIndex!68 lt!277501 lt!277494 mask!3053)))))

(assert (=> b!607708 (= lt!277502 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277490 vacantSpotIndex!68 (select (arr!17894 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!607708 (= lt!277501 (select (store (arr!17894 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!277493 () Unit!19384)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37287 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19384)

(assert (=> b!607708 (= lt!277493 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277490 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!607708 (= lt!277490 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!607709 () Bool)

(declare-fun res!390497 () Bool)

(assert (=> b!607709 (=> (not res!390497) (not e!348006))))

(assert (=> b!607709 (= res!390497 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17894 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!607710 () Bool)

(declare-fun e!348016 () Unit!19384)

(declare-fun Unit!19386 () Unit!19384)

(assert (=> b!607710 (= e!348016 Unit!19386)))

(declare-fun b!607711 () Bool)

(declare-fun e!348012 () Bool)

(assert (=> b!607711 (= e!348006 e!348012)))

(declare-fun res!390493 () Bool)

(assert (=> b!607711 (=> (not res!390493) (not e!348012))))

(assert (=> b!607711 (= res!390493 (= (select (store (arr!17894 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!607711 (= lt!277494 (array!37288 (store (arr!17894 a!2986) i!1108 k!1786) (size!18258 a!2986)))))

(declare-fun b!607712 () Bool)

(assert (=> b!607712 (= e!348018 (arrayContainsKey!0 lt!277494 (select (arr!17894 a!2986) j!136) index!984))))

(declare-fun b!607713 () Bool)

(declare-fun res!390495 () Bool)

(assert (=> b!607713 (=> (not res!390495) (not e!348006))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37287 (_ BitVec 32)) Bool)

(assert (=> b!607713 (= res!390495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!607714 () Bool)

(assert (=> b!607714 (= e!348017 e!348006)))

(declare-fun res!390489 () Bool)

(assert (=> b!607714 (=> (not res!390489) (not e!348006))))

(declare-fun lt!277491 () SeekEntryResult!6334)

(assert (=> b!607714 (= res!390489 (or (= lt!277491 (MissingZero!6334 i!1108)) (= lt!277491 (MissingVacant!6334 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37287 (_ BitVec 32)) SeekEntryResult!6334)

(assert (=> b!607714 (= lt!277491 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!607715 () Bool)

(declare-fun e!348013 () Bool)

(assert (=> b!607715 (= e!348013 e!348014)))

(declare-fun res!390484 () Bool)

(assert (=> b!607715 (=> res!390484 e!348014)))

(declare-fun lt!277499 () (_ BitVec 64))

(assert (=> b!607715 (= res!390484 (or (not (= (select (arr!17894 a!2986) j!136) lt!277501)) (not (= (select (arr!17894 a!2986) j!136) lt!277499)) (bvsge j!136 index!984)))))

(declare-fun res!390491 () Bool)

(assert (=> start!55556 (=> (not res!390491) (not e!348017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55556 (= res!390491 (validMask!0 mask!3053))))

(assert (=> start!55556 e!348017))

(assert (=> start!55556 true))

(declare-fun array_inv!13690 (array!37287) Bool)

(assert (=> start!55556 (array_inv!13690 a!2986)))

(declare-fun b!607704 () Bool)

(declare-fun Unit!19387 () Unit!19384)

(assert (=> b!607704 (= e!348011 Unit!19387)))

(assert (=> b!607704 false))

(declare-fun b!607716 () Bool)

(declare-fun res!390501 () Bool)

(assert (=> b!607716 (=> (not res!390501) (not e!348017))))

(assert (=> b!607716 (= res!390501 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!607717 () Bool)

(assert (=> b!607717 (= e!348020 true)))

(declare-fun lt!277495 () Bool)

(assert (=> b!607717 (= lt!277495 (contains!3011 Nil!11932 k!1786))))

(declare-fun b!607718 () Bool)

(declare-fun res!390487 () Bool)

(assert (=> b!607718 (=> res!390487 e!348020)))

(assert (=> b!607718 (= res!390487 (contains!3011 Nil!11932 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607719 () Bool)

(declare-fun e!348015 () Bool)

(assert (=> b!607719 (= e!348015 e!348021)))

(declare-fun res!390503 () Bool)

(assert (=> b!607719 (=> res!390503 e!348021)))

(assert (=> b!607719 (= res!390503 (bvsge index!984 j!136))))

(declare-fun lt!277503 () Unit!19384)

(assert (=> b!607719 (= lt!277503 e!348016)))

(declare-fun c!68978 () Bool)

(assert (=> b!607719 (= c!68978 (bvslt j!136 index!984))))

(declare-fun b!607720 () Bool)

(declare-fun res!390498 () Bool)

(assert (=> b!607720 (=> (not res!390498) (not e!348017))))

(assert (=> b!607720 (= res!390498 (and (= (size!18258 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18258 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18258 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!607721 () Bool)

(declare-fun Unit!19388 () Unit!19384)

(assert (=> b!607721 (= e!348011 Unit!19388)))

(declare-fun b!607722 () Bool)

(assert (=> b!607722 (= e!348007 e!348015)))

(declare-fun res!390488 () Bool)

(assert (=> b!607722 (=> res!390488 e!348015)))

(assert (=> b!607722 (= res!390488 (or (not (= (select (arr!17894 a!2986) j!136) lt!277501)) (not (= (select (arr!17894 a!2986) j!136) lt!277499))))))

(assert (=> b!607722 e!348013))

(declare-fun res!390485 () Bool)

(assert (=> b!607722 (=> (not res!390485) (not e!348013))))

(assert (=> b!607722 (= res!390485 (= lt!277499 (select (arr!17894 a!2986) j!136)))))

(assert (=> b!607722 (= lt!277499 (select (store (arr!17894 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!607723 () Bool)

(assert (=> b!607723 (= e!348019 (arrayContainsKey!0 lt!277494 (select (arr!17894 a!2986) j!136) index!984))))

(declare-fun b!607724 () Bool)

(declare-fun lt!277497 () SeekEntryResult!6334)

(assert (=> b!607724 (= e!348009 (= lt!277497 lt!277502))))

(declare-fun b!607725 () Bool)

(declare-fun res!390490 () Bool)

(assert (=> b!607725 (=> (not res!390490) (not e!348017))))

(assert (=> b!607725 (= res!390490 (validKeyInArray!0 k!1786))))

(declare-fun b!607726 () Bool)

(declare-fun Unit!19389 () Unit!19384)

(assert (=> b!607726 (= e!348016 Unit!19389)))

(declare-fun lt!277500 () Unit!19384)

(assert (=> b!607726 (= lt!277500 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277494 (select (arr!17894 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!607726 (arrayContainsKey!0 lt!277494 (select (arr!17894 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277498 () Unit!19384)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37287 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11935) Unit!19384)

(assert (=> b!607726 (= lt!277498 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11932))))

(assert (=> b!607726 (arrayNoDuplicates!0 lt!277494 #b00000000000000000000000000000000 Nil!11932)))

(declare-fun lt!277504 () Unit!19384)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37287 (_ BitVec 32) (_ BitVec 32)) Unit!19384)

(assert (=> b!607726 (= lt!277504 (lemmaNoDuplicateFromThenFromBigger!0 lt!277494 #b00000000000000000000000000000000 j!136))))

(assert (=> b!607726 (arrayNoDuplicates!0 lt!277494 j!136 Nil!11932)))

(declare-fun lt!277488 () Unit!19384)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37287 (_ BitVec 64) (_ BitVec 32) List!11935) Unit!19384)

(assert (=> b!607726 (= lt!277488 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277494 (select (arr!17894 a!2986) j!136) j!136 Nil!11932))))

(assert (=> b!607726 false))

(declare-fun b!607727 () Bool)

(assert (=> b!607727 (= e!348012 e!348010)))

(declare-fun res!390500 () Bool)

(assert (=> b!607727 (=> (not res!390500) (not e!348010))))

(assert (=> b!607727 (= res!390500 (and (= lt!277497 (Found!6334 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17894 a!2986) index!984) (select (arr!17894 a!2986) j!136))) (not (= (select (arr!17894 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!607727 (= lt!277497 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17894 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!55556 res!390491) b!607720))

(assert (= (and b!607720 res!390498) b!607705))

(assert (= (and b!607705 res!390483) b!607725))

(assert (= (and b!607725 res!390490) b!607716))

(assert (= (and b!607716 res!390501) b!607714))

(assert (= (and b!607714 res!390489) b!607713))

(assert (= (and b!607713 res!390495) b!607702))

(assert (= (and b!607702 res!390481) b!607709))

(assert (= (and b!607709 res!390497) b!607711))

(assert (= (and b!607711 res!390493) b!607727))

(assert (= (and b!607727 res!390500) b!607708))

(assert (= (and b!607708 res!390492) b!607724))

(assert (= (and b!607708 c!68977) b!607704))

(assert (= (and b!607708 (not c!68977)) b!607721))

(assert (= (and b!607708 (not res!390494)) b!607722))

(assert (= (and b!607722 res!390485) b!607715))

(assert (= (and b!607715 (not res!390484)) b!607707))

(assert (= (and b!607707 res!390482) b!607712))

(assert (= (and b!607722 (not res!390488)) b!607719))

(assert (= (and b!607719 c!68978) b!607726))

(assert (= (and b!607719 (not c!68978)) b!607710))

(assert (= (and b!607719 (not res!390503)) b!607703))

(assert (= (and b!607703 res!390496) b!607723))

(assert (= (and b!607703 (not res!390499)) b!607706))

(assert (= (and b!607706 (not res!390486)) b!607701))

(assert (= (and b!607701 (not res!390502)) b!607718))

(assert (= (and b!607718 (not res!390487)) b!607717))

(declare-fun m!584411 () Bool)

(assert (=> b!607726 m!584411))

(declare-fun m!584413 () Bool)

(assert (=> b!607726 m!584413))

(assert (=> b!607726 m!584413))

(declare-fun m!584415 () Bool)

(assert (=> b!607726 m!584415))

(assert (=> b!607726 m!584413))

(declare-fun m!584417 () Bool)

(assert (=> b!607726 m!584417))

(declare-fun m!584419 () Bool)

(assert (=> b!607726 m!584419))

(declare-fun m!584421 () Bool)

(assert (=> b!607726 m!584421))

(assert (=> b!607726 m!584413))

(declare-fun m!584423 () Bool)

(assert (=> b!607726 m!584423))

(declare-fun m!584425 () Bool)

(assert (=> b!607726 m!584425))

(declare-fun m!584427 () Bool)

(assert (=> b!607702 m!584427))

(declare-fun m!584429 () Bool)

(assert (=> b!607717 m!584429))

(declare-fun m!584431 () Bool)

(assert (=> b!607713 m!584431))

(assert (=> b!607715 m!584413))

(assert (=> b!607707 m!584413))

(assert (=> b!607707 m!584413))

(declare-fun m!584433 () Bool)

(assert (=> b!607707 m!584433))

(declare-fun m!584435 () Bool)

(assert (=> b!607708 m!584435))

(declare-fun m!584437 () Bool)

(assert (=> b!607708 m!584437))

(declare-fun m!584439 () Bool)

(assert (=> b!607708 m!584439))

(assert (=> b!607708 m!584413))

(declare-fun m!584441 () Bool)

(assert (=> b!607708 m!584441))

(declare-fun m!584443 () Bool)

(assert (=> b!607708 m!584443))

(declare-fun m!584445 () Bool)

(assert (=> b!607708 m!584445))

(assert (=> b!607708 m!584413))

(declare-fun m!584447 () Bool)

(assert (=> b!607708 m!584447))

(assert (=> b!607705 m!584413))

(assert (=> b!607705 m!584413))

(declare-fun m!584449 () Bool)

(assert (=> b!607705 m!584449))

(declare-fun m!584451 () Bool)

(assert (=> b!607706 m!584451))

(declare-fun m!584453 () Bool)

(assert (=> b!607709 m!584453))

(assert (=> b!607703 m!584413))

(assert (=> b!607703 m!584413))

(declare-fun m!584455 () Bool)

(assert (=> b!607703 m!584455))

(assert (=> b!607703 m!584413))

(declare-fun m!584457 () Bool)

(assert (=> b!607703 m!584457))

(assert (=> b!607703 m!584413))

(assert (=> b!607703 m!584433))

(declare-fun m!584459 () Bool)

(assert (=> b!607701 m!584459))

(declare-fun m!584461 () Bool)

(assert (=> start!55556 m!584461))

(declare-fun m!584463 () Bool)

(assert (=> start!55556 m!584463))

(assert (=> b!607712 m!584413))

(assert (=> b!607712 m!584413))

(declare-fun m!584465 () Bool)

(assert (=> b!607712 m!584465))

(declare-fun m!584467 () Bool)

(assert (=> b!607727 m!584467))

(assert (=> b!607727 m!584413))

(assert (=> b!607727 m!584413))

(declare-fun m!584469 () Bool)

(assert (=> b!607727 m!584469))

(assert (=> b!607722 m!584413))

(assert (=> b!607722 m!584441))

(declare-fun m!584471 () Bool)

(assert (=> b!607722 m!584471))

(declare-fun m!584473 () Bool)

(assert (=> b!607725 m!584473))

(assert (=> b!607711 m!584441))

(declare-fun m!584475 () Bool)

(assert (=> b!607711 m!584475))

(declare-fun m!584477 () Bool)

(assert (=> b!607716 m!584477))

(declare-fun m!584479 () Bool)

(assert (=> b!607718 m!584479))

(assert (=> b!607723 m!584413))

(assert (=> b!607723 m!584413))

(assert (=> b!607723 m!584465))

(declare-fun m!584481 () Bool)

(assert (=> b!607714 m!584481))

(push 1)

