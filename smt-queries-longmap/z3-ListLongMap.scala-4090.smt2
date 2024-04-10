; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56040 () Bool)

(assert start!56040)

(declare-fun b!616823 () Bool)

(declare-fun res!397360 () Bool)

(declare-fun e!353696 () Bool)

(assert (=> b!616823 (=> (not res!397360) (not e!353696))))

(declare-datatypes ((array!37510 0))(
  ( (array!37511 (arr!18001 (Array (_ BitVec 32) (_ BitVec 64))) (size!18365 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37510)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!616823 (= res!397360 (validKeyInArray!0 (select (arr!18001 a!2986) j!136)))))

(declare-fun b!616824 () Bool)

(declare-fun res!397348 () Bool)

(assert (=> b!616824 (=> (not res!397348) (not e!353696))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!616824 (= res!397348 (and (= (size!18365 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18365 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18365 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!616825 () Bool)

(declare-fun res!397346 () Bool)

(assert (=> b!616825 (=> (not res!397346) (not e!353696))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37510 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!616825 (= res!397346 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!616826 () Bool)

(declare-datatypes ((Unit!20138 0))(
  ( (Unit!20139) )
))
(declare-fun e!353690 () Unit!20138)

(declare-fun Unit!20140 () Unit!20138)

(assert (=> b!616826 (= e!353690 Unit!20140)))

(declare-fun b!616828 () Bool)

(declare-fun e!353684 () Unit!20138)

(declare-fun Unit!20141 () Unit!20138)

(assert (=> b!616828 (= e!353684 Unit!20141)))

(declare-fun b!616829 () Bool)

(declare-fun e!353695 () Unit!20138)

(declare-fun Unit!20142 () Unit!20138)

(assert (=> b!616829 (= e!353695 Unit!20142)))

(declare-fun b!616830 () Bool)

(declare-fun e!353686 () Bool)

(declare-fun e!353687 () Bool)

(assert (=> b!616830 (= e!353686 (not e!353687))))

(declare-fun res!397349 () Bool)

(assert (=> b!616830 (=> res!397349 e!353687)))

(declare-datatypes ((SeekEntryResult!6441 0))(
  ( (MissingZero!6441 (index!28048 (_ BitVec 32))) (Found!6441 (index!28049 (_ BitVec 32))) (Intermediate!6441 (undefined!7253 Bool) (index!28050 (_ BitVec 32)) (x!56841 (_ BitVec 32))) (Undefined!6441) (MissingVacant!6441 (index!28051 (_ BitVec 32))) )
))
(declare-fun lt!283819 () SeekEntryResult!6441)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!616830 (= res!397349 (not (= lt!283819 (MissingVacant!6441 vacantSpotIndex!68))))))

(declare-fun lt!283833 () Unit!20138)

(declare-fun e!353697 () Unit!20138)

(assert (=> b!616830 (= lt!283833 e!353697)))

(declare-fun c!70109 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!616830 (= c!70109 (= lt!283819 (Found!6441 index!984)))))

(declare-fun lt!283827 () Unit!20138)

(assert (=> b!616830 (= lt!283827 e!353690)))

(declare-fun c!70108 () Bool)

(assert (=> b!616830 (= c!70108 (= lt!283819 Undefined!6441))))

(declare-fun lt!283821 () array!37510)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!283836 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37510 (_ BitVec 32)) SeekEntryResult!6441)

(assert (=> b!616830 (= lt!283819 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283836 lt!283821 mask!3053))))

(declare-fun e!353685 () Bool)

(assert (=> b!616830 e!353685))

(declare-fun res!397358 () Bool)

(assert (=> b!616830 (=> (not res!397358) (not e!353685))))

(declare-fun lt!283824 () (_ BitVec 32))

(declare-fun lt!283832 () SeekEntryResult!6441)

(assert (=> b!616830 (= res!397358 (= lt!283832 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283824 vacantSpotIndex!68 lt!283836 lt!283821 mask!3053)))))

(assert (=> b!616830 (= lt!283832 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283824 vacantSpotIndex!68 (select (arr!18001 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!616830 (= lt!283836 (select (store (arr!18001 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!283820 () Unit!20138)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37510 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20138)

(assert (=> b!616830 (= lt!283820 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283824 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!616830 (= lt!283824 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!397350 () Bool)

(declare-fun b!616831 () Bool)

(assert (=> b!616831 (= res!397350 (arrayContainsKey!0 lt!283821 (select (arr!18001 a!2986) j!136) j!136))))

(declare-fun e!353683 () Bool)

(assert (=> b!616831 (=> (not res!397350) (not e!353683))))

(declare-fun e!353688 () Bool)

(assert (=> b!616831 (= e!353688 e!353683)))

(declare-fun b!616832 () Bool)

(declare-fun Unit!20143 () Unit!20138)

(assert (=> b!616832 (= e!353690 Unit!20143)))

(assert (=> b!616832 false))

(declare-fun b!616833 () Bool)

(assert (=> b!616833 (= e!353687 true)))

(assert (=> b!616833 (= (select (store (arr!18001 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!616834 () Bool)

(declare-fun res!397345 () Bool)

(declare-fun e!353692 () Bool)

(assert (=> b!616834 (=> (not res!397345) (not e!353692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37510 (_ BitVec 32)) Bool)

(assert (=> b!616834 (= res!397345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!616835 () Bool)

(declare-fun e!353693 () Bool)

(assert (=> b!616835 (= e!353692 e!353693)))

(declare-fun res!397352 () Bool)

(assert (=> b!616835 (=> (not res!397352) (not e!353693))))

(assert (=> b!616835 (= res!397352 (= (select (store (arr!18001 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!616835 (= lt!283821 (array!37511 (store (arr!18001 a!2986) i!1108 k0!1786) (size!18365 a!2986)))))

(declare-fun b!616836 () Bool)

(assert (=> b!616836 (= e!353693 e!353686)))

(declare-fun res!397347 () Bool)

(assert (=> b!616836 (=> (not res!397347) (not e!353686))))

(declare-fun lt!283825 () SeekEntryResult!6441)

(assert (=> b!616836 (= res!397347 (and (= lt!283825 (Found!6441 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18001 a!2986) index!984) (select (arr!18001 a!2986) j!136))) (not (= (select (arr!18001 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!616836 (= lt!283825 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18001 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!616837 () Bool)

(assert (=> b!616837 (= e!353683 (arrayContainsKey!0 lt!283821 (select (arr!18001 a!2986) j!136) index!984))))

(declare-fun b!616838 () Bool)

(assert (=> b!616838 (= e!353685 (= lt!283825 lt!283832))))

(declare-fun b!616839 () Bool)

(declare-fun res!397351 () Bool)

(assert (=> b!616839 (=> (not res!397351) (not e!353692))))

(assert (=> b!616839 (= res!397351 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18001 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!616827 () Bool)

(declare-fun res!397357 () Bool)

(assert (=> b!616827 (=> (not res!397357) (not e!353692))))

(declare-datatypes ((List!12042 0))(
  ( (Nil!12039) (Cons!12038 (h!13083 (_ BitVec 64)) (t!18270 List!12042)) )
))
(declare-fun arrayNoDuplicates!0 (array!37510 (_ BitVec 32) List!12042) Bool)

(assert (=> b!616827 (= res!397357 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12039))))

(declare-fun res!397356 () Bool)

(assert (=> start!56040 (=> (not res!397356) (not e!353696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56040 (= res!397356 (validMask!0 mask!3053))))

(assert (=> start!56040 e!353696))

(assert (=> start!56040 true))

(declare-fun array_inv!13797 (array!37510) Bool)

(assert (=> start!56040 (array_inv!13797 a!2986)))

(declare-fun b!616840 () Bool)

(declare-fun res!397355 () Bool)

(assert (=> b!616840 (=> (not res!397355) (not e!353696))))

(assert (=> b!616840 (= res!397355 (validKeyInArray!0 k0!1786))))

(declare-fun b!616841 () Bool)

(assert (=> b!616841 false))

(declare-fun lt!283818 () Unit!20138)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37510 (_ BitVec 64) (_ BitVec 32) List!12042) Unit!20138)

(assert (=> b!616841 (= lt!283818 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283821 (select (arr!18001 a!2986) j!136) j!136 Nil!12039))))

(assert (=> b!616841 (arrayNoDuplicates!0 lt!283821 j!136 Nil!12039)))

(declare-fun lt!283835 () Unit!20138)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37510 (_ BitVec 32) (_ BitVec 32)) Unit!20138)

(assert (=> b!616841 (= lt!283835 (lemmaNoDuplicateFromThenFromBigger!0 lt!283821 #b00000000000000000000000000000000 j!136))))

(assert (=> b!616841 (arrayNoDuplicates!0 lt!283821 #b00000000000000000000000000000000 Nil!12039)))

(declare-fun lt!283837 () Unit!20138)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37510 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12042) Unit!20138)

(assert (=> b!616841 (= lt!283837 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12039))))

(assert (=> b!616841 (arrayContainsKey!0 lt!283821 (select (arr!18001 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283829 () Unit!20138)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37510 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20138)

(assert (=> b!616841 (= lt!283829 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283821 (select (arr!18001 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20144 () Unit!20138)

(assert (=> b!616841 (= e!353695 Unit!20144)))

(declare-fun b!616842 () Bool)

(assert (=> b!616842 false))

(declare-fun lt!283831 () Unit!20138)

(assert (=> b!616842 (= lt!283831 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283821 (select (arr!18001 a!2986) j!136) index!984 Nil!12039))))

(assert (=> b!616842 (arrayNoDuplicates!0 lt!283821 index!984 Nil!12039)))

(declare-fun lt!283830 () Unit!20138)

(assert (=> b!616842 (= lt!283830 (lemmaNoDuplicateFromThenFromBigger!0 lt!283821 #b00000000000000000000000000000000 index!984))))

(assert (=> b!616842 (arrayNoDuplicates!0 lt!283821 #b00000000000000000000000000000000 Nil!12039)))

(declare-fun lt!283826 () Unit!20138)

(assert (=> b!616842 (= lt!283826 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12039))))

(assert (=> b!616842 (arrayContainsKey!0 lt!283821 (select (arr!18001 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283834 () Unit!20138)

(assert (=> b!616842 (= lt!283834 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283821 (select (arr!18001 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!353689 () Bool)

(assert (=> b!616842 e!353689))

(declare-fun res!397353 () Bool)

(assert (=> b!616842 (=> (not res!397353) (not e!353689))))

(assert (=> b!616842 (= res!397353 (arrayContainsKey!0 lt!283821 (select (arr!18001 a!2986) j!136) j!136))))

(declare-fun Unit!20145 () Unit!20138)

(assert (=> b!616842 (= e!353684 Unit!20145)))

(declare-fun b!616843 () Bool)

(declare-fun Unit!20146 () Unit!20138)

(assert (=> b!616843 (= e!353697 Unit!20146)))

(declare-fun res!397359 () Bool)

(assert (=> b!616843 (= res!397359 (= (select (store (arr!18001 a!2986) i!1108 k0!1786) index!984) (select (arr!18001 a!2986) j!136)))))

(declare-fun e!353694 () Bool)

(assert (=> b!616843 (=> (not res!397359) (not e!353694))))

(assert (=> b!616843 e!353694))

(declare-fun c!70106 () Bool)

(assert (=> b!616843 (= c!70106 (bvslt j!136 index!984))))

(declare-fun lt!283828 () Unit!20138)

(assert (=> b!616843 (= lt!283828 e!353695)))

(declare-fun c!70107 () Bool)

(assert (=> b!616843 (= c!70107 (bvslt index!984 j!136))))

(declare-fun lt!283822 () Unit!20138)

(assert (=> b!616843 (= lt!283822 e!353684)))

(assert (=> b!616843 false))

(declare-fun b!616844 () Bool)

(assert (=> b!616844 (= e!353689 (arrayContainsKey!0 lt!283821 (select (arr!18001 a!2986) j!136) index!984))))

(declare-fun b!616845 () Bool)

(declare-fun res!397361 () Bool)

(assert (=> b!616845 (= res!397361 (bvsge j!136 index!984))))

(assert (=> b!616845 (=> res!397361 e!353688)))

(assert (=> b!616845 (= e!353694 e!353688)))

(declare-fun b!616846 () Bool)

(declare-fun Unit!20147 () Unit!20138)

(assert (=> b!616846 (= e!353697 Unit!20147)))

(declare-fun b!616847 () Bool)

(assert (=> b!616847 (= e!353696 e!353692)))

(declare-fun res!397354 () Bool)

(assert (=> b!616847 (=> (not res!397354) (not e!353692))))

(declare-fun lt!283823 () SeekEntryResult!6441)

(assert (=> b!616847 (= res!397354 (or (= lt!283823 (MissingZero!6441 i!1108)) (= lt!283823 (MissingVacant!6441 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37510 (_ BitVec 32)) SeekEntryResult!6441)

(assert (=> b!616847 (= lt!283823 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!56040 res!397356) b!616824))

(assert (= (and b!616824 res!397348) b!616823))

(assert (= (and b!616823 res!397360) b!616840))

(assert (= (and b!616840 res!397355) b!616825))

(assert (= (and b!616825 res!397346) b!616847))

(assert (= (and b!616847 res!397354) b!616834))

(assert (= (and b!616834 res!397345) b!616827))

(assert (= (and b!616827 res!397357) b!616839))

(assert (= (and b!616839 res!397351) b!616835))

(assert (= (and b!616835 res!397352) b!616836))

(assert (= (and b!616836 res!397347) b!616830))

(assert (= (and b!616830 res!397358) b!616838))

(assert (= (and b!616830 c!70108) b!616832))

(assert (= (and b!616830 (not c!70108)) b!616826))

(assert (= (and b!616830 c!70109) b!616843))

(assert (= (and b!616830 (not c!70109)) b!616846))

(assert (= (and b!616843 res!397359) b!616845))

(assert (= (and b!616845 (not res!397361)) b!616831))

(assert (= (and b!616831 res!397350) b!616837))

(assert (= (and b!616843 c!70106) b!616841))

(assert (= (and b!616843 (not c!70106)) b!616829))

(assert (= (and b!616843 c!70107) b!616842))

(assert (= (and b!616843 (not c!70107)) b!616828))

(assert (= (and b!616842 res!397353) b!616844))

(assert (= (and b!616830 (not res!397349)) b!616833))

(declare-fun m!592971 () Bool)

(assert (=> b!616831 m!592971))

(assert (=> b!616831 m!592971))

(declare-fun m!592973 () Bool)

(assert (=> b!616831 m!592973))

(declare-fun m!592975 () Bool)

(assert (=> b!616833 m!592975))

(declare-fun m!592977 () Bool)

(assert (=> b!616833 m!592977))

(assert (=> b!616843 m!592975))

(assert (=> b!616843 m!592977))

(assert (=> b!616843 m!592971))

(declare-fun m!592979 () Bool)

(assert (=> b!616836 m!592979))

(assert (=> b!616836 m!592971))

(assert (=> b!616836 m!592971))

(declare-fun m!592981 () Bool)

(assert (=> b!616836 m!592981))

(declare-fun m!592983 () Bool)

(assert (=> b!616839 m!592983))

(declare-fun m!592985 () Bool)

(assert (=> b!616827 m!592985))

(assert (=> b!616835 m!592975))

(declare-fun m!592987 () Bool)

(assert (=> b!616835 m!592987))

(declare-fun m!592989 () Bool)

(assert (=> b!616847 m!592989))

(assert (=> b!616837 m!592971))

(assert (=> b!616837 m!592971))

(declare-fun m!592991 () Bool)

(assert (=> b!616837 m!592991))

(declare-fun m!592993 () Bool)

(assert (=> b!616842 m!592993))

(declare-fun m!592995 () Bool)

(assert (=> b!616842 m!592995))

(assert (=> b!616842 m!592971))

(assert (=> b!616842 m!592971))

(declare-fun m!592997 () Bool)

(assert (=> b!616842 m!592997))

(assert (=> b!616842 m!592971))

(declare-fun m!592999 () Bool)

(assert (=> b!616842 m!592999))

(assert (=> b!616842 m!592971))

(assert (=> b!616842 m!592973))

(assert (=> b!616842 m!592971))

(declare-fun m!593001 () Bool)

(assert (=> b!616842 m!593001))

(declare-fun m!593003 () Bool)

(assert (=> b!616842 m!593003))

(declare-fun m!593005 () Bool)

(assert (=> b!616842 m!593005))

(declare-fun m!593007 () Bool)

(assert (=> start!56040 m!593007))

(declare-fun m!593009 () Bool)

(assert (=> start!56040 m!593009))

(declare-fun m!593011 () Bool)

(assert (=> b!616834 m!593011))

(declare-fun m!593013 () Bool)

(assert (=> b!616840 m!593013))

(assert (=> b!616841 m!592993))

(assert (=> b!616841 m!592971))

(declare-fun m!593015 () Bool)

(assert (=> b!616841 m!593015))

(declare-fun m!593017 () Bool)

(assert (=> b!616841 m!593017))

(assert (=> b!616841 m!592971))

(declare-fun m!593019 () Bool)

(assert (=> b!616841 m!593019))

(assert (=> b!616841 m!592971))

(declare-fun m!593021 () Bool)

(assert (=> b!616841 m!593021))

(assert (=> b!616841 m!592971))

(declare-fun m!593023 () Bool)

(assert (=> b!616841 m!593023))

(assert (=> b!616841 m!593005))

(declare-fun m!593025 () Bool)

(assert (=> b!616825 m!593025))

(assert (=> b!616823 m!592971))

(assert (=> b!616823 m!592971))

(declare-fun m!593027 () Bool)

(assert (=> b!616823 m!593027))

(declare-fun m!593029 () Bool)

(assert (=> b!616830 m!593029))

(declare-fun m!593031 () Bool)

(assert (=> b!616830 m!593031))

(declare-fun m!593033 () Bool)

(assert (=> b!616830 m!593033))

(declare-fun m!593035 () Bool)

(assert (=> b!616830 m!593035))

(assert (=> b!616830 m!592971))

(assert (=> b!616830 m!592975))

(declare-fun m!593037 () Bool)

(assert (=> b!616830 m!593037))

(assert (=> b!616830 m!592971))

(declare-fun m!593039 () Bool)

(assert (=> b!616830 m!593039))

(assert (=> b!616844 m!592971))

(assert (=> b!616844 m!592971))

(assert (=> b!616844 m!592991))

(check-sat (not b!616836) (not b!616841) (not b!616830) (not b!616844) (not b!616831) (not b!616847) (not b!616834) (not b!616837) (not start!56040) (not b!616825) (not b!616842) (not b!616840) (not b!616827) (not b!616823))
(check-sat)
