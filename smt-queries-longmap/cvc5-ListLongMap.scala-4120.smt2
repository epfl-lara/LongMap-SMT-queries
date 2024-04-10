; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56218 () Bool)

(assert start!56218)

(declare-fun b!623363 () Bool)

(declare-fun res!401755 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!623363 (= res!401755 (bvsge j!136 index!984))))

(declare-fun e!357567 () Bool)

(assert (=> b!623363 (=> res!401755 e!357567)))

(declare-fun e!357565 () Bool)

(assert (=> b!623363 (= e!357565 e!357567)))

(declare-fun b!623364 () Bool)

(declare-fun e!357557 () Bool)

(declare-fun e!357553 () Bool)

(assert (=> b!623364 (= e!357557 e!357553)))

(declare-fun res!401752 () Bool)

(assert (=> b!623364 (=> (not res!401752) (not e!357553))))

(declare-datatypes ((SeekEntryResult!6530 0))(
  ( (MissingZero!6530 (index!28404 (_ BitVec 32))) (Found!6530 (index!28405 (_ BitVec 32))) (Intermediate!6530 (undefined!7342 Bool) (index!28406 (_ BitVec 32)) (x!57170 (_ BitVec 32))) (Undefined!6530) (MissingVacant!6530 (index!28407 (_ BitVec 32))) )
))
(declare-fun lt!289166 () SeekEntryResult!6530)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!623364 (= res!401752 (or (= lt!289166 (MissingZero!6530 i!1108)) (= lt!289166 (MissingVacant!6530 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!37688 0))(
  ( (array!37689 (arr!18090 (Array (_ BitVec 32) (_ BitVec 64))) (size!18454 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37688)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37688 (_ BitVec 32)) SeekEntryResult!6530)

(assert (=> b!623364 (= lt!289166 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!401761 () Bool)

(declare-fun b!623365 () Bool)

(declare-fun lt!289167 () array!37688)

(declare-fun arrayContainsKey!0 (array!37688 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!623365 (= res!401761 (arrayContainsKey!0 lt!289167 (select (arr!18090 a!2986) j!136) j!136))))

(declare-fun e!357555 () Bool)

(assert (=> b!623365 (=> (not res!401761) (not e!357555))))

(assert (=> b!623365 (= e!357567 e!357555)))

(declare-fun e!357558 () Bool)

(declare-fun b!623366 () Bool)

(assert (=> b!623366 (= e!357558 (arrayContainsKey!0 lt!289167 (select (arr!18090 a!2986) j!136) index!984))))

(declare-fun b!623367 () Bool)

(declare-datatypes ((Unit!21028 0))(
  ( (Unit!21029) )
))
(declare-fun e!357562 () Unit!21028)

(declare-fun Unit!21030 () Unit!21028)

(assert (=> b!623367 (= e!357562 Unit!21030)))

(declare-fun b!623368 () Bool)

(declare-fun e!357556 () Bool)

(declare-fun e!357561 () Bool)

(assert (=> b!623368 (= e!357556 e!357561)))

(declare-fun res!401765 () Bool)

(assert (=> b!623368 (=> (not res!401765) (not e!357561))))

(declare-fun lt!289172 () SeekEntryResult!6530)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!623368 (= res!401765 (and (= lt!289172 (Found!6530 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18090 a!2986) index!984) (select (arr!18090 a!2986) j!136))) (not (= (select (arr!18090 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37688 (_ BitVec 32)) SeekEntryResult!6530)

(assert (=> b!623368 (= lt!289172 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18090 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!623369 () Bool)

(declare-fun e!357554 () Unit!21028)

(declare-fun Unit!21031 () Unit!21028)

(assert (=> b!623369 (= e!357554 Unit!21031)))

(declare-fun b!623370 () Bool)

(declare-fun e!357563 () Unit!21028)

(declare-fun Unit!21032 () Unit!21028)

(assert (=> b!623370 (= e!357563 Unit!21032)))

(assert (=> b!623370 false))

(declare-fun b!623371 () Bool)

(declare-fun res!401764 () Bool)

(assert (=> b!623371 (=> (not res!401764) (not e!357557))))

(assert (=> b!623371 (= res!401764 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!623372 () Bool)

(assert (=> b!623372 (= e!357553 e!357556)))

(declare-fun res!401760 () Bool)

(assert (=> b!623372 (=> (not res!401760) (not e!357556))))

(assert (=> b!623372 (= res!401760 (= (select (store (arr!18090 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!623372 (= lt!289167 (array!37689 (store (arr!18090 a!2986) i!1108 k!1786) (size!18454 a!2986)))))

(declare-fun b!623373 () Bool)

(declare-fun Unit!21033 () Unit!21028)

(assert (=> b!623373 (= e!357554 Unit!21033)))

(declare-fun res!401759 () Bool)

(assert (=> b!623373 (= res!401759 (= (select (store (arr!18090 a!2986) i!1108 k!1786) index!984) (select (arr!18090 a!2986) j!136)))))

(assert (=> b!623373 (=> (not res!401759) (not e!357565))))

(assert (=> b!623373 e!357565))

(declare-fun c!71176 () Bool)

(assert (=> b!623373 (= c!71176 (bvslt j!136 index!984))))

(declare-fun lt!289174 () Unit!21028)

(assert (=> b!623373 (= lt!289174 e!357562)))

(declare-fun c!71174 () Bool)

(assert (=> b!623373 (= c!71174 (bvslt index!984 j!136))))

(declare-fun lt!289168 () Unit!21028)

(declare-fun e!357564 () Unit!21028)

(assert (=> b!623373 (= lt!289168 e!357564)))

(assert (=> b!623373 false))

(declare-fun b!623374 () Bool)

(declare-fun res!401753 () Bool)

(assert (=> b!623374 (=> (not res!401753) (not e!357553))))

(declare-datatypes ((List!12131 0))(
  ( (Nil!12128) (Cons!12127 (h!13172 (_ BitVec 64)) (t!18359 List!12131)) )
))
(declare-fun arrayNoDuplicates!0 (array!37688 (_ BitVec 32) List!12131) Bool)

(assert (=> b!623374 (= res!401753 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12128))))

(declare-fun b!623375 () Bool)

(declare-fun e!357559 () Bool)

(declare-fun lt!289161 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!623375 (= e!357559 (validKeyInArray!0 lt!289161))))

(declare-fun b!623376 () Bool)

(declare-fun res!401756 () Bool)

(assert (=> b!623376 (=> (not res!401756) (not e!357557))))

(assert (=> b!623376 (= res!401756 (validKeyInArray!0 (select (arr!18090 a!2986) j!136)))))

(declare-fun b!623377 () Bool)

(assert (=> b!623377 (= e!357561 (not e!357559))))

(declare-fun res!401758 () Bool)

(assert (=> b!623377 (=> res!401758 e!357559)))

(declare-fun lt!289176 () SeekEntryResult!6530)

(assert (=> b!623377 (= res!401758 (or (= lt!289176 (MissingVacant!6530 vacantSpotIndex!68)) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(declare-fun lt!289160 () Unit!21028)

(assert (=> b!623377 (= lt!289160 e!357554)))

(declare-fun c!71177 () Bool)

(assert (=> b!623377 (= c!71177 (= lt!289176 (Found!6530 index!984)))))

(declare-fun lt!289177 () Unit!21028)

(assert (=> b!623377 (= lt!289177 e!357563)))

(declare-fun c!71175 () Bool)

(assert (=> b!623377 (= c!71175 (= lt!289176 Undefined!6530))))

(assert (=> b!623377 (= lt!289176 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!289161 lt!289167 mask!3053))))

(declare-fun e!357566 () Bool)

(assert (=> b!623377 e!357566))

(declare-fun res!401750 () Bool)

(assert (=> b!623377 (=> (not res!401750) (not e!357566))))

(declare-fun lt!289175 () SeekEntryResult!6530)

(declare-fun lt!289165 () (_ BitVec 32))

(assert (=> b!623377 (= res!401750 (= lt!289175 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289165 vacantSpotIndex!68 lt!289161 lt!289167 mask!3053)))))

(assert (=> b!623377 (= lt!289175 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289165 vacantSpotIndex!68 (select (arr!18090 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!623377 (= lt!289161 (select (store (arr!18090 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!289158 () Unit!21028)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37688 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21028)

(assert (=> b!623377 (= lt!289158 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!289165 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!623377 (= lt!289165 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!623378 () Bool)

(declare-fun Unit!21034 () Unit!21028)

(assert (=> b!623378 (= e!357563 Unit!21034)))

(declare-fun b!623379 () Bool)

(declare-fun res!401757 () Bool)

(assert (=> b!623379 (=> (not res!401757) (not e!357557))))

(assert (=> b!623379 (= res!401757 (and (= (size!18454 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18454 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18454 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!623380 () Bool)

(declare-fun res!401763 () Bool)

(assert (=> b!623380 (=> (not res!401763) (not e!357553))))

(assert (=> b!623380 (= res!401763 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18090 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!623381 () Bool)

(assert (=> b!623381 false))

(declare-fun lt!289173 () Unit!21028)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37688 (_ BitVec 64) (_ BitVec 32) List!12131) Unit!21028)

(assert (=> b!623381 (= lt!289173 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!289167 (select (arr!18090 a!2986) j!136) j!136 Nil!12128))))

(assert (=> b!623381 (arrayNoDuplicates!0 lt!289167 j!136 Nil!12128)))

(declare-fun lt!289171 () Unit!21028)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37688 (_ BitVec 32) (_ BitVec 32)) Unit!21028)

(assert (=> b!623381 (= lt!289171 (lemmaNoDuplicateFromThenFromBigger!0 lt!289167 #b00000000000000000000000000000000 j!136))))

(assert (=> b!623381 (arrayNoDuplicates!0 lt!289167 #b00000000000000000000000000000000 Nil!12128)))

(declare-fun lt!289169 () Unit!21028)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37688 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12131) Unit!21028)

(assert (=> b!623381 (= lt!289169 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12128))))

(assert (=> b!623381 (arrayContainsKey!0 lt!289167 (select (arr!18090 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!289164 () Unit!21028)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37688 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21028)

(assert (=> b!623381 (= lt!289164 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!289167 (select (arr!18090 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!21035 () Unit!21028)

(assert (=> b!623381 (= e!357562 Unit!21035)))

(declare-fun res!401749 () Bool)

(assert (=> start!56218 (=> (not res!401749) (not e!357557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56218 (= res!401749 (validMask!0 mask!3053))))

(assert (=> start!56218 e!357557))

(assert (=> start!56218 true))

(declare-fun array_inv!13886 (array!37688) Bool)

(assert (=> start!56218 (array_inv!13886 a!2986)))

(declare-fun b!623382 () Bool)

(declare-fun res!401754 () Bool)

(assert (=> b!623382 (=> (not res!401754) (not e!357553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37688 (_ BitVec 32)) Bool)

(assert (=> b!623382 (= res!401754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!623383 () Bool)

(declare-fun res!401762 () Bool)

(assert (=> b!623383 (=> (not res!401762) (not e!357557))))

(assert (=> b!623383 (= res!401762 (validKeyInArray!0 k!1786))))

(declare-fun b!623384 () Bool)

(assert (=> b!623384 false))

(declare-fun lt!289170 () Unit!21028)

(assert (=> b!623384 (= lt!289170 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!289167 (select (arr!18090 a!2986) j!136) index!984 Nil!12128))))

(assert (=> b!623384 (arrayNoDuplicates!0 lt!289167 index!984 Nil!12128)))

(declare-fun lt!289159 () Unit!21028)

(assert (=> b!623384 (= lt!289159 (lemmaNoDuplicateFromThenFromBigger!0 lt!289167 #b00000000000000000000000000000000 index!984))))

(assert (=> b!623384 (arrayNoDuplicates!0 lt!289167 #b00000000000000000000000000000000 Nil!12128)))

(declare-fun lt!289163 () Unit!21028)

(assert (=> b!623384 (= lt!289163 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12128))))

(assert (=> b!623384 (arrayContainsKey!0 lt!289167 (select (arr!18090 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!289162 () Unit!21028)

(assert (=> b!623384 (= lt!289162 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!289167 (select (arr!18090 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!623384 e!357558))

(declare-fun res!401751 () Bool)

(assert (=> b!623384 (=> (not res!401751) (not e!357558))))

(assert (=> b!623384 (= res!401751 (arrayContainsKey!0 lt!289167 (select (arr!18090 a!2986) j!136) j!136))))

(declare-fun Unit!21036 () Unit!21028)

(assert (=> b!623384 (= e!357564 Unit!21036)))

(declare-fun b!623385 () Bool)

(assert (=> b!623385 (= e!357555 (arrayContainsKey!0 lt!289167 (select (arr!18090 a!2986) j!136) index!984))))

(declare-fun b!623386 () Bool)

(assert (=> b!623386 (= e!357566 (= lt!289172 lt!289175))))

(declare-fun b!623387 () Bool)

(declare-fun Unit!21037 () Unit!21028)

(assert (=> b!623387 (= e!357564 Unit!21037)))

(assert (= (and start!56218 res!401749) b!623379))

(assert (= (and b!623379 res!401757) b!623376))

(assert (= (and b!623376 res!401756) b!623383))

(assert (= (and b!623383 res!401762) b!623371))

(assert (= (and b!623371 res!401764) b!623364))

(assert (= (and b!623364 res!401752) b!623382))

(assert (= (and b!623382 res!401754) b!623374))

(assert (= (and b!623374 res!401753) b!623380))

(assert (= (and b!623380 res!401763) b!623372))

(assert (= (and b!623372 res!401760) b!623368))

(assert (= (and b!623368 res!401765) b!623377))

(assert (= (and b!623377 res!401750) b!623386))

(assert (= (and b!623377 c!71175) b!623370))

(assert (= (and b!623377 (not c!71175)) b!623378))

(assert (= (and b!623377 c!71177) b!623373))

(assert (= (and b!623377 (not c!71177)) b!623369))

(assert (= (and b!623373 res!401759) b!623363))

(assert (= (and b!623363 (not res!401755)) b!623365))

(assert (= (and b!623365 res!401761) b!623385))

(assert (= (and b!623373 c!71176) b!623381))

(assert (= (and b!623373 (not c!71176)) b!623367))

(assert (= (and b!623373 c!71174) b!623384))

(assert (= (and b!623373 (not c!71174)) b!623387))

(assert (= (and b!623384 res!401751) b!623366))

(assert (= (and b!623377 (not res!401758)) b!623375))

(declare-fun m!599201 () Bool)

(assert (=> b!623371 m!599201))

(declare-fun m!599203 () Bool)

(assert (=> b!623375 m!599203))

(declare-fun m!599205 () Bool)

(assert (=> b!623364 m!599205))

(declare-fun m!599207 () Bool)

(assert (=> b!623368 m!599207))

(declare-fun m!599209 () Bool)

(assert (=> b!623368 m!599209))

(assert (=> b!623368 m!599209))

(declare-fun m!599211 () Bool)

(assert (=> b!623368 m!599211))

(declare-fun m!599213 () Bool)

(assert (=> b!623384 m!599213))

(assert (=> b!623384 m!599209))

(declare-fun m!599215 () Bool)

(assert (=> b!623384 m!599215))

(assert (=> b!623384 m!599209))

(declare-fun m!599217 () Bool)

(assert (=> b!623384 m!599217))

(assert (=> b!623384 m!599209))

(declare-fun m!599219 () Bool)

(assert (=> b!623384 m!599219))

(assert (=> b!623384 m!599209))

(declare-fun m!599221 () Bool)

(assert (=> b!623384 m!599221))

(declare-fun m!599223 () Bool)

(assert (=> b!623384 m!599223))

(assert (=> b!623384 m!599209))

(declare-fun m!599225 () Bool)

(assert (=> b!623384 m!599225))

(declare-fun m!599227 () Bool)

(assert (=> b!623384 m!599227))

(declare-fun m!599229 () Bool)

(assert (=> b!623383 m!599229))

(declare-fun m!599231 () Bool)

(assert (=> start!56218 m!599231))

(declare-fun m!599233 () Bool)

(assert (=> start!56218 m!599233))

(declare-fun m!599235 () Bool)

(assert (=> b!623374 m!599235))

(assert (=> b!623385 m!599209))

(assert (=> b!623385 m!599209))

(declare-fun m!599237 () Bool)

(assert (=> b!623385 m!599237))

(assert (=> b!623381 m!599209))

(assert (=> b!623381 m!599209))

(declare-fun m!599239 () Bool)

(assert (=> b!623381 m!599239))

(declare-fun m!599241 () Bool)

(assert (=> b!623381 m!599241))

(assert (=> b!623381 m!599209))

(declare-fun m!599243 () Bool)

(assert (=> b!623381 m!599243))

(assert (=> b!623381 m!599209))

(declare-fun m!599245 () Bool)

(assert (=> b!623381 m!599245))

(assert (=> b!623381 m!599213))

(declare-fun m!599247 () Bool)

(assert (=> b!623381 m!599247))

(assert (=> b!623381 m!599223))

(assert (=> b!623366 m!599209))

(assert (=> b!623366 m!599209))

(assert (=> b!623366 m!599237))

(assert (=> b!623376 m!599209))

(assert (=> b!623376 m!599209))

(declare-fun m!599249 () Bool)

(assert (=> b!623376 m!599249))

(declare-fun m!599251 () Bool)

(assert (=> b!623380 m!599251))

(declare-fun m!599253 () Bool)

(assert (=> b!623382 m!599253))

(assert (=> b!623365 m!599209))

(assert (=> b!623365 m!599209))

(assert (=> b!623365 m!599215))

(declare-fun m!599255 () Bool)

(assert (=> b!623372 m!599255))

(declare-fun m!599257 () Bool)

(assert (=> b!623372 m!599257))

(assert (=> b!623373 m!599255))

(declare-fun m!599259 () Bool)

(assert (=> b!623373 m!599259))

(assert (=> b!623373 m!599209))

(declare-fun m!599261 () Bool)

(assert (=> b!623377 m!599261))

(declare-fun m!599263 () Bool)

(assert (=> b!623377 m!599263))

(assert (=> b!623377 m!599209))

(assert (=> b!623377 m!599255))

(declare-fun m!599265 () Bool)

(assert (=> b!623377 m!599265))

(declare-fun m!599267 () Bool)

(assert (=> b!623377 m!599267))

(assert (=> b!623377 m!599209))

(declare-fun m!599269 () Bool)

(assert (=> b!623377 m!599269))

(declare-fun m!599271 () Bool)

(assert (=> b!623377 m!599271))

(push 1)

