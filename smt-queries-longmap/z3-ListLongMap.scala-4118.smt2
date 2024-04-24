; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56256 () Bool)

(assert start!56256)

(declare-fun b!623138 () Bool)

(declare-fun res!401569 () Bool)

(declare-fun e!357436 () Bool)

(assert (=> b!623138 (=> (not res!401569) (not e!357436))))

(declare-datatypes ((array!37671 0))(
  ( (array!37672 (arr!18079 (Array (_ BitVec 32) (_ BitVec 64))) (size!18443 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37671)

(declare-datatypes ((List!12027 0))(
  ( (Nil!12024) (Cons!12023 (h!13071 (_ BitVec 64)) (t!18247 List!12027)) )
))
(declare-fun arrayNoDuplicates!0 (array!37671 (_ BitVec 32) List!12027) Bool)

(assert (=> b!623138 (= res!401569 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12024))))

(declare-fun b!623139 () Bool)

(declare-fun res!401567 () Bool)

(declare-fun e!357434 () Bool)

(assert (=> b!623139 (=> (not res!401567) (not e!357434))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!623139 (= res!401567 (validKeyInArray!0 (select (arr!18079 a!2986) j!136)))))

(declare-fun b!623140 () Bool)

(declare-fun lt!288916 () array!37671)

(declare-fun e!357438 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!623140 (= e!357438 (arrayContainsKey!0 lt!288916 (select (arr!18079 a!2986) j!136) index!984))))

(declare-fun b!623141 () Bool)

(declare-fun res!401577 () Bool)

(assert (=> b!623141 (=> (not res!401577) (not e!357434))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!623141 (= res!401577 (and (= (size!18443 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18443 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18443 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!623142 () Bool)

(declare-fun e!357430 () Bool)

(assert (=> b!623142 (= e!357430 (not true))))

(declare-datatypes ((Unit!20947 0))(
  ( (Unit!20948) )
))
(declare-fun lt!288912 () Unit!20947)

(declare-fun e!357435 () Unit!20947)

(assert (=> b!623142 (= lt!288912 e!357435)))

(declare-fun c!71158 () Bool)

(declare-datatypes ((SeekEntryResult!6475 0))(
  ( (MissingZero!6475 (index!28184 (_ BitVec 32))) (Found!6475 (index!28185 (_ BitVec 32))) (Intermediate!6475 (undefined!7287 Bool) (index!28186 (_ BitVec 32)) (x!57102 (_ BitVec 32))) (Undefined!6475) (MissingVacant!6475 (index!28187 (_ BitVec 32))) )
))
(declare-fun lt!288910 () SeekEntryResult!6475)

(assert (=> b!623142 (= c!71158 (= lt!288910 (Found!6475 index!984)))))

(declare-fun lt!288905 () Unit!20947)

(declare-fun e!357431 () Unit!20947)

(assert (=> b!623142 (= lt!288905 e!357431)))

(declare-fun c!71156 () Bool)

(assert (=> b!623142 (= c!71156 (= lt!288910 Undefined!6475))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!288906 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37671 (_ BitVec 32)) SeekEntryResult!6475)

(assert (=> b!623142 (= lt!288910 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288906 lt!288916 mask!3053))))

(declare-fun e!357428 () Bool)

(assert (=> b!623142 e!357428))

(declare-fun res!401576 () Bool)

(assert (=> b!623142 (=> (not res!401576) (not e!357428))))

(declare-fun lt!288918 () (_ BitVec 32))

(declare-fun lt!288907 () SeekEntryResult!6475)

(assert (=> b!623142 (= res!401576 (= lt!288907 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288918 vacantSpotIndex!68 lt!288906 lt!288916 mask!3053)))))

(assert (=> b!623142 (= lt!288907 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288918 vacantSpotIndex!68 (select (arr!18079 a!2986) j!136) a!2986 mask!3053))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!623142 (= lt!288906 (select (store (arr!18079 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!288913 () Unit!20947)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37671 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20947)

(assert (=> b!623142 (= lt!288913 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288918 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!623142 (= lt!288918 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!623143 () Bool)

(declare-fun Unit!20949 () Unit!20947)

(assert (=> b!623143 (= e!357435 Unit!20949)))

(declare-fun b!623145 () Bool)

(declare-fun e!357439 () Bool)

(assert (=> b!623145 (= e!357436 e!357439)))

(declare-fun res!401565 () Bool)

(assert (=> b!623145 (=> (not res!401565) (not e!357439))))

(assert (=> b!623145 (= res!401565 (= (select (store (arr!18079 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!623145 (= lt!288916 (array!37672 (store (arr!18079 a!2986) i!1108 k0!1786) (size!18443 a!2986)))))

(declare-fun b!623146 () Bool)

(declare-fun Unit!20950 () Unit!20947)

(assert (=> b!623146 (= e!357435 Unit!20950)))

(declare-fun res!401564 () Bool)

(assert (=> b!623146 (= res!401564 (= (select (store (arr!18079 a!2986) i!1108 k0!1786) index!984) (select (arr!18079 a!2986) j!136)))))

(declare-fun e!357432 () Bool)

(assert (=> b!623146 (=> (not res!401564) (not e!357432))))

(assert (=> b!623146 e!357432))

(declare-fun c!71159 () Bool)

(assert (=> b!623146 (= c!71159 (bvslt j!136 index!984))))

(declare-fun lt!288915 () Unit!20947)

(declare-fun e!357429 () Unit!20947)

(assert (=> b!623146 (= lt!288915 e!357429)))

(declare-fun c!71157 () Bool)

(assert (=> b!623146 (= c!71157 (bvslt index!984 j!136))))

(declare-fun lt!288902 () Unit!20947)

(declare-fun e!357437 () Unit!20947)

(assert (=> b!623146 (= lt!288902 e!357437)))

(assert (=> b!623146 false))

(declare-fun res!401563 () Bool)

(declare-fun b!623147 () Bool)

(assert (=> b!623147 (= res!401563 (arrayContainsKey!0 lt!288916 (select (arr!18079 a!2986) j!136) j!136))))

(declare-fun e!357433 () Bool)

(assert (=> b!623147 (=> (not res!401563) (not e!357433))))

(declare-fun e!357440 () Bool)

(assert (=> b!623147 (= e!357440 e!357433)))

(declare-fun b!623148 () Bool)

(declare-fun Unit!20951 () Unit!20947)

(assert (=> b!623148 (= e!357431 Unit!20951)))

(declare-fun b!623149 () Bool)

(declare-fun Unit!20952 () Unit!20947)

(assert (=> b!623149 (= e!357429 Unit!20952)))

(declare-fun b!623150 () Bool)

(declare-fun res!401568 () Bool)

(assert (=> b!623150 (=> (not res!401568) (not e!357434))))

(assert (=> b!623150 (= res!401568 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!623151 () Bool)

(declare-fun Unit!20953 () Unit!20947)

(assert (=> b!623151 (= e!357431 Unit!20953)))

(assert (=> b!623151 false))

(declare-fun b!623152 () Bool)

(assert (=> b!623152 (= e!357434 e!357436)))

(declare-fun res!401573 () Bool)

(assert (=> b!623152 (=> (not res!401573) (not e!357436))))

(declare-fun lt!288914 () SeekEntryResult!6475)

(assert (=> b!623152 (= res!401573 (or (= lt!288914 (MissingZero!6475 i!1108)) (= lt!288914 (MissingVacant!6475 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37671 (_ BitVec 32)) SeekEntryResult!6475)

(assert (=> b!623152 (= lt!288914 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!623153 () Bool)

(declare-fun Unit!20954 () Unit!20947)

(assert (=> b!623153 (= e!357437 Unit!20954)))

(declare-fun b!623154 () Bool)

(declare-fun res!401571 () Bool)

(assert (=> b!623154 (= res!401571 (bvsge j!136 index!984))))

(assert (=> b!623154 (=> res!401571 e!357440)))

(assert (=> b!623154 (= e!357432 e!357440)))

(declare-fun b!623155 () Bool)

(declare-fun res!401578 () Bool)

(assert (=> b!623155 (=> (not res!401578) (not e!357434))))

(assert (=> b!623155 (= res!401578 (validKeyInArray!0 k0!1786))))

(declare-fun b!623156 () Bool)

(declare-fun res!401574 () Bool)

(assert (=> b!623156 (=> (not res!401574) (not e!357436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37671 (_ BitVec 32)) Bool)

(assert (=> b!623156 (= res!401574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!623157 () Bool)

(assert (=> b!623157 (= e!357433 (arrayContainsKey!0 lt!288916 (select (arr!18079 a!2986) j!136) index!984))))

(declare-fun b!623158 () Bool)

(assert (=> b!623158 false))

(declare-fun lt!288909 () Unit!20947)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37671 (_ BitVec 64) (_ BitVec 32) List!12027) Unit!20947)

(assert (=> b!623158 (= lt!288909 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288916 (select (arr!18079 a!2986) j!136) j!136 Nil!12024))))

(assert (=> b!623158 (arrayNoDuplicates!0 lt!288916 j!136 Nil!12024)))

(declare-fun lt!288904 () Unit!20947)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37671 (_ BitVec 32) (_ BitVec 32)) Unit!20947)

(assert (=> b!623158 (= lt!288904 (lemmaNoDuplicateFromThenFromBigger!0 lt!288916 #b00000000000000000000000000000000 j!136))))

(assert (=> b!623158 (arrayNoDuplicates!0 lt!288916 #b00000000000000000000000000000000 Nil!12024)))

(declare-fun lt!288903 () Unit!20947)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37671 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12027) Unit!20947)

(assert (=> b!623158 (= lt!288903 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12024))))

(assert (=> b!623158 (arrayContainsKey!0 lt!288916 (select (arr!18079 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288900 () Unit!20947)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37671 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20947)

(assert (=> b!623158 (= lt!288900 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288916 (select (arr!18079 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20955 () Unit!20947)

(assert (=> b!623158 (= e!357429 Unit!20955)))

(declare-fun res!401572 () Bool)

(assert (=> start!56256 (=> (not res!401572) (not e!357434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56256 (= res!401572 (validMask!0 mask!3053))))

(assert (=> start!56256 e!357434))

(assert (=> start!56256 true))

(declare-fun array_inv!13938 (array!37671) Bool)

(assert (=> start!56256 (array_inv!13938 a!2986)))

(declare-fun b!623144 () Bool)

(assert (=> b!623144 (= e!357439 e!357430)))

(declare-fun res!401570 () Bool)

(assert (=> b!623144 (=> (not res!401570) (not e!357430))))

(declare-fun lt!288908 () SeekEntryResult!6475)

(assert (=> b!623144 (= res!401570 (and (= lt!288908 (Found!6475 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18079 a!2986) index!984) (select (arr!18079 a!2986) j!136))) (not (= (select (arr!18079 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!623144 (= lt!288908 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18079 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!623159 () Bool)

(assert (=> b!623159 (= e!357428 (= lt!288908 lt!288907))))

(declare-fun b!623160 () Bool)

(declare-fun res!401566 () Bool)

(assert (=> b!623160 (=> (not res!401566) (not e!357436))))

(assert (=> b!623160 (= res!401566 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18079 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!623161 () Bool)

(assert (=> b!623161 false))

(declare-fun lt!288917 () Unit!20947)

(assert (=> b!623161 (= lt!288917 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288916 (select (arr!18079 a!2986) j!136) index!984 Nil!12024))))

(assert (=> b!623161 (arrayNoDuplicates!0 lt!288916 index!984 Nil!12024)))

(declare-fun lt!288919 () Unit!20947)

(assert (=> b!623161 (= lt!288919 (lemmaNoDuplicateFromThenFromBigger!0 lt!288916 #b00000000000000000000000000000000 index!984))))

(assert (=> b!623161 (arrayNoDuplicates!0 lt!288916 #b00000000000000000000000000000000 Nil!12024)))

(declare-fun lt!288911 () Unit!20947)

(assert (=> b!623161 (= lt!288911 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12024))))

(assert (=> b!623161 (arrayContainsKey!0 lt!288916 (select (arr!18079 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288901 () Unit!20947)

(assert (=> b!623161 (= lt!288901 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288916 (select (arr!18079 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!623161 e!357438))

(declare-fun res!401575 () Bool)

(assert (=> b!623161 (=> (not res!401575) (not e!357438))))

(assert (=> b!623161 (= res!401575 (arrayContainsKey!0 lt!288916 (select (arr!18079 a!2986) j!136) j!136))))

(declare-fun Unit!20956 () Unit!20947)

(assert (=> b!623161 (= e!357437 Unit!20956)))

(assert (= (and start!56256 res!401572) b!623141))

(assert (= (and b!623141 res!401577) b!623139))

(assert (= (and b!623139 res!401567) b!623155))

(assert (= (and b!623155 res!401578) b!623150))

(assert (= (and b!623150 res!401568) b!623152))

(assert (= (and b!623152 res!401573) b!623156))

(assert (= (and b!623156 res!401574) b!623138))

(assert (= (and b!623138 res!401569) b!623160))

(assert (= (and b!623160 res!401566) b!623145))

(assert (= (and b!623145 res!401565) b!623144))

(assert (= (and b!623144 res!401570) b!623142))

(assert (= (and b!623142 res!401576) b!623159))

(assert (= (and b!623142 c!71156) b!623151))

(assert (= (and b!623142 (not c!71156)) b!623148))

(assert (= (and b!623142 c!71158) b!623146))

(assert (= (and b!623142 (not c!71158)) b!623143))

(assert (= (and b!623146 res!401564) b!623154))

(assert (= (and b!623154 (not res!401571)) b!623147))

(assert (= (and b!623147 res!401563) b!623157))

(assert (= (and b!623146 c!71159) b!623158))

(assert (= (and b!623146 (not c!71159)) b!623149))

(assert (= (and b!623146 c!71157) b!623161))

(assert (= (and b!623146 (not c!71157)) b!623153))

(assert (= (and b!623161 res!401575) b!623140))

(declare-fun m!599267 () Bool)

(assert (=> b!623140 m!599267))

(assert (=> b!623140 m!599267))

(declare-fun m!599269 () Bool)

(assert (=> b!623140 m!599269))

(assert (=> b!623147 m!599267))

(assert (=> b!623147 m!599267))

(declare-fun m!599271 () Bool)

(assert (=> b!623147 m!599271))

(declare-fun m!599273 () Bool)

(assert (=> b!623144 m!599273))

(assert (=> b!623144 m!599267))

(assert (=> b!623144 m!599267))

(declare-fun m!599275 () Bool)

(assert (=> b!623144 m!599275))

(assert (=> b!623139 m!599267))

(assert (=> b!623139 m!599267))

(declare-fun m!599277 () Bool)

(assert (=> b!623139 m!599277))

(declare-fun m!599279 () Bool)

(assert (=> b!623138 m!599279))

(assert (=> b!623157 m!599267))

(assert (=> b!623157 m!599267))

(assert (=> b!623157 m!599269))

(declare-fun m!599281 () Bool)

(assert (=> b!623156 m!599281))

(assert (=> b!623158 m!599267))

(declare-fun m!599283 () Bool)

(assert (=> b!623158 m!599283))

(assert (=> b!623158 m!599267))

(declare-fun m!599285 () Bool)

(assert (=> b!623158 m!599285))

(assert (=> b!623158 m!599267))

(declare-fun m!599287 () Bool)

(assert (=> b!623158 m!599287))

(declare-fun m!599289 () Bool)

(assert (=> b!623158 m!599289))

(declare-fun m!599291 () Bool)

(assert (=> b!623158 m!599291))

(declare-fun m!599293 () Bool)

(assert (=> b!623158 m!599293))

(assert (=> b!623158 m!599267))

(declare-fun m!599295 () Bool)

(assert (=> b!623158 m!599295))

(declare-fun m!599297 () Bool)

(assert (=> b!623161 m!599297))

(assert (=> b!623161 m!599283))

(assert (=> b!623161 m!599267))

(declare-fun m!599299 () Bool)

(assert (=> b!623161 m!599299))

(declare-fun m!599301 () Bool)

(assert (=> b!623161 m!599301))

(assert (=> b!623161 m!599267))

(declare-fun m!599303 () Bool)

(assert (=> b!623161 m!599303))

(assert (=> b!623161 m!599267))

(assert (=> b!623161 m!599267))

(assert (=> b!623161 m!599271))

(assert (=> b!623161 m!599267))

(declare-fun m!599305 () Bool)

(assert (=> b!623161 m!599305))

(assert (=> b!623161 m!599291))

(declare-fun m!599307 () Bool)

(assert (=> start!56256 m!599307))

(declare-fun m!599309 () Bool)

(assert (=> start!56256 m!599309))

(declare-fun m!599311 () Bool)

(assert (=> b!623160 m!599311))

(declare-fun m!599313 () Bool)

(assert (=> b!623152 m!599313))

(declare-fun m!599315 () Bool)

(assert (=> b!623146 m!599315))

(declare-fun m!599317 () Bool)

(assert (=> b!623146 m!599317))

(assert (=> b!623146 m!599267))

(declare-fun m!599319 () Bool)

(assert (=> b!623155 m!599319))

(declare-fun m!599321 () Bool)

(assert (=> b!623142 m!599321))

(declare-fun m!599323 () Bool)

(assert (=> b!623142 m!599323))

(assert (=> b!623142 m!599267))

(declare-fun m!599325 () Bool)

(assert (=> b!623142 m!599325))

(assert (=> b!623142 m!599267))

(assert (=> b!623142 m!599315))

(declare-fun m!599327 () Bool)

(assert (=> b!623142 m!599327))

(declare-fun m!599329 () Bool)

(assert (=> b!623142 m!599329))

(declare-fun m!599331 () Bool)

(assert (=> b!623142 m!599331))

(assert (=> b!623145 m!599315))

(declare-fun m!599333 () Bool)

(assert (=> b!623145 m!599333))

(declare-fun m!599335 () Bool)

(assert (=> b!623150 m!599335))

(check-sat (not b!623156) (not b!623139) (not b!623142) (not start!56256) (not b!623155) (not b!623144) (not b!623152) (not b!623150) (not b!623147) (not b!623158) (not b!623157) (not b!623140) (not b!623161) (not b!623138))
(check-sat)
