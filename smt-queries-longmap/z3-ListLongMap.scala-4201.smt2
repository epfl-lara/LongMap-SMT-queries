; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57414 () Bool)

(assert start!57414)

(declare-fun b!635254 () Bool)

(declare-fun res!410966 () Bool)

(declare-fun e!363314 () Bool)

(assert (=> b!635254 (=> (not res!410966) (not e!363314))))

(declare-datatypes ((array!38205 0))(
  ( (array!38206 (arr!18328 (Array (_ BitVec 32) (_ BitVec 64))) (size!18692 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38205)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38205 (_ BitVec 32)) Bool)

(assert (=> b!635254 (= res!410966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!635255 () Bool)

(declare-datatypes ((Unit!21405 0))(
  ( (Unit!21406) )
))
(declare-fun e!363322 () Unit!21405)

(declare-fun Unit!21407 () Unit!21405)

(assert (=> b!635255 (= e!363322 Unit!21407)))

(declare-fun b!635256 () Bool)

(declare-fun res!410967 () Bool)

(declare-fun e!363321 () Bool)

(assert (=> b!635256 (=> (not res!410967) (not e!363321))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!635256 (= res!410967 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!635257 () Bool)

(declare-fun e!363317 () Bool)

(declare-datatypes ((SeekEntryResult!6724 0))(
  ( (MissingZero!6724 (index!29198 (_ BitVec 32))) (Found!6724 (index!29199 (_ BitVec 32))) (Intermediate!6724 (undefined!7536 Bool) (index!29200 (_ BitVec 32)) (x!58093 (_ BitVec 32))) (Undefined!6724) (MissingVacant!6724 (index!29201 (_ BitVec 32))) )
))
(declare-fun lt!293720 () SeekEntryResult!6724)

(declare-fun lt!293713 () SeekEntryResult!6724)

(assert (=> b!635257 (= e!363317 (= lt!293720 lt!293713))))

(declare-fun b!635258 () Bool)

(declare-fun res!410960 () Bool)

(assert (=> b!635258 (=> (not res!410960) (not e!363321))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!635258 (= res!410960 (and (= (size!18692 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18692 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18692 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!635259 () Bool)

(declare-fun res!410965 () Bool)

(assert (=> b!635259 (=> (not res!410965) (not e!363314))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!635259 (= res!410965 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18328 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!635260 () Bool)

(declare-fun e!363316 () Bool)

(declare-fun e!363315 () Bool)

(assert (=> b!635260 (= e!363316 e!363315)))

(declare-fun res!410956 () Bool)

(assert (=> b!635260 (=> (not res!410956) (not e!363315))))

(declare-fun lt!293718 () array!38205)

(assert (=> b!635260 (= res!410956 (arrayContainsKey!0 lt!293718 (select (arr!18328 a!2986) j!136) j!136))))

(declare-fun b!635261 () Bool)

(assert (=> b!635261 (= e!363315 (arrayContainsKey!0 lt!293718 (select (arr!18328 a!2986) j!136) index!984))))

(declare-fun b!635262 () Bool)

(declare-fun e!363324 () Bool)

(assert (=> b!635262 (= e!363324 (bvslt (size!18692 a!2986) #b01111111111111111111111111111111))))

(assert (=> b!635262 (arrayContainsKey!0 lt!293718 (select (arr!18328 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293712 () Unit!21405)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38205 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21405)

(assert (=> b!635262 (= lt!293712 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293718 (select (arr!18328 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun res!410971 () Bool)

(assert (=> start!57414 (=> (not res!410971) (not e!363321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57414 (= res!410971 (validMask!0 mask!3053))))

(assert (=> start!57414 e!363321))

(assert (=> start!57414 true))

(declare-fun array_inv!14187 (array!38205) Bool)

(assert (=> start!57414 (array_inv!14187 a!2986)))

(declare-fun b!635263 () Bool)

(declare-fun e!363318 () Bool)

(assert (=> b!635263 (= e!363314 e!363318)))

(declare-fun res!410970 () Bool)

(assert (=> b!635263 (=> (not res!410970) (not e!363318))))

(assert (=> b!635263 (= res!410970 (= (select (store (arr!18328 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!635263 (= lt!293718 (array!38206 (store (arr!18328 a!2986) i!1108 k0!1786) (size!18692 a!2986)))))

(declare-fun b!635264 () Bool)

(declare-fun e!363319 () Bool)

(assert (=> b!635264 (= e!363319 e!363316)))

(declare-fun res!410964 () Bool)

(assert (=> b!635264 (=> res!410964 e!363316)))

(declare-fun lt!293719 () (_ BitVec 64))

(declare-fun lt!293715 () (_ BitVec 64))

(assert (=> b!635264 (= res!410964 (or (not (= (select (arr!18328 a!2986) j!136) lt!293715)) (not (= (select (arr!18328 a!2986) j!136) lt!293719)) (bvsge j!136 index!984)))))

(declare-fun b!635265 () Bool)

(declare-fun e!363313 () Bool)

(assert (=> b!635265 (= e!363318 e!363313)))

(declare-fun res!410959 () Bool)

(assert (=> b!635265 (=> (not res!410959) (not e!363313))))

(assert (=> b!635265 (= res!410959 (and (= lt!293720 (Found!6724 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18328 a!2986) index!984) (select (arr!18328 a!2986) j!136))) (not (= (select (arr!18328 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38205 (_ BitVec 32)) SeekEntryResult!6724)

(assert (=> b!635265 (= lt!293720 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18328 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!635266 () Bool)

(declare-fun res!410969 () Bool)

(assert (=> b!635266 (=> (not res!410969) (not e!363321))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!635266 (= res!410969 (validKeyInArray!0 k0!1786))))

(declare-fun b!635267 () Bool)

(declare-fun e!363320 () Bool)

(assert (=> b!635267 (= e!363313 (not e!363320))))

(declare-fun res!410962 () Bool)

(assert (=> b!635267 (=> res!410962 e!363320)))

(declare-fun lt!293716 () SeekEntryResult!6724)

(assert (=> b!635267 (= res!410962 (not (= lt!293716 (Found!6724 index!984))))))

(declare-fun lt!293717 () Unit!21405)

(assert (=> b!635267 (= lt!293717 e!363322)))

(declare-fun c!72518 () Bool)

(assert (=> b!635267 (= c!72518 (= lt!293716 Undefined!6724))))

(assert (=> b!635267 (= lt!293716 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293715 lt!293718 mask!3053))))

(assert (=> b!635267 e!363317))

(declare-fun res!410968 () Bool)

(assert (=> b!635267 (=> (not res!410968) (not e!363317))))

(declare-fun lt!293722 () (_ BitVec 32))

(assert (=> b!635267 (= res!410968 (= lt!293713 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293722 vacantSpotIndex!68 lt!293715 lt!293718 mask!3053)))))

(assert (=> b!635267 (= lt!293713 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293722 vacantSpotIndex!68 (select (arr!18328 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!635267 (= lt!293715 (select (store (arr!18328 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!293721 () Unit!21405)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38205 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21405)

(assert (=> b!635267 (= lt!293721 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293722 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!635267 (= lt!293722 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!635268 () Bool)

(declare-fun Unit!21408 () Unit!21405)

(assert (=> b!635268 (= e!363322 Unit!21408)))

(assert (=> b!635268 false))

(declare-fun b!635269 () Bool)

(declare-fun res!410961 () Bool)

(assert (=> b!635269 (=> (not res!410961) (not e!363321))))

(assert (=> b!635269 (= res!410961 (validKeyInArray!0 (select (arr!18328 a!2986) j!136)))))

(declare-fun b!635270 () Bool)

(declare-fun res!410957 () Bool)

(assert (=> b!635270 (=> (not res!410957) (not e!363314))))

(declare-datatypes ((List!12276 0))(
  ( (Nil!12273) (Cons!12272 (h!13320 (_ BitVec 64)) (t!18496 List!12276)) )
))
(declare-fun arrayNoDuplicates!0 (array!38205 (_ BitVec 32) List!12276) Bool)

(assert (=> b!635270 (= res!410957 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12273))))

(declare-fun b!635271 () Bool)

(assert (=> b!635271 (= e!363320 e!363324)))

(declare-fun res!410963 () Bool)

(assert (=> b!635271 (=> res!410963 e!363324)))

(assert (=> b!635271 (= res!410963 (or (not (= (select (arr!18328 a!2986) j!136) lt!293715)) (not (= (select (arr!18328 a!2986) j!136) lt!293719)) (bvsge j!136 index!984)))))

(assert (=> b!635271 e!363319))

(declare-fun res!410958 () Bool)

(assert (=> b!635271 (=> (not res!410958) (not e!363319))))

(assert (=> b!635271 (= res!410958 (= lt!293719 (select (arr!18328 a!2986) j!136)))))

(assert (=> b!635271 (= lt!293719 (select (store (arr!18328 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!635272 () Bool)

(assert (=> b!635272 (= e!363321 e!363314)))

(declare-fun res!410955 () Bool)

(assert (=> b!635272 (=> (not res!410955) (not e!363314))))

(declare-fun lt!293714 () SeekEntryResult!6724)

(assert (=> b!635272 (= res!410955 (or (= lt!293714 (MissingZero!6724 i!1108)) (= lt!293714 (MissingVacant!6724 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38205 (_ BitVec 32)) SeekEntryResult!6724)

(assert (=> b!635272 (= lt!293714 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!57414 res!410971) b!635258))

(assert (= (and b!635258 res!410960) b!635269))

(assert (= (and b!635269 res!410961) b!635266))

(assert (= (and b!635266 res!410969) b!635256))

(assert (= (and b!635256 res!410967) b!635272))

(assert (= (and b!635272 res!410955) b!635254))

(assert (= (and b!635254 res!410966) b!635270))

(assert (= (and b!635270 res!410957) b!635259))

(assert (= (and b!635259 res!410965) b!635263))

(assert (= (and b!635263 res!410970) b!635265))

(assert (= (and b!635265 res!410959) b!635267))

(assert (= (and b!635267 res!410968) b!635257))

(assert (= (and b!635267 c!72518) b!635268))

(assert (= (and b!635267 (not c!72518)) b!635255))

(assert (= (and b!635267 (not res!410962)) b!635271))

(assert (= (and b!635271 res!410958) b!635264))

(assert (= (and b!635264 (not res!410964)) b!635260))

(assert (= (and b!635260 res!410956) b!635261))

(assert (= (and b!635271 (not res!410963)) b!635262))

(declare-fun m!610009 () Bool)

(assert (=> b!635261 m!610009))

(assert (=> b!635261 m!610009))

(declare-fun m!610011 () Bool)

(assert (=> b!635261 m!610011))

(declare-fun m!610013 () Bool)

(assert (=> b!635270 m!610013))

(declare-fun m!610015 () Bool)

(assert (=> b!635256 m!610015))

(assert (=> b!635264 m!610009))

(assert (=> b!635262 m!610009))

(assert (=> b!635262 m!610009))

(declare-fun m!610017 () Bool)

(assert (=> b!635262 m!610017))

(assert (=> b!635262 m!610009))

(declare-fun m!610019 () Bool)

(assert (=> b!635262 m!610019))

(declare-fun m!610021 () Bool)

(assert (=> b!635266 m!610021))

(declare-fun m!610023 () Bool)

(assert (=> b!635272 m!610023))

(assert (=> b!635271 m!610009))

(declare-fun m!610025 () Bool)

(assert (=> b!635271 m!610025))

(declare-fun m!610027 () Bool)

(assert (=> b!635271 m!610027))

(declare-fun m!610029 () Bool)

(assert (=> b!635259 m!610029))

(declare-fun m!610031 () Bool)

(assert (=> b!635265 m!610031))

(assert (=> b!635265 m!610009))

(assert (=> b!635265 m!610009))

(declare-fun m!610033 () Bool)

(assert (=> b!635265 m!610033))

(assert (=> b!635260 m!610009))

(assert (=> b!635260 m!610009))

(declare-fun m!610035 () Bool)

(assert (=> b!635260 m!610035))

(declare-fun m!610037 () Bool)

(assert (=> b!635267 m!610037))

(declare-fun m!610039 () Bool)

(assert (=> b!635267 m!610039))

(declare-fun m!610041 () Bool)

(assert (=> b!635267 m!610041))

(assert (=> b!635267 m!610009))

(assert (=> b!635267 m!610025))

(declare-fun m!610043 () Bool)

(assert (=> b!635267 m!610043))

(assert (=> b!635267 m!610009))

(declare-fun m!610045 () Bool)

(assert (=> b!635267 m!610045))

(declare-fun m!610047 () Bool)

(assert (=> b!635267 m!610047))

(assert (=> b!635269 m!610009))

(assert (=> b!635269 m!610009))

(declare-fun m!610049 () Bool)

(assert (=> b!635269 m!610049))

(assert (=> b!635263 m!610025))

(declare-fun m!610051 () Bool)

(assert (=> b!635263 m!610051))

(declare-fun m!610053 () Bool)

(assert (=> start!57414 m!610053))

(declare-fun m!610055 () Bool)

(assert (=> start!57414 m!610055))

(declare-fun m!610057 () Bool)

(assert (=> b!635254 m!610057))

(check-sat (not b!635254) (not b!635267) (not b!635266) (not b!635261) (not start!57414) (not b!635256) (not b!635270) (not b!635260) (not b!635272) (not b!635262) (not b!635265) (not b!635269))
(check-sat)
(get-model)

(declare-fun d!89831 () Bool)

(declare-fun res!411078 () Bool)

(declare-fun e!363401 () Bool)

(assert (=> d!89831 (=> res!411078 e!363401)))

(assert (=> d!89831 (= res!411078 (= (select (arr!18328 lt!293718) index!984) (select (arr!18328 a!2986) j!136)))))

(assert (=> d!89831 (= (arrayContainsKey!0 lt!293718 (select (arr!18328 a!2986) j!136) index!984) e!363401)))

(declare-fun b!635391 () Bool)

(declare-fun e!363402 () Bool)

(assert (=> b!635391 (= e!363401 e!363402)))

(declare-fun res!411079 () Bool)

(assert (=> b!635391 (=> (not res!411079) (not e!363402))))

(assert (=> b!635391 (= res!411079 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18692 lt!293718)))))

(declare-fun b!635392 () Bool)

(assert (=> b!635392 (= e!363402 (arrayContainsKey!0 lt!293718 (select (arr!18328 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!89831 (not res!411078)) b!635391))

(assert (= (and b!635391 res!411079) b!635392))

(declare-fun m!610159 () Bool)

(assert (=> d!89831 m!610159))

(assert (=> b!635392 m!610009))

(declare-fun m!610161 () Bool)

(assert (=> b!635392 m!610161))

(assert (=> b!635261 d!89831))

(declare-fun d!89833 () Bool)

(declare-fun res!411080 () Bool)

(declare-fun e!363403 () Bool)

(assert (=> d!89833 (=> res!411080 e!363403)))

(assert (=> d!89833 (= res!411080 (= (select (arr!18328 lt!293718) j!136) (select (arr!18328 a!2986) j!136)))))

(assert (=> d!89833 (= (arrayContainsKey!0 lt!293718 (select (arr!18328 a!2986) j!136) j!136) e!363403)))

(declare-fun b!635393 () Bool)

(declare-fun e!363404 () Bool)

(assert (=> b!635393 (= e!363403 e!363404)))

(declare-fun res!411081 () Bool)

(assert (=> b!635393 (=> (not res!411081) (not e!363404))))

(assert (=> b!635393 (= res!411081 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18692 lt!293718)))))

(declare-fun b!635394 () Bool)

(assert (=> b!635394 (= e!363404 (arrayContainsKey!0 lt!293718 (select (arr!18328 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89833 (not res!411080)) b!635393))

(assert (= (and b!635393 res!411081) b!635394))

(declare-fun m!610163 () Bool)

(assert (=> d!89833 m!610163))

(assert (=> b!635394 m!610009))

(declare-fun m!610165 () Bool)

(assert (=> b!635394 m!610165))

(assert (=> b!635260 d!89833))

(declare-fun d!89835 () Bool)

(declare-fun res!411082 () Bool)

(declare-fun e!363405 () Bool)

(assert (=> d!89835 (=> res!411082 e!363405)))

(assert (=> d!89835 (= res!411082 (= (select (arr!18328 lt!293718) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18328 a!2986) j!136)))))

(assert (=> d!89835 (= (arrayContainsKey!0 lt!293718 (select (arr!18328 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!363405)))

(declare-fun b!635395 () Bool)

(declare-fun e!363406 () Bool)

(assert (=> b!635395 (= e!363405 e!363406)))

(declare-fun res!411083 () Bool)

(assert (=> b!635395 (=> (not res!411083) (not e!363406))))

(assert (=> b!635395 (= res!411083 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18692 lt!293718)))))

(declare-fun b!635396 () Bool)

(assert (=> b!635396 (= e!363406 (arrayContainsKey!0 lt!293718 (select (arr!18328 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89835 (not res!411082)) b!635395))

(assert (= (and b!635395 res!411083) b!635396))

(declare-fun m!610167 () Bool)

(assert (=> d!89835 m!610167))

(assert (=> b!635396 m!610009))

(declare-fun m!610169 () Bool)

(assert (=> b!635396 m!610169))

(assert (=> b!635262 d!89835))

(declare-fun d!89837 () Bool)

(assert (=> d!89837 (arrayContainsKey!0 lt!293718 (select (arr!18328 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293791 () Unit!21405)

(declare-fun choose!114 (array!38205 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21405)

(assert (=> d!89837 (= lt!293791 (choose!114 lt!293718 (select (arr!18328 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!89837 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!89837 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293718 (select (arr!18328 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!293791)))

(declare-fun bs!19109 () Bool)

(assert (= bs!19109 d!89837))

(assert (=> bs!19109 m!610009))

(assert (=> bs!19109 m!610017))

(assert (=> bs!19109 m!610009))

(declare-fun m!610171 () Bool)

(assert (=> bs!19109 m!610171))

(assert (=> b!635262 d!89837))

(declare-fun b!635409 () Bool)

(declare-fun e!363414 () SeekEntryResult!6724)

(declare-fun lt!293799 () SeekEntryResult!6724)

(assert (=> b!635409 (= e!363414 (MissingZero!6724 (index!29200 lt!293799)))))

(declare-fun d!89839 () Bool)

(declare-fun lt!293798 () SeekEntryResult!6724)

(get-info :version)

(assert (=> d!89839 (and (or ((_ is Undefined!6724) lt!293798) (not ((_ is Found!6724) lt!293798)) (and (bvsge (index!29199 lt!293798) #b00000000000000000000000000000000) (bvslt (index!29199 lt!293798) (size!18692 a!2986)))) (or ((_ is Undefined!6724) lt!293798) ((_ is Found!6724) lt!293798) (not ((_ is MissingZero!6724) lt!293798)) (and (bvsge (index!29198 lt!293798) #b00000000000000000000000000000000) (bvslt (index!29198 lt!293798) (size!18692 a!2986)))) (or ((_ is Undefined!6724) lt!293798) ((_ is Found!6724) lt!293798) ((_ is MissingZero!6724) lt!293798) (not ((_ is MissingVacant!6724) lt!293798)) (and (bvsge (index!29201 lt!293798) #b00000000000000000000000000000000) (bvslt (index!29201 lt!293798) (size!18692 a!2986)))) (or ((_ is Undefined!6724) lt!293798) (ite ((_ is Found!6724) lt!293798) (= (select (arr!18328 a!2986) (index!29199 lt!293798)) k0!1786) (ite ((_ is MissingZero!6724) lt!293798) (= (select (arr!18328 a!2986) (index!29198 lt!293798)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6724) lt!293798) (= (select (arr!18328 a!2986) (index!29201 lt!293798)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!363413 () SeekEntryResult!6724)

(assert (=> d!89839 (= lt!293798 e!363413)))

(declare-fun c!72531 () Bool)

(assert (=> d!89839 (= c!72531 (and ((_ is Intermediate!6724) lt!293799) (undefined!7536 lt!293799)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38205 (_ BitVec 32)) SeekEntryResult!6724)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89839 (= lt!293799 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89839 (validMask!0 mask!3053)))

(assert (=> d!89839 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!293798)))

(declare-fun b!635410 () Bool)

(declare-fun e!363415 () SeekEntryResult!6724)

(assert (=> b!635410 (= e!363415 (Found!6724 (index!29200 lt!293799)))))

(declare-fun b!635411 () Bool)

(declare-fun c!72533 () Bool)

(declare-fun lt!293800 () (_ BitVec 64))

(assert (=> b!635411 (= c!72533 (= lt!293800 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!635411 (= e!363415 e!363414)))

(declare-fun b!635412 () Bool)

(assert (=> b!635412 (= e!363414 (seekKeyOrZeroReturnVacant!0 (x!58093 lt!293799) (index!29200 lt!293799) (index!29200 lt!293799) k0!1786 a!2986 mask!3053))))

(declare-fun b!635413 () Bool)

(assert (=> b!635413 (= e!363413 e!363415)))

(assert (=> b!635413 (= lt!293800 (select (arr!18328 a!2986) (index!29200 lt!293799)))))

(declare-fun c!72532 () Bool)

(assert (=> b!635413 (= c!72532 (= lt!293800 k0!1786))))

(declare-fun b!635414 () Bool)

(assert (=> b!635414 (= e!363413 Undefined!6724)))

(assert (= (and d!89839 c!72531) b!635414))

(assert (= (and d!89839 (not c!72531)) b!635413))

(assert (= (and b!635413 c!72532) b!635410))

(assert (= (and b!635413 (not c!72532)) b!635411))

(assert (= (and b!635411 c!72533) b!635409))

(assert (= (and b!635411 (not c!72533)) b!635412))

(declare-fun m!610173 () Bool)

(assert (=> d!89839 m!610173))

(assert (=> d!89839 m!610053))

(declare-fun m!610175 () Bool)

(assert (=> d!89839 m!610175))

(assert (=> d!89839 m!610175))

(declare-fun m!610177 () Bool)

(assert (=> d!89839 m!610177))

(declare-fun m!610179 () Bool)

(assert (=> d!89839 m!610179))

(declare-fun m!610181 () Bool)

(assert (=> d!89839 m!610181))

(declare-fun m!610183 () Bool)

(assert (=> b!635412 m!610183))

(declare-fun m!610185 () Bool)

(assert (=> b!635413 m!610185))

(assert (=> b!635272 d!89839))

(declare-fun d!89841 () Bool)

(assert (=> d!89841 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57414 d!89841))

(declare-fun d!89843 () Bool)

(assert (=> d!89843 (= (array_inv!14187 a!2986) (bvsge (size!18692 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57414 d!89843))

(declare-fun b!635427 () Bool)

(declare-fun e!363422 () SeekEntryResult!6724)

(assert (=> b!635427 (= e!363422 (Found!6724 index!984))))

(declare-fun b!635428 () Bool)

(declare-fun e!363424 () SeekEntryResult!6724)

(assert (=> b!635428 (= e!363424 Undefined!6724)))

(declare-fun lt!293805 () SeekEntryResult!6724)

(declare-fun d!89845 () Bool)

(assert (=> d!89845 (and (or ((_ is Undefined!6724) lt!293805) (not ((_ is Found!6724) lt!293805)) (and (bvsge (index!29199 lt!293805) #b00000000000000000000000000000000) (bvslt (index!29199 lt!293805) (size!18692 a!2986)))) (or ((_ is Undefined!6724) lt!293805) ((_ is Found!6724) lt!293805) (not ((_ is MissingVacant!6724) lt!293805)) (not (= (index!29201 lt!293805) vacantSpotIndex!68)) (and (bvsge (index!29201 lt!293805) #b00000000000000000000000000000000) (bvslt (index!29201 lt!293805) (size!18692 a!2986)))) (or ((_ is Undefined!6724) lt!293805) (ite ((_ is Found!6724) lt!293805) (= (select (arr!18328 a!2986) (index!29199 lt!293805)) (select (arr!18328 a!2986) j!136)) (and ((_ is MissingVacant!6724) lt!293805) (= (index!29201 lt!293805) vacantSpotIndex!68) (= (select (arr!18328 a!2986) (index!29201 lt!293805)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89845 (= lt!293805 e!363424)))

(declare-fun c!72542 () Bool)

(assert (=> d!89845 (= c!72542 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!293806 () (_ BitVec 64))

(assert (=> d!89845 (= lt!293806 (select (arr!18328 a!2986) index!984))))

(assert (=> d!89845 (validMask!0 mask!3053)))

(assert (=> d!89845 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18328 a!2986) j!136) a!2986 mask!3053) lt!293805)))

(declare-fun b!635429 () Bool)

(declare-fun c!72540 () Bool)

(assert (=> b!635429 (= c!72540 (= lt!293806 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!363423 () SeekEntryResult!6724)

(assert (=> b!635429 (= e!363422 e!363423)))

(declare-fun b!635430 () Bool)

(assert (=> b!635430 (= e!363423 (MissingVacant!6724 vacantSpotIndex!68))))

(declare-fun b!635431 () Bool)

(assert (=> b!635431 (= e!363423 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18328 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!635432 () Bool)

(assert (=> b!635432 (= e!363424 e!363422)))

(declare-fun c!72541 () Bool)

(assert (=> b!635432 (= c!72541 (= lt!293806 (select (arr!18328 a!2986) j!136)))))

(assert (= (and d!89845 c!72542) b!635428))

(assert (= (and d!89845 (not c!72542)) b!635432))

(assert (= (and b!635432 c!72541) b!635427))

(assert (= (and b!635432 (not c!72541)) b!635429))

(assert (= (and b!635429 c!72540) b!635430))

(assert (= (and b!635429 (not c!72540)) b!635431))

(declare-fun m!610187 () Bool)

(assert (=> d!89845 m!610187))

(declare-fun m!610189 () Bool)

(assert (=> d!89845 m!610189))

(assert (=> d!89845 m!610031))

(assert (=> d!89845 m!610053))

(declare-fun m!610191 () Bool)

(assert (=> b!635431 m!610191))

(assert (=> b!635431 m!610191))

(assert (=> b!635431 m!610009))

(declare-fun m!610193 () Bool)

(assert (=> b!635431 m!610193))

(assert (=> b!635265 d!89845))

(declare-fun bm!33405 () Bool)

(declare-fun call!33408 () Bool)

(assert (=> bm!33405 (= call!33408 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!635459 () Bool)

(declare-fun e!363448 () Bool)

(declare-fun e!363446 () Bool)

(assert (=> b!635459 (= e!363448 e!363446)))

(declare-fun lt!293828 () (_ BitVec 64))

(assert (=> b!635459 (= lt!293828 (select (arr!18328 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!293827 () Unit!21405)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38205 (_ BitVec 64) (_ BitVec 32)) Unit!21405)

(assert (=> b!635459 (= lt!293827 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!293828 #b00000000000000000000000000000000))))

(assert (=> b!635459 (arrayContainsKey!0 a!2986 lt!293828 #b00000000000000000000000000000000)))

(declare-fun lt!293826 () Unit!21405)

(assert (=> b!635459 (= lt!293826 lt!293827)))

(declare-fun res!411101 () Bool)

(assert (=> b!635459 (= res!411101 (= (seekEntryOrOpen!0 (select (arr!18328 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6724 #b00000000000000000000000000000000)))))

(assert (=> b!635459 (=> (not res!411101) (not e!363446))))

(declare-fun b!635460 () Bool)

(assert (=> b!635460 (= e!363448 call!33408)))

(declare-fun b!635461 () Bool)

(declare-fun e!363447 () Bool)

(assert (=> b!635461 (= e!363447 e!363448)))

(declare-fun c!72548 () Bool)

(assert (=> b!635461 (= c!72548 (validKeyInArray!0 (select (arr!18328 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89853 () Bool)

(declare-fun res!411100 () Bool)

(assert (=> d!89853 (=> res!411100 e!363447)))

(assert (=> d!89853 (= res!411100 (bvsge #b00000000000000000000000000000000 (size!18692 a!2986)))))

(assert (=> d!89853 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!363447)))

(declare-fun b!635462 () Bool)

(assert (=> b!635462 (= e!363446 call!33408)))

(assert (= (and d!89853 (not res!411100)) b!635461))

(assert (= (and b!635461 c!72548) b!635459))

(assert (= (and b!635461 (not c!72548)) b!635460))

(assert (= (and b!635459 res!411101) b!635462))

(assert (= (or b!635462 b!635460) bm!33405))

(declare-fun m!610211 () Bool)

(assert (=> bm!33405 m!610211))

(declare-fun m!610213 () Bool)

(assert (=> b!635459 m!610213))

(declare-fun m!610215 () Bool)

(assert (=> b!635459 m!610215))

(declare-fun m!610217 () Bool)

(assert (=> b!635459 m!610217))

(assert (=> b!635459 m!610213))

(declare-fun m!610219 () Bool)

(assert (=> b!635459 m!610219))

(assert (=> b!635461 m!610213))

(assert (=> b!635461 m!610213))

(declare-fun m!610221 () Bool)

(assert (=> b!635461 m!610221))

(assert (=> b!635254 d!89853))

(declare-fun d!89861 () Bool)

(assert (=> d!89861 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!635266 d!89861))

(declare-fun b!635475 () Bool)

(declare-fun e!363455 () SeekEntryResult!6724)

(assert (=> b!635475 (= e!363455 (Found!6724 index!984))))

(declare-fun b!635476 () Bool)

(declare-fun e!363457 () SeekEntryResult!6724)

(assert (=> b!635476 (= e!363457 Undefined!6724)))

(declare-fun d!89863 () Bool)

(declare-fun lt!293831 () SeekEntryResult!6724)

(assert (=> d!89863 (and (or ((_ is Undefined!6724) lt!293831) (not ((_ is Found!6724) lt!293831)) (and (bvsge (index!29199 lt!293831) #b00000000000000000000000000000000) (bvslt (index!29199 lt!293831) (size!18692 lt!293718)))) (or ((_ is Undefined!6724) lt!293831) ((_ is Found!6724) lt!293831) (not ((_ is MissingVacant!6724) lt!293831)) (not (= (index!29201 lt!293831) vacantSpotIndex!68)) (and (bvsge (index!29201 lt!293831) #b00000000000000000000000000000000) (bvslt (index!29201 lt!293831) (size!18692 lt!293718)))) (or ((_ is Undefined!6724) lt!293831) (ite ((_ is Found!6724) lt!293831) (= (select (arr!18328 lt!293718) (index!29199 lt!293831)) lt!293715) (and ((_ is MissingVacant!6724) lt!293831) (= (index!29201 lt!293831) vacantSpotIndex!68) (= (select (arr!18328 lt!293718) (index!29201 lt!293831)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89863 (= lt!293831 e!363457)))

(declare-fun c!72557 () Bool)

(assert (=> d!89863 (= c!72557 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!293832 () (_ BitVec 64))

(assert (=> d!89863 (= lt!293832 (select (arr!18328 lt!293718) index!984))))

(assert (=> d!89863 (validMask!0 mask!3053)))

(assert (=> d!89863 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293715 lt!293718 mask!3053) lt!293831)))

(declare-fun b!635477 () Bool)

(declare-fun c!72555 () Bool)

(assert (=> b!635477 (= c!72555 (= lt!293832 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!363456 () SeekEntryResult!6724)

(assert (=> b!635477 (= e!363455 e!363456)))

(declare-fun b!635478 () Bool)

(assert (=> b!635478 (= e!363456 (MissingVacant!6724 vacantSpotIndex!68))))

(declare-fun b!635479 () Bool)

(assert (=> b!635479 (= e!363456 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!293715 lt!293718 mask!3053))))

(declare-fun b!635480 () Bool)

(assert (=> b!635480 (= e!363457 e!363455)))

(declare-fun c!72556 () Bool)

(assert (=> b!635480 (= c!72556 (= lt!293832 lt!293715))))

(assert (= (and d!89863 c!72557) b!635476))

(assert (= (and d!89863 (not c!72557)) b!635480))

(assert (= (and b!635480 c!72556) b!635475))

(assert (= (and b!635480 (not c!72556)) b!635477))

(assert (= (and b!635477 c!72555) b!635478))

(assert (= (and b!635477 (not c!72555)) b!635479))

(declare-fun m!610223 () Bool)

(assert (=> d!89863 m!610223))

(declare-fun m!610225 () Bool)

(assert (=> d!89863 m!610225))

(assert (=> d!89863 m!610159))

(assert (=> d!89863 m!610053))

(assert (=> b!635479 m!610191))

(assert (=> b!635479 m!610191))

(declare-fun m!610229 () Bool)

(assert (=> b!635479 m!610229))

(assert (=> b!635267 d!89863))

(declare-fun b!635483 () Bool)

(declare-fun e!363460 () SeekEntryResult!6724)

(assert (=> b!635483 (= e!363460 (Found!6724 lt!293722))))

(declare-fun b!635484 () Bool)

(declare-fun e!363462 () SeekEntryResult!6724)

(assert (=> b!635484 (= e!363462 Undefined!6724)))

(declare-fun lt!293834 () SeekEntryResult!6724)

(declare-fun d!89867 () Bool)

(assert (=> d!89867 (and (or ((_ is Undefined!6724) lt!293834) (not ((_ is Found!6724) lt!293834)) (and (bvsge (index!29199 lt!293834) #b00000000000000000000000000000000) (bvslt (index!29199 lt!293834) (size!18692 a!2986)))) (or ((_ is Undefined!6724) lt!293834) ((_ is Found!6724) lt!293834) (not ((_ is MissingVacant!6724) lt!293834)) (not (= (index!29201 lt!293834) vacantSpotIndex!68)) (and (bvsge (index!29201 lt!293834) #b00000000000000000000000000000000) (bvslt (index!29201 lt!293834) (size!18692 a!2986)))) (or ((_ is Undefined!6724) lt!293834) (ite ((_ is Found!6724) lt!293834) (= (select (arr!18328 a!2986) (index!29199 lt!293834)) (select (arr!18328 a!2986) j!136)) (and ((_ is MissingVacant!6724) lt!293834) (= (index!29201 lt!293834) vacantSpotIndex!68) (= (select (arr!18328 a!2986) (index!29201 lt!293834)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89867 (= lt!293834 e!363462)))

(declare-fun c!72560 () Bool)

(assert (=> d!89867 (= c!72560 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!293835 () (_ BitVec 64))

(assert (=> d!89867 (= lt!293835 (select (arr!18328 a!2986) lt!293722))))

(assert (=> d!89867 (validMask!0 mask!3053)))

(assert (=> d!89867 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293722 vacantSpotIndex!68 (select (arr!18328 a!2986) j!136) a!2986 mask!3053) lt!293834)))

(declare-fun b!635485 () Bool)

(declare-fun c!72558 () Bool)

(assert (=> b!635485 (= c!72558 (= lt!293835 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!363461 () SeekEntryResult!6724)

(assert (=> b!635485 (= e!363460 e!363461)))

(declare-fun b!635486 () Bool)

(assert (=> b!635486 (= e!363461 (MissingVacant!6724 vacantSpotIndex!68))))

(declare-fun b!635487 () Bool)

(assert (=> b!635487 (= e!363461 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!293722 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18328 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!635488 () Bool)

(assert (=> b!635488 (= e!363462 e!363460)))

(declare-fun c!72559 () Bool)

(assert (=> b!635488 (= c!72559 (= lt!293835 (select (arr!18328 a!2986) j!136)))))

(assert (= (and d!89867 c!72560) b!635484))

(assert (= (and d!89867 (not c!72560)) b!635488))

(assert (= (and b!635488 c!72559) b!635483))

(assert (= (and b!635488 (not c!72559)) b!635485))

(assert (= (and b!635485 c!72558) b!635486))

(assert (= (and b!635485 (not c!72558)) b!635487))

(declare-fun m!610233 () Bool)

(assert (=> d!89867 m!610233))

(declare-fun m!610235 () Bool)

(assert (=> d!89867 m!610235))

(declare-fun m!610237 () Bool)

(assert (=> d!89867 m!610237))

(assert (=> d!89867 m!610053))

(declare-fun m!610239 () Bool)

(assert (=> b!635487 m!610239))

(assert (=> b!635487 m!610239))

(assert (=> b!635487 m!610009))

(declare-fun m!610241 () Bool)

(assert (=> b!635487 m!610241))

(assert (=> b!635267 d!89867))

(declare-fun d!89871 () Bool)

(declare-fun lt!293842 () (_ BitVec 32))

(assert (=> d!89871 (and (bvsge lt!293842 #b00000000000000000000000000000000) (bvslt lt!293842 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89871 (= lt!293842 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!89871 (validMask!0 mask!3053)))

(assert (=> d!89871 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!293842)))

(declare-fun bs!19111 () Bool)

(assert (= bs!19111 d!89871))

(declare-fun m!610261 () Bool)

(assert (=> bs!19111 m!610261))

(assert (=> bs!19111 m!610053))

(assert (=> b!635267 d!89871))

(declare-fun b!635511 () Bool)

(declare-fun e!363477 () SeekEntryResult!6724)

(assert (=> b!635511 (= e!363477 (Found!6724 lt!293722))))

(declare-fun b!635512 () Bool)

(declare-fun e!363479 () SeekEntryResult!6724)

(assert (=> b!635512 (= e!363479 Undefined!6724)))

(declare-fun lt!293843 () SeekEntryResult!6724)

(declare-fun d!89877 () Bool)

(assert (=> d!89877 (and (or ((_ is Undefined!6724) lt!293843) (not ((_ is Found!6724) lt!293843)) (and (bvsge (index!29199 lt!293843) #b00000000000000000000000000000000) (bvslt (index!29199 lt!293843) (size!18692 lt!293718)))) (or ((_ is Undefined!6724) lt!293843) ((_ is Found!6724) lt!293843) (not ((_ is MissingVacant!6724) lt!293843)) (not (= (index!29201 lt!293843) vacantSpotIndex!68)) (and (bvsge (index!29201 lt!293843) #b00000000000000000000000000000000) (bvslt (index!29201 lt!293843) (size!18692 lt!293718)))) (or ((_ is Undefined!6724) lt!293843) (ite ((_ is Found!6724) lt!293843) (= (select (arr!18328 lt!293718) (index!29199 lt!293843)) lt!293715) (and ((_ is MissingVacant!6724) lt!293843) (= (index!29201 lt!293843) vacantSpotIndex!68) (= (select (arr!18328 lt!293718) (index!29201 lt!293843)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89877 (= lt!293843 e!363479)))

(declare-fun c!72571 () Bool)

(assert (=> d!89877 (= c!72571 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!293844 () (_ BitVec 64))

(assert (=> d!89877 (= lt!293844 (select (arr!18328 lt!293718) lt!293722))))

(assert (=> d!89877 (validMask!0 mask!3053)))

(assert (=> d!89877 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293722 vacantSpotIndex!68 lt!293715 lt!293718 mask!3053) lt!293843)))

(declare-fun b!635513 () Bool)

(declare-fun c!72569 () Bool)

(assert (=> b!635513 (= c!72569 (= lt!293844 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!363478 () SeekEntryResult!6724)

(assert (=> b!635513 (= e!363477 e!363478)))

(declare-fun b!635514 () Bool)

(assert (=> b!635514 (= e!363478 (MissingVacant!6724 vacantSpotIndex!68))))

(declare-fun b!635515 () Bool)

(assert (=> b!635515 (= e!363478 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!293722 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!293715 lt!293718 mask!3053))))

(declare-fun b!635516 () Bool)

(assert (=> b!635516 (= e!363479 e!363477)))

(declare-fun c!72570 () Bool)

(assert (=> b!635516 (= c!72570 (= lt!293844 lt!293715))))

(assert (= (and d!89877 c!72571) b!635512))

(assert (= (and d!89877 (not c!72571)) b!635516))

(assert (= (and b!635516 c!72570) b!635511))

(assert (= (and b!635516 (not c!72570)) b!635513))

(assert (= (and b!635513 c!72569) b!635514))

(assert (= (and b!635513 (not c!72569)) b!635515))

(declare-fun m!610263 () Bool)

(assert (=> d!89877 m!610263))

(declare-fun m!610265 () Bool)

(assert (=> d!89877 m!610265))

(declare-fun m!610267 () Bool)

(assert (=> d!89877 m!610267))

(assert (=> d!89877 m!610053))

(assert (=> b!635515 m!610239))

(assert (=> b!635515 m!610239))

(declare-fun m!610269 () Bool)

(assert (=> b!635515 m!610269))

(assert (=> b!635267 d!89877))

(declare-fun d!89879 () Bool)

(declare-fun e!363493 () Bool)

(assert (=> d!89879 e!363493))

(declare-fun res!411122 () Bool)

(assert (=> d!89879 (=> (not res!411122) (not e!363493))))

(assert (=> d!89879 (= res!411122 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18692 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18692 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18692 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18692 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18692 a!2986))))))

(declare-fun lt!293850 () Unit!21405)

(declare-fun choose!9 (array!38205 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21405)

(assert (=> d!89879 (= lt!293850 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293722 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89879 (validMask!0 mask!3053)))

(assert (=> d!89879 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293722 vacantSpotIndex!68 mask!3053) lt!293850)))

(declare-fun b!635531 () Bool)

(assert (=> b!635531 (= e!363493 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293722 vacantSpotIndex!68 (select (arr!18328 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293722 vacantSpotIndex!68 (select (store (arr!18328 a!2986) i!1108 k0!1786) j!136) (array!38206 (store (arr!18328 a!2986) i!1108 k0!1786) (size!18692 a!2986)) mask!3053)))))

(assert (= (and d!89879 res!411122) b!635531))

(declare-fun m!610287 () Bool)

(assert (=> d!89879 m!610287))

(assert (=> d!89879 m!610053))

(assert (=> b!635531 m!610025))

(assert (=> b!635531 m!610009))

(assert (=> b!635531 m!610045))

(assert (=> b!635531 m!610039))

(assert (=> b!635531 m!610039))

(declare-fun m!610289 () Bool)

(assert (=> b!635531 m!610289))

(assert (=> b!635531 m!610009))

(assert (=> b!635267 d!89879))

(declare-fun d!89889 () Bool)

(declare-fun res!411123 () Bool)

(declare-fun e!363494 () Bool)

(assert (=> d!89889 (=> res!411123 e!363494)))

(assert (=> d!89889 (= res!411123 (= (select (arr!18328 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89889 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!363494)))

(declare-fun b!635532 () Bool)

(declare-fun e!363495 () Bool)

(assert (=> b!635532 (= e!363494 e!363495)))

(declare-fun res!411124 () Bool)

(assert (=> b!635532 (=> (not res!411124) (not e!363495))))

(assert (=> b!635532 (= res!411124 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18692 a!2986)))))

(declare-fun b!635533 () Bool)

(assert (=> b!635533 (= e!363495 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89889 (not res!411123)) b!635532))

(assert (= (and b!635532 res!411124) b!635533))

(assert (=> d!89889 m!610213))

(declare-fun m!610291 () Bool)

(assert (=> b!635533 m!610291))

(assert (=> b!635256 d!89889))

(declare-fun d!89891 () Bool)

(assert (=> d!89891 (= (validKeyInArray!0 (select (arr!18328 a!2986) j!136)) (and (not (= (select (arr!18328 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18328 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!635269 d!89891))

(declare-fun b!635574 () Bool)

(declare-fun e!363521 () Bool)

(declare-fun call!33414 () Bool)

(assert (=> b!635574 (= e!363521 call!33414)))

(declare-fun bm!33411 () Bool)

(declare-fun c!72590 () Bool)

(assert (=> bm!33411 (= call!33414 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72590 (Cons!12272 (select (arr!18328 a!2986) #b00000000000000000000000000000000) Nil!12273) Nil!12273)))))

(declare-fun b!635575 () Bool)

(assert (=> b!635575 (= e!363521 call!33414)))

(declare-fun b!635576 () Bool)

(declare-fun e!363519 () Bool)

(declare-fun e!363520 () Bool)

(assert (=> b!635576 (= e!363519 e!363520)))

(declare-fun res!411133 () Bool)

(assert (=> b!635576 (=> (not res!411133) (not e!363520))))

(declare-fun e!363522 () Bool)

(assert (=> b!635576 (= res!411133 (not e!363522))))

(declare-fun res!411131 () Bool)

(assert (=> b!635576 (=> (not res!411131) (not e!363522))))

(assert (=> b!635576 (= res!411131 (validKeyInArray!0 (select (arr!18328 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!635577 () Bool)

(assert (=> b!635577 (= e!363520 e!363521)))

(assert (=> b!635577 (= c!72590 (validKeyInArray!0 (select (arr!18328 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89893 () Bool)

(declare-fun res!411132 () Bool)

(assert (=> d!89893 (=> res!411132 e!363519)))

(assert (=> d!89893 (= res!411132 (bvsge #b00000000000000000000000000000000 (size!18692 a!2986)))))

(assert (=> d!89893 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12273) e!363519)))

(declare-fun b!635578 () Bool)

(declare-fun contains!3075 (List!12276 (_ BitVec 64)) Bool)

(assert (=> b!635578 (= e!363522 (contains!3075 Nil!12273 (select (arr!18328 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89893 (not res!411132)) b!635576))

(assert (= (and b!635576 res!411131) b!635578))

(assert (= (and b!635576 res!411133) b!635577))

(assert (= (and b!635577 c!72590) b!635575))

(assert (= (and b!635577 (not c!72590)) b!635574))

(assert (= (or b!635575 b!635574) bm!33411))

(assert (=> bm!33411 m!610213))

(declare-fun m!610319 () Bool)

(assert (=> bm!33411 m!610319))

(assert (=> b!635576 m!610213))

(assert (=> b!635576 m!610213))

(assert (=> b!635576 m!610221))

(assert (=> b!635577 m!610213))

(assert (=> b!635577 m!610213))

(assert (=> b!635577 m!610221))

(assert (=> b!635578 m!610213))

(assert (=> b!635578 m!610213))

(declare-fun m!610321 () Bool)

(assert (=> b!635578 m!610321))

(assert (=> b!635270 d!89893))

(check-sat (not b!635394) (not b!635577) (not b!635459) (not bm!33405) (not b!635515) (not b!635533) (not d!89845) (not bm!33411) (not b!635431) (not d!89879) (not d!89877) (not b!635396) (not d!89871) (not d!89863) (not d!89839) (not b!635392) (not b!635461) (not b!635576) (not b!635487) (not b!635578) (not d!89867) (not b!635412) (not b!635479) (not b!635531) (not d!89837))
(check-sat)
