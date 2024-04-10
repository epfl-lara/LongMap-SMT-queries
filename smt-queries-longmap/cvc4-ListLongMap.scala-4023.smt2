; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54848 () Bool)

(assert start!54848)

(declare-fun b!599264 () Bool)

(declare-fun res!384265 () Bool)

(declare-fun e!342605 () Bool)

(assert (=> b!599264 (=> (not res!384265) (not e!342605))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37083 0))(
  ( (array!37084 (arr!17801 (Array (_ BitVec 32) (_ BitVec 64))) (size!18165 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37083)

(assert (=> b!599264 (= res!384265 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17801 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!599265 () Bool)

(declare-fun e!342600 () Bool)

(assert (=> b!599265 (= e!342600 e!342605)))

(declare-fun res!384259 () Bool)

(assert (=> b!599265 (=> (not res!384259) (not e!342605))))

(declare-datatypes ((SeekEntryResult!6241 0))(
  ( (MissingZero!6241 (index!27221 (_ BitVec 32))) (Found!6241 (index!27222 (_ BitVec 32))) (Intermediate!6241 (undefined!7053 Bool) (index!27223 (_ BitVec 32)) (x!56024 (_ BitVec 32))) (Undefined!6241) (MissingVacant!6241 (index!27224 (_ BitVec 32))) )
))
(declare-fun lt!272386 () SeekEntryResult!6241)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!599265 (= res!384259 (or (= lt!272386 (MissingZero!6241 i!1108)) (= lt!272386 (MissingVacant!6241 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37083 (_ BitVec 32)) SeekEntryResult!6241)

(assert (=> b!599265 (= lt!272386 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!599266 () Bool)

(declare-fun e!342608 () Bool)

(declare-fun lt!272395 () array!37083)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599266 (= e!342608 (arrayContainsKey!0 lt!272395 (select (arr!17801 a!2986) j!136) index!984))))

(declare-fun b!599267 () Bool)

(declare-fun e!342606 () Bool)

(declare-fun lt!272387 () SeekEntryResult!6241)

(declare-fun lt!272394 () SeekEntryResult!6241)

(assert (=> b!599267 (= e!342606 (= lt!272387 lt!272394))))

(declare-fun b!599268 () Bool)

(declare-fun res!384270 () Bool)

(assert (=> b!599268 (=> (not res!384270) (not e!342600))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599268 (= res!384270 (validKeyInArray!0 k!1786))))

(declare-fun b!599269 () Bool)

(declare-fun res!384266 () Bool)

(assert (=> b!599269 (=> (not res!384266) (not e!342605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37083 (_ BitVec 32)) Bool)

(assert (=> b!599269 (= res!384266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!599270 () Bool)

(declare-fun res!384261 () Bool)

(assert (=> b!599270 (=> (not res!384261) (not e!342600))))

(assert (=> b!599270 (= res!384261 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599271 () Bool)

(declare-fun e!342603 () Bool)

(declare-fun e!342604 () Bool)

(assert (=> b!599271 (= e!342603 (not e!342604))))

(declare-fun res!384264 () Bool)

(assert (=> b!599271 (=> res!384264 e!342604)))

(declare-fun lt!272390 () SeekEntryResult!6241)

(assert (=> b!599271 (= res!384264 (not (= lt!272390 (Found!6241 index!984))))))

(declare-datatypes ((Unit!18882 0))(
  ( (Unit!18883) )
))
(declare-fun lt!272392 () Unit!18882)

(declare-fun e!342602 () Unit!18882)

(assert (=> b!599271 (= lt!272392 e!342602)))

(declare-fun c!67871 () Bool)

(assert (=> b!599271 (= c!67871 (= lt!272390 Undefined!6241))))

(declare-fun lt!272389 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37083 (_ BitVec 32)) SeekEntryResult!6241)

(assert (=> b!599271 (= lt!272390 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272389 lt!272395 mask!3053))))

(assert (=> b!599271 e!342606))

(declare-fun res!384268 () Bool)

(assert (=> b!599271 (=> (not res!384268) (not e!342606))))

(declare-fun lt!272388 () (_ BitVec 32))

(assert (=> b!599271 (= res!384268 (= lt!272394 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272388 vacantSpotIndex!68 lt!272389 lt!272395 mask!3053)))))

(assert (=> b!599271 (= lt!272394 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272388 vacantSpotIndex!68 (select (arr!17801 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!599271 (= lt!272389 (select (store (arr!17801 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!272393 () Unit!18882)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37083 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18882)

(assert (=> b!599271 (= lt!272393 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272388 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599271 (= lt!272388 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!384258 () Bool)

(assert (=> start!54848 (=> (not res!384258) (not e!342600))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54848 (= res!384258 (validMask!0 mask!3053))))

(assert (=> start!54848 e!342600))

(assert (=> start!54848 true))

(declare-fun array_inv!13597 (array!37083) Bool)

(assert (=> start!54848 (array_inv!13597 a!2986)))

(declare-fun b!599272 () Bool)

(declare-fun e!342607 () Bool)

(declare-fun e!342601 () Bool)

(assert (=> b!599272 (= e!342607 e!342601)))

(declare-fun res!384263 () Bool)

(assert (=> b!599272 (=> res!384263 e!342601)))

(declare-fun lt!272391 () (_ BitVec 64))

(assert (=> b!599272 (= res!384263 (or (not (= (select (arr!17801 a!2986) j!136) lt!272389)) (not (= (select (arr!17801 a!2986) j!136) lt!272391)) (bvsge j!136 index!984)))))

(declare-fun b!599273 () Bool)

(declare-fun e!342609 () Bool)

(assert (=> b!599273 (= e!342605 e!342609)))

(declare-fun res!384271 () Bool)

(assert (=> b!599273 (=> (not res!384271) (not e!342609))))

(assert (=> b!599273 (= res!384271 (= (select (store (arr!17801 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!599273 (= lt!272395 (array!37084 (store (arr!17801 a!2986) i!1108 k!1786) (size!18165 a!2986)))))

(declare-fun b!599274 () Bool)

(assert (=> b!599274 (= e!342609 e!342603)))

(declare-fun res!384262 () Bool)

(assert (=> b!599274 (=> (not res!384262) (not e!342603))))

(assert (=> b!599274 (= res!384262 (and (= lt!272387 (Found!6241 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17801 a!2986) index!984) (select (arr!17801 a!2986) j!136))) (not (= (select (arr!17801 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!599274 (= lt!272387 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17801 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!599275 () Bool)

(declare-fun Unit!18884 () Unit!18882)

(assert (=> b!599275 (= e!342602 Unit!18884)))

(assert (=> b!599275 false))

(declare-fun b!599276 () Bool)

(declare-fun e!342598 () Bool)

(assert (=> b!599276 (= e!342604 e!342598)))

(declare-fun res!384260 () Bool)

(assert (=> b!599276 (=> res!384260 e!342598)))

(assert (=> b!599276 (= res!384260 (or (not (= (select (arr!17801 a!2986) j!136) lt!272389)) (not (= (select (arr!17801 a!2986) j!136) lt!272391)) (bvsge j!136 index!984)))))

(assert (=> b!599276 e!342607))

(declare-fun res!384267 () Bool)

(assert (=> b!599276 (=> (not res!384267) (not e!342607))))

(assert (=> b!599276 (= res!384267 (= lt!272391 (select (arr!17801 a!2986) j!136)))))

(assert (=> b!599276 (= lt!272391 (select (store (arr!17801 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!599277 () Bool)

(declare-fun Unit!18885 () Unit!18882)

(assert (=> b!599277 (= e!342602 Unit!18885)))

(declare-fun b!599278 () Bool)

(assert (=> b!599278 (= e!342598 true)))

(declare-datatypes ((List!11842 0))(
  ( (Nil!11839) (Cons!11838 (h!12883 (_ BitVec 64)) (t!18070 List!11842)) )
))
(declare-fun arrayNoDuplicates!0 (array!37083 (_ BitVec 32) List!11842) Bool)

(assert (=> b!599278 (arrayNoDuplicates!0 lt!272395 #b00000000000000000000000000000000 Nil!11839)))

(declare-fun lt!272384 () Unit!18882)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37083 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11842) Unit!18882)

(assert (=> b!599278 (= lt!272384 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11839))))

(assert (=> b!599278 (arrayContainsKey!0 lt!272395 (select (arr!17801 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272385 () Unit!18882)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37083 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18882)

(assert (=> b!599278 (= lt!272385 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272395 (select (arr!17801 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599279 () Bool)

(assert (=> b!599279 (= e!342601 e!342608)))

(declare-fun res!384272 () Bool)

(assert (=> b!599279 (=> (not res!384272) (not e!342608))))

(assert (=> b!599279 (= res!384272 (arrayContainsKey!0 lt!272395 (select (arr!17801 a!2986) j!136) j!136))))

(declare-fun b!599280 () Bool)

(declare-fun res!384256 () Bool)

(assert (=> b!599280 (=> (not res!384256) (not e!342600))))

(assert (=> b!599280 (= res!384256 (validKeyInArray!0 (select (arr!17801 a!2986) j!136)))))

(declare-fun b!599281 () Bool)

(declare-fun res!384257 () Bool)

(assert (=> b!599281 (=> (not res!384257) (not e!342605))))

(assert (=> b!599281 (= res!384257 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11839))))

(declare-fun b!599282 () Bool)

(declare-fun res!384269 () Bool)

(assert (=> b!599282 (=> (not res!384269) (not e!342600))))

(assert (=> b!599282 (= res!384269 (and (= (size!18165 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18165 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18165 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!54848 res!384258) b!599282))

(assert (= (and b!599282 res!384269) b!599280))

(assert (= (and b!599280 res!384256) b!599268))

(assert (= (and b!599268 res!384270) b!599270))

(assert (= (and b!599270 res!384261) b!599265))

(assert (= (and b!599265 res!384259) b!599269))

(assert (= (and b!599269 res!384266) b!599281))

(assert (= (and b!599281 res!384257) b!599264))

(assert (= (and b!599264 res!384265) b!599273))

(assert (= (and b!599273 res!384271) b!599274))

(assert (= (and b!599274 res!384262) b!599271))

(assert (= (and b!599271 res!384268) b!599267))

(assert (= (and b!599271 c!67871) b!599275))

(assert (= (and b!599271 (not c!67871)) b!599277))

(assert (= (and b!599271 (not res!384264)) b!599276))

(assert (= (and b!599276 res!384267) b!599272))

(assert (= (and b!599272 (not res!384263)) b!599279))

(assert (= (and b!599279 res!384272) b!599266))

(assert (= (and b!599276 (not res!384260)) b!599278))

(declare-fun m!576527 () Bool)

(assert (=> b!599276 m!576527))

(declare-fun m!576529 () Bool)

(assert (=> b!599276 m!576529))

(declare-fun m!576531 () Bool)

(assert (=> b!599276 m!576531))

(declare-fun m!576533 () Bool)

(assert (=> b!599268 m!576533))

(assert (=> b!599279 m!576527))

(assert (=> b!599279 m!576527))

(declare-fun m!576535 () Bool)

(assert (=> b!599279 m!576535))

(declare-fun m!576537 () Bool)

(assert (=> b!599264 m!576537))

(assert (=> b!599278 m!576527))

(declare-fun m!576539 () Bool)

(assert (=> b!599278 m!576539))

(assert (=> b!599278 m!576527))

(declare-fun m!576541 () Bool)

(assert (=> b!599278 m!576541))

(assert (=> b!599278 m!576527))

(declare-fun m!576543 () Bool)

(assert (=> b!599278 m!576543))

(declare-fun m!576545 () Bool)

(assert (=> b!599278 m!576545))

(declare-fun m!576547 () Bool)

(assert (=> b!599269 m!576547))

(assert (=> b!599273 m!576529))

(declare-fun m!576549 () Bool)

(assert (=> b!599273 m!576549))

(declare-fun m!576551 () Bool)

(assert (=> b!599274 m!576551))

(assert (=> b!599274 m!576527))

(assert (=> b!599274 m!576527))

(declare-fun m!576553 () Bool)

(assert (=> b!599274 m!576553))

(declare-fun m!576555 () Bool)

(assert (=> b!599265 m!576555))

(declare-fun m!576557 () Bool)

(assert (=> b!599281 m!576557))

(declare-fun m!576559 () Bool)

(assert (=> start!54848 m!576559))

(declare-fun m!576561 () Bool)

(assert (=> start!54848 m!576561))

(declare-fun m!576563 () Bool)

(assert (=> b!599270 m!576563))

(assert (=> b!599272 m!576527))

(declare-fun m!576565 () Bool)

(assert (=> b!599271 m!576565))

(declare-fun m!576567 () Bool)

(assert (=> b!599271 m!576567))

(assert (=> b!599271 m!576527))

(assert (=> b!599271 m!576529))

(declare-fun m!576569 () Bool)

(assert (=> b!599271 m!576569))

(assert (=> b!599271 m!576527))

(declare-fun m!576571 () Bool)

(assert (=> b!599271 m!576571))

(declare-fun m!576573 () Bool)

(assert (=> b!599271 m!576573))

(declare-fun m!576575 () Bool)

(assert (=> b!599271 m!576575))

(assert (=> b!599280 m!576527))

(assert (=> b!599280 m!576527))

(declare-fun m!576577 () Bool)

(assert (=> b!599280 m!576577))

(assert (=> b!599266 m!576527))

(assert (=> b!599266 m!576527))

(declare-fun m!576579 () Bool)

(assert (=> b!599266 m!576579))

(push 1)

