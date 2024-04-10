; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55938 () Bool)

(assert start!55938)

(declare-fun b!612994 () Bool)

(declare-fun e!351397 () Bool)

(declare-fun e!351385 () Bool)

(assert (=> b!612994 (= e!351397 e!351385)))

(declare-fun res!394489 () Bool)

(assert (=> b!612994 (=> res!394489 e!351385)))

(declare-datatypes ((array!37408 0))(
  ( (array!37409 (arr!17950 (Array (_ BitVec 32) (_ BitVec 64))) (size!18314 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37408)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!612994 (= res!394489 (or (bvsge (size!18314 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18314 a!2986)) (bvsge index!984 (size!18314 a!2986))))))

(declare-fun lt!280834 () array!37408)

(declare-datatypes ((List!11991 0))(
  ( (Nil!11988) (Cons!11987 (h!13032 (_ BitVec 64)) (t!18219 List!11991)) )
))
(declare-fun arrayNoDuplicates!0 (array!37408 (_ BitVec 32) List!11991) Bool)

(assert (=> b!612994 (arrayNoDuplicates!0 lt!280834 index!984 Nil!11988)))

(declare-datatypes ((Unit!19720 0))(
  ( (Unit!19721) )
))
(declare-fun lt!280827 () Unit!19720)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37408 (_ BitVec 32) (_ BitVec 32)) Unit!19720)

(assert (=> b!612994 (= lt!280827 (lemmaNoDuplicateFromThenFromBigger!0 lt!280834 #b00000000000000000000000000000000 index!984))))

(assert (=> b!612994 (arrayNoDuplicates!0 lt!280834 #b00000000000000000000000000000000 Nil!11988)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!280826 () Unit!19720)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37408 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11991) Unit!19720)

(assert (=> b!612994 (= lt!280826 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11988))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!612994 (arrayContainsKey!0 lt!280834 (select (arr!17950 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!280839 () Unit!19720)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37408 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19720)

(assert (=> b!612994 (= lt!280839 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280834 (select (arr!17950 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!351398 () Bool)

(assert (=> b!612994 e!351398))

(declare-fun res!394475 () Bool)

(assert (=> b!612994 (=> (not res!394475) (not e!351398))))

(assert (=> b!612994 (= res!394475 (arrayContainsKey!0 lt!280834 (select (arr!17950 a!2986) j!136) j!136))))

(declare-fun b!612995 () Bool)

(declare-fun e!351389 () Bool)

(declare-fun e!351387 () Bool)

(assert (=> b!612995 (= e!351389 (not e!351387))))

(declare-fun res!394472 () Bool)

(assert (=> b!612995 (=> res!394472 e!351387)))

(declare-datatypes ((SeekEntryResult!6390 0))(
  ( (MissingZero!6390 (index!27844 (_ BitVec 32))) (Found!6390 (index!27845 (_ BitVec 32))) (Intermediate!6390 (undefined!7202 Bool) (index!27846 (_ BitVec 32)) (x!56654 (_ BitVec 32))) (Undefined!6390) (MissingVacant!6390 (index!27847 (_ BitVec 32))) )
))
(declare-fun lt!280833 () SeekEntryResult!6390)

(assert (=> b!612995 (= res!394472 (not (= lt!280833 (Found!6390 index!984))))))

(declare-fun lt!280836 () Unit!19720)

(declare-fun e!351393 () Unit!19720)

(assert (=> b!612995 (= lt!280836 e!351393)))

(declare-fun c!69628 () Bool)

(assert (=> b!612995 (= c!69628 (= lt!280833 Undefined!6390))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!280828 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37408 (_ BitVec 32)) SeekEntryResult!6390)

(assert (=> b!612995 (= lt!280833 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!280828 lt!280834 mask!3053))))

(declare-fun e!351388 () Bool)

(assert (=> b!612995 e!351388))

(declare-fun res!394491 () Bool)

(assert (=> b!612995 (=> (not res!394491) (not e!351388))))

(declare-fun lt!280832 () SeekEntryResult!6390)

(declare-fun lt!280835 () (_ BitVec 32))

(assert (=> b!612995 (= res!394491 (= lt!280832 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280835 vacantSpotIndex!68 lt!280828 lt!280834 mask!3053)))))

(assert (=> b!612995 (= lt!280832 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280835 vacantSpotIndex!68 (select (arr!17950 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!612995 (= lt!280828 (select (store (arr!17950 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!280825 () Unit!19720)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37408 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19720)

(assert (=> b!612995 (= lt!280825 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!280835 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!612995 (= lt!280835 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!612996 () Bool)

(declare-fun e!351390 () Bool)

(assert (=> b!612996 (= e!351390 e!351397)))

(declare-fun res!394473 () Bool)

(assert (=> b!612996 (=> res!394473 e!351397)))

(assert (=> b!612996 (= res!394473 (bvsge index!984 j!136))))

(declare-fun lt!280837 () Unit!19720)

(declare-fun e!351391 () Unit!19720)

(assert (=> b!612996 (= lt!280837 e!351391)))

(declare-fun c!69629 () Bool)

(assert (=> b!612996 (= c!69629 (bvslt j!136 index!984))))

(declare-fun b!612997 () Bool)

(declare-fun res!394484 () Bool)

(declare-fun e!351394 () Bool)

(assert (=> b!612997 (=> (not res!394484) (not e!351394))))

(assert (=> b!612997 (= res!394484 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!612998 () Bool)

(assert (=> b!612998 (= e!351387 e!351390)))

(declare-fun res!394474 () Bool)

(assert (=> b!612998 (=> res!394474 e!351390)))

(declare-fun lt!280842 () (_ BitVec 64))

(assert (=> b!612998 (= res!394474 (or (not (= (select (arr!17950 a!2986) j!136) lt!280828)) (not (= (select (arr!17950 a!2986) j!136) lt!280842))))))

(declare-fun e!351396 () Bool)

(assert (=> b!612998 e!351396))

(declare-fun res!394490 () Bool)

(assert (=> b!612998 (=> (not res!394490) (not e!351396))))

(assert (=> b!612998 (= res!394490 (= lt!280842 (select (arr!17950 a!2986) j!136)))))

(assert (=> b!612998 (= lt!280842 (select (store (arr!17950 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!612999 () Bool)

(declare-fun e!351386 () Bool)

(declare-fun e!351395 () Bool)

(assert (=> b!612999 (= e!351386 e!351395)))

(declare-fun res!394493 () Bool)

(assert (=> b!612999 (=> (not res!394493) (not e!351395))))

(assert (=> b!612999 (= res!394493 (arrayContainsKey!0 lt!280834 (select (arr!17950 a!2986) j!136) j!136))))

(declare-fun b!613000 () Bool)

(assert (=> b!613000 (= e!351398 (arrayContainsKey!0 lt!280834 (select (arr!17950 a!2986) j!136) index!984))))

(declare-fun b!613001 () Bool)

(declare-fun e!351399 () Bool)

(assert (=> b!613001 (= e!351399 e!351389)))

(declare-fun res!394478 () Bool)

(assert (=> b!613001 (=> (not res!394478) (not e!351389))))

(declare-fun lt!280841 () SeekEntryResult!6390)

(assert (=> b!613001 (= res!394478 (and (= lt!280841 (Found!6390 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17950 a!2986) index!984) (select (arr!17950 a!2986) j!136))) (not (= (select (arr!17950 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!613001 (= lt!280841 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17950 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!613002 () Bool)

(declare-fun res!394483 () Bool)

(declare-fun e!351384 () Bool)

(assert (=> b!613002 (=> (not res!394483) (not e!351384))))

(assert (=> b!613002 (= res!394483 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17950 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!613003 () Bool)

(assert (=> b!613003 (= e!351395 (arrayContainsKey!0 lt!280834 (select (arr!17950 a!2986) j!136) index!984))))

(declare-fun b!613005 () Bool)

(assert (=> b!613005 (= e!351394 e!351384)))

(declare-fun res!394476 () Bool)

(assert (=> b!613005 (=> (not res!394476) (not e!351384))))

(declare-fun lt!280843 () SeekEntryResult!6390)

(assert (=> b!613005 (= res!394476 (or (= lt!280843 (MissingZero!6390 i!1108)) (= lt!280843 (MissingVacant!6390 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37408 (_ BitVec 32)) SeekEntryResult!6390)

(assert (=> b!613005 (= lt!280843 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!613006 () Bool)

(declare-fun res!394477 () Bool)

(assert (=> b!613006 (=> (not res!394477) (not e!351394))))

(assert (=> b!613006 (= res!394477 (and (= (size!18314 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18314 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18314 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!613007 () Bool)

(assert (=> b!613007 (= e!351396 e!351386)))

(declare-fun res!394487 () Bool)

(assert (=> b!613007 (=> res!394487 e!351386)))

(assert (=> b!613007 (= res!394487 (or (not (= (select (arr!17950 a!2986) j!136) lt!280828)) (not (= (select (arr!17950 a!2986) j!136) lt!280842)) (bvsge j!136 index!984)))))

(declare-fun b!613008 () Bool)

(declare-fun res!394485 () Bool)

(assert (=> b!613008 (=> (not res!394485) (not e!351384))))

(assert (=> b!613008 (= res!394485 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11988))))

(declare-fun b!613009 () Bool)

(declare-fun Unit!19722 () Unit!19720)

(assert (=> b!613009 (= e!351391 Unit!19722)))

(declare-fun b!613010 () Bool)

(assert (=> b!613010 (= e!351385 true)))

(declare-fun lt!280829 () Bool)

(declare-fun contains!3049 (List!11991 (_ BitVec 64)) Bool)

(assert (=> b!613010 (= lt!280829 (contains!3049 Nil!11988 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!613011 () Bool)

(declare-fun Unit!19723 () Unit!19720)

(assert (=> b!613011 (= e!351391 Unit!19723)))

(declare-fun lt!280840 () Unit!19720)

(assert (=> b!613011 (= lt!280840 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280834 (select (arr!17950 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!613011 (arrayContainsKey!0 lt!280834 (select (arr!17950 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!280831 () Unit!19720)

(assert (=> b!613011 (= lt!280831 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11988))))

(assert (=> b!613011 (arrayNoDuplicates!0 lt!280834 #b00000000000000000000000000000000 Nil!11988)))

(declare-fun lt!280838 () Unit!19720)

(assert (=> b!613011 (= lt!280838 (lemmaNoDuplicateFromThenFromBigger!0 lt!280834 #b00000000000000000000000000000000 j!136))))

(assert (=> b!613011 (arrayNoDuplicates!0 lt!280834 j!136 Nil!11988)))

(declare-fun lt!280830 () Unit!19720)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37408 (_ BitVec 64) (_ BitVec 32) List!11991) Unit!19720)

(assert (=> b!613011 (= lt!280830 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!280834 (select (arr!17950 a!2986) j!136) j!136 Nil!11988))))

(assert (=> b!613011 false))

(declare-fun b!613012 () Bool)

(declare-fun res!394488 () Bool)

(assert (=> b!613012 (=> res!394488 e!351385)))

(assert (=> b!613012 (= res!394488 (contains!3049 Nil!11988 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!613013 () Bool)

(declare-fun Unit!19724 () Unit!19720)

(assert (=> b!613013 (= e!351393 Unit!19724)))

(declare-fun b!613014 () Bool)

(declare-fun res!394481 () Bool)

(assert (=> b!613014 (=> res!394481 e!351385)))

(declare-fun noDuplicate!352 (List!11991) Bool)

(assert (=> b!613014 (= res!394481 (not (noDuplicate!352 Nil!11988)))))

(declare-fun b!613015 () Bool)

(declare-fun res!394482 () Bool)

(assert (=> b!613015 (=> (not res!394482) (not e!351394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!613015 (= res!394482 (validKeyInArray!0 (select (arr!17950 a!2986) j!136)))))

(declare-fun b!613016 () Bool)

(assert (=> b!613016 (= e!351388 (= lt!280841 lt!280832))))

(declare-fun b!613017 () Bool)

(declare-fun res!394479 () Bool)

(assert (=> b!613017 (=> (not res!394479) (not e!351394))))

(assert (=> b!613017 (= res!394479 (validKeyInArray!0 k0!1786))))

(declare-fun b!613018 () Bool)

(declare-fun res!394492 () Bool)

(assert (=> b!613018 (=> (not res!394492) (not e!351384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37408 (_ BitVec 32)) Bool)

(assert (=> b!613018 (= res!394492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!613019 () Bool)

(declare-fun Unit!19725 () Unit!19720)

(assert (=> b!613019 (= e!351393 Unit!19725)))

(assert (=> b!613019 false))

(declare-fun b!613004 () Bool)

(assert (=> b!613004 (= e!351384 e!351399)))

(declare-fun res!394480 () Bool)

(assert (=> b!613004 (=> (not res!394480) (not e!351399))))

(assert (=> b!613004 (= res!394480 (= (select (store (arr!17950 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!613004 (= lt!280834 (array!37409 (store (arr!17950 a!2986) i!1108 k0!1786) (size!18314 a!2986)))))

(declare-fun res!394486 () Bool)

(assert (=> start!55938 (=> (not res!394486) (not e!351394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55938 (= res!394486 (validMask!0 mask!3053))))

(assert (=> start!55938 e!351394))

(assert (=> start!55938 true))

(declare-fun array_inv!13746 (array!37408) Bool)

(assert (=> start!55938 (array_inv!13746 a!2986)))

(assert (= (and start!55938 res!394486) b!613006))

(assert (= (and b!613006 res!394477) b!613015))

(assert (= (and b!613015 res!394482) b!613017))

(assert (= (and b!613017 res!394479) b!612997))

(assert (= (and b!612997 res!394484) b!613005))

(assert (= (and b!613005 res!394476) b!613018))

(assert (= (and b!613018 res!394492) b!613008))

(assert (= (and b!613008 res!394485) b!613002))

(assert (= (and b!613002 res!394483) b!613004))

(assert (= (and b!613004 res!394480) b!613001))

(assert (= (and b!613001 res!394478) b!612995))

(assert (= (and b!612995 res!394491) b!613016))

(assert (= (and b!612995 c!69628) b!613019))

(assert (= (and b!612995 (not c!69628)) b!613013))

(assert (= (and b!612995 (not res!394472)) b!612998))

(assert (= (and b!612998 res!394490) b!613007))

(assert (= (and b!613007 (not res!394487)) b!612999))

(assert (= (and b!612999 res!394493) b!613003))

(assert (= (and b!612998 (not res!394474)) b!612996))

(assert (= (and b!612996 c!69629) b!613011))

(assert (= (and b!612996 (not c!69629)) b!613009))

(assert (= (and b!612996 (not res!394473)) b!612994))

(assert (= (and b!612994 res!394475) b!613000))

(assert (= (and b!612994 (not res!394489)) b!613014))

(assert (= (and b!613014 (not res!394481)) b!613012))

(assert (= (and b!613012 (not res!394488)) b!613010))

(declare-fun m!589303 () Bool)

(assert (=> b!613010 m!589303))

(declare-fun m!589305 () Bool)

(assert (=> b!612997 m!589305))

(declare-fun m!589307 () Bool)

(assert (=> b!613017 m!589307))

(declare-fun m!589309 () Bool)

(assert (=> b!612995 m!589309))

(declare-fun m!589311 () Bool)

(assert (=> b!612995 m!589311))

(declare-fun m!589313 () Bool)

(assert (=> b!612995 m!589313))

(declare-fun m!589315 () Bool)

(assert (=> b!612995 m!589315))

(declare-fun m!589317 () Bool)

(assert (=> b!612995 m!589317))

(assert (=> b!612995 m!589313))

(declare-fun m!589319 () Bool)

(assert (=> b!612995 m!589319))

(declare-fun m!589321 () Bool)

(assert (=> b!612995 m!589321))

(declare-fun m!589323 () Bool)

(assert (=> b!612995 m!589323))

(declare-fun m!589325 () Bool)

(assert (=> b!613018 m!589325))

(assert (=> b!613000 m!589313))

(assert (=> b!613000 m!589313))

(declare-fun m!589327 () Bool)

(assert (=> b!613000 m!589327))

(assert (=> b!613004 m!589315))

(declare-fun m!589329 () Bool)

(assert (=> b!613004 m!589329))

(assert (=> b!613007 m!589313))

(assert (=> b!612994 m!589313))

(declare-fun m!589331 () Bool)

(assert (=> b!612994 m!589331))

(declare-fun m!589333 () Bool)

(assert (=> b!612994 m!589333))

(assert (=> b!612994 m!589313))

(declare-fun m!589335 () Bool)

(assert (=> b!612994 m!589335))

(assert (=> b!612994 m!589313))

(declare-fun m!589337 () Bool)

(assert (=> b!612994 m!589337))

(declare-fun m!589339 () Bool)

(assert (=> b!612994 m!589339))

(assert (=> b!612994 m!589313))

(declare-fun m!589341 () Bool)

(assert (=> b!612994 m!589341))

(declare-fun m!589343 () Bool)

(assert (=> b!612994 m!589343))

(declare-fun m!589345 () Bool)

(assert (=> b!613002 m!589345))

(declare-fun m!589347 () Bool)

(assert (=> b!613005 m!589347))

(declare-fun m!589349 () Bool)

(assert (=> start!55938 m!589349))

(declare-fun m!589351 () Bool)

(assert (=> start!55938 m!589351))

(assert (=> b!613015 m!589313))

(assert (=> b!613015 m!589313))

(declare-fun m!589353 () Bool)

(assert (=> b!613015 m!589353))

(assert (=> b!612999 m!589313))

(assert (=> b!612999 m!589313))

(assert (=> b!612999 m!589341))

(assert (=> b!613011 m!589313))

(declare-fun m!589355 () Bool)

(assert (=> b!613011 m!589355))

(assert (=> b!613011 m!589313))

(declare-fun m!589357 () Bool)

(assert (=> b!613011 m!589357))

(assert (=> b!613011 m!589313))

(declare-fun m!589359 () Bool)

(assert (=> b!613011 m!589359))

(assert (=> b!613011 m!589335))

(declare-fun m!589361 () Bool)

(assert (=> b!613011 m!589361))

(assert (=> b!613011 m!589313))

(declare-fun m!589363 () Bool)

(assert (=> b!613011 m!589363))

(assert (=> b!613011 m!589343))

(assert (=> b!613003 m!589313))

(assert (=> b!613003 m!589313))

(assert (=> b!613003 m!589327))

(declare-fun m!589365 () Bool)

(assert (=> b!613008 m!589365))

(declare-fun m!589367 () Bool)

(assert (=> b!613012 m!589367))

(assert (=> b!612998 m!589313))

(assert (=> b!612998 m!589315))

(declare-fun m!589369 () Bool)

(assert (=> b!612998 m!589369))

(declare-fun m!589371 () Bool)

(assert (=> b!613014 m!589371))

(declare-fun m!589373 () Bool)

(assert (=> b!613001 m!589373))

(assert (=> b!613001 m!589313))

(assert (=> b!613001 m!589313))

(declare-fun m!589375 () Bool)

(assert (=> b!613001 m!589375))

(check-sat (not b!612997) (not b!613000) (not b!613012) (not b!612994) (not b!612999) (not b!613005) (not b!613018) (not b!613011) (not b!613014) (not b!613001) (not b!612995) (not b!613010) (not b!613003) (not b!613015) (not start!55938) (not b!613008) (not b!613017))
(check-sat)
