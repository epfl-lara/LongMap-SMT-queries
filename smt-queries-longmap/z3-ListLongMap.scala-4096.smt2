; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56058 () Bool)

(assert start!56058)

(declare-fun e!354282 () Bool)

(declare-datatypes ((array!37542 0))(
  ( (array!37543 (arr!18017 (Array (_ BitVec 32) (_ BitVec 64))) (size!18382 (_ BitVec 32))) )
))
(declare-fun lt!284623 () array!37542)

(declare-fun b!617827 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37542)

(declare-fun arrayContainsKey!0 (array!37542 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!617827 (= e!354282 (arrayContainsKey!0 lt!284623 (select (arr!18017 a!2986) j!136) index!984))))

(declare-fun b!617828 () Bool)

(declare-fun res!398084 () Bool)

(declare-fun e!354283 () Bool)

(assert (=> b!617828 (=> (not res!398084) (not e!354283))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!617828 (= res!398084 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18017 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!617829 () Bool)

(declare-fun e!354287 () Bool)

(assert (=> b!617829 (= e!354287 true)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!617829 (= (select (store (arr!18017 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!617830 () Bool)

(declare-fun res!398097 () Bool)

(assert (=> b!617830 (= res!398097 (bvsge j!136 index!984))))

(declare-fun e!354276 () Bool)

(assert (=> b!617830 (=> res!398097 e!354276)))

(declare-fun e!354286 () Bool)

(assert (=> b!617830 (= e!354286 e!354276)))

(declare-fun b!617831 () Bool)

(declare-fun res!398088 () Bool)

(assert (=> b!617831 (=> (not res!398088) (not e!354283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37542 (_ BitVec 32)) Bool)

(assert (=> b!617831 (= res!398088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun e!354288 () Bool)

(declare-fun b!617832 () Bool)

(assert (=> b!617832 (= e!354288 (arrayContainsKey!0 lt!284623 (select (arr!18017 a!2986) j!136) index!984))))

(declare-fun b!617833 () Bool)

(declare-fun res!398089 () Bool)

(declare-fun e!354279 () Bool)

(assert (=> b!617833 (=> (not res!398089) (not e!354279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!617833 (= res!398089 (validKeyInArray!0 (select (arr!18017 a!2986) j!136)))))

(declare-fun b!617834 () Bool)

(declare-fun e!354274 () Bool)

(declare-fun e!354285 () Bool)

(assert (=> b!617834 (= e!354274 e!354285)))

(declare-fun res!398086 () Bool)

(assert (=> b!617834 (=> (not res!398086) (not e!354285))))

(declare-datatypes ((SeekEntryResult!6454 0))(
  ( (MissingZero!6454 (index!28100 (_ BitVec 32))) (Found!6454 (index!28101 (_ BitVec 32))) (Intermediate!6454 (undefined!7266 Bool) (index!28102 (_ BitVec 32)) (x!56897 (_ BitVec 32))) (Undefined!6454) (MissingVacant!6454 (index!28103 (_ BitVec 32))) )
))
(declare-fun lt!284604 () SeekEntryResult!6454)

(assert (=> b!617834 (= res!398086 (and (= lt!284604 (Found!6454 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18017 a!2986) index!984) (select (arr!18017 a!2986) j!136))) (not (= (select (arr!18017 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37542 (_ BitVec 32)) SeekEntryResult!6454)

(assert (=> b!617834 (= lt!284604 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18017 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!617835 () Bool)

(assert (=> b!617835 (= e!354283 e!354274)))

(declare-fun res!398095 () Bool)

(assert (=> b!617835 (=> (not res!398095) (not e!354274))))

(assert (=> b!617835 (= res!398095 (= (select (store (arr!18017 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!617835 (= lt!284623 (array!37543 (store (arr!18017 a!2986) i!1108 k0!1786) (size!18382 a!2986)))))

(declare-fun b!617836 () Bool)

(declare-datatypes ((Unit!20286 0))(
  ( (Unit!20287) )
))
(declare-fun e!354284 () Unit!20286)

(declare-fun Unit!20288 () Unit!20286)

(assert (=> b!617836 (= e!354284 Unit!20288)))

(declare-fun res!398091 () Bool)

(assert (=> b!617836 (= res!398091 (= (select (store (arr!18017 a!2986) i!1108 k0!1786) index!984) (select (arr!18017 a!2986) j!136)))))

(assert (=> b!617836 (=> (not res!398091) (not e!354286))))

(assert (=> b!617836 e!354286))

(declare-fun c!70239 () Bool)

(assert (=> b!617836 (= c!70239 (bvslt j!136 index!984))))

(declare-fun lt!284611 () Unit!20286)

(declare-fun e!354280 () Unit!20286)

(assert (=> b!617836 (= lt!284611 e!354280)))

(declare-fun c!70240 () Bool)

(assert (=> b!617836 (= c!70240 (bvslt index!984 j!136))))

(declare-fun lt!284606 () Unit!20286)

(declare-fun e!354275 () Unit!20286)

(assert (=> b!617836 (= lt!284606 e!354275)))

(assert (=> b!617836 false))

(declare-fun res!398083 () Bool)

(assert (=> start!56058 (=> (not res!398083) (not e!354279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56058 (= res!398083 (validMask!0 mask!3053))))

(assert (=> start!56058 e!354279))

(assert (=> start!56058 true))

(declare-fun array_inv!13900 (array!37542) Bool)

(assert (=> start!56058 (array_inv!13900 a!2986)))

(declare-fun b!617837 () Bool)

(assert (=> b!617837 (= e!354285 (not e!354287))))

(declare-fun res!398093 () Bool)

(assert (=> b!617837 (=> res!398093 e!354287)))

(declare-fun lt!284612 () SeekEntryResult!6454)

(assert (=> b!617837 (= res!398093 (not (= lt!284612 (MissingVacant!6454 vacantSpotIndex!68))))))

(declare-fun lt!284608 () Unit!20286)

(assert (=> b!617837 (= lt!284608 e!354284)))

(declare-fun c!70241 () Bool)

(assert (=> b!617837 (= c!70241 (= lt!284612 (Found!6454 index!984)))))

(declare-fun lt!284613 () Unit!20286)

(declare-fun e!354278 () Unit!20286)

(assert (=> b!617837 (= lt!284613 e!354278)))

(declare-fun c!70242 () Bool)

(assert (=> b!617837 (= c!70242 (= lt!284612 Undefined!6454))))

(declare-fun lt!284619 () (_ BitVec 64))

(assert (=> b!617837 (= lt!284612 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284619 lt!284623 mask!3053))))

(declare-fun e!354277 () Bool)

(assert (=> b!617837 e!354277))

(declare-fun res!398096 () Bool)

(assert (=> b!617837 (=> (not res!398096) (not e!354277))))

(declare-fun lt!284621 () SeekEntryResult!6454)

(declare-fun lt!284615 () (_ BitVec 32))

(assert (=> b!617837 (= res!398096 (= lt!284621 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284615 vacantSpotIndex!68 lt!284619 lt!284623 mask!3053)))))

(assert (=> b!617837 (= lt!284621 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284615 vacantSpotIndex!68 (select (arr!18017 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!617837 (= lt!284619 (select (store (arr!18017 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!284607 () Unit!20286)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37542 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20286)

(assert (=> b!617837 (= lt!284607 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284615 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!617837 (= lt!284615 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!617838 () Bool)

(declare-fun Unit!20289 () Unit!20286)

(assert (=> b!617838 (= e!354278 Unit!20289)))

(assert (=> b!617838 false))

(declare-fun b!617839 () Bool)

(declare-fun res!398092 () Bool)

(assert (=> b!617839 (=> (not res!398092) (not e!354279))))

(assert (=> b!617839 (= res!398092 (and (= (size!18382 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18382 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18382 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!617840 () Bool)

(declare-fun res!398090 () Bool)

(assert (=> b!617840 (=> (not res!398090) (not e!354283))))

(declare-datatypes ((List!12097 0))(
  ( (Nil!12094) (Cons!12093 (h!13138 (_ BitVec 64)) (t!18316 List!12097)) )
))
(declare-fun arrayNoDuplicates!0 (array!37542 (_ BitVec 32) List!12097) Bool)

(assert (=> b!617840 (= res!398090 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12094))))

(declare-fun b!617841 () Bool)

(declare-fun Unit!20290 () Unit!20286)

(assert (=> b!617841 (= e!354278 Unit!20290)))

(declare-fun b!617842 () Bool)

(assert (=> b!617842 (= e!354277 (= lt!284604 lt!284621))))

(declare-fun b!617843 () Bool)

(assert (=> b!617843 (= e!354279 e!354283)))

(declare-fun res!398099 () Bool)

(assert (=> b!617843 (=> (not res!398099) (not e!354283))))

(declare-fun lt!284610 () SeekEntryResult!6454)

(assert (=> b!617843 (= res!398099 (or (= lt!284610 (MissingZero!6454 i!1108)) (= lt!284610 (MissingVacant!6454 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37542 (_ BitVec 32)) SeekEntryResult!6454)

(assert (=> b!617843 (= lt!284610 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!617844 () Bool)

(declare-fun res!398085 () Bool)

(assert (=> b!617844 (=> (not res!398085) (not e!354279))))

(assert (=> b!617844 (= res!398085 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!617845 () Bool)

(declare-fun res!398098 () Bool)

(assert (=> b!617845 (=> (not res!398098) (not e!354279))))

(assert (=> b!617845 (= res!398098 (validKeyInArray!0 k0!1786))))

(declare-fun b!617846 () Bool)

(assert (=> b!617846 false))

(declare-fun lt!284617 () Unit!20286)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37542 (_ BitVec 64) (_ BitVec 32) List!12097) Unit!20286)

(assert (=> b!617846 (= lt!284617 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284623 (select (arr!18017 a!2986) j!136) j!136 Nil!12094))))

(assert (=> b!617846 (arrayNoDuplicates!0 lt!284623 j!136 Nil!12094)))

(declare-fun lt!284614 () Unit!20286)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37542 (_ BitVec 32) (_ BitVec 32)) Unit!20286)

(assert (=> b!617846 (= lt!284614 (lemmaNoDuplicateFromThenFromBigger!0 lt!284623 #b00000000000000000000000000000000 j!136))))

(assert (=> b!617846 (arrayNoDuplicates!0 lt!284623 #b00000000000000000000000000000000 Nil!12094)))

(declare-fun lt!284605 () Unit!20286)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37542 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12097) Unit!20286)

(assert (=> b!617846 (= lt!284605 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12094))))

(assert (=> b!617846 (arrayContainsKey!0 lt!284623 (select (arr!18017 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284618 () Unit!20286)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37542 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20286)

(assert (=> b!617846 (= lt!284618 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284623 (select (arr!18017 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20291 () Unit!20286)

(assert (=> b!617846 (= e!354280 Unit!20291)))

(declare-fun b!617847 () Bool)

(declare-fun res!398094 () Bool)

(assert (=> b!617847 (= res!398094 (arrayContainsKey!0 lt!284623 (select (arr!18017 a!2986) j!136) j!136))))

(assert (=> b!617847 (=> (not res!398094) (not e!354282))))

(assert (=> b!617847 (= e!354276 e!354282)))

(declare-fun b!617848 () Bool)

(declare-fun Unit!20292 () Unit!20286)

(assert (=> b!617848 (= e!354284 Unit!20292)))

(declare-fun b!617849 () Bool)

(declare-fun Unit!20293 () Unit!20286)

(assert (=> b!617849 (= e!354275 Unit!20293)))

(declare-fun b!617850 () Bool)

(declare-fun Unit!20294 () Unit!20286)

(assert (=> b!617850 (= e!354280 Unit!20294)))

(declare-fun b!617851 () Bool)

(assert (=> b!617851 false))

(declare-fun lt!284622 () Unit!20286)

(assert (=> b!617851 (= lt!284622 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284623 (select (arr!18017 a!2986) j!136) index!984 Nil!12094))))

(assert (=> b!617851 (arrayNoDuplicates!0 lt!284623 index!984 Nil!12094)))

(declare-fun lt!284616 () Unit!20286)

(assert (=> b!617851 (= lt!284616 (lemmaNoDuplicateFromThenFromBigger!0 lt!284623 #b00000000000000000000000000000000 index!984))))

(assert (=> b!617851 (arrayNoDuplicates!0 lt!284623 #b00000000000000000000000000000000 Nil!12094)))

(declare-fun lt!284620 () Unit!20286)

(assert (=> b!617851 (= lt!284620 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12094))))

(assert (=> b!617851 (arrayContainsKey!0 lt!284623 (select (arr!18017 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284609 () Unit!20286)

(assert (=> b!617851 (= lt!284609 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284623 (select (arr!18017 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!617851 e!354288))

(declare-fun res!398087 () Bool)

(assert (=> b!617851 (=> (not res!398087) (not e!354288))))

(assert (=> b!617851 (= res!398087 (arrayContainsKey!0 lt!284623 (select (arr!18017 a!2986) j!136) j!136))))

(declare-fun Unit!20295 () Unit!20286)

(assert (=> b!617851 (= e!354275 Unit!20295)))

(assert (= (and start!56058 res!398083) b!617839))

(assert (= (and b!617839 res!398092) b!617833))

(assert (= (and b!617833 res!398089) b!617845))

(assert (= (and b!617845 res!398098) b!617844))

(assert (= (and b!617844 res!398085) b!617843))

(assert (= (and b!617843 res!398099) b!617831))

(assert (= (and b!617831 res!398088) b!617840))

(assert (= (and b!617840 res!398090) b!617828))

(assert (= (and b!617828 res!398084) b!617835))

(assert (= (and b!617835 res!398095) b!617834))

(assert (= (and b!617834 res!398086) b!617837))

(assert (= (and b!617837 res!398096) b!617842))

(assert (= (and b!617837 c!70242) b!617838))

(assert (= (and b!617837 (not c!70242)) b!617841))

(assert (= (and b!617837 c!70241) b!617836))

(assert (= (and b!617837 (not c!70241)) b!617848))

(assert (= (and b!617836 res!398091) b!617830))

(assert (= (and b!617830 (not res!398097)) b!617847))

(assert (= (and b!617847 res!398094) b!617827))

(assert (= (and b!617836 c!70239) b!617846))

(assert (= (and b!617836 (not c!70239)) b!617850))

(assert (= (and b!617836 c!70240) b!617851))

(assert (= (and b!617836 (not c!70240)) b!617849))

(assert (= (and b!617851 res!398087) b!617832))

(assert (= (and b!617837 (not res!398093)) b!617829))

(declare-fun m!593389 () Bool)

(assert (=> b!617828 m!593389))

(declare-fun m!593391 () Bool)

(assert (=> b!617833 m!593391))

(assert (=> b!617833 m!593391))

(declare-fun m!593393 () Bool)

(assert (=> b!617833 m!593393))

(declare-fun m!593395 () Bool)

(assert (=> b!617835 m!593395))

(declare-fun m!593397 () Bool)

(assert (=> b!617835 m!593397))

(declare-fun m!593399 () Bool)

(assert (=> b!617840 m!593399))

(assert (=> b!617827 m!593391))

(assert (=> b!617827 m!593391))

(declare-fun m!593401 () Bool)

(assert (=> b!617827 m!593401))

(declare-fun m!593403 () Bool)

(assert (=> b!617844 m!593403))

(assert (=> b!617846 m!593391))

(declare-fun m!593405 () Bool)

(assert (=> b!617846 m!593405))

(declare-fun m!593407 () Bool)

(assert (=> b!617846 m!593407))

(assert (=> b!617846 m!593391))

(declare-fun m!593409 () Bool)

(assert (=> b!617846 m!593409))

(declare-fun m!593411 () Bool)

(assert (=> b!617846 m!593411))

(assert (=> b!617846 m!593391))

(declare-fun m!593413 () Bool)

(assert (=> b!617846 m!593413))

(assert (=> b!617846 m!593391))

(declare-fun m!593415 () Bool)

(assert (=> b!617846 m!593415))

(declare-fun m!593417 () Bool)

(assert (=> b!617846 m!593417))

(declare-fun m!593419 () Bool)

(assert (=> b!617843 m!593419))

(declare-fun m!593421 () Bool)

(assert (=> b!617834 m!593421))

(assert (=> b!617834 m!593391))

(assert (=> b!617834 m!593391))

(declare-fun m!593423 () Bool)

(assert (=> b!617834 m!593423))

(declare-fun m!593425 () Bool)

(assert (=> start!56058 m!593425))

(declare-fun m!593427 () Bool)

(assert (=> start!56058 m!593427))

(declare-fun m!593429 () Bool)

(assert (=> b!617837 m!593429))

(declare-fun m!593431 () Bool)

(assert (=> b!617837 m!593431))

(assert (=> b!617837 m!593391))

(assert (=> b!617837 m!593395))

(declare-fun m!593433 () Bool)

(assert (=> b!617837 m!593433))

(declare-fun m!593435 () Bool)

(assert (=> b!617837 m!593435))

(assert (=> b!617837 m!593391))

(declare-fun m!593437 () Bool)

(assert (=> b!617837 m!593437))

(declare-fun m!593439 () Bool)

(assert (=> b!617837 m!593439))

(assert (=> b!617832 m!593391))

(assert (=> b!617832 m!593391))

(assert (=> b!617832 m!593401))

(declare-fun m!593441 () Bool)

(assert (=> b!617851 m!593441))

(declare-fun m!593443 () Bool)

(assert (=> b!617851 m!593443))

(assert (=> b!617851 m!593391))

(assert (=> b!617851 m!593405))

(assert (=> b!617851 m!593391))

(declare-fun m!593445 () Bool)

(assert (=> b!617851 m!593445))

(assert (=> b!617851 m!593391))

(declare-fun m!593447 () Bool)

(assert (=> b!617851 m!593447))

(assert (=> b!617851 m!593391))

(declare-fun m!593449 () Bool)

(assert (=> b!617851 m!593449))

(assert (=> b!617851 m!593391))

(declare-fun m!593451 () Bool)

(assert (=> b!617851 m!593451))

(assert (=> b!617851 m!593417))

(assert (=> b!617847 m!593391))

(assert (=> b!617847 m!593391))

(assert (=> b!617847 m!593447))

(assert (=> b!617836 m!593395))

(declare-fun m!593453 () Bool)

(assert (=> b!617836 m!593453))

(assert (=> b!617836 m!593391))

(declare-fun m!593455 () Bool)

(assert (=> b!617845 m!593455))

(declare-fun m!593457 () Bool)

(assert (=> b!617831 m!593457))

(assert (=> b!617829 m!593395))

(assert (=> b!617829 m!593453))

(check-sat (not b!617851) (not b!617832) (not b!617837) (not b!617844) (not b!617834) (not b!617845) (not b!617827) (not start!56058) (not b!617843) (not b!617840) (not b!617833) (not b!617846) (not b!617847) (not b!617831))
(check-sat)
