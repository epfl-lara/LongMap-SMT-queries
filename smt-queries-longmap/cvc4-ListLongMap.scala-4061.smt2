; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55598 () Bool)

(assert start!55598)

(declare-fun b!609402 () Bool)

(declare-fun e!349021 () Bool)

(declare-fun e!349028 () Bool)

(assert (=> b!609402 (= e!349021 e!349028)))

(declare-fun res!391930 () Bool)

(assert (=> b!609402 (=> (not res!391930) (not e!349028))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37329 0))(
  ( (array!37330 (arr!17915 (Array (_ BitVec 32) (_ BitVec 64))) (size!18279 (_ BitVec 32))) )
))
(declare-fun lt!278575 () array!37329)

(declare-fun a!2986 () array!37329)

(declare-fun arrayContainsKey!0 (array!37329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!609402 (= res!391930 (arrayContainsKey!0 lt!278575 (select (arr!17915 a!2986) j!136) j!136))))

(declare-fun b!609403 () Bool)

(declare-fun res!391941 () Bool)

(declare-fun e!349018 () Bool)

(assert (=> b!609403 (=> res!391941 e!349018)))

(declare-datatypes ((List!11956 0))(
  ( (Nil!11953) (Cons!11952 (h!12997 (_ BitVec 64)) (t!18184 List!11956)) )
))
(declare-fun contains!3032 (List!11956 (_ BitVec 64)) Bool)

(assert (=> b!609403 (= res!391941 (contains!3032 Nil!11953 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!609404 () Bool)

(declare-fun res!391939 () Bool)

(assert (=> b!609404 (=> res!391939 e!349018)))

(declare-fun noDuplicate!338 (List!11956) Bool)

(assert (=> b!609404 (= res!391939 (not (noDuplicate!338 Nil!11953)))))

(declare-fun b!609405 () Bool)

(declare-fun res!391946 () Bool)

(declare-fun e!349015 () Bool)

(assert (=> b!609405 (=> (not res!391946) (not e!349015))))

(declare-fun arrayNoDuplicates!0 (array!37329 (_ BitVec 32) List!11956) Bool)

(assert (=> b!609405 (= res!391946 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11953))))

(declare-fun b!609406 () Bool)

(declare-datatypes ((Unit!19510 0))(
  ( (Unit!19511) )
))
(declare-fun e!349029 () Unit!19510)

(declare-fun Unit!19512 () Unit!19510)

(assert (=> b!609406 (= e!349029 Unit!19512)))

(assert (=> b!609406 false))

(declare-fun b!609407 () Bool)

(declare-fun e!349014 () Unit!19510)

(declare-fun Unit!19513 () Unit!19510)

(assert (=> b!609407 (= e!349014 Unit!19513)))

(declare-fun b!609408 () Bool)

(declare-fun res!391937 () Bool)

(declare-fun e!349026 () Bool)

(assert (=> b!609408 (=> (not res!391937) (not e!349026))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!609408 (= res!391937 (validKeyInArray!0 (select (arr!17915 a!2986) j!136)))))

(declare-fun b!609409 () Bool)

(assert (=> b!609409 (= e!349018 true)))

(declare-fun lt!278570 () Bool)

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!609409 (= lt!278570 (contains!3032 Nil!11953 k!1786))))

(declare-fun b!609410 () Bool)

(declare-fun e!349022 () Bool)

(declare-datatypes ((SeekEntryResult!6355 0))(
  ( (MissingZero!6355 (index!27695 (_ BitVec 32))) (Found!6355 (index!27696 (_ BitVec 32))) (Intermediate!6355 (undefined!7167 Bool) (index!27697 (_ BitVec 32)) (x!56496 (_ BitVec 32))) (Undefined!6355) (MissingVacant!6355 (index!27698 (_ BitVec 32))) )
))
(declare-fun lt!278567 () SeekEntryResult!6355)

(declare-fun lt!278573 () SeekEntryResult!6355)

(assert (=> b!609410 (= e!349022 (= lt!278567 lt!278573))))

(declare-fun b!609412 () Bool)

(declare-fun e!349024 () Bool)

(declare-fun e!349027 () Bool)

(assert (=> b!609412 (= e!349024 e!349027)))

(declare-fun res!391944 () Bool)

(assert (=> b!609412 (=> res!391944 e!349027)))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!609412 (= res!391944 (bvsge index!984 j!136))))

(declare-fun lt!278572 () Unit!19510)

(assert (=> b!609412 (= lt!278572 e!349014)))

(declare-fun c!69103 () Bool)

(assert (=> b!609412 (= c!69103 (bvslt j!136 index!984))))

(declare-fun b!609413 () Bool)

(declare-fun e!349025 () Bool)

(assert (=> b!609413 (= e!349015 e!349025)))

(declare-fun res!391945 () Bool)

(assert (=> b!609413 (=> (not res!391945) (not e!349025))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!609413 (= res!391945 (= (select (store (arr!17915 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!609413 (= lt!278575 (array!37330 (store (arr!17915 a!2986) i!1108 k!1786) (size!18279 a!2986)))))

(declare-fun b!609414 () Bool)

(declare-fun res!391932 () Bool)

(assert (=> b!609414 (=> (not res!391932) (not e!349026))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!609414 (= res!391932 (and (= (size!18279 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18279 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18279 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!609415 () Bool)

(assert (=> b!609415 (= e!349027 e!349018)))

(declare-fun res!391935 () Bool)

(assert (=> b!609415 (=> res!391935 e!349018)))

(assert (=> b!609415 (= res!391935 (or (bvsge (size!18279 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18279 a!2986))))))

(assert (=> b!609415 (arrayContainsKey!0 lt!278575 (select (arr!17915 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278564 () Unit!19510)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37329 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19510)

(assert (=> b!609415 (= lt!278564 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278575 (select (arr!17915 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!349023 () Bool)

(assert (=> b!609415 e!349023))

(declare-fun res!391947 () Bool)

(assert (=> b!609415 (=> (not res!391947) (not e!349023))))

(assert (=> b!609415 (= res!391947 (arrayContainsKey!0 lt!278575 (select (arr!17915 a!2986) j!136) j!136))))

(declare-fun b!609416 () Bool)

(declare-fun res!391950 () Bool)

(assert (=> b!609416 (=> (not res!391950) (not e!349015))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37329 (_ BitVec 32)) Bool)

(assert (=> b!609416 (= res!391950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!609417 () Bool)

(declare-fun e!349019 () Bool)

(assert (=> b!609417 (= e!349019 e!349021)))

(declare-fun res!391942 () Bool)

(assert (=> b!609417 (=> res!391942 e!349021)))

(declare-fun lt!278565 () (_ BitVec 64))

(declare-fun lt!278560 () (_ BitVec 64))

(assert (=> b!609417 (= res!391942 (or (not (= (select (arr!17915 a!2986) j!136) lt!278565)) (not (= (select (arr!17915 a!2986) j!136) lt!278560)) (bvsge j!136 index!984)))))

(declare-fun b!609418 () Bool)

(declare-fun e!349020 () Bool)

(assert (=> b!609418 (= e!349025 e!349020)))

(declare-fun res!391943 () Bool)

(assert (=> b!609418 (=> (not res!391943) (not e!349020))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!609418 (= res!391943 (and (= lt!278567 (Found!6355 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17915 a!2986) index!984) (select (arr!17915 a!2986) j!136))) (not (= (select (arr!17915 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37329 (_ BitVec 32)) SeekEntryResult!6355)

(assert (=> b!609418 (= lt!278567 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17915 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!609419 () Bool)

(declare-fun res!391934 () Bool)

(assert (=> b!609419 (=> res!391934 e!349018)))

(assert (=> b!609419 (= res!391934 (contains!3032 Nil!11953 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!609420 () Bool)

(declare-fun res!391940 () Bool)

(assert (=> b!609420 (=> (not res!391940) (not e!349015))))

(assert (=> b!609420 (= res!391940 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17915 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!609421 () Bool)

(assert (=> b!609421 (= e!349028 (arrayContainsKey!0 lt!278575 (select (arr!17915 a!2986) j!136) index!984))))

(declare-fun b!609422 () Bool)

(declare-fun Unit!19514 () Unit!19510)

(assert (=> b!609422 (= e!349029 Unit!19514)))

(declare-fun b!609423 () Bool)

(declare-fun res!391933 () Bool)

(assert (=> b!609423 (=> (not res!391933) (not e!349026))))

(assert (=> b!609423 (= res!391933 (validKeyInArray!0 k!1786))))

(declare-fun b!609411 () Bool)

(assert (=> b!609411 (= e!349026 e!349015)))

(declare-fun res!391938 () Bool)

(assert (=> b!609411 (=> (not res!391938) (not e!349015))))

(declare-fun lt!278568 () SeekEntryResult!6355)

(assert (=> b!609411 (= res!391938 (or (= lt!278568 (MissingZero!6355 i!1108)) (= lt!278568 (MissingVacant!6355 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37329 (_ BitVec 32)) SeekEntryResult!6355)

(assert (=> b!609411 (= lt!278568 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!391951 () Bool)

(assert (=> start!55598 (=> (not res!391951) (not e!349026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55598 (= res!391951 (validMask!0 mask!3053))))

(assert (=> start!55598 e!349026))

(assert (=> start!55598 true))

(declare-fun array_inv!13711 (array!37329) Bool)

(assert (=> start!55598 (array_inv!13711 a!2986)))

(declare-fun b!609424 () Bool)

(declare-fun Unit!19515 () Unit!19510)

(assert (=> b!609424 (= e!349014 Unit!19515)))

(declare-fun lt!278563 () Unit!19510)

(assert (=> b!609424 (= lt!278563 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278575 (select (arr!17915 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!609424 (arrayContainsKey!0 lt!278575 (select (arr!17915 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278561 () Unit!19510)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37329 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11956) Unit!19510)

(assert (=> b!609424 (= lt!278561 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11953))))

(assert (=> b!609424 (arrayNoDuplicates!0 lt!278575 #b00000000000000000000000000000000 Nil!11953)))

(declare-fun lt!278574 () Unit!19510)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37329 (_ BitVec 32) (_ BitVec 32)) Unit!19510)

(assert (=> b!609424 (= lt!278574 (lemmaNoDuplicateFromThenFromBigger!0 lt!278575 #b00000000000000000000000000000000 j!136))))

(assert (=> b!609424 (arrayNoDuplicates!0 lt!278575 j!136 Nil!11953)))

(declare-fun lt!278559 () Unit!19510)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37329 (_ BitVec 64) (_ BitVec 32) List!11956) Unit!19510)

(assert (=> b!609424 (= lt!278559 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278575 (select (arr!17915 a!2986) j!136) j!136 Nil!11953))))

(assert (=> b!609424 false))

(declare-fun b!609425 () Bool)

(declare-fun e!349017 () Bool)

(assert (=> b!609425 (= e!349020 (not e!349017))))

(declare-fun res!391949 () Bool)

(assert (=> b!609425 (=> res!391949 e!349017)))

(declare-fun lt!278571 () SeekEntryResult!6355)

(assert (=> b!609425 (= res!391949 (not (= lt!278571 (Found!6355 index!984))))))

(declare-fun lt!278566 () Unit!19510)

(assert (=> b!609425 (= lt!278566 e!349029)))

(declare-fun c!69104 () Bool)

(assert (=> b!609425 (= c!69104 (= lt!278571 Undefined!6355))))

(assert (=> b!609425 (= lt!278571 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278565 lt!278575 mask!3053))))

(assert (=> b!609425 e!349022))

(declare-fun res!391931 () Bool)

(assert (=> b!609425 (=> (not res!391931) (not e!349022))))

(declare-fun lt!278569 () (_ BitVec 32))

(assert (=> b!609425 (= res!391931 (= lt!278573 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278569 vacantSpotIndex!68 lt!278565 lt!278575 mask!3053)))))

(assert (=> b!609425 (= lt!278573 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278569 vacantSpotIndex!68 (select (arr!17915 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!609425 (= lt!278565 (select (store (arr!17915 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!278562 () Unit!19510)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37329 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19510)

(assert (=> b!609425 (= lt!278562 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278569 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!609425 (= lt!278569 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!609426 () Bool)

(assert (=> b!609426 (= e!349017 e!349024)))

(declare-fun res!391936 () Bool)

(assert (=> b!609426 (=> res!391936 e!349024)))

(assert (=> b!609426 (= res!391936 (or (not (= (select (arr!17915 a!2986) j!136) lt!278565)) (not (= (select (arr!17915 a!2986) j!136) lt!278560))))))

(assert (=> b!609426 e!349019))

(declare-fun res!391952 () Bool)

(assert (=> b!609426 (=> (not res!391952) (not e!349019))))

(assert (=> b!609426 (= res!391952 (= lt!278560 (select (arr!17915 a!2986) j!136)))))

(assert (=> b!609426 (= lt!278560 (select (store (arr!17915 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!609427 () Bool)

(declare-fun res!391948 () Bool)

(assert (=> b!609427 (=> (not res!391948) (not e!349026))))

(assert (=> b!609427 (= res!391948 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!609428 () Bool)

(assert (=> b!609428 (= e!349023 (arrayContainsKey!0 lt!278575 (select (arr!17915 a!2986) j!136) index!984))))

(assert (= (and start!55598 res!391951) b!609414))

(assert (= (and b!609414 res!391932) b!609408))

(assert (= (and b!609408 res!391937) b!609423))

(assert (= (and b!609423 res!391933) b!609427))

(assert (= (and b!609427 res!391948) b!609411))

(assert (= (and b!609411 res!391938) b!609416))

(assert (= (and b!609416 res!391950) b!609405))

(assert (= (and b!609405 res!391946) b!609420))

(assert (= (and b!609420 res!391940) b!609413))

(assert (= (and b!609413 res!391945) b!609418))

(assert (= (and b!609418 res!391943) b!609425))

(assert (= (and b!609425 res!391931) b!609410))

(assert (= (and b!609425 c!69104) b!609406))

(assert (= (and b!609425 (not c!69104)) b!609422))

(assert (= (and b!609425 (not res!391949)) b!609426))

(assert (= (and b!609426 res!391952) b!609417))

(assert (= (and b!609417 (not res!391942)) b!609402))

(assert (= (and b!609402 res!391930) b!609421))

(assert (= (and b!609426 (not res!391936)) b!609412))

(assert (= (and b!609412 c!69103) b!609424))

(assert (= (and b!609412 (not c!69103)) b!609407))

(assert (= (and b!609412 (not res!391944)) b!609415))

(assert (= (and b!609415 res!391947) b!609428))

(assert (= (and b!609415 (not res!391935)) b!609404))

(assert (= (and b!609404 (not res!391939)) b!609403))

(assert (= (and b!609403 (not res!391941)) b!609419))

(assert (= (and b!609419 (not res!391934)) b!609409))

(declare-fun m!585923 () Bool)

(assert (=> b!609423 m!585923))

(declare-fun m!585925 () Bool)

(assert (=> b!609404 m!585925))

(declare-fun m!585927 () Bool)

(assert (=> b!609426 m!585927))

(declare-fun m!585929 () Bool)

(assert (=> b!609426 m!585929))

(declare-fun m!585931 () Bool)

(assert (=> b!609426 m!585931))

(assert (=> b!609408 m!585927))

(assert (=> b!609408 m!585927))

(declare-fun m!585933 () Bool)

(assert (=> b!609408 m!585933))

(assert (=> b!609402 m!585927))

(assert (=> b!609402 m!585927))

(declare-fun m!585935 () Bool)

(assert (=> b!609402 m!585935))

(declare-fun m!585937 () Bool)

(assert (=> b!609418 m!585937))

(assert (=> b!609418 m!585927))

(assert (=> b!609418 m!585927))

(declare-fun m!585939 () Bool)

(assert (=> b!609418 m!585939))

(assert (=> b!609413 m!585929))

(declare-fun m!585941 () Bool)

(assert (=> b!609413 m!585941))

(declare-fun m!585943 () Bool)

(assert (=> b!609416 m!585943))

(declare-fun m!585945 () Bool)

(assert (=> b!609409 m!585945))

(assert (=> b!609417 m!585927))

(declare-fun m!585947 () Bool)

(assert (=> start!55598 m!585947))

(declare-fun m!585949 () Bool)

(assert (=> start!55598 m!585949))

(declare-fun m!585951 () Bool)

(assert (=> b!609425 m!585951))

(declare-fun m!585953 () Bool)

(assert (=> b!609425 m!585953))

(assert (=> b!609425 m!585927))

(assert (=> b!609425 m!585929))

(declare-fun m!585955 () Bool)

(assert (=> b!609425 m!585955))

(declare-fun m!585957 () Bool)

(assert (=> b!609425 m!585957))

(assert (=> b!609425 m!585927))

(declare-fun m!585959 () Bool)

(assert (=> b!609425 m!585959))

(declare-fun m!585961 () Bool)

(assert (=> b!609425 m!585961))

(declare-fun m!585963 () Bool)

(assert (=> b!609419 m!585963))

(declare-fun m!585965 () Bool)

(assert (=> b!609411 m!585965))

(assert (=> b!609421 m!585927))

(assert (=> b!609421 m!585927))

(declare-fun m!585967 () Bool)

(assert (=> b!609421 m!585967))

(declare-fun m!585969 () Bool)

(assert (=> b!609427 m!585969))

(assert (=> b!609415 m!585927))

(assert (=> b!609415 m!585927))

(declare-fun m!585971 () Bool)

(assert (=> b!609415 m!585971))

(assert (=> b!609415 m!585927))

(declare-fun m!585973 () Bool)

(assert (=> b!609415 m!585973))

(assert (=> b!609415 m!585927))

(assert (=> b!609415 m!585935))

(assert (=> b!609424 m!585927))

(declare-fun m!585975 () Bool)

(assert (=> b!609424 m!585975))

(declare-fun m!585977 () Bool)

(assert (=> b!609424 m!585977))

(assert (=> b!609424 m!585927))

(declare-fun m!585979 () Bool)

(assert (=> b!609424 m!585979))

(declare-fun m!585981 () Bool)

(assert (=> b!609424 m!585981))

(assert (=> b!609424 m!585927))

(declare-fun m!585983 () Bool)

(assert (=> b!609424 m!585983))

(assert (=> b!609424 m!585927))

(declare-fun m!585985 () Bool)

(assert (=> b!609424 m!585985))

(declare-fun m!585987 () Bool)

(assert (=> b!609424 m!585987))

(declare-fun m!585989 () Bool)

(assert (=> b!609403 m!585989))

(assert (=> b!609428 m!585927))

(assert (=> b!609428 m!585927))

(assert (=> b!609428 m!585967))

(declare-fun m!585991 () Bool)

(assert (=> b!609420 m!585991))

(declare-fun m!585993 () Bool)

(assert (=> b!609405 m!585993))

(push 1)

