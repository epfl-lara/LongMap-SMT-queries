; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54840 () Bool)

(assert start!54840)

(declare-fun b!599254 () Bool)

(declare-fun e!342585 () Bool)

(declare-fun e!342588 () Bool)

(assert (=> b!599254 (= e!342585 e!342588)))

(declare-fun res!384377 () Bool)

(assert (=> b!599254 (=> (not res!384377) (not e!342588))))

(declare-datatypes ((SeekEntryResult!6241 0))(
  ( (MissingZero!6241 (index!27221 (_ BitVec 32))) (Found!6241 (index!27222 (_ BitVec 32))) (Intermediate!6241 (undefined!7053 Bool) (index!27223 (_ BitVec 32)) (x!56035 (_ BitVec 32))) (Undefined!6241) (MissingVacant!6241 (index!27224 (_ BitVec 32))) )
))
(declare-fun lt!272323 () SeekEntryResult!6241)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!599254 (= res!384377 (or (= lt!272323 (MissingZero!6241 i!1108)) (= lt!272323 (MissingVacant!6241 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37089 0))(
  ( (array!37090 (arr!17804 (Array (_ BitVec 32) (_ BitVec 64))) (size!18169 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37089)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37089 (_ BitVec 32)) SeekEntryResult!6241)

(assert (=> b!599254 (= lt!272323 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!599255 () Bool)

(declare-fun e!342590 () Bool)

(assert (=> b!599255 (= e!342588 e!342590)))

(declare-fun res!384367 () Bool)

(assert (=> b!599255 (=> (not res!384367) (not e!342590))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!599255 (= res!384367 (= (select (store (arr!17804 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!272316 () array!37089)

(assert (=> b!599255 (= lt!272316 (array!37090 (store (arr!17804 a!2986) i!1108 k0!1786) (size!18169 a!2986)))))

(declare-fun b!599256 () Bool)

(declare-datatypes ((Unit!18876 0))(
  ( (Unit!18877) )
))
(declare-fun e!342584 () Unit!18876)

(declare-fun Unit!18878 () Unit!18876)

(assert (=> b!599256 (= e!342584 Unit!18878)))

(assert (=> b!599256 false))

(declare-fun b!599257 () Bool)

(declare-fun res!384373 () Bool)

(assert (=> b!599257 (=> (not res!384373) (not e!342585))))

(declare-fun arrayContainsKey!0 (array!37089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599257 (= res!384373 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599258 () Bool)

(declare-fun res!384365 () Bool)

(assert (=> b!599258 (=> (not res!384365) (not e!342585))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!599258 (= res!384365 (and (= (size!18169 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18169 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18169 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!599259 () Bool)

(declare-fun e!342586 () Bool)

(declare-fun e!342581 () Bool)

(assert (=> b!599259 (= e!342586 e!342581)))

(declare-fun res!384370 () Bool)

(assert (=> b!599259 (=> (not res!384370) (not e!342581))))

(assert (=> b!599259 (= res!384370 (arrayContainsKey!0 lt!272316 (select (arr!17804 a!2986) j!136) j!136))))

(declare-fun b!599260 () Bool)

(declare-fun res!384381 () Bool)

(assert (=> b!599260 (=> (not res!384381) (not e!342588))))

(declare-datatypes ((List!11884 0))(
  ( (Nil!11881) (Cons!11880 (h!12925 (_ BitVec 64)) (t!18103 List!11884)) )
))
(declare-fun arrayNoDuplicates!0 (array!37089 (_ BitVec 32) List!11884) Bool)

(assert (=> b!599260 (= res!384381 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11881))))

(declare-fun b!599262 () Bool)

(declare-fun e!342580 () Bool)

(assert (=> b!599262 (= e!342580 e!342586)))

(declare-fun res!384371 () Bool)

(assert (=> b!599262 (=> res!384371 e!342586)))

(declare-fun lt!272328 () (_ BitVec 64))

(declare-fun lt!272326 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!599262 (= res!384371 (or (not (= (select (arr!17804 a!2986) j!136) lt!272328)) (not (= (select (arr!17804 a!2986) j!136) lt!272326)) (bvsge j!136 index!984)))))

(declare-fun b!599263 () Bool)

(declare-fun e!342587 () Bool)

(declare-fun e!342589 () Bool)

(assert (=> b!599263 (= e!342587 e!342589)))

(declare-fun res!384368 () Bool)

(assert (=> b!599263 (=> res!384368 e!342589)))

(assert (=> b!599263 (= res!384368 (or (bvsge (size!18169 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18169 a!2986))))))

(assert (=> b!599263 (arrayNoDuplicates!0 lt!272316 j!136 Nil!11881)))

(declare-fun lt!272325 () Unit!18876)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37089 (_ BitVec 32) (_ BitVec 32)) Unit!18876)

(assert (=> b!599263 (= lt!272325 (lemmaNoDuplicateFromThenFromBigger!0 lt!272316 #b00000000000000000000000000000000 j!136))))

(assert (=> b!599263 (arrayNoDuplicates!0 lt!272316 #b00000000000000000000000000000000 Nil!11881)))

(declare-fun lt!272324 () Unit!18876)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37089 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11884) Unit!18876)

(assert (=> b!599263 (= lt!272324 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11881))))

(assert (=> b!599263 (arrayContainsKey!0 lt!272316 (select (arr!17804 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272321 () Unit!18876)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37089 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18876)

(assert (=> b!599263 (= lt!272321 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272316 (select (arr!17804 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599264 () Bool)

(declare-fun e!342591 () Bool)

(assert (=> b!599264 (= e!342591 e!342587)))

(declare-fun res!384376 () Bool)

(assert (=> b!599264 (=> res!384376 e!342587)))

(assert (=> b!599264 (= res!384376 (or (not (= (select (arr!17804 a!2986) j!136) lt!272328)) (not (= (select (arr!17804 a!2986) j!136) lt!272326)) (bvsge j!136 index!984)))))

(assert (=> b!599264 e!342580))

(declare-fun res!384375 () Bool)

(assert (=> b!599264 (=> (not res!384375) (not e!342580))))

(assert (=> b!599264 (= res!384375 (= lt!272326 (select (arr!17804 a!2986) j!136)))))

(assert (=> b!599264 (= lt!272326 (select (store (arr!17804 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!599265 () Bool)

(declare-fun res!384364 () Bool)

(assert (=> b!599265 (=> (not res!384364) (not e!342585))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599265 (= res!384364 (validKeyInArray!0 k0!1786))))

(declare-fun b!599266 () Bool)

(declare-fun res!384374 () Bool)

(assert (=> b!599266 (=> res!384374 e!342589)))

(declare-fun contains!2949 (List!11884 (_ BitVec 64)) Bool)

(assert (=> b!599266 (= res!384374 (contains!2949 Nil!11881 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599267 () Bool)

(declare-fun Unit!18879 () Unit!18876)

(assert (=> b!599267 (= e!342584 Unit!18879)))

(declare-fun b!599268 () Bool)

(declare-fun e!342582 () Bool)

(declare-fun lt!272317 () SeekEntryResult!6241)

(declare-fun lt!272327 () SeekEntryResult!6241)

(assert (=> b!599268 (= e!342582 (= lt!272317 lt!272327))))

(declare-fun b!599269 () Bool)

(declare-fun res!384383 () Bool)

(assert (=> b!599269 (=> (not res!384383) (not e!342585))))

(assert (=> b!599269 (= res!384383 (validKeyInArray!0 (select (arr!17804 a!2986) j!136)))))

(declare-fun b!599270 () Bool)

(declare-fun e!342579 () Bool)

(assert (=> b!599270 (= e!342590 e!342579)))

(declare-fun res!384366 () Bool)

(assert (=> b!599270 (=> (not res!384366) (not e!342579))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!599270 (= res!384366 (and (= lt!272317 (Found!6241 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17804 a!2986) index!984) (select (arr!17804 a!2986) j!136))) (not (= (select (arr!17804 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37089 (_ BitVec 32)) SeekEntryResult!6241)

(assert (=> b!599270 (= lt!272317 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17804 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!384380 () Bool)

(assert (=> start!54840 (=> (not res!384380) (not e!342585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54840 (= res!384380 (validMask!0 mask!3053))))

(assert (=> start!54840 e!342585))

(assert (=> start!54840 true))

(declare-fun array_inv!13687 (array!37089) Bool)

(assert (=> start!54840 (array_inv!13687 a!2986)))

(declare-fun b!599261 () Bool)

(assert (=> b!599261 (= e!342589 true)))

(declare-fun lt!272322 () Bool)

(assert (=> b!599261 (= lt!272322 (contains!2949 Nil!11881 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599271 () Bool)

(assert (=> b!599271 (= e!342581 (arrayContainsKey!0 lt!272316 (select (arr!17804 a!2986) j!136) index!984))))

(declare-fun b!599272 () Bool)

(declare-fun res!384372 () Bool)

(assert (=> b!599272 (=> res!384372 e!342589)))

(declare-fun noDuplicate!284 (List!11884) Bool)

(assert (=> b!599272 (= res!384372 (not (noDuplicate!284 Nil!11881)))))

(declare-fun b!599273 () Bool)

(declare-fun res!384369 () Bool)

(assert (=> b!599273 (=> (not res!384369) (not e!342588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37089 (_ BitVec 32)) Bool)

(assert (=> b!599273 (= res!384369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!599274 () Bool)

(assert (=> b!599274 (= e!342579 (not e!342591))))

(declare-fun res!384378 () Bool)

(assert (=> b!599274 (=> res!384378 e!342591)))

(declare-fun lt!272318 () SeekEntryResult!6241)

(assert (=> b!599274 (= res!384378 (not (= lt!272318 (Found!6241 index!984))))))

(declare-fun lt!272329 () Unit!18876)

(assert (=> b!599274 (= lt!272329 e!342584)))

(declare-fun c!67812 () Bool)

(assert (=> b!599274 (= c!67812 (= lt!272318 Undefined!6241))))

(assert (=> b!599274 (= lt!272318 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272328 lt!272316 mask!3053))))

(assert (=> b!599274 e!342582))

(declare-fun res!384382 () Bool)

(assert (=> b!599274 (=> (not res!384382) (not e!342582))))

(declare-fun lt!272319 () (_ BitVec 32))

(assert (=> b!599274 (= res!384382 (= lt!272327 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272319 vacantSpotIndex!68 lt!272328 lt!272316 mask!3053)))))

(assert (=> b!599274 (= lt!272327 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272319 vacantSpotIndex!68 (select (arr!17804 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!599274 (= lt!272328 (select (store (arr!17804 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272320 () Unit!18876)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37089 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18876)

(assert (=> b!599274 (= lt!272320 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272319 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599274 (= lt!272319 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!599275 () Bool)

(declare-fun res!384379 () Bool)

(assert (=> b!599275 (=> (not res!384379) (not e!342588))))

(assert (=> b!599275 (= res!384379 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17804 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!54840 res!384380) b!599258))

(assert (= (and b!599258 res!384365) b!599269))

(assert (= (and b!599269 res!384383) b!599265))

(assert (= (and b!599265 res!384364) b!599257))

(assert (= (and b!599257 res!384373) b!599254))

(assert (= (and b!599254 res!384377) b!599273))

(assert (= (and b!599273 res!384369) b!599260))

(assert (= (and b!599260 res!384381) b!599275))

(assert (= (and b!599275 res!384379) b!599255))

(assert (= (and b!599255 res!384367) b!599270))

(assert (= (and b!599270 res!384366) b!599274))

(assert (= (and b!599274 res!384382) b!599268))

(assert (= (and b!599274 c!67812) b!599256))

(assert (= (and b!599274 (not c!67812)) b!599267))

(assert (= (and b!599274 (not res!384378)) b!599264))

(assert (= (and b!599264 res!384375) b!599262))

(assert (= (and b!599262 (not res!384371)) b!599259))

(assert (= (and b!599259 res!384370) b!599271))

(assert (= (and b!599264 (not res!384376)) b!599263))

(assert (= (and b!599263 (not res!384368)) b!599272))

(assert (= (and b!599272 (not res!384372)) b!599266))

(assert (= (and b!599266 (not res!384374)) b!599261))

(declare-fun m!576001 () Bool)

(assert (=> b!599259 m!576001))

(assert (=> b!599259 m!576001))

(declare-fun m!576003 () Bool)

(assert (=> b!599259 m!576003))

(assert (=> b!599269 m!576001))

(assert (=> b!599269 m!576001))

(declare-fun m!576005 () Bool)

(assert (=> b!599269 m!576005))

(declare-fun m!576007 () Bool)

(assert (=> b!599270 m!576007))

(assert (=> b!599270 m!576001))

(assert (=> b!599270 m!576001))

(declare-fun m!576009 () Bool)

(assert (=> b!599270 m!576009))

(declare-fun m!576011 () Bool)

(assert (=> b!599255 m!576011))

(declare-fun m!576013 () Bool)

(assert (=> b!599255 m!576013))

(declare-fun m!576015 () Bool)

(assert (=> b!599274 m!576015))

(declare-fun m!576017 () Bool)

(assert (=> b!599274 m!576017))

(declare-fun m!576019 () Bool)

(assert (=> b!599274 m!576019))

(assert (=> b!599274 m!576001))

(assert (=> b!599274 m!576011))

(declare-fun m!576021 () Bool)

(assert (=> b!599274 m!576021))

(declare-fun m!576023 () Bool)

(assert (=> b!599274 m!576023))

(assert (=> b!599274 m!576001))

(declare-fun m!576025 () Bool)

(assert (=> b!599274 m!576025))

(declare-fun m!576027 () Bool)

(assert (=> b!599261 m!576027))

(declare-fun m!576029 () Bool)

(assert (=> b!599260 m!576029))

(declare-fun m!576031 () Bool)

(assert (=> b!599273 m!576031))

(assert (=> b!599271 m!576001))

(assert (=> b!599271 m!576001))

(declare-fun m!576033 () Bool)

(assert (=> b!599271 m!576033))

(declare-fun m!576035 () Bool)

(assert (=> b!599272 m!576035))

(assert (=> b!599263 m!576001))

(declare-fun m!576037 () Bool)

(assert (=> b!599263 m!576037))

(assert (=> b!599263 m!576001))

(declare-fun m!576039 () Bool)

(assert (=> b!599263 m!576039))

(declare-fun m!576041 () Bool)

(assert (=> b!599263 m!576041))

(assert (=> b!599263 m!576001))

(declare-fun m!576043 () Bool)

(assert (=> b!599263 m!576043))

(declare-fun m!576045 () Bool)

(assert (=> b!599263 m!576045))

(declare-fun m!576047 () Bool)

(assert (=> b!599263 m!576047))

(declare-fun m!576049 () Bool)

(assert (=> b!599266 m!576049))

(declare-fun m!576051 () Bool)

(assert (=> b!599257 m!576051))

(declare-fun m!576053 () Bool)

(assert (=> b!599265 m!576053))

(assert (=> b!599262 m!576001))

(declare-fun m!576055 () Bool)

(assert (=> b!599254 m!576055))

(declare-fun m!576057 () Bool)

(assert (=> start!54840 m!576057))

(declare-fun m!576059 () Bool)

(assert (=> start!54840 m!576059))

(declare-fun m!576061 () Bool)

(assert (=> b!599275 m!576061))

(assert (=> b!599264 m!576001))

(assert (=> b!599264 m!576011))

(declare-fun m!576063 () Bool)

(assert (=> b!599264 m!576063))

(check-sat (not b!599274) (not start!54840) (not b!599261) (not b!599270) (not b!599269) (not b!599260) (not b!599272) (not b!599254) (not b!599265) (not b!599257) (not b!599273) (not b!599266) (not b!599263) (not b!599259) (not b!599271))
(check-sat)
