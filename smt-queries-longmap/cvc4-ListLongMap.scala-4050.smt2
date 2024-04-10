; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55346 () Bool)

(assert start!55346)

(declare-fun b!606015 () Bool)

(declare-datatypes ((Unit!19312 0))(
  ( (Unit!19313) )
))
(declare-fun e!346905 () Unit!19312)

(declare-fun Unit!19314 () Unit!19312)

(assert (=> b!606015 (= e!346905 Unit!19314)))

(assert (=> b!606015 false))

(declare-fun b!606016 () Bool)

(declare-fun e!346913 () Bool)

(declare-fun e!346909 () Bool)

(assert (=> b!606016 (= e!346913 e!346909)))

(declare-fun res!389372 () Bool)

(assert (=> b!606016 (=> (not res!389372) (not e!346909))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37257 0))(
  ( (array!37258 (arr!17882 (Array (_ BitVec 32) (_ BitVec 64))) (size!18246 (_ BitVec 32))) )
))
(declare-fun lt!276595 () array!37257)

(declare-fun a!2986 () array!37257)

(declare-fun arrayContainsKey!0 (array!37257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!606016 (= res!389372 (arrayContainsKey!0 lt!276595 (select (arr!17882 a!2986) j!136) j!136))))

(declare-fun b!606017 () Bool)

(declare-fun e!346919 () Bool)

(declare-fun e!346914 () Bool)

(assert (=> b!606017 (= e!346919 (not e!346914))))

(declare-fun res!389368 () Bool)

(assert (=> b!606017 (=> res!389368 e!346914)))

(declare-datatypes ((SeekEntryResult!6322 0))(
  ( (MissingZero!6322 (index!27557 (_ BitVec 32))) (Found!6322 (index!27558 (_ BitVec 32))) (Intermediate!6322 (undefined!7134 Bool) (index!27559 (_ BitVec 32)) (x!56357 (_ BitVec 32))) (Undefined!6322) (MissingVacant!6322 (index!27560 (_ BitVec 32))) )
))
(declare-fun lt!276583 () SeekEntryResult!6322)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!606017 (= res!389368 (not (= lt!276583 (Found!6322 index!984))))))

(declare-fun lt!276584 () Unit!19312)

(assert (=> b!606017 (= lt!276584 e!346905)))

(declare-fun c!68696 () Bool)

(assert (=> b!606017 (= c!68696 (= lt!276583 Undefined!6322))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!276588 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37257 (_ BitVec 32)) SeekEntryResult!6322)

(assert (=> b!606017 (= lt!276583 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276588 lt!276595 mask!3053))))

(declare-fun e!346907 () Bool)

(assert (=> b!606017 e!346907))

(declare-fun res!389371 () Bool)

(assert (=> b!606017 (=> (not res!389371) (not e!346907))))

(declare-fun lt!276585 () (_ BitVec 32))

(declare-fun lt!276586 () SeekEntryResult!6322)

(assert (=> b!606017 (= res!389371 (= lt!276586 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276585 vacantSpotIndex!68 lt!276588 lt!276595 mask!3053)))))

(assert (=> b!606017 (= lt!276586 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276585 vacantSpotIndex!68 (select (arr!17882 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!606017 (= lt!276588 (select (store (arr!17882 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!276587 () Unit!19312)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37257 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19312)

(assert (=> b!606017 (= lt!276587 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276585 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!606017 (= lt!276585 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!606018 () Bool)

(declare-fun res!389377 () Bool)

(declare-fun e!346911 () Bool)

(assert (=> b!606018 (=> (not res!389377) (not e!346911))))

(assert (=> b!606018 (= res!389377 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!389378 () Bool)

(assert (=> start!55346 (=> (not res!389378) (not e!346911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55346 (= res!389378 (validMask!0 mask!3053))))

(assert (=> start!55346 e!346911))

(assert (=> start!55346 true))

(declare-fun array_inv!13678 (array!37257) Bool)

(assert (=> start!55346 (array_inv!13678 a!2986)))

(declare-fun b!606019 () Bool)

(declare-fun e!346912 () Bool)

(declare-fun e!346908 () Bool)

(assert (=> b!606019 (= e!346912 e!346908)))

(declare-fun res!389362 () Bool)

(assert (=> b!606019 (=> res!389362 e!346908)))

(assert (=> b!606019 (= res!389362 (bvsge index!984 j!136))))

(declare-fun lt!276580 () Unit!19312)

(declare-fun e!346906 () Unit!19312)

(assert (=> b!606019 (= lt!276580 e!346906)))

(declare-fun c!68695 () Bool)

(assert (=> b!606019 (= c!68695 (bvslt j!136 index!984))))

(declare-fun b!606020 () Bool)

(declare-fun res!389373 () Bool)

(declare-fun e!346915 () Bool)

(assert (=> b!606020 (=> (not res!389373) (not e!346915))))

(declare-datatypes ((List!11923 0))(
  ( (Nil!11920) (Cons!11919 (h!12964 (_ BitVec 64)) (t!18151 List!11923)) )
))
(declare-fun arrayNoDuplicates!0 (array!37257 (_ BitVec 32) List!11923) Bool)

(assert (=> b!606020 (= res!389373 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11920))))

(declare-fun e!346920 () Bool)

(declare-fun b!606021 () Bool)

(assert (=> b!606021 (= e!346920 (arrayContainsKey!0 lt!276595 (select (arr!17882 a!2986) j!136) index!984))))

(declare-fun b!606022 () Bool)

(assert (=> b!606022 (= e!346914 e!346912)))

(declare-fun res!389370 () Bool)

(assert (=> b!606022 (=> res!389370 e!346912)))

(declare-fun lt!276590 () (_ BitVec 64))

(assert (=> b!606022 (= res!389370 (or (not (= (select (arr!17882 a!2986) j!136) lt!276588)) (not (= (select (arr!17882 a!2986) j!136) lt!276590))))))

(declare-fun e!346917 () Bool)

(assert (=> b!606022 e!346917))

(declare-fun res!389374 () Bool)

(assert (=> b!606022 (=> (not res!389374) (not e!346917))))

(assert (=> b!606022 (= res!389374 (= lt!276590 (select (arr!17882 a!2986) j!136)))))

(assert (=> b!606022 (= lt!276590 (select (store (arr!17882 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!606023 () Bool)

(declare-fun res!389375 () Bool)

(assert (=> b!606023 (=> (not res!389375) (not e!346915))))

(assert (=> b!606023 (= res!389375 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17882 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!606024 () Bool)

(declare-fun lt!276592 () SeekEntryResult!6322)

(assert (=> b!606024 (= e!346907 (= lt!276592 lt!276586))))

(declare-fun b!606025 () Bool)

(assert (=> b!606025 (= e!346917 e!346913)))

(declare-fun res!389369 () Bool)

(assert (=> b!606025 (=> res!389369 e!346913)))

(assert (=> b!606025 (= res!389369 (or (not (= (select (arr!17882 a!2986) j!136) lt!276588)) (not (= (select (arr!17882 a!2986) j!136) lt!276590)) (bvsge j!136 index!984)))))

(declare-fun b!606026 () Bool)

(declare-fun Unit!19315 () Unit!19312)

(assert (=> b!606026 (= e!346906 Unit!19315)))

(declare-fun b!606027 () Bool)

(declare-fun res!389366 () Bool)

(assert (=> b!606027 (=> (not res!389366) (not e!346911))))

(assert (=> b!606027 (= res!389366 (and (= (size!18246 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18246 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18246 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!606028 () Bool)

(declare-fun e!346910 () Bool)

(declare-fun noDuplicate!305 (List!11923) Bool)

(assert (=> b!606028 (= e!346910 (noDuplicate!305 Nil!11920))))

(declare-fun b!606029 () Bool)

(declare-fun res!389365 () Bool)

(assert (=> b!606029 (=> (not res!389365) (not e!346915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37257 (_ BitVec 32)) Bool)

(assert (=> b!606029 (= res!389365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!606030 () Bool)

(declare-fun e!346916 () Bool)

(assert (=> b!606030 (= e!346915 e!346916)))

(declare-fun res!389359 () Bool)

(assert (=> b!606030 (=> (not res!389359) (not e!346916))))

(assert (=> b!606030 (= res!389359 (= (select (store (arr!17882 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!606030 (= lt!276595 (array!37258 (store (arr!17882 a!2986) i!1108 k!1786) (size!18246 a!2986)))))

(declare-fun b!606031 () Bool)

(assert (=> b!606031 (= e!346909 (arrayContainsKey!0 lt!276595 (select (arr!17882 a!2986) j!136) index!984))))

(declare-fun b!606032 () Bool)

(declare-fun res!389363 () Bool)

(assert (=> b!606032 (=> (not res!389363) (not e!346911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!606032 (= res!389363 (validKeyInArray!0 (select (arr!17882 a!2986) j!136)))))

(declare-fun b!606033 () Bool)

(declare-fun Unit!19316 () Unit!19312)

(assert (=> b!606033 (= e!346906 Unit!19316)))

(declare-fun lt!276589 () Unit!19312)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37257 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19312)

(assert (=> b!606033 (= lt!276589 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276595 (select (arr!17882 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!606033 (arrayContainsKey!0 lt!276595 (select (arr!17882 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276594 () Unit!19312)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37257 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11923) Unit!19312)

(assert (=> b!606033 (= lt!276594 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11920))))

(assert (=> b!606033 (arrayNoDuplicates!0 lt!276595 #b00000000000000000000000000000000 Nil!11920)))

(declare-fun lt!276593 () Unit!19312)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37257 (_ BitVec 32) (_ BitVec 32)) Unit!19312)

(assert (=> b!606033 (= lt!276593 (lemmaNoDuplicateFromThenFromBigger!0 lt!276595 #b00000000000000000000000000000000 j!136))))

(assert (=> b!606033 (arrayNoDuplicates!0 lt!276595 j!136 Nil!11920)))

(declare-fun lt!276582 () Unit!19312)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37257 (_ BitVec 64) (_ BitVec 32) List!11923) Unit!19312)

(assert (=> b!606033 (= lt!276582 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276595 (select (arr!17882 a!2986) j!136) j!136 Nil!11920))))

(assert (=> b!606033 false))

(declare-fun b!606034 () Bool)

(declare-fun res!389364 () Bool)

(assert (=> b!606034 (=> (not res!389364) (not e!346911))))

(assert (=> b!606034 (= res!389364 (validKeyInArray!0 k!1786))))

(declare-fun b!606035 () Bool)

(assert (=> b!606035 (= e!346916 e!346919)))

(declare-fun res!389361 () Bool)

(assert (=> b!606035 (=> (not res!389361) (not e!346919))))

(assert (=> b!606035 (= res!389361 (and (= lt!276592 (Found!6322 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17882 a!2986) index!984) (select (arr!17882 a!2986) j!136))) (not (= (select (arr!17882 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!606035 (= lt!276592 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17882 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!606036 () Bool)

(declare-fun Unit!19317 () Unit!19312)

(assert (=> b!606036 (= e!346905 Unit!19317)))

(declare-fun b!606037 () Bool)

(assert (=> b!606037 (= e!346911 e!346915)))

(declare-fun res!389376 () Bool)

(assert (=> b!606037 (=> (not res!389376) (not e!346915))))

(declare-fun lt!276591 () SeekEntryResult!6322)

(assert (=> b!606037 (= res!389376 (or (= lt!276591 (MissingZero!6322 i!1108)) (= lt!276591 (MissingVacant!6322 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37257 (_ BitVec 32)) SeekEntryResult!6322)

(assert (=> b!606037 (= lt!276591 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!606038 () Bool)

(assert (=> b!606038 (= e!346908 e!346910)))

(declare-fun res!389360 () Bool)

(assert (=> b!606038 (=> res!389360 e!346910)))

(assert (=> b!606038 (= res!389360 (or (bvsgt #b00000000000000000000000000000000 (size!18246 a!2986)) (bvsge (size!18246 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!606038 (arrayContainsKey!0 lt!276595 (select (arr!17882 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276581 () Unit!19312)

(assert (=> b!606038 (= lt!276581 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276595 (select (arr!17882 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!606038 e!346920))

(declare-fun res!389367 () Bool)

(assert (=> b!606038 (=> (not res!389367) (not e!346920))))

(assert (=> b!606038 (= res!389367 (arrayContainsKey!0 lt!276595 (select (arr!17882 a!2986) j!136) j!136))))

(assert (= (and start!55346 res!389378) b!606027))

(assert (= (and b!606027 res!389366) b!606032))

(assert (= (and b!606032 res!389363) b!606034))

(assert (= (and b!606034 res!389364) b!606018))

(assert (= (and b!606018 res!389377) b!606037))

(assert (= (and b!606037 res!389376) b!606029))

(assert (= (and b!606029 res!389365) b!606020))

(assert (= (and b!606020 res!389373) b!606023))

(assert (= (and b!606023 res!389375) b!606030))

(assert (= (and b!606030 res!389359) b!606035))

(assert (= (and b!606035 res!389361) b!606017))

(assert (= (and b!606017 res!389371) b!606024))

(assert (= (and b!606017 c!68696) b!606015))

(assert (= (and b!606017 (not c!68696)) b!606036))

(assert (= (and b!606017 (not res!389368)) b!606022))

(assert (= (and b!606022 res!389374) b!606025))

(assert (= (and b!606025 (not res!389369)) b!606016))

(assert (= (and b!606016 res!389372) b!606031))

(assert (= (and b!606022 (not res!389370)) b!606019))

(assert (= (and b!606019 c!68695) b!606033))

(assert (= (and b!606019 (not c!68695)) b!606026))

(assert (= (and b!606019 (not res!389362)) b!606038))

(assert (= (and b!606038 res!389367) b!606021))

(assert (= (and b!606038 (not res!389360)) b!606028))

(declare-fun m!582845 () Bool)

(assert (=> b!606022 m!582845))

(declare-fun m!582847 () Bool)

(assert (=> b!606022 m!582847))

(declare-fun m!582849 () Bool)

(assert (=> b!606022 m!582849))

(declare-fun m!582851 () Bool)

(assert (=> b!606037 m!582851))

(assert (=> b!606038 m!582845))

(assert (=> b!606038 m!582845))

(declare-fun m!582853 () Bool)

(assert (=> b!606038 m!582853))

(assert (=> b!606038 m!582845))

(declare-fun m!582855 () Bool)

(assert (=> b!606038 m!582855))

(assert (=> b!606038 m!582845))

(declare-fun m!582857 () Bool)

(assert (=> b!606038 m!582857))

(declare-fun m!582859 () Bool)

(assert (=> start!55346 m!582859))

(declare-fun m!582861 () Bool)

(assert (=> start!55346 m!582861))

(declare-fun m!582863 () Bool)

(assert (=> b!606017 m!582863))

(declare-fun m!582865 () Bool)

(assert (=> b!606017 m!582865))

(declare-fun m!582867 () Bool)

(assert (=> b!606017 m!582867))

(assert (=> b!606017 m!582845))

(assert (=> b!606017 m!582847))

(declare-fun m!582869 () Bool)

(assert (=> b!606017 m!582869))

(declare-fun m!582871 () Bool)

(assert (=> b!606017 m!582871))

(assert (=> b!606017 m!582845))

(declare-fun m!582873 () Bool)

(assert (=> b!606017 m!582873))

(assert (=> b!606030 m!582847))

(declare-fun m!582875 () Bool)

(assert (=> b!606030 m!582875))

(assert (=> b!606031 m!582845))

(assert (=> b!606031 m!582845))

(declare-fun m!582877 () Bool)

(assert (=> b!606031 m!582877))

(declare-fun m!582879 () Bool)

(assert (=> b!606029 m!582879))

(declare-fun m!582881 () Bool)

(assert (=> b!606028 m!582881))

(assert (=> b!606032 m!582845))

(assert (=> b!606032 m!582845))

(declare-fun m!582883 () Bool)

(assert (=> b!606032 m!582883))

(assert (=> b!606016 m!582845))

(assert (=> b!606016 m!582845))

(assert (=> b!606016 m!582857))

(declare-fun m!582885 () Bool)

(assert (=> b!606033 m!582885))

(declare-fun m!582887 () Bool)

(assert (=> b!606033 m!582887))

(assert (=> b!606033 m!582845))

(declare-fun m!582889 () Bool)

(assert (=> b!606033 m!582889))

(declare-fun m!582891 () Bool)

(assert (=> b!606033 m!582891))

(assert (=> b!606033 m!582845))

(declare-fun m!582893 () Bool)

(assert (=> b!606033 m!582893))

(declare-fun m!582895 () Bool)

(assert (=> b!606033 m!582895))

(assert (=> b!606033 m!582845))

(assert (=> b!606033 m!582845))

(declare-fun m!582897 () Bool)

(assert (=> b!606033 m!582897))

(declare-fun m!582899 () Bool)

(assert (=> b!606023 m!582899))

(declare-fun m!582901 () Bool)

(assert (=> b!606020 m!582901))

(declare-fun m!582903 () Bool)

(assert (=> b!606035 m!582903))

(assert (=> b!606035 m!582845))

(assert (=> b!606035 m!582845))

(declare-fun m!582905 () Bool)

(assert (=> b!606035 m!582905))

(declare-fun m!582907 () Bool)

(assert (=> b!606034 m!582907))

(assert (=> b!606021 m!582845))

(assert (=> b!606021 m!582845))

(assert (=> b!606021 m!582877))

(declare-fun m!582909 () Bool)

(assert (=> b!606018 m!582909))

(assert (=> b!606025 m!582845))

(push 1)

(assert (not b!606017))

(assert (not b!606037))

(assert (not b!606020))

(assert (not b!606033))

(assert (not b!606021))

(assert (not b!606018))

(assert (not b!606028))

(assert (not b!606032))

(assert (not b!606038))

(assert (not b!606034))

(assert (not start!55346))

(assert (not b!606016))

(assert (not b!606035))

(assert (not b!606029))

(assert (not b!606031))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87773 () Bool)

(assert (=> d!87773 (= (validKeyInArray!0 (select (arr!17882 a!2986) j!136)) (and (not (= (select (arr!17882 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17882 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!606032 d!87773))

(declare-fun d!87775 () Bool)

(declare-fun res!389428 () Bool)

(declare-fun e!346985 () Bool)

(assert (=> d!87775 (=> res!389428 e!346985)))

(assert (=> d!87775 (= res!389428 (= (select (arr!17882 lt!276595) index!984) (select (arr!17882 a!2986) j!136)))))

(assert (=> d!87775 (= (arrayContainsKey!0 lt!276595 (select (arr!17882 a!2986) j!136) index!984) e!346985)))

(declare-fun b!606118 () Bool)

(declare-fun e!346986 () Bool)

(assert (=> b!606118 (= e!346985 e!346986)))

(declare-fun res!389429 () Bool)

(assert (=> b!606118 (=> (not res!389429) (not e!346986))))

(assert (=> b!606118 (= res!389429 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18246 lt!276595)))))

(declare-fun b!606119 () Bool)

(assert (=> b!606119 (= e!346986 (arrayContainsKey!0 lt!276595 (select (arr!17882 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87775 (not res!389428)) b!606118))

(assert (= (and b!606118 res!389429) b!606119))

(declare-fun m!582969 () Bool)

(assert (=> d!87775 m!582969))

(assert (=> b!606119 m!582845))

(declare-fun m!582971 () Bool)

(assert (=> b!606119 m!582971))

(assert (=> b!606021 d!87775))

(declare-fun d!87783 () Bool)

(assert (=> d!87783 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!606034 d!87783))

(declare-fun d!87785 () Bool)

(assert (=> d!87785 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18246 lt!276595)) (not (= (select (arr!17882 lt!276595) j!136) (select (arr!17882 a!2986) j!136))))))

(declare-fun lt!276626 () Unit!19312)

(declare-fun choose!21 (array!37257 (_ BitVec 64) (_ BitVec 32) List!11923) Unit!19312)

(assert (=> d!87785 (= lt!276626 (choose!21 lt!276595 (select (arr!17882 a!2986) j!136) j!136 Nil!11920))))

(assert (=> d!87785 (bvslt (size!18246 lt!276595) #b01111111111111111111111111111111)))

(assert (=> d!87785 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276595 (select (arr!17882 a!2986) j!136) j!136 Nil!11920) lt!276626)))

(declare-fun bs!18540 () Bool)

(assert (= bs!18540 d!87785))

(declare-fun m!582983 () Bool)

(assert (=> bs!18540 m!582983))

(assert (=> bs!18540 m!582845))

(declare-fun m!582985 () Bool)

(assert (=> bs!18540 m!582985))

(assert (=> b!606033 d!87785))

(declare-fun d!87793 () Bool)

(assert (=> d!87793 (arrayContainsKey!0 lt!276595 (select (arr!17882 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276629 () Unit!19312)

(declare-fun choose!114 (array!37257 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19312)

(assert (=> d!87793 (= lt!276629 (choose!114 lt!276595 (select (arr!17882 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87793 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87793 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276595 (select (arr!17882 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!276629)))

(declare-fun bs!18541 () Bool)

(assert (= bs!18541 d!87793))

(assert (=> bs!18541 m!582845))

(assert (=> bs!18541 m!582897))

(assert (=> bs!18541 m!582845))

(declare-fun m!582987 () Bool)

(assert (=> bs!18541 m!582987))

(assert (=> b!606033 d!87793))

(declare-fun d!87795 () Bool)

(assert (=> d!87795 (arrayNoDuplicates!0 lt!276595 j!136 Nil!11920)))

(declare-fun lt!276634 () Unit!19312)

(declare-fun choose!39 (array!37257 (_ BitVec 32) (_ BitVec 32)) Unit!19312)

(assert (=> d!87795 (= lt!276634 (choose!39 lt!276595 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87795 (bvslt (size!18246 lt!276595) #b01111111111111111111111111111111)))

(assert (=> d!87795 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!276595 #b00000000000000000000000000000000 j!136) lt!276634)))

(declare-fun bs!18542 () Bool)

(assert (= bs!18542 d!87795))

(assert (=> bs!18542 m!582895))

(declare-fun m!582995 () Bool)

(assert (=> bs!18542 m!582995))

(assert (=> b!606033 d!87795))

(declare-fun bm!33071 () Bool)

(declare-fun call!33074 () Bool)

(declare-fun c!68732 () Bool)

(assert (=> bm!33071 (= call!33074 (arrayNoDuplicates!0 lt!276595 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68732 (Cons!11919 (select (arr!17882 lt!276595) #b00000000000000000000000000000000) Nil!11920) Nil!11920)))))

(declare-fun b!606179 () Bool)

(declare-fun e!347026 () Bool)

(declare-fun e!347028 () Bool)

(assert (=> b!606179 (= e!347026 e!347028)))

(declare-fun res!389449 () Bool)

(assert (=> b!606179 (=> (not res!389449) (not e!347028))))

(declare-fun e!347029 () Bool)

(assert (=> b!606179 (= res!389449 (not e!347029))))

(declare-fun res!389450 () Bool)

(assert (=> b!606179 (=> (not res!389450) (not e!347029))))

(assert (=> b!606179 (= res!389450 (validKeyInArray!0 (select (arr!17882 lt!276595) #b00000000000000000000000000000000)))))

(declare-fun d!87799 () Bool)

(declare-fun res!389451 () Bool)

(assert (=> d!87799 (=> res!389451 e!347026)))

(assert (=> d!87799 (= res!389451 (bvsge #b00000000000000000000000000000000 (size!18246 lt!276595)))))

(assert (=> d!87799 (= (arrayNoDuplicates!0 lt!276595 #b00000000000000000000000000000000 Nil!11920) e!347026)))

(declare-fun b!606180 () Bool)

(declare-fun e!347027 () Bool)

(assert (=> b!606180 (= e!347027 call!33074)))

(declare-fun b!606181 () Bool)

(declare-fun contains!2999 (List!11923 (_ BitVec 64)) Bool)

(assert (=> b!606181 (= e!347029 (contains!2999 Nil!11920 (select (arr!17882 lt!276595) #b00000000000000000000000000000000)))))

(declare-fun b!606182 () Bool)

(assert (=> b!606182 (= e!347027 call!33074)))

(declare-fun b!606183 () Bool)

(assert (=> b!606183 (= e!347028 e!347027)))

(assert (=> b!606183 (= c!68732 (validKeyInArray!0 (select (arr!17882 lt!276595) #b00000000000000000000000000000000)))))

(assert (= (and d!87799 (not res!389451)) b!606179))

(assert (= (and b!606179 res!389450) b!606181))

(assert (= (and b!606179 res!389449) b!606183))

(assert (= (and b!606183 c!68732) b!606182))

(assert (= (and b!606183 (not c!68732)) b!606180))

(assert (= (or b!606182 b!606180) bm!33071))

(declare-fun m!583003 () Bool)

(assert (=> bm!33071 m!583003))

(declare-fun m!583005 () Bool)

(assert (=> bm!33071 m!583005))

(assert (=> b!606179 m!583003))

(assert (=> b!606179 m!583003))

(declare-fun m!583009 () Bool)

(assert (=> b!606179 m!583009))

(assert (=> b!606181 m!583003))

(assert (=> b!606181 m!583003))

(declare-fun m!583013 () Bool)

(assert (=> b!606181 m!583013))

(assert (=> b!606183 m!583003))

(assert (=> b!606183 m!583003))

(assert (=> b!606183 m!583009))

(assert (=> b!606033 d!87799))

(declare-fun call!33076 () Bool)

(declare-fun bm!33073 () Bool)

(declare-fun c!68734 () Bool)

(assert (=> bm!33073 (= call!33076 (arrayNoDuplicates!0 lt!276595 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68734 (Cons!11919 (select (arr!17882 lt!276595) j!136) Nil!11920) Nil!11920)))))

(declare-fun b!606189 () Bool)

(declare-fun e!347034 () Bool)

(declare-fun e!347036 () Bool)

(assert (=> b!606189 (= e!347034 e!347036)))

(declare-fun res!389455 () Bool)

(assert (=> b!606189 (=> (not res!389455) (not e!347036))))

(declare-fun e!347037 () Bool)

(assert (=> b!606189 (= res!389455 (not e!347037))))

(declare-fun res!389456 () Bool)

(assert (=> b!606189 (=> (not res!389456) (not e!347037))))

(assert (=> b!606189 (= res!389456 (validKeyInArray!0 (select (arr!17882 lt!276595) j!136)))))

(declare-fun d!87803 () Bool)

(declare-fun res!389457 () Bool)

(assert (=> d!87803 (=> res!389457 e!347034)))

(assert (=> d!87803 (= res!389457 (bvsge j!136 (size!18246 lt!276595)))))

(assert (=> d!87803 (= (arrayNoDuplicates!0 lt!276595 j!136 Nil!11920) e!347034)))

(declare-fun b!606190 () Bool)

(declare-fun e!347035 () Bool)

(assert (=> b!606190 (= e!347035 call!33076)))

(declare-fun b!606191 () Bool)

(assert (=> b!606191 (= e!347037 (contains!2999 Nil!11920 (select (arr!17882 lt!276595) j!136)))))

(declare-fun b!606192 () Bool)

(assert (=> b!606192 (= e!347035 call!33076)))

(declare-fun b!606193 () Bool)

(assert (=> b!606193 (= e!347036 e!347035)))

(assert (=> b!606193 (= c!68734 (validKeyInArray!0 (select (arr!17882 lt!276595) j!136)))))

(assert (= (and d!87803 (not res!389457)) b!606189))

(assert (= (and b!606189 res!389456) b!606191))

(assert (= (and b!606189 res!389455) b!606193))

(assert (= (and b!606193 c!68734) b!606192))

(assert (= (and b!606193 (not c!68734)) b!606190))

(assert (= (or b!606192 b!606190) bm!33073))

(assert (=> bm!33073 m!582983))

(declare-fun m!583023 () Bool)

(assert (=> bm!33073 m!583023))

(assert (=> b!606189 m!582983))

(assert (=> b!606189 m!582983))

(declare-fun m!583025 () Bool)

(assert (=> b!606189 m!583025))

(assert (=> b!606191 m!582983))

(assert (=> b!606191 m!582983))

(declare-fun m!583027 () Bool)

(assert (=> b!606191 m!583027))

(assert (=> b!606193 m!582983))

(assert (=> b!606193 m!582983))

(assert (=> b!606193 m!583025))

(assert (=> b!606033 d!87803))

(declare-fun d!87809 () Bool)

(declare-fun res!389460 () Bool)

(declare-fun e!347043 () Bool)

(assert (=> d!87809 (=> res!389460 e!347043)))

(assert (=> d!87809 (= res!389460 (= (select (arr!17882 lt!276595) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17882 a!2986) j!136)))))

(assert (=> d!87809 (= (arrayContainsKey!0 lt!276595 (select (arr!17882 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!347043)))

(declare-fun b!606202 () Bool)

(declare-fun e!347044 () Bool)

(assert (=> b!606202 (= e!347043 e!347044)))

(declare-fun res!389461 () Bool)

(assert (=> b!606202 (=> (not res!389461) (not e!347044))))

(assert (=> b!606202 (= res!389461 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18246 lt!276595)))))

(declare-fun b!606203 () Bool)

(assert (=> b!606203 (= e!347044 (arrayContainsKey!0 lt!276595 (select (arr!17882 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87809 (not res!389460)) b!606202))

(assert (= (and b!606202 res!389461) b!606203))

(declare-fun m!583029 () Bool)

(assert (=> d!87809 m!583029))

(assert (=> b!606203 m!582845))

(declare-fun m!583031 () Bool)

(assert (=> b!606203 m!583031))

(assert (=> b!606033 d!87809))

(declare-fun d!87811 () Bool)

(declare-fun e!347049 () Bool)

(assert (=> d!87811 e!347049))

(declare-fun res!389466 () Bool)

(assert (=> d!87811 (=> (not res!389466) (not e!347049))))

(assert (=> d!87811 (= res!389466 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18246 a!2986))))))

(declare-fun lt!276650 () Unit!19312)

(declare-fun choose!41 (array!37257 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11923) Unit!19312)

(assert (=> d!87811 (= lt!276650 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11920))))

(assert (=> d!87811 (bvslt (size!18246 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87811 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11920) lt!276650)))

(declare-fun b!606208 () Bool)

(assert (=> b!606208 (= e!347049 (arrayNoDuplicates!0 (array!37258 (store (arr!17882 a!2986) i!1108 k!1786) (size!18246 a!2986)) #b00000000000000000000000000000000 Nil!11920))))

(assert (= (and d!87811 res!389466) b!606208))

(declare-fun m!583049 () Bool)

(assert (=> d!87811 m!583049))

(assert (=> b!606208 m!582847))

(declare-fun m!583051 () Bool)

(assert (=> b!606208 m!583051))

(assert (=> b!606033 d!87811))

(declare-fun e!347079 () SeekEntryResult!6322)

(declare-fun b!606255 () Bool)

(assert (=> b!606255 (= e!347079 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17882 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!606256 () Bool)

(declare-fun e!347081 () SeekEntryResult!6322)

(assert (=> b!606256 (= e!347081 (Found!6322 index!984))))

(declare-fun b!606257 () Bool)

(declare-fun c!68756 () Bool)

(declare-fun lt!276678 () (_ BitVec 64))

(assert (=> b!606257 (= c!68756 (= lt!276678 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!606257 (= e!347081 e!347079)))

(declare-fun b!606258 () Bool)

(assert (=> b!606258 (= e!347079 (MissingVacant!6322 vacantSpotIndex!68))))

(declare-fun b!606259 () Bool)

(declare-fun e!347080 () SeekEntryResult!6322)

(assert (=> b!606259 (= e!347080 Undefined!6322)))

(declare-fun b!606260 () Bool)

(assert (=> b!606260 (= e!347080 e!347081)))

(declare-fun c!68757 () Bool)

(assert (=> b!606260 (= c!68757 (= lt!276678 (select (arr!17882 a!2986) j!136)))))

(declare-fun d!87823 () Bool)

(declare-fun lt!276677 () SeekEntryResult!6322)

(assert (=> d!87823 (and (or (is-Undefined!6322 lt!276677) (not (is-Found!6322 lt!276677)) (and (bvsge (index!27558 lt!276677) #b00000000000000000000000000000000) (bvslt (index!27558 lt!276677) (size!18246 a!2986)))) (or (is-Undefined!6322 lt!276677) (is-Found!6322 lt!276677) (not (is-MissingVacant!6322 lt!276677)) (not (= (index!27560 lt!276677) vacantSpotIndex!68)) (and (bvsge (index!27560 lt!276677) #b00000000000000000000000000000000) (bvslt (index!27560 lt!276677) (size!18246 a!2986)))) (or (is-Undefined!6322 lt!276677) (ite (is-Found!6322 lt!276677) (= (select (arr!17882 a!2986) (index!27558 lt!276677)) (select (arr!17882 a!2986) j!136)) (and (is-MissingVacant!6322 lt!276677) (= (index!27560 lt!276677) vacantSpotIndex!68) (= (select (arr!17882 a!2986) (index!27560 lt!276677)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87823 (= lt!276677 e!347080)))

(declare-fun c!68755 () Bool)

(assert (=> d!87823 (= c!68755 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87823 (= lt!276678 (select (arr!17882 a!2986) index!984))))

(assert (=> d!87823 (validMask!0 mask!3053)))

(assert (=> d!87823 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17882 a!2986) j!136) a!2986 mask!3053) lt!276677)))

(assert (= (and d!87823 c!68755) b!606259))

(assert (= (and d!87823 (not c!68755)) b!606260))

(assert (= (and b!606260 c!68757) b!606256))

(assert (= (and b!606260 (not c!68757)) b!606257))

(assert (= (and b!606257 c!68756) b!606258))

(assert (= (and b!606257 (not c!68756)) b!606255))

(assert (=> b!606255 m!582863))

(assert (=> b!606255 m!582863))

(assert (=> b!606255 m!582845))

(declare-fun m!583107 () Bool)

(assert (=> b!606255 m!583107))

(declare-fun m!583109 () Bool)

(assert (=> d!87823 m!583109))

(declare-fun m!583111 () Bool)

(assert (=> d!87823 m!583111))

(assert (=> d!87823 m!582903))

(assert (=> d!87823 m!582859))

(assert (=> b!606035 d!87823))

(declare-fun d!87847 () Bool)

(declare-fun res!389479 () Bool)

(declare-fun e!347082 () Bool)

(assert (=> d!87847 (=> res!389479 e!347082)))

(assert (=> d!87847 (= res!389479 (= (select (arr!17882 lt!276595) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17882 a!2986) j!136)))))

(assert (=> d!87847 (= (arrayContainsKey!0 lt!276595 (select (arr!17882 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!347082)))

(declare-fun b!606261 () Bool)

(declare-fun e!347083 () Bool)

(assert (=> b!606261 (= e!347082 e!347083)))

(declare-fun res!389480 () Bool)

(assert (=> b!606261 (=> (not res!389480) (not e!347083))))

(assert (=> b!606261 (= res!389480 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18246 lt!276595)))))

(declare-fun b!606262 () Bool)

(assert (=> b!606262 (= e!347083 (arrayContainsKey!0 lt!276595 (select (arr!17882 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87847 (not res!389479)) b!606261))

(assert (= (and b!606261 res!389480) b!606262))

(declare-fun m!583113 () Bool)

(assert (=> d!87847 m!583113))

(assert (=> b!606262 m!582845))

(declare-fun m!583115 () Bool)

(assert (=> b!606262 m!583115))

(assert (=> b!606038 d!87847))

(declare-fun d!87849 () Bool)

(assert (=> d!87849 (arrayContainsKey!0 lt!276595 (select (arr!17882 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276679 () Unit!19312)

(assert (=> d!87849 (= lt!276679 (choose!114 lt!276595 (select (arr!17882 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!87849 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!87849 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276595 (select (arr!17882 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!276679)))

(declare-fun bs!18550 () Bool)

(assert (= bs!18550 d!87849))

(assert (=> bs!18550 m!582845))

(assert (=> bs!18550 m!582853))

(assert (=> bs!18550 m!582845))

(declare-fun m!583117 () Bool)

(assert (=> bs!18550 m!583117))

(assert (=> b!606038 d!87849))

(declare-fun d!87851 () Bool)

(declare-fun res!389481 () Bool)

(declare-fun e!347084 () Bool)

(assert (=> d!87851 (=> res!389481 e!347084)))

(assert (=> d!87851 (= res!389481 (= (select (arr!17882 lt!276595) j!136) (select (arr!17882 a!2986) j!136)))))

(assert (=> d!87851 (= (arrayContainsKey!0 lt!276595 (select (arr!17882 a!2986) j!136) j!136) e!347084)))

(declare-fun b!606263 () Bool)

(declare-fun e!347085 () Bool)

(assert (=> b!606263 (= e!347084 e!347085)))

(declare-fun res!389482 () Bool)

(assert (=> b!606263 (=> (not res!389482) (not e!347085))))

(assert (=> b!606263 (= res!389482 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18246 lt!276595)))))

(declare-fun b!606264 () Bool)

