; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55548 () Bool)

(assert start!55548)

(declare-fun b!607377 () Bool)

(declare-fun res!390206 () Bool)

(declare-fun e!347828 () Bool)

(assert (=> b!607377 (=> (not res!390206) (not e!347828))))

(declare-datatypes ((array!37279 0))(
  ( (array!37280 (arr!17890 (Array (_ BitVec 32) (_ BitVec 64))) (size!18254 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37279)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37279 (_ BitVec 32)) Bool)

(assert (=> b!607377 (= res!390206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!347829 () Bool)

(declare-fun b!607378 () Bool)

(declare-fun lt!277293 () array!37279)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!607378 (= e!347829 (arrayContainsKey!0 lt!277293 (select (arr!17890 a!2986) j!136) index!984))))

(declare-fun b!607379 () Bool)

(declare-datatypes ((Unit!19360 0))(
  ( (Unit!19361) )
))
(declare-fun e!347820 () Unit!19360)

(declare-fun Unit!19362 () Unit!19360)

(assert (=> b!607379 (= e!347820 Unit!19362)))

(declare-fun lt!277286 () Unit!19360)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37279 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19360)

(assert (=> b!607379 (= lt!277286 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277293 (select (arr!17890 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!607379 (arrayContainsKey!0 lt!277293 (select (arr!17890 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!277287 () Unit!19360)

(declare-datatypes ((List!11931 0))(
  ( (Nil!11928) (Cons!11927 (h!12972 (_ BitVec 64)) (t!18159 List!11931)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37279 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11931) Unit!19360)

(assert (=> b!607379 (= lt!277287 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11928))))

(declare-fun arrayNoDuplicates!0 (array!37279 (_ BitVec 32) List!11931) Bool)

(assert (=> b!607379 (arrayNoDuplicates!0 lt!277293 #b00000000000000000000000000000000 Nil!11928)))

(declare-fun lt!277294 () Unit!19360)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37279 (_ BitVec 32) (_ BitVec 32)) Unit!19360)

(assert (=> b!607379 (= lt!277294 (lemmaNoDuplicateFromThenFromBigger!0 lt!277293 #b00000000000000000000000000000000 j!136))))

(assert (=> b!607379 (arrayNoDuplicates!0 lt!277293 j!136 Nil!11928)))

(declare-fun lt!277300 () Unit!19360)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37279 (_ BitVec 64) (_ BitVec 32) List!11931) Unit!19360)

(assert (=> b!607379 (= lt!277300 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277293 (select (arr!17890 a!2986) j!136) j!136 Nil!11928))))

(assert (=> b!607379 false))

(declare-fun b!607380 () Bool)

(declare-fun e!347814 () Bool)

(assert (=> b!607380 (= e!347814 true)))

(declare-fun lt!277289 () Bool)

(declare-fun contains!3007 (List!11931 (_ BitVec 64)) Bool)

(assert (=> b!607380 (= lt!277289 (contains!3007 Nil!11928 k0!1786))))

(declare-fun b!607381 () Bool)

(declare-fun res!390226 () Bool)

(declare-fun e!347819 () Bool)

(assert (=> b!607381 (=> (not res!390226) (not e!347819))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!607381 (= res!390226 (validKeyInArray!0 k0!1786))))

(declare-fun b!607382 () Bool)

(declare-fun e!347823 () Unit!19360)

(declare-fun Unit!19363 () Unit!19360)

(assert (=> b!607382 (= e!347823 Unit!19363)))

(assert (=> b!607382 false))

(declare-fun b!607384 () Bool)

(declare-fun res!390227 () Bool)

(assert (=> b!607384 (=> (not res!390227) (not e!347828))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!607384 (= res!390227 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17890 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!607385 () Bool)

(declare-fun e!347826 () Bool)

(assert (=> b!607385 (= e!347828 e!347826)))

(declare-fun res!390210 () Bool)

(assert (=> b!607385 (=> (not res!390210) (not e!347826))))

(assert (=> b!607385 (= res!390210 (= (select (store (arr!17890 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!607385 (= lt!277293 (array!37280 (store (arr!17890 a!2986) i!1108 k0!1786) (size!18254 a!2986)))))

(declare-fun b!607386 () Bool)

(declare-fun e!347817 () Bool)

(assert (=> b!607386 (= e!347817 (arrayContainsKey!0 lt!277293 (select (arr!17890 a!2986) j!136) index!984))))

(declare-fun b!607387 () Bool)

(declare-fun e!347821 () Bool)

(declare-fun e!347824 () Bool)

(assert (=> b!607387 (= e!347821 e!347824)))

(declare-fun res!390218 () Bool)

(assert (=> b!607387 (=> res!390218 e!347824)))

(assert (=> b!607387 (= res!390218 (bvsge index!984 j!136))))

(declare-fun lt!277288 () Unit!19360)

(assert (=> b!607387 (= lt!277288 e!347820)))

(declare-fun c!68953 () Bool)

(assert (=> b!607387 (= c!68953 (bvslt j!136 index!984))))

(declare-fun b!607388 () Bool)

(declare-fun res!390220 () Bool)

(assert (=> b!607388 (=> (not res!390220) (not e!347819))))

(assert (=> b!607388 (= res!390220 (and (= (size!18254 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18254 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18254 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!607389 () Bool)

(declare-fun e!347822 () Bool)

(assert (=> b!607389 (= e!347822 e!347829)))

(declare-fun res!390208 () Bool)

(assert (=> b!607389 (=> (not res!390208) (not e!347829))))

(assert (=> b!607389 (= res!390208 (arrayContainsKey!0 lt!277293 (select (arr!17890 a!2986) j!136) j!136))))

(declare-fun b!607390 () Bool)

(declare-fun res!390225 () Bool)

(assert (=> b!607390 (=> res!390225 e!347814)))

(assert (=> b!607390 (= res!390225 (contains!3007 Nil!11928 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607391 () Bool)

(assert (=> b!607391 (= e!347819 e!347828)))

(declare-fun res!390217 () Bool)

(assert (=> b!607391 (=> (not res!390217) (not e!347828))))

(declare-datatypes ((SeekEntryResult!6330 0))(
  ( (MissingZero!6330 (index!27595 (_ BitVec 32))) (Found!6330 (index!27596 (_ BitVec 32))) (Intermediate!6330 (undefined!7142 Bool) (index!27597 (_ BitVec 32)) (x!56407 (_ BitVec 32))) (Undefined!6330) (MissingVacant!6330 (index!27598 (_ BitVec 32))) )
))
(declare-fun lt!277291 () SeekEntryResult!6330)

(assert (=> b!607391 (= res!390217 (or (= lt!277291 (MissingZero!6330 i!1108)) (= lt!277291 (MissingVacant!6330 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37279 (_ BitVec 32)) SeekEntryResult!6330)

(assert (=> b!607391 (= lt!277291 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!607392 () Bool)

(declare-fun Unit!19364 () Unit!19360)

(assert (=> b!607392 (= e!347823 Unit!19364)))

(declare-fun b!607393 () Bool)

(declare-fun Unit!19365 () Unit!19360)

(assert (=> b!607393 (= e!347820 Unit!19365)))

(declare-fun b!607394 () Bool)

(declare-fun e!347815 () Bool)

(declare-fun e!347825 () Bool)

(assert (=> b!607394 (= e!347815 (not e!347825))))

(declare-fun res!390213 () Bool)

(assert (=> b!607394 (=> res!390213 e!347825)))

(declare-fun lt!277296 () SeekEntryResult!6330)

(assert (=> b!607394 (= res!390213 (not (= lt!277296 (Found!6330 index!984))))))

(declare-fun lt!277285 () Unit!19360)

(assert (=> b!607394 (= lt!277285 e!347823)))

(declare-fun c!68954 () Bool)

(assert (=> b!607394 (= c!68954 (= lt!277296 Undefined!6330))))

(declare-fun lt!277290 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37279 (_ BitVec 32)) SeekEntryResult!6330)

(assert (=> b!607394 (= lt!277296 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277290 lt!277293 mask!3053))))

(declare-fun e!347827 () Bool)

(assert (=> b!607394 e!347827))

(declare-fun res!390219 () Bool)

(assert (=> b!607394 (=> (not res!390219) (not e!347827))))

(declare-fun lt!277284 () SeekEntryResult!6330)

(declare-fun lt!277292 () (_ BitVec 32))

(assert (=> b!607394 (= res!390219 (= lt!277284 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277292 vacantSpotIndex!68 lt!277290 lt!277293 mask!3053)))))

(assert (=> b!607394 (= lt!277284 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277292 vacantSpotIndex!68 (select (arr!17890 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!607394 (= lt!277290 (select (store (arr!17890 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!277297 () Unit!19360)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37279 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19360)

(assert (=> b!607394 (= lt!277297 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277292 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!607394 (= lt!277292 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!607395 () Bool)

(declare-fun res!390207 () Bool)

(assert (=> b!607395 (=> (not res!390207) (not e!347828))))

(assert (=> b!607395 (= res!390207 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11928))))

(declare-fun b!607396 () Bool)

(declare-fun e!347816 () Bool)

(assert (=> b!607396 (= e!347816 e!347822)))

(declare-fun res!390215 () Bool)

(assert (=> b!607396 (=> res!390215 e!347822)))

(declare-fun lt!277299 () (_ BitVec 64))

(assert (=> b!607396 (= res!390215 (or (not (= (select (arr!17890 a!2986) j!136) lt!277290)) (not (= (select (arr!17890 a!2986) j!136) lt!277299)) (bvsge j!136 index!984)))))

(declare-fun b!607397 () Bool)

(declare-fun res!390223 () Bool)

(assert (=> b!607397 (=> res!390223 e!347814)))

(declare-fun noDuplicate!313 (List!11931) Bool)

(assert (=> b!607397 (= res!390223 (not (noDuplicate!313 Nil!11928)))))

(declare-fun b!607398 () Bool)

(declare-fun res!390222 () Bool)

(assert (=> b!607398 (=> (not res!390222) (not e!347819))))

(assert (=> b!607398 (= res!390222 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!607399 () Bool)

(declare-fun res!390209 () Bool)

(assert (=> b!607399 (=> res!390209 e!347814)))

(assert (=> b!607399 (= res!390209 (contains!3007 Nil!11928 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607400 () Bool)

(assert (=> b!607400 (= e!347826 e!347815)))

(declare-fun res!390216 () Bool)

(assert (=> b!607400 (=> (not res!390216) (not e!347815))))

(declare-fun lt!277295 () SeekEntryResult!6330)

(assert (=> b!607400 (= res!390216 (and (= lt!277295 (Found!6330 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17890 a!2986) index!984) (select (arr!17890 a!2986) j!136))) (not (= (select (arr!17890 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!607400 (= lt!277295 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17890 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!390221 () Bool)

(assert (=> start!55548 (=> (not res!390221) (not e!347819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55548 (= res!390221 (validMask!0 mask!3053))))

(assert (=> start!55548 e!347819))

(assert (=> start!55548 true))

(declare-fun array_inv!13686 (array!37279) Bool)

(assert (=> start!55548 (array_inv!13686 a!2986)))

(declare-fun b!607383 () Bool)

(assert (=> b!607383 (= e!347824 e!347814)))

(declare-fun res!390211 () Bool)

(assert (=> b!607383 (=> res!390211 e!347814)))

(assert (=> b!607383 (= res!390211 (or (bvsge (size!18254 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18254 a!2986))))))

(assert (=> b!607383 (arrayContainsKey!0 lt!277293 (select (arr!17890 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277298 () Unit!19360)

(assert (=> b!607383 (= lt!277298 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277293 (select (arr!17890 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!607383 e!347817))

(declare-fun res!390212 () Bool)

(assert (=> b!607383 (=> (not res!390212) (not e!347817))))

(assert (=> b!607383 (= res!390212 (arrayContainsKey!0 lt!277293 (select (arr!17890 a!2986) j!136) j!136))))

(declare-fun b!607401 () Bool)

(assert (=> b!607401 (= e!347825 e!347821)))

(declare-fun res!390224 () Bool)

(assert (=> b!607401 (=> res!390224 e!347821)))

(assert (=> b!607401 (= res!390224 (or (not (= (select (arr!17890 a!2986) j!136) lt!277290)) (not (= (select (arr!17890 a!2986) j!136) lt!277299))))))

(assert (=> b!607401 e!347816))

(declare-fun res!390214 () Bool)

(assert (=> b!607401 (=> (not res!390214) (not e!347816))))

(assert (=> b!607401 (= res!390214 (= lt!277299 (select (arr!17890 a!2986) j!136)))))

(assert (=> b!607401 (= lt!277299 (select (store (arr!17890 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!607402 () Bool)

(assert (=> b!607402 (= e!347827 (= lt!277295 lt!277284))))

(declare-fun b!607403 () Bool)

(declare-fun res!390205 () Bool)

(assert (=> b!607403 (=> (not res!390205) (not e!347819))))

(assert (=> b!607403 (= res!390205 (validKeyInArray!0 (select (arr!17890 a!2986) j!136)))))

(assert (= (and start!55548 res!390221) b!607388))

(assert (= (and b!607388 res!390220) b!607403))

(assert (= (and b!607403 res!390205) b!607381))

(assert (= (and b!607381 res!390226) b!607398))

(assert (= (and b!607398 res!390222) b!607391))

(assert (= (and b!607391 res!390217) b!607377))

(assert (= (and b!607377 res!390206) b!607395))

(assert (= (and b!607395 res!390207) b!607384))

(assert (= (and b!607384 res!390227) b!607385))

(assert (= (and b!607385 res!390210) b!607400))

(assert (= (and b!607400 res!390216) b!607394))

(assert (= (and b!607394 res!390219) b!607402))

(assert (= (and b!607394 c!68954) b!607382))

(assert (= (and b!607394 (not c!68954)) b!607392))

(assert (= (and b!607394 (not res!390213)) b!607401))

(assert (= (and b!607401 res!390214) b!607396))

(assert (= (and b!607396 (not res!390215)) b!607389))

(assert (= (and b!607389 res!390208) b!607378))

(assert (= (and b!607401 (not res!390224)) b!607387))

(assert (= (and b!607387 c!68953) b!607379))

(assert (= (and b!607387 (not c!68953)) b!607393))

(assert (= (and b!607387 (not res!390218)) b!607383))

(assert (= (and b!607383 res!390212) b!607386))

(assert (= (and b!607383 (not res!390211)) b!607397))

(assert (= (and b!607397 (not res!390223)) b!607390))

(assert (= (and b!607390 (not res!390225)) b!607399))

(assert (= (and b!607399 (not res!390209)) b!607380))

(declare-fun m!584123 () Bool)

(assert (=> b!607385 m!584123))

(declare-fun m!584125 () Bool)

(assert (=> b!607385 m!584125))

(declare-fun m!584127 () Bool)

(assert (=> b!607377 m!584127))

(declare-fun m!584129 () Bool)

(assert (=> b!607383 m!584129))

(assert (=> b!607383 m!584129))

(declare-fun m!584131 () Bool)

(assert (=> b!607383 m!584131))

(assert (=> b!607383 m!584129))

(declare-fun m!584133 () Bool)

(assert (=> b!607383 m!584133))

(assert (=> b!607383 m!584129))

(declare-fun m!584135 () Bool)

(assert (=> b!607383 m!584135))

(declare-fun m!584137 () Bool)

(assert (=> b!607395 m!584137))

(assert (=> b!607386 m!584129))

(assert (=> b!607386 m!584129))

(declare-fun m!584139 () Bool)

(assert (=> b!607386 m!584139))

(assert (=> b!607403 m!584129))

(assert (=> b!607403 m!584129))

(declare-fun m!584141 () Bool)

(assert (=> b!607403 m!584141))

(declare-fun m!584143 () Bool)

(assert (=> b!607400 m!584143))

(assert (=> b!607400 m!584129))

(assert (=> b!607400 m!584129))

(declare-fun m!584145 () Bool)

(assert (=> b!607400 m!584145))

(declare-fun m!584147 () Bool)

(assert (=> b!607391 m!584147))

(declare-fun m!584149 () Bool)

(assert (=> start!55548 m!584149))

(declare-fun m!584151 () Bool)

(assert (=> start!55548 m!584151))

(declare-fun m!584153 () Bool)

(assert (=> b!607381 m!584153))

(declare-fun m!584155 () Bool)

(assert (=> b!607398 m!584155))

(declare-fun m!584157 () Bool)

(assert (=> b!607397 m!584157))

(assert (=> b!607401 m!584129))

(assert (=> b!607401 m!584123))

(declare-fun m!584159 () Bool)

(assert (=> b!607401 m!584159))

(assert (=> b!607396 m!584129))

(declare-fun m!584161 () Bool)

(assert (=> b!607390 m!584161))

(declare-fun m!584163 () Bool)

(assert (=> b!607399 m!584163))

(assert (=> b!607379 m!584129))

(assert (=> b!607379 m!584129))

(declare-fun m!584165 () Bool)

(assert (=> b!607379 m!584165))

(declare-fun m!584167 () Bool)

(assert (=> b!607379 m!584167))

(declare-fun m!584169 () Bool)

(assert (=> b!607379 m!584169))

(declare-fun m!584171 () Bool)

(assert (=> b!607379 m!584171))

(assert (=> b!607379 m!584129))

(declare-fun m!584173 () Bool)

(assert (=> b!607379 m!584173))

(assert (=> b!607379 m!584129))

(declare-fun m!584175 () Bool)

(assert (=> b!607379 m!584175))

(declare-fun m!584177 () Bool)

(assert (=> b!607379 m!584177))

(assert (=> b!607378 m!584129))

(assert (=> b!607378 m!584129))

(assert (=> b!607378 m!584139))

(declare-fun m!584179 () Bool)

(assert (=> b!607384 m!584179))

(assert (=> b!607389 m!584129))

(assert (=> b!607389 m!584129))

(assert (=> b!607389 m!584135))

(assert (=> b!607394 m!584129))

(assert (=> b!607394 m!584123))

(declare-fun m!584181 () Bool)

(assert (=> b!607394 m!584181))

(declare-fun m!584183 () Bool)

(assert (=> b!607394 m!584183))

(assert (=> b!607394 m!584129))

(declare-fun m!584185 () Bool)

(assert (=> b!607394 m!584185))

(declare-fun m!584187 () Bool)

(assert (=> b!607394 m!584187))

(declare-fun m!584189 () Bool)

(assert (=> b!607394 m!584189))

(declare-fun m!584191 () Bool)

(assert (=> b!607394 m!584191))

(declare-fun m!584193 () Bool)

(assert (=> b!607380 m!584193))

(check-sat (not b!607403) (not b!607391) (not b!607378) (not b!607397) (not b!607380) (not b!607377) (not b!607383) (not b!607395) (not b!607398) (not b!607381) (not b!607389) (not b!607386) (not start!55548) (not b!607394) (not b!607379) (not b!607400) (not b!607399) (not b!607390))
(check-sat)
