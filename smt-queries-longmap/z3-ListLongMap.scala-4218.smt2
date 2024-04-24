; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57882 () Bool)

(assert start!57882)

(declare-fun b!639985 () Bool)

(declare-fun e!366310 () Bool)

(declare-fun e!366307 () Bool)

(assert (=> b!639985 (= e!366310 e!366307)))

(declare-fun res!414386 () Bool)

(assert (=> b!639985 (=> res!414386 e!366307)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!296129 () (_ BitVec 64))

(declare-fun lt!296123 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38322 0))(
  ( (array!38323 (arr!18379 (Array (_ BitVec 32) (_ BitVec 64))) (size!18743 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38322)

(assert (=> b!639985 (= res!414386 (or (not (= (select (arr!18379 a!2986) j!136) lt!296123)) (not (= (select (arr!18379 a!2986) j!136) lt!296129)) (bvsge j!136 index!984)))))

(declare-fun b!639986 () Bool)

(declare-fun e!366314 () Bool)

(assert (=> b!639986 (= e!366314 (bvslt (size!18743 a!2986) #b01111111111111111111111111111111))))

(declare-fun lt!296121 () array!38322)

(declare-datatypes ((List!12327 0))(
  ( (Nil!12324) (Cons!12323 (h!13371 (_ BitVec 64)) (t!18547 List!12327)) )
))
(declare-fun arrayNoDuplicates!0 (array!38322 (_ BitVec 32) List!12327) Bool)

(assert (=> b!639986 (arrayNoDuplicates!0 lt!296121 j!136 Nil!12324)))

(declare-datatypes ((Unit!21609 0))(
  ( (Unit!21610) )
))
(declare-fun lt!296124 () Unit!21609)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38322 (_ BitVec 32) (_ BitVec 32)) Unit!21609)

(assert (=> b!639986 (= lt!296124 (lemmaNoDuplicateFromThenFromBigger!0 lt!296121 #b00000000000000000000000000000000 j!136))))

(assert (=> b!639986 (arrayNoDuplicates!0 lt!296121 #b00000000000000000000000000000000 Nil!12324)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!296120 () Unit!21609)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38322 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12327) Unit!21609)

(assert (=> b!639986 (= lt!296120 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12324))))

(declare-fun arrayContainsKey!0 (array!38322 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!639986 (arrayContainsKey!0 lt!296121 (select (arr!18379 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296127 () Unit!21609)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38322 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21609)

(assert (=> b!639986 (= lt!296127 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296121 (select (arr!18379 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!639987 () Bool)

(declare-fun res!414392 () Bool)

(declare-fun e!366315 () Bool)

(assert (=> b!639987 (=> (not res!414392) (not e!366315))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!639987 (= res!414392 (validKeyInArray!0 (select (arr!18379 a!2986) j!136)))))

(declare-fun b!639988 () Bool)

(declare-fun res!414390 () Bool)

(declare-fun e!366309 () Bool)

(assert (=> b!639988 (=> (not res!414390) (not e!366309))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!639988 (= res!414390 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18379 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!414389 () Bool)

(assert (=> start!57882 (=> (not res!414389) (not e!366315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57882 (= res!414389 (validMask!0 mask!3053))))

(assert (=> start!57882 e!366315))

(assert (=> start!57882 true))

(declare-fun array_inv!14238 (array!38322) Bool)

(assert (=> start!57882 (array_inv!14238 a!2986)))

(declare-fun b!639989 () Bool)

(assert (=> b!639989 (= e!366315 e!366309)))

(declare-fun res!414400 () Bool)

(assert (=> b!639989 (=> (not res!414400) (not e!366309))))

(declare-datatypes ((SeekEntryResult!6775 0))(
  ( (MissingZero!6775 (index!29417 (_ BitVec 32))) (Found!6775 (index!29418 (_ BitVec 32))) (Intermediate!6775 (undefined!7587 Bool) (index!29419 (_ BitVec 32)) (x!58325 (_ BitVec 32))) (Undefined!6775) (MissingVacant!6775 (index!29420 (_ BitVec 32))) )
))
(declare-fun lt!296128 () SeekEntryResult!6775)

(assert (=> b!639989 (= res!414400 (or (= lt!296128 (MissingZero!6775 i!1108)) (= lt!296128 (MissingVacant!6775 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38322 (_ BitVec 32)) SeekEntryResult!6775)

(assert (=> b!639989 (= lt!296128 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun e!366305 () Bool)

(declare-fun b!639990 () Bool)

(assert (=> b!639990 (= e!366305 (arrayContainsKey!0 lt!296121 (select (arr!18379 a!2986) j!136) index!984))))

(declare-fun b!639991 () Bool)

(declare-fun e!366311 () Bool)

(declare-fun e!366308 () Bool)

(assert (=> b!639991 (= e!366311 e!366308)))

(declare-fun res!414394 () Bool)

(assert (=> b!639991 (=> (not res!414394) (not e!366308))))

(declare-fun lt!296119 () SeekEntryResult!6775)

(assert (=> b!639991 (= res!414394 (and (= lt!296119 (Found!6775 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18379 a!2986) index!984) (select (arr!18379 a!2986) j!136))) (not (= (select (arr!18379 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38322 (_ BitVec 32)) SeekEntryResult!6775)

(assert (=> b!639991 (= lt!296119 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18379 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!639992 () Bool)

(declare-fun res!414395 () Bool)

(assert (=> b!639992 (=> (not res!414395) (not e!366315))))

(assert (=> b!639992 (= res!414395 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!639993 () Bool)

(declare-fun e!366313 () Unit!21609)

(declare-fun Unit!21611 () Unit!21609)

(assert (=> b!639993 (= e!366313 Unit!21611)))

(declare-fun b!639994 () Bool)

(declare-fun res!414385 () Bool)

(assert (=> b!639994 (=> (not res!414385) (not e!366315))))

(assert (=> b!639994 (= res!414385 (validKeyInArray!0 k0!1786))))

(declare-fun b!639995 () Bool)

(declare-fun res!414387 () Bool)

(assert (=> b!639995 (=> (not res!414387) (not e!366309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38322 (_ BitVec 32)) Bool)

(assert (=> b!639995 (= res!414387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!639996 () Bool)

(declare-fun res!414393 () Bool)

(assert (=> b!639996 (=> (not res!414393) (not e!366309))))

(assert (=> b!639996 (= res!414393 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12324))))

(declare-fun b!639997 () Bool)

(declare-fun e!366306 () Bool)

(assert (=> b!639997 (= e!366306 e!366314)))

(declare-fun res!414398 () Bool)

(assert (=> b!639997 (=> res!414398 e!366314)))

(assert (=> b!639997 (= res!414398 (or (not (= (select (arr!18379 a!2986) j!136) lt!296123)) (not (= (select (arr!18379 a!2986) j!136) lt!296129)) (bvsge j!136 index!984)))))

(assert (=> b!639997 e!366310))

(declare-fun res!414397 () Bool)

(assert (=> b!639997 (=> (not res!414397) (not e!366310))))

(assert (=> b!639997 (= res!414397 (= lt!296129 (select (arr!18379 a!2986) j!136)))))

(assert (=> b!639997 (= lt!296129 (select (store (arr!18379 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!639998 () Bool)

(declare-fun res!414388 () Bool)

(assert (=> b!639998 (=> (not res!414388) (not e!366315))))

(assert (=> b!639998 (= res!414388 (and (= (size!18743 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18743 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18743 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!639999 () Bool)

(assert (=> b!639999 (= e!366307 e!366305)))

(declare-fun res!414399 () Bool)

(assert (=> b!639999 (=> (not res!414399) (not e!366305))))

(assert (=> b!639999 (= res!414399 (arrayContainsKey!0 lt!296121 (select (arr!18379 a!2986) j!136) j!136))))

(declare-fun b!640000 () Bool)

(declare-fun e!366312 () Bool)

(declare-fun lt!296131 () SeekEntryResult!6775)

(assert (=> b!640000 (= e!366312 (= lt!296119 lt!296131))))

(declare-fun b!640001 () Bool)

(declare-fun Unit!21612 () Unit!21609)

(assert (=> b!640001 (= e!366313 Unit!21612)))

(assert (=> b!640001 false))

(declare-fun b!640002 () Bool)

(assert (=> b!640002 (= e!366309 e!366311)))

(declare-fun res!414391 () Bool)

(assert (=> b!640002 (=> (not res!414391) (not e!366311))))

(assert (=> b!640002 (= res!414391 (= (select (store (arr!18379 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!640002 (= lt!296121 (array!38323 (store (arr!18379 a!2986) i!1108 k0!1786) (size!18743 a!2986)))))

(declare-fun b!640003 () Bool)

(assert (=> b!640003 (= e!366308 (not e!366306))))

(declare-fun res!414396 () Bool)

(assert (=> b!640003 (=> res!414396 e!366306)))

(declare-fun lt!296122 () SeekEntryResult!6775)

(assert (=> b!640003 (= res!414396 (not (= lt!296122 (Found!6775 index!984))))))

(declare-fun lt!296130 () Unit!21609)

(assert (=> b!640003 (= lt!296130 e!366313)))

(declare-fun c!73169 () Bool)

(assert (=> b!640003 (= c!73169 (= lt!296122 Undefined!6775))))

(assert (=> b!640003 (= lt!296122 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296123 lt!296121 mask!3053))))

(assert (=> b!640003 e!366312))

(declare-fun res!414384 () Bool)

(assert (=> b!640003 (=> (not res!414384) (not e!366312))))

(declare-fun lt!296125 () (_ BitVec 32))

(assert (=> b!640003 (= res!414384 (= lt!296131 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296125 vacantSpotIndex!68 lt!296123 lt!296121 mask!3053)))))

(assert (=> b!640003 (= lt!296131 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296125 vacantSpotIndex!68 (select (arr!18379 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!640003 (= lt!296123 (select (store (arr!18379 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!296126 () Unit!21609)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38322 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21609)

(assert (=> b!640003 (= lt!296126 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296125 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!640003 (= lt!296125 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (= (and start!57882 res!414389) b!639998))

(assert (= (and b!639998 res!414388) b!639987))

(assert (= (and b!639987 res!414392) b!639994))

(assert (= (and b!639994 res!414385) b!639992))

(assert (= (and b!639992 res!414395) b!639989))

(assert (= (and b!639989 res!414400) b!639995))

(assert (= (and b!639995 res!414387) b!639996))

(assert (= (and b!639996 res!414393) b!639988))

(assert (= (and b!639988 res!414390) b!640002))

(assert (= (and b!640002 res!414391) b!639991))

(assert (= (and b!639991 res!414394) b!640003))

(assert (= (and b!640003 res!414384) b!640000))

(assert (= (and b!640003 c!73169) b!640001))

(assert (= (and b!640003 (not c!73169)) b!639993))

(assert (= (and b!640003 (not res!414396)) b!639997))

(assert (= (and b!639997 res!414397) b!639985))

(assert (= (and b!639985 (not res!414386)) b!639999))

(assert (= (and b!639999 res!414399) b!639990))

(assert (= (and b!639997 (not res!414398)) b!639986))

(declare-fun m!614203 () Bool)

(assert (=> b!639995 m!614203))

(declare-fun m!614205 () Bool)

(assert (=> b!639992 m!614205))

(declare-fun m!614207 () Bool)

(assert (=> b!639997 m!614207))

(declare-fun m!614209 () Bool)

(assert (=> b!639997 m!614209))

(declare-fun m!614211 () Bool)

(assert (=> b!639997 m!614211))

(declare-fun m!614213 () Bool)

(assert (=> b!639991 m!614213))

(assert (=> b!639991 m!614207))

(assert (=> b!639991 m!614207))

(declare-fun m!614215 () Bool)

(assert (=> b!639991 m!614215))

(assert (=> b!639990 m!614207))

(assert (=> b!639990 m!614207))

(declare-fun m!614217 () Bool)

(assert (=> b!639990 m!614217))

(assert (=> b!640002 m!614209))

(declare-fun m!614219 () Bool)

(assert (=> b!640002 m!614219))

(declare-fun m!614221 () Bool)

(assert (=> b!639994 m!614221))

(declare-fun m!614223 () Bool)

(assert (=> b!639988 m!614223))

(declare-fun m!614225 () Bool)

(assert (=> b!639989 m!614225))

(declare-fun m!614227 () Bool)

(assert (=> start!57882 m!614227))

(declare-fun m!614229 () Bool)

(assert (=> start!57882 m!614229))

(declare-fun m!614231 () Bool)

(assert (=> b!639996 m!614231))

(declare-fun m!614233 () Bool)

(assert (=> b!639986 m!614233))

(assert (=> b!639986 m!614207))

(declare-fun m!614235 () Bool)

(assert (=> b!639986 m!614235))

(assert (=> b!639986 m!614207))

(declare-fun m!614237 () Bool)

(assert (=> b!639986 m!614237))

(declare-fun m!614239 () Bool)

(assert (=> b!639986 m!614239))

(assert (=> b!639986 m!614207))

(declare-fun m!614241 () Bool)

(assert (=> b!639986 m!614241))

(declare-fun m!614243 () Bool)

(assert (=> b!639986 m!614243))

(declare-fun m!614245 () Bool)

(assert (=> b!640003 m!614245))

(declare-fun m!614247 () Bool)

(assert (=> b!640003 m!614247))

(declare-fun m!614249 () Bool)

(assert (=> b!640003 m!614249))

(declare-fun m!614251 () Bool)

(assert (=> b!640003 m!614251))

(assert (=> b!640003 m!614209))

(declare-fun m!614253 () Bool)

(assert (=> b!640003 m!614253))

(assert (=> b!640003 m!614207))

(assert (=> b!640003 m!614207))

(declare-fun m!614255 () Bool)

(assert (=> b!640003 m!614255))

(assert (=> b!639985 m!614207))

(assert (=> b!639999 m!614207))

(assert (=> b!639999 m!614207))

(declare-fun m!614257 () Bool)

(assert (=> b!639999 m!614257))

(assert (=> b!639987 m!614207))

(assert (=> b!639987 m!614207))

(declare-fun m!614259 () Bool)

(assert (=> b!639987 m!614259))

(check-sat (not b!639999) (not start!57882) (not b!640003) (not b!639995) (not b!639989) (not b!639994) (not b!639987) (not b!639992) (not b!639986) (not b!639990) (not b!639996) (not b!639991))
(check-sat)
(get-model)

(declare-fun b!640130 () Bool)

(declare-fun e!366395 () SeekEntryResult!6775)

(assert (=> b!640130 (= e!366395 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18379 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640131 () Bool)

(declare-fun c!73184 () Bool)

(declare-fun lt!296215 () (_ BitVec 64))

(assert (=> b!640131 (= c!73184 (= lt!296215 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!366394 () SeekEntryResult!6775)

(assert (=> b!640131 (= e!366394 e!366395)))

(declare-fun b!640132 () Bool)

(assert (=> b!640132 (= e!366394 (Found!6775 index!984))))

(declare-fun b!640133 () Bool)

(assert (=> b!640133 (= e!366395 (MissingVacant!6775 vacantSpotIndex!68))))

(declare-fun b!640134 () Bool)

(declare-fun e!366396 () SeekEntryResult!6775)

(assert (=> b!640134 (= e!366396 Undefined!6775)))

(declare-fun lt!296214 () SeekEntryResult!6775)

(declare-fun d!90465 () Bool)

(get-info :version)

(assert (=> d!90465 (and (or ((_ is Undefined!6775) lt!296214) (not ((_ is Found!6775) lt!296214)) (and (bvsge (index!29418 lt!296214) #b00000000000000000000000000000000) (bvslt (index!29418 lt!296214) (size!18743 a!2986)))) (or ((_ is Undefined!6775) lt!296214) ((_ is Found!6775) lt!296214) (not ((_ is MissingVacant!6775) lt!296214)) (not (= (index!29420 lt!296214) vacantSpotIndex!68)) (and (bvsge (index!29420 lt!296214) #b00000000000000000000000000000000) (bvslt (index!29420 lt!296214) (size!18743 a!2986)))) (or ((_ is Undefined!6775) lt!296214) (ite ((_ is Found!6775) lt!296214) (= (select (arr!18379 a!2986) (index!29418 lt!296214)) (select (arr!18379 a!2986) j!136)) (and ((_ is MissingVacant!6775) lt!296214) (= (index!29420 lt!296214) vacantSpotIndex!68) (= (select (arr!18379 a!2986) (index!29420 lt!296214)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90465 (= lt!296214 e!366396)))

(declare-fun c!73182 () Bool)

(assert (=> d!90465 (= c!73182 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90465 (= lt!296215 (select (arr!18379 a!2986) index!984))))

(assert (=> d!90465 (validMask!0 mask!3053)))

(assert (=> d!90465 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18379 a!2986) j!136) a!2986 mask!3053) lt!296214)))

(declare-fun b!640135 () Bool)

(assert (=> b!640135 (= e!366396 e!366394)))

(declare-fun c!73183 () Bool)

(assert (=> b!640135 (= c!73183 (= lt!296215 (select (arr!18379 a!2986) j!136)))))

(assert (= (and d!90465 c!73182) b!640134))

(assert (= (and d!90465 (not c!73182)) b!640135))

(assert (= (and b!640135 c!73183) b!640132))

(assert (= (and b!640135 (not c!73183)) b!640131))

(assert (= (and b!640131 c!73184) b!640133))

(assert (= (and b!640131 (not c!73184)) b!640130))

(declare-fun m!614377 () Bool)

(assert (=> b!640130 m!614377))

(assert (=> b!640130 m!614377))

(assert (=> b!640130 m!614207))

(declare-fun m!614379 () Bool)

(assert (=> b!640130 m!614379))

(declare-fun m!614381 () Bool)

(assert (=> d!90465 m!614381))

(declare-fun m!614383 () Bool)

(assert (=> d!90465 m!614383))

(assert (=> d!90465 m!614213))

(assert (=> d!90465 m!614227))

(assert (=> b!639991 d!90465))

(declare-fun d!90467 () Bool)

(declare-fun lt!296222 () SeekEntryResult!6775)

(assert (=> d!90467 (and (or ((_ is Undefined!6775) lt!296222) (not ((_ is Found!6775) lt!296222)) (and (bvsge (index!29418 lt!296222) #b00000000000000000000000000000000) (bvslt (index!29418 lt!296222) (size!18743 a!2986)))) (or ((_ is Undefined!6775) lt!296222) ((_ is Found!6775) lt!296222) (not ((_ is MissingZero!6775) lt!296222)) (and (bvsge (index!29417 lt!296222) #b00000000000000000000000000000000) (bvslt (index!29417 lt!296222) (size!18743 a!2986)))) (or ((_ is Undefined!6775) lt!296222) ((_ is Found!6775) lt!296222) ((_ is MissingZero!6775) lt!296222) (not ((_ is MissingVacant!6775) lt!296222)) (and (bvsge (index!29420 lt!296222) #b00000000000000000000000000000000) (bvslt (index!29420 lt!296222) (size!18743 a!2986)))) (or ((_ is Undefined!6775) lt!296222) (ite ((_ is Found!6775) lt!296222) (= (select (arr!18379 a!2986) (index!29418 lt!296222)) k0!1786) (ite ((_ is MissingZero!6775) lt!296222) (= (select (arr!18379 a!2986) (index!29417 lt!296222)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6775) lt!296222) (= (select (arr!18379 a!2986) (index!29420 lt!296222)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!366404 () SeekEntryResult!6775)

(assert (=> d!90467 (= lt!296222 e!366404)))

(declare-fun c!73191 () Bool)

(declare-fun lt!296223 () SeekEntryResult!6775)

(assert (=> d!90467 (= c!73191 (and ((_ is Intermediate!6775) lt!296223) (undefined!7587 lt!296223)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38322 (_ BitVec 32)) SeekEntryResult!6775)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90467 (= lt!296223 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!90467 (validMask!0 mask!3053)))

(assert (=> d!90467 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!296222)))

(declare-fun b!640148 () Bool)

(assert (=> b!640148 (= e!366404 Undefined!6775)))

(declare-fun e!366403 () SeekEntryResult!6775)

(declare-fun b!640149 () Bool)

(assert (=> b!640149 (= e!366403 (seekKeyOrZeroReturnVacant!0 (x!58325 lt!296223) (index!29419 lt!296223) (index!29419 lt!296223) k0!1786 a!2986 mask!3053))))

(declare-fun b!640150 () Bool)

(declare-fun e!366405 () SeekEntryResult!6775)

(assert (=> b!640150 (= e!366404 e!366405)))

(declare-fun lt!296224 () (_ BitVec 64))

(assert (=> b!640150 (= lt!296224 (select (arr!18379 a!2986) (index!29419 lt!296223)))))

(declare-fun c!73193 () Bool)

(assert (=> b!640150 (= c!73193 (= lt!296224 k0!1786))))

(declare-fun b!640151 () Bool)

(assert (=> b!640151 (= e!366405 (Found!6775 (index!29419 lt!296223)))))

(declare-fun b!640152 () Bool)

(assert (=> b!640152 (= e!366403 (MissingZero!6775 (index!29419 lt!296223)))))

(declare-fun b!640153 () Bool)

(declare-fun c!73192 () Bool)

(assert (=> b!640153 (= c!73192 (= lt!296224 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!640153 (= e!366405 e!366403)))

(assert (= (and d!90467 c!73191) b!640148))

(assert (= (and d!90467 (not c!73191)) b!640150))

(assert (= (and b!640150 c!73193) b!640151))

(assert (= (and b!640150 (not c!73193)) b!640153))

(assert (= (and b!640153 c!73192) b!640152))

(assert (= (and b!640153 (not c!73192)) b!640149))

(assert (=> d!90467 m!614227))

(declare-fun m!614385 () Bool)

(assert (=> d!90467 m!614385))

(declare-fun m!614387 () Bool)

(assert (=> d!90467 m!614387))

(assert (=> d!90467 m!614387))

(declare-fun m!614389 () Bool)

(assert (=> d!90467 m!614389))

(declare-fun m!614391 () Bool)

(assert (=> d!90467 m!614391))

(declare-fun m!614393 () Bool)

(assert (=> d!90467 m!614393))

(declare-fun m!614395 () Bool)

(assert (=> b!640149 m!614395))

(declare-fun m!614397 () Bool)

(assert (=> b!640150 m!614397))

(assert (=> b!639989 d!90467))

(declare-fun d!90469 () Bool)

(declare-fun res!414507 () Bool)

(declare-fun e!366410 () Bool)

(assert (=> d!90469 (=> res!414507 e!366410)))

(assert (=> d!90469 (= res!414507 (= (select (arr!18379 lt!296121) index!984) (select (arr!18379 a!2986) j!136)))))

(assert (=> d!90469 (= (arrayContainsKey!0 lt!296121 (select (arr!18379 a!2986) j!136) index!984) e!366410)))

(declare-fun b!640158 () Bool)

(declare-fun e!366411 () Bool)

(assert (=> b!640158 (= e!366410 e!366411)))

(declare-fun res!414508 () Bool)

(assert (=> b!640158 (=> (not res!414508) (not e!366411))))

(assert (=> b!640158 (= res!414508 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18743 lt!296121)))))

(declare-fun b!640159 () Bool)

(assert (=> b!640159 (= e!366411 (arrayContainsKey!0 lt!296121 (select (arr!18379 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90469 (not res!414507)) b!640158))

(assert (= (and b!640158 res!414508) b!640159))

(declare-fun m!614399 () Bool)

(assert (=> d!90469 m!614399))

(assert (=> b!640159 m!614207))

(declare-fun m!614401 () Bool)

(assert (=> b!640159 m!614401))

(assert (=> b!639990 d!90469))

(declare-fun d!90471 () Bool)

(assert (=> d!90471 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57882 d!90471))

(declare-fun d!90477 () Bool)

(assert (=> d!90477 (= (array_inv!14238 a!2986) (bvsge (size!18743 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57882 d!90477))

(declare-fun d!90481 () Bool)

(declare-fun res!414509 () Bool)

(declare-fun e!366412 () Bool)

(assert (=> d!90481 (=> res!414509 e!366412)))

(assert (=> d!90481 (= res!414509 (= (select (arr!18379 lt!296121) j!136) (select (arr!18379 a!2986) j!136)))))

(assert (=> d!90481 (= (arrayContainsKey!0 lt!296121 (select (arr!18379 a!2986) j!136) j!136) e!366412)))

(declare-fun b!640160 () Bool)

(declare-fun e!366413 () Bool)

(assert (=> b!640160 (= e!366412 e!366413)))

(declare-fun res!414510 () Bool)

(assert (=> b!640160 (=> (not res!414510) (not e!366413))))

(assert (=> b!640160 (= res!414510 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18743 lt!296121)))))

(declare-fun b!640161 () Bool)

(assert (=> b!640161 (= e!366413 (arrayContainsKey!0 lt!296121 (select (arr!18379 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90481 (not res!414509)) b!640160))

(assert (= (and b!640160 res!414510) b!640161))

(declare-fun m!614403 () Bool)

(assert (=> d!90481 m!614403))

(assert (=> b!640161 m!614207))

(declare-fun m!614405 () Bool)

(assert (=> b!640161 m!614405))

(assert (=> b!639999 d!90481))

(declare-fun d!90483 () Bool)

(assert (=> d!90483 (= (validKeyInArray!0 (select (arr!18379 a!2986) j!136)) (and (not (= (select (arr!18379 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18379 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!639987 d!90483))

(declare-fun d!90485 () Bool)

(declare-fun res!414517 () Bool)

(declare-fun e!366422 () Bool)

(assert (=> d!90485 (=> res!414517 e!366422)))

(assert (=> d!90485 (= res!414517 (bvsge #b00000000000000000000000000000000 (size!18743 a!2986)))))

(assert (=> d!90485 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12324) e!366422)))

(declare-fun b!640172 () Bool)

(declare-fun e!366423 () Bool)

(declare-fun call!33498 () Bool)

(assert (=> b!640172 (= e!366423 call!33498)))

(declare-fun b!640173 () Bool)

(declare-fun e!366425 () Bool)

(assert (=> b!640173 (= e!366425 e!366423)))

(declare-fun c!73196 () Bool)

(assert (=> b!640173 (= c!73196 (validKeyInArray!0 (select (arr!18379 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!640174 () Bool)

(declare-fun e!366424 () Bool)

(declare-fun contains!3104 (List!12327 (_ BitVec 64)) Bool)

(assert (=> b!640174 (= e!366424 (contains!3104 Nil!12324 (select (arr!18379 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33495 () Bool)

(assert (=> bm!33495 (= call!33498 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73196 (Cons!12323 (select (arr!18379 a!2986) #b00000000000000000000000000000000) Nil!12324) Nil!12324)))))

(declare-fun b!640175 () Bool)

(assert (=> b!640175 (= e!366423 call!33498)))

(declare-fun b!640176 () Bool)

(assert (=> b!640176 (= e!366422 e!366425)))

(declare-fun res!414519 () Bool)

(assert (=> b!640176 (=> (not res!414519) (not e!366425))))

(assert (=> b!640176 (= res!414519 (not e!366424))))

(declare-fun res!414518 () Bool)

(assert (=> b!640176 (=> (not res!414518) (not e!366424))))

(assert (=> b!640176 (= res!414518 (validKeyInArray!0 (select (arr!18379 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90485 (not res!414517)) b!640176))

(assert (= (and b!640176 res!414518) b!640174))

(assert (= (and b!640176 res!414519) b!640173))

(assert (= (and b!640173 c!73196) b!640172))

(assert (= (and b!640173 (not c!73196)) b!640175))

(assert (= (or b!640172 b!640175) bm!33495))

(declare-fun m!614407 () Bool)

(assert (=> b!640173 m!614407))

(assert (=> b!640173 m!614407))

(declare-fun m!614409 () Bool)

(assert (=> b!640173 m!614409))

(assert (=> b!640174 m!614407))

(assert (=> b!640174 m!614407))

(declare-fun m!614411 () Bool)

(assert (=> b!640174 m!614411))

(assert (=> bm!33495 m!614407))

(declare-fun m!614413 () Bool)

(assert (=> bm!33495 m!614413))

(assert (=> b!640176 m!614407))

(assert (=> b!640176 m!614407))

(assert (=> b!640176 m!614409))

(assert (=> b!639996 d!90485))

(declare-fun d!90487 () Bool)

(declare-fun res!414520 () Bool)

(declare-fun e!366426 () Bool)

(assert (=> d!90487 (=> res!414520 e!366426)))

(assert (=> d!90487 (= res!414520 (bvsge #b00000000000000000000000000000000 (size!18743 lt!296121)))))

(assert (=> d!90487 (= (arrayNoDuplicates!0 lt!296121 #b00000000000000000000000000000000 Nil!12324) e!366426)))

(declare-fun b!640177 () Bool)

(declare-fun e!366427 () Bool)

(declare-fun call!33499 () Bool)

(assert (=> b!640177 (= e!366427 call!33499)))

(declare-fun b!640178 () Bool)

(declare-fun e!366429 () Bool)

(assert (=> b!640178 (= e!366429 e!366427)))

(declare-fun c!73197 () Bool)

(assert (=> b!640178 (= c!73197 (validKeyInArray!0 (select (arr!18379 lt!296121) #b00000000000000000000000000000000)))))

(declare-fun b!640179 () Bool)

(declare-fun e!366428 () Bool)

(assert (=> b!640179 (= e!366428 (contains!3104 Nil!12324 (select (arr!18379 lt!296121) #b00000000000000000000000000000000)))))

(declare-fun bm!33496 () Bool)

(assert (=> bm!33496 (= call!33499 (arrayNoDuplicates!0 lt!296121 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73197 (Cons!12323 (select (arr!18379 lt!296121) #b00000000000000000000000000000000) Nil!12324) Nil!12324)))))

(declare-fun b!640180 () Bool)

(assert (=> b!640180 (= e!366427 call!33499)))

(declare-fun b!640181 () Bool)

(assert (=> b!640181 (= e!366426 e!366429)))

(declare-fun res!414522 () Bool)

(assert (=> b!640181 (=> (not res!414522) (not e!366429))))

(assert (=> b!640181 (= res!414522 (not e!366428))))

(declare-fun res!414521 () Bool)

(assert (=> b!640181 (=> (not res!414521) (not e!366428))))

(assert (=> b!640181 (= res!414521 (validKeyInArray!0 (select (arr!18379 lt!296121) #b00000000000000000000000000000000)))))

(assert (= (and d!90487 (not res!414520)) b!640181))

(assert (= (and b!640181 res!414521) b!640179))

(assert (= (and b!640181 res!414522) b!640178))

(assert (= (and b!640178 c!73197) b!640177))

(assert (= (and b!640178 (not c!73197)) b!640180))

(assert (= (or b!640177 b!640180) bm!33496))

(declare-fun m!614415 () Bool)

(assert (=> b!640178 m!614415))

(assert (=> b!640178 m!614415))

(declare-fun m!614417 () Bool)

(assert (=> b!640178 m!614417))

(assert (=> b!640179 m!614415))

(assert (=> b!640179 m!614415))

(declare-fun m!614419 () Bool)

(assert (=> b!640179 m!614419))

(assert (=> bm!33496 m!614415))

(declare-fun m!614421 () Bool)

(assert (=> bm!33496 m!614421))

(assert (=> b!640181 m!614415))

(assert (=> b!640181 m!614415))

(assert (=> b!640181 m!614417))

(assert (=> b!639986 d!90487))

(declare-fun d!90489 () Bool)

(declare-fun res!414523 () Bool)

(declare-fun e!366430 () Bool)

(assert (=> d!90489 (=> res!414523 e!366430)))

(assert (=> d!90489 (= res!414523 (= (select (arr!18379 lt!296121) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18379 a!2986) j!136)))))

(assert (=> d!90489 (= (arrayContainsKey!0 lt!296121 (select (arr!18379 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!366430)))

(declare-fun b!640182 () Bool)

(declare-fun e!366431 () Bool)

(assert (=> b!640182 (= e!366430 e!366431)))

(declare-fun res!414524 () Bool)

(assert (=> b!640182 (=> (not res!414524) (not e!366431))))

(assert (=> b!640182 (= res!414524 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18743 lt!296121)))))

(declare-fun b!640183 () Bool)

(assert (=> b!640183 (= e!366431 (arrayContainsKey!0 lt!296121 (select (arr!18379 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90489 (not res!414523)) b!640182))

(assert (= (and b!640182 res!414524) b!640183))

(declare-fun m!614423 () Bool)

(assert (=> d!90489 m!614423))

(assert (=> b!640183 m!614207))

(declare-fun m!614425 () Bool)

(assert (=> b!640183 m!614425))

(assert (=> b!639986 d!90489))

(declare-fun d!90491 () Bool)

(assert (=> d!90491 (arrayContainsKey!0 lt!296121 (select (arr!18379 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296231 () Unit!21609)

(declare-fun choose!114 (array!38322 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21609)

(assert (=> d!90491 (= lt!296231 (choose!114 lt!296121 (select (arr!18379 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90491 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90491 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296121 (select (arr!18379 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!296231)))

(declare-fun bs!19190 () Bool)

(assert (= bs!19190 d!90491))

(assert (=> bs!19190 m!614207))

(assert (=> bs!19190 m!614237))

(assert (=> bs!19190 m!614207))

(declare-fun m!614427 () Bool)

(assert (=> bs!19190 m!614427))

(assert (=> b!639986 d!90491))

(declare-fun d!90493 () Bool)

(declare-fun e!366449 () Bool)

(assert (=> d!90493 e!366449))

(declare-fun res!414527 () Bool)

(assert (=> d!90493 (=> (not res!414527) (not e!366449))))

(assert (=> d!90493 (= res!414527 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18743 a!2986))))))

(declare-fun lt!296242 () Unit!21609)

(declare-fun choose!41 (array!38322 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12327) Unit!21609)

(assert (=> d!90493 (= lt!296242 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12324))))

(assert (=> d!90493 (bvslt (size!18743 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!90493 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12324) lt!296242)))

(declare-fun b!640216 () Bool)

(assert (=> b!640216 (= e!366449 (arrayNoDuplicates!0 (array!38323 (store (arr!18379 a!2986) i!1108 k0!1786) (size!18743 a!2986)) #b00000000000000000000000000000000 Nil!12324))))

(assert (= (and d!90493 res!414527) b!640216))

(declare-fun m!614439 () Bool)

(assert (=> d!90493 m!614439))

(assert (=> b!640216 m!614209))

(declare-fun m!614441 () Bool)

(assert (=> b!640216 m!614441))

(assert (=> b!639986 d!90493))

(declare-fun d!90497 () Bool)

(assert (=> d!90497 (arrayNoDuplicates!0 lt!296121 j!136 Nil!12324)))

(declare-fun lt!296245 () Unit!21609)

(declare-fun choose!39 (array!38322 (_ BitVec 32) (_ BitVec 32)) Unit!21609)

(assert (=> d!90497 (= lt!296245 (choose!39 lt!296121 #b00000000000000000000000000000000 j!136))))

(assert (=> d!90497 (bvslt (size!18743 lt!296121) #b01111111111111111111111111111111)))

(assert (=> d!90497 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!296121 #b00000000000000000000000000000000 j!136) lt!296245)))

(declare-fun bs!19191 () Bool)

(assert (= bs!19191 d!90497))

(assert (=> bs!19191 m!614235))

(declare-fun m!614443 () Bool)

(assert (=> bs!19191 m!614443))

(assert (=> b!639986 d!90497))

(declare-fun d!90499 () Bool)

(declare-fun res!414528 () Bool)

(declare-fun e!366450 () Bool)

(assert (=> d!90499 (=> res!414528 e!366450)))

(assert (=> d!90499 (= res!414528 (bvsge j!136 (size!18743 lt!296121)))))

(assert (=> d!90499 (= (arrayNoDuplicates!0 lt!296121 j!136 Nil!12324) e!366450)))

(declare-fun b!640217 () Bool)

(declare-fun e!366451 () Bool)

(declare-fun call!33500 () Bool)

(assert (=> b!640217 (= e!366451 call!33500)))

(declare-fun b!640218 () Bool)

(declare-fun e!366453 () Bool)

(assert (=> b!640218 (= e!366453 e!366451)))

(declare-fun c!73213 () Bool)

(assert (=> b!640218 (= c!73213 (validKeyInArray!0 (select (arr!18379 lt!296121) j!136)))))

(declare-fun b!640219 () Bool)

(declare-fun e!366452 () Bool)

(assert (=> b!640219 (= e!366452 (contains!3104 Nil!12324 (select (arr!18379 lt!296121) j!136)))))

(declare-fun bm!33497 () Bool)

(assert (=> bm!33497 (= call!33500 (arrayNoDuplicates!0 lt!296121 (bvadd j!136 #b00000000000000000000000000000001) (ite c!73213 (Cons!12323 (select (arr!18379 lt!296121) j!136) Nil!12324) Nil!12324)))))

(declare-fun b!640220 () Bool)

(assert (=> b!640220 (= e!366451 call!33500)))

(declare-fun b!640221 () Bool)

(assert (=> b!640221 (= e!366450 e!366453)))

(declare-fun res!414530 () Bool)

(assert (=> b!640221 (=> (not res!414530) (not e!366453))))

(assert (=> b!640221 (= res!414530 (not e!366452))))

(declare-fun res!414529 () Bool)

(assert (=> b!640221 (=> (not res!414529) (not e!366452))))

(assert (=> b!640221 (= res!414529 (validKeyInArray!0 (select (arr!18379 lt!296121) j!136)))))

(assert (= (and d!90499 (not res!414528)) b!640221))

(assert (= (and b!640221 res!414529) b!640219))

(assert (= (and b!640221 res!414530) b!640218))

(assert (= (and b!640218 c!73213) b!640217))

(assert (= (and b!640218 (not c!73213)) b!640220))

(assert (= (or b!640217 b!640220) bm!33497))

(assert (=> b!640218 m!614403))

(assert (=> b!640218 m!614403))

(declare-fun m!614445 () Bool)

(assert (=> b!640218 m!614445))

(assert (=> b!640219 m!614403))

(assert (=> b!640219 m!614403))

(declare-fun m!614447 () Bool)

(assert (=> b!640219 m!614447))

(assert (=> bm!33497 m!614403))

(declare-fun m!614449 () Bool)

(assert (=> bm!33497 m!614449))

(assert (=> b!640221 m!614403))

(assert (=> b!640221 m!614403))

(assert (=> b!640221 m!614445))

(assert (=> b!639986 d!90499))

(declare-fun b!640260 () Bool)

(declare-fun e!366481 () Bool)

(declare-fun e!366482 () Bool)

(assert (=> b!640260 (= e!366481 e!366482)))

(declare-fun lt!296260 () (_ BitVec 64))

(assert (=> b!640260 (= lt!296260 (select (arr!18379 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!296262 () Unit!21609)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38322 (_ BitVec 64) (_ BitVec 32)) Unit!21609)

(assert (=> b!640260 (= lt!296262 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!296260 #b00000000000000000000000000000000))))

(assert (=> b!640260 (arrayContainsKey!0 a!2986 lt!296260 #b00000000000000000000000000000000)))

(declare-fun lt!296261 () Unit!21609)

(assert (=> b!640260 (= lt!296261 lt!296262)))

(declare-fun res!414548 () Bool)

(assert (=> b!640260 (= res!414548 (= (seekEntryOrOpen!0 (select (arr!18379 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6775 #b00000000000000000000000000000000)))))

(assert (=> b!640260 (=> (not res!414548) (not e!366482))))

(declare-fun b!640261 () Bool)

(declare-fun call!33506 () Bool)

(assert (=> b!640261 (= e!366481 call!33506)))

(declare-fun b!640262 () Bool)

(assert (=> b!640262 (= e!366482 call!33506)))

(declare-fun d!90501 () Bool)

(declare-fun res!414547 () Bool)

(declare-fun e!366483 () Bool)

(assert (=> d!90501 (=> res!414547 e!366483)))

(assert (=> d!90501 (= res!414547 (bvsge #b00000000000000000000000000000000 (size!18743 a!2986)))))

(assert (=> d!90501 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!366483)))

(declare-fun bm!33503 () Bool)

(assert (=> bm!33503 (= call!33506 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!640263 () Bool)

(assert (=> b!640263 (= e!366483 e!366481)))

(declare-fun c!73225 () Bool)

(assert (=> b!640263 (= c!73225 (validKeyInArray!0 (select (arr!18379 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90501 (not res!414547)) b!640263))

(assert (= (and b!640263 c!73225) b!640260))

(assert (= (and b!640263 (not c!73225)) b!640261))

(assert (= (and b!640260 res!414548) b!640262))

(assert (= (or b!640262 b!640261) bm!33503))

(assert (=> b!640260 m!614407))

(declare-fun m!614485 () Bool)

(assert (=> b!640260 m!614485))

(declare-fun m!614487 () Bool)

(assert (=> b!640260 m!614487))

(assert (=> b!640260 m!614407))

(declare-fun m!614491 () Bool)

(assert (=> b!640260 m!614491))

(declare-fun m!614493 () Bool)

(assert (=> bm!33503 m!614493))

(assert (=> b!640263 m!614407))

(assert (=> b!640263 m!614407))

(assert (=> b!640263 m!614409))

(assert (=> b!639995 d!90501))

(declare-fun d!90513 () Bool)

(assert (=> d!90513 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!639994 d!90513))

(declare-fun d!90515 () Bool)

(declare-fun res!414549 () Bool)

(declare-fun e!366484 () Bool)

(assert (=> d!90515 (=> res!414549 e!366484)))

(assert (=> d!90515 (= res!414549 (= (select (arr!18379 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!90515 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!366484)))

(declare-fun b!640264 () Bool)

(declare-fun e!366485 () Bool)

(assert (=> b!640264 (= e!366484 e!366485)))

(declare-fun res!414550 () Bool)

(assert (=> b!640264 (=> (not res!414550) (not e!366485))))

(assert (=> b!640264 (= res!414550 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18743 a!2986)))))

(declare-fun b!640265 () Bool)

(assert (=> b!640265 (= e!366485 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90515 (not res!414549)) b!640264))

(assert (= (and b!640264 res!414550) b!640265))

(assert (=> d!90515 m!614407))

(declare-fun m!614495 () Bool)

(assert (=> b!640265 m!614495))

(assert (=> b!639992 d!90515))

(declare-fun e!366487 () SeekEntryResult!6775)

(declare-fun b!640266 () Bool)

(assert (=> b!640266 (= e!366487 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!296125 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!296123 lt!296121 mask!3053))))

(declare-fun b!640267 () Bool)

(declare-fun c!73228 () Bool)

(declare-fun lt!296264 () (_ BitVec 64))

(assert (=> b!640267 (= c!73228 (= lt!296264 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!366486 () SeekEntryResult!6775)

(assert (=> b!640267 (= e!366486 e!366487)))

(declare-fun b!640268 () Bool)

(assert (=> b!640268 (= e!366486 (Found!6775 lt!296125))))

(declare-fun b!640269 () Bool)

(assert (=> b!640269 (= e!366487 (MissingVacant!6775 vacantSpotIndex!68))))

(declare-fun b!640270 () Bool)

(declare-fun e!366488 () SeekEntryResult!6775)

(assert (=> b!640270 (= e!366488 Undefined!6775)))

(declare-fun lt!296263 () SeekEntryResult!6775)

(declare-fun d!90517 () Bool)

(assert (=> d!90517 (and (or ((_ is Undefined!6775) lt!296263) (not ((_ is Found!6775) lt!296263)) (and (bvsge (index!29418 lt!296263) #b00000000000000000000000000000000) (bvslt (index!29418 lt!296263) (size!18743 lt!296121)))) (or ((_ is Undefined!6775) lt!296263) ((_ is Found!6775) lt!296263) (not ((_ is MissingVacant!6775) lt!296263)) (not (= (index!29420 lt!296263) vacantSpotIndex!68)) (and (bvsge (index!29420 lt!296263) #b00000000000000000000000000000000) (bvslt (index!29420 lt!296263) (size!18743 lt!296121)))) (or ((_ is Undefined!6775) lt!296263) (ite ((_ is Found!6775) lt!296263) (= (select (arr!18379 lt!296121) (index!29418 lt!296263)) lt!296123) (and ((_ is MissingVacant!6775) lt!296263) (= (index!29420 lt!296263) vacantSpotIndex!68) (= (select (arr!18379 lt!296121) (index!29420 lt!296263)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90517 (= lt!296263 e!366488)))

(declare-fun c!73226 () Bool)

(assert (=> d!90517 (= c!73226 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90517 (= lt!296264 (select (arr!18379 lt!296121) lt!296125))))

(assert (=> d!90517 (validMask!0 mask!3053)))

(assert (=> d!90517 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296125 vacantSpotIndex!68 lt!296123 lt!296121 mask!3053) lt!296263)))

(declare-fun b!640271 () Bool)

(assert (=> b!640271 (= e!366488 e!366486)))

(declare-fun c!73227 () Bool)

(assert (=> b!640271 (= c!73227 (= lt!296264 lt!296123))))

(assert (= (and d!90517 c!73226) b!640270))

(assert (= (and d!90517 (not c!73226)) b!640271))

(assert (= (and b!640271 c!73227) b!640268))

(assert (= (and b!640271 (not c!73227)) b!640267))

(assert (= (and b!640267 c!73228) b!640269))

(assert (= (and b!640267 (not c!73228)) b!640266))

(declare-fun m!614497 () Bool)

(assert (=> b!640266 m!614497))

(assert (=> b!640266 m!614497))

(declare-fun m!614499 () Bool)

(assert (=> b!640266 m!614499))

(declare-fun m!614501 () Bool)

(assert (=> d!90517 m!614501))

(declare-fun m!614503 () Bool)

(assert (=> d!90517 m!614503))

(declare-fun m!614505 () Bool)

(assert (=> d!90517 m!614505))

(assert (=> d!90517 m!614227))

(assert (=> b!640003 d!90517))

(declare-fun e!366490 () SeekEntryResult!6775)

(declare-fun b!640272 () Bool)

(assert (=> b!640272 (= e!366490 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!296125 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18379 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640273 () Bool)

(declare-fun c!73231 () Bool)

(declare-fun lt!296266 () (_ BitVec 64))

(assert (=> b!640273 (= c!73231 (= lt!296266 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!366489 () SeekEntryResult!6775)

(assert (=> b!640273 (= e!366489 e!366490)))

(declare-fun b!640274 () Bool)

(assert (=> b!640274 (= e!366489 (Found!6775 lt!296125))))

(declare-fun b!640275 () Bool)

(assert (=> b!640275 (= e!366490 (MissingVacant!6775 vacantSpotIndex!68))))

(declare-fun b!640276 () Bool)

(declare-fun e!366491 () SeekEntryResult!6775)

(assert (=> b!640276 (= e!366491 Undefined!6775)))

(declare-fun d!90519 () Bool)

(declare-fun lt!296265 () SeekEntryResult!6775)

(assert (=> d!90519 (and (or ((_ is Undefined!6775) lt!296265) (not ((_ is Found!6775) lt!296265)) (and (bvsge (index!29418 lt!296265) #b00000000000000000000000000000000) (bvslt (index!29418 lt!296265) (size!18743 a!2986)))) (or ((_ is Undefined!6775) lt!296265) ((_ is Found!6775) lt!296265) (not ((_ is MissingVacant!6775) lt!296265)) (not (= (index!29420 lt!296265) vacantSpotIndex!68)) (and (bvsge (index!29420 lt!296265) #b00000000000000000000000000000000) (bvslt (index!29420 lt!296265) (size!18743 a!2986)))) (or ((_ is Undefined!6775) lt!296265) (ite ((_ is Found!6775) lt!296265) (= (select (arr!18379 a!2986) (index!29418 lt!296265)) (select (arr!18379 a!2986) j!136)) (and ((_ is MissingVacant!6775) lt!296265) (= (index!29420 lt!296265) vacantSpotIndex!68) (= (select (arr!18379 a!2986) (index!29420 lt!296265)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90519 (= lt!296265 e!366491)))

(declare-fun c!73229 () Bool)

(assert (=> d!90519 (= c!73229 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90519 (= lt!296266 (select (arr!18379 a!2986) lt!296125))))

(assert (=> d!90519 (validMask!0 mask!3053)))

(assert (=> d!90519 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296125 vacantSpotIndex!68 (select (arr!18379 a!2986) j!136) a!2986 mask!3053) lt!296265)))

(declare-fun b!640277 () Bool)

(assert (=> b!640277 (= e!366491 e!366489)))

(declare-fun c!73230 () Bool)

(assert (=> b!640277 (= c!73230 (= lt!296266 (select (arr!18379 a!2986) j!136)))))

(assert (= (and d!90519 c!73229) b!640276))

(assert (= (and d!90519 (not c!73229)) b!640277))

(assert (= (and b!640277 c!73230) b!640274))

(assert (= (and b!640277 (not c!73230)) b!640273))

(assert (= (and b!640273 c!73231) b!640275))

(assert (= (and b!640273 (not c!73231)) b!640272))

(assert (=> b!640272 m!614497))

(assert (=> b!640272 m!614497))

(assert (=> b!640272 m!614207))

(declare-fun m!614507 () Bool)

(assert (=> b!640272 m!614507))

(declare-fun m!614509 () Bool)

(assert (=> d!90519 m!614509))

(declare-fun m!614511 () Bool)

(assert (=> d!90519 m!614511))

(declare-fun m!614513 () Bool)

(assert (=> d!90519 m!614513))

(assert (=> d!90519 m!614227))

(assert (=> b!640003 d!90519))

(declare-fun d!90521 () Bool)

(declare-fun e!366522 () Bool)

(assert (=> d!90521 e!366522))

(declare-fun res!414565 () Bool)

(assert (=> d!90521 (=> (not res!414565) (not e!366522))))

(assert (=> d!90521 (= res!414565 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18743 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18743 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18743 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18743 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18743 a!2986))))))

(declare-fun lt!296283 () Unit!21609)

(declare-fun choose!9 (array!38322 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21609)

(assert (=> d!90521 (= lt!296283 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296125 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90521 (validMask!0 mask!3053)))

(assert (=> d!90521 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296125 vacantSpotIndex!68 mask!3053) lt!296283)))

(declare-fun b!640324 () Bool)

(assert (=> b!640324 (= e!366522 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296125 vacantSpotIndex!68 (select (arr!18379 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296125 vacantSpotIndex!68 (select (store (arr!18379 a!2986) i!1108 k0!1786) j!136) (array!38323 (store (arr!18379 a!2986) i!1108 k0!1786) (size!18743 a!2986)) mask!3053)))))

(assert (= (and d!90521 res!414565) b!640324))

(declare-fun m!614553 () Bool)

(assert (=> d!90521 m!614553))

(assert (=> d!90521 m!614227))

(assert (=> b!640324 m!614209))

(assert (=> b!640324 m!614247))

(declare-fun m!614555 () Bool)

(assert (=> b!640324 m!614555))

(assert (=> b!640324 m!614207))

(assert (=> b!640324 m!614207))

(assert (=> b!640324 m!614255))

(assert (=> b!640324 m!614247))

(assert (=> b!640003 d!90521))

(declare-fun b!640331 () Bool)

(declare-fun e!366527 () SeekEntryResult!6775)

(assert (=> b!640331 (= e!366527 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!296123 lt!296121 mask!3053))))

(declare-fun b!640332 () Bool)

(declare-fun c!73253 () Bool)

(declare-fun lt!296287 () (_ BitVec 64))

(assert (=> b!640332 (= c!73253 (= lt!296287 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!366526 () SeekEntryResult!6775)

(assert (=> b!640332 (= e!366526 e!366527)))

(declare-fun b!640333 () Bool)

(assert (=> b!640333 (= e!366526 (Found!6775 index!984))))

(declare-fun b!640334 () Bool)

(assert (=> b!640334 (= e!366527 (MissingVacant!6775 vacantSpotIndex!68))))

(declare-fun b!640335 () Bool)

(declare-fun e!366528 () SeekEntryResult!6775)

(assert (=> b!640335 (= e!366528 Undefined!6775)))

(declare-fun d!90537 () Bool)

(declare-fun lt!296286 () SeekEntryResult!6775)

(assert (=> d!90537 (and (or ((_ is Undefined!6775) lt!296286) (not ((_ is Found!6775) lt!296286)) (and (bvsge (index!29418 lt!296286) #b00000000000000000000000000000000) (bvslt (index!29418 lt!296286) (size!18743 lt!296121)))) (or ((_ is Undefined!6775) lt!296286) ((_ is Found!6775) lt!296286) (not ((_ is MissingVacant!6775) lt!296286)) (not (= (index!29420 lt!296286) vacantSpotIndex!68)) (and (bvsge (index!29420 lt!296286) #b00000000000000000000000000000000) (bvslt (index!29420 lt!296286) (size!18743 lt!296121)))) (or ((_ is Undefined!6775) lt!296286) (ite ((_ is Found!6775) lt!296286) (= (select (arr!18379 lt!296121) (index!29418 lt!296286)) lt!296123) (and ((_ is MissingVacant!6775) lt!296286) (= (index!29420 lt!296286) vacantSpotIndex!68) (= (select (arr!18379 lt!296121) (index!29420 lt!296286)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90537 (= lt!296286 e!366528)))

(declare-fun c!73251 () Bool)

(assert (=> d!90537 (= c!73251 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90537 (= lt!296287 (select (arr!18379 lt!296121) index!984))))

(assert (=> d!90537 (validMask!0 mask!3053)))

(assert (=> d!90537 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296123 lt!296121 mask!3053) lt!296286)))

(declare-fun b!640336 () Bool)

(assert (=> b!640336 (= e!366528 e!366526)))

(declare-fun c!73252 () Bool)

(assert (=> b!640336 (= c!73252 (= lt!296287 lt!296123))))

(assert (= (and d!90537 c!73251) b!640335))

(assert (= (and d!90537 (not c!73251)) b!640336))

(assert (= (and b!640336 c!73252) b!640333))

(assert (= (and b!640336 (not c!73252)) b!640332))

(assert (= (and b!640332 c!73253) b!640334))

(assert (= (and b!640332 (not c!73253)) b!640331))

(assert (=> b!640331 m!614377))

(assert (=> b!640331 m!614377))

(declare-fun m!614565 () Bool)

(assert (=> b!640331 m!614565))

(declare-fun m!614567 () Bool)

(assert (=> d!90537 m!614567))

(declare-fun m!614569 () Bool)

(assert (=> d!90537 m!614569))

(assert (=> d!90537 m!614399))

(assert (=> d!90537 m!614227))

(assert (=> b!640003 d!90537))

(declare-fun d!90541 () Bool)

(declare-fun lt!296293 () (_ BitVec 32))

(assert (=> d!90541 (and (bvsge lt!296293 #b00000000000000000000000000000000) (bvslt lt!296293 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90541 (= lt!296293 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!90541 (validMask!0 mask!3053)))

(assert (=> d!90541 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!296293)))

(declare-fun bs!19195 () Bool)

(assert (= bs!19195 d!90541))

(declare-fun m!614573 () Bool)

(assert (=> bs!19195 m!614573))

(assert (=> bs!19195 m!614227))

(assert (=> b!640003 d!90541))

(check-sat (not b!640260) (not b!640161) (not b!640263) (not d!90537) (not b!640149) (not b!640130) (not b!640272) (not d!90519) (not b!640219) (not d!90491) (not b!640265) (not b!640181) (not b!640266) (not b!640179) (not b!640218) (not b!640173) (not d!90521) (not b!640331) (not bm!33497) (not b!640174) (not bm!33496) (not b!640183) (not b!640221) (not d!90541) (not b!640216) (not b!640176) (not d!90493) (not bm!33495) (not d!90497) (not d!90517) (not d!90465) (not d!90467) (not b!640159) (not bm!33503) (not b!640324) (not b!640178))
(check-sat)
