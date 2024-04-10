; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55992 () Bool)

(assert start!55992)

(declare-fun b!615072 () Bool)

(declare-fun e!352664 () Bool)

(declare-fun e!352655 () Bool)

(assert (=> b!615072 (= e!352664 e!352655)))

(declare-fun res!396181 () Bool)

(assert (=> b!615072 (=> (not res!396181) (not e!352655))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37462 0))(
  ( (array!37463 (arr!17977 (Array (_ BitVec 32) (_ BitVec 64))) (size!18341 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37462)

(assert (=> b!615072 (= res!396181 (= (select (store (arr!17977 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!282389 () array!37462)

(assert (=> b!615072 (= lt!282389 (array!37463 (store (arr!17977 a!2986) i!1108 k0!1786) (size!18341 a!2986)))))

(declare-fun b!615073 () Bool)

(declare-datatypes ((Unit!19898 0))(
  ( (Unit!19899) )
))
(declare-fun e!352659 () Unit!19898)

(declare-fun Unit!19900 () Unit!19898)

(assert (=> b!615073 (= e!352659 Unit!19900)))

(declare-fun b!615074 () Bool)

(declare-fun e!352652 () Bool)

(declare-datatypes ((SeekEntryResult!6417 0))(
  ( (MissingZero!6417 (index!27952 (_ BitVec 32))) (Found!6417 (index!27953 (_ BitVec 32))) (Intermediate!6417 (undefined!7229 Bool) (index!27954 (_ BitVec 32)) (x!56753 (_ BitVec 32))) (Undefined!6417) (MissingVacant!6417 (index!27955 (_ BitVec 32))) )
))
(declare-fun lt!282394 () SeekEntryResult!6417)

(declare-fun lt!282380 () SeekEntryResult!6417)

(assert (=> b!615074 (= e!352652 (= lt!282394 lt!282380))))

(declare-fun b!615075 () Bool)

(declare-fun e!352661 () Unit!19898)

(declare-fun Unit!19901 () Unit!19898)

(assert (=> b!615075 (= e!352661 Unit!19901)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!615076 () Bool)

(declare-fun e!352653 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37462 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!615076 (= e!352653 (arrayContainsKey!0 lt!282389 (select (arr!17977 a!2986) j!136) index!984))))

(declare-fun res!396183 () Bool)

(declare-fun e!352660 () Bool)

(assert (=> start!55992 (=> (not res!396183) (not e!352660))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55992 (= res!396183 (validMask!0 mask!3053))))

(assert (=> start!55992 e!352660))

(assert (=> start!55992 true))

(declare-fun array_inv!13773 (array!37462) Bool)

(assert (=> start!55992 (array_inv!13773 a!2986)))

(declare-fun b!615077 () Bool)

(declare-fun res!396172 () Bool)

(assert (=> b!615077 (=> (not res!396172) (not e!352664))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!615077 (= res!396172 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17977 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!615078 () Bool)

(declare-fun res!396174 () Bool)

(assert (=> b!615078 (=> (not res!396174) (not e!352660))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!615078 (= res!396174 (validKeyInArray!0 k0!1786))))

(declare-fun b!615079 () Bool)

(declare-fun e!352663 () Unit!19898)

(declare-fun Unit!19902 () Unit!19898)

(assert (=> b!615079 (= e!352663 Unit!19902)))

(declare-fun b!615080 () Bool)

(declare-fun res!396178 () Bool)

(assert (=> b!615080 (= res!396178 (bvsge j!136 index!984))))

(declare-fun e!352654 () Bool)

(assert (=> b!615080 (=> res!396178 e!352654)))

(declare-fun e!352662 () Bool)

(assert (=> b!615080 (= e!352662 e!352654)))

(declare-fun b!615081 () Bool)

(declare-fun e!352665 () Bool)

(assert (=> b!615081 (= e!352655 e!352665)))

(declare-fun res!396176 () Bool)

(assert (=> b!615081 (=> (not res!396176) (not e!352665))))

(assert (=> b!615081 (= res!396176 (and (= lt!282394 (Found!6417 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17977 a!2986) index!984) (select (arr!17977 a!2986) j!136))) (not (= (select (arr!17977 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37462 (_ BitVec 32)) SeekEntryResult!6417)

(assert (=> b!615081 (= lt!282394 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17977 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!615082 () Bool)

(declare-fun res!396179 () Bool)

(assert (=> b!615082 (=> (not res!396179) (not e!352660))))

(assert (=> b!615082 (= res!396179 (and (= (size!18341 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18341 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18341 a!2986)) (not (= i!1108 j!136))))))

(declare-fun e!352657 () Bool)

(declare-fun b!615083 () Bool)

(assert (=> b!615083 (= e!352657 (arrayContainsKey!0 lt!282389 (select (arr!17977 a!2986) j!136) index!984))))

(declare-fun b!615084 () Bool)

(declare-fun Unit!19903 () Unit!19898)

(assert (=> b!615084 (= e!352663 Unit!19903)))

(declare-fun res!396184 () Bool)

(assert (=> b!615084 (= res!396184 (= (select (store (arr!17977 a!2986) i!1108 k0!1786) index!984) (select (arr!17977 a!2986) j!136)))))

(assert (=> b!615084 (=> (not res!396184) (not e!352662))))

(assert (=> b!615084 e!352662))

(declare-fun c!69818 () Bool)

(assert (=> b!615084 (= c!69818 (bvslt j!136 index!984))))

(declare-fun lt!282378 () Unit!19898)

(assert (=> b!615084 (= lt!282378 e!352661)))

(declare-fun c!69820 () Bool)

(assert (=> b!615084 (= c!69820 (bvslt index!984 j!136))))

(declare-fun lt!282386 () Unit!19898)

(declare-fun e!352658 () Unit!19898)

(assert (=> b!615084 (= lt!282386 e!352658)))

(assert (=> b!615084 false))

(declare-fun b!615085 () Bool)

(assert (=> b!615085 false))

(declare-fun lt!282396 () Unit!19898)

(declare-datatypes ((List!12018 0))(
  ( (Nil!12015) (Cons!12014 (h!13059 (_ BitVec 64)) (t!18246 List!12018)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37462 (_ BitVec 64) (_ BitVec 32) List!12018) Unit!19898)

(assert (=> b!615085 (= lt!282396 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282389 (select (arr!17977 a!2986) j!136) index!984 Nil!12015))))

(declare-fun arrayNoDuplicates!0 (array!37462 (_ BitVec 32) List!12018) Bool)

(assert (=> b!615085 (arrayNoDuplicates!0 lt!282389 index!984 Nil!12015)))

(declare-fun lt!282385 () Unit!19898)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37462 (_ BitVec 32) (_ BitVec 32)) Unit!19898)

(assert (=> b!615085 (= lt!282385 (lemmaNoDuplicateFromThenFromBigger!0 lt!282389 #b00000000000000000000000000000000 index!984))))

(assert (=> b!615085 (arrayNoDuplicates!0 lt!282389 #b00000000000000000000000000000000 Nil!12015)))

(declare-fun lt!282390 () Unit!19898)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37462 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12018) Unit!19898)

(assert (=> b!615085 (= lt!282390 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12015))))

(assert (=> b!615085 (arrayContainsKey!0 lt!282389 (select (arr!17977 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282383 () Unit!19898)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37462 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19898)

(assert (=> b!615085 (= lt!282383 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282389 (select (arr!17977 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!615085 e!352657))

(declare-fun res!396175 () Bool)

(assert (=> b!615085 (=> (not res!396175) (not e!352657))))

(assert (=> b!615085 (= res!396175 (arrayContainsKey!0 lt!282389 (select (arr!17977 a!2986) j!136) j!136))))

(declare-fun Unit!19904 () Unit!19898)

(assert (=> b!615085 (= e!352658 Unit!19904)))

(declare-fun b!615086 () Bool)

(declare-fun res!396173 () Bool)

(assert (=> b!615086 (=> (not res!396173) (not e!352664))))

(assert (=> b!615086 (= res!396173 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12015))))

(declare-fun b!615087 () Bool)

(declare-fun Unit!19905 () Unit!19898)

(assert (=> b!615087 (= e!352659 Unit!19905)))

(assert (=> b!615087 false))

(declare-fun b!615088 () Bool)

(assert (=> b!615088 (= e!352665 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun lt!282384 () Unit!19898)

(assert (=> b!615088 (= lt!282384 e!352663)))

(declare-fun c!69821 () Bool)

(declare-fun lt!282397 () SeekEntryResult!6417)

(assert (=> b!615088 (= c!69821 (= lt!282397 (Found!6417 index!984)))))

(declare-fun lt!282382 () Unit!19898)

(assert (=> b!615088 (= lt!282382 e!352659)))

(declare-fun c!69819 () Bool)

(assert (=> b!615088 (= c!69819 (= lt!282397 Undefined!6417))))

(declare-fun lt!282391 () (_ BitVec 64))

(assert (=> b!615088 (= lt!282397 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282391 lt!282389 mask!3053))))

(assert (=> b!615088 e!352652))

(declare-fun res!396177 () Bool)

(assert (=> b!615088 (=> (not res!396177) (not e!352652))))

(declare-fun lt!282387 () (_ BitVec 32))

(assert (=> b!615088 (= res!396177 (= lt!282380 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282387 vacantSpotIndex!68 lt!282391 lt!282389 mask!3053)))))

(assert (=> b!615088 (= lt!282380 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282387 vacantSpotIndex!68 (select (arr!17977 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!615088 (= lt!282391 (select (store (arr!17977 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!282381 () Unit!19898)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37462 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19898)

(assert (=> b!615088 (= lt!282381 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282387 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!615088 (= lt!282387 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!615089 () Bool)

(declare-fun res!396171 () Bool)

(assert (=> b!615089 (=> (not res!396171) (not e!352660))))

(assert (=> b!615089 (= res!396171 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!615090 () Bool)

(assert (=> b!615090 false))

(declare-fun lt!282392 () Unit!19898)

(assert (=> b!615090 (= lt!282392 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282389 (select (arr!17977 a!2986) j!136) j!136 Nil!12015))))

(assert (=> b!615090 (arrayNoDuplicates!0 lt!282389 j!136 Nil!12015)))

(declare-fun lt!282395 () Unit!19898)

(assert (=> b!615090 (= lt!282395 (lemmaNoDuplicateFromThenFromBigger!0 lt!282389 #b00000000000000000000000000000000 j!136))))

(assert (=> b!615090 (arrayNoDuplicates!0 lt!282389 #b00000000000000000000000000000000 Nil!12015)))

(declare-fun lt!282388 () Unit!19898)

(assert (=> b!615090 (= lt!282388 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12015))))

(assert (=> b!615090 (arrayContainsKey!0 lt!282389 (select (arr!17977 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282379 () Unit!19898)

(assert (=> b!615090 (= lt!282379 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282389 (select (arr!17977 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!19906 () Unit!19898)

(assert (=> b!615090 (= e!352661 Unit!19906)))

(declare-fun res!396180 () Bool)

(declare-fun b!615091 () Bool)

(assert (=> b!615091 (= res!396180 (arrayContainsKey!0 lt!282389 (select (arr!17977 a!2986) j!136) j!136))))

(assert (=> b!615091 (=> (not res!396180) (not e!352653))))

(assert (=> b!615091 (= e!352654 e!352653)))

(declare-fun b!615092 () Bool)

(declare-fun res!396182 () Bool)

(assert (=> b!615092 (=> (not res!396182) (not e!352660))))

(assert (=> b!615092 (= res!396182 (validKeyInArray!0 (select (arr!17977 a!2986) j!136)))))

(declare-fun b!615093 () Bool)

(assert (=> b!615093 (= e!352660 e!352664)))

(declare-fun res!396185 () Bool)

(assert (=> b!615093 (=> (not res!396185) (not e!352664))))

(declare-fun lt!282393 () SeekEntryResult!6417)

(assert (=> b!615093 (= res!396185 (or (= lt!282393 (MissingZero!6417 i!1108)) (= lt!282393 (MissingVacant!6417 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37462 (_ BitVec 32)) SeekEntryResult!6417)

(assert (=> b!615093 (= lt!282393 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!615094 () Bool)

(declare-fun Unit!19907 () Unit!19898)

(assert (=> b!615094 (= e!352658 Unit!19907)))

(declare-fun b!615095 () Bool)

(declare-fun res!396170 () Bool)

(assert (=> b!615095 (=> (not res!396170) (not e!352664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37462 (_ BitVec 32)) Bool)

(assert (=> b!615095 (= res!396170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!55992 res!396183) b!615082))

(assert (= (and b!615082 res!396179) b!615092))

(assert (= (and b!615092 res!396182) b!615078))

(assert (= (and b!615078 res!396174) b!615089))

(assert (= (and b!615089 res!396171) b!615093))

(assert (= (and b!615093 res!396185) b!615095))

(assert (= (and b!615095 res!396170) b!615086))

(assert (= (and b!615086 res!396173) b!615077))

(assert (= (and b!615077 res!396172) b!615072))

(assert (= (and b!615072 res!396181) b!615081))

(assert (= (and b!615081 res!396176) b!615088))

(assert (= (and b!615088 res!396177) b!615074))

(assert (= (and b!615088 c!69819) b!615087))

(assert (= (and b!615088 (not c!69819)) b!615073))

(assert (= (and b!615088 c!69821) b!615084))

(assert (= (and b!615088 (not c!69821)) b!615079))

(assert (= (and b!615084 res!396184) b!615080))

(assert (= (and b!615080 (not res!396178)) b!615091))

(assert (= (and b!615091 res!396180) b!615076))

(assert (= (and b!615084 c!69818) b!615090))

(assert (= (and b!615084 (not c!69818)) b!615075))

(assert (= (and b!615084 c!69820) b!615085))

(assert (= (and b!615084 (not c!69820)) b!615094))

(assert (= (and b!615085 res!396175) b!615083))

(declare-fun m!591285 () Bool)

(assert (=> b!615092 m!591285))

(assert (=> b!615092 m!591285))

(declare-fun m!591287 () Bool)

(assert (=> b!615092 m!591287))

(declare-fun m!591289 () Bool)

(assert (=> b!615088 m!591289))

(declare-fun m!591291 () Bool)

(assert (=> b!615088 m!591291))

(assert (=> b!615088 m!591285))

(declare-fun m!591293 () Bool)

(assert (=> b!615088 m!591293))

(declare-fun m!591295 () Bool)

(assert (=> b!615088 m!591295))

(declare-fun m!591297 () Bool)

(assert (=> b!615088 m!591297))

(declare-fun m!591299 () Bool)

(assert (=> b!615088 m!591299))

(assert (=> b!615088 m!591285))

(declare-fun m!591301 () Bool)

(assert (=> b!615088 m!591301))

(assert (=> b!615085 m!591285))

(declare-fun m!591303 () Bool)

(assert (=> b!615085 m!591303))

(assert (=> b!615085 m!591285))

(assert (=> b!615085 m!591285))

(declare-fun m!591305 () Bool)

(assert (=> b!615085 m!591305))

(declare-fun m!591307 () Bool)

(assert (=> b!615085 m!591307))

(declare-fun m!591309 () Bool)

(assert (=> b!615085 m!591309))

(declare-fun m!591311 () Bool)

(assert (=> b!615085 m!591311))

(assert (=> b!615085 m!591285))

(declare-fun m!591313 () Bool)

(assert (=> b!615085 m!591313))

(declare-fun m!591315 () Bool)

(assert (=> b!615085 m!591315))

(assert (=> b!615085 m!591285))

(declare-fun m!591317 () Bool)

(assert (=> b!615085 m!591317))

(assert (=> b!615090 m!591309))

(declare-fun m!591319 () Bool)

(assert (=> b!615090 m!591319))

(assert (=> b!615090 m!591285))

(assert (=> b!615090 m!591285))

(declare-fun m!591321 () Bool)

(assert (=> b!615090 m!591321))

(assert (=> b!615090 m!591285))

(declare-fun m!591323 () Bool)

(assert (=> b!615090 m!591323))

(declare-fun m!591325 () Bool)

(assert (=> b!615090 m!591325))

(assert (=> b!615090 m!591285))

(declare-fun m!591327 () Bool)

(assert (=> b!615090 m!591327))

(assert (=> b!615090 m!591307))

(declare-fun m!591329 () Bool)

(assert (=> b!615086 m!591329))

(assert (=> b!615072 m!591293))

(declare-fun m!591331 () Bool)

(assert (=> b!615072 m!591331))

(assert (=> b!615091 m!591285))

(assert (=> b!615091 m!591285))

(assert (=> b!615091 m!591303))

(assert (=> b!615084 m!591293))

(declare-fun m!591333 () Bool)

(assert (=> b!615084 m!591333))

(assert (=> b!615084 m!591285))

(declare-fun m!591335 () Bool)

(assert (=> b!615089 m!591335))

(assert (=> b!615076 m!591285))

(assert (=> b!615076 m!591285))

(declare-fun m!591337 () Bool)

(assert (=> b!615076 m!591337))

(assert (=> b!615083 m!591285))

(assert (=> b!615083 m!591285))

(assert (=> b!615083 m!591337))

(declare-fun m!591339 () Bool)

(assert (=> b!615078 m!591339))

(declare-fun m!591341 () Bool)

(assert (=> b!615093 m!591341))

(declare-fun m!591343 () Bool)

(assert (=> b!615081 m!591343))

(assert (=> b!615081 m!591285))

(assert (=> b!615081 m!591285))

(declare-fun m!591345 () Bool)

(assert (=> b!615081 m!591345))

(declare-fun m!591347 () Bool)

(assert (=> start!55992 m!591347))

(declare-fun m!591349 () Bool)

(assert (=> start!55992 m!591349))

(declare-fun m!591351 () Bool)

(assert (=> b!615095 m!591351))

(declare-fun m!591353 () Bool)

(assert (=> b!615077 m!591353))

(check-sat (not b!615086) (not b!615081) (not b!615089) (not b!615091) (not b!615095) (not b!615076) (not start!55992) (not b!615078) (not b!615092) (not b!615085) (not b!615083) (not b!615090) (not b!615088) (not b!615093))
(check-sat)
