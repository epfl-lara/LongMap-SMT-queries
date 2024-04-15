; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55128 () Bool)

(assert start!55128)

(declare-fun b!603897 () Bool)

(declare-fun e!345505 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!603897 (= e!345505 (bvsge (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37215 0))(
  ( (array!37216 (arr!17864 (Array (_ BitVec 32) (_ BitVec 64))) (size!18229 (_ BitVec 32))) )
))
(declare-fun lt!275250 () array!37215)

(declare-fun a!2986 () array!37215)

(declare-fun arrayContainsKey!0 (array!37215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!603897 (arrayContainsKey!0 lt!275250 (select (arr!17864 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-datatypes ((Unit!19188 0))(
  ( (Unit!19189) )
))
(declare-fun lt!275242 () Unit!19188)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37215 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19188)

(assert (=> b!603897 (= lt!275242 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275250 (select (arr!17864 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!345516 () Bool)

(assert (=> b!603897 e!345516))

(declare-fun res!388016 () Bool)

(assert (=> b!603897 (=> (not res!388016) (not e!345516))))

(assert (=> b!603897 (= res!388016 (arrayContainsKey!0 lt!275250 (select (arr!17864 a!2986) j!136) j!136))))

(declare-fun b!603898 () Bool)

(declare-fun e!345507 () Bool)

(assert (=> b!603898 (= e!345507 e!345505)))

(declare-fun res!388018 () Bool)

(assert (=> b!603898 (=> res!388018 e!345505)))

(assert (=> b!603898 (= res!388018 (bvsge index!984 j!136))))

(declare-fun lt!275248 () Unit!19188)

(declare-fun e!345515 () Unit!19188)

(assert (=> b!603898 (= lt!275248 e!345515)))

(declare-fun c!68313 () Bool)

(assert (=> b!603898 (= c!68313 (bvslt j!136 index!984))))

(declare-fun b!603899 () Bool)

(declare-fun res!388008 () Bool)

(declare-fun e!345506 () Bool)

(assert (=> b!603899 (=> (not res!388008) (not e!345506))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603899 (= res!388008 (validKeyInArray!0 k0!1786))))

(declare-fun b!603900 () Bool)

(declare-fun e!345512 () Bool)

(declare-fun e!345511 () Bool)

(assert (=> b!603900 (= e!345512 e!345511)))

(declare-fun res!388022 () Bool)

(assert (=> b!603900 (=> (not res!388022) (not e!345511))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6301 0))(
  ( (MissingZero!6301 (index!27467 (_ BitVec 32))) (Found!6301 (index!27468 (_ BitVec 32))) (Intermediate!6301 (undefined!7113 Bool) (index!27469 (_ BitVec 32)) (x!56273 (_ BitVec 32))) (Undefined!6301) (MissingVacant!6301 (index!27470 (_ BitVec 32))) )
))
(declare-fun lt!275245 () SeekEntryResult!6301)

(assert (=> b!603900 (= res!388022 (and (= lt!275245 (Found!6301 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17864 a!2986) index!984) (select (arr!17864 a!2986) j!136))) (not (= (select (arr!17864 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37215 (_ BitVec 32)) SeekEntryResult!6301)

(assert (=> b!603900 (= lt!275245 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17864 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!388007 () Bool)

(assert (=> start!55128 (=> (not res!388007) (not e!345506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55128 (= res!388007 (validMask!0 mask!3053))))

(assert (=> start!55128 e!345506))

(assert (=> start!55128 true))

(declare-fun array_inv!13747 (array!37215) Bool)

(assert (=> start!55128 (array_inv!13747 a!2986)))

(declare-fun b!603901 () Bool)

(declare-fun Unit!19190 () Unit!19188)

(assert (=> b!603901 (= e!345515 Unit!19190)))

(declare-fun lt!275237 () Unit!19188)

(assert (=> b!603901 (= lt!275237 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275250 (select (arr!17864 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!603901 (arrayContainsKey!0 lt!275250 (select (arr!17864 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!275246 () Unit!19188)

(declare-datatypes ((List!11944 0))(
  ( (Nil!11941) (Cons!11940 (h!12985 (_ BitVec 64)) (t!18163 List!11944)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37215 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11944) Unit!19188)

(assert (=> b!603901 (= lt!275246 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11941))))

(declare-fun arrayNoDuplicates!0 (array!37215 (_ BitVec 32) List!11944) Bool)

(assert (=> b!603901 (arrayNoDuplicates!0 lt!275250 #b00000000000000000000000000000000 Nil!11941)))

(declare-fun lt!275239 () Unit!19188)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37215 (_ BitVec 32) (_ BitVec 32)) Unit!19188)

(assert (=> b!603901 (= lt!275239 (lemmaNoDuplicateFromThenFromBigger!0 lt!275250 #b00000000000000000000000000000000 j!136))))

(assert (=> b!603901 (arrayNoDuplicates!0 lt!275250 j!136 Nil!11941)))

(declare-fun lt!275244 () Unit!19188)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37215 (_ BitVec 64) (_ BitVec 32) List!11944) Unit!19188)

(assert (=> b!603901 (= lt!275244 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275250 (select (arr!17864 a!2986) j!136) j!136 Nil!11941))))

(assert (=> b!603901 false))

(declare-fun b!603902 () Bool)

(declare-fun e!345514 () Bool)

(assert (=> b!603902 (= e!345514 e!345512)))

(declare-fun res!388012 () Bool)

(assert (=> b!603902 (=> (not res!388012) (not e!345512))))

(assert (=> b!603902 (= res!388012 (= (select (store (arr!17864 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!603902 (= lt!275250 (array!37216 (store (arr!17864 a!2986) i!1108 k0!1786) (size!18229 a!2986)))))

(declare-fun b!603903 () Bool)

(declare-fun e!345502 () Unit!19188)

(declare-fun Unit!19191 () Unit!19188)

(assert (=> b!603903 (= e!345502 Unit!19191)))

(declare-fun b!603904 () Bool)

(declare-fun res!388021 () Bool)

(assert (=> b!603904 (=> (not res!388021) (not e!345506))))

(assert (=> b!603904 (= res!388021 (validKeyInArray!0 (select (arr!17864 a!2986) j!136)))))

(declare-fun b!603905 () Bool)

(declare-fun res!388014 () Bool)

(assert (=> b!603905 (=> (not res!388014) (not e!345506))))

(assert (=> b!603905 (= res!388014 (and (= (size!18229 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18229 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18229 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!603906 () Bool)

(declare-fun Unit!19192 () Unit!19188)

(assert (=> b!603906 (= e!345515 Unit!19192)))

(declare-fun b!603907 () Bool)

(assert (=> b!603907 (= e!345516 (arrayContainsKey!0 lt!275250 (select (arr!17864 a!2986) j!136) index!984))))

(declare-fun b!603908 () Bool)

(declare-fun e!345513 () Bool)

(assert (=> b!603908 (= e!345513 e!345507)))

(declare-fun res!388025 () Bool)

(assert (=> b!603908 (=> res!388025 e!345507)))

(declare-fun lt!275236 () (_ BitVec 64))

(declare-fun lt!275238 () (_ BitVec 64))

(assert (=> b!603908 (= res!388025 (or (not (= (select (arr!17864 a!2986) j!136) lt!275238)) (not (= (select (arr!17864 a!2986) j!136) lt!275236))))))

(declare-fun e!345508 () Bool)

(assert (=> b!603908 e!345508))

(declare-fun res!388024 () Bool)

(assert (=> b!603908 (=> (not res!388024) (not e!345508))))

(assert (=> b!603908 (= res!388024 (= lt!275236 (select (arr!17864 a!2986) j!136)))))

(assert (=> b!603908 (= lt!275236 (select (store (arr!17864 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!603909 () Bool)

(declare-fun e!345503 () Bool)

(assert (=> b!603909 (= e!345508 e!345503)))

(declare-fun res!388023 () Bool)

(assert (=> b!603909 (=> res!388023 e!345503)))

(assert (=> b!603909 (= res!388023 (or (not (= (select (arr!17864 a!2986) j!136) lt!275238)) (not (= (select (arr!17864 a!2986) j!136) lt!275236)) (bvsge j!136 index!984)))))

(declare-fun b!603910 () Bool)

(declare-fun e!345510 () Bool)

(assert (=> b!603910 (= e!345503 e!345510)))

(declare-fun res!388015 () Bool)

(assert (=> b!603910 (=> (not res!388015) (not e!345510))))

(assert (=> b!603910 (= res!388015 (arrayContainsKey!0 lt!275250 (select (arr!17864 a!2986) j!136) j!136))))

(declare-fun b!603911 () Bool)

(declare-fun res!388019 () Bool)

(assert (=> b!603911 (=> (not res!388019) (not e!345514))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37215 (_ BitVec 32)) Bool)

(assert (=> b!603911 (= res!388019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!603912 () Bool)

(declare-fun res!388011 () Bool)

(assert (=> b!603912 (=> (not res!388011) (not e!345514))))

(assert (=> b!603912 (= res!388011 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11941))))

(declare-fun b!603913 () Bool)

(declare-fun res!388013 () Bool)

(assert (=> b!603913 (=> (not res!388013) (not e!345506))))

(assert (=> b!603913 (= res!388013 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603914 () Bool)

(declare-fun Unit!19193 () Unit!19188)

(assert (=> b!603914 (= e!345502 Unit!19193)))

(assert (=> b!603914 false))

(declare-fun b!603915 () Bool)

(assert (=> b!603915 (= e!345510 (arrayContainsKey!0 lt!275250 (select (arr!17864 a!2986) j!136) index!984))))

(declare-fun b!603916 () Bool)

(declare-fun res!388010 () Bool)

(assert (=> b!603916 (=> (not res!388010) (not e!345514))))

(assert (=> b!603916 (= res!388010 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17864 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!603917 () Bool)

(assert (=> b!603917 (= e!345511 (not e!345513))))

(declare-fun res!388017 () Bool)

(assert (=> b!603917 (=> res!388017 e!345513)))

(declare-fun lt!275249 () SeekEntryResult!6301)

(assert (=> b!603917 (= res!388017 (not (= lt!275249 (Found!6301 index!984))))))

(declare-fun lt!275243 () Unit!19188)

(assert (=> b!603917 (= lt!275243 e!345502)))

(declare-fun c!68312 () Bool)

(assert (=> b!603917 (= c!68312 (= lt!275249 Undefined!6301))))

(assert (=> b!603917 (= lt!275249 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275238 lt!275250 mask!3053))))

(declare-fun e!345509 () Bool)

(assert (=> b!603917 e!345509))

(declare-fun res!388020 () Bool)

(assert (=> b!603917 (=> (not res!388020) (not e!345509))))

(declare-fun lt!275251 () SeekEntryResult!6301)

(declare-fun lt!275247 () (_ BitVec 32))

(assert (=> b!603917 (= res!388020 (= lt!275251 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275247 vacantSpotIndex!68 lt!275238 lt!275250 mask!3053)))))

(assert (=> b!603917 (= lt!275251 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275247 vacantSpotIndex!68 (select (arr!17864 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!603917 (= lt!275238 (select (store (arr!17864 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!275241 () Unit!19188)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37215 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19188)

(assert (=> b!603917 (= lt!275241 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275247 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603917 (= lt!275247 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!603918 () Bool)

(assert (=> b!603918 (= e!345509 (= lt!275245 lt!275251))))

(declare-fun b!603919 () Bool)

(assert (=> b!603919 (= e!345506 e!345514)))

(declare-fun res!388009 () Bool)

(assert (=> b!603919 (=> (not res!388009) (not e!345514))))

(declare-fun lt!275240 () SeekEntryResult!6301)

(assert (=> b!603919 (= res!388009 (or (= lt!275240 (MissingZero!6301 i!1108)) (= lt!275240 (MissingVacant!6301 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37215 (_ BitVec 32)) SeekEntryResult!6301)

(assert (=> b!603919 (= lt!275240 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!55128 res!388007) b!603905))

(assert (= (and b!603905 res!388014) b!603904))

(assert (= (and b!603904 res!388021) b!603899))

(assert (= (and b!603899 res!388008) b!603913))

(assert (= (and b!603913 res!388013) b!603919))

(assert (= (and b!603919 res!388009) b!603911))

(assert (= (and b!603911 res!388019) b!603912))

(assert (= (and b!603912 res!388011) b!603916))

(assert (= (and b!603916 res!388010) b!603902))

(assert (= (and b!603902 res!388012) b!603900))

(assert (= (and b!603900 res!388022) b!603917))

(assert (= (and b!603917 res!388020) b!603918))

(assert (= (and b!603917 c!68312) b!603914))

(assert (= (and b!603917 (not c!68312)) b!603903))

(assert (= (and b!603917 (not res!388017)) b!603908))

(assert (= (and b!603908 res!388024) b!603909))

(assert (= (and b!603909 (not res!388023)) b!603910))

(assert (= (and b!603910 res!388015) b!603915))

(assert (= (and b!603908 (not res!388025)) b!603898))

(assert (= (and b!603898 c!68313) b!603901))

(assert (= (and b!603898 (not c!68313)) b!603906))

(assert (= (and b!603898 (not res!388018)) b!603897))

(assert (= (and b!603897 res!388016) b!603907))

(declare-fun m!580321 () Bool)

(assert (=> b!603899 m!580321))

(declare-fun m!580323 () Bool)

(assert (=> b!603913 m!580323))

(declare-fun m!580325 () Bool)

(assert (=> b!603901 m!580325))

(declare-fun m!580327 () Bool)

(assert (=> b!603901 m!580327))

(declare-fun m!580329 () Bool)

(assert (=> b!603901 m!580329))

(assert (=> b!603901 m!580327))

(declare-fun m!580331 () Bool)

(assert (=> b!603901 m!580331))

(declare-fun m!580333 () Bool)

(assert (=> b!603901 m!580333))

(declare-fun m!580335 () Bool)

(assert (=> b!603901 m!580335))

(assert (=> b!603901 m!580327))

(declare-fun m!580337 () Bool)

(assert (=> b!603901 m!580337))

(assert (=> b!603901 m!580327))

(declare-fun m!580339 () Bool)

(assert (=> b!603901 m!580339))

(assert (=> b!603897 m!580327))

(assert (=> b!603897 m!580327))

(declare-fun m!580341 () Bool)

(assert (=> b!603897 m!580341))

(assert (=> b!603897 m!580327))

(declare-fun m!580343 () Bool)

(assert (=> b!603897 m!580343))

(assert (=> b!603897 m!580327))

(declare-fun m!580345 () Bool)

(assert (=> b!603897 m!580345))

(assert (=> b!603907 m!580327))

(assert (=> b!603907 m!580327))

(declare-fun m!580347 () Bool)

(assert (=> b!603907 m!580347))

(assert (=> b!603915 m!580327))

(assert (=> b!603915 m!580327))

(assert (=> b!603915 m!580347))

(assert (=> b!603909 m!580327))

(declare-fun m!580349 () Bool)

(assert (=> b!603902 m!580349))

(declare-fun m!580351 () Bool)

(assert (=> b!603902 m!580351))

(assert (=> b!603904 m!580327))

(assert (=> b!603904 m!580327))

(declare-fun m!580353 () Bool)

(assert (=> b!603904 m!580353))

(declare-fun m!580355 () Bool)

(assert (=> b!603919 m!580355))

(declare-fun m!580357 () Bool)

(assert (=> start!55128 m!580357))

(declare-fun m!580359 () Bool)

(assert (=> start!55128 m!580359))

(assert (=> b!603910 m!580327))

(assert (=> b!603910 m!580327))

(assert (=> b!603910 m!580345))

(declare-fun m!580361 () Bool)

(assert (=> b!603911 m!580361))

(declare-fun m!580363 () Bool)

(assert (=> b!603916 m!580363))

(declare-fun m!580365 () Bool)

(assert (=> b!603900 m!580365))

(assert (=> b!603900 m!580327))

(assert (=> b!603900 m!580327))

(declare-fun m!580367 () Bool)

(assert (=> b!603900 m!580367))

(declare-fun m!580369 () Bool)

(assert (=> b!603912 m!580369))

(assert (=> b!603908 m!580327))

(assert (=> b!603908 m!580349))

(declare-fun m!580371 () Bool)

(assert (=> b!603908 m!580371))

(declare-fun m!580373 () Bool)

(assert (=> b!603917 m!580373))

(declare-fun m!580375 () Bool)

(assert (=> b!603917 m!580375))

(declare-fun m!580377 () Bool)

(assert (=> b!603917 m!580377))

(assert (=> b!603917 m!580327))

(assert (=> b!603917 m!580349))

(declare-fun m!580379 () Bool)

(assert (=> b!603917 m!580379))

(assert (=> b!603917 m!580327))

(declare-fun m!580381 () Bool)

(assert (=> b!603917 m!580381))

(declare-fun m!580383 () Bool)

(assert (=> b!603917 m!580383))

(check-sat (not b!603913) (not b!603899) (not b!603910) (not b!603897) (not b!603901) (not b!603912) (not b!603917) (not b!603900) (not b!603907) (not b!603911) (not b!603919) (not b!603915) (not b!603904) (not start!55128))
(check-sat)
