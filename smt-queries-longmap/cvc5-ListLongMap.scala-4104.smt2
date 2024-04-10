; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56122 () Bool)

(assert start!56122)

(declare-fun b!619898 () Bool)

(declare-fun e!355532 () Bool)

(declare-fun e!355541 () Bool)

(assert (=> b!619898 (= e!355532 e!355541)))

(declare-fun res!399447 () Bool)

(assert (=> b!619898 (=> (not res!399447) (not e!355541))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37592 0))(
  ( (array!37593 (arr!18042 (Array (_ BitVec 32) (_ BitVec 64))) (size!18406 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37592)

(assert (=> b!619898 (= res!399447 (= (select (store (arr!18042 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!286290 () array!37592)

(assert (=> b!619898 (= lt!286290 (array!37593 (store (arr!18042 a!2986) i!1108 k!1786) (size!18406 a!2986)))))

(declare-fun b!619899 () Bool)

(declare-datatypes ((Unit!20548 0))(
  ( (Unit!20549) )
))
(declare-fun e!355538 () Unit!20548)

(declare-fun Unit!20550 () Unit!20548)

(assert (=> b!619899 (= e!355538 Unit!20550)))

(declare-fun b!619900 () Bool)

(declare-fun res!399445 () Bool)

(declare-fun e!355528 () Bool)

(assert (=> b!619900 (=> (not res!399445) (not e!355528))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!619900 (= res!399445 (validKeyInArray!0 k!1786))))

(declare-fun b!619901 () Bool)

(declare-fun e!355534 () Bool)

(assert (=> b!619901 (= e!355534 true)))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!619901 (= (select (store (arr!18042 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun res!399446 () Bool)

(assert (=> start!56122 (=> (not res!399446) (not e!355528))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56122 (= res!399446 (validMask!0 mask!3053))))

(assert (=> start!56122 e!355528))

(assert (=> start!56122 true))

(declare-fun array_inv!13838 (array!37592) Bool)

(assert (=> start!56122 (array_inv!13838 a!2986)))

(declare-fun res!399440 () Bool)

(declare-fun b!619902 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!619902 (= res!399440 (arrayContainsKey!0 lt!286290 (select (arr!18042 a!2986) j!136) j!136))))

(declare-fun e!355540 () Bool)

(assert (=> b!619902 (=> (not res!399440) (not e!355540))))

(declare-fun e!355530 () Bool)

(assert (=> b!619902 (= e!355530 e!355540)))

(declare-fun b!619903 () Bool)

(assert (=> b!619903 (= e!355540 (arrayContainsKey!0 lt!286290 (select (arr!18042 a!2986) j!136) index!984))))

(declare-fun b!619904 () Bool)

(declare-fun e!355533 () Unit!20548)

(declare-fun Unit!20551 () Unit!20548)

(assert (=> b!619904 (= e!355533 Unit!20551)))

(declare-fun b!619905 () Bool)

(declare-fun e!355535 () Bool)

(assert (=> b!619905 (= e!355535 (arrayContainsKey!0 lt!286290 (select (arr!18042 a!2986) j!136) index!984))))

(declare-fun b!619906 () Bool)

(declare-fun res!399442 () Bool)

(assert (=> b!619906 (=> (not res!399442) (not e!355532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37592 (_ BitVec 32)) Bool)

(assert (=> b!619906 (= res!399442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!619907 () Bool)

(declare-fun res!399437 () Bool)

(assert (=> b!619907 (=> (not res!399437) (not e!355528))))

(assert (=> b!619907 (= res!399437 (validKeyInArray!0 (select (arr!18042 a!2986) j!136)))))

(declare-fun b!619908 () Bool)

(declare-fun e!355542 () Bool)

(assert (=> b!619908 (= e!355541 e!355542)))

(declare-fun res!399438 () Bool)

(assert (=> b!619908 (=> (not res!399438) (not e!355542))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6482 0))(
  ( (MissingZero!6482 (index!28212 (_ BitVec 32))) (Found!6482 (index!28213 (_ BitVec 32))) (Intermediate!6482 (undefined!7294 Bool) (index!28214 (_ BitVec 32)) (x!56994 (_ BitVec 32))) (Undefined!6482) (MissingVacant!6482 (index!28215 (_ BitVec 32))) )
))
(declare-fun lt!286286 () SeekEntryResult!6482)

(assert (=> b!619908 (= res!399438 (and (= lt!286286 (Found!6482 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18042 a!2986) index!984) (select (arr!18042 a!2986) j!136))) (not (= (select (arr!18042 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37592 (_ BitVec 32)) SeekEntryResult!6482)

(assert (=> b!619908 (= lt!286286 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18042 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!619909 () Bool)

(declare-fun e!355529 () Unit!20548)

(declare-fun Unit!20552 () Unit!20548)

(assert (=> b!619909 (= e!355529 Unit!20552)))

(declare-fun res!399439 () Bool)

(assert (=> b!619909 (= res!399439 (= (select (store (arr!18042 a!2986) i!1108 k!1786) index!984) (select (arr!18042 a!2986) j!136)))))

(declare-fun e!355537 () Bool)

(assert (=> b!619909 (=> (not res!399439) (not e!355537))))

(assert (=> b!619909 e!355537))

(declare-fun c!70598 () Bool)

(assert (=> b!619909 (= c!70598 (bvslt j!136 index!984))))

(declare-fun lt!286281 () Unit!20548)

(assert (=> b!619909 (= lt!286281 e!355538)))

(declare-fun c!70599 () Bool)

(assert (=> b!619909 (= c!70599 (bvslt index!984 j!136))))

(declare-fun lt!286297 () Unit!20548)

(declare-fun e!355531 () Unit!20548)

(assert (=> b!619909 (= lt!286297 e!355531)))

(assert (=> b!619909 false))

(declare-fun b!619910 () Bool)

(declare-fun Unit!20553 () Unit!20548)

(assert (=> b!619910 (= e!355531 Unit!20553)))

(declare-fun b!619911 () Bool)

(declare-fun res!399449 () Bool)

(assert (=> b!619911 (=> (not res!399449) (not e!355532))))

(declare-datatypes ((List!12083 0))(
  ( (Nil!12080) (Cons!12079 (h!13124 (_ BitVec 64)) (t!18311 List!12083)) )
))
(declare-fun arrayNoDuplicates!0 (array!37592 (_ BitVec 32) List!12083) Bool)

(assert (=> b!619911 (= res!399449 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12080))))

(declare-fun b!619912 () Bool)

(declare-fun res!399443 () Bool)

(assert (=> b!619912 (=> (not res!399443) (not e!355528))))

(assert (=> b!619912 (= res!399443 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!619913 () Bool)

(declare-fun Unit!20554 () Unit!20548)

(assert (=> b!619913 (= e!355533 Unit!20554)))

(assert (=> b!619913 false))

(declare-fun b!619914 () Bool)

(declare-fun res!399444 () Bool)

(assert (=> b!619914 (=> (not res!399444) (not e!355532))))

(assert (=> b!619914 (= res!399444 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18042 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!619915 () Bool)

(assert (=> b!619915 false))

(declare-fun lt!286284 () Unit!20548)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37592 (_ BitVec 64) (_ BitVec 32) List!12083) Unit!20548)

(assert (=> b!619915 (= lt!286284 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286290 (select (arr!18042 a!2986) j!136) index!984 Nil!12080))))

(assert (=> b!619915 (arrayNoDuplicates!0 lt!286290 index!984 Nil!12080)))

(declare-fun lt!286294 () Unit!20548)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37592 (_ BitVec 32) (_ BitVec 32)) Unit!20548)

(assert (=> b!619915 (= lt!286294 (lemmaNoDuplicateFromThenFromBigger!0 lt!286290 #b00000000000000000000000000000000 index!984))))

(assert (=> b!619915 (arrayNoDuplicates!0 lt!286290 #b00000000000000000000000000000000 Nil!12080)))

(declare-fun lt!286296 () Unit!20548)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37592 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12083) Unit!20548)

(assert (=> b!619915 (= lt!286296 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12080))))

(assert (=> b!619915 (arrayContainsKey!0 lt!286290 (select (arr!18042 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286287 () Unit!20548)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37592 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20548)

(assert (=> b!619915 (= lt!286287 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286290 (select (arr!18042 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!619915 e!355535))

(declare-fun res!399436 () Bool)

(assert (=> b!619915 (=> (not res!399436) (not e!355535))))

(assert (=> b!619915 (= res!399436 (arrayContainsKey!0 lt!286290 (select (arr!18042 a!2986) j!136) j!136))))

(declare-fun Unit!20555 () Unit!20548)

(assert (=> b!619915 (= e!355531 Unit!20555)))

(declare-fun b!619916 () Bool)

(declare-fun Unit!20556 () Unit!20548)

(assert (=> b!619916 (= e!355529 Unit!20556)))

(declare-fun b!619917 () Bool)

(declare-fun e!355536 () Bool)

(declare-fun lt!286288 () SeekEntryResult!6482)

(assert (=> b!619917 (= e!355536 (= lt!286286 lt!286288))))

(declare-fun b!619918 () Bool)

(assert (=> b!619918 false))

(declare-fun lt!286289 () Unit!20548)

(assert (=> b!619918 (= lt!286289 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286290 (select (arr!18042 a!2986) j!136) j!136 Nil!12080))))

(assert (=> b!619918 (arrayNoDuplicates!0 lt!286290 j!136 Nil!12080)))

(declare-fun lt!286280 () Unit!20548)

(assert (=> b!619918 (= lt!286280 (lemmaNoDuplicateFromThenFromBigger!0 lt!286290 #b00000000000000000000000000000000 j!136))))

(assert (=> b!619918 (arrayNoDuplicates!0 lt!286290 #b00000000000000000000000000000000 Nil!12080)))

(declare-fun lt!286295 () Unit!20548)

(assert (=> b!619918 (= lt!286295 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12080))))

(assert (=> b!619918 (arrayContainsKey!0 lt!286290 (select (arr!18042 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286282 () Unit!20548)

(assert (=> b!619918 (= lt!286282 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286290 (select (arr!18042 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20557 () Unit!20548)

(assert (=> b!619918 (= e!355538 Unit!20557)))

(declare-fun b!619919 () Bool)

(declare-fun res!399441 () Bool)

(assert (=> b!619919 (=> (not res!399441) (not e!355528))))

(assert (=> b!619919 (= res!399441 (and (= (size!18406 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18406 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18406 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!619920 () Bool)

(assert (=> b!619920 (= e!355528 e!355532)))

(declare-fun res!399450 () Bool)

(assert (=> b!619920 (=> (not res!399450) (not e!355532))))

(declare-fun lt!286293 () SeekEntryResult!6482)

(assert (=> b!619920 (= res!399450 (or (= lt!286293 (MissingZero!6482 i!1108)) (= lt!286293 (MissingVacant!6482 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37592 (_ BitVec 32)) SeekEntryResult!6482)

(assert (=> b!619920 (= lt!286293 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!619921 () Bool)

(declare-fun res!399448 () Bool)

(assert (=> b!619921 (= res!399448 (bvsge j!136 index!984))))

(assert (=> b!619921 (=> res!399448 e!355530)))

(assert (=> b!619921 (= e!355537 e!355530)))

(declare-fun b!619922 () Bool)

(assert (=> b!619922 (= e!355542 (not e!355534))))

(declare-fun res!399452 () Bool)

(assert (=> b!619922 (=> res!399452 e!355534)))

(declare-fun lt!286291 () SeekEntryResult!6482)

(assert (=> b!619922 (= res!399452 (not (= lt!286291 (MissingVacant!6482 vacantSpotIndex!68))))))

(declare-fun lt!286285 () Unit!20548)

(assert (=> b!619922 (= lt!286285 e!355529)))

(declare-fun c!70600 () Bool)

(assert (=> b!619922 (= c!70600 (= lt!286291 (Found!6482 index!984)))))

(declare-fun lt!286292 () Unit!20548)

(assert (=> b!619922 (= lt!286292 e!355533)))

(declare-fun c!70601 () Bool)

(assert (=> b!619922 (= c!70601 (= lt!286291 Undefined!6482))))

(declare-fun lt!286279 () (_ BitVec 64))

(assert (=> b!619922 (= lt!286291 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286279 lt!286290 mask!3053))))

(assert (=> b!619922 e!355536))

(declare-fun res!399451 () Bool)

(assert (=> b!619922 (=> (not res!399451) (not e!355536))))

(declare-fun lt!286283 () (_ BitVec 32))

(assert (=> b!619922 (= res!399451 (= lt!286288 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286283 vacantSpotIndex!68 lt!286279 lt!286290 mask!3053)))))

(assert (=> b!619922 (= lt!286288 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286283 vacantSpotIndex!68 (select (arr!18042 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!619922 (= lt!286279 (select (store (arr!18042 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!286278 () Unit!20548)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37592 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20548)

(assert (=> b!619922 (= lt!286278 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286283 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!619922 (= lt!286283 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!56122 res!399446) b!619919))

(assert (= (and b!619919 res!399441) b!619907))

(assert (= (and b!619907 res!399437) b!619900))

(assert (= (and b!619900 res!399445) b!619912))

(assert (= (and b!619912 res!399443) b!619920))

(assert (= (and b!619920 res!399450) b!619906))

(assert (= (and b!619906 res!399442) b!619911))

(assert (= (and b!619911 res!399449) b!619914))

(assert (= (and b!619914 res!399444) b!619898))

(assert (= (and b!619898 res!399447) b!619908))

(assert (= (and b!619908 res!399438) b!619922))

(assert (= (and b!619922 res!399451) b!619917))

(assert (= (and b!619922 c!70601) b!619913))

(assert (= (and b!619922 (not c!70601)) b!619904))

(assert (= (and b!619922 c!70600) b!619909))

(assert (= (and b!619922 (not c!70600)) b!619916))

(assert (= (and b!619909 res!399439) b!619921))

(assert (= (and b!619921 (not res!399448)) b!619902))

(assert (= (and b!619902 res!399440) b!619903))

(assert (= (and b!619909 c!70598) b!619918))

(assert (= (and b!619909 (not c!70598)) b!619899))

(assert (= (and b!619909 c!70599) b!619915))

(assert (= (and b!619909 (not c!70599)) b!619910))

(assert (= (and b!619915 res!399436) b!619905))

(assert (= (and b!619922 (not res!399452)) b!619901))

(declare-fun m!595841 () Bool)

(assert (=> b!619908 m!595841))

(declare-fun m!595843 () Bool)

(assert (=> b!619908 m!595843))

(assert (=> b!619908 m!595843))

(declare-fun m!595845 () Bool)

(assert (=> b!619908 m!595845))

(assert (=> b!619907 m!595843))

(assert (=> b!619907 m!595843))

(declare-fun m!595847 () Bool)

(assert (=> b!619907 m!595847))

(declare-fun m!595849 () Bool)

(assert (=> b!619911 m!595849))

(declare-fun m!595851 () Bool)

(assert (=> start!56122 m!595851))

(declare-fun m!595853 () Bool)

(assert (=> start!56122 m!595853))

(declare-fun m!595855 () Bool)

(assert (=> b!619898 m!595855))

(declare-fun m!595857 () Bool)

(assert (=> b!619898 m!595857))

(declare-fun m!595859 () Bool)

(assert (=> b!619900 m!595859))

(assert (=> b!619901 m!595855))

(declare-fun m!595861 () Bool)

(assert (=> b!619901 m!595861))

(assert (=> b!619902 m!595843))

(assert (=> b!619902 m!595843))

(declare-fun m!595863 () Bool)

(assert (=> b!619902 m!595863))

(assert (=> b!619918 m!595843))

(declare-fun m!595865 () Bool)

(assert (=> b!619918 m!595865))

(assert (=> b!619918 m!595843))

(declare-fun m!595867 () Bool)

(assert (=> b!619918 m!595867))

(declare-fun m!595869 () Bool)

(assert (=> b!619918 m!595869))

(assert (=> b!619918 m!595843))

(declare-fun m!595871 () Bool)

(assert (=> b!619918 m!595871))

(declare-fun m!595873 () Bool)

(assert (=> b!619918 m!595873))

(declare-fun m!595875 () Bool)

(assert (=> b!619918 m!595875))

(assert (=> b!619918 m!595843))

(declare-fun m!595877 () Bool)

(assert (=> b!619918 m!595877))

(assert (=> b!619909 m!595855))

(assert (=> b!619909 m!595861))

(assert (=> b!619909 m!595843))

(declare-fun m!595879 () Bool)

(assert (=> b!619920 m!595879))

(assert (=> b!619903 m!595843))

(assert (=> b!619903 m!595843))

(declare-fun m!595881 () Bool)

(assert (=> b!619903 m!595881))

(assert (=> b!619915 m!595843))

(declare-fun m!595883 () Bool)

(assert (=> b!619915 m!595883))

(assert (=> b!619915 m!595843))

(declare-fun m!595885 () Bool)

(assert (=> b!619915 m!595885))

(declare-fun m!595887 () Bool)

(assert (=> b!619915 m!595887))

(assert (=> b!619915 m!595843))

(declare-fun m!595889 () Bool)

(assert (=> b!619915 m!595889))

(assert (=> b!619915 m!595843))

(assert (=> b!619915 m!595863))

(assert (=> b!619915 m!595875))

(assert (=> b!619915 m!595843))

(declare-fun m!595891 () Bool)

(assert (=> b!619915 m!595891))

(assert (=> b!619915 m!595869))

(assert (=> b!619905 m!595843))

(assert (=> b!619905 m!595843))

(assert (=> b!619905 m!595881))

(declare-fun m!595893 () Bool)

(assert (=> b!619912 m!595893))

(declare-fun m!595895 () Bool)

(assert (=> b!619922 m!595895))

(declare-fun m!595897 () Bool)

(assert (=> b!619922 m!595897))

(assert (=> b!619922 m!595843))

(declare-fun m!595899 () Bool)

(assert (=> b!619922 m!595899))

(assert (=> b!619922 m!595855))

(declare-fun m!595901 () Bool)

(assert (=> b!619922 m!595901))

(assert (=> b!619922 m!595843))

(declare-fun m!595903 () Bool)

(assert (=> b!619922 m!595903))

(declare-fun m!595905 () Bool)

(assert (=> b!619922 m!595905))

(declare-fun m!595907 () Bool)

(assert (=> b!619906 m!595907))

(declare-fun m!595909 () Bool)

(assert (=> b!619914 m!595909))

(push 1)

