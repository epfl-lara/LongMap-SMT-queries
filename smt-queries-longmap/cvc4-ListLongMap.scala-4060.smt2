; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55592 () Bool)

(assert start!55592)

(declare-fun b!609159 () Bool)

(declare-fun res!391724 () Bool)

(declare-fun e!348877 () Bool)

(assert (=> b!609159 (=> (not res!391724) (not e!348877))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37323 0))(
  ( (array!37324 (arr!17912 (Array (_ BitVec 32) (_ BitVec 64))) (size!18276 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37323)

(assert (=> b!609159 (= res!391724 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17912 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!609160 () Bool)

(declare-fun res!391736 () Bool)

(declare-fun e!348871 () Bool)

(assert (=> b!609160 (=> res!391736 e!348871)))

(declare-datatypes ((List!11953 0))(
  ( (Nil!11950) (Cons!11949 (h!12994 (_ BitVec 64)) (t!18181 List!11953)) )
))
(declare-fun noDuplicate!335 (List!11953) Bool)

(assert (=> b!609160 (= res!391736 (not (noDuplicate!335 Nil!11950)))))

(declare-fun b!609161 () Bool)

(declare-fun e!348879 () Bool)

(declare-fun e!348883 () Bool)

(assert (=> b!609161 (= e!348879 e!348883)))

(declare-fun res!391730 () Bool)

(assert (=> b!609161 (=> (not res!391730) (not e!348883))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!278411 () array!37323)

(declare-fun arrayContainsKey!0 (array!37323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!609161 (= res!391730 (arrayContainsKey!0 lt!278411 (select (arr!17912 a!2986) j!136) j!136))))

(declare-fun b!609162 () Bool)

(declare-fun res!391742 () Bool)

(declare-fun e!348881 () Bool)

(assert (=> b!609162 (=> (not res!391742) (not e!348881))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!609162 (= res!391742 (validKeyInArray!0 k!1786))))

(declare-fun b!609163 () Bool)

(declare-datatypes ((Unit!19492 0))(
  ( (Unit!19493) )
))
(declare-fun e!348870 () Unit!19492)

(declare-fun Unit!19494 () Unit!19492)

(assert (=> b!609163 (= e!348870 Unit!19494)))

(declare-fun lt!278421 () Unit!19492)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37323 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19492)

(assert (=> b!609163 (= lt!278421 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278411 (select (arr!17912 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!609163 (arrayContainsKey!0 lt!278411 (select (arr!17912 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!278416 () Unit!19492)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37323 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11953) Unit!19492)

(assert (=> b!609163 (= lt!278416 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11950))))

(declare-fun arrayNoDuplicates!0 (array!37323 (_ BitVec 32) List!11953) Bool)

(assert (=> b!609163 (arrayNoDuplicates!0 lt!278411 #b00000000000000000000000000000000 Nil!11950)))

(declare-fun lt!278414 () Unit!19492)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37323 (_ BitVec 32) (_ BitVec 32)) Unit!19492)

(assert (=> b!609163 (= lt!278414 (lemmaNoDuplicateFromThenFromBigger!0 lt!278411 #b00000000000000000000000000000000 j!136))))

(assert (=> b!609163 (arrayNoDuplicates!0 lt!278411 j!136 Nil!11950)))

(declare-fun lt!278420 () Unit!19492)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37323 (_ BitVec 64) (_ BitVec 32) List!11953) Unit!19492)

(assert (=> b!609163 (= lt!278420 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278411 (select (arr!17912 a!2986) j!136) j!136 Nil!11950))))

(assert (=> b!609163 false))

(declare-fun b!609164 () Bool)

(declare-fun e!348874 () Unit!19492)

(declare-fun Unit!19495 () Unit!19492)

(assert (=> b!609164 (= e!348874 Unit!19495)))

(declare-fun b!609165 () Bool)

(declare-fun e!348882 () Bool)

(assert (=> b!609165 (= e!348877 e!348882)))

(declare-fun res!391741 () Bool)

(assert (=> b!609165 (=> (not res!391741) (not e!348882))))

(assert (=> b!609165 (= res!391741 (= (select (store (arr!17912 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!609165 (= lt!278411 (array!37324 (store (arr!17912 a!2986) i!1108 k!1786) (size!18276 a!2986)))))

(declare-fun b!609166 () Bool)

(assert (=> b!609166 (= e!348881 e!348877)))

(declare-fun res!391739 () Bool)

(assert (=> b!609166 (=> (not res!391739) (not e!348877))))

(declare-datatypes ((SeekEntryResult!6352 0))(
  ( (MissingZero!6352 (index!27683 (_ BitVec 32))) (Found!6352 (index!27684 (_ BitVec 32))) (Intermediate!6352 (undefined!7164 Bool) (index!27685 (_ BitVec 32)) (x!56485 (_ BitVec 32))) (Undefined!6352) (MissingVacant!6352 (index!27686 (_ BitVec 32))) )
))
(declare-fun lt!278413 () SeekEntryResult!6352)

(assert (=> b!609166 (= res!391739 (or (= lt!278413 (MissingZero!6352 i!1108)) (= lt!278413 (MissingVacant!6352 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37323 (_ BitVec 32)) SeekEntryResult!6352)

(assert (=> b!609166 (= lt!278413 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!609167 () Bool)

(declare-fun res!391738 () Bool)

(assert (=> b!609167 (=> (not res!391738) (not e!348881))))

(assert (=> b!609167 (= res!391738 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!609168 () Bool)

(declare-fun e!348872 () Bool)

(assert (=> b!609168 (= e!348872 e!348879)))

(declare-fun res!391727 () Bool)

(assert (=> b!609168 (=> res!391727 e!348879)))

(declare-fun lt!278409 () (_ BitVec 64))

(declare-fun lt!278408 () (_ BitVec 64))

(assert (=> b!609168 (= res!391727 (or (not (= (select (arr!17912 a!2986) j!136) lt!278409)) (not (= (select (arr!17912 a!2986) j!136) lt!278408)) (bvsge j!136 index!984)))))

(declare-fun e!348873 () Bool)

(declare-fun b!609169 () Bool)

(assert (=> b!609169 (= e!348873 (arrayContainsKey!0 lt!278411 (select (arr!17912 a!2986) j!136) index!984))))

(declare-fun b!609170 () Bool)

(declare-fun e!348875 () Bool)

(declare-fun e!348885 () Bool)

(assert (=> b!609170 (= e!348875 e!348885)))

(declare-fun res!391743 () Bool)

(assert (=> b!609170 (=> res!391743 e!348885)))

(assert (=> b!609170 (= res!391743 (or (not (= (select (arr!17912 a!2986) j!136) lt!278409)) (not (= (select (arr!17912 a!2986) j!136) lt!278408))))))

(assert (=> b!609170 e!348872))

(declare-fun res!391735 () Bool)

(assert (=> b!609170 (=> (not res!391735) (not e!348872))))

(assert (=> b!609170 (= res!391735 (= lt!278408 (select (arr!17912 a!2986) j!136)))))

(assert (=> b!609170 (= lt!278408 (select (store (arr!17912 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!609171 () Bool)

(declare-fun Unit!19496 () Unit!19492)

(assert (=> b!609171 (= e!348870 Unit!19496)))

(declare-fun b!609172 () Bool)

(declare-fun e!348876 () Bool)

(assert (=> b!609172 (= e!348876 e!348871)))

(declare-fun res!391725 () Bool)

(assert (=> b!609172 (=> res!391725 e!348871)))

(assert (=> b!609172 (= res!391725 (or (bvsge (size!18276 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18276 a!2986))))))

(assert (=> b!609172 (arrayContainsKey!0 lt!278411 (select (arr!17912 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278417 () Unit!19492)

(assert (=> b!609172 (= lt!278417 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278411 (select (arr!17912 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!609172 e!348873))

(declare-fun res!391744 () Bool)

(assert (=> b!609172 (=> (not res!391744) (not e!348873))))

(assert (=> b!609172 (= res!391744 (arrayContainsKey!0 lt!278411 (select (arr!17912 a!2986) j!136) j!136))))

(declare-fun b!609173 () Bool)

(assert (=> b!609173 (= e!348883 (arrayContainsKey!0 lt!278411 (select (arr!17912 a!2986) j!136) index!984))))

(declare-fun b!609174 () Bool)

(declare-fun res!391734 () Bool)

(assert (=> b!609174 (=> res!391734 e!348871)))

(declare-fun contains!3029 (List!11953 (_ BitVec 64)) Bool)

(assert (=> b!609174 (= res!391734 (contains!3029 Nil!11950 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!609175 () Bool)

(declare-fun res!391731 () Bool)

(assert (=> b!609175 (=> (not res!391731) (not e!348877))))

(assert (=> b!609175 (= res!391731 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11950))))

(declare-fun b!609176 () Bool)

(declare-fun e!348878 () Bool)

(assert (=> b!609176 (= e!348878 (not e!348875))))

(declare-fun res!391733 () Bool)

(assert (=> b!609176 (=> res!391733 e!348875)))

(declare-fun lt!278415 () SeekEntryResult!6352)

(assert (=> b!609176 (= res!391733 (not (= lt!278415 (Found!6352 index!984))))))

(declare-fun lt!278412 () Unit!19492)

(assert (=> b!609176 (= lt!278412 e!348874)))

(declare-fun c!69086 () Bool)

(assert (=> b!609176 (= c!69086 (= lt!278415 Undefined!6352))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37323 (_ BitVec 32)) SeekEntryResult!6352)

(assert (=> b!609176 (= lt!278415 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278409 lt!278411 mask!3053))))

(declare-fun e!348880 () Bool)

(assert (=> b!609176 e!348880))

(declare-fun res!391732 () Bool)

(assert (=> b!609176 (=> (not res!391732) (not e!348880))))

(declare-fun lt!278410 () SeekEntryResult!6352)

(declare-fun lt!278422 () (_ BitVec 32))

(assert (=> b!609176 (= res!391732 (= lt!278410 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278422 vacantSpotIndex!68 lt!278409 lt!278411 mask!3053)))))

(assert (=> b!609176 (= lt!278410 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278422 vacantSpotIndex!68 (select (arr!17912 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!609176 (= lt!278409 (select (store (arr!17912 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!278406 () Unit!19492)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37323 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19492)

(assert (=> b!609176 (= lt!278406 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278422 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!609176 (= lt!278422 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!391745 () Bool)

(assert (=> start!55592 (=> (not res!391745) (not e!348881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55592 (= res!391745 (validMask!0 mask!3053))))

(assert (=> start!55592 e!348881))

(assert (=> start!55592 true))

(declare-fun array_inv!13708 (array!37323) Bool)

(assert (=> start!55592 (array_inv!13708 a!2986)))

(declare-fun b!609177 () Bool)

(declare-fun res!391729 () Bool)

(assert (=> b!609177 (=> (not res!391729) (not e!348881))))

(assert (=> b!609177 (= res!391729 (validKeyInArray!0 (select (arr!17912 a!2986) j!136)))))

(declare-fun b!609178 () Bool)

(declare-fun res!391728 () Bool)

(assert (=> b!609178 (=> (not res!391728) (not e!348877))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37323 (_ BitVec 32)) Bool)

(assert (=> b!609178 (= res!391728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!609179 () Bool)

(assert (=> b!609179 (= e!348871 true)))

(declare-fun lt!278418 () Bool)

(assert (=> b!609179 (= lt!278418 (contains!3029 Nil!11950 k!1786))))

(declare-fun b!609180 () Bool)

(declare-fun Unit!19497 () Unit!19492)

(assert (=> b!609180 (= e!348874 Unit!19497)))

(assert (=> b!609180 false))

(declare-fun b!609181 () Bool)

(declare-fun res!391737 () Bool)

(assert (=> b!609181 (=> res!391737 e!348871)))

(assert (=> b!609181 (= res!391737 (contains!3029 Nil!11950 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!609182 () Bool)

(declare-fun lt!278419 () SeekEntryResult!6352)

(assert (=> b!609182 (= e!348880 (= lt!278419 lt!278410))))

(declare-fun b!609183 () Bool)

(assert (=> b!609183 (= e!348882 e!348878)))

(declare-fun res!391726 () Bool)

(assert (=> b!609183 (=> (not res!391726) (not e!348878))))

(assert (=> b!609183 (= res!391726 (and (= lt!278419 (Found!6352 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17912 a!2986) index!984) (select (arr!17912 a!2986) j!136))) (not (= (select (arr!17912 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!609183 (= lt!278419 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17912 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!609184 () Bool)

(declare-fun res!391723 () Bool)

(assert (=> b!609184 (=> (not res!391723) (not e!348881))))

(assert (=> b!609184 (= res!391723 (and (= (size!18276 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18276 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18276 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!609185 () Bool)

(assert (=> b!609185 (= e!348885 e!348876)))

(declare-fun res!391740 () Bool)

(assert (=> b!609185 (=> res!391740 e!348876)))

(assert (=> b!609185 (= res!391740 (bvsge index!984 j!136))))

(declare-fun lt!278407 () Unit!19492)

(assert (=> b!609185 (= lt!278407 e!348870)))

(declare-fun c!69085 () Bool)

(assert (=> b!609185 (= c!69085 (bvslt j!136 index!984))))

(assert (= (and start!55592 res!391745) b!609184))

(assert (= (and b!609184 res!391723) b!609177))

(assert (= (and b!609177 res!391729) b!609162))

(assert (= (and b!609162 res!391742) b!609167))

(assert (= (and b!609167 res!391738) b!609166))

(assert (= (and b!609166 res!391739) b!609178))

(assert (= (and b!609178 res!391728) b!609175))

(assert (= (and b!609175 res!391731) b!609159))

(assert (= (and b!609159 res!391724) b!609165))

(assert (= (and b!609165 res!391741) b!609183))

(assert (= (and b!609183 res!391726) b!609176))

(assert (= (and b!609176 res!391732) b!609182))

(assert (= (and b!609176 c!69086) b!609180))

(assert (= (and b!609176 (not c!69086)) b!609164))

(assert (= (and b!609176 (not res!391733)) b!609170))

(assert (= (and b!609170 res!391735) b!609168))

(assert (= (and b!609168 (not res!391727)) b!609161))

(assert (= (and b!609161 res!391730) b!609173))

(assert (= (and b!609170 (not res!391743)) b!609185))

(assert (= (and b!609185 c!69085) b!609163))

(assert (= (and b!609185 (not c!69085)) b!609171))

(assert (= (and b!609185 (not res!391740)) b!609172))

(assert (= (and b!609172 res!391744) b!609169))

(assert (= (and b!609172 (not res!391725)) b!609160))

(assert (= (and b!609160 (not res!391736)) b!609181))

(assert (= (and b!609181 (not res!391737)) b!609174))

(assert (= (and b!609174 (not res!391734)) b!609179))

(declare-fun m!585707 () Bool)

(assert (=> b!609159 m!585707))

(declare-fun m!585709 () Bool)

(assert (=> b!609168 m!585709))

(declare-fun m!585711 () Bool)

(assert (=> b!609165 m!585711))

(declare-fun m!585713 () Bool)

(assert (=> b!609165 m!585713))

(assert (=> b!609173 m!585709))

(assert (=> b!609173 m!585709))

(declare-fun m!585715 () Bool)

(assert (=> b!609173 m!585715))

(assert (=> b!609177 m!585709))

(assert (=> b!609177 m!585709))

(declare-fun m!585717 () Bool)

(assert (=> b!609177 m!585717))

(declare-fun m!585719 () Bool)

(assert (=> b!609175 m!585719))

(assert (=> b!609169 m!585709))

(assert (=> b!609169 m!585709))

(assert (=> b!609169 m!585715))

(declare-fun m!585721 () Bool)

(assert (=> b!609178 m!585721))

(declare-fun m!585723 () Bool)

(assert (=> b!609183 m!585723))

(assert (=> b!609183 m!585709))

(assert (=> b!609183 m!585709))

(declare-fun m!585725 () Bool)

(assert (=> b!609183 m!585725))

(declare-fun m!585727 () Bool)

(assert (=> b!609160 m!585727))

(assert (=> b!609172 m!585709))

(assert (=> b!609172 m!585709))

(declare-fun m!585729 () Bool)

(assert (=> b!609172 m!585729))

(assert (=> b!609172 m!585709))

(declare-fun m!585731 () Bool)

(assert (=> b!609172 m!585731))

(assert (=> b!609172 m!585709))

(declare-fun m!585733 () Bool)

(assert (=> b!609172 m!585733))

(declare-fun m!585735 () Bool)

(assert (=> b!609162 m!585735))

(declare-fun m!585737 () Bool)

(assert (=> b!609176 m!585737))

(declare-fun m!585739 () Bool)

(assert (=> b!609176 m!585739))

(assert (=> b!609176 m!585709))

(assert (=> b!609176 m!585711))

(declare-fun m!585741 () Bool)

(assert (=> b!609176 m!585741))

(assert (=> b!609176 m!585709))

(declare-fun m!585743 () Bool)

(assert (=> b!609176 m!585743))

(declare-fun m!585745 () Bool)

(assert (=> b!609176 m!585745))

(declare-fun m!585747 () Bool)

(assert (=> b!609176 m!585747))

(declare-fun m!585749 () Bool)

(assert (=> start!55592 m!585749))

(declare-fun m!585751 () Bool)

(assert (=> start!55592 m!585751))

(assert (=> b!609170 m!585709))

(assert (=> b!609170 m!585711))

(declare-fun m!585753 () Bool)

(assert (=> b!609170 m!585753))

(declare-fun m!585755 () Bool)

(assert (=> b!609179 m!585755))

(declare-fun m!585757 () Bool)

(assert (=> b!609174 m!585757))

(declare-fun m!585759 () Bool)

(assert (=> b!609163 m!585759))

(assert (=> b!609163 m!585709))

(assert (=> b!609163 m!585709))

(declare-fun m!585761 () Bool)

(assert (=> b!609163 m!585761))

(assert (=> b!609163 m!585709))

(declare-fun m!585763 () Bool)

(assert (=> b!609163 m!585763))

(declare-fun m!585765 () Bool)

(assert (=> b!609163 m!585765))

(assert (=> b!609163 m!585709))

(declare-fun m!585767 () Bool)

(assert (=> b!609163 m!585767))

(declare-fun m!585769 () Bool)

(assert (=> b!609163 m!585769))

(declare-fun m!585771 () Bool)

(assert (=> b!609163 m!585771))

(declare-fun m!585773 () Bool)

(assert (=> b!609181 m!585773))

(declare-fun m!585775 () Bool)

(assert (=> b!609166 m!585775))

(assert (=> b!609161 m!585709))

(assert (=> b!609161 m!585709))

(assert (=> b!609161 m!585733))

(declare-fun m!585777 () Bool)

(assert (=> b!609167 m!585777))

(push 1)

(assert (not b!609178))

(assert (not b!609167))

(assert (not b!609160))

(assert (not b!609163))

(assert (not b!609162))

(assert (not b!609161))

(assert (not b!609176))

(assert (not b!609166))

(assert (not b!609179))

(assert (not b!609175))

(assert (not b!609181))

(assert (not b!609177))

(assert (not b!609173))

(assert (not b!609172))

(assert (not b!609174))

(assert (not b!609183))

(assert (not start!55592))

(assert (not b!609169))

(check-sat)

