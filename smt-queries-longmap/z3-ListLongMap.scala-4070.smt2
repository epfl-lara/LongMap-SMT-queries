; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55902 () Bool)

(assert start!55902)

(declare-fun b!611991 () Bool)

(declare-fun e!350759 () Bool)

(declare-fun e!350756 () Bool)

(assert (=> b!611991 (= e!350759 e!350756)))

(declare-fun res!393733 () Bool)

(assert (=> b!611991 (=> (not res!393733) (not e!350756))))

(declare-datatypes ((SeekEntryResult!6376 0))(
  ( (MissingZero!6376 (index!27788 (_ BitVec 32))) (Found!6376 (index!27789 (_ BitVec 32))) (Intermediate!6376 (undefined!7188 Bool) (index!27790 (_ BitVec 32)) (x!56611 (_ BitVec 32))) (Undefined!6376) (MissingVacant!6376 (index!27791 (_ BitVec 32))) )
))
(declare-fun lt!280065 () SeekEntryResult!6376)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37386 0))(
  ( (array!37387 (arr!17939 (Array (_ BitVec 32) (_ BitVec 64))) (size!18304 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37386)

(assert (=> b!611991 (= res!393733 (and (= lt!280065 (Found!6376 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17939 a!2986) index!984) (select (arr!17939 a!2986) j!136))) (not (= (select (arr!17939 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37386 (_ BitVec 32)) SeekEntryResult!6376)

(assert (=> b!611991 (= lt!280065 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17939 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!611992 () Bool)

(declare-fun e!350751 () Bool)

(declare-fun e!350760 () Bool)

(assert (=> b!611992 (= e!350751 e!350760)))

(declare-fun res!393736 () Bool)

(assert (=> b!611992 (=> (not res!393736) (not e!350760))))

(declare-fun lt!280056 () SeekEntryResult!6376)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!611992 (= res!393736 (or (= lt!280056 (MissingZero!6376 i!1108)) (= lt!280056 (MissingVacant!6376 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37386 (_ BitVec 32)) SeekEntryResult!6376)

(assert (=> b!611992 (= lt!280056 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!611993 () Bool)

(declare-fun res!393735 () Bool)

(assert (=> b!611993 (=> (not res!393735) (not e!350760))))

(declare-datatypes ((List!12019 0))(
  ( (Nil!12016) (Cons!12015 (h!13060 (_ BitVec 64)) (t!18238 List!12019)) )
))
(declare-fun arrayNoDuplicates!0 (array!37386 (_ BitVec 32) List!12019) Bool)

(assert (=> b!611993 (= res!393735 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12016))))

(declare-fun b!611994 () Bool)

(declare-fun res!393749 () Bool)

(assert (=> b!611994 (=> (not res!393749) (not e!350751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!611994 (= res!393749 (validKeyInArray!0 k0!1786))))

(declare-fun b!611995 () Bool)

(declare-fun e!350757 () Bool)

(declare-fun e!350749 () Bool)

(assert (=> b!611995 (= e!350757 e!350749)))

(declare-fun res!393747 () Bool)

(assert (=> b!611995 (=> res!393747 e!350749)))

(assert (=> b!611995 (= res!393747 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!19638 0))(
  ( (Unit!19639) )
))
(declare-fun lt!280057 () Unit!19638)

(declare-fun e!350752 () Unit!19638)

(assert (=> b!611995 (= lt!280057 e!350752)))

(declare-fun c!69497 () Bool)

(assert (=> b!611995 (= c!69497 (bvslt j!136 index!984))))

(declare-fun b!611996 () Bool)

(declare-fun Unit!19640 () Unit!19638)

(assert (=> b!611996 (= e!350752 Unit!19640)))

(declare-fun lt!280055 () array!37386)

(declare-fun lt!280066 () Unit!19638)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37386 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19638)

(assert (=> b!611996 (= lt!280066 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280055 (select (arr!17939 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37386 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!611996 (arrayContainsKey!0 lt!280055 (select (arr!17939 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!280069 () Unit!19638)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37386 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12019) Unit!19638)

(assert (=> b!611996 (= lt!280069 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12016))))

(assert (=> b!611996 (arrayNoDuplicates!0 lt!280055 #b00000000000000000000000000000000 Nil!12016)))

(declare-fun lt!280063 () Unit!19638)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37386 (_ BitVec 32) (_ BitVec 32)) Unit!19638)

(assert (=> b!611996 (= lt!280063 (lemmaNoDuplicateFromThenFromBigger!0 lt!280055 #b00000000000000000000000000000000 j!136))))

(assert (=> b!611996 (arrayNoDuplicates!0 lt!280055 j!136 Nil!12016)))

(declare-fun lt!280064 () Unit!19638)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37386 (_ BitVec 64) (_ BitVec 32) List!12019) Unit!19638)

(assert (=> b!611996 (= lt!280064 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!280055 (select (arr!17939 a!2986) j!136) j!136 Nil!12016))))

(assert (=> b!611996 false))

(declare-fun b!611997 () Bool)

(declare-fun e!350755 () Bool)

(assert (=> b!611997 (= e!350756 (not e!350755))))

(declare-fun res!393732 () Bool)

(assert (=> b!611997 (=> res!393732 e!350755)))

(declare-fun lt!280062 () SeekEntryResult!6376)

(assert (=> b!611997 (= res!393732 (not (= lt!280062 (Found!6376 index!984))))))

(declare-fun lt!280053 () Unit!19638)

(declare-fun e!350748 () Unit!19638)

(assert (=> b!611997 (= lt!280053 e!350748)))

(declare-fun c!69498 () Bool)

(assert (=> b!611997 (= c!69498 (= lt!280062 Undefined!6376))))

(declare-fun lt!280060 () (_ BitVec 64))

(assert (=> b!611997 (= lt!280062 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!280060 lt!280055 mask!3053))))

(declare-fun e!350753 () Bool)

(assert (=> b!611997 e!350753))

(declare-fun res!393739 () Bool)

(assert (=> b!611997 (=> (not res!393739) (not e!350753))))

(declare-fun lt!280054 () (_ BitVec 32))

(declare-fun lt!280059 () SeekEntryResult!6376)

(assert (=> b!611997 (= res!393739 (= lt!280059 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280054 vacantSpotIndex!68 lt!280060 lt!280055 mask!3053)))))

(assert (=> b!611997 (= lt!280059 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280054 vacantSpotIndex!68 (select (arr!17939 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!611997 (= lt!280060 (select (store (arr!17939 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!280068 () Unit!19638)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37386 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19638)

(assert (=> b!611997 (= lt!280068 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!280054 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!611997 (= lt!280054 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!611998 () Bool)

(assert (=> b!611998 (= e!350760 e!350759)))

(declare-fun res!393745 () Bool)

(assert (=> b!611998 (=> (not res!393745) (not e!350759))))

(assert (=> b!611998 (= res!393745 (= (select (store (arr!17939 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611998 (= lt!280055 (array!37387 (store (arr!17939 a!2986) i!1108 k0!1786) (size!18304 a!2986)))))

(declare-fun b!611999 () Bool)

(declare-fun Unit!19641 () Unit!19638)

(assert (=> b!611999 (= e!350748 Unit!19641)))

(declare-fun b!612000 () Bool)

(declare-fun e!350750 () Bool)

(declare-fun e!350747 () Bool)

(assert (=> b!612000 (= e!350750 e!350747)))

(declare-fun res!393743 () Bool)

(assert (=> b!612000 (=> res!393743 e!350747)))

(declare-fun lt!280067 () (_ BitVec 64))

(assert (=> b!612000 (= res!393743 (or (not (= (select (arr!17939 a!2986) j!136) lt!280060)) (not (= (select (arr!17939 a!2986) j!136) lt!280067)) (bvsge j!136 index!984)))))

(declare-fun b!612001 () Bool)

(declare-fun Unit!19642 () Unit!19638)

(assert (=> b!612001 (= e!350748 Unit!19642)))

(assert (=> b!612001 false))

(declare-fun b!612002 () Bool)

(declare-fun res!393734 () Bool)

(assert (=> b!612002 (=> (not res!393734) (not e!350760))))

(assert (=> b!612002 (= res!393734 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17939 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!612003 () Bool)

(declare-fun e!350754 () Bool)

(assert (=> b!612003 (= e!350754 (arrayContainsKey!0 lt!280055 (select (arr!17939 a!2986) j!136) index!984))))

(declare-fun b!612004 () Bool)

(assert (=> b!612004 (= e!350749 true)))

(assert (=> b!612004 (arrayNoDuplicates!0 lt!280055 #b00000000000000000000000000000000 Nil!12016)))

(declare-fun lt!280058 () Unit!19638)

(assert (=> b!612004 (= lt!280058 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12016))))

(assert (=> b!612004 (arrayContainsKey!0 lt!280055 (select (arr!17939 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!280061 () Unit!19638)

(assert (=> b!612004 (= lt!280061 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280055 (select (arr!17939 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!350746 () Bool)

(assert (=> b!612004 e!350746))

(declare-fun res!393738 () Bool)

(assert (=> b!612004 (=> (not res!393738) (not e!350746))))

(assert (=> b!612004 (= res!393738 (arrayContainsKey!0 lt!280055 (select (arr!17939 a!2986) j!136) j!136))))

(declare-fun b!612005 () Bool)

(declare-fun res!393742 () Bool)

(assert (=> b!612005 (=> (not res!393742) (not e!350760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37386 (_ BitVec 32)) Bool)

(assert (=> b!612005 (= res!393742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!612006 () Bool)

(assert (=> b!612006 (= e!350753 (= lt!280065 lt!280059))))

(declare-fun b!612007 () Bool)

(declare-fun res!393746 () Bool)

(assert (=> b!612007 (=> (not res!393746) (not e!350751))))

(assert (=> b!612007 (= res!393746 (and (= (size!18304 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18304 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18304 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!612008 () Bool)

(assert (=> b!612008 (= e!350747 e!350754)))

(declare-fun res!393737 () Bool)

(assert (=> b!612008 (=> (not res!393737) (not e!350754))))

(assert (=> b!612008 (= res!393737 (arrayContainsKey!0 lt!280055 (select (arr!17939 a!2986) j!136) j!136))))

(declare-fun b!612009 () Bool)

(assert (=> b!612009 (= e!350755 e!350757)))

(declare-fun res!393740 () Bool)

(assert (=> b!612009 (=> res!393740 e!350757)))

(assert (=> b!612009 (= res!393740 (or (not (= (select (arr!17939 a!2986) j!136) lt!280060)) (not (= (select (arr!17939 a!2986) j!136) lt!280067))))))

(assert (=> b!612009 e!350750))

(declare-fun res!393744 () Bool)

(assert (=> b!612009 (=> (not res!393744) (not e!350750))))

(assert (=> b!612009 (= res!393744 (= lt!280067 (select (arr!17939 a!2986) j!136)))))

(assert (=> b!612009 (= lt!280067 (select (store (arr!17939 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!612010 () Bool)

(declare-fun res!393731 () Bool)

(assert (=> b!612010 (=> (not res!393731) (not e!350751))))

(assert (=> b!612010 (= res!393731 (validKeyInArray!0 (select (arr!17939 a!2986) j!136)))))

(declare-fun b!612011 () Bool)

(assert (=> b!612011 (= e!350746 (arrayContainsKey!0 lt!280055 (select (arr!17939 a!2986) j!136) index!984))))

(declare-fun res!393741 () Bool)

(assert (=> start!55902 (=> (not res!393741) (not e!350751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55902 (= res!393741 (validMask!0 mask!3053))))

(assert (=> start!55902 e!350751))

(assert (=> start!55902 true))

(declare-fun array_inv!13822 (array!37386) Bool)

(assert (=> start!55902 (array_inv!13822 a!2986)))

(declare-fun b!612012 () Bool)

(declare-fun Unit!19643 () Unit!19638)

(assert (=> b!612012 (= e!350752 Unit!19643)))

(declare-fun b!612013 () Bool)

(declare-fun res!393748 () Bool)

(assert (=> b!612013 (=> (not res!393748) (not e!350751))))

(assert (=> b!612013 (= res!393748 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!55902 res!393741) b!612007))

(assert (= (and b!612007 res!393746) b!612010))

(assert (= (and b!612010 res!393731) b!611994))

(assert (= (and b!611994 res!393749) b!612013))

(assert (= (and b!612013 res!393748) b!611992))

(assert (= (and b!611992 res!393736) b!612005))

(assert (= (and b!612005 res!393742) b!611993))

(assert (= (and b!611993 res!393735) b!612002))

(assert (= (and b!612002 res!393734) b!611998))

(assert (= (and b!611998 res!393745) b!611991))

(assert (= (and b!611991 res!393733) b!611997))

(assert (= (and b!611997 res!393739) b!612006))

(assert (= (and b!611997 c!69498) b!612001))

(assert (= (and b!611997 (not c!69498)) b!611999))

(assert (= (and b!611997 (not res!393732)) b!612009))

(assert (= (and b!612009 res!393744) b!612000))

(assert (= (and b!612000 (not res!393743)) b!612008))

(assert (= (and b!612008 res!393737) b!612003))

(assert (= (and b!612009 (not res!393740)) b!611995))

(assert (= (and b!611995 c!69497) b!611996))

(assert (= (and b!611995 (not c!69497)) b!612012))

(assert (= (and b!611995 (not res!393747)) b!612004))

(assert (= (and b!612004 res!393738) b!612011))

(declare-fun m!587851 () Bool)

(assert (=> b!611991 m!587851))

(declare-fun m!587853 () Bool)

(assert (=> b!611991 m!587853))

(assert (=> b!611991 m!587853))

(declare-fun m!587855 () Bool)

(assert (=> b!611991 m!587855))

(declare-fun m!587857 () Bool)

(assert (=> b!611993 m!587857))

(declare-fun m!587859 () Bool)

(assert (=> b!611996 m!587859))

(assert (=> b!611996 m!587853))

(assert (=> b!611996 m!587853))

(declare-fun m!587861 () Bool)

(assert (=> b!611996 m!587861))

(assert (=> b!611996 m!587853))

(declare-fun m!587863 () Bool)

(assert (=> b!611996 m!587863))

(declare-fun m!587865 () Bool)

(assert (=> b!611996 m!587865))

(assert (=> b!611996 m!587853))

(declare-fun m!587867 () Bool)

(assert (=> b!611996 m!587867))

(declare-fun m!587869 () Bool)

(assert (=> b!611996 m!587869))

(declare-fun m!587871 () Bool)

(assert (=> b!611996 m!587871))

(declare-fun m!587873 () Bool)

(assert (=> b!611992 m!587873))

(declare-fun m!587875 () Bool)

(assert (=> start!55902 m!587875))

(declare-fun m!587877 () Bool)

(assert (=> start!55902 m!587877))

(declare-fun m!587879 () Bool)

(assert (=> b!611997 m!587879))

(assert (=> b!611997 m!587853))

(declare-fun m!587881 () Bool)

(assert (=> b!611997 m!587881))

(declare-fun m!587883 () Bool)

(assert (=> b!611997 m!587883))

(assert (=> b!611997 m!587853))

(declare-fun m!587885 () Bool)

(assert (=> b!611997 m!587885))

(declare-fun m!587887 () Bool)

(assert (=> b!611997 m!587887))

(declare-fun m!587889 () Bool)

(assert (=> b!611997 m!587889))

(declare-fun m!587891 () Bool)

(assert (=> b!611997 m!587891))

(declare-fun m!587893 () Bool)

(assert (=> b!612005 m!587893))

(assert (=> b!612000 m!587853))

(assert (=> b!612009 m!587853))

(assert (=> b!612009 m!587883))

(declare-fun m!587895 () Bool)

(assert (=> b!612009 m!587895))

(assert (=> b!611998 m!587883))

(declare-fun m!587897 () Bool)

(assert (=> b!611998 m!587897))

(assert (=> b!612011 m!587853))

(assert (=> b!612011 m!587853))

(declare-fun m!587899 () Bool)

(assert (=> b!612011 m!587899))

(assert (=> b!612010 m!587853))

(assert (=> b!612010 m!587853))

(declare-fun m!587901 () Bool)

(assert (=> b!612010 m!587901))

(assert (=> b!612003 m!587853))

(assert (=> b!612003 m!587853))

(assert (=> b!612003 m!587899))

(assert (=> b!612004 m!587859))

(assert (=> b!612004 m!587853))

(assert (=> b!612004 m!587853))

(declare-fun m!587903 () Bool)

(assert (=> b!612004 m!587903))

(assert (=> b!612004 m!587853))

(declare-fun m!587905 () Bool)

(assert (=> b!612004 m!587905))

(assert (=> b!612004 m!587853))

(declare-fun m!587907 () Bool)

(assert (=> b!612004 m!587907))

(assert (=> b!612004 m!587871))

(declare-fun m!587909 () Bool)

(assert (=> b!612002 m!587909))

(declare-fun m!587911 () Bool)

(assert (=> b!611994 m!587911))

(assert (=> b!612008 m!587853))

(assert (=> b!612008 m!587853))

(assert (=> b!612008 m!587905))

(declare-fun m!587913 () Bool)

(assert (=> b!612013 m!587913))

(check-sat (not b!611992) (not b!612010) (not b!612004) (not b!612005) (not b!612008) (not start!55902) (not b!611997) (not b!612013) (not b!611996) (not b!612003) (not b!611993) (not b!611994) (not b!612011) (not b!611991))
(check-sat)
