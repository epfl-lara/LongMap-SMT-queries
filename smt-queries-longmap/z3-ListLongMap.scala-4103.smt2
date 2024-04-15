; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56100 () Bool)

(assert start!56100)

(declare-fun b!619402 () Bool)

(declare-datatypes ((array!37584 0))(
  ( (array!37585 (arr!18038 (Array (_ BitVec 32) (_ BitVec 64))) (size!18403 (_ BitVec 32))) )
))
(declare-fun lt!285868 () array!37584)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!355223 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37584)

(declare-fun arrayContainsKey!0 (array!37584 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!619402 (= e!355223 (arrayContainsKey!0 lt!285868 (select (arr!18038 a!2986) j!136) index!984))))

(declare-fun res!399158 () Bool)

(declare-fun b!619403 () Bool)

(assert (=> b!619403 (= res!399158 (arrayContainsKey!0 lt!285868 (select (arr!18038 a!2986) j!136) j!136))))

(declare-fun e!355231 () Bool)

(assert (=> b!619403 (=> (not res!399158) (not e!355231))))

(declare-fun e!355232 () Bool)

(assert (=> b!619403 (= e!355232 e!355231)))

(declare-fun b!619404 () Bool)

(declare-fun res!399161 () Bool)

(assert (=> b!619404 (= res!399161 (bvsge j!136 index!984))))

(assert (=> b!619404 (=> res!399161 e!355232)))

(declare-fun e!355227 () Bool)

(assert (=> b!619404 (= e!355227 e!355232)))

(declare-fun b!619405 () Bool)

(declare-fun e!355222 () Bool)

(declare-fun e!355228 () Bool)

(assert (=> b!619405 (= e!355222 (not e!355228))))

(declare-fun res!399162 () Bool)

(assert (=> b!619405 (=> res!399162 e!355228)))

(declare-datatypes ((SeekEntryResult!6475 0))(
  ( (MissingZero!6475 (index!28184 (_ BitVec 32))) (Found!6475 (index!28185 (_ BitVec 32))) (Intermediate!6475 (undefined!7287 Bool) (index!28186 (_ BitVec 32)) (x!56974 (_ BitVec 32))) (Undefined!6475) (MissingVacant!6475 (index!28187 (_ BitVec 32))) )
))
(declare-fun lt!285882 () SeekEntryResult!6475)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!619405 (= res!399162 (not (= lt!285882 (MissingVacant!6475 vacantSpotIndex!68))))))

(declare-datatypes ((Unit!20496 0))(
  ( (Unit!20497) )
))
(declare-fun lt!285872 () Unit!20496)

(declare-fun e!355229 () Unit!20496)

(assert (=> b!619405 (= lt!285872 e!355229)))

(declare-fun c!70494 () Bool)

(assert (=> b!619405 (= c!70494 (= lt!285882 (Found!6475 index!984)))))

(declare-fun lt!285873 () Unit!20496)

(declare-fun e!355219 () Unit!20496)

(assert (=> b!619405 (= lt!285873 e!355219)))

(declare-fun c!70491 () Bool)

(assert (=> b!619405 (= c!70491 (= lt!285882 Undefined!6475))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!285881 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37584 (_ BitVec 32)) SeekEntryResult!6475)

(assert (=> b!619405 (= lt!285882 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285881 lt!285868 mask!3053))))

(declare-fun e!355224 () Bool)

(assert (=> b!619405 e!355224))

(declare-fun res!399168 () Bool)

(assert (=> b!619405 (=> (not res!399168) (not e!355224))))

(declare-fun lt!285869 () (_ BitVec 32))

(declare-fun lt!285864 () SeekEntryResult!6475)

(assert (=> b!619405 (= res!399168 (= lt!285864 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285869 vacantSpotIndex!68 lt!285881 lt!285868 mask!3053)))))

(assert (=> b!619405 (= lt!285864 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285869 vacantSpotIndex!68 (select (arr!18038 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!619405 (= lt!285881 (select (store (arr!18038 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!285879 () Unit!20496)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37584 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20496)

(assert (=> b!619405 (= lt!285879 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285869 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!619405 (= lt!285869 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!619406 () Bool)

(declare-fun res!399170 () Bool)

(declare-fun e!355225 () Bool)

(assert (=> b!619406 (=> (not res!399170) (not e!355225))))

(assert (=> b!619406 (= res!399170 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!619407 () Bool)

(assert (=> b!619407 false))

(declare-fun lt!285883 () Unit!20496)

(declare-datatypes ((List!12118 0))(
  ( (Nil!12115) (Cons!12114 (h!13159 (_ BitVec 64)) (t!18337 List!12118)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37584 (_ BitVec 64) (_ BitVec 32) List!12118) Unit!20496)

(assert (=> b!619407 (= lt!285883 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285868 (select (arr!18038 a!2986) j!136) j!136 Nil!12115))))

(declare-fun arrayNoDuplicates!0 (array!37584 (_ BitVec 32) List!12118) Bool)

(assert (=> b!619407 (arrayNoDuplicates!0 lt!285868 j!136 Nil!12115)))

(declare-fun lt!285880 () Unit!20496)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37584 (_ BitVec 32) (_ BitVec 32)) Unit!20496)

(assert (=> b!619407 (= lt!285880 (lemmaNoDuplicateFromThenFromBigger!0 lt!285868 #b00000000000000000000000000000000 j!136))))

(assert (=> b!619407 (arrayNoDuplicates!0 lt!285868 #b00000000000000000000000000000000 Nil!12115)))

(declare-fun lt!285870 () Unit!20496)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37584 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12118) Unit!20496)

(assert (=> b!619407 (= lt!285870 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12115))))

(assert (=> b!619407 (arrayContainsKey!0 lt!285868 (select (arr!18038 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285866 () Unit!20496)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37584 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20496)

(assert (=> b!619407 (= lt!285866 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285868 (select (arr!18038 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!355220 () Unit!20496)

(declare-fun Unit!20498 () Unit!20496)

(assert (=> b!619407 (= e!355220 Unit!20498)))

(declare-fun b!619408 () Bool)

(declare-fun Unit!20499 () Unit!20496)

(assert (=> b!619408 (= e!355219 Unit!20499)))

(declare-fun b!619409 () Bool)

(declare-fun Unit!20500 () Unit!20496)

(assert (=> b!619409 (= e!355229 Unit!20500)))

(declare-fun b!619410 () Bool)

(declare-fun Unit!20501 () Unit!20496)

(assert (=> b!619410 (= e!355229 Unit!20501)))

(declare-fun res!399157 () Bool)

(assert (=> b!619410 (= res!399157 (= (select (store (arr!18038 a!2986) i!1108 k0!1786) index!984) (select (arr!18038 a!2986) j!136)))))

(assert (=> b!619410 (=> (not res!399157) (not e!355227))))

(assert (=> b!619410 e!355227))

(declare-fun c!70492 () Bool)

(assert (=> b!619410 (= c!70492 (bvslt j!136 index!984))))

(declare-fun lt!285867 () Unit!20496)

(assert (=> b!619410 (= lt!285867 e!355220)))

(declare-fun c!70493 () Bool)

(assert (=> b!619410 (= c!70493 (bvslt index!984 j!136))))

(declare-fun lt!285871 () Unit!20496)

(declare-fun e!355230 () Unit!20496)

(assert (=> b!619410 (= lt!285871 e!355230)))

(assert (=> b!619410 false))

(declare-fun b!619411 () Bool)

(declare-fun res!399165 () Bool)

(assert (=> b!619411 (=> (not res!399165) (not e!355225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!619411 (= res!399165 (validKeyInArray!0 k0!1786))))

(declare-fun b!619412 () Bool)

(declare-fun Unit!20502 () Unit!20496)

(assert (=> b!619412 (= e!355219 Unit!20502)))

(assert (=> b!619412 false))

(declare-fun b!619413 () Bool)

(declare-fun res!399164 () Bool)

(assert (=> b!619413 (=> (not res!399164) (not e!355225))))

(assert (=> b!619413 (= res!399164 (validKeyInArray!0 (select (arr!18038 a!2986) j!136)))))

(declare-fun b!619414 () Bool)

(declare-fun res!399156 () Bool)

(declare-fun e!355221 () Bool)

(assert (=> b!619414 (=> (not res!399156) (not e!355221))))

(assert (=> b!619414 (= res!399156 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12115))))

(declare-fun b!619415 () Bool)

(declare-fun res!399159 () Bool)

(assert (=> b!619415 (=> (not res!399159) (not e!355221))))

(assert (=> b!619415 (= res!399159 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18038 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!619416 () Bool)

(declare-fun lt!285878 () SeekEntryResult!6475)

(assert (=> b!619416 (= e!355224 (= lt!285878 lt!285864))))

(declare-fun b!619417 () Bool)

(declare-fun e!355233 () Bool)

(assert (=> b!619417 (= e!355233 e!355222)))

(declare-fun res!399160 () Bool)

(assert (=> b!619417 (=> (not res!399160) (not e!355222))))

(assert (=> b!619417 (= res!399160 (and (= lt!285878 (Found!6475 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18038 a!2986) index!984) (select (arr!18038 a!2986) j!136))) (not (= (select (arr!18038 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!619417 (= lt!285878 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18038 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!619418 () Bool)

(assert (=> b!619418 (= e!355231 (arrayContainsKey!0 lt!285868 (select (arr!18038 a!2986) j!136) index!984))))

(declare-fun b!619419 () Bool)

(assert (=> b!619419 (= e!355228 true)))

(assert (=> b!619419 (= (select (store (arr!18038 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!619420 () Bool)

(declare-fun Unit!20503 () Unit!20496)

(assert (=> b!619420 (= e!355220 Unit!20503)))

(declare-fun res!399169 () Bool)

(assert (=> start!56100 (=> (not res!399169) (not e!355225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56100 (= res!399169 (validMask!0 mask!3053))))

(assert (=> start!56100 e!355225))

(assert (=> start!56100 true))

(declare-fun array_inv!13921 (array!37584) Bool)

(assert (=> start!56100 (array_inv!13921 a!2986)))

(declare-fun b!619421 () Bool)

(assert (=> b!619421 (= e!355225 e!355221)))

(declare-fun res!399163 () Bool)

(assert (=> b!619421 (=> (not res!399163) (not e!355221))))

(declare-fun lt!285874 () SeekEntryResult!6475)

(assert (=> b!619421 (= res!399163 (or (= lt!285874 (MissingZero!6475 i!1108)) (= lt!285874 (MissingVacant!6475 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37584 (_ BitVec 32)) SeekEntryResult!6475)

(assert (=> b!619421 (= lt!285874 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!619422 () Bool)

(assert (=> b!619422 false))

(declare-fun lt!285877 () Unit!20496)

(assert (=> b!619422 (= lt!285877 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285868 (select (arr!18038 a!2986) j!136) index!984 Nil!12115))))

(assert (=> b!619422 (arrayNoDuplicates!0 lt!285868 index!984 Nil!12115)))

(declare-fun lt!285876 () Unit!20496)

(assert (=> b!619422 (= lt!285876 (lemmaNoDuplicateFromThenFromBigger!0 lt!285868 #b00000000000000000000000000000000 index!984))))

(assert (=> b!619422 (arrayNoDuplicates!0 lt!285868 #b00000000000000000000000000000000 Nil!12115)))

(declare-fun lt!285875 () Unit!20496)

(assert (=> b!619422 (= lt!285875 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12115))))

(assert (=> b!619422 (arrayContainsKey!0 lt!285868 (select (arr!18038 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285865 () Unit!20496)

(assert (=> b!619422 (= lt!285865 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285868 (select (arr!18038 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!619422 e!355223))

(declare-fun res!399166 () Bool)

(assert (=> b!619422 (=> (not res!399166) (not e!355223))))

(assert (=> b!619422 (= res!399166 (arrayContainsKey!0 lt!285868 (select (arr!18038 a!2986) j!136) j!136))))

(declare-fun Unit!20504 () Unit!20496)

(assert (=> b!619422 (= e!355230 Unit!20504)))

(declare-fun b!619423 () Bool)

(declare-fun res!399154 () Bool)

(assert (=> b!619423 (=> (not res!399154) (not e!355221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37584 (_ BitVec 32)) Bool)

(assert (=> b!619423 (= res!399154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!619424 () Bool)

(assert (=> b!619424 (= e!355221 e!355233)))

(declare-fun res!399167 () Bool)

(assert (=> b!619424 (=> (not res!399167) (not e!355233))))

(assert (=> b!619424 (= res!399167 (= (select (store (arr!18038 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!619424 (= lt!285868 (array!37585 (store (arr!18038 a!2986) i!1108 k0!1786) (size!18403 a!2986)))))

(declare-fun b!619425 () Bool)

(declare-fun Unit!20505 () Unit!20496)

(assert (=> b!619425 (= e!355230 Unit!20505)))

(declare-fun b!619426 () Bool)

(declare-fun res!399155 () Bool)

(assert (=> b!619426 (=> (not res!399155) (not e!355225))))

(assert (=> b!619426 (= res!399155 (and (= (size!18403 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18403 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18403 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56100 res!399169) b!619426))

(assert (= (and b!619426 res!399155) b!619413))

(assert (= (and b!619413 res!399164) b!619411))

(assert (= (and b!619411 res!399165) b!619406))

(assert (= (and b!619406 res!399170) b!619421))

(assert (= (and b!619421 res!399163) b!619423))

(assert (= (and b!619423 res!399154) b!619414))

(assert (= (and b!619414 res!399156) b!619415))

(assert (= (and b!619415 res!399159) b!619424))

(assert (= (and b!619424 res!399167) b!619417))

(assert (= (and b!619417 res!399160) b!619405))

(assert (= (and b!619405 res!399168) b!619416))

(assert (= (and b!619405 c!70491) b!619412))

(assert (= (and b!619405 (not c!70491)) b!619408))

(assert (= (and b!619405 c!70494) b!619410))

(assert (= (and b!619405 (not c!70494)) b!619409))

(assert (= (and b!619410 res!399157) b!619404))

(assert (= (and b!619404 (not res!399161)) b!619403))

(assert (= (and b!619403 res!399158) b!619418))

(assert (= (and b!619410 c!70492) b!619407))

(assert (= (and b!619410 (not c!70492)) b!619420))

(assert (= (and b!619410 c!70493) b!619422))

(assert (= (and b!619410 (not c!70493)) b!619425))

(assert (= (and b!619422 res!399166) b!619402))

(assert (= (and b!619405 (not res!399162)) b!619419))

(declare-fun m!594859 () Bool)

(assert (=> b!619419 m!594859))

(declare-fun m!594861 () Bool)

(assert (=> b!619419 m!594861))

(declare-fun m!594863 () Bool)

(assert (=> b!619422 m!594863))

(declare-fun m!594865 () Bool)

(assert (=> b!619422 m!594865))

(declare-fun m!594867 () Bool)

(assert (=> b!619422 m!594867))

(assert (=> b!619422 m!594863))

(declare-fun m!594869 () Bool)

(assert (=> b!619422 m!594869))

(assert (=> b!619422 m!594863))

(declare-fun m!594871 () Bool)

(assert (=> b!619422 m!594871))

(assert (=> b!619422 m!594863))

(declare-fun m!594873 () Bool)

(assert (=> b!619422 m!594873))

(assert (=> b!619422 m!594863))

(declare-fun m!594875 () Bool)

(assert (=> b!619422 m!594875))

(declare-fun m!594877 () Bool)

(assert (=> b!619422 m!594877))

(declare-fun m!594879 () Bool)

(assert (=> b!619422 m!594879))

(declare-fun m!594881 () Bool)

(assert (=> b!619415 m!594881))

(assert (=> b!619418 m!594863))

(assert (=> b!619418 m!594863))

(declare-fun m!594883 () Bool)

(assert (=> b!619418 m!594883))

(declare-fun m!594885 () Bool)

(assert (=> b!619406 m!594885))

(assert (=> b!619424 m!594859))

(declare-fun m!594887 () Bool)

(assert (=> b!619424 m!594887))

(declare-fun m!594889 () Bool)

(assert (=> b!619417 m!594889))

(assert (=> b!619417 m!594863))

(assert (=> b!619417 m!594863))

(declare-fun m!594891 () Bool)

(assert (=> b!619417 m!594891))

(declare-fun m!594893 () Bool)

(assert (=> b!619411 m!594893))

(assert (=> b!619402 m!594863))

(assert (=> b!619402 m!594863))

(assert (=> b!619402 m!594883))

(declare-fun m!594895 () Bool)

(assert (=> b!619421 m!594895))

(declare-fun m!594897 () Bool)

(assert (=> b!619414 m!594897))

(assert (=> b!619410 m!594859))

(assert (=> b!619410 m!594861))

(assert (=> b!619410 m!594863))

(declare-fun m!594899 () Bool)

(assert (=> start!56100 m!594899))

(declare-fun m!594901 () Bool)

(assert (=> start!56100 m!594901))

(assert (=> b!619405 m!594863))

(declare-fun m!594903 () Bool)

(assert (=> b!619405 m!594903))

(declare-fun m!594905 () Bool)

(assert (=> b!619405 m!594905))

(declare-fun m!594907 () Bool)

(assert (=> b!619405 m!594907))

(declare-fun m!594909 () Bool)

(assert (=> b!619405 m!594909))

(assert (=> b!619405 m!594863))

(assert (=> b!619405 m!594859))

(declare-fun m!594911 () Bool)

(assert (=> b!619405 m!594911))

(declare-fun m!594913 () Bool)

(assert (=> b!619405 m!594913))

(assert (=> b!619413 m!594863))

(assert (=> b!619413 m!594863))

(declare-fun m!594915 () Bool)

(assert (=> b!619413 m!594915))

(declare-fun m!594917 () Bool)

(assert (=> b!619423 m!594917))

(assert (=> b!619407 m!594867))

(assert (=> b!619407 m!594863))

(declare-fun m!594919 () Bool)

(assert (=> b!619407 m!594919))

(assert (=> b!619407 m!594863))

(declare-fun m!594921 () Bool)

(assert (=> b!619407 m!594921))

(assert (=> b!619407 m!594863))

(declare-fun m!594923 () Bool)

(assert (=> b!619407 m!594923))

(assert (=> b!619407 m!594863))

(declare-fun m!594925 () Bool)

(assert (=> b!619407 m!594925))

(declare-fun m!594927 () Bool)

(assert (=> b!619407 m!594927))

(assert (=> b!619407 m!594879))

(assert (=> b!619403 m!594863))

(assert (=> b!619403 m!594863))

(assert (=> b!619403 m!594875))

(check-sat (not b!619418) (not b!619407) (not b!619405) (not b!619403) (not b!619422) (not b!619413) (not start!56100) (not b!619417) (not b!619421) (not b!619423) (not b!619402) (not b!619414) (not b!619406) (not b!619411))
(check-sat)
