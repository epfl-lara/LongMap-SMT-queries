; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55602 () Bool)

(assert start!55602)

(declare-fun b!607748 () Bool)

(declare-fun e!348054 () Bool)

(declare-datatypes ((SeekEntryResult!6283 0))(
  ( (MissingZero!6283 (index!27407 (_ BitVec 32))) (Found!6283 (index!27408 (_ BitVec 32))) (Intermediate!6283 (undefined!7095 Bool) (index!27409 (_ BitVec 32)) (x!56371 (_ BitVec 32))) (Undefined!6283) (MissingVacant!6283 (index!27410 (_ BitVec 32))) )
))
(declare-fun lt!277493 () SeekEntryResult!6283)

(declare-fun lt!277491 () SeekEntryResult!6283)

(assert (=> b!607748 (= e!348054 (= lt!277493 lt!277491))))

(declare-fun b!607749 () Bool)

(declare-fun res!390453 () Bool)

(declare-fun e!348040 () Bool)

(assert (=> b!607749 (=> (not res!390453) (not e!348040))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37278 0))(
  ( (array!37279 (arr!17887 (Array (_ BitVec 32) (_ BitVec 64))) (size!18251 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37278)

(assert (=> b!607749 (= res!390453 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17887 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!607750 () Bool)

(declare-fun e!348048 () Bool)

(assert (=> b!607750 (= e!348048 true)))

(declare-fun lt!277499 () Bool)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((List!11835 0))(
  ( (Nil!11832) (Cons!11831 (h!12879 (_ BitVec 64)) (t!18055 List!11835)) )
))
(declare-fun contains!2985 (List!11835 (_ BitVec 64)) Bool)

(assert (=> b!607750 (= lt!277499 (contains!2985 Nil!11832 k0!1786))))

(declare-fun b!607751 () Bool)

(declare-fun res!390462 () Bool)

(assert (=> b!607751 (=> (not res!390462) (not e!348040))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37278 (_ BitVec 32)) Bool)

(assert (=> b!607751 (= res!390462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!607752 () Bool)

(declare-fun e!348046 () Bool)

(declare-fun e!348041 () Bool)

(assert (=> b!607752 (= e!348046 e!348041)))

(declare-fun res!390448 () Bool)

(assert (=> b!607752 (=> res!390448 e!348041)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!277496 () (_ BitVec 64))

(declare-fun lt!277492 () (_ BitVec 64))

(assert (=> b!607752 (= res!390448 (or (not (= (select (arr!17887 a!2986) j!136) lt!277492)) (not (= (select (arr!17887 a!2986) j!136) lt!277496))))))

(declare-fun e!348049 () Bool)

(assert (=> b!607752 e!348049))

(declare-fun res!390463 () Bool)

(assert (=> b!607752 (=> (not res!390463) (not e!348049))))

(assert (=> b!607752 (= res!390463 (= lt!277496 (select (arr!17887 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!607752 (= lt!277496 (select (store (arr!17887 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!607753 () Bool)

(declare-fun e!348039 () Bool)

(declare-fun e!348045 () Bool)

(assert (=> b!607753 (= e!348039 e!348045)))

(declare-fun res!390455 () Bool)

(assert (=> b!607753 (=> (not res!390455) (not e!348045))))

(assert (=> b!607753 (= res!390455 (and (= lt!277493 (Found!6283 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17887 a!2986) index!984) (select (arr!17887 a!2986) j!136))) (not (= (select (arr!17887 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37278 (_ BitVec 32)) SeekEntryResult!6283)

(assert (=> b!607753 (= lt!277493 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17887 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!277500 () array!37278)

(declare-fun b!607754 () Bool)

(declare-fun e!348053 () Bool)

(declare-fun arrayContainsKey!0 (array!37278 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!607754 (= e!348053 (arrayContainsKey!0 lt!277500 (select (arr!17887 a!2986) j!136) index!984))))

(declare-fun b!607755 () Bool)

(declare-fun e!348047 () Bool)

(assert (=> b!607755 (= e!348041 e!348047)))

(declare-fun res!390465 () Bool)

(assert (=> b!607755 (=> res!390465 e!348047)))

(assert (=> b!607755 (= res!390465 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!19351 0))(
  ( (Unit!19352) )
))
(declare-fun lt!277495 () Unit!19351)

(declare-fun e!348044 () Unit!19351)

(assert (=> b!607755 (= lt!277495 e!348044)))

(declare-fun c!69020 () Bool)

(assert (=> b!607755 (= c!69020 (bvslt j!136 index!984))))

(declare-fun b!607756 () Bool)

(declare-fun res!390449 () Bool)

(assert (=> b!607756 (=> res!390449 e!348048)))

(declare-fun noDuplicate!319 (List!11835) Bool)

(assert (=> b!607756 (= res!390449 (not (noDuplicate!319 Nil!11832)))))

(declare-fun b!607757 () Bool)

(assert (=> b!607757 (= e!348045 (not e!348046))))

(declare-fun res!390459 () Bool)

(assert (=> b!607757 (=> res!390459 e!348046)))

(declare-fun lt!277488 () SeekEntryResult!6283)

(assert (=> b!607757 (= res!390459 (not (= lt!277488 (Found!6283 index!984))))))

(declare-fun lt!277497 () Unit!19351)

(declare-fun e!348043 () Unit!19351)

(assert (=> b!607757 (= lt!277497 e!348043)))

(declare-fun c!69019 () Bool)

(assert (=> b!607757 (= c!69019 (= lt!277488 Undefined!6283))))

(assert (=> b!607757 (= lt!277488 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277492 lt!277500 mask!3053))))

(assert (=> b!607757 e!348054))

(declare-fun res!390447 () Bool)

(assert (=> b!607757 (=> (not res!390447) (not e!348054))))

(declare-fun lt!277503 () (_ BitVec 32))

(assert (=> b!607757 (= res!390447 (= lt!277491 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277503 vacantSpotIndex!68 lt!277492 lt!277500 mask!3053)))))

(assert (=> b!607757 (= lt!277491 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277503 vacantSpotIndex!68 (select (arr!17887 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!607757 (= lt!277492 (select (store (arr!17887 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!277502 () Unit!19351)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37278 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19351)

(assert (=> b!607757 (= lt!277502 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277503 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!607757 (= lt!277503 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun e!348051 () Bool)

(declare-fun b!607758 () Bool)

(assert (=> b!607758 (= e!348051 (arrayContainsKey!0 lt!277500 (select (arr!17887 a!2986) j!136) index!984))))

(declare-fun b!607759 () Bool)

(declare-fun Unit!19353 () Unit!19351)

(assert (=> b!607759 (= e!348044 Unit!19353)))

(declare-fun b!607760 () Bool)

(declare-fun res!390452 () Bool)

(declare-fun e!348052 () Bool)

(assert (=> b!607760 (=> (not res!390452) (not e!348052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!607760 (= res!390452 (validKeyInArray!0 (select (arr!17887 a!2986) j!136)))))

(declare-fun b!607761 () Bool)

(assert (=> b!607761 (= e!348040 e!348039)))

(declare-fun res!390467 () Bool)

(assert (=> b!607761 (=> (not res!390467) (not e!348039))))

(assert (=> b!607761 (= res!390467 (= (select (store (arr!17887 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!607761 (= lt!277500 (array!37279 (store (arr!17887 a!2986) i!1108 k0!1786) (size!18251 a!2986)))))

(declare-fun b!607762 () Bool)

(declare-fun res!390458 () Bool)

(assert (=> b!607762 (=> res!390458 e!348048)))

(assert (=> b!607762 (= res!390458 (contains!2985 Nil!11832 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607764 () Bool)

(declare-fun e!348050 () Bool)

(assert (=> b!607764 (= e!348050 e!348051)))

(declare-fun res!390461 () Bool)

(assert (=> b!607764 (=> (not res!390461) (not e!348051))))

(assert (=> b!607764 (= res!390461 (arrayContainsKey!0 lt!277500 (select (arr!17887 a!2986) j!136) j!136))))

(declare-fun b!607765 () Bool)

(assert (=> b!607765 (= e!348049 e!348050)))

(declare-fun res!390469 () Bool)

(assert (=> b!607765 (=> res!390469 e!348050)))

(assert (=> b!607765 (= res!390469 (or (not (= (select (arr!17887 a!2986) j!136) lt!277492)) (not (= (select (arr!17887 a!2986) j!136) lt!277496)) (bvsge j!136 index!984)))))

(declare-fun b!607766 () Bool)

(declare-fun res!390466 () Bool)

(assert (=> b!607766 (=> (not res!390466) (not e!348040))))

(declare-fun arrayNoDuplicates!0 (array!37278 (_ BitVec 32) List!11835) Bool)

(assert (=> b!607766 (= res!390466 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11832))))

(declare-fun b!607767 () Bool)

(declare-fun Unit!19354 () Unit!19351)

(assert (=> b!607767 (= e!348044 Unit!19354)))

(declare-fun lt!277501 () Unit!19351)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37278 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19351)

(assert (=> b!607767 (= lt!277501 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277500 (select (arr!17887 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!607767 (arrayContainsKey!0 lt!277500 (select (arr!17887 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277504 () Unit!19351)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37278 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11835) Unit!19351)

(assert (=> b!607767 (= lt!277504 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11832))))

(assert (=> b!607767 (arrayNoDuplicates!0 lt!277500 #b00000000000000000000000000000000 Nil!11832)))

(declare-fun lt!277490 () Unit!19351)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37278 (_ BitVec 32) (_ BitVec 32)) Unit!19351)

(assert (=> b!607767 (= lt!277490 (lemmaNoDuplicateFromThenFromBigger!0 lt!277500 #b00000000000000000000000000000000 j!136))))

(assert (=> b!607767 (arrayNoDuplicates!0 lt!277500 j!136 Nil!11832)))

(declare-fun lt!277498 () Unit!19351)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37278 (_ BitVec 64) (_ BitVec 32) List!11835) Unit!19351)

(assert (=> b!607767 (= lt!277498 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277500 (select (arr!17887 a!2986) j!136) j!136 Nil!11832))))

(assert (=> b!607767 false))

(declare-fun b!607768 () Bool)

(assert (=> b!607768 (= e!348047 e!348048)))

(declare-fun res!390456 () Bool)

(assert (=> b!607768 (=> res!390456 e!348048)))

(assert (=> b!607768 (= res!390456 (or (bvsge (size!18251 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18251 a!2986))))))

(assert (=> b!607768 (arrayContainsKey!0 lt!277500 (select (arr!17887 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277489 () Unit!19351)

(assert (=> b!607768 (= lt!277489 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277500 (select (arr!17887 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!607768 e!348053))

(declare-fun res!390468 () Bool)

(assert (=> b!607768 (=> (not res!390468) (not e!348053))))

(assert (=> b!607768 (= res!390468 (arrayContainsKey!0 lt!277500 (select (arr!17887 a!2986) j!136) j!136))))

(declare-fun b!607769 () Bool)

(declare-fun Unit!19355 () Unit!19351)

(assert (=> b!607769 (= e!348043 Unit!19355)))

(declare-fun b!607770 () Bool)

(declare-fun res!390451 () Bool)

(assert (=> b!607770 (=> (not res!390451) (not e!348052))))

(assert (=> b!607770 (= res!390451 (validKeyInArray!0 k0!1786))))

(declare-fun b!607771 () Bool)

(assert (=> b!607771 (= e!348052 e!348040)))

(declare-fun res!390457 () Bool)

(assert (=> b!607771 (=> (not res!390457) (not e!348040))))

(declare-fun lt!277494 () SeekEntryResult!6283)

(assert (=> b!607771 (= res!390457 (or (= lt!277494 (MissingZero!6283 i!1108)) (= lt!277494 (MissingVacant!6283 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37278 (_ BitVec 32)) SeekEntryResult!6283)

(assert (=> b!607771 (= lt!277494 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!607772 () Bool)

(declare-fun Unit!19356 () Unit!19351)

(assert (=> b!607772 (= e!348043 Unit!19356)))

(assert (=> b!607772 false))

(declare-fun b!607773 () Bool)

(declare-fun res!390454 () Bool)

(assert (=> b!607773 (=> (not res!390454) (not e!348052))))

(assert (=> b!607773 (= res!390454 (and (= (size!18251 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18251 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18251 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!607774 () Bool)

(declare-fun res!390450 () Bool)

(assert (=> b!607774 (=> res!390450 e!348048)))

(assert (=> b!607774 (= res!390450 (contains!2985 Nil!11832 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607763 () Bool)

(declare-fun res!390460 () Bool)

(assert (=> b!607763 (=> (not res!390460) (not e!348052))))

(assert (=> b!607763 (= res!390460 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!390464 () Bool)

(assert (=> start!55602 (=> (not res!390464) (not e!348052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55602 (= res!390464 (validMask!0 mask!3053))))

(assert (=> start!55602 e!348052))

(assert (=> start!55602 true))

(declare-fun array_inv!13746 (array!37278) Bool)

(assert (=> start!55602 (array_inv!13746 a!2986)))

(assert (= (and start!55602 res!390464) b!607773))

(assert (= (and b!607773 res!390454) b!607760))

(assert (= (and b!607760 res!390452) b!607770))

(assert (= (and b!607770 res!390451) b!607763))

(assert (= (and b!607763 res!390460) b!607771))

(assert (= (and b!607771 res!390457) b!607751))

(assert (= (and b!607751 res!390462) b!607766))

(assert (= (and b!607766 res!390466) b!607749))

(assert (= (and b!607749 res!390453) b!607761))

(assert (= (and b!607761 res!390467) b!607753))

(assert (= (and b!607753 res!390455) b!607757))

(assert (= (and b!607757 res!390447) b!607748))

(assert (= (and b!607757 c!69019) b!607772))

(assert (= (and b!607757 (not c!69019)) b!607769))

(assert (= (and b!607757 (not res!390459)) b!607752))

(assert (= (and b!607752 res!390463) b!607765))

(assert (= (and b!607765 (not res!390469)) b!607764))

(assert (= (and b!607764 res!390461) b!607758))

(assert (= (and b!607752 (not res!390448)) b!607755))

(assert (= (and b!607755 c!69020) b!607767))

(assert (= (and b!607755 (not c!69020)) b!607759))

(assert (= (and b!607755 (not res!390465)) b!607768))

(assert (= (and b!607768 res!390468) b!607754))

(assert (= (and b!607768 (not res!390456)) b!607756))

(assert (= (and b!607756 (not res!390449)) b!607774))

(assert (= (and b!607774 (not res!390450)) b!607762))

(assert (= (and b!607762 (not res!390458)) b!607750))

(declare-fun m!584735 () Bool)

(assert (=> b!607762 m!584735))

(declare-fun m!584737 () Bool)

(assert (=> b!607750 m!584737))

(declare-fun m!584739 () Bool)

(assert (=> start!55602 m!584739))

(declare-fun m!584741 () Bool)

(assert (=> start!55602 m!584741))

(declare-fun m!584743 () Bool)

(assert (=> b!607765 m!584743))

(assert (=> b!607764 m!584743))

(assert (=> b!607764 m!584743))

(declare-fun m!584745 () Bool)

(assert (=> b!607764 m!584745))

(assert (=> b!607758 m!584743))

(assert (=> b!607758 m!584743))

(declare-fun m!584747 () Bool)

(assert (=> b!607758 m!584747))

(declare-fun m!584749 () Bool)

(assert (=> b!607770 m!584749))

(declare-fun m!584751 () Bool)

(assert (=> b!607757 m!584751))

(declare-fun m!584753 () Bool)

(assert (=> b!607757 m!584753))

(declare-fun m!584755 () Bool)

(assert (=> b!607757 m!584755))

(assert (=> b!607757 m!584743))

(declare-fun m!584757 () Bool)

(assert (=> b!607757 m!584757))

(assert (=> b!607757 m!584743))

(declare-fun m!584759 () Bool)

(assert (=> b!607757 m!584759))

(declare-fun m!584761 () Bool)

(assert (=> b!607757 m!584761))

(declare-fun m!584763 () Bool)

(assert (=> b!607757 m!584763))

(declare-fun m!584765 () Bool)

(assert (=> b!607774 m!584765))

(declare-fun m!584767 () Bool)

(assert (=> b!607766 m!584767))

(assert (=> b!607752 m!584743))

(assert (=> b!607752 m!584757))

(declare-fun m!584769 () Bool)

(assert (=> b!607752 m!584769))

(declare-fun m!584771 () Bool)

(assert (=> b!607771 m!584771))

(declare-fun m!584773 () Bool)

(assert (=> b!607753 m!584773))

(assert (=> b!607753 m!584743))

(assert (=> b!607753 m!584743))

(declare-fun m!584775 () Bool)

(assert (=> b!607753 m!584775))

(assert (=> b!607761 m!584757))

(declare-fun m!584777 () Bool)

(assert (=> b!607761 m!584777))

(assert (=> b!607760 m!584743))

(assert (=> b!607760 m!584743))

(declare-fun m!584779 () Bool)

(assert (=> b!607760 m!584779))

(assert (=> b!607767 m!584743))

(declare-fun m!584781 () Bool)

(assert (=> b!607767 m!584781))

(declare-fun m!584783 () Bool)

(assert (=> b!607767 m!584783))

(declare-fun m!584785 () Bool)

(assert (=> b!607767 m!584785))

(assert (=> b!607767 m!584743))

(declare-fun m!584787 () Bool)

(assert (=> b!607767 m!584787))

(declare-fun m!584789 () Bool)

(assert (=> b!607767 m!584789))

(declare-fun m!584791 () Bool)

(assert (=> b!607767 m!584791))

(assert (=> b!607767 m!584743))

(assert (=> b!607767 m!584743))

(declare-fun m!584793 () Bool)

(assert (=> b!607767 m!584793))

(declare-fun m!584795 () Bool)

(assert (=> b!607763 m!584795))

(assert (=> b!607768 m!584743))

(assert (=> b!607768 m!584743))

(declare-fun m!584797 () Bool)

(assert (=> b!607768 m!584797))

(assert (=> b!607768 m!584743))

(declare-fun m!584799 () Bool)

(assert (=> b!607768 m!584799))

(assert (=> b!607768 m!584743))

(assert (=> b!607768 m!584745))

(assert (=> b!607754 m!584743))

(assert (=> b!607754 m!584743))

(assert (=> b!607754 m!584747))

(declare-fun m!584801 () Bool)

(assert (=> b!607749 m!584801))

(declare-fun m!584803 () Bool)

(assert (=> b!607751 m!584803))

(declare-fun m!584805 () Bool)

(assert (=> b!607756 m!584805))

(check-sat (not b!607756) (not b!607751) (not start!55602) (not b!607753) (not b!607754) (not b!607768) (not b!607757) (not b!607767) (not b!607771) (not b!607763) (not b!607774) (not b!607766) (not b!607770) (not b!607758) (not b!607760) (not b!607750) (not b!607762) (not b!607764))
(check-sat)
