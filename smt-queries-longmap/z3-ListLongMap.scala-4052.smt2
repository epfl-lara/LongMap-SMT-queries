; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55590 () Bool)

(assert start!55590)

(declare-datatypes ((array!37266 0))(
  ( (array!37267 (arr!17881 (Array (_ BitVec 32) (_ BitVec 64))) (size!18245 (_ BitVec 32))) )
))
(declare-fun lt!277193 () array!37266)

(declare-fun b!607262 () Bool)

(declare-fun e!347760 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37266)

(declare-fun arrayContainsKey!0 (array!37266 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!607262 (= e!347760 (arrayContainsKey!0 lt!277193 (select (arr!17881 a!2986) j!136) index!984))))

(declare-fun b!607263 () Bool)

(declare-fun e!347766 () Bool)

(declare-fun e!347756 () Bool)

(assert (=> b!607263 (= e!347766 e!347756)))

(declare-fun res!390040 () Bool)

(assert (=> b!607263 (=> res!390040 e!347756)))

(assert (=> b!607263 (= res!390040 (or (bvsge (size!18245 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18245 a!2986))))))

(assert (=> b!607263 (arrayContainsKey!0 lt!277193 (select (arr!17881 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-datatypes ((Unit!19315 0))(
  ( (Unit!19316) )
))
(declare-fun lt!277189 () Unit!19315)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37266 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19315)

(assert (=> b!607263 (= lt!277189 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277193 (select (arr!17881 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!607263 e!347760))

(declare-fun res!390048 () Bool)

(assert (=> b!607263 (=> (not res!390048) (not e!347760))))

(assert (=> b!607263 (= res!390048 (arrayContainsKey!0 lt!277193 (select (arr!17881 a!2986) j!136) j!136))))

(declare-fun b!607264 () Bool)

(declare-fun res!390046 () Bool)

(assert (=> b!607264 (=> res!390046 e!347756)))

(declare-datatypes ((List!11829 0))(
  ( (Nil!11826) (Cons!11825 (h!12873 (_ BitVec 64)) (t!18049 List!11829)) )
))
(declare-fun contains!2979 (List!11829 (_ BitVec 64)) Bool)

(assert (=> b!607264 (= res!390046 (contains!2979 Nil!11826 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607265 () Bool)

(declare-fun res!390035 () Bool)

(assert (=> b!607265 (=> res!390035 e!347756)))

(assert (=> b!607265 (= res!390035 (contains!2979 Nil!11826 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607266 () Bool)

(declare-fun res!390033 () Bool)

(declare-fun e!347765 () Bool)

(assert (=> b!607266 (=> (not res!390033) (not e!347765))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!607266 (= res!390033 (validKeyInArray!0 k0!1786))))

(declare-fun b!607267 () Bool)

(assert (=> b!607267 (= e!347756 true)))

(declare-fun lt!277185 () Bool)

(assert (=> b!607267 (= lt!277185 (contains!2979 Nil!11826 k0!1786))))

(declare-fun b!607268 () Bool)

(declare-fun e!347752 () Bool)

(assert (=> b!607268 (= e!347752 e!347766)))

(declare-fun res!390038 () Bool)

(assert (=> b!607268 (=> res!390038 e!347766)))

(assert (=> b!607268 (= res!390038 (bvsge index!984 j!136))))

(declare-fun lt!277196 () Unit!19315)

(declare-fun e!347757 () Unit!19315)

(assert (=> b!607268 (= lt!277196 e!347757)))

(declare-fun c!68983 () Bool)

(assert (=> b!607268 (= c!68983 (bvslt j!136 index!984))))

(declare-fun b!607269 () Bool)

(declare-fun e!347762 () Bool)

(declare-fun e!347755 () Bool)

(assert (=> b!607269 (= e!347762 e!347755)))

(declare-fun res!390034 () Bool)

(assert (=> b!607269 (=> (not res!390034) (not e!347755))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!607269 (= res!390034 (= (select (store (arr!17881 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!607269 (= lt!277193 (array!37267 (store (arr!17881 a!2986) i!1108 k0!1786) (size!18245 a!2986)))))

(declare-fun b!607270 () Bool)

(declare-fun res!390050 () Bool)

(assert (=> b!607270 (=> res!390050 e!347756)))

(declare-fun noDuplicate!313 (List!11829) Bool)

(assert (=> b!607270 (= res!390050 (not (noDuplicate!313 Nil!11826)))))

(declare-fun b!607271 () Bool)

(declare-fun res!390037 () Bool)

(assert (=> b!607271 (=> (not res!390037) (not e!347762))))

(declare-fun arrayNoDuplicates!0 (array!37266 (_ BitVec 32) List!11829) Bool)

(assert (=> b!607271 (= res!390037 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11826))))

(declare-fun b!607272 () Bool)

(declare-fun e!347761 () Bool)

(declare-fun e!347753 () Bool)

(assert (=> b!607272 (= e!347761 (not e!347753))))

(declare-fun res!390043 () Bool)

(assert (=> b!607272 (=> res!390043 e!347753)))

(declare-datatypes ((SeekEntryResult!6277 0))(
  ( (MissingZero!6277 (index!27383 (_ BitVec 32))) (Found!6277 (index!27384 (_ BitVec 32))) (Intermediate!6277 (undefined!7089 Bool) (index!27385 (_ BitVec 32)) (x!56349 (_ BitVec 32))) (Undefined!6277) (MissingVacant!6277 (index!27386 (_ BitVec 32))) )
))
(declare-fun lt!277197 () SeekEntryResult!6277)

(assert (=> b!607272 (= res!390043 (not (= lt!277197 (Found!6277 index!984))))))

(declare-fun lt!277190 () Unit!19315)

(declare-fun e!347759 () Unit!19315)

(assert (=> b!607272 (= lt!277190 e!347759)))

(declare-fun c!68984 () Bool)

(assert (=> b!607272 (= c!68984 (= lt!277197 Undefined!6277))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!277195 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37266 (_ BitVec 32)) SeekEntryResult!6277)

(assert (=> b!607272 (= lt!277197 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277195 lt!277193 mask!3053))))

(declare-fun e!347763 () Bool)

(assert (=> b!607272 e!347763))

(declare-fun res!390041 () Bool)

(assert (=> b!607272 (=> (not res!390041) (not e!347763))))

(declare-fun lt!277188 () (_ BitVec 32))

(declare-fun lt!277186 () SeekEntryResult!6277)

(assert (=> b!607272 (= res!390041 (= lt!277186 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277188 vacantSpotIndex!68 lt!277195 lt!277193 mask!3053)))))

(assert (=> b!607272 (= lt!277186 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277188 vacantSpotIndex!68 (select (arr!17881 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!607272 (= lt!277195 (select (store (arr!17881 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!277187 () Unit!19315)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37266 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19315)

(assert (=> b!607272 (= lt!277187 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277188 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!607272 (= lt!277188 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!607273 () Bool)

(declare-fun res!390054 () Bool)

(assert (=> b!607273 (=> (not res!390054) (not e!347765))))

(assert (=> b!607273 (= res!390054 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!607274 () Bool)

(assert (=> b!607274 (= e!347765 e!347762)))

(declare-fun res!390045 () Bool)

(assert (=> b!607274 (=> (not res!390045) (not e!347762))))

(declare-fun lt!277183 () SeekEntryResult!6277)

(assert (=> b!607274 (= res!390045 (or (= lt!277183 (MissingZero!6277 i!1108)) (= lt!277183 (MissingVacant!6277 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37266 (_ BitVec 32)) SeekEntryResult!6277)

(assert (=> b!607274 (= lt!277183 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!390047 () Bool)

(assert (=> start!55590 (=> (not res!390047) (not e!347765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55590 (= res!390047 (validMask!0 mask!3053))))

(assert (=> start!55590 e!347765))

(assert (=> start!55590 true))

(declare-fun array_inv!13740 (array!37266) Bool)

(assert (=> start!55590 (array_inv!13740 a!2986)))

(declare-fun b!607275 () Bool)

(declare-fun Unit!19317 () Unit!19315)

(assert (=> b!607275 (= e!347759 Unit!19317)))

(assert (=> b!607275 false))

(declare-fun b!607276 () Bool)

(declare-fun res!390052 () Bool)

(assert (=> b!607276 (=> (not res!390052) (not e!347762))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37266 (_ BitVec 32)) Bool)

(assert (=> b!607276 (= res!390052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!607277 () Bool)

(declare-fun res!390049 () Bool)

(assert (=> b!607277 (=> (not res!390049) (not e!347762))))

(assert (=> b!607277 (= res!390049 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17881 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!607278 () Bool)

(assert (=> b!607278 (= e!347753 e!347752)))

(declare-fun res!390055 () Bool)

(assert (=> b!607278 (=> res!390055 e!347752)))

(declare-fun lt!277184 () (_ BitVec 64))

(assert (=> b!607278 (= res!390055 (or (not (= (select (arr!17881 a!2986) j!136) lt!277195)) (not (= (select (arr!17881 a!2986) j!136) lt!277184))))))

(declare-fun e!347751 () Bool)

(assert (=> b!607278 e!347751))

(declare-fun res!390053 () Bool)

(assert (=> b!607278 (=> (not res!390053) (not e!347751))))

(assert (=> b!607278 (= res!390053 (= lt!277184 (select (arr!17881 a!2986) j!136)))))

(assert (=> b!607278 (= lt!277184 (select (store (arr!17881 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!607279 () Bool)

(declare-fun Unit!19318 () Unit!19315)

(assert (=> b!607279 (= e!347757 Unit!19318)))

(declare-fun lt!277182 () Unit!19315)

(assert (=> b!607279 (= lt!277182 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277193 (select (arr!17881 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!607279 (arrayContainsKey!0 lt!277193 (select (arr!17881 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277191 () Unit!19315)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37266 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11829) Unit!19315)

(assert (=> b!607279 (= lt!277191 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11826))))

(assert (=> b!607279 (arrayNoDuplicates!0 lt!277193 #b00000000000000000000000000000000 Nil!11826)))

(declare-fun lt!277192 () Unit!19315)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37266 (_ BitVec 32) (_ BitVec 32)) Unit!19315)

(assert (=> b!607279 (= lt!277192 (lemmaNoDuplicateFromThenFromBigger!0 lt!277193 #b00000000000000000000000000000000 j!136))))

(assert (=> b!607279 (arrayNoDuplicates!0 lt!277193 j!136 Nil!11826)))

(declare-fun lt!277198 () Unit!19315)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37266 (_ BitVec 64) (_ BitVec 32) List!11829) Unit!19315)

(assert (=> b!607279 (= lt!277198 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277193 (select (arr!17881 a!2986) j!136) j!136 Nil!11826))))

(assert (=> b!607279 false))

(declare-fun b!607280 () Bool)

(declare-fun e!347758 () Bool)

(assert (=> b!607280 (= e!347751 e!347758)))

(declare-fun res!390042 () Bool)

(assert (=> b!607280 (=> res!390042 e!347758)))

(assert (=> b!607280 (= res!390042 (or (not (= (select (arr!17881 a!2986) j!136) lt!277195)) (not (= (select (arr!17881 a!2986) j!136) lt!277184)) (bvsge j!136 index!984)))))

(declare-fun b!607281 () Bool)

(declare-fun res!390044 () Bool)

(assert (=> b!607281 (=> (not res!390044) (not e!347765))))

(assert (=> b!607281 (= res!390044 (and (= (size!18245 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18245 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18245 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!607282 () Bool)

(declare-fun Unit!19319 () Unit!19315)

(assert (=> b!607282 (= e!347759 Unit!19319)))

(declare-fun b!607283 () Bool)

(declare-fun lt!277194 () SeekEntryResult!6277)

(assert (=> b!607283 (= e!347763 (= lt!277194 lt!277186))))

(declare-fun e!347754 () Bool)

(declare-fun b!607284 () Bool)

(assert (=> b!607284 (= e!347754 (arrayContainsKey!0 lt!277193 (select (arr!17881 a!2986) j!136) index!984))))

(declare-fun b!607285 () Bool)

(declare-fun Unit!19320 () Unit!19315)

(assert (=> b!607285 (= e!347757 Unit!19320)))

(declare-fun b!607286 () Bool)

(assert (=> b!607286 (= e!347755 e!347761)))

(declare-fun res!390051 () Bool)

(assert (=> b!607286 (=> (not res!390051) (not e!347761))))

(assert (=> b!607286 (= res!390051 (and (= lt!277194 (Found!6277 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17881 a!2986) index!984) (select (arr!17881 a!2986) j!136))) (not (= (select (arr!17881 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!607286 (= lt!277194 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17881 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!607287 () Bool)

(declare-fun res!390036 () Bool)

(assert (=> b!607287 (=> (not res!390036) (not e!347765))))

(assert (=> b!607287 (= res!390036 (validKeyInArray!0 (select (arr!17881 a!2986) j!136)))))

(declare-fun b!607288 () Bool)

(assert (=> b!607288 (= e!347758 e!347754)))

(declare-fun res!390039 () Bool)

(assert (=> b!607288 (=> (not res!390039) (not e!347754))))

(assert (=> b!607288 (= res!390039 (arrayContainsKey!0 lt!277193 (select (arr!17881 a!2986) j!136) j!136))))

(assert (= (and start!55590 res!390047) b!607281))

(assert (= (and b!607281 res!390044) b!607287))

(assert (= (and b!607287 res!390036) b!607266))

(assert (= (and b!607266 res!390033) b!607273))

(assert (= (and b!607273 res!390054) b!607274))

(assert (= (and b!607274 res!390045) b!607276))

(assert (= (and b!607276 res!390052) b!607271))

(assert (= (and b!607271 res!390037) b!607277))

(assert (= (and b!607277 res!390049) b!607269))

(assert (= (and b!607269 res!390034) b!607286))

(assert (= (and b!607286 res!390051) b!607272))

(assert (= (and b!607272 res!390041) b!607283))

(assert (= (and b!607272 c!68984) b!607275))

(assert (= (and b!607272 (not c!68984)) b!607282))

(assert (= (and b!607272 (not res!390043)) b!607278))

(assert (= (and b!607278 res!390053) b!607280))

(assert (= (and b!607280 (not res!390042)) b!607288))

(assert (= (and b!607288 res!390039) b!607284))

(assert (= (and b!607278 (not res!390055)) b!607268))

(assert (= (and b!607268 c!68983) b!607279))

(assert (= (and b!607268 (not c!68983)) b!607285))

(assert (= (and b!607268 (not res!390038)) b!607263))

(assert (= (and b!607263 res!390048) b!607262))

(assert (= (and b!607263 (not res!390040)) b!607270))

(assert (= (and b!607270 (not res!390050)) b!607264))

(assert (= (and b!607264 (not res!390046)) b!607265))

(assert (= (and b!607265 (not res!390035)) b!607267))

(declare-fun m!584303 () Bool)

(assert (=> b!607272 m!584303))

(declare-fun m!584305 () Bool)

(assert (=> b!607272 m!584305))

(declare-fun m!584307 () Bool)

(assert (=> b!607272 m!584307))

(declare-fun m!584309 () Bool)

(assert (=> b!607272 m!584309))

(assert (=> b!607272 m!584307))

(declare-fun m!584311 () Bool)

(assert (=> b!607272 m!584311))

(declare-fun m!584313 () Bool)

(assert (=> b!607272 m!584313))

(declare-fun m!584315 () Bool)

(assert (=> b!607272 m!584315))

(declare-fun m!584317 () Bool)

(assert (=> b!607272 m!584317))

(declare-fun m!584319 () Bool)

(assert (=> b!607286 m!584319))

(assert (=> b!607286 m!584307))

(assert (=> b!607286 m!584307))

(declare-fun m!584321 () Bool)

(assert (=> b!607286 m!584321))

(declare-fun m!584323 () Bool)

(assert (=> b!607265 m!584323))

(declare-fun m!584325 () Bool)

(assert (=> start!55590 m!584325))

(declare-fun m!584327 () Bool)

(assert (=> start!55590 m!584327))

(assert (=> b!607288 m!584307))

(assert (=> b!607288 m!584307))

(declare-fun m!584329 () Bool)

(assert (=> b!607288 m!584329))

(assert (=> b!607280 m!584307))

(assert (=> b!607279 m!584307))

(declare-fun m!584331 () Bool)

(assert (=> b!607279 m!584331))

(assert (=> b!607279 m!584307))

(assert (=> b!607279 m!584307))

(declare-fun m!584333 () Bool)

(assert (=> b!607279 m!584333))

(declare-fun m!584335 () Bool)

(assert (=> b!607279 m!584335))

(declare-fun m!584337 () Bool)

(assert (=> b!607279 m!584337))

(declare-fun m!584339 () Bool)

(assert (=> b!607279 m!584339))

(declare-fun m!584341 () Bool)

(assert (=> b!607279 m!584341))

(assert (=> b!607279 m!584307))

(declare-fun m!584343 () Bool)

(assert (=> b!607279 m!584343))

(declare-fun m!584345 () Bool)

(assert (=> b!607276 m!584345))

(declare-fun m!584347 () Bool)

(assert (=> b!607273 m!584347))

(declare-fun m!584349 () Bool)

(assert (=> b!607264 m!584349))

(declare-fun m!584351 () Bool)

(assert (=> b!607270 m!584351))

(assert (=> b!607284 m!584307))

(assert (=> b!607284 m!584307))

(declare-fun m!584353 () Bool)

(assert (=> b!607284 m!584353))

(assert (=> b!607278 m!584307))

(assert (=> b!607278 m!584309))

(declare-fun m!584355 () Bool)

(assert (=> b!607278 m!584355))

(declare-fun m!584357 () Bool)

(assert (=> b!607277 m!584357))

(declare-fun m!584359 () Bool)

(assert (=> b!607274 m!584359))

(declare-fun m!584361 () Bool)

(assert (=> b!607266 m!584361))

(assert (=> b!607263 m!584307))

(assert (=> b!607263 m!584307))

(declare-fun m!584363 () Bool)

(assert (=> b!607263 m!584363))

(assert (=> b!607263 m!584307))

(declare-fun m!584365 () Bool)

(assert (=> b!607263 m!584365))

(assert (=> b!607263 m!584307))

(assert (=> b!607263 m!584329))

(declare-fun m!584367 () Bool)

(assert (=> b!607271 m!584367))

(assert (=> b!607269 m!584309))

(declare-fun m!584369 () Bool)

(assert (=> b!607269 m!584369))

(assert (=> b!607262 m!584307))

(assert (=> b!607262 m!584307))

(assert (=> b!607262 m!584353))

(declare-fun m!584371 () Bool)

(assert (=> b!607267 m!584371))

(assert (=> b!607287 m!584307))

(assert (=> b!607287 m!584307))

(declare-fun m!584373 () Bool)

(assert (=> b!607287 m!584373))

(check-sat (not b!607276) (not b!607287) (not b!607272) (not b!607265) (not b!607271) (not b!607263) (not b!607267) (not b!607266) (not b!607288) (not b!607270) (not b!607262) (not b!607284) (not b!607286) (not start!55590) (not b!607264) (not b!607273) (not b!607274) (not b!607279))
(check-sat)
