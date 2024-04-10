; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57710 () Bool)

(assert start!57710)

(declare-fun b!638224 () Bool)

(declare-fun res!413080 () Bool)

(declare-fun e!365193 () Bool)

(assert (=> b!638224 (=> (not res!413080) (not e!365193))))

(declare-datatypes ((array!38281 0))(
  ( (array!38282 (arr!18363 (Array (_ BitVec 32) (_ BitVec 64))) (size!18727 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38281)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38281 (_ BitVec 32)) Bool)

(assert (=> b!638224 (= res!413080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!638225 () Bool)

(declare-fun e!365191 () Bool)

(assert (=> b!638225 (= e!365191 e!365193)))

(declare-fun res!413082 () Bool)

(assert (=> b!638225 (=> (not res!413082) (not e!365193))))

(declare-datatypes ((SeekEntryResult!6803 0))(
  ( (MissingZero!6803 (index!29526 (_ BitVec 32))) (Found!6803 (index!29527 (_ BitVec 32))) (Intermediate!6803 (undefined!7615 Bool) (index!29528 (_ BitVec 32)) (x!58285 (_ BitVec 32))) (Undefined!6803) (MissingVacant!6803 (index!29529 (_ BitVec 32))) )
))
(declare-fun lt!295140 () SeekEntryResult!6803)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!638225 (= res!413082 (or (= lt!295140 (MissingZero!6803 i!1108)) (= lt!295140 (MissingVacant!6803 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38281 (_ BitVec 32)) SeekEntryResult!6803)

(assert (=> b!638225 (= lt!295140 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!638226 () Bool)

(declare-fun e!365192 () Bool)

(declare-fun e!365197 () Bool)

(assert (=> b!638226 (= e!365192 e!365197)))

(declare-fun res!413075 () Bool)

(assert (=> b!638226 (=> res!413075 e!365197)))

(declare-fun lt!295138 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!295137 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!638226 (= res!413075 (or (not (= (select (arr!18363 a!2986) j!136) lt!295138)) (not (= (select (arr!18363 a!2986) j!136) lt!295137)) (bvsge j!136 index!984)))))

(declare-fun b!638227 () Bool)

(declare-fun e!365190 () Bool)

(declare-fun e!365202 () Bool)

(assert (=> b!638227 (= e!365190 e!365202)))

(declare-fun res!413066 () Bool)

(assert (=> b!638227 (=> res!413066 e!365202)))

(assert (=> b!638227 (= res!413066 (or (not (= (select (arr!18363 a!2986) j!136) lt!295138)) (not (= (select (arr!18363 a!2986) j!136) lt!295137)) (bvsge j!136 index!984)))))

(assert (=> b!638227 e!365192))

(declare-fun res!413071 () Bool)

(assert (=> b!638227 (=> (not res!413071) (not e!365192))))

(assert (=> b!638227 (= res!413071 (= lt!295137 (select (arr!18363 a!2986) j!136)))))

(assert (=> b!638227 (= lt!295137 (select (store (arr!18363 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!638228 () Bool)

(declare-fun res!413077 () Bool)

(assert (=> b!638228 (=> (not res!413077) (not e!365191))))

(assert (=> b!638228 (= res!413077 (and (= (size!18727 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18727 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18727 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!638229 () Bool)

(declare-fun res!413078 () Bool)

(declare-fun e!365196 () Bool)

(assert (=> b!638229 (=> res!413078 e!365196)))

(declare-datatypes ((List!12404 0))(
  ( (Nil!12401) (Cons!12400 (h!13445 (_ BitVec 64)) (t!18632 List!12404)) )
))
(declare-fun contains!3118 (List!12404 (_ BitVec 64)) Bool)

(assert (=> b!638229 (= res!413078 (contains!3118 Nil!12401 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!638230 () Bool)

(declare-fun e!365194 () Bool)

(assert (=> b!638230 (= e!365194 (not e!365190))))

(declare-fun res!413079 () Bool)

(assert (=> b!638230 (=> res!413079 e!365190)))

(declare-fun lt!295142 () SeekEntryResult!6803)

(assert (=> b!638230 (= res!413079 (not (= lt!295142 (Found!6803 index!984))))))

(declare-datatypes ((Unit!21546 0))(
  ( (Unit!21547) )
))
(declare-fun lt!295135 () Unit!21546)

(declare-fun e!365198 () Unit!21546)

(assert (=> b!638230 (= lt!295135 e!365198)))

(declare-fun c!72947 () Bool)

(assert (=> b!638230 (= c!72947 (= lt!295142 Undefined!6803))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!295136 () array!38281)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38281 (_ BitVec 32)) SeekEntryResult!6803)

(assert (=> b!638230 (= lt!295142 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295138 lt!295136 mask!3053))))

(declare-fun e!365201 () Bool)

(assert (=> b!638230 e!365201))

(declare-fun res!413081 () Bool)

(assert (=> b!638230 (=> (not res!413081) (not e!365201))))

(declare-fun lt!295134 () SeekEntryResult!6803)

(declare-fun lt!295144 () (_ BitVec 32))

(assert (=> b!638230 (= res!413081 (= lt!295134 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295144 vacantSpotIndex!68 lt!295138 lt!295136 mask!3053)))))

(assert (=> b!638230 (= lt!295134 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295144 vacantSpotIndex!68 (select (arr!18363 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!638230 (= lt!295138 (select (store (arr!18363 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!295143 () Unit!21546)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38281 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21546)

(assert (=> b!638230 (= lt!295143 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295144 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!638230 (= lt!295144 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!638231 () Bool)

(declare-fun res!413065 () Bool)

(assert (=> b!638231 (=> res!413065 e!365196)))

(declare-fun noDuplicate!396 (List!12404) Bool)

(assert (=> b!638231 (= res!413065 (not (noDuplicate!396 Nil!12401)))))

(declare-fun b!638232 () Bool)

(assert (=> b!638232 (= e!365202 e!365196)))

(declare-fun res!413076 () Bool)

(assert (=> b!638232 (=> res!413076 e!365196)))

(assert (=> b!638232 (= res!413076 (or (bvsge (size!18727 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18727 a!2986))))))

(declare-fun arrayContainsKey!0 (array!38281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!638232 (arrayContainsKey!0 lt!295136 (select (arr!18363 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295141 () Unit!21546)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38281 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21546)

(assert (=> b!638232 (= lt!295141 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295136 (select (arr!18363 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!638233 () Bool)

(declare-fun res!413069 () Bool)

(assert (=> b!638233 (=> res!413069 e!365196)))

(assert (=> b!638233 (= res!413069 (contains!3118 Nil!12401 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!638234 () Bool)

(assert (=> b!638234 (= e!365196 true)))

(declare-fun lt!295133 () Bool)

(assert (=> b!638234 (= lt!295133 (contains!3118 Nil!12401 k!1786))))

(declare-fun b!638235 () Bool)

(declare-fun res!413064 () Bool)

(assert (=> b!638235 (=> (not res!413064) (not e!365191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!638235 (= res!413064 (validKeyInArray!0 k!1786))))

(declare-fun b!638236 () Bool)

(declare-fun res!413074 () Bool)

(assert (=> b!638236 (=> (not res!413074) (not e!365191))))

(assert (=> b!638236 (= res!413074 (validKeyInArray!0 (select (arr!18363 a!2986) j!136)))))

(declare-fun b!638237 () Bool)

(declare-fun res!413083 () Bool)

(assert (=> b!638237 (=> (not res!413083) (not e!365193))))

(declare-fun arrayNoDuplicates!0 (array!38281 (_ BitVec 32) List!12404) Bool)

(assert (=> b!638237 (= res!413083 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12401))))

(declare-fun b!638238 () Bool)

(declare-fun lt!295139 () SeekEntryResult!6803)

(assert (=> b!638238 (= e!365201 (= lt!295139 lt!295134))))

(declare-fun b!638239 () Bool)

(declare-fun e!365199 () Bool)

(assert (=> b!638239 (= e!365197 e!365199)))

(declare-fun res!413072 () Bool)

(assert (=> b!638239 (=> (not res!413072) (not e!365199))))

(assert (=> b!638239 (= res!413072 (arrayContainsKey!0 lt!295136 (select (arr!18363 a!2986) j!136) j!136))))

(declare-fun b!638240 () Bool)

(declare-fun e!365200 () Bool)

(assert (=> b!638240 (= e!365200 e!365194)))

(declare-fun res!413068 () Bool)

(assert (=> b!638240 (=> (not res!413068) (not e!365194))))

(assert (=> b!638240 (= res!413068 (and (= lt!295139 (Found!6803 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18363 a!2986) index!984) (select (arr!18363 a!2986) j!136))) (not (= (select (arr!18363 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!638240 (= lt!295139 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18363 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!638241 () Bool)

(declare-fun Unit!21548 () Unit!21546)

(assert (=> b!638241 (= e!365198 Unit!21548)))

(assert (=> b!638241 false))

(declare-fun res!413084 () Bool)

(assert (=> start!57710 (=> (not res!413084) (not e!365191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57710 (= res!413084 (validMask!0 mask!3053))))

(assert (=> start!57710 e!365191))

(assert (=> start!57710 true))

(declare-fun array_inv!14159 (array!38281) Bool)

(assert (=> start!57710 (array_inv!14159 a!2986)))

(declare-fun b!638242 () Bool)

(assert (=> b!638242 (= e!365199 (arrayContainsKey!0 lt!295136 (select (arr!18363 a!2986) j!136) index!984))))

(declare-fun b!638243 () Bool)

(declare-fun res!413067 () Bool)

(assert (=> b!638243 (=> (not res!413067) (not e!365191))))

(assert (=> b!638243 (= res!413067 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!638244 () Bool)

(declare-fun res!413073 () Bool)

(assert (=> b!638244 (=> (not res!413073) (not e!365193))))

(assert (=> b!638244 (= res!413073 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18363 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!638245 () Bool)

(declare-fun Unit!21549 () Unit!21546)

(assert (=> b!638245 (= e!365198 Unit!21549)))

(declare-fun b!638246 () Bool)

(assert (=> b!638246 (= e!365193 e!365200)))

(declare-fun res!413070 () Bool)

(assert (=> b!638246 (=> (not res!413070) (not e!365200))))

(assert (=> b!638246 (= res!413070 (= (select (store (arr!18363 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638246 (= lt!295136 (array!38282 (store (arr!18363 a!2986) i!1108 k!1786) (size!18727 a!2986)))))

(assert (= (and start!57710 res!413084) b!638228))

(assert (= (and b!638228 res!413077) b!638236))

(assert (= (and b!638236 res!413074) b!638235))

(assert (= (and b!638235 res!413064) b!638243))

(assert (= (and b!638243 res!413067) b!638225))

(assert (= (and b!638225 res!413082) b!638224))

(assert (= (and b!638224 res!413080) b!638237))

(assert (= (and b!638237 res!413083) b!638244))

(assert (= (and b!638244 res!413073) b!638246))

(assert (= (and b!638246 res!413070) b!638240))

(assert (= (and b!638240 res!413068) b!638230))

(assert (= (and b!638230 res!413081) b!638238))

(assert (= (and b!638230 c!72947) b!638241))

(assert (= (and b!638230 (not c!72947)) b!638245))

(assert (= (and b!638230 (not res!413079)) b!638227))

(assert (= (and b!638227 res!413071) b!638226))

(assert (= (and b!638226 (not res!413075)) b!638239))

(assert (= (and b!638239 res!413072) b!638242))

(assert (= (and b!638227 (not res!413066)) b!638232))

(assert (= (and b!638232 (not res!413076)) b!638231))

(assert (= (and b!638231 (not res!413065)) b!638233))

(assert (= (and b!638233 (not res!413069)) b!638229))

(assert (= (and b!638229 (not res!413078)) b!638234))

(declare-fun m!612179 () Bool)

(assert (=> b!638235 m!612179))

(declare-fun m!612181 () Bool)

(assert (=> b!638232 m!612181))

(assert (=> b!638232 m!612181))

(declare-fun m!612183 () Bool)

(assert (=> b!638232 m!612183))

(assert (=> b!638232 m!612181))

(declare-fun m!612185 () Bool)

(assert (=> b!638232 m!612185))

(declare-fun m!612187 () Bool)

(assert (=> b!638246 m!612187))

(declare-fun m!612189 () Bool)

(assert (=> b!638246 m!612189))

(declare-fun m!612191 () Bool)

(assert (=> b!638237 m!612191))

(declare-fun m!612193 () Bool)

(assert (=> b!638240 m!612193))

(assert (=> b!638240 m!612181))

(assert (=> b!638240 m!612181))

(declare-fun m!612195 () Bool)

(assert (=> b!638240 m!612195))

(assert (=> b!638236 m!612181))

(assert (=> b!638236 m!612181))

(declare-fun m!612197 () Bool)

(assert (=> b!638236 m!612197))

(declare-fun m!612199 () Bool)

(assert (=> b!638224 m!612199))

(assert (=> b!638227 m!612181))

(assert (=> b!638227 m!612187))

(declare-fun m!612201 () Bool)

(assert (=> b!638227 m!612201))

(declare-fun m!612203 () Bool)

(assert (=> b!638233 m!612203))

(declare-fun m!612205 () Bool)

(assert (=> b!638225 m!612205))

(assert (=> b!638226 m!612181))

(assert (=> b!638239 m!612181))

(assert (=> b!638239 m!612181))

(declare-fun m!612207 () Bool)

(assert (=> b!638239 m!612207))

(declare-fun m!612209 () Bool)

(assert (=> b!638244 m!612209))

(declare-fun m!612211 () Bool)

(assert (=> start!57710 m!612211))

(declare-fun m!612213 () Bool)

(assert (=> start!57710 m!612213))

(declare-fun m!612215 () Bool)

(assert (=> b!638243 m!612215))

(declare-fun m!612217 () Bool)

(assert (=> b!638234 m!612217))

(declare-fun m!612219 () Bool)

(assert (=> b!638229 m!612219))

(declare-fun m!612221 () Bool)

(assert (=> b!638230 m!612221))

(declare-fun m!612223 () Bool)

(assert (=> b!638230 m!612223))

(assert (=> b!638230 m!612187))

(assert (=> b!638230 m!612181))

(declare-fun m!612225 () Bool)

(assert (=> b!638230 m!612225))

(declare-fun m!612227 () Bool)

(assert (=> b!638230 m!612227))

(declare-fun m!612229 () Bool)

(assert (=> b!638230 m!612229))

(assert (=> b!638230 m!612181))

(declare-fun m!612231 () Bool)

(assert (=> b!638230 m!612231))

(declare-fun m!612233 () Bool)

(assert (=> b!638231 m!612233))

(assert (=> b!638242 m!612181))

(assert (=> b!638242 m!612181))

(declare-fun m!612235 () Bool)

(assert (=> b!638242 m!612235))

(push 1)

