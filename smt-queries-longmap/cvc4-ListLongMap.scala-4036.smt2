; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55010 () Bool)

(assert start!55010)

(declare-fun b!602135 () Bool)

(declare-fun e!344354 () Bool)

(declare-fun e!344360 () Bool)

(assert (=> b!602135 (= e!344354 e!344360)))

(declare-fun res!386617 () Bool)

(assert (=> b!602135 (=> (not res!386617) (not e!344360))))

(declare-datatypes ((SeekEntryResult!6280 0))(
  ( (MissingZero!6280 (index!27380 (_ BitVec 32))) (Found!6280 (index!27381 (_ BitVec 32))) (Intermediate!6280 (undefined!7092 Bool) (index!27382 (_ BitVec 32)) (x!56176 (_ BitVec 32))) (Undefined!6280) (MissingVacant!6280 (index!27383 (_ BitVec 32))) )
))
(declare-fun lt!274200 () SeekEntryResult!6280)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!602135 (= res!386617 (or (= lt!274200 (MissingZero!6280 i!1108)) (= lt!274200 (MissingVacant!6280 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!37164 0))(
  ( (array!37165 (arr!17840 (Array (_ BitVec 32) (_ BitVec 64))) (size!18204 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37164)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37164 (_ BitVec 32)) SeekEntryResult!6280)

(assert (=> b!602135 (= lt!274200 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!602136 () Bool)

(declare-fun e!344355 () Bool)

(declare-fun e!344351 () Bool)

(assert (=> b!602136 (= e!344355 e!344351)))

(declare-fun res!386629 () Bool)

(assert (=> b!602136 (=> res!386629 e!344351)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!602136 (= res!386629 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!19060 0))(
  ( (Unit!19061) )
))
(declare-fun lt!274212 () Unit!19060)

(declare-fun e!344358 () Unit!19060)

(assert (=> b!602136 (= lt!274212 e!344358)))

(declare-fun c!68129 () Bool)

(assert (=> b!602136 (= c!68129 (bvslt j!136 index!984))))

(declare-fun b!602137 () Bool)

(assert (=> b!602137 (= e!344351 true)))

(declare-fun lt!274205 () array!37164)

(declare-fun arrayContainsKey!0 (array!37164 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!602137 (arrayContainsKey!0 lt!274205 (select (arr!17840 a!2986) j!136) j!136)))

(declare-fun b!602138 () Bool)

(declare-fun Unit!19062 () Unit!19060)

(assert (=> b!602138 (= e!344358 Unit!19062)))

(declare-fun b!602139 () Bool)

(declare-fun e!344361 () Unit!19060)

(declare-fun Unit!19063 () Unit!19060)

(assert (=> b!602139 (= e!344361 Unit!19063)))

(declare-fun res!386620 () Bool)

(assert (=> start!55010 (=> (not res!386620) (not e!344354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55010 (= res!386620 (validMask!0 mask!3053))))

(assert (=> start!55010 e!344354))

(assert (=> start!55010 true))

(declare-fun array_inv!13636 (array!37164) Bool)

(assert (=> start!55010 (array_inv!13636 a!2986)))

(declare-fun b!602140 () Bool)

(declare-fun e!344349 () Bool)

(declare-fun e!344348 () Bool)

(assert (=> b!602140 (= e!344349 e!344348)))

(declare-fun res!386623 () Bool)

(assert (=> b!602140 (=> (not res!386623) (not e!344348))))

(declare-fun lt!274208 () SeekEntryResult!6280)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!602140 (= res!386623 (and (= lt!274208 (Found!6280 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17840 a!2986) index!984) (select (arr!17840 a!2986) j!136))) (not (= (select (arr!17840 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37164 (_ BitVec 32)) SeekEntryResult!6280)

(assert (=> b!602140 (= lt!274208 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17840 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!602141 () Bool)

(assert (=> b!602141 (= e!344360 e!344349)))

(declare-fun res!386618 () Bool)

(assert (=> b!602141 (=> (not res!386618) (not e!344349))))

(assert (=> b!602141 (= res!386618 (= (select (store (arr!17840 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602141 (= lt!274205 (array!37165 (store (arr!17840 a!2986) i!1108 k!1786) (size!18204 a!2986)))))

(declare-fun b!602142 () Bool)

(declare-fun e!344353 () Bool)

(declare-fun lt!274204 () SeekEntryResult!6280)

(assert (=> b!602142 (= e!344353 (= lt!274208 lt!274204))))

(declare-fun b!602143 () Bool)

(declare-fun e!344350 () Bool)

(assert (=> b!602143 (= e!344348 (not e!344350))))

(declare-fun res!386627 () Bool)

(assert (=> b!602143 (=> res!386627 e!344350)))

(declare-fun lt!274213 () SeekEntryResult!6280)

(assert (=> b!602143 (= res!386627 (not (= lt!274213 (Found!6280 index!984))))))

(declare-fun lt!274201 () Unit!19060)

(assert (=> b!602143 (= lt!274201 e!344361)))

(declare-fun c!68128 () Bool)

(assert (=> b!602143 (= c!68128 (= lt!274213 Undefined!6280))))

(declare-fun lt!274202 () (_ BitVec 64))

(assert (=> b!602143 (= lt!274213 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274202 lt!274205 mask!3053))))

(assert (=> b!602143 e!344353))

(declare-fun res!386624 () Bool)

(assert (=> b!602143 (=> (not res!386624) (not e!344353))))

(declare-fun lt!274199 () (_ BitVec 32))

(assert (=> b!602143 (= res!386624 (= lt!274204 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274199 vacantSpotIndex!68 lt!274202 lt!274205 mask!3053)))))

(assert (=> b!602143 (= lt!274204 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274199 vacantSpotIndex!68 (select (arr!17840 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!602143 (= lt!274202 (select (store (arr!17840 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!274209 () Unit!19060)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37164 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19060)

(assert (=> b!602143 (= lt!274209 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274199 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!602143 (= lt!274199 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!602144 () Bool)

(declare-fun e!344357 () Bool)

(declare-fun e!344359 () Bool)

(assert (=> b!602144 (= e!344357 e!344359)))

(declare-fun res!386616 () Bool)

(assert (=> b!602144 (=> res!386616 e!344359)))

(declare-fun lt!274206 () (_ BitVec 64))

(assert (=> b!602144 (= res!386616 (or (not (= (select (arr!17840 a!2986) j!136) lt!274202)) (not (= (select (arr!17840 a!2986) j!136) lt!274206)) (bvsge j!136 index!984)))))

(declare-fun b!602145 () Bool)

(declare-fun res!386622 () Bool)

(assert (=> b!602145 (=> (not res!386622) (not e!344354))))

(assert (=> b!602145 (= res!386622 (and (= (size!18204 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18204 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18204 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!602146 () Bool)

(declare-fun e!344356 () Bool)

(assert (=> b!602146 (= e!344356 (arrayContainsKey!0 lt!274205 (select (arr!17840 a!2986) j!136) index!984))))

(declare-fun b!602147 () Bool)

(assert (=> b!602147 (= e!344359 e!344356)))

(declare-fun res!386613 () Bool)

(assert (=> b!602147 (=> (not res!386613) (not e!344356))))

(assert (=> b!602147 (= res!386613 (arrayContainsKey!0 lt!274205 (select (arr!17840 a!2986) j!136) j!136))))

(declare-fun b!602148 () Bool)

(declare-fun res!386615 () Bool)

(assert (=> b!602148 (=> (not res!386615) (not e!344354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!602148 (= res!386615 (validKeyInArray!0 (select (arr!17840 a!2986) j!136)))))

(declare-fun b!602149 () Bool)

(declare-fun res!386628 () Bool)

(assert (=> b!602149 (=> (not res!386628) (not e!344360))))

(assert (=> b!602149 (= res!386628 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17840 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!602150 () Bool)

(declare-fun res!386619 () Bool)

(assert (=> b!602150 (=> (not res!386619) (not e!344354))))

(assert (=> b!602150 (= res!386619 (validKeyInArray!0 k!1786))))

(declare-fun b!602151 () Bool)

(declare-fun res!386621 () Bool)

(assert (=> b!602151 (=> (not res!386621) (not e!344360))))

(declare-datatypes ((List!11881 0))(
  ( (Nil!11878) (Cons!11877 (h!12922 (_ BitVec 64)) (t!18109 List!11881)) )
))
(declare-fun arrayNoDuplicates!0 (array!37164 (_ BitVec 32) List!11881) Bool)

(assert (=> b!602151 (= res!386621 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11878))))

(declare-fun b!602152 () Bool)

(assert (=> b!602152 (= e!344350 e!344355)))

(declare-fun res!386625 () Bool)

(assert (=> b!602152 (=> res!386625 e!344355)))

(assert (=> b!602152 (= res!386625 (or (not (= (select (arr!17840 a!2986) j!136) lt!274202)) (not (= (select (arr!17840 a!2986) j!136) lt!274206))))))

(assert (=> b!602152 e!344357))

(declare-fun res!386630 () Bool)

(assert (=> b!602152 (=> (not res!386630) (not e!344357))))

(assert (=> b!602152 (= res!386630 (= lt!274206 (select (arr!17840 a!2986) j!136)))))

(assert (=> b!602152 (= lt!274206 (select (store (arr!17840 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!602153 () Bool)

(declare-fun res!386614 () Bool)

(assert (=> b!602153 (=> (not res!386614) (not e!344360))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37164 (_ BitVec 32)) Bool)

(assert (=> b!602153 (= res!386614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!602154 () Bool)

(declare-fun res!386626 () Bool)

(assert (=> b!602154 (=> (not res!386626) (not e!344354))))

(assert (=> b!602154 (= res!386626 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!602155 () Bool)

(declare-fun Unit!19064 () Unit!19060)

(assert (=> b!602155 (= e!344361 Unit!19064)))

(assert (=> b!602155 false))

(declare-fun b!602156 () Bool)

(declare-fun Unit!19065 () Unit!19060)

(assert (=> b!602156 (= e!344358 Unit!19065)))

(declare-fun lt!274203 () Unit!19060)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37164 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19060)

(assert (=> b!602156 (= lt!274203 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274205 (select (arr!17840 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!602156 (arrayContainsKey!0 lt!274205 (select (arr!17840 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274207 () Unit!19060)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37164 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11881) Unit!19060)

(assert (=> b!602156 (= lt!274207 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11878))))

(assert (=> b!602156 (arrayNoDuplicates!0 lt!274205 #b00000000000000000000000000000000 Nil!11878)))

(declare-fun lt!274211 () Unit!19060)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37164 (_ BitVec 32) (_ BitVec 32)) Unit!19060)

(assert (=> b!602156 (= lt!274211 (lemmaNoDuplicateFromThenFromBigger!0 lt!274205 #b00000000000000000000000000000000 j!136))))

(assert (=> b!602156 (arrayNoDuplicates!0 lt!274205 j!136 Nil!11878)))

(declare-fun lt!274210 () Unit!19060)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37164 (_ BitVec 64) (_ BitVec 32) List!11881) Unit!19060)

(assert (=> b!602156 (= lt!274210 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274205 (select (arr!17840 a!2986) j!136) j!136 Nil!11878))))

(assert (=> b!602156 false))

(assert (= (and start!55010 res!386620) b!602145))

(assert (= (and b!602145 res!386622) b!602148))

(assert (= (and b!602148 res!386615) b!602150))

(assert (= (and b!602150 res!386619) b!602154))

(assert (= (and b!602154 res!386626) b!602135))

(assert (= (and b!602135 res!386617) b!602153))

(assert (= (and b!602153 res!386614) b!602151))

(assert (= (and b!602151 res!386621) b!602149))

(assert (= (and b!602149 res!386628) b!602141))

(assert (= (and b!602141 res!386618) b!602140))

(assert (= (and b!602140 res!386623) b!602143))

(assert (= (and b!602143 res!386624) b!602142))

(assert (= (and b!602143 c!68128) b!602155))

(assert (= (and b!602143 (not c!68128)) b!602139))

(assert (= (and b!602143 (not res!386627)) b!602152))

(assert (= (and b!602152 res!386630) b!602144))

(assert (= (and b!602144 (not res!386616)) b!602147))

(assert (= (and b!602147 res!386613) b!602146))

(assert (= (and b!602152 (not res!386625)) b!602136))

(assert (= (and b!602136 c!68129) b!602156))

(assert (= (and b!602136 (not c!68129)) b!602138))

(assert (= (and b!602136 (not res!386629)) b!602137))

(declare-fun m!579281 () Bool)

(assert (=> b!602140 m!579281))

(declare-fun m!579283 () Bool)

(assert (=> b!602140 m!579283))

(assert (=> b!602140 m!579283))

(declare-fun m!579285 () Bool)

(assert (=> b!602140 m!579285))

(declare-fun m!579287 () Bool)

(assert (=> b!602149 m!579287))

(assert (=> b!602147 m!579283))

(assert (=> b!602147 m!579283))

(declare-fun m!579289 () Bool)

(assert (=> b!602147 m!579289))

(declare-fun m!579291 () Bool)

(assert (=> b!602150 m!579291))

(declare-fun m!579293 () Bool)

(assert (=> b!602154 m!579293))

(declare-fun m!579295 () Bool)

(assert (=> b!602153 m!579295))

(assert (=> b!602152 m!579283))

(declare-fun m!579297 () Bool)

(assert (=> b!602152 m!579297))

(declare-fun m!579299 () Bool)

(assert (=> b!602152 m!579299))

(declare-fun m!579301 () Bool)

(assert (=> b!602151 m!579301))

(assert (=> b!602148 m!579283))

(assert (=> b!602148 m!579283))

(declare-fun m!579303 () Bool)

(assert (=> b!602148 m!579303))

(declare-fun m!579305 () Bool)

(assert (=> start!55010 m!579305))

(declare-fun m!579307 () Bool)

(assert (=> start!55010 m!579307))

(assert (=> b!602141 m!579297))

(declare-fun m!579309 () Bool)

(assert (=> b!602141 m!579309))

(assert (=> b!602156 m!579283))

(declare-fun m!579311 () Bool)

(assert (=> b!602156 m!579311))

(assert (=> b!602156 m!579283))

(declare-fun m!579313 () Bool)

(assert (=> b!602156 m!579313))

(assert (=> b!602156 m!579283))

(declare-fun m!579315 () Bool)

(assert (=> b!602156 m!579315))

(assert (=> b!602156 m!579283))

(declare-fun m!579317 () Bool)

(assert (=> b!602156 m!579317))

(declare-fun m!579319 () Bool)

(assert (=> b!602156 m!579319))

(declare-fun m!579321 () Bool)

(assert (=> b!602156 m!579321))

(declare-fun m!579323 () Bool)

(assert (=> b!602156 m!579323))

(declare-fun m!579325 () Bool)

(assert (=> b!602143 m!579325))

(declare-fun m!579327 () Bool)

(assert (=> b!602143 m!579327))

(assert (=> b!602143 m!579283))

(declare-fun m!579329 () Bool)

(assert (=> b!602143 m!579329))

(assert (=> b!602143 m!579297))

(declare-fun m!579331 () Bool)

(assert (=> b!602143 m!579331))

(assert (=> b!602143 m!579283))

(declare-fun m!579333 () Bool)

(assert (=> b!602143 m!579333))

(declare-fun m!579335 () Bool)

(assert (=> b!602143 m!579335))

(assert (=> b!602144 m!579283))

(assert (=> b!602146 m!579283))

(assert (=> b!602146 m!579283))

(declare-fun m!579337 () Bool)

(assert (=> b!602146 m!579337))

(assert (=> b!602137 m!579283))

(assert (=> b!602137 m!579283))

(assert (=> b!602137 m!579289))

(declare-fun m!579339 () Bool)

(assert (=> b!602135 m!579339))

(push 1)

