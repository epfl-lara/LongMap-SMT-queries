; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56232 () Bool)

(assert start!56232)

(declare-fun b!622274 () Bool)

(declare-datatypes ((Unit!20827 0))(
  ( (Unit!20828) )
))
(declare-fun e!356924 () Unit!20827)

(declare-fun Unit!20829 () Unit!20827)

(assert (=> b!622274 (= e!356924 Unit!20829)))

(declare-fun b!622275 () Bool)

(declare-fun res!400996 () Bool)

(declare-fun e!356935 () Bool)

(assert (=> b!622275 (=> (not res!400996) (not e!356935))))

(declare-datatypes ((array!37647 0))(
  ( (array!37648 (arr!18067 (Array (_ BitVec 32) (_ BitVec 64))) (size!18431 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37647)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37647 (_ BitVec 32)) Bool)

(assert (=> b!622275 (= res!400996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!622276 () Bool)

(declare-fun res!400998 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!622276 (= res!400998 (bvsge j!136 index!984))))

(declare-fun e!356925 () Bool)

(assert (=> b!622276 (=> res!400998 e!356925)))

(declare-fun e!356926 () Bool)

(assert (=> b!622276 (= e!356926 e!356925)))

(declare-fun e!356934 () Bool)

(declare-fun b!622277 () Bool)

(declare-fun lt!288182 () array!37647)

(declare-fun arrayContainsKey!0 (array!37647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!622277 (= e!356934 (arrayContainsKey!0 lt!288182 (select (arr!18067 a!2986) j!136) index!984))))

(declare-fun b!622278 () Bool)

(declare-fun e!356937 () Unit!20827)

(declare-fun Unit!20830 () Unit!20827)

(assert (=> b!622278 (= e!356937 Unit!20830)))

(declare-datatypes ((SeekEntryResult!6463 0))(
  ( (MissingZero!6463 (index!28136 (_ BitVec 32))) (Found!6463 (index!28137 (_ BitVec 32))) (Intermediate!6463 (undefined!7275 Bool) (index!28138 (_ BitVec 32)) (x!57058 (_ BitVec 32))) (Undefined!6463) (MissingVacant!6463 (index!28139 (_ BitVec 32))) )
))
(declare-fun lt!288192 () SeekEntryResult!6463)

(declare-fun b!622279 () Bool)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun e!356928 () Bool)

(assert (=> b!622279 (= e!356928 (not (or (= lt!288192 (MissingVacant!6463 vacantSpotIndex!68)) (bvsge mask!3053 #b00000000000000000000000000000000))))))

(declare-fun lt!288196 () Unit!20827)

(declare-fun e!356931 () Unit!20827)

(assert (=> b!622279 (= lt!288196 e!356931)))

(declare-fun c!71015 () Bool)

(assert (=> b!622279 (= c!71015 (= lt!288192 (Found!6463 index!984)))))

(declare-fun lt!288184 () Unit!20827)

(assert (=> b!622279 (= lt!288184 e!356937)))

(declare-fun c!71013 () Bool)

(assert (=> b!622279 (= c!71013 (= lt!288192 Undefined!6463))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!288185 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37647 (_ BitVec 32)) SeekEntryResult!6463)

(assert (=> b!622279 (= lt!288192 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288185 lt!288182 mask!3053))))

(declare-fun e!356933 () Bool)

(assert (=> b!622279 e!356933))

(declare-fun res!400993 () Bool)

(assert (=> b!622279 (=> (not res!400993) (not e!356933))))

(declare-fun lt!288190 () (_ BitVec 32))

(declare-fun lt!288197 () SeekEntryResult!6463)

(assert (=> b!622279 (= res!400993 (= lt!288197 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288190 vacantSpotIndex!68 lt!288185 lt!288182 mask!3053)))))

(assert (=> b!622279 (= lt!288197 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288190 vacantSpotIndex!68 (select (arr!18067 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!622279 (= lt!288185 (select (store (arr!18067 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!288181 () Unit!20827)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37647 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20827)

(assert (=> b!622279 (= lt!288181 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288190 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!622279 (= lt!288190 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!622281 () Bool)

(declare-fun e!356930 () Bool)

(assert (=> b!622281 (= e!356935 e!356930)))

(declare-fun res!400990 () Bool)

(assert (=> b!622281 (=> (not res!400990) (not e!356930))))

(assert (=> b!622281 (= res!400990 (= (select (store (arr!18067 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!622281 (= lt!288182 (array!37648 (store (arr!18067 a!2986) i!1108 k0!1786) (size!18431 a!2986)))))

(declare-fun b!622282 () Bool)

(assert (=> b!622282 (= e!356930 e!356928)))

(declare-fun res!400999 () Bool)

(assert (=> b!622282 (=> (not res!400999) (not e!356928))))

(declare-fun lt!288199 () SeekEntryResult!6463)

(assert (=> b!622282 (= res!400999 (and (= lt!288199 (Found!6463 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18067 a!2986) index!984) (select (arr!18067 a!2986) j!136))) (not (= (select (arr!18067 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!622282 (= lt!288199 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18067 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!622283 () Bool)

(declare-fun e!356932 () Bool)

(assert (=> b!622283 (= e!356932 (arrayContainsKey!0 lt!288182 (select (arr!18067 a!2986) j!136) index!984))))

(declare-fun b!622284 () Bool)

(declare-fun Unit!20831 () Unit!20827)

(assert (=> b!622284 (= e!356931 Unit!20831)))

(declare-fun res!400994 () Bool)

(assert (=> b!622284 (= res!400994 (= (select (store (arr!18067 a!2986) i!1108 k0!1786) index!984) (select (arr!18067 a!2986) j!136)))))

(assert (=> b!622284 (=> (not res!400994) (not e!356926))))

(assert (=> b!622284 e!356926))

(declare-fun c!71012 () Bool)

(assert (=> b!622284 (= c!71012 (bvslt j!136 index!984))))

(declare-fun lt!288188 () Unit!20827)

(declare-fun e!356936 () Unit!20827)

(assert (=> b!622284 (= lt!288188 e!356936)))

(declare-fun c!71014 () Bool)

(assert (=> b!622284 (= c!71014 (bvslt index!984 j!136))))

(declare-fun lt!288189 () Unit!20827)

(assert (=> b!622284 (= lt!288189 e!356924)))

(assert (=> b!622284 false))

(declare-fun b!622285 () Bool)

(declare-fun Unit!20832 () Unit!20827)

(assert (=> b!622285 (= e!356937 Unit!20832)))

(assert (=> b!622285 false))

(declare-fun b!622286 () Bool)

(declare-fun res!401002 () Bool)

(assert (=> b!622286 (= res!401002 (arrayContainsKey!0 lt!288182 (select (arr!18067 a!2986) j!136) j!136))))

(assert (=> b!622286 (=> (not res!401002) (not e!356932))))

(assert (=> b!622286 (= e!356925 e!356932)))

(declare-fun b!622287 () Bool)

(declare-fun res!400988 () Bool)

(declare-fun e!356929 () Bool)

(assert (=> b!622287 (=> (not res!400988) (not e!356929))))

(assert (=> b!622287 (= res!400988 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!622288 () Bool)

(declare-fun res!400987 () Bool)

(assert (=> b!622288 (=> (not res!400987) (not e!356929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!622288 (= res!400987 (validKeyInArray!0 (select (arr!18067 a!2986) j!136)))))

(declare-fun b!622289 () Bool)

(declare-fun res!400989 () Bool)

(assert (=> b!622289 (=> (not res!400989) (not e!356929))))

(assert (=> b!622289 (= res!400989 (and (= (size!18431 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18431 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18431 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!622290 () Bool)

(declare-fun Unit!20833 () Unit!20827)

(assert (=> b!622290 (= e!356936 Unit!20833)))

(declare-fun b!622291 () Bool)

(assert (=> b!622291 false))

(declare-fun lt!288183 () Unit!20827)

(declare-datatypes ((List!12015 0))(
  ( (Nil!12012) (Cons!12011 (h!13059 (_ BitVec 64)) (t!18235 List!12015)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37647 (_ BitVec 64) (_ BitVec 32) List!12015) Unit!20827)

(assert (=> b!622291 (= lt!288183 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288182 (select (arr!18067 a!2986) j!136) index!984 Nil!12012))))

(declare-fun arrayNoDuplicates!0 (array!37647 (_ BitVec 32) List!12015) Bool)

(assert (=> b!622291 (arrayNoDuplicates!0 lt!288182 index!984 Nil!12012)))

(declare-fun lt!288194 () Unit!20827)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37647 (_ BitVec 32) (_ BitVec 32)) Unit!20827)

(assert (=> b!622291 (= lt!288194 (lemmaNoDuplicateFromThenFromBigger!0 lt!288182 #b00000000000000000000000000000000 index!984))))

(assert (=> b!622291 (arrayNoDuplicates!0 lt!288182 #b00000000000000000000000000000000 Nil!12012)))

(declare-fun lt!288198 () Unit!20827)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37647 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12015) Unit!20827)

(assert (=> b!622291 (= lt!288198 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12012))))

(assert (=> b!622291 (arrayContainsKey!0 lt!288182 (select (arr!18067 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288191 () Unit!20827)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37647 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20827)

(assert (=> b!622291 (= lt!288191 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288182 (select (arr!18067 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!622291 e!356934))

(declare-fun res!401001 () Bool)

(assert (=> b!622291 (=> (not res!401001) (not e!356934))))

(assert (=> b!622291 (= res!401001 (arrayContainsKey!0 lt!288182 (select (arr!18067 a!2986) j!136) j!136))))

(declare-fun Unit!20834 () Unit!20827)

(assert (=> b!622291 (= e!356924 Unit!20834)))

(declare-fun b!622292 () Bool)

(declare-fun res!401000 () Bool)

(assert (=> b!622292 (=> (not res!401000) (not e!356929))))

(assert (=> b!622292 (= res!401000 (validKeyInArray!0 k0!1786))))

(declare-fun b!622293 () Bool)

(declare-fun res!400992 () Bool)

(assert (=> b!622293 (=> (not res!400992) (not e!356935))))

(assert (=> b!622293 (= res!400992 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18067 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!622294 () Bool)

(assert (=> b!622294 (= e!356929 e!356935)))

(declare-fun res!400991 () Bool)

(assert (=> b!622294 (=> (not res!400991) (not e!356935))))

(declare-fun lt!288186 () SeekEntryResult!6463)

(assert (=> b!622294 (= res!400991 (or (= lt!288186 (MissingZero!6463 i!1108)) (= lt!288186 (MissingVacant!6463 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37647 (_ BitVec 32)) SeekEntryResult!6463)

(assert (=> b!622294 (= lt!288186 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!622295 () Bool)

(assert (=> b!622295 (= e!356933 (= lt!288199 lt!288197))))

(declare-fun b!622280 () Bool)

(declare-fun Unit!20835 () Unit!20827)

(assert (=> b!622280 (= e!356931 Unit!20835)))

(declare-fun res!400995 () Bool)

(assert (=> start!56232 (=> (not res!400995) (not e!356929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56232 (= res!400995 (validMask!0 mask!3053))))

(assert (=> start!56232 e!356929))

(assert (=> start!56232 true))

(declare-fun array_inv!13926 (array!37647) Bool)

(assert (=> start!56232 (array_inv!13926 a!2986)))

(declare-fun b!622296 () Bool)

(declare-fun res!400997 () Bool)

(assert (=> b!622296 (=> (not res!400997) (not e!356935))))

(assert (=> b!622296 (= res!400997 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12012))))

(declare-fun b!622297 () Bool)

(assert (=> b!622297 false))

(declare-fun lt!288193 () Unit!20827)

(assert (=> b!622297 (= lt!288193 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288182 (select (arr!18067 a!2986) j!136) j!136 Nil!12012))))

(assert (=> b!622297 (arrayNoDuplicates!0 lt!288182 j!136 Nil!12012)))

(declare-fun lt!288195 () Unit!20827)

(assert (=> b!622297 (= lt!288195 (lemmaNoDuplicateFromThenFromBigger!0 lt!288182 #b00000000000000000000000000000000 j!136))))

(assert (=> b!622297 (arrayNoDuplicates!0 lt!288182 #b00000000000000000000000000000000 Nil!12012)))

(declare-fun lt!288187 () Unit!20827)

(assert (=> b!622297 (= lt!288187 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12012))))

(assert (=> b!622297 (arrayContainsKey!0 lt!288182 (select (arr!18067 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288180 () Unit!20827)

(assert (=> b!622297 (= lt!288180 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288182 (select (arr!18067 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20836 () Unit!20827)

(assert (=> b!622297 (= e!356936 Unit!20836)))

(assert (= (and start!56232 res!400995) b!622289))

(assert (= (and b!622289 res!400989) b!622288))

(assert (= (and b!622288 res!400987) b!622292))

(assert (= (and b!622292 res!401000) b!622287))

(assert (= (and b!622287 res!400988) b!622294))

(assert (= (and b!622294 res!400991) b!622275))

(assert (= (and b!622275 res!400996) b!622296))

(assert (= (and b!622296 res!400997) b!622293))

(assert (= (and b!622293 res!400992) b!622281))

(assert (= (and b!622281 res!400990) b!622282))

(assert (= (and b!622282 res!400999) b!622279))

(assert (= (and b!622279 res!400993) b!622295))

(assert (= (and b!622279 c!71013) b!622285))

(assert (= (and b!622279 (not c!71013)) b!622278))

(assert (= (and b!622279 c!71015) b!622284))

(assert (= (and b!622279 (not c!71015)) b!622280))

(assert (= (and b!622284 res!400994) b!622276))

(assert (= (and b!622276 (not res!400998)) b!622286))

(assert (= (and b!622286 res!401002) b!622283))

(assert (= (and b!622284 c!71012) b!622297))

(assert (= (and b!622284 (not c!71012)) b!622290))

(assert (= (and b!622284 c!71014) b!622291))

(assert (= (and b!622284 (not c!71014)) b!622274))

(assert (= (and b!622291 res!401001) b!622277))

(declare-fun m!598427 () Bool)

(assert (=> b!622284 m!598427))

(declare-fun m!598429 () Bool)

(assert (=> b!622284 m!598429))

(declare-fun m!598431 () Bool)

(assert (=> b!622284 m!598431))

(declare-fun m!598433 () Bool)

(assert (=> b!622293 m!598433))

(declare-fun m!598435 () Bool)

(assert (=> b!622275 m!598435))

(declare-fun m!598437 () Bool)

(assert (=> b!622287 m!598437))

(assert (=> b!622297 m!598431))

(declare-fun m!598439 () Bool)

(assert (=> b!622297 m!598439))

(assert (=> b!622297 m!598431))

(declare-fun m!598441 () Bool)

(assert (=> b!622297 m!598441))

(assert (=> b!622297 m!598431))

(declare-fun m!598443 () Bool)

(assert (=> b!622297 m!598443))

(declare-fun m!598445 () Bool)

(assert (=> b!622297 m!598445))

(declare-fun m!598447 () Bool)

(assert (=> b!622297 m!598447))

(assert (=> b!622297 m!598431))

(declare-fun m!598449 () Bool)

(assert (=> b!622297 m!598449))

(declare-fun m!598451 () Bool)

(assert (=> b!622297 m!598451))

(assert (=> b!622281 m!598427))

(declare-fun m!598453 () Bool)

(assert (=> b!622281 m!598453))

(declare-fun m!598455 () Bool)

(assert (=> b!622296 m!598455))

(declare-fun m!598457 () Bool)

(assert (=> b!622294 m!598457))

(declare-fun m!598459 () Bool)

(assert (=> b!622282 m!598459))

(assert (=> b!622282 m!598431))

(assert (=> b!622282 m!598431))

(declare-fun m!598461 () Bool)

(assert (=> b!622282 m!598461))

(assert (=> b!622283 m!598431))

(assert (=> b!622283 m!598431))

(declare-fun m!598463 () Bool)

(assert (=> b!622283 m!598463))

(declare-fun m!598465 () Bool)

(assert (=> b!622279 m!598465))

(declare-fun m!598467 () Bool)

(assert (=> b!622279 m!598467))

(assert (=> b!622279 m!598431))

(declare-fun m!598469 () Bool)

(assert (=> b!622279 m!598469))

(assert (=> b!622279 m!598431))

(assert (=> b!622279 m!598427))

(declare-fun m!598471 () Bool)

(assert (=> b!622279 m!598471))

(declare-fun m!598473 () Bool)

(assert (=> b!622279 m!598473))

(declare-fun m!598475 () Bool)

(assert (=> b!622279 m!598475))

(assert (=> b!622291 m!598431))

(declare-fun m!598477 () Bool)

(assert (=> b!622291 m!598477))

(assert (=> b!622291 m!598431))

(declare-fun m!598479 () Bool)

(assert (=> b!622291 m!598479))

(assert (=> b!622291 m!598431))

(declare-fun m!598481 () Bool)

(assert (=> b!622291 m!598481))

(assert (=> b!622291 m!598431))

(declare-fun m!598483 () Bool)

(assert (=> b!622291 m!598483))

(declare-fun m!598485 () Bool)

(assert (=> b!622291 m!598485))

(assert (=> b!622291 m!598451))

(assert (=> b!622291 m!598441))

(assert (=> b!622291 m!598431))

(declare-fun m!598487 () Bool)

(assert (=> b!622291 m!598487))

(assert (=> b!622277 m!598431))

(assert (=> b!622277 m!598431))

(assert (=> b!622277 m!598463))

(assert (=> b!622286 m!598431))

(assert (=> b!622286 m!598431))

(assert (=> b!622286 m!598487))

(assert (=> b!622288 m!598431))

(assert (=> b!622288 m!598431))

(declare-fun m!598489 () Bool)

(assert (=> b!622288 m!598489))

(declare-fun m!598491 () Bool)

(assert (=> b!622292 m!598491))

(declare-fun m!598493 () Bool)

(assert (=> start!56232 m!598493))

(declare-fun m!598495 () Bool)

(assert (=> start!56232 m!598495))

(check-sat (not b!622275) (not b!622286) (not start!56232) (not b!622279) (not b!622296) (not b!622297) (not b!622282) (not b!622277) (not b!622292) (not b!622294) (not b!622287) (not b!622291) (not b!622288) (not b!622283))
(check-sat)
