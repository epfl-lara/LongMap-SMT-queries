; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54462 () Bool)

(assert start!54462)

(declare-fun b!594160 () Bool)

(declare-fun e!339435 () Bool)

(declare-fun e!339441 () Bool)

(assert (=> b!594160 (= e!339435 e!339441)))

(declare-fun res!380239 () Bool)

(assert (=> b!594160 (=> (not res!380239) (not e!339441))))

(declare-datatypes ((List!11682 0))(
  ( (Nil!11679) (Cons!11678 (h!12726 (_ BitVec 64)) (t!17902 List!11682)) )
))
(declare-fun contains!2891 (List!11682 (_ BitVec 64)) Bool)

(assert (=> b!594160 (= res!380239 (not (contains!2891 Nil!11679 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!594161 () Bool)

(declare-fun res!380247 () Bool)

(declare-fun e!339447 () Bool)

(assert (=> b!594161 (=> (not res!380247) (not e!339447))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36942 0))(
  ( (array!36943 (arr!17734 (Array (_ BitVec 32) (_ BitVec 64))) (size!18098 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36942)

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!594161 (= res!380247 (and (= (size!18098 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18098 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18098 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!594162 () Bool)

(declare-fun e!339439 () Bool)

(declare-fun e!339438 () Bool)

(assert (=> b!594162 (= e!339439 e!339438)))

(declare-fun res!380242 () Bool)

(assert (=> b!594162 (=> (not res!380242) (not e!339438))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6130 0))(
  ( (MissingZero!6130 (index!26765 (_ BitVec 32))) (Found!6130 (index!26766 (_ BitVec 32))) (Intermediate!6130 (undefined!6942 Bool) (index!26767 (_ BitVec 32)) (x!55720 (_ BitVec 32))) (Undefined!6130) (MissingVacant!6130 (index!26768 (_ BitVec 32))) )
))
(declare-fun lt!269751 () SeekEntryResult!6130)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!594162 (= res!380242 (and (= lt!269751 (Found!6130 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17734 a!2986) index!984) (select (arr!17734 a!2986) j!136))) (not (= (select (arr!17734 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36942 (_ BitVec 32)) SeekEntryResult!6130)

(assert (=> b!594162 (= lt!269751 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17734 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!594163 () Bool)

(declare-fun res!380248 () Bool)

(assert (=> b!594163 (=> (not res!380248) (not e!339447))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!594163 (= res!380248 (validKeyInArray!0 k0!1786))))

(declare-fun b!594164 () Bool)

(declare-fun e!339442 () Bool)

(declare-fun e!339434 () Bool)

(assert (=> b!594164 (= e!339442 e!339434)))

(declare-fun res!380237 () Bool)

(assert (=> b!594164 (=> (not res!380237) (not e!339434))))

(declare-fun lt!269749 () array!36942)

(declare-fun arrayContainsKey!0 (array!36942 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!594164 (= res!380237 (arrayContainsKey!0 lt!269749 (select (arr!17734 a!2986) j!136) j!136))))

(declare-fun b!594165 () Bool)

(declare-fun res!380233 () Bool)

(declare-fun e!339445 () Bool)

(assert (=> b!594165 (=> (not res!380233) (not e!339445))))

(declare-fun arrayNoDuplicates!0 (array!36942 (_ BitVec 32) List!11682) Bool)

(assert (=> b!594165 (= res!380233 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11679))))

(declare-fun b!594166 () Bool)

(declare-datatypes ((Unit!18613 0))(
  ( (Unit!18614) )
))
(declare-fun e!339443 () Unit!18613)

(declare-fun Unit!18615 () Unit!18613)

(assert (=> b!594166 (= e!339443 Unit!18615)))

(declare-fun b!594167 () Bool)

(declare-fun res!380243 () Bool)

(assert (=> b!594167 (=> res!380243 e!339435)))

(declare-fun noDuplicate!238 (List!11682) Bool)

(assert (=> b!594167 (= res!380243 (not (noDuplicate!238 Nil!11679)))))

(declare-fun b!594168 () Bool)

(declare-fun res!380244 () Bool)

(assert (=> b!594168 (=> (not res!380244) (not e!339445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36942 (_ BitVec 32)) Bool)

(assert (=> b!594168 (= res!380244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!594169 () Bool)

(declare-fun res!380231 () Bool)

(assert (=> b!594169 (=> (not res!380231) (not e!339447))))

(assert (=> b!594169 (= res!380231 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!594170 () Bool)

(declare-fun res!380232 () Bool)

(assert (=> b!594170 (=> (not res!380232) (not e!339447))))

(assert (=> b!594170 (= res!380232 (validKeyInArray!0 (select (arr!17734 a!2986) j!136)))))

(declare-fun b!594171 () Bool)

(assert (=> b!594171 (= e!339447 e!339445)))

(declare-fun res!380236 () Bool)

(assert (=> b!594171 (=> (not res!380236) (not e!339445))))

(declare-fun lt!269746 () SeekEntryResult!6130)

(assert (=> b!594171 (= res!380236 (or (= lt!269746 (MissingZero!6130 i!1108)) (= lt!269746 (MissingVacant!6130 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36942 (_ BitVec 32)) SeekEntryResult!6130)

(assert (=> b!594171 (= lt!269746 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!594172 () Bool)

(declare-fun e!339444 () Bool)

(assert (=> b!594172 (= e!339438 (not e!339444))))

(declare-fun res!380240 () Bool)

(assert (=> b!594172 (=> res!380240 e!339444)))

(declare-fun lt!269750 () SeekEntryResult!6130)

(assert (=> b!594172 (= res!380240 (not (= lt!269750 (Found!6130 index!984))))))

(declare-fun lt!269747 () Unit!18613)

(assert (=> b!594172 (= lt!269747 e!339443)))

(declare-fun c!67334 () Bool)

(assert (=> b!594172 (= c!67334 (= lt!269750 Undefined!6130))))

(declare-fun lt!269743 () (_ BitVec 64))

(assert (=> b!594172 (= lt!269750 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269743 lt!269749 mask!3053))))

(declare-fun e!339437 () Bool)

(assert (=> b!594172 e!339437))

(declare-fun res!380229 () Bool)

(assert (=> b!594172 (=> (not res!380229) (not e!339437))))

(declare-fun lt!269748 () (_ BitVec 32))

(declare-fun lt!269752 () SeekEntryResult!6130)

(assert (=> b!594172 (= res!380229 (= lt!269752 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269748 vacantSpotIndex!68 lt!269743 lt!269749 mask!3053)))))

(assert (=> b!594172 (= lt!269752 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269748 vacantSpotIndex!68 (select (arr!17734 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!594172 (= lt!269743 (select (store (arr!17734 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!269742 () Unit!18613)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36942 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18613)

(assert (=> b!594172 (= lt!269742 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269748 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!594172 (= lt!269748 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!594173 () Bool)

(declare-fun res!380245 () Bool)

(assert (=> b!594173 (=> (not res!380245) (not e!339445))))

(assert (=> b!594173 (= res!380245 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17734 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!594174 () Bool)

(declare-fun e!339446 () Bool)

(assert (=> b!594174 (= e!339446 e!339435)))

(declare-fun res!380234 () Bool)

(assert (=> b!594174 (=> res!380234 e!339435)))

(assert (=> b!594174 (= res!380234 (or (bvsgt #b00000000000000000000000000000000 (size!18098 a!2986)) (bvsge (size!18098 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!594174 (arrayContainsKey!0 lt!269749 (select (arr!17734 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269744 () Unit!18613)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36942 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18613)

(assert (=> b!594174 (= lt!269744 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269749 (select (arr!17734 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!594175 () Bool)

(declare-fun e!339436 () Bool)

(assert (=> b!594175 (= e!339436 e!339442)))

(declare-fun res!380238 () Bool)

(assert (=> b!594175 (=> res!380238 e!339442)))

(declare-fun lt!269745 () (_ BitVec 64))

(assert (=> b!594175 (= res!380238 (or (not (= (select (arr!17734 a!2986) j!136) lt!269743)) (not (= (select (arr!17734 a!2986) j!136) lt!269745)) (bvsge j!136 index!984)))))

(declare-fun b!594176 () Bool)

(assert (=> b!594176 (= e!339445 e!339439)))

(declare-fun res!380246 () Bool)

(assert (=> b!594176 (=> (not res!380246) (not e!339439))))

(assert (=> b!594176 (= res!380246 (= (select (store (arr!17734 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!594176 (= lt!269749 (array!36943 (store (arr!17734 a!2986) i!1108 k0!1786) (size!18098 a!2986)))))

(declare-fun res!380241 () Bool)

(assert (=> start!54462 (=> (not res!380241) (not e!339447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54462 (= res!380241 (validMask!0 mask!3053))))

(assert (=> start!54462 e!339447))

(assert (=> start!54462 true))

(declare-fun array_inv!13593 (array!36942) Bool)

(assert (=> start!54462 (array_inv!13593 a!2986)))

(declare-fun b!594177 () Bool)

(assert (=> b!594177 (= e!339437 (= lt!269751 lt!269752))))

(declare-fun b!594178 () Bool)

(assert (=> b!594178 (= e!339434 (arrayContainsKey!0 lt!269749 (select (arr!17734 a!2986) j!136) index!984))))

(declare-fun b!594179 () Bool)

(declare-fun Unit!18616 () Unit!18613)

(assert (=> b!594179 (= e!339443 Unit!18616)))

(assert (=> b!594179 false))

(declare-fun b!594180 () Bool)

(assert (=> b!594180 (= e!339441 (not (contains!2891 Nil!11679 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!594181 () Bool)

(assert (=> b!594181 (= e!339444 e!339446)))

(declare-fun res!380235 () Bool)

(assert (=> b!594181 (=> res!380235 e!339446)))

(assert (=> b!594181 (= res!380235 (or (not (= (select (arr!17734 a!2986) j!136) lt!269743)) (not (= (select (arr!17734 a!2986) j!136) lt!269745)) (bvsge j!136 index!984)))))

(assert (=> b!594181 e!339436))

(declare-fun res!380230 () Bool)

(assert (=> b!594181 (=> (not res!380230) (not e!339436))))

(assert (=> b!594181 (= res!380230 (= lt!269745 (select (arr!17734 a!2986) j!136)))))

(assert (=> b!594181 (= lt!269745 (select (store (arr!17734 a!2986) i!1108 k0!1786) index!984))))

(assert (= (and start!54462 res!380241) b!594161))

(assert (= (and b!594161 res!380247) b!594170))

(assert (= (and b!594170 res!380232) b!594163))

(assert (= (and b!594163 res!380248) b!594169))

(assert (= (and b!594169 res!380231) b!594171))

(assert (= (and b!594171 res!380236) b!594168))

(assert (= (and b!594168 res!380244) b!594165))

(assert (= (and b!594165 res!380233) b!594173))

(assert (= (and b!594173 res!380245) b!594176))

(assert (= (and b!594176 res!380246) b!594162))

(assert (= (and b!594162 res!380242) b!594172))

(assert (= (and b!594172 res!380229) b!594177))

(assert (= (and b!594172 c!67334) b!594179))

(assert (= (and b!594172 (not c!67334)) b!594166))

(assert (= (and b!594172 (not res!380240)) b!594181))

(assert (= (and b!594181 res!380230) b!594175))

(assert (= (and b!594175 (not res!380238)) b!594164))

(assert (= (and b!594164 res!380237) b!594178))

(assert (= (and b!594181 (not res!380235)) b!594174))

(assert (= (and b!594174 (not res!380234)) b!594167))

(assert (= (and b!594167 (not res!380243)) b!594160))

(assert (= (and b!594160 res!380239) b!594180))

(declare-fun m!572237 () Bool)

(assert (=> b!594181 m!572237))

(declare-fun m!572239 () Bool)

(assert (=> b!594181 m!572239))

(declare-fun m!572241 () Bool)

(assert (=> b!594181 m!572241))

(declare-fun m!572243 () Bool)

(assert (=> b!594165 m!572243))

(declare-fun m!572245 () Bool)

(assert (=> start!54462 m!572245))

(declare-fun m!572247 () Bool)

(assert (=> start!54462 m!572247))

(declare-fun m!572249 () Bool)

(assert (=> b!594172 m!572249))

(assert (=> b!594172 m!572237))

(assert (=> b!594172 m!572239))

(assert (=> b!594172 m!572237))

(declare-fun m!572251 () Bool)

(assert (=> b!594172 m!572251))

(declare-fun m!572253 () Bool)

(assert (=> b!594172 m!572253))

(declare-fun m!572255 () Bool)

(assert (=> b!594172 m!572255))

(declare-fun m!572257 () Bool)

(assert (=> b!594172 m!572257))

(declare-fun m!572259 () Bool)

(assert (=> b!594172 m!572259))

(assert (=> b!594170 m!572237))

(assert (=> b!594170 m!572237))

(declare-fun m!572261 () Bool)

(assert (=> b!594170 m!572261))

(declare-fun m!572263 () Bool)

(assert (=> b!594167 m!572263))

(assert (=> b!594174 m!572237))

(assert (=> b!594174 m!572237))

(declare-fun m!572265 () Bool)

(assert (=> b!594174 m!572265))

(assert (=> b!594174 m!572237))

(declare-fun m!572267 () Bool)

(assert (=> b!594174 m!572267))

(declare-fun m!572269 () Bool)

(assert (=> b!594160 m!572269))

(declare-fun m!572271 () Bool)

(assert (=> b!594169 m!572271))

(declare-fun m!572273 () Bool)

(assert (=> b!594163 m!572273))

(declare-fun m!572275 () Bool)

(assert (=> b!594168 m!572275))

(assert (=> b!594176 m!572239))

(declare-fun m!572277 () Bool)

(assert (=> b!594176 m!572277))

(declare-fun m!572279 () Bool)

(assert (=> b!594173 m!572279))

(declare-fun m!572281 () Bool)

(assert (=> b!594180 m!572281))

(assert (=> b!594178 m!572237))

(assert (=> b!594178 m!572237))

(declare-fun m!572283 () Bool)

(assert (=> b!594178 m!572283))

(declare-fun m!572285 () Bool)

(assert (=> b!594162 m!572285))

(assert (=> b!594162 m!572237))

(assert (=> b!594162 m!572237))

(declare-fun m!572287 () Bool)

(assert (=> b!594162 m!572287))

(declare-fun m!572289 () Bool)

(assert (=> b!594171 m!572289))

(assert (=> b!594175 m!572237))

(assert (=> b!594164 m!572237))

(assert (=> b!594164 m!572237))

(declare-fun m!572291 () Bool)

(assert (=> b!594164 m!572291))

(check-sat (not b!594165) (not b!594180) (not b!594163) (not b!594169) (not b!594174) (not b!594171) (not b!594168) (not b!594160) (not b!594164) (not b!594178) (not b!594167) (not b!594172) (not b!594162) (not b!594170) (not start!54462))
(check-sat)
(get-model)

(declare-fun d!86675 () Bool)

(assert (=> d!86675 (= (validKeyInArray!0 (select (arr!17734 a!2986) j!136)) (and (not (= (select (arr!17734 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17734 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!594170 d!86675))

(declare-fun d!86677 () Bool)

(declare-fun lt!269821 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!233 (List!11682) (InoxSet (_ BitVec 64)))

(assert (=> d!86677 (= lt!269821 (select (content!233 Nil!11679) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!339537 () Bool)

(assert (=> d!86677 (= lt!269821 e!339537)))

(declare-fun res!380373 () Bool)

(assert (=> d!86677 (=> (not res!380373) (not e!339537))))

(get-info :version)

(assert (=> d!86677 (= res!380373 ((_ is Cons!11678) Nil!11679))))

(assert (=> d!86677 (= (contains!2891 Nil!11679 #b1000000000000000000000000000000000000000000000000000000000000000) lt!269821)))

(declare-fun b!594318 () Bool)

(declare-fun e!339536 () Bool)

(assert (=> b!594318 (= e!339537 e!339536)))

(declare-fun res!380374 () Bool)

(assert (=> b!594318 (=> res!380374 e!339536)))

(assert (=> b!594318 (= res!380374 (= (h!12726 Nil!11679) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594319 () Bool)

(assert (=> b!594319 (= e!339536 (contains!2891 (t!17902 Nil!11679) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!86677 res!380373) b!594318))

(assert (= (and b!594318 (not res!380374)) b!594319))

(declare-fun m!572405 () Bool)

(assert (=> d!86677 m!572405))

(declare-fun m!572407 () Bool)

(assert (=> d!86677 m!572407))

(declare-fun m!572409 () Bool)

(assert (=> b!594319 m!572409))

(assert (=> b!594180 d!86677))

(declare-fun d!86679 () Bool)

(declare-fun res!380379 () Bool)

(declare-fun e!339542 () Bool)

(assert (=> d!86679 (=> res!380379 e!339542)))

(assert (=> d!86679 (= res!380379 (= (select (arr!17734 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!86679 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!339542)))

(declare-fun b!594324 () Bool)

(declare-fun e!339543 () Bool)

(assert (=> b!594324 (= e!339542 e!339543)))

(declare-fun res!380380 () Bool)

(assert (=> b!594324 (=> (not res!380380) (not e!339543))))

(assert (=> b!594324 (= res!380380 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18098 a!2986)))))

(declare-fun b!594325 () Bool)

(assert (=> b!594325 (= e!339543 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86679 (not res!380379)) b!594324))

(assert (= (and b!594324 res!380380) b!594325))

(declare-fun m!572411 () Bool)

(assert (=> d!86679 m!572411))

(declare-fun m!572413 () Bool)

(assert (=> b!594325 m!572413))

(assert (=> b!594169 d!86679))

(declare-fun d!86681 () Bool)

(assert (=> d!86681 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54462 d!86681))

(declare-fun d!86683 () Bool)

(assert (=> d!86683 (= (array_inv!13593 a!2986) (bvsge (size!18098 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54462 d!86683))

(declare-fun b!594334 () Bool)

(declare-fun e!339552 () Bool)

(declare-fun call!32892 () Bool)

(assert (=> b!594334 (= e!339552 call!32892)))

(declare-fun b!594335 () Bool)

(declare-fun e!339550 () Bool)

(assert (=> b!594335 (= e!339550 e!339552)))

(declare-fun lt!269829 () (_ BitVec 64))

(assert (=> b!594335 (= lt!269829 (select (arr!17734 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!269830 () Unit!18613)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36942 (_ BitVec 64) (_ BitVec 32)) Unit!18613)

(assert (=> b!594335 (= lt!269830 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!269829 #b00000000000000000000000000000000))))

(assert (=> b!594335 (arrayContainsKey!0 a!2986 lt!269829 #b00000000000000000000000000000000)))

(declare-fun lt!269828 () Unit!18613)

(assert (=> b!594335 (= lt!269828 lt!269830)))

(declare-fun res!380385 () Bool)

(assert (=> b!594335 (= res!380385 (= (seekEntryOrOpen!0 (select (arr!17734 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6130 #b00000000000000000000000000000000)))))

(assert (=> b!594335 (=> (not res!380385) (not e!339552))))

(declare-fun b!594336 () Bool)

(declare-fun e!339551 () Bool)

(assert (=> b!594336 (= e!339551 e!339550)))

(declare-fun c!67343 () Bool)

(assert (=> b!594336 (= c!67343 (validKeyInArray!0 (select (arr!17734 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!86685 () Bool)

(declare-fun res!380386 () Bool)

(assert (=> d!86685 (=> res!380386 e!339551)))

(assert (=> d!86685 (= res!380386 (bvsge #b00000000000000000000000000000000 (size!18098 a!2986)))))

(assert (=> d!86685 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!339551)))

(declare-fun bm!32889 () Bool)

(assert (=> bm!32889 (= call!32892 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!594337 () Bool)

(assert (=> b!594337 (= e!339550 call!32892)))

(assert (= (and d!86685 (not res!380386)) b!594336))

(assert (= (and b!594336 c!67343) b!594335))

(assert (= (and b!594336 (not c!67343)) b!594337))

(assert (= (and b!594335 res!380385) b!594334))

(assert (= (or b!594334 b!594337) bm!32889))

(assert (=> b!594335 m!572411))

(declare-fun m!572415 () Bool)

(assert (=> b!594335 m!572415))

(declare-fun m!572417 () Bool)

(assert (=> b!594335 m!572417))

(assert (=> b!594335 m!572411))

(declare-fun m!572419 () Bool)

(assert (=> b!594335 m!572419))

(assert (=> b!594336 m!572411))

(assert (=> b!594336 m!572411))

(declare-fun m!572421 () Bool)

(assert (=> b!594336 m!572421))

(declare-fun m!572423 () Bool)

(assert (=> bm!32889 m!572423))

(assert (=> b!594168 d!86685))

(declare-fun d!86687 () Bool)

(declare-fun res!380387 () Bool)

(declare-fun e!339553 () Bool)

(assert (=> d!86687 (=> res!380387 e!339553)))

(assert (=> d!86687 (= res!380387 (= (select (arr!17734 lt!269749) index!984) (select (arr!17734 a!2986) j!136)))))

(assert (=> d!86687 (= (arrayContainsKey!0 lt!269749 (select (arr!17734 a!2986) j!136) index!984) e!339553)))

(declare-fun b!594338 () Bool)

(declare-fun e!339554 () Bool)

(assert (=> b!594338 (= e!339553 e!339554)))

(declare-fun res!380388 () Bool)

(assert (=> b!594338 (=> (not res!380388) (not e!339554))))

(assert (=> b!594338 (= res!380388 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18098 lt!269749)))))

(declare-fun b!594339 () Bool)

(assert (=> b!594339 (= e!339554 (arrayContainsKey!0 lt!269749 (select (arr!17734 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86687 (not res!380387)) b!594338))

(assert (= (and b!594338 res!380388) b!594339))

(declare-fun m!572425 () Bool)

(assert (=> d!86687 m!572425))

(assert (=> b!594339 m!572237))

(declare-fun m!572427 () Bool)

(assert (=> b!594339 m!572427))

(assert (=> b!594178 d!86687))

(declare-fun d!86689 () Bool)

(declare-fun res!380393 () Bool)

(declare-fun e!339559 () Bool)

(assert (=> d!86689 (=> res!380393 e!339559)))

(assert (=> d!86689 (= res!380393 ((_ is Nil!11679) Nil!11679))))

(assert (=> d!86689 (= (noDuplicate!238 Nil!11679) e!339559)))

(declare-fun b!594344 () Bool)

(declare-fun e!339560 () Bool)

(assert (=> b!594344 (= e!339559 e!339560)))

(declare-fun res!380394 () Bool)

(assert (=> b!594344 (=> (not res!380394) (not e!339560))))

(assert (=> b!594344 (= res!380394 (not (contains!2891 (t!17902 Nil!11679) (h!12726 Nil!11679))))))

(declare-fun b!594345 () Bool)

(assert (=> b!594345 (= e!339560 (noDuplicate!238 (t!17902 Nil!11679)))))

(assert (= (and d!86689 (not res!380393)) b!594344))

(assert (= (and b!594344 res!380394) b!594345))

(declare-fun m!572429 () Bool)

(assert (=> b!594344 m!572429))

(declare-fun m!572431 () Bool)

(assert (=> b!594345 m!572431))

(assert (=> b!594167 d!86689))

(declare-fun b!594356 () Bool)

(declare-fun e!339572 () Bool)

(declare-fun call!32895 () Bool)

(assert (=> b!594356 (= e!339572 call!32895)))

(declare-fun b!594357 () Bool)

(declare-fun e!339569 () Bool)

(assert (=> b!594357 (= e!339569 (contains!2891 Nil!11679 (select (arr!17734 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!594358 () Bool)

(declare-fun e!339570 () Bool)

(declare-fun e!339571 () Bool)

(assert (=> b!594358 (= e!339570 e!339571)))

(declare-fun res!380403 () Bool)

(assert (=> b!594358 (=> (not res!380403) (not e!339571))))

(assert (=> b!594358 (= res!380403 (not e!339569))))

(declare-fun res!380401 () Bool)

(assert (=> b!594358 (=> (not res!380401) (not e!339569))))

(assert (=> b!594358 (= res!380401 (validKeyInArray!0 (select (arr!17734 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!594359 () Bool)

(assert (=> b!594359 (= e!339571 e!339572)))

(declare-fun c!67346 () Bool)

(assert (=> b!594359 (= c!67346 (validKeyInArray!0 (select (arr!17734 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!86691 () Bool)

(declare-fun res!380402 () Bool)

(assert (=> d!86691 (=> res!380402 e!339570)))

(assert (=> d!86691 (= res!380402 (bvsge #b00000000000000000000000000000000 (size!18098 a!2986)))))

(assert (=> d!86691 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11679) e!339570)))

(declare-fun bm!32892 () Bool)

(assert (=> bm!32892 (= call!32895 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67346 (Cons!11678 (select (arr!17734 a!2986) #b00000000000000000000000000000000) Nil!11679) Nil!11679)))))

(declare-fun b!594360 () Bool)

(assert (=> b!594360 (= e!339572 call!32895)))

(assert (= (and d!86691 (not res!380402)) b!594358))

(assert (= (and b!594358 res!380401) b!594357))

(assert (= (and b!594358 res!380403) b!594359))

(assert (= (and b!594359 c!67346) b!594356))

(assert (= (and b!594359 (not c!67346)) b!594360))

(assert (= (or b!594356 b!594360) bm!32892))

(assert (=> b!594357 m!572411))

(assert (=> b!594357 m!572411))

(declare-fun m!572433 () Bool)

(assert (=> b!594357 m!572433))

(assert (=> b!594358 m!572411))

(assert (=> b!594358 m!572411))

(assert (=> b!594358 m!572421))

(assert (=> b!594359 m!572411))

(assert (=> b!594359 m!572411))

(assert (=> b!594359 m!572421))

(assert (=> bm!32892 m!572411))

(declare-fun m!572435 () Bool)

(assert (=> bm!32892 m!572435))

(assert (=> b!594165 d!86691))

(declare-fun d!86693 () Bool)

(declare-fun res!380404 () Bool)

(declare-fun e!339573 () Bool)

(assert (=> d!86693 (=> res!380404 e!339573)))

(assert (=> d!86693 (= res!380404 (= (select (arr!17734 lt!269749) j!136) (select (arr!17734 a!2986) j!136)))))

(assert (=> d!86693 (= (arrayContainsKey!0 lt!269749 (select (arr!17734 a!2986) j!136) j!136) e!339573)))

(declare-fun b!594361 () Bool)

(declare-fun e!339574 () Bool)

(assert (=> b!594361 (= e!339573 e!339574)))

(declare-fun res!380405 () Bool)

(assert (=> b!594361 (=> (not res!380405) (not e!339574))))

(assert (=> b!594361 (= res!380405 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18098 lt!269749)))))

(declare-fun b!594362 () Bool)

(assert (=> b!594362 (= e!339574 (arrayContainsKey!0 lt!269749 (select (arr!17734 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86693 (not res!380404)) b!594361))

(assert (= (and b!594361 res!380405) b!594362))

(declare-fun m!572437 () Bool)

(assert (=> d!86693 m!572437))

(assert (=> b!594362 m!572237))

(declare-fun m!572439 () Bool)

(assert (=> b!594362 m!572439))

(assert (=> b!594164 d!86693))

(declare-fun d!86695 () Bool)

(declare-fun res!380406 () Bool)

(declare-fun e!339575 () Bool)

(assert (=> d!86695 (=> res!380406 e!339575)))

(assert (=> d!86695 (= res!380406 (= (select (arr!17734 lt!269749) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17734 a!2986) j!136)))))

(assert (=> d!86695 (= (arrayContainsKey!0 lt!269749 (select (arr!17734 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!339575)))

(declare-fun b!594363 () Bool)

(declare-fun e!339576 () Bool)

(assert (=> b!594363 (= e!339575 e!339576)))

(declare-fun res!380407 () Bool)

(assert (=> b!594363 (=> (not res!380407) (not e!339576))))

(assert (=> b!594363 (= res!380407 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18098 lt!269749)))))

(declare-fun b!594364 () Bool)

(assert (=> b!594364 (= e!339576 (arrayContainsKey!0 lt!269749 (select (arr!17734 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86695 (not res!380406)) b!594363))

(assert (= (and b!594363 res!380407) b!594364))

(declare-fun m!572441 () Bool)

(assert (=> d!86695 m!572441))

(assert (=> b!594364 m!572237))

(declare-fun m!572443 () Bool)

(assert (=> b!594364 m!572443))

(assert (=> b!594174 d!86695))

(declare-fun d!86697 () Bool)

(assert (=> d!86697 (arrayContainsKey!0 lt!269749 (select (arr!17734 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269833 () Unit!18613)

(declare-fun choose!114 (array!36942 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18613)

(assert (=> d!86697 (= lt!269833 (choose!114 lt!269749 (select (arr!17734 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86697 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86697 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269749 (select (arr!17734 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!269833)))

(declare-fun bs!18338 () Bool)

(assert (= bs!18338 d!86697))

(assert (=> bs!18338 m!572237))

(assert (=> bs!18338 m!572265))

(assert (=> bs!18338 m!572237))

(declare-fun m!572445 () Bool)

(assert (=> bs!18338 m!572445))

(assert (=> b!594174 d!86697))

(declare-fun d!86699 () Bool)

(assert (=> d!86699 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!594163 d!86699))

(declare-fun b!594391 () Bool)

(declare-fun c!67353 () Bool)

(declare-fun lt!269839 () (_ BitVec 64))

(assert (=> b!594391 (= c!67353 (= lt!269839 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!339596 () SeekEntryResult!6130)

(declare-fun e!339597 () SeekEntryResult!6130)

(assert (=> b!594391 (= e!339596 e!339597)))

(declare-fun b!594392 () Bool)

(declare-fun e!339595 () SeekEntryResult!6130)

(assert (=> b!594392 (= e!339595 e!339596)))

(declare-fun c!67355 () Bool)

(assert (=> b!594392 (= c!67355 (= lt!269839 (select (arr!17734 a!2986) j!136)))))

(declare-fun b!594393 () Bool)

(assert (=> b!594393 (= e!339595 Undefined!6130)))

(declare-fun lt!269838 () SeekEntryResult!6130)

(declare-fun d!86701 () Bool)

(assert (=> d!86701 (and (or ((_ is Undefined!6130) lt!269838) (not ((_ is Found!6130) lt!269838)) (and (bvsge (index!26766 lt!269838) #b00000000000000000000000000000000) (bvslt (index!26766 lt!269838) (size!18098 a!2986)))) (or ((_ is Undefined!6130) lt!269838) ((_ is Found!6130) lt!269838) (not ((_ is MissingVacant!6130) lt!269838)) (not (= (index!26768 lt!269838) vacantSpotIndex!68)) (and (bvsge (index!26768 lt!269838) #b00000000000000000000000000000000) (bvslt (index!26768 lt!269838) (size!18098 a!2986)))) (or ((_ is Undefined!6130) lt!269838) (ite ((_ is Found!6130) lt!269838) (= (select (arr!17734 a!2986) (index!26766 lt!269838)) (select (arr!17734 a!2986) j!136)) (and ((_ is MissingVacant!6130) lt!269838) (= (index!26768 lt!269838) vacantSpotIndex!68) (= (select (arr!17734 a!2986) (index!26768 lt!269838)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86701 (= lt!269838 e!339595)))

(declare-fun c!67354 () Bool)

(assert (=> d!86701 (= c!67354 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86701 (= lt!269839 (select (arr!17734 a!2986) index!984))))

(assert (=> d!86701 (validMask!0 mask!3053)))

(assert (=> d!86701 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17734 a!2986) j!136) a!2986 mask!3053) lt!269838)))

(declare-fun b!594394 () Bool)

(assert (=> b!594394 (= e!339597 (MissingVacant!6130 vacantSpotIndex!68))))

(declare-fun b!594395 () Bool)

(assert (=> b!594395 (= e!339596 (Found!6130 index!984))))

(declare-fun b!594396 () Bool)

(assert (=> b!594396 (= e!339597 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17734 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!86701 c!67354) b!594393))

(assert (= (and d!86701 (not c!67354)) b!594392))

(assert (= (and b!594392 c!67355) b!594395))

(assert (= (and b!594392 (not c!67355)) b!594391))

(assert (= (and b!594391 c!67353) b!594394))

(assert (= (and b!594391 (not c!67353)) b!594396))

(declare-fun m!572451 () Bool)

(assert (=> d!86701 m!572451))

(declare-fun m!572453 () Bool)

(assert (=> d!86701 m!572453))

(assert (=> d!86701 m!572285))

(assert (=> d!86701 m!572245))

(declare-fun m!572455 () Bool)

(assert (=> b!594396 m!572455))

(assert (=> b!594396 m!572455))

(assert (=> b!594396 m!572237))

(declare-fun m!572457 () Bool)

(assert (=> b!594396 m!572457))

(assert (=> b!594162 d!86701))

(declare-fun b!594399 () Bool)

(declare-fun c!67358 () Bool)

(declare-fun lt!269841 () (_ BitVec 64))

(assert (=> b!594399 (= c!67358 (= lt!269841 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!339601 () SeekEntryResult!6130)

(declare-fun e!339602 () SeekEntryResult!6130)

(assert (=> b!594399 (= e!339601 e!339602)))

(declare-fun b!594400 () Bool)

(declare-fun e!339600 () SeekEntryResult!6130)

(assert (=> b!594400 (= e!339600 e!339601)))

(declare-fun c!67360 () Bool)

(assert (=> b!594400 (= c!67360 (= lt!269841 lt!269743))))

(declare-fun b!594401 () Bool)

(assert (=> b!594401 (= e!339600 Undefined!6130)))

(declare-fun lt!269840 () SeekEntryResult!6130)

(declare-fun d!86717 () Bool)

(assert (=> d!86717 (and (or ((_ is Undefined!6130) lt!269840) (not ((_ is Found!6130) lt!269840)) (and (bvsge (index!26766 lt!269840) #b00000000000000000000000000000000) (bvslt (index!26766 lt!269840) (size!18098 lt!269749)))) (or ((_ is Undefined!6130) lt!269840) ((_ is Found!6130) lt!269840) (not ((_ is MissingVacant!6130) lt!269840)) (not (= (index!26768 lt!269840) vacantSpotIndex!68)) (and (bvsge (index!26768 lt!269840) #b00000000000000000000000000000000) (bvslt (index!26768 lt!269840) (size!18098 lt!269749)))) (or ((_ is Undefined!6130) lt!269840) (ite ((_ is Found!6130) lt!269840) (= (select (arr!17734 lt!269749) (index!26766 lt!269840)) lt!269743) (and ((_ is MissingVacant!6130) lt!269840) (= (index!26768 lt!269840) vacantSpotIndex!68) (= (select (arr!17734 lt!269749) (index!26768 lt!269840)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86717 (= lt!269840 e!339600)))

(declare-fun c!67359 () Bool)

(assert (=> d!86717 (= c!67359 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86717 (= lt!269841 (select (arr!17734 lt!269749) lt!269748))))

(assert (=> d!86717 (validMask!0 mask!3053)))

(assert (=> d!86717 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269748 vacantSpotIndex!68 lt!269743 lt!269749 mask!3053) lt!269840)))

(declare-fun b!594402 () Bool)

(assert (=> b!594402 (= e!339602 (MissingVacant!6130 vacantSpotIndex!68))))

(declare-fun b!594403 () Bool)

(assert (=> b!594403 (= e!339601 (Found!6130 lt!269748))))

(declare-fun b!594404 () Bool)

(assert (=> b!594404 (= e!339602 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!269748 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!269743 lt!269749 mask!3053))))

(assert (= (and d!86717 c!67359) b!594401))

(assert (= (and d!86717 (not c!67359)) b!594400))

(assert (= (and b!594400 c!67360) b!594403))

(assert (= (and b!594400 (not c!67360)) b!594399))

(assert (= (and b!594399 c!67358) b!594402))

(assert (= (and b!594399 (not c!67358)) b!594404))

(declare-fun m!572459 () Bool)

(assert (=> d!86717 m!572459))

(declare-fun m!572461 () Bool)

(assert (=> d!86717 m!572461))

(declare-fun m!572463 () Bool)

(assert (=> d!86717 m!572463))

(assert (=> d!86717 m!572245))

(declare-fun m!572465 () Bool)

(assert (=> b!594404 m!572465))

(assert (=> b!594404 m!572465))

(declare-fun m!572467 () Bool)

(assert (=> b!594404 m!572467))

(assert (=> b!594172 d!86717))

(declare-fun d!86719 () Bool)

(declare-fun e!339618 () Bool)

(assert (=> d!86719 e!339618))

(declare-fun res!380425 () Bool)

(assert (=> d!86719 (=> (not res!380425) (not e!339618))))

(assert (=> d!86719 (= res!380425 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18098 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18098 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18098 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18098 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18098 a!2986))))))

(declare-fun lt!269853 () Unit!18613)

(declare-fun choose!9 (array!36942 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18613)

(assert (=> d!86719 (= lt!269853 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269748 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86719 (validMask!0 mask!3053)))

(assert (=> d!86719 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269748 vacantSpotIndex!68 mask!3053) lt!269853)))

(declare-fun b!594430 () Bool)

(assert (=> b!594430 (= e!339618 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269748 vacantSpotIndex!68 (select (arr!17734 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269748 vacantSpotIndex!68 (select (store (arr!17734 a!2986) i!1108 k0!1786) j!136) (array!36943 (store (arr!17734 a!2986) i!1108 k0!1786) (size!18098 a!2986)) mask!3053)))))

(assert (= (and d!86719 res!380425) b!594430))

(declare-fun m!572491 () Bool)

(assert (=> d!86719 m!572491))

(assert (=> d!86719 m!572245))

(assert (=> b!594430 m!572249))

(assert (=> b!594430 m!572237))

(assert (=> b!594430 m!572237))

(assert (=> b!594430 m!572251))

(assert (=> b!594430 m!572249))

(declare-fun m!572493 () Bool)

(assert (=> b!594430 m!572493))

(assert (=> b!594430 m!572239))

(assert (=> b!594172 d!86719))

(declare-fun b!594443 () Bool)

(declare-fun c!67377 () Bool)

(declare-fun lt!269859 () (_ BitVec 64))

(assert (=> b!594443 (= c!67377 (= lt!269859 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!339626 () SeekEntryResult!6130)

(declare-fun e!339627 () SeekEntryResult!6130)

(assert (=> b!594443 (= e!339626 e!339627)))

(declare-fun b!594444 () Bool)

(declare-fun e!339625 () SeekEntryResult!6130)

(assert (=> b!594444 (= e!339625 e!339626)))

(declare-fun c!67379 () Bool)

(assert (=> b!594444 (= c!67379 (= lt!269859 lt!269743))))

(declare-fun b!594445 () Bool)

(assert (=> b!594445 (= e!339625 Undefined!6130)))

(declare-fun lt!269858 () SeekEntryResult!6130)

(declare-fun d!86725 () Bool)

(assert (=> d!86725 (and (or ((_ is Undefined!6130) lt!269858) (not ((_ is Found!6130) lt!269858)) (and (bvsge (index!26766 lt!269858) #b00000000000000000000000000000000) (bvslt (index!26766 lt!269858) (size!18098 lt!269749)))) (or ((_ is Undefined!6130) lt!269858) ((_ is Found!6130) lt!269858) (not ((_ is MissingVacant!6130) lt!269858)) (not (= (index!26768 lt!269858) vacantSpotIndex!68)) (and (bvsge (index!26768 lt!269858) #b00000000000000000000000000000000) (bvslt (index!26768 lt!269858) (size!18098 lt!269749)))) (or ((_ is Undefined!6130) lt!269858) (ite ((_ is Found!6130) lt!269858) (= (select (arr!17734 lt!269749) (index!26766 lt!269858)) lt!269743) (and ((_ is MissingVacant!6130) lt!269858) (= (index!26768 lt!269858) vacantSpotIndex!68) (= (select (arr!17734 lt!269749) (index!26768 lt!269858)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86725 (= lt!269858 e!339625)))

(declare-fun c!67378 () Bool)

(assert (=> d!86725 (= c!67378 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86725 (= lt!269859 (select (arr!17734 lt!269749) index!984))))

(assert (=> d!86725 (validMask!0 mask!3053)))

(assert (=> d!86725 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269743 lt!269749 mask!3053) lt!269858)))

(declare-fun b!594446 () Bool)

(assert (=> b!594446 (= e!339627 (MissingVacant!6130 vacantSpotIndex!68))))

(declare-fun b!594447 () Bool)

(assert (=> b!594447 (= e!339626 (Found!6130 index!984))))

(declare-fun b!594448 () Bool)

(assert (=> b!594448 (= e!339627 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!269743 lt!269749 mask!3053))))

(assert (= (and d!86725 c!67378) b!594445))

(assert (= (and d!86725 (not c!67378)) b!594444))

(assert (= (and b!594444 c!67379) b!594447))

(assert (= (and b!594444 (not c!67379)) b!594443))

(assert (= (and b!594443 c!67377) b!594446))

(assert (= (and b!594443 (not c!67377)) b!594448))

(declare-fun m!572495 () Bool)

(assert (=> d!86725 m!572495))

(declare-fun m!572497 () Bool)

(assert (=> d!86725 m!572497))

(assert (=> d!86725 m!572425))

(assert (=> d!86725 m!572245))

(assert (=> b!594448 m!572455))

(assert (=> b!594448 m!572455))

(declare-fun m!572499 () Bool)

(assert (=> b!594448 m!572499))

(assert (=> b!594172 d!86725))

(declare-fun b!594449 () Bool)

(declare-fun c!67380 () Bool)

(declare-fun lt!269861 () (_ BitVec 64))

(assert (=> b!594449 (= c!67380 (= lt!269861 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!339629 () SeekEntryResult!6130)

(declare-fun e!339630 () SeekEntryResult!6130)

(assert (=> b!594449 (= e!339629 e!339630)))

(declare-fun b!594450 () Bool)

(declare-fun e!339628 () SeekEntryResult!6130)

(assert (=> b!594450 (= e!339628 e!339629)))

(declare-fun c!67382 () Bool)

(assert (=> b!594450 (= c!67382 (= lt!269861 (select (arr!17734 a!2986) j!136)))))

(declare-fun b!594451 () Bool)

(assert (=> b!594451 (= e!339628 Undefined!6130)))

(declare-fun lt!269860 () SeekEntryResult!6130)

(declare-fun d!86727 () Bool)

(assert (=> d!86727 (and (or ((_ is Undefined!6130) lt!269860) (not ((_ is Found!6130) lt!269860)) (and (bvsge (index!26766 lt!269860) #b00000000000000000000000000000000) (bvslt (index!26766 lt!269860) (size!18098 a!2986)))) (or ((_ is Undefined!6130) lt!269860) ((_ is Found!6130) lt!269860) (not ((_ is MissingVacant!6130) lt!269860)) (not (= (index!26768 lt!269860) vacantSpotIndex!68)) (and (bvsge (index!26768 lt!269860) #b00000000000000000000000000000000) (bvslt (index!26768 lt!269860) (size!18098 a!2986)))) (or ((_ is Undefined!6130) lt!269860) (ite ((_ is Found!6130) lt!269860) (= (select (arr!17734 a!2986) (index!26766 lt!269860)) (select (arr!17734 a!2986) j!136)) (and ((_ is MissingVacant!6130) lt!269860) (= (index!26768 lt!269860) vacantSpotIndex!68) (= (select (arr!17734 a!2986) (index!26768 lt!269860)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86727 (= lt!269860 e!339628)))

(declare-fun c!67381 () Bool)

(assert (=> d!86727 (= c!67381 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86727 (= lt!269861 (select (arr!17734 a!2986) lt!269748))))

(assert (=> d!86727 (validMask!0 mask!3053)))

(assert (=> d!86727 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269748 vacantSpotIndex!68 (select (arr!17734 a!2986) j!136) a!2986 mask!3053) lt!269860)))

(declare-fun b!594452 () Bool)

(assert (=> b!594452 (= e!339630 (MissingVacant!6130 vacantSpotIndex!68))))

(declare-fun b!594453 () Bool)

(assert (=> b!594453 (= e!339629 (Found!6130 lt!269748))))

(declare-fun b!594454 () Bool)

(assert (=> b!594454 (= e!339630 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!269748 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17734 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!86727 c!67381) b!594451))

(assert (= (and d!86727 (not c!67381)) b!594450))

(assert (= (and b!594450 c!67382) b!594453))

(assert (= (and b!594450 (not c!67382)) b!594449))

(assert (= (and b!594449 c!67380) b!594452))

(assert (= (and b!594449 (not c!67380)) b!594454))

(declare-fun m!572501 () Bool)

(assert (=> d!86727 m!572501))

(declare-fun m!572503 () Bool)

(assert (=> d!86727 m!572503))

(declare-fun m!572505 () Bool)

(assert (=> d!86727 m!572505))

(assert (=> d!86727 m!572245))

(assert (=> b!594454 m!572465))

(assert (=> b!594454 m!572465))

(assert (=> b!594454 m!572237))

(declare-fun m!572507 () Bool)

(assert (=> b!594454 m!572507))

(assert (=> b!594172 d!86727))

(declare-fun d!86729 () Bool)

(declare-fun lt!269866 () (_ BitVec 32))

(assert (=> d!86729 (and (bvsge lt!269866 #b00000000000000000000000000000000) (bvslt lt!269866 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86729 (= lt!269866 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!86729 (validMask!0 mask!3053)))

(assert (=> d!86729 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!269866)))

(declare-fun bs!18339 () Bool)

(assert (= bs!18339 d!86729))

(declare-fun m!572519 () Bool)

(assert (=> bs!18339 m!572519))

(assert (=> bs!18339 m!572245))

(assert (=> b!594172 d!86729))

(declare-fun d!86733 () Bool)

(declare-fun lt!269869 () Bool)

(assert (=> d!86733 (= lt!269869 (select (content!233 Nil!11679) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!339640 () Bool)

(assert (=> d!86733 (= lt!269869 e!339640)))

(declare-fun res!380428 () Bool)

(assert (=> d!86733 (=> (not res!380428) (not e!339640))))

(assert (=> d!86733 (= res!380428 ((_ is Cons!11678) Nil!11679))))

(assert (=> d!86733 (= (contains!2891 Nil!11679 #b0000000000000000000000000000000000000000000000000000000000000000) lt!269869)))

(declare-fun b!594471 () Bool)

(declare-fun e!339639 () Bool)

(assert (=> b!594471 (= e!339640 e!339639)))

(declare-fun res!380429 () Bool)

(assert (=> b!594471 (=> res!380429 e!339639)))

(assert (=> b!594471 (= res!380429 (= (h!12726 Nil!11679) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594472 () Bool)

(assert (=> b!594472 (= e!339639 (contains!2891 (t!17902 Nil!11679) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!86733 res!380428) b!594471))

(assert (= (and b!594471 (not res!380429)) b!594472))

(assert (=> d!86733 m!572405))

(declare-fun m!572521 () Bool)

(assert (=> d!86733 m!572521))

(declare-fun m!572523 () Bool)

(assert (=> b!594472 m!572523))

(assert (=> b!594160 d!86733))

(declare-fun d!86735 () Bool)

(declare-fun lt!269901 () SeekEntryResult!6130)

(assert (=> d!86735 (and (or ((_ is Undefined!6130) lt!269901) (not ((_ is Found!6130) lt!269901)) (and (bvsge (index!26766 lt!269901) #b00000000000000000000000000000000) (bvslt (index!26766 lt!269901) (size!18098 a!2986)))) (or ((_ is Undefined!6130) lt!269901) ((_ is Found!6130) lt!269901) (not ((_ is MissingZero!6130) lt!269901)) (and (bvsge (index!26765 lt!269901) #b00000000000000000000000000000000) (bvslt (index!26765 lt!269901) (size!18098 a!2986)))) (or ((_ is Undefined!6130) lt!269901) ((_ is Found!6130) lt!269901) ((_ is MissingZero!6130) lt!269901) (not ((_ is MissingVacant!6130) lt!269901)) (and (bvsge (index!26768 lt!269901) #b00000000000000000000000000000000) (bvslt (index!26768 lt!269901) (size!18098 a!2986)))) (or ((_ is Undefined!6130) lt!269901) (ite ((_ is Found!6130) lt!269901) (= (select (arr!17734 a!2986) (index!26766 lt!269901)) k0!1786) (ite ((_ is MissingZero!6130) lt!269901) (= (select (arr!17734 a!2986) (index!26765 lt!269901)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6130) lt!269901) (= (select (arr!17734 a!2986) (index!26768 lt!269901)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!339675 () SeekEntryResult!6130)

(assert (=> d!86735 (= lt!269901 e!339675)))

(declare-fun c!67411 () Bool)

(declare-fun lt!269902 () SeekEntryResult!6130)

(assert (=> d!86735 (= c!67411 (and ((_ is Intermediate!6130) lt!269902) (undefined!6942 lt!269902)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36942 (_ BitVec 32)) SeekEntryResult!6130)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86735 (= lt!269902 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86735 (validMask!0 mask!3053)))

(assert (=> d!86735 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!269901)))

(declare-fun b!594524 () Bool)

(declare-fun c!67412 () Bool)

(declare-fun lt!269903 () (_ BitVec 64))

(assert (=> b!594524 (= c!67412 (= lt!269903 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!339674 () SeekEntryResult!6130)

(declare-fun e!339673 () SeekEntryResult!6130)

(assert (=> b!594524 (= e!339674 e!339673)))

(declare-fun b!594525 () Bool)

(assert (=> b!594525 (= e!339673 (seekKeyOrZeroReturnVacant!0 (x!55720 lt!269902) (index!26767 lt!269902) (index!26767 lt!269902) k0!1786 a!2986 mask!3053))))

(declare-fun b!594526 () Bool)

(assert (=> b!594526 (= e!339675 e!339674)))

(assert (=> b!594526 (= lt!269903 (select (arr!17734 a!2986) (index!26767 lt!269902)))))

(declare-fun c!67410 () Bool)

(assert (=> b!594526 (= c!67410 (= lt!269903 k0!1786))))

(declare-fun b!594527 () Bool)

(assert (=> b!594527 (= e!339674 (Found!6130 (index!26767 lt!269902)))))

(declare-fun b!594528 () Bool)

(assert (=> b!594528 (= e!339673 (MissingZero!6130 (index!26767 lt!269902)))))

(declare-fun b!594529 () Bool)

(assert (=> b!594529 (= e!339675 Undefined!6130)))

(assert (= (and d!86735 c!67411) b!594529))

(assert (= (and d!86735 (not c!67411)) b!594526))

(assert (= (and b!594526 c!67410) b!594527))

(assert (= (and b!594526 (not c!67410)) b!594524))

(assert (= (and b!594524 c!67412) b!594528))

(assert (= (and b!594524 (not c!67412)) b!594525))

(declare-fun m!572569 () Bool)

(assert (=> d!86735 m!572569))

(declare-fun m!572571 () Bool)

(assert (=> d!86735 m!572571))

(assert (=> d!86735 m!572245))

(assert (=> d!86735 m!572569))

(declare-fun m!572573 () Bool)

(assert (=> d!86735 m!572573))

(declare-fun m!572575 () Bool)

(assert (=> d!86735 m!572575))

(declare-fun m!572577 () Bool)

(assert (=> d!86735 m!572577))

(declare-fun m!572579 () Bool)

(assert (=> b!594525 m!572579))

(declare-fun m!572585 () Bool)

(assert (=> b!594526 m!572585))

(assert (=> b!594171 d!86735))

(check-sat (not d!86677) (not b!594344) (not d!86725) (not d!86727) (not bm!32889) (not b!594357) (not d!86719) (not d!86717) (not d!86701) (not b!594358) (not d!86729) (not b!594335) (not b!594404) (not d!86733) (not b!594339) (not b!594362) (not d!86697) (not b!594454) (not b!594430) (not d!86735) (not b!594345) (not b!594325) (not b!594336) (not b!594359) (not b!594396) (not bm!32892) (not b!594364) (not b!594448) (not b!594525) (not b!594472) (not b!594319))
(check-sat)
