; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59102 () Bool)

(assert start!59102)

(declare-fun b!652156 () Bool)

(declare-fun e!374293 () Bool)

(declare-fun e!374291 () Bool)

(assert (=> b!652156 (= e!374293 e!374291)))

(declare-fun res!422887 () Bool)

(assert (=> b!652156 (=> res!422887 e!374291)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!303386 () (_ BitVec 64))

(declare-fun lt!303390 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38602 0))(
  ( (array!38603 (arr!18504 (Array (_ BitVec 32) (_ BitVec 64))) (size!18868 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38602)

(assert (=> b!652156 (= res!422887 (or (not (= (select (arr!18504 a!2986) j!136) lt!303386)) (not (= (select (arr!18504 a!2986) j!136) lt!303390)) (bvsge j!136 index!984)))))

(declare-fun e!374290 () Bool)

(declare-fun lt!303391 () array!38602)

(declare-fun b!652157 () Bool)

(declare-fun arrayContainsKey!0 (array!38602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!652157 (= e!374290 (arrayContainsKey!0 lt!303391 (select (arr!18504 a!2986) j!136) index!984))))

(declare-fun res!422890 () Bool)

(declare-fun e!374300 () Bool)

(assert (=> start!59102 (=> (not res!422890) (not e!374300))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59102 (= res!422890 (validMask!0 mask!3053))))

(assert (=> start!59102 e!374300))

(assert (=> start!59102 true))

(declare-fun array_inv!14300 (array!38602) Bool)

(assert (=> start!59102 (array_inv!14300 a!2986)))

(declare-fun b!652158 () Bool)

(declare-datatypes ((Unit!22290 0))(
  ( (Unit!22291) )
))
(declare-fun e!374289 () Unit!22290)

(declare-fun Unit!22292 () Unit!22290)

(assert (=> b!652158 (= e!374289 Unit!22292)))

(declare-fun lt!303388 () Unit!22290)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38602 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22290)

(assert (=> b!652158 (= lt!303388 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303391 (select (arr!18504 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!652158 (arrayContainsKey!0 lt!303391 (select (arr!18504 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!303394 () Unit!22290)

(declare-datatypes ((List!12545 0))(
  ( (Nil!12542) (Cons!12541 (h!13586 (_ BitVec 64)) (t!18773 List!12545)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38602 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12545) Unit!22290)

(assert (=> b!652158 (= lt!303394 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12542))))

(declare-fun arrayNoDuplicates!0 (array!38602 (_ BitVec 32) List!12545) Bool)

(assert (=> b!652158 (arrayNoDuplicates!0 lt!303391 #b00000000000000000000000000000000 Nil!12542)))

(declare-fun lt!303396 () Unit!22290)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38602 (_ BitVec 32) (_ BitVec 32)) Unit!22290)

(assert (=> b!652158 (= lt!303396 (lemmaNoDuplicateFromThenFromBigger!0 lt!303391 #b00000000000000000000000000000000 j!136))))

(assert (=> b!652158 (arrayNoDuplicates!0 lt!303391 j!136 Nil!12542)))

(declare-fun lt!303402 () Unit!22290)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38602 (_ BitVec 64) (_ BitVec 32) List!12545) Unit!22290)

(assert (=> b!652158 (= lt!303402 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303391 (select (arr!18504 a!2986) j!136) j!136 Nil!12542))))

(assert (=> b!652158 false))

(declare-fun b!652159 () Bool)

(declare-fun res!422880 () Bool)

(assert (=> b!652159 (=> (not res!422880) (not e!374300))))

(assert (=> b!652159 (= res!422880 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!652160 () Bool)

(declare-fun res!422889 () Bool)

(assert (=> b!652160 (=> (not res!422889) (not e!374300))))

(assert (=> b!652160 (= res!422889 (and (= (size!18868 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18868 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18868 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!652161 () Bool)

(declare-fun e!374287 () Bool)

(declare-fun e!374299 () Bool)

(assert (=> b!652161 (= e!374287 (not e!374299))))

(declare-fun res!422883 () Bool)

(assert (=> b!652161 (=> res!422883 e!374299)))

(declare-datatypes ((SeekEntryResult!6944 0))(
  ( (MissingZero!6944 (index!30129 (_ BitVec 32))) (Found!6944 (index!30130 (_ BitVec 32))) (Intermediate!6944 (undefined!7756 Bool) (index!30131 (_ BitVec 32)) (x!58919 (_ BitVec 32))) (Undefined!6944) (MissingVacant!6944 (index!30132 (_ BitVec 32))) )
))
(declare-fun lt!303392 () SeekEntryResult!6944)

(assert (=> b!652161 (= res!422883 (not (= lt!303392 (Found!6944 index!984))))))

(declare-fun lt!303400 () Unit!22290)

(declare-fun e!374288 () Unit!22290)

(assert (=> b!652161 (= lt!303400 e!374288)))

(declare-fun c!75007 () Bool)

(assert (=> b!652161 (= c!75007 (= lt!303392 Undefined!6944))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38602 (_ BitVec 32)) SeekEntryResult!6944)

(assert (=> b!652161 (= lt!303392 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303386 lt!303391 mask!3053))))

(declare-fun e!374294 () Bool)

(assert (=> b!652161 e!374294))

(declare-fun res!422881 () Bool)

(assert (=> b!652161 (=> (not res!422881) (not e!374294))))

(declare-fun lt!303395 () (_ BitVec 32))

(declare-fun lt!303397 () SeekEntryResult!6944)

(assert (=> b!652161 (= res!422881 (= lt!303397 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303395 vacantSpotIndex!68 lt!303386 lt!303391 mask!3053)))))

(assert (=> b!652161 (= lt!303397 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303395 vacantSpotIndex!68 (select (arr!18504 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!652161 (= lt!303386 (select (store (arr!18504 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!303401 () Unit!22290)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38602 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22290)

(assert (=> b!652161 (= lt!303401 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303395 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!652161 (= lt!303395 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!652162 () Bool)

(declare-fun res!422878 () Bool)

(declare-fun e!374296 () Bool)

(assert (=> b!652162 (=> (not res!422878) (not e!374296))))

(assert (=> b!652162 (= res!422878 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18504 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!652163 () Bool)

(declare-fun Unit!22293 () Unit!22290)

(assert (=> b!652163 (= e!374289 Unit!22293)))

(declare-fun b!652164 () Bool)

(declare-fun res!422893 () Bool)

(assert (=> b!652164 (=> (not res!422893) (not e!374296))))

(assert (=> b!652164 (= res!422893 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12542))))

(declare-fun b!652165 () Bool)

(declare-fun res!422882 () Bool)

(assert (=> b!652165 (=> (not res!422882) (not e!374300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!652165 (= res!422882 (validKeyInArray!0 k!1786))))

(declare-fun b!652166 () Bool)

(declare-fun res!422876 () Bool)

(assert (=> b!652166 (=> (not res!422876) (not e!374296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38602 (_ BitVec 32)) Bool)

(assert (=> b!652166 (= res!422876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!652167 () Bool)

(declare-fun e!374297 () Bool)

(declare-fun e!374292 () Bool)

(assert (=> b!652167 (= e!374297 e!374292)))

(declare-fun res!422892 () Bool)

(assert (=> b!652167 (=> res!422892 e!374292)))

(assert (=> b!652167 (= res!422892 (bvsge index!984 j!136))))

(declare-fun lt!303389 () Unit!22290)

(assert (=> b!652167 (= lt!303389 e!374289)))

(declare-fun c!75008 () Bool)

(assert (=> b!652167 (= c!75008 (bvslt j!136 index!984))))

(declare-fun b!652168 () Bool)

(assert (=> b!652168 (= e!374292 (or (bvsge (size!18868 a!2986) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 index!984) (size!18868 a!2986))))))

(assert (=> b!652168 (arrayNoDuplicates!0 lt!303391 index!984 Nil!12542)))

(declare-fun lt!303399 () Unit!22290)

(assert (=> b!652168 (= lt!303399 (lemmaNoDuplicateFromThenFromBigger!0 lt!303391 #b00000000000000000000000000000000 index!984))))

(assert (=> b!652168 (arrayNoDuplicates!0 lt!303391 #b00000000000000000000000000000000 Nil!12542)))

(declare-fun lt!303393 () Unit!22290)

(assert (=> b!652168 (= lt!303393 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12542))))

(assert (=> b!652168 (arrayContainsKey!0 lt!303391 (select (arr!18504 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303387 () Unit!22290)

(assert (=> b!652168 (= lt!303387 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303391 (select (arr!18504 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!374298 () Bool)

(assert (=> b!652168 e!374298))

(declare-fun res!422888 () Bool)

(assert (=> b!652168 (=> (not res!422888) (not e!374298))))

(assert (=> b!652168 (= res!422888 (arrayContainsKey!0 lt!303391 (select (arr!18504 a!2986) j!136) j!136))))

(declare-fun b!652169 () Bool)

(declare-fun Unit!22294 () Unit!22290)

(assert (=> b!652169 (= e!374288 Unit!22294)))

(declare-fun b!652170 () Bool)

(assert (=> b!652170 (= e!374298 (arrayContainsKey!0 lt!303391 (select (arr!18504 a!2986) j!136) index!984))))

(declare-fun b!652171 () Bool)

(assert (=> b!652171 (= e!374300 e!374296)))

(declare-fun res!422886 () Bool)

(assert (=> b!652171 (=> (not res!422886) (not e!374296))))

(declare-fun lt!303398 () SeekEntryResult!6944)

(assert (=> b!652171 (= res!422886 (or (= lt!303398 (MissingZero!6944 i!1108)) (= lt!303398 (MissingVacant!6944 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38602 (_ BitVec 32)) SeekEntryResult!6944)

(assert (=> b!652171 (= lt!303398 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!652172 () Bool)

(declare-fun e!374301 () Bool)

(assert (=> b!652172 (= e!374301 e!374287)))

(declare-fun res!422885 () Bool)

(assert (=> b!652172 (=> (not res!422885) (not e!374287))))

(declare-fun lt!303403 () SeekEntryResult!6944)

(assert (=> b!652172 (= res!422885 (and (= lt!303403 (Found!6944 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18504 a!2986) index!984) (select (arr!18504 a!2986) j!136))) (not (= (select (arr!18504 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!652172 (= lt!303403 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18504 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!652173 () Bool)

(declare-fun res!422879 () Bool)

(assert (=> b!652173 (=> (not res!422879) (not e!374300))))

(assert (=> b!652173 (= res!422879 (validKeyInArray!0 (select (arr!18504 a!2986) j!136)))))

(declare-fun b!652174 () Bool)

(assert (=> b!652174 (= e!374291 e!374290)))

(declare-fun res!422894 () Bool)

(assert (=> b!652174 (=> (not res!422894) (not e!374290))))

(assert (=> b!652174 (= res!422894 (arrayContainsKey!0 lt!303391 (select (arr!18504 a!2986) j!136) j!136))))

(declare-fun b!652175 () Bool)

(assert (=> b!652175 (= e!374299 e!374297)))

(declare-fun res!422884 () Bool)

(assert (=> b!652175 (=> res!422884 e!374297)))

(assert (=> b!652175 (= res!422884 (or (not (= (select (arr!18504 a!2986) j!136) lt!303386)) (not (= (select (arr!18504 a!2986) j!136) lt!303390))))))

(assert (=> b!652175 e!374293))

(declare-fun res!422891 () Bool)

(assert (=> b!652175 (=> (not res!422891) (not e!374293))))

(assert (=> b!652175 (= res!422891 (= lt!303390 (select (arr!18504 a!2986) j!136)))))

(assert (=> b!652175 (= lt!303390 (select (store (arr!18504 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!652176 () Bool)

(assert (=> b!652176 (= e!374296 e!374301)))

(declare-fun res!422877 () Bool)

(assert (=> b!652176 (=> (not res!422877) (not e!374301))))

(assert (=> b!652176 (= res!422877 (= (select (store (arr!18504 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!652176 (= lt!303391 (array!38603 (store (arr!18504 a!2986) i!1108 k!1786) (size!18868 a!2986)))))

(declare-fun b!652177 () Bool)

(declare-fun Unit!22295 () Unit!22290)

(assert (=> b!652177 (= e!374288 Unit!22295)))

(assert (=> b!652177 false))

(declare-fun b!652178 () Bool)

(assert (=> b!652178 (= e!374294 (= lt!303403 lt!303397))))

(assert (= (and start!59102 res!422890) b!652160))

(assert (= (and b!652160 res!422889) b!652173))

(assert (= (and b!652173 res!422879) b!652165))

(assert (= (and b!652165 res!422882) b!652159))

(assert (= (and b!652159 res!422880) b!652171))

(assert (= (and b!652171 res!422886) b!652166))

(assert (= (and b!652166 res!422876) b!652164))

(assert (= (and b!652164 res!422893) b!652162))

(assert (= (and b!652162 res!422878) b!652176))

(assert (= (and b!652176 res!422877) b!652172))

(assert (= (and b!652172 res!422885) b!652161))

(assert (= (and b!652161 res!422881) b!652178))

(assert (= (and b!652161 c!75007) b!652177))

(assert (= (and b!652161 (not c!75007)) b!652169))

(assert (= (and b!652161 (not res!422883)) b!652175))

(assert (= (and b!652175 res!422891) b!652156))

(assert (= (and b!652156 (not res!422887)) b!652174))

(assert (= (and b!652174 res!422894) b!652157))

(assert (= (and b!652175 (not res!422884)) b!652167))

(assert (= (and b!652167 c!75008) b!652158))

(assert (= (and b!652167 (not c!75008)) b!652163))

(assert (= (and b!652167 (not res!422892)) b!652168))

(assert (= (and b!652168 res!422888) b!652170))

(declare-fun m!625301 () Bool)

(assert (=> b!652158 m!625301))

(assert (=> b!652158 m!625301))

(declare-fun m!625303 () Bool)

(assert (=> b!652158 m!625303))

(assert (=> b!652158 m!625301))

(declare-fun m!625305 () Bool)

(assert (=> b!652158 m!625305))

(assert (=> b!652158 m!625301))

(declare-fun m!625307 () Bool)

(assert (=> b!652158 m!625307))

(declare-fun m!625309 () Bool)

(assert (=> b!652158 m!625309))

(declare-fun m!625311 () Bool)

(assert (=> b!652158 m!625311))

(declare-fun m!625313 () Bool)

(assert (=> b!652158 m!625313))

(declare-fun m!625315 () Bool)

(assert (=> b!652158 m!625315))

(assert (=> b!652157 m!625301))

(assert (=> b!652157 m!625301))

(declare-fun m!625317 () Bool)

(assert (=> b!652157 m!625317))

(declare-fun m!625319 () Bool)

(assert (=> b!652162 m!625319))

(declare-fun m!625321 () Bool)

(assert (=> b!652164 m!625321))

(declare-fun m!625323 () Bool)

(assert (=> b!652172 m!625323))

(assert (=> b!652172 m!625301))

(assert (=> b!652172 m!625301))

(declare-fun m!625325 () Bool)

(assert (=> b!652172 m!625325))

(assert (=> b!652168 m!625313))

(assert (=> b!652168 m!625301))

(assert (=> b!652168 m!625301))

(declare-fun m!625327 () Bool)

(assert (=> b!652168 m!625327))

(declare-fun m!625329 () Bool)

(assert (=> b!652168 m!625329))

(declare-fun m!625331 () Bool)

(assert (=> b!652168 m!625331))

(assert (=> b!652168 m!625301))

(declare-fun m!625333 () Bool)

(assert (=> b!652168 m!625333))

(assert (=> b!652168 m!625301))

(declare-fun m!625335 () Bool)

(assert (=> b!652168 m!625335))

(assert (=> b!652168 m!625311))

(declare-fun m!625337 () Bool)

(assert (=> b!652176 m!625337))

(declare-fun m!625339 () Bool)

(assert (=> b!652176 m!625339))

(assert (=> b!652173 m!625301))

(assert (=> b!652173 m!625301))

(declare-fun m!625341 () Bool)

(assert (=> b!652173 m!625341))

(assert (=> b!652156 m!625301))

(declare-fun m!625343 () Bool)

(assert (=> b!652159 m!625343))

(declare-fun m!625345 () Bool)

(assert (=> b!652165 m!625345))

(declare-fun m!625347 () Bool)

(assert (=> b!652161 m!625347))

(declare-fun m!625349 () Bool)

(assert (=> b!652161 m!625349))

(declare-fun m!625351 () Bool)

(assert (=> b!652161 m!625351))

(assert (=> b!652161 m!625301))

(assert (=> b!652161 m!625337))

(declare-fun m!625353 () Bool)

(assert (=> b!652161 m!625353))

(declare-fun m!625355 () Bool)

(assert (=> b!652161 m!625355))

(assert (=> b!652161 m!625301))

(declare-fun m!625357 () Bool)

(assert (=> b!652161 m!625357))

(assert (=> b!652175 m!625301))

(assert (=> b!652175 m!625337))

(declare-fun m!625359 () Bool)

(assert (=> b!652175 m!625359))

(assert (=> b!652174 m!625301))

(assert (=> b!652174 m!625301))

(assert (=> b!652174 m!625333))

(declare-fun m!625361 () Bool)

(assert (=> start!59102 m!625361))

(declare-fun m!625363 () Bool)

(assert (=> start!59102 m!625363))

(declare-fun m!625365 () Bool)

(assert (=> b!652171 m!625365))

(declare-fun m!625367 () Bool)

(assert (=> b!652166 m!625367))

(assert (=> b!652170 m!625301))

(assert (=> b!652170 m!625301))

(assert (=> b!652170 m!625317))

(push 1)

(assert (not b!652157))

(assert (not b!652173))

(assert (not b!652170))

(assert (not b!652161))

(assert (not b!652158))

(assert (not b!652165))

(assert (not b!652172))

(assert (not b!652174))

(assert (not b!652168))

(assert (not b!652159))

(assert (not b!652166))

(assert (not start!59102))

(assert (not b!652171))

(assert (not b!652164))

(check-sat)

(pop 1)

(push 1)

(check-sat)

