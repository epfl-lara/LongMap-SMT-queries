; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56206 () Bool)

(assert start!56206)

(declare-fun b!622929 () Bool)

(declare-datatypes ((Unit!20968 0))(
  ( (Unit!20969) )
))
(declare-fun e!357312 () Unit!20968)

(declare-fun Unit!20970 () Unit!20968)

(assert (=> b!622929 (= e!357312 Unit!20970)))

(declare-fun b!622930 () Bool)

(declare-fun e!357307 () Bool)

(assert (=> b!622930 (= e!357307 (not true))))

(declare-fun lt!288805 () Unit!20968)

(declare-fun e!357303 () Unit!20968)

(assert (=> b!622930 (= lt!288805 e!357303)))

(declare-fun c!71102 () Bool)

(declare-datatypes ((SeekEntryResult!6524 0))(
  ( (MissingZero!6524 (index!28380 (_ BitVec 32))) (Found!6524 (index!28381 (_ BitVec 32))) (Intermediate!6524 (undefined!7336 Bool) (index!28382 (_ BitVec 32)) (x!57148 (_ BitVec 32))) (Undefined!6524) (MissingVacant!6524 (index!28383 (_ BitVec 32))) )
))
(declare-fun lt!288804 () SeekEntryResult!6524)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!622930 (= c!71102 (= lt!288804 (Found!6524 index!984)))))

(declare-fun lt!288812 () Unit!20968)

(declare-fun e!357311 () Unit!20968)

(assert (=> b!622930 (= lt!288812 e!357311)))

(declare-fun c!71105 () Bool)

(assert (=> b!622930 (= c!71105 (= lt!288804 Undefined!6524))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!37676 0))(
  ( (array!37677 (arr!18084 (Array (_ BitVec 32) (_ BitVec 64))) (size!18448 (_ BitVec 32))) )
))
(declare-fun lt!288806 () array!37676)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!288814 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37676 (_ BitVec 32)) SeekEntryResult!6524)

(assert (=> b!622930 (= lt!288804 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288814 lt!288806 mask!3053))))

(declare-fun e!357310 () Bool)

(assert (=> b!622930 e!357310))

(declare-fun res!401472 () Bool)

(assert (=> b!622930 (=> (not res!401472) (not e!357310))))

(declare-fun lt!288809 () (_ BitVec 32))

(declare-fun lt!288810 () SeekEntryResult!6524)

(assert (=> b!622930 (= res!401472 (= lt!288810 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288809 vacantSpotIndex!68 lt!288814 lt!288806 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37676)

(assert (=> b!622930 (= lt!288810 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288809 vacantSpotIndex!68 (select (arr!18084 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!622930 (= lt!288814 (select (store (arr!18084 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!288815 () Unit!20968)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37676 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20968)

(assert (=> b!622930 (= lt!288815 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288809 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!622930 (= lt!288809 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!401471 () Bool)

(declare-fun b!622932 () Bool)

(declare-fun arrayContainsKey!0 (array!37676 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!622932 (= res!401471 (arrayContainsKey!0 lt!288806 (select (arr!18084 a!2986) j!136) j!136))))

(declare-fun e!357309 () Bool)

(assert (=> b!622932 (=> (not res!401471) (not e!357309))))

(declare-fun e!357306 () Bool)

(assert (=> b!622932 (= e!357306 e!357309)))

(declare-fun b!622933 () Bool)

(assert (=> b!622933 false))

(declare-fun lt!288799 () Unit!20968)

(declare-datatypes ((List!12125 0))(
  ( (Nil!12122) (Cons!12121 (h!13166 (_ BitVec 64)) (t!18353 List!12125)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37676 (_ BitVec 64) (_ BitVec 32) List!12125) Unit!20968)

(assert (=> b!622933 (= lt!288799 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288806 (select (arr!18084 a!2986) j!136) index!984 Nil!12122))))

(declare-fun arrayNoDuplicates!0 (array!37676 (_ BitVec 32) List!12125) Bool)

(assert (=> b!622933 (arrayNoDuplicates!0 lt!288806 index!984 Nil!12122)))

(declare-fun lt!288798 () Unit!20968)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37676 (_ BitVec 32) (_ BitVec 32)) Unit!20968)

(assert (=> b!622933 (= lt!288798 (lemmaNoDuplicateFromThenFromBigger!0 lt!288806 #b00000000000000000000000000000000 index!984))))

(assert (=> b!622933 (arrayNoDuplicates!0 lt!288806 #b00000000000000000000000000000000 Nil!12122)))

(declare-fun lt!288811 () Unit!20968)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37676 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12125) Unit!20968)

(assert (=> b!622933 (= lt!288811 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12122))))

(assert (=> b!622933 (arrayContainsKey!0 lt!288806 (select (arr!18084 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288800 () Unit!20968)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37676 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20968)

(assert (=> b!622933 (= lt!288800 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288806 (select (arr!18084 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!357305 () Bool)

(assert (=> b!622933 e!357305))

(declare-fun res!401467 () Bool)

(assert (=> b!622933 (=> (not res!401467) (not e!357305))))

(assert (=> b!622933 (= res!401467 (arrayContainsKey!0 lt!288806 (select (arr!18084 a!2986) j!136) j!136))))

(declare-fun Unit!20971 () Unit!20968)

(assert (=> b!622933 (= e!357312 Unit!20971)))

(declare-fun b!622934 () Bool)

(declare-fun e!357304 () Bool)

(declare-fun e!357302 () Bool)

(assert (=> b!622934 (= e!357304 e!357302)))

(declare-fun res!401464 () Bool)

(assert (=> b!622934 (=> (not res!401464) (not e!357302))))

(declare-fun lt!288816 () SeekEntryResult!6524)

(assert (=> b!622934 (= res!401464 (or (= lt!288816 (MissingZero!6524 i!1108)) (= lt!288816 (MissingVacant!6524 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37676 (_ BitVec 32)) SeekEntryResult!6524)

(assert (=> b!622934 (= lt!288816 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!622935 () Bool)

(declare-fun res!401462 () Bool)

(assert (=> b!622935 (= res!401462 (bvsge j!136 index!984))))

(assert (=> b!622935 (=> res!401462 e!357306)))

(declare-fun e!357299 () Bool)

(assert (=> b!622935 (= e!357299 e!357306)))

(declare-fun b!622936 () Bool)

(assert (=> b!622936 false))

(declare-fun lt!288801 () Unit!20968)

(assert (=> b!622936 (= lt!288801 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288806 (select (arr!18084 a!2986) j!136) j!136 Nil!12122))))

(assert (=> b!622936 (arrayNoDuplicates!0 lt!288806 j!136 Nil!12122)))

(declare-fun lt!288802 () Unit!20968)

(assert (=> b!622936 (= lt!288802 (lemmaNoDuplicateFromThenFromBigger!0 lt!288806 #b00000000000000000000000000000000 j!136))))

(assert (=> b!622936 (arrayNoDuplicates!0 lt!288806 #b00000000000000000000000000000000 Nil!12122)))

(declare-fun lt!288803 () Unit!20968)

(assert (=> b!622936 (= lt!288803 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12122))))

(assert (=> b!622936 (arrayContainsKey!0 lt!288806 (select (arr!18084 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288807 () Unit!20968)

(assert (=> b!622936 (= lt!288807 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288806 (select (arr!18084 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!357301 () Unit!20968)

(declare-fun Unit!20972 () Unit!20968)

(assert (=> b!622936 (= e!357301 Unit!20972)))

(declare-fun b!622937 () Bool)

(declare-fun res!401468 () Bool)

(assert (=> b!622937 (=> (not res!401468) (not e!357302))))

(assert (=> b!622937 (= res!401468 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18084 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!622938 () Bool)

(declare-fun res!401465 () Bool)

(assert (=> b!622938 (=> (not res!401465) (not e!357302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37676 (_ BitVec 32)) Bool)

(assert (=> b!622938 (= res!401465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!622931 () Bool)

(declare-fun res!401473 () Bool)

(assert (=> b!622931 (=> (not res!401473) (not e!357304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!622931 (= res!401473 (validKeyInArray!0 (select (arr!18084 a!2986) j!136)))))

(declare-fun res!401460 () Bool)

(assert (=> start!56206 (=> (not res!401460) (not e!357304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56206 (= res!401460 (validMask!0 mask!3053))))

(assert (=> start!56206 e!357304))

(assert (=> start!56206 true))

(declare-fun array_inv!13880 (array!37676) Bool)

(assert (=> start!56206 (array_inv!13880 a!2986)))

(declare-fun b!622939 () Bool)

(declare-fun res!401469 () Bool)

(assert (=> b!622939 (=> (not res!401469) (not e!357304))))

(assert (=> b!622939 (= res!401469 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!622940 () Bool)

(declare-fun Unit!20973 () Unit!20968)

(assert (=> b!622940 (= e!357311 Unit!20973)))

(assert (=> b!622940 false))

(declare-fun b!622941 () Bool)

(assert (=> b!622941 (= e!357309 (arrayContainsKey!0 lt!288806 (select (arr!18084 a!2986) j!136) index!984))))

(declare-fun b!622942 () Bool)

(assert (=> b!622942 (= e!357305 (arrayContainsKey!0 lt!288806 (select (arr!18084 a!2986) j!136) index!984))))

(declare-fun b!622943 () Bool)

(declare-fun Unit!20974 () Unit!20968)

(assert (=> b!622943 (= e!357303 Unit!20974)))

(declare-fun res!401474 () Bool)

(assert (=> b!622943 (= res!401474 (= (select (store (arr!18084 a!2986) i!1108 k!1786) index!984) (select (arr!18084 a!2986) j!136)))))

(assert (=> b!622943 (=> (not res!401474) (not e!357299))))

(assert (=> b!622943 e!357299))

(declare-fun c!71103 () Bool)

(assert (=> b!622943 (= c!71103 (bvslt j!136 index!984))))

(declare-fun lt!288817 () Unit!20968)

(assert (=> b!622943 (= lt!288817 e!357301)))

(declare-fun c!71104 () Bool)

(assert (=> b!622943 (= c!71104 (bvslt index!984 j!136))))

(declare-fun lt!288808 () Unit!20968)

(assert (=> b!622943 (= lt!288808 e!357312)))

(assert (=> b!622943 false))

(declare-fun b!622944 () Bool)

(declare-fun e!357308 () Bool)

(assert (=> b!622944 (= e!357308 e!357307)))

(declare-fun res!401461 () Bool)

(assert (=> b!622944 (=> (not res!401461) (not e!357307))))

(declare-fun lt!288813 () SeekEntryResult!6524)

(assert (=> b!622944 (= res!401461 (and (= lt!288813 (Found!6524 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18084 a!2986) index!984) (select (arr!18084 a!2986) j!136))) (not (= (select (arr!18084 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!622944 (= lt!288813 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18084 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!622945 () Bool)

(declare-fun Unit!20975 () Unit!20968)

(assert (=> b!622945 (= e!357301 Unit!20975)))

(declare-fun b!622946 () Bool)

(declare-fun res!401463 () Bool)

(assert (=> b!622946 (=> (not res!401463) (not e!357304))))

(assert (=> b!622946 (= res!401463 (and (= (size!18448 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18448 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18448 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!622947 () Bool)

(declare-fun res!401459 () Bool)

(assert (=> b!622947 (=> (not res!401459) (not e!357302))))

(assert (=> b!622947 (= res!401459 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12122))))

(declare-fun b!622948 () Bool)

(declare-fun Unit!20976 () Unit!20968)

(assert (=> b!622948 (= e!357311 Unit!20976)))

(declare-fun b!622949 () Bool)

(declare-fun res!401466 () Bool)

(assert (=> b!622949 (=> (not res!401466) (not e!357304))))

(assert (=> b!622949 (= res!401466 (validKeyInArray!0 k!1786))))

(declare-fun b!622950 () Bool)

(assert (=> b!622950 (= e!357310 (= lt!288813 lt!288810))))

(declare-fun b!622951 () Bool)

(assert (=> b!622951 (= e!357302 e!357308)))

(declare-fun res!401470 () Bool)

(assert (=> b!622951 (=> (not res!401470) (not e!357308))))

(assert (=> b!622951 (= res!401470 (= (select (store (arr!18084 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!622951 (= lt!288806 (array!37677 (store (arr!18084 a!2986) i!1108 k!1786) (size!18448 a!2986)))))

(declare-fun b!622952 () Bool)

(declare-fun Unit!20977 () Unit!20968)

(assert (=> b!622952 (= e!357303 Unit!20977)))

(assert (= (and start!56206 res!401460) b!622946))

(assert (= (and b!622946 res!401463) b!622931))

(assert (= (and b!622931 res!401473) b!622949))

(assert (= (and b!622949 res!401466) b!622939))

(assert (= (and b!622939 res!401469) b!622934))

(assert (= (and b!622934 res!401464) b!622938))

(assert (= (and b!622938 res!401465) b!622947))

(assert (= (and b!622947 res!401459) b!622937))

(assert (= (and b!622937 res!401468) b!622951))

(assert (= (and b!622951 res!401470) b!622944))

(assert (= (and b!622944 res!401461) b!622930))

(assert (= (and b!622930 res!401472) b!622950))

(assert (= (and b!622930 c!71105) b!622940))

(assert (= (and b!622930 (not c!71105)) b!622948))

(assert (= (and b!622930 c!71102) b!622943))

(assert (= (and b!622930 (not c!71102)) b!622952))

(assert (= (and b!622943 res!401474) b!622935))

(assert (= (and b!622935 (not res!401462)) b!622932))

(assert (= (and b!622932 res!401471) b!622941))

(assert (= (and b!622943 c!71103) b!622936))

(assert (= (and b!622943 (not c!71103)) b!622945))

(assert (= (and b!622943 c!71104) b!622933))

(assert (= (and b!622943 (not c!71104)) b!622929))

(assert (= (and b!622933 res!401467) b!622942))

(declare-fun m!598781 () Bool)

(assert (=> b!622934 m!598781))

(declare-fun m!598783 () Bool)

(assert (=> b!622938 m!598783))

(declare-fun m!598785 () Bool)

(assert (=> b!622942 m!598785))

(assert (=> b!622942 m!598785))

(declare-fun m!598787 () Bool)

(assert (=> b!622942 m!598787))

(assert (=> b!622933 m!598785))

(declare-fun m!598789 () Bool)

(assert (=> b!622933 m!598789))

(assert (=> b!622933 m!598785))

(declare-fun m!598791 () Bool)

(assert (=> b!622933 m!598791))

(declare-fun m!598793 () Bool)

(assert (=> b!622933 m!598793))

(declare-fun m!598795 () Bool)

(assert (=> b!622933 m!598795))

(assert (=> b!622933 m!598785))

(declare-fun m!598797 () Bool)

(assert (=> b!622933 m!598797))

(assert (=> b!622933 m!598785))

(declare-fun m!598799 () Bool)

(assert (=> b!622933 m!598799))

(declare-fun m!598801 () Bool)

(assert (=> b!622933 m!598801))

(assert (=> b!622933 m!598785))

(declare-fun m!598803 () Bool)

(assert (=> b!622933 m!598803))

(declare-fun m!598805 () Bool)

(assert (=> b!622949 m!598805))

(declare-fun m!598807 () Bool)

(assert (=> start!56206 m!598807))

(declare-fun m!598809 () Bool)

(assert (=> start!56206 m!598809))

(declare-fun m!598811 () Bool)

(assert (=> b!622951 m!598811))

(declare-fun m!598813 () Bool)

(assert (=> b!622951 m!598813))

(declare-fun m!598815 () Bool)

(assert (=> b!622944 m!598815))

(assert (=> b!622944 m!598785))

(assert (=> b!622944 m!598785))

(declare-fun m!598817 () Bool)

(assert (=> b!622944 m!598817))

(assert (=> b!622931 m!598785))

(assert (=> b!622931 m!598785))

(declare-fun m!598819 () Bool)

(assert (=> b!622931 m!598819))

(declare-fun m!598821 () Bool)

(assert (=> b!622947 m!598821))

(assert (=> b!622932 m!598785))

(assert (=> b!622932 m!598785))

(assert (=> b!622932 m!598799))

(assert (=> b!622943 m!598811))

(declare-fun m!598823 () Bool)

(assert (=> b!622943 m!598823))

(assert (=> b!622943 m!598785))

(assert (=> b!622936 m!598785))

(assert (=> b!622936 m!598785))

(declare-fun m!598825 () Bool)

(assert (=> b!622936 m!598825))

(declare-fun m!598827 () Bool)

(assert (=> b!622936 m!598827))

(assert (=> b!622936 m!598785))

(declare-fun m!598829 () Bool)

(assert (=> b!622936 m!598829))

(assert (=> b!622936 m!598793))

(assert (=> b!622936 m!598795))

(declare-fun m!598831 () Bool)

(assert (=> b!622936 m!598831))

(assert (=> b!622936 m!598785))

(declare-fun m!598833 () Bool)

(assert (=> b!622936 m!598833))

(declare-fun m!598835 () Bool)

(assert (=> b!622937 m!598835))

(declare-fun m!598837 () Bool)

(assert (=> b!622930 m!598837))

(declare-fun m!598839 () Bool)

(assert (=> b!622930 m!598839))

(assert (=> b!622930 m!598811))

(declare-fun m!598841 () Bool)

(assert (=> b!622930 m!598841))

(assert (=> b!622930 m!598785))

(declare-fun m!598843 () Bool)

(assert (=> b!622930 m!598843))

(assert (=> b!622930 m!598785))

(declare-fun m!598845 () Bool)

(assert (=> b!622930 m!598845))

(declare-fun m!598847 () Bool)

(assert (=> b!622930 m!598847))

(assert (=> b!622941 m!598785))

(assert (=> b!622941 m!598785))

(assert (=> b!622941 m!598787))

(declare-fun m!598849 () Bool)

(assert (=> b!622939 m!598849))

(push 1)

