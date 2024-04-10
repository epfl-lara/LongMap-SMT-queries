; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55588 () Bool)

(assert start!55588)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37319 0))(
  ( (array!37320 (arr!17910 (Array (_ BitVec 32) (_ BitVec 64))) (size!18274 (_ BitVec 32))) )
))
(declare-fun lt!278311 () array!37319)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37319)

(declare-fun e!348774 () Bool)

(declare-fun b!608997 () Bool)

(declare-fun arrayContainsKey!0 (array!37319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!608997 (= e!348774 (arrayContainsKey!0 lt!278311 (select (arr!17910 a!2986) j!136) index!984))))

(declare-fun e!348779 () Bool)

(declare-fun b!608998 () Bool)

(assert (=> b!608998 (= e!348779 (arrayContainsKey!0 lt!278311 (select (arr!17910 a!2986) j!136) index!984))))

(declare-fun b!608999 () Bool)

(declare-fun res!391587 () Bool)

(declare-fun e!348787 () Bool)

(assert (=> b!608999 (=> res!391587 e!348787)))

(declare-datatypes ((List!11951 0))(
  ( (Nil!11948) (Cons!11947 (h!12992 (_ BitVec 64)) (t!18179 List!11951)) )
))
(declare-fun noDuplicate!333 (List!11951) Bool)

(assert (=> b!608999 (= res!391587 (not (noDuplicate!333 Nil!11948)))))

(declare-fun b!609000 () Bool)

(assert (=> b!609000 (= e!348787 true)))

(declare-fun lt!278314 () Bool)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun contains!3027 (List!11951 (_ BitVec 64)) Bool)

(assert (=> b!609000 (= lt!278314 (contains!3027 Nil!11948 k!1786))))

(declare-fun b!609001 () Bool)

(declare-fun e!348784 () Bool)

(declare-fun e!348780 () Bool)

(assert (=> b!609001 (= e!348784 e!348780)))

(declare-fun res!391606 () Bool)

(assert (=> b!609001 (=> res!391606 e!348780)))

(declare-fun lt!278318 () (_ BitVec 64))

(declare-fun lt!278315 () (_ BitVec 64))

(assert (=> b!609001 (= res!391606 (or (not (= (select (arr!17910 a!2986) j!136) lt!278318)) (not (= (select (arr!17910 a!2986) j!136) lt!278315)) (bvsge j!136 index!984)))))

(declare-fun b!609002 () Bool)

(declare-fun e!348789 () Bool)

(declare-fun e!348777 () Bool)

(assert (=> b!609002 (= e!348789 (not e!348777))))

(declare-fun res!391605 () Bool)

(assert (=> b!609002 (=> res!391605 e!348777)))

(declare-datatypes ((SeekEntryResult!6350 0))(
  ( (MissingZero!6350 (index!27675 (_ BitVec 32))) (Found!6350 (index!27676 (_ BitVec 32))) (Intermediate!6350 (undefined!7162 Bool) (index!27677 (_ BitVec 32)) (x!56483 (_ BitVec 32))) (Undefined!6350) (MissingVacant!6350 (index!27678 (_ BitVec 32))) )
))
(declare-fun lt!278310 () SeekEntryResult!6350)

(assert (=> b!609002 (= res!391605 (not (= lt!278310 (Found!6350 index!984))))))

(declare-datatypes ((Unit!19480 0))(
  ( (Unit!19481) )
))
(declare-fun lt!278312 () Unit!19480)

(declare-fun e!348778 () Unit!19480)

(assert (=> b!609002 (= lt!278312 e!348778)))

(declare-fun c!69073 () Bool)

(assert (=> b!609002 (= c!69073 (= lt!278310 Undefined!6350))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37319 (_ BitVec 32)) SeekEntryResult!6350)

(assert (=> b!609002 (= lt!278310 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278318 lt!278311 mask!3053))))

(declare-fun e!348776 () Bool)

(assert (=> b!609002 e!348776))

(declare-fun res!391603 () Bool)

(assert (=> b!609002 (=> (not res!391603) (not e!348776))))

(declare-fun lt!278319 () (_ BitVec 32))

(declare-fun lt!278313 () SeekEntryResult!6350)

(assert (=> b!609002 (= res!391603 (= lt!278313 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278319 vacantSpotIndex!68 lt!278318 lt!278311 mask!3053)))))

(assert (=> b!609002 (= lt!278313 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278319 vacantSpotIndex!68 (select (arr!17910 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!609002 (= lt!278318 (select (store (arr!17910 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!278306 () Unit!19480)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37319 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19480)

(assert (=> b!609002 (= lt!278306 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278319 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!609002 (= lt!278319 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!609003 () Bool)

(declare-fun res!391601 () Bool)

(declare-fun e!348783 () Bool)

(assert (=> b!609003 (=> (not res!391601) (not e!348783))))

(assert (=> b!609003 (= res!391601 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17910 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!391591 () Bool)

(declare-fun e!348788 () Bool)

(assert (=> start!55588 (=> (not res!391591) (not e!348788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55588 (= res!391591 (validMask!0 mask!3053))))

(assert (=> start!55588 e!348788))

(assert (=> start!55588 true))

(declare-fun array_inv!13706 (array!37319) Bool)

(assert (=> start!55588 (array_inv!13706 a!2986)))

(declare-fun b!609004 () Bool)

(declare-fun res!391600 () Bool)

(assert (=> b!609004 (=> (not res!391600) (not e!348788))))

(assert (=> b!609004 (= res!391600 (and (= (size!18274 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18274 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18274 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!609005 () Bool)

(assert (=> b!609005 (= e!348788 e!348783)))

(declare-fun res!391598 () Bool)

(assert (=> b!609005 (=> (not res!391598) (not e!348783))))

(declare-fun lt!278304 () SeekEntryResult!6350)

(assert (=> b!609005 (= res!391598 (or (= lt!278304 (MissingZero!6350 i!1108)) (= lt!278304 (MissingVacant!6350 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37319 (_ BitVec 32)) SeekEntryResult!6350)

(assert (=> b!609005 (= lt!278304 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!609006 () Bool)

(declare-fun e!348786 () Bool)

(assert (=> b!609006 (= e!348786 e!348787)))

(declare-fun res!391607 () Bool)

(assert (=> b!609006 (=> res!391607 e!348787)))

(assert (=> b!609006 (= res!391607 (or (bvsge (size!18274 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18274 a!2986))))))

(assert (=> b!609006 (arrayContainsKey!0 lt!278311 (select (arr!17910 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278317 () Unit!19480)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37319 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19480)

(assert (=> b!609006 (= lt!278317 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278311 (select (arr!17910 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!609006 e!348779))

(declare-fun res!391586 () Bool)

(assert (=> b!609006 (=> (not res!391586) (not e!348779))))

(assert (=> b!609006 (= res!391586 (arrayContainsKey!0 lt!278311 (select (arr!17910 a!2986) j!136) j!136))))

(declare-fun b!609007 () Bool)

(declare-fun res!391590 () Bool)

(assert (=> b!609007 (=> (not res!391590) (not e!348788))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!609007 (= res!391590 (validKeyInArray!0 k!1786))))

(declare-fun b!609008 () Bool)

(declare-fun e!348775 () Unit!19480)

(declare-fun Unit!19482 () Unit!19480)

(assert (=> b!609008 (= e!348775 Unit!19482)))

(declare-fun b!609009 () Bool)

(declare-fun Unit!19483 () Unit!19480)

(assert (=> b!609009 (= e!348778 Unit!19483)))

(assert (=> b!609009 false))

(declare-fun b!609010 () Bool)

(declare-fun res!391597 () Bool)

(assert (=> b!609010 (=> (not res!391597) (not e!348783))))

(declare-fun arrayNoDuplicates!0 (array!37319 (_ BitVec 32) List!11951) Bool)

(assert (=> b!609010 (= res!391597 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11948))))

(declare-fun b!609011 () Bool)

(declare-fun lt!278305 () SeekEntryResult!6350)

(assert (=> b!609011 (= e!348776 (= lt!278305 lt!278313))))

(declare-fun b!609012 () Bool)

(declare-fun e!348782 () Bool)

(assert (=> b!609012 (= e!348782 e!348789)))

(declare-fun res!391604 () Bool)

(assert (=> b!609012 (=> (not res!391604) (not e!348789))))

(assert (=> b!609012 (= res!391604 (and (= lt!278305 (Found!6350 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17910 a!2986) index!984) (select (arr!17910 a!2986) j!136))) (not (= (select (arr!17910 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!609012 (= lt!278305 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17910 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!609013 () Bool)

(declare-fun e!348785 () Bool)

(assert (=> b!609013 (= e!348777 e!348785)))

(declare-fun res!391589 () Bool)

(assert (=> b!609013 (=> res!391589 e!348785)))

(assert (=> b!609013 (= res!391589 (or (not (= (select (arr!17910 a!2986) j!136) lt!278318)) (not (= (select (arr!17910 a!2986) j!136) lt!278315))))))

(assert (=> b!609013 e!348784))

(declare-fun res!391602 () Bool)

(assert (=> b!609013 (=> (not res!391602) (not e!348784))))

(assert (=> b!609013 (= res!391602 (= lt!278315 (select (arr!17910 a!2986) j!136)))))

(assert (=> b!609013 (= lt!278315 (select (store (arr!17910 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!609014 () Bool)

(declare-fun res!391593 () Bool)

(assert (=> b!609014 (=> (not res!391593) (not e!348788))))

(assert (=> b!609014 (= res!391593 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!609015 () Bool)

(declare-fun res!391592 () Bool)

(assert (=> b!609015 (=> (not res!391592) (not e!348788))))

(assert (=> b!609015 (= res!391592 (validKeyInArray!0 (select (arr!17910 a!2986) j!136)))))

(declare-fun b!609016 () Bool)

(declare-fun Unit!19484 () Unit!19480)

(assert (=> b!609016 (= e!348775 Unit!19484)))

(declare-fun lt!278320 () Unit!19480)

(assert (=> b!609016 (= lt!278320 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278311 (select (arr!17910 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!609016 (arrayContainsKey!0 lt!278311 (select (arr!17910 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278308 () Unit!19480)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37319 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11951) Unit!19480)

(assert (=> b!609016 (= lt!278308 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11948))))

(assert (=> b!609016 (arrayNoDuplicates!0 lt!278311 #b00000000000000000000000000000000 Nil!11948)))

(declare-fun lt!278316 () Unit!19480)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37319 (_ BitVec 32) (_ BitVec 32)) Unit!19480)

(assert (=> b!609016 (= lt!278316 (lemmaNoDuplicateFromThenFromBigger!0 lt!278311 #b00000000000000000000000000000000 j!136))))

(assert (=> b!609016 (arrayNoDuplicates!0 lt!278311 j!136 Nil!11948)))

(declare-fun lt!278309 () Unit!19480)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37319 (_ BitVec 64) (_ BitVec 32) List!11951) Unit!19480)

(assert (=> b!609016 (= lt!278309 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278311 (select (arr!17910 a!2986) j!136) j!136 Nil!11948))))

(assert (=> b!609016 false))

(declare-fun b!609017 () Bool)

(assert (=> b!609017 (= e!348783 e!348782)))

(declare-fun res!391585 () Bool)

(assert (=> b!609017 (=> (not res!391585) (not e!348782))))

(assert (=> b!609017 (= res!391585 (= (select (store (arr!17910 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!609017 (= lt!278311 (array!37320 (store (arr!17910 a!2986) i!1108 k!1786) (size!18274 a!2986)))))

(declare-fun b!609018 () Bool)

(declare-fun res!391595 () Bool)

(assert (=> b!609018 (=> (not res!391595) (not e!348783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37319 (_ BitVec 32)) Bool)

(assert (=> b!609018 (= res!391595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!609019 () Bool)

(declare-fun Unit!19485 () Unit!19480)

(assert (=> b!609019 (= e!348778 Unit!19485)))

(declare-fun b!609020 () Bool)

(assert (=> b!609020 (= e!348780 e!348774)))

(declare-fun res!391588 () Bool)

(assert (=> b!609020 (=> (not res!391588) (not e!348774))))

(assert (=> b!609020 (= res!391588 (arrayContainsKey!0 lt!278311 (select (arr!17910 a!2986) j!136) j!136))))

(declare-fun b!609021 () Bool)

(assert (=> b!609021 (= e!348785 e!348786)))

(declare-fun res!391594 () Bool)

(assert (=> b!609021 (=> res!391594 e!348786)))

(assert (=> b!609021 (= res!391594 (bvsge index!984 j!136))))

(declare-fun lt!278307 () Unit!19480)

(assert (=> b!609021 (= lt!278307 e!348775)))

(declare-fun c!69074 () Bool)

(assert (=> b!609021 (= c!69074 (bvslt j!136 index!984))))

(declare-fun b!609022 () Bool)

(declare-fun res!391596 () Bool)

(assert (=> b!609022 (=> res!391596 e!348787)))

(assert (=> b!609022 (= res!391596 (contains!3027 Nil!11948 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!609023 () Bool)

(declare-fun res!391599 () Bool)

(assert (=> b!609023 (=> res!391599 e!348787)))

(assert (=> b!609023 (= res!391599 (contains!3027 Nil!11948 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!55588 res!391591) b!609004))

(assert (= (and b!609004 res!391600) b!609015))

(assert (= (and b!609015 res!391592) b!609007))

(assert (= (and b!609007 res!391590) b!609014))

(assert (= (and b!609014 res!391593) b!609005))

(assert (= (and b!609005 res!391598) b!609018))

(assert (= (and b!609018 res!391595) b!609010))

(assert (= (and b!609010 res!391597) b!609003))

(assert (= (and b!609003 res!391601) b!609017))

(assert (= (and b!609017 res!391585) b!609012))

(assert (= (and b!609012 res!391604) b!609002))

(assert (= (and b!609002 res!391603) b!609011))

(assert (= (and b!609002 c!69073) b!609009))

(assert (= (and b!609002 (not c!69073)) b!609019))

(assert (= (and b!609002 (not res!391605)) b!609013))

(assert (= (and b!609013 res!391602) b!609001))

(assert (= (and b!609001 (not res!391606)) b!609020))

(assert (= (and b!609020 res!391588) b!608997))

(assert (= (and b!609013 (not res!391589)) b!609021))

(assert (= (and b!609021 c!69074) b!609016))

(assert (= (and b!609021 (not c!69074)) b!609008))

(assert (= (and b!609021 (not res!391594)) b!609006))

(assert (= (and b!609006 res!391586) b!608998))

(assert (= (and b!609006 (not res!391607)) b!608999))

(assert (= (and b!608999 (not res!391587)) b!609022))

(assert (= (and b!609022 (not res!391596)) b!609023))

(assert (= (and b!609023 (not res!391599)) b!609000))

(declare-fun m!585563 () Bool)

(assert (=> b!609001 m!585563))

(declare-fun m!585565 () Bool)

(assert (=> b!609023 m!585565))

(assert (=> b!609015 m!585563))

(assert (=> b!609015 m!585563))

(declare-fun m!585567 () Bool)

(assert (=> b!609015 m!585567))

(declare-fun m!585569 () Bool)

(assert (=> b!609000 m!585569))

(declare-fun m!585571 () Bool)

(assert (=> b!609007 m!585571))

(declare-fun m!585573 () Bool)

(assert (=> b!609002 m!585573))

(assert (=> b!609002 m!585563))

(declare-fun m!585575 () Bool)

(assert (=> b!609002 m!585575))

(declare-fun m!585577 () Bool)

(assert (=> b!609002 m!585577))

(declare-fun m!585579 () Bool)

(assert (=> b!609002 m!585579))

(assert (=> b!609002 m!585563))

(declare-fun m!585581 () Bool)

(assert (=> b!609002 m!585581))

(declare-fun m!585583 () Bool)

(assert (=> b!609002 m!585583))

(declare-fun m!585585 () Bool)

(assert (=> b!609002 m!585585))

(declare-fun m!585587 () Bool)

(assert (=> start!55588 m!585587))

(declare-fun m!585589 () Bool)

(assert (=> start!55588 m!585589))

(assert (=> b!608998 m!585563))

(assert (=> b!608998 m!585563))

(declare-fun m!585591 () Bool)

(assert (=> b!608998 m!585591))

(declare-fun m!585593 () Bool)

(assert (=> b!609003 m!585593))

(declare-fun m!585595 () Bool)

(assert (=> b!609012 m!585595))

(assert (=> b!609012 m!585563))

(assert (=> b!609012 m!585563))

(declare-fun m!585597 () Bool)

(assert (=> b!609012 m!585597))

(declare-fun m!585599 () Bool)

(assert (=> b!609018 m!585599))

(declare-fun m!585601 () Bool)

(assert (=> b!608999 m!585601))

(declare-fun m!585603 () Bool)

(assert (=> b!609016 m!585603))

(assert (=> b!609016 m!585563))

(declare-fun m!585605 () Bool)

(assert (=> b!609016 m!585605))

(assert (=> b!609016 m!585563))

(declare-fun m!585607 () Bool)

(assert (=> b!609016 m!585607))

(assert (=> b!609016 m!585563))

(declare-fun m!585609 () Bool)

(assert (=> b!609016 m!585609))

(declare-fun m!585611 () Bool)

(assert (=> b!609016 m!585611))

(assert (=> b!609016 m!585563))

(declare-fun m!585613 () Bool)

(assert (=> b!609016 m!585613))

(declare-fun m!585615 () Bool)

(assert (=> b!609016 m!585615))

(assert (=> b!609013 m!585563))

(assert (=> b!609013 m!585577))

(declare-fun m!585617 () Bool)

(assert (=> b!609013 m!585617))

(declare-fun m!585619 () Bool)

(assert (=> b!609010 m!585619))

(assert (=> b!609017 m!585577))

(declare-fun m!585621 () Bool)

(assert (=> b!609017 m!585621))

(declare-fun m!585623 () Bool)

(assert (=> b!609005 m!585623))

(assert (=> b!609020 m!585563))

(assert (=> b!609020 m!585563))

(declare-fun m!585625 () Bool)

(assert (=> b!609020 m!585625))

(declare-fun m!585627 () Bool)

(assert (=> b!609022 m!585627))

(declare-fun m!585629 () Bool)

(assert (=> b!609014 m!585629))

(assert (=> b!608997 m!585563))

(assert (=> b!608997 m!585563))

(assert (=> b!608997 m!585591))

(assert (=> b!609006 m!585563))

(assert (=> b!609006 m!585563))

(declare-fun m!585631 () Bool)

(assert (=> b!609006 m!585631))

(assert (=> b!609006 m!585563))

(declare-fun m!585633 () Bool)

(assert (=> b!609006 m!585633))

(assert (=> b!609006 m!585563))

(assert (=> b!609006 m!585625))

(push 1)

