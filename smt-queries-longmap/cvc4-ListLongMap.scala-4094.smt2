; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56066 () Bool)

(assert start!56066)

(declare-fun b!617798 () Bool)

(declare-fun res!398016 () Bool)

(declare-fun e!354269 () Bool)

(assert (=> b!617798 (=> (not res!398016) (not e!354269))))

(declare-datatypes ((array!37536 0))(
  ( (array!37537 (arr!18014 (Array (_ BitVec 32) (_ BitVec 64))) (size!18378 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37536)

(declare-datatypes ((List!12055 0))(
  ( (Nil!12052) (Cons!12051 (h!13096 (_ BitVec 64)) (t!18283 List!12055)) )
))
(declare-fun arrayNoDuplicates!0 (array!37536 (_ BitVec 32) List!12055) Bool)

(assert (=> b!617798 (= res!398016 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12052))))

(declare-fun b!617799 () Bool)

(declare-datatypes ((Unit!20268 0))(
  ( (Unit!20269) )
))
(declare-fun e!354279 () Unit!20268)

(declare-fun Unit!20270 () Unit!20268)

(assert (=> b!617799 (= e!354279 Unit!20270)))

(declare-fun b!617800 () Bool)

(declare-fun e!354282 () Bool)

(assert (=> b!617800 (= e!354282 true)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!617800 (= (select (store (arr!18014 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!617801 () Bool)

(declare-fun e!354275 () Bool)

(declare-fun e!354268 () Bool)

(assert (=> b!617801 (= e!354275 e!354268)))

(declare-fun res!398020 () Bool)

(assert (=> b!617801 (=> (not res!398020) (not e!354268))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6454 0))(
  ( (MissingZero!6454 (index!28100 (_ BitVec 32))) (Found!6454 (index!28101 (_ BitVec 32))) (Intermediate!6454 (undefined!7266 Bool) (index!28102 (_ BitVec 32)) (x!56886 (_ BitVec 32))) (Undefined!6454) (MissingVacant!6454 (index!28103 (_ BitVec 32))) )
))
(declare-fun lt!284617 () SeekEntryResult!6454)

(assert (=> b!617801 (= res!398020 (and (= lt!284617 (Found!6454 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18014 a!2986) index!984) (select (arr!18014 a!2986) j!136))) (not (= (select (arr!18014 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37536 (_ BitVec 32)) SeekEntryResult!6454)

(assert (=> b!617801 (= lt!284617 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18014 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!617802 () Bool)

(declare-fun e!354274 () Unit!20268)

(declare-fun Unit!20271 () Unit!20268)

(assert (=> b!617802 (= e!354274 Unit!20271)))

(declare-fun b!617803 () Bool)

(declare-fun lt!284599 () array!37536)

(declare-fun e!354273 () Bool)

(declare-fun arrayContainsKey!0 (array!37536 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!617803 (= e!354273 (arrayContainsKey!0 lt!284599 (select (arr!18014 a!2986) j!136) index!984))))

(declare-fun b!617804 () Bool)

(declare-fun e!354276 () Unit!20268)

(declare-fun Unit!20272 () Unit!20268)

(assert (=> b!617804 (= e!354276 Unit!20272)))

(declare-fun res!398010 () Bool)

(assert (=> b!617804 (= res!398010 (= (select (store (arr!18014 a!2986) i!1108 k!1786) index!984) (select (arr!18014 a!2986) j!136)))))

(declare-fun e!354278 () Bool)

(assert (=> b!617804 (=> (not res!398010) (not e!354278))))

(assert (=> b!617804 e!354278))

(declare-fun c!70262 () Bool)

(assert (=> b!617804 (= c!70262 (bvslt j!136 index!984))))

(declare-fun lt!284609 () Unit!20268)

(assert (=> b!617804 (= lt!284609 e!354279)))

(declare-fun c!70263 () Bool)

(assert (=> b!617804 (= c!70263 (bvslt index!984 j!136))))

(declare-fun lt!284598 () Unit!20268)

(assert (=> b!617804 (= lt!284598 e!354274)))

(assert (=> b!617804 false))

(declare-fun b!617805 () Bool)

(assert (=> b!617805 (= e!354268 (not e!354282))))

(declare-fun res!398014 () Bool)

(assert (=> b!617805 (=> res!398014 e!354282)))

(declare-fun lt!284616 () SeekEntryResult!6454)

(assert (=> b!617805 (= res!398014 (not (= lt!284616 (MissingVacant!6454 vacantSpotIndex!68))))))

(declare-fun lt!284605 () Unit!20268)

(assert (=> b!617805 (= lt!284605 e!354276)))

(declare-fun c!70265 () Bool)

(assert (=> b!617805 (= c!70265 (= lt!284616 (Found!6454 index!984)))))

(declare-fun lt!284615 () Unit!20268)

(declare-fun e!354277 () Unit!20268)

(assert (=> b!617805 (= lt!284615 e!354277)))

(declare-fun c!70264 () Bool)

(assert (=> b!617805 (= c!70264 (= lt!284616 Undefined!6454))))

(declare-fun lt!284604 () (_ BitVec 64))

(assert (=> b!617805 (= lt!284616 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284604 lt!284599 mask!3053))))

(declare-fun e!354281 () Bool)

(assert (=> b!617805 e!354281))

(declare-fun res!398013 () Bool)

(assert (=> b!617805 (=> (not res!398013) (not e!354281))))

(declare-fun lt!284601 () SeekEntryResult!6454)

(declare-fun lt!284608 () (_ BitVec 32))

(assert (=> b!617805 (= res!398013 (= lt!284601 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284608 vacantSpotIndex!68 lt!284604 lt!284599 mask!3053)))))

(assert (=> b!617805 (= lt!284601 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284608 vacantSpotIndex!68 (select (arr!18014 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!617805 (= lt!284604 (select (store (arr!18014 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!284614 () Unit!20268)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37536 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20268)

(assert (=> b!617805 (= lt!284614 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284608 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!617805 (= lt!284608 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!398019 () Bool)

(declare-fun e!354270 () Bool)

(assert (=> start!56066 (=> (not res!398019) (not e!354270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56066 (= res!398019 (validMask!0 mask!3053))))

(assert (=> start!56066 e!354270))

(assert (=> start!56066 true))

(declare-fun array_inv!13810 (array!37536) Bool)

(assert (=> start!56066 (array_inv!13810 a!2986)))

(declare-fun b!617806 () Bool)

(declare-fun res!398015 () Bool)

(assert (=> b!617806 (=> (not res!398015) (not e!354270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!617806 (= res!398015 (validKeyInArray!0 k!1786))))

(declare-fun b!617807 () Bool)

(declare-fun Unit!20273 () Unit!20268)

(assert (=> b!617807 (= e!354277 Unit!20273)))

(assert (=> b!617807 false))

(declare-fun b!617808 () Bool)

(declare-fun res!398011 () Bool)

(assert (=> b!617808 (=> (not res!398011) (not e!354270))))

(assert (=> b!617808 (= res!398011 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!617809 () Bool)

(declare-fun e!354280 () Bool)

(assert (=> b!617809 (= e!354280 (arrayContainsKey!0 lt!284599 (select (arr!18014 a!2986) j!136) index!984))))

(declare-fun b!617810 () Bool)

(declare-fun Unit!20274 () Unit!20268)

(assert (=> b!617810 (= e!354277 Unit!20274)))

(declare-fun b!617811 () Bool)

(declare-fun res!398009 () Bool)

(assert (=> b!617811 (=> (not res!398009) (not e!354270))))

(assert (=> b!617811 (= res!398009 (validKeyInArray!0 (select (arr!18014 a!2986) j!136)))))

(declare-fun b!617812 () Bool)

(assert (=> b!617812 false))

(declare-fun lt!284603 () Unit!20268)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37536 (_ BitVec 64) (_ BitVec 32) List!12055) Unit!20268)

(assert (=> b!617812 (= lt!284603 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284599 (select (arr!18014 a!2986) j!136) index!984 Nil!12052))))

(assert (=> b!617812 (arrayNoDuplicates!0 lt!284599 index!984 Nil!12052)))

(declare-fun lt!284600 () Unit!20268)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37536 (_ BitVec 32) (_ BitVec 32)) Unit!20268)

(assert (=> b!617812 (= lt!284600 (lemmaNoDuplicateFromThenFromBigger!0 lt!284599 #b00000000000000000000000000000000 index!984))))

(assert (=> b!617812 (arrayNoDuplicates!0 lt!284599 #b00000000000000000000000000000000 Nil!12052)))

(declare-fun lt!284610 () Unit!20268)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37536 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12055) Unit!20268)

(assert (=> b!617812 (= lt!284610 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12052))))

(assert (=> b!617812 (arrayContainsKey!0 lt!284599 (select (arr!18014 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284612 () Unit!20268)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37536 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20268)

(assert (=> b!617812 (= lt!284612 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284599 (select (arr!18014 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!617812 e!354280))

(declare-fun res!398018 () Bool)

(assert (=> b!617812 (=> (not res!398018) (not e!354280))))

(assert (=> b!617812 (= res!398018 (arrayContainsKey!0 lt!284599 (select (arr!18014 a!2986) j!136) j!136))))

(declare-fun Unit!20275 () Unit!20268)

(assert (=> b!617812 (= e!354274 Unit!20275)))

(declare-fun b!617813 () Bool)

(declare-fun res!398024 () Bool)

(assert (=> b!617813 (= res!398024 (bvsge j!136 index!984))))

(declare-fun e!354271 () Bool)

(assert (=> b!617813 (=> res!398024 e!354271)))

(assert (=> b!617813 (= e!354278 e!354271)))

(declare-fun b!617814 () Bool)

(assert (=> b!617814 (= e!354270 e!354269)))

(declare-fun res!398008 () Bool)

(assert (=> b!617814 (=> (not res!398008) (not e!354269))))

(declare-fun lt!284613 () SeekEntryResult!6454)

(assert (=> b!617814 (= res!398008 (or (= lt!284613 (MissingZero!6454 i!1108)) (= lt!284613 (MissingVacant!6454 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37536 (_ BitVec 32)) SeekEntryResult!6454)

(assert (=> b!617814 (= lt!284613 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!617815 () Bool)

(assert (=> b!617815 false))

(declare-fun lt!284611 () Unit!20268)

(assert (=> b!617815 (= lt!284611 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284599 (select (arr!18014 a!2986) j!136) j!136 Nil!12052))))

(assert (=> b!617815 (arrayNoDuplicates!0 lt!284599 j!136 Nil!12052)))

(declare-fun lt!284607 () Unit!20268)

(assert (=> b!617815 (= lt!284607 (lemmaNoDuplicateFromThenFromBigger!0 lt!284599 #b00000000000000000000000000000000 j!136))))

(assert (=> b!617815 (arrayNoDuplicates!0 lt!284599 #b00000000000000000000000000000000 Nil!12052)))

(declare-fun lt!284606 () Unit!20268)

(assert (=> b!617815 (= lt!284606 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12052))))

(assert (=> b!617815 (arrayContainsKey!0 lt!284599 (select (arr!18014 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284602 () Unit!20268)

(assert (=> b!617815 (= lt!284602 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284599 (select (arr!18014 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20276 () Unit!20268)

(assert (=> b!617815 (= e!354279 Unit!20276)))

(declare-fun b!617816 () Bool)

(declare-fun res!398023 () Bool)

(assert (=> b!617816 (= res!398023 (arrayContainsKey!0 lt!284599 (select (arr!18014 a!2986) j!136) j!136))))

(assert (=> b!617816 (=> (not res!398023) (not e!354273))))

(assert (=> b!617816 (= e!354271 e!354273)))

(declare-fun b!617817 () Bool)

(assert (=> b!617817 (= e!354281 (= lt!284617 lt!284601))))

(declare-fun b!617818 () Bool)

(declare-fun res!398017 () Bool)

(assert (=> b!617818 (=> (not res!398017) (not e!354269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37536 (_ BitVec 32)) Bool)

(assert (=> b!617818 (= res!398017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!617819 () Bool)

(assert (=> b!617819 (= e!354269 e!354275)))

(declare-fun res!398012 () Bool)

(assert (=> b!617819 (=> (not res!398012) (not e!354275))))

(assert (=> b!617819 (= res!398012 (= (select (store (arr!18014 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!617819 (= lt!284599 (array!37537 (store (arr!18014 a!2986) i!1108 k!1786) (size!18378 a!2986)))))

(declare-fun b!617820 () Bool)

(declare-fun res!398021 () Bool)

(assert (=> b!617820 (=> (not res!398021) (not e!354269))))

(assert (=> b!617820 (= res!398021 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18014 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!617821 () Bool)

(declare-fun res!398022 () Bool)

(assert (=> b!617821 (=> (not res!398022) (not e!354270))))

(assert (=> b!617821 (= res!398022 (and (= (size!18378 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18378 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18378 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!617822 () Bool)

(declare-fun Unit!20277 () Unit!20268)

(assert (=> b!617822 (= e!354276 Unit!20277)))

(assert (= (and start!56066 res!398019) b!617821))

(assert (= (and b!617821 res!398022) b!617811))

(assert (= (and b!617811 res!398009) b!617806))

(assert (= (and b!617806 res!398015) b!617808))

(assert (= (and b!617808 res!398011) b!617814))

(assert (= (and b!617814 res!398008) b!617818))

(assert (= (and b!617818 res!398017) b!617798))

(assert (= (and b!617798 res!398016) b!617820))

(assert (= (and b!617820 res!398021) b!617819))

(assert (= (and b!617819 res!398012) b!617801))

(assert (= (and b!617801 res!398020) b!617805))

(assert (= (and b!617805 res!398013) b!617817))

(assert (= (and b!617805 c!70264) b!617807))

(assert (= (and b!617805 (not c!70264)) b!617810))

(assert (= (and b!617805 c!70265) b!617804))

(assert (= (and b!617805 (not c!70265)) b!617822))

(assert (= (and b!617804 res!398010) b!617813))

(assert (= (and b!617813 (not res!398024)) b!617816))

(assert (= (and b!617816 res!398023) b!617803))

(assert (= (and b!617804 c!70262) b!617815))

(assert (= (and b!617804 (not c!70262)) b!617799))

(assert (= (and b!617804 c!70263) b!617812))

(assert (= (and b!617804 (not c!70263)) b!617802))

(assert (= (and b!617812 res!398018) b!617809))

(assert (= (and b!617805 (not res!398014)) b!617800))

(declare-fun m!593881 () Bool)

(assert (=> b!617808 m!593881))

(declare-fun m!593883 () Bool)

(assert (=> b!617814 m!593883))

(declare-fun m!593885 () Bool)

(assert (=> b!617816 m!593885))

(assert (=> b!617816 m!593885))

(declare-fun m!593887 () Bool)

(assert (=> b!617816 m!593887))

(assert (=> b!617812 m!593885))

(declare-fun m!593889 () Bool)

(assert (=> b!617812 m!593889))

(declare-fun m!593891 () Bool)

(assert (=> b!617812 m!593891))

(assert (=> b!617812 m!593885))

(assert (=> b!617812 m!593887))

(declare-fun m!593893 () Bool)

(assert (=> b!617812 m!593893))

(assert (=> b!617812 m!593885))

(declare-fun m!593895 () Bool)

(assert (=> b!617812 m!593895))

(assert (=> b!617812 m!593885))

(declare-fun m!593897 () Bool)

(assert (=> b!617812 m!593897))

(declare-fun m!593899 () Bool)

(assert (=> b!617812 m!593899))

(declare-fun m!593901 () Bool)

(assert (=> b!617812 m!593901))

(assert (=> b!617812 m!593885))

(declare-fun m!593903 () Bool)

(assert (=> b!617800 m!593903))

(declare-fun m!593905 () Bool)

(assert (=> b!617800 m!593905))

(declare-fun m!593907 () Bool)

(assert (=> b!617805 m!593907))

(declare-fun m!593909 () Bool)

(assert (=> b!617805 m!593909))

(assert (=> b!617805 m!593885))

(declare-fun m!593911 () Bool)

(assert (=> b!617805 m!593911))

(assert (=> b!617805 m!593903))

(declare-fun m!593913 () Bool)

(assert (=> b!617805 m!593913))

(assert (=> b!617805 m!593885))

(declare-fun m!593915 () Bool)

(assert (=> b!617805 m!593915))

(declare-fun m!593917 () Bool)

(assert (=> b!617805 m!593917))

(assert (=> b!617811 m!593885))

(assert (=> b!617811 m!593885))

(declare-fun m!593919 () Bool)

(assert (=> b!617811 m!593919))

(assert (=> b!617819 m!593903))

(declare-fun m!593921 () Bool)

(assert (=> b!617819 m!593921))

(declare-fun m!593923 () Bool)

(assert (=> b!617818 m!593923))

(declare-fun m!593925 () Bool)

(assert (=> b!617820 m!593925))

(declare-fun m!593927 () Bool)

(assert (=> b!617806 m!593927))

(assert (=> b!617803 m!593885))

(assert (=> b!617803 m!593885))

(declare-fun m!593929 () Bool)

(assert (=> b!617803 m!593929))

(assert (=> b!617804 m!593903))

(assert (=> b!617804 m!593905))

(assert (=> b!617804 m!593885))

(declare-fun m!593931 () Bool)

(assert (=> b!617801 m!593931))

(assert (=> b!617801 m!593885))

(assert (=> b!617801 m!593885))

(declare-fun m!593933 () Bool)

(assert (=> b!617801 m!593933))

(declare-fun m!593935 () Bool)

(assert (=> start!56066 m!593935))

(declare-fun m!593937 () Bool)

(assert (=> start!56066 m!593937))

(declare-fun m!593939 () Bool)

(assert (=> b!617798 m!593939))

(assert (=> b!617809 m!593885))

(assert (=> b!617809 m!593885))

(assert (=> b!617809 m!593929))

(assert (=> b!617815 m!593885))

(declare-fun m!593941 () Bool)

(assert (=> b!617815 m!593941))

(assert (=> b!617815 m!593891))

(assert (=> b!617815 m!593885))

(declare-fun m!593943 () Bool)

(assert (=> b!617815 m!593943))

(assert (=> b!617815 m!593885))

(declare-fun m!593945 () Bool)

(assert (=> b!617815 m!593945))

(assert (=> b!617815 m!593899))

(assert (=> b!617815 m!593885))

(declare-fun m!593947 () Bool)

(assert (=> b!617815 m!593947))

(declare-fun m!593949 () Bool)

(assert (=> b!617815 m!593949))

(push 1)

(assert (not b!617798))

(assert (not b!617808))

(assert (not b!617815))

(assert (not b!617805))

(assert (not b!617803))

(assert (not start!56066))

(assert (not b!617806))

(assert (not b!617809))

(assert (not b!617812))

(assert (not b!617816))

(assert (not b!617801))

(assert (not b!617811))

(assert (not b!617818))

(assert (not b!617814))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

