; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55530 () Bool)

(assert start!55530)

(declare-fun b!607025 () Bool)

(declare-fun e!347604 () Bool)

(declare-fun e!347600 () Bool)

(assert (=> b!607025 (= e!347604 e!347600)))

(declare-fun res!390026 () Bool)

(assert (=> b!607025 (=> (not res!390026) (not e!347600))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37275 0))(
  ( (array!37276 (arr!17888 (Array (_ BitVec 32) (_ BitVec 64))) (size!18253 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37275)

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!607025 (= res!390026 (= (select (store (arr!17888 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!277000 () array!37275)

(assert (=> b!607025 (= lt!277000 (array!37276 (store (arr!17888 a!2986) i!1108 k0!1786) (size!18253 a!2986)))))

(declare-fun b!607026 () Bool)

(declare-datatypes ((Unit!19332 0))(
  ( (Unit!19333) )
))
(declare-fun e!347605 () Unit!19332)

(declare-fun Unit!19334 () Unit!19332)

(assert (=> b!607026 (= e!347605 Unit!19334)))

(assert (=> b!607026 false))

(declare-fun b!607027 () Bool)

(declare-fun Unit!19335 () Unit!19332)

(assert (=> b!607027 (= e!347605 Unit!19335)))

(declare-fun b!607028 () Bool)

(declare-fun e!347592 () Unit!19332)

(declare-fun Unit!19336 () Unit!19332)

(assert (=> b!607028 (= e!347592 Unit!19336)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!277010 () Unit!19332)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37275 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19332)

(assert (=> b!607028 (= lt!277010 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277000 (select (arr!17888 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!607028 (arrayContainsKey!0 lt!277000 (select (arr!17888 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276999 () Unit!19332)

(declare-datatypes ((List!11968 0))(
  ( (Nil!11965) (Cons!11964 (h!13009 (_ BitVec 64)) (t!18187 List!11968)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37275 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11968) Unit!19332)

(assert (=> b!607028 (= lt!276999 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11965))))

(declare-fun arrayNoDuplicates!0 (array!37275 (_ BitVec 32) List!11968) Bool)

(assert (=> b!607028 (arrayNoDuplicates!0 lt!277000 #b00000000000000000000000000000000 Nil!11965)))

(declare-fun lt!277007 () Unit!19332)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37275 (_ BitVec 32) (_ BitVec 32)) Unit!19332)

(assert (=> b!607028 (= lt!277007 (lemmaNoDuplicateFromThenFromBigger!0 lt!277000 #b00000000000000000000000000000000 j!136))))

(assert (=> b!607028 (arrayNoDuplicates!0 lt!277000 j!136 Nil!11965)))

(declare-fun lt!277011 () Unit!19332)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37275 (_ BitVec 64) (_ BitVec 32) List!11968) Unit!19332)

(assert (=> b!607028 (= lt!277011 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277000 (select (arr!17888 a!2986) j!136) j!136 Nil!11965))))

(assert (=> b!607028 false))

(declare-fun b!607029 () Bool)

(declare-fun res!390019 () Bool)

(assert (=> b!607029 (=> (not res!390019) (not e!347604))))

(assert (=> b!607029 (= res!390019 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11965))))

(declare-fun b!607030 () Bool)

(declare-fun e!347597 () Bool)

(assert (=> b!607030 (= e!347597 true)))

(declare-fun lt!277005 () Bool)

(declare-fun contains!2990 (List!11968 (_ BitVec 64)) Bool)

(assert (=> b!607030 (= lt!277005 (contains!2990 Nil!11965 k0!1786))))

(declare-fun b!607031 () Bool)

(declare-fun res!390022 () Bool)

(declare-fun e!347601 () Bool)

(assert (=> b!607031 (=> (not res!390022) (not e!347601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!607031 (= res!390022 (validKeyInArray!0 (select (arr!17888 a!2986) j!136)))))

(declare-fun b!607032 () Bool)

(declare-fun res!390014 () Bool)

(assert (=> b!607032 (=> (not res!390014) (not e!347604))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!607032 (= res!390014 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17888 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!607033 () Bool)

(declare-fun res!390010 () Bool)

(assert (=> b!607033 (=> res!390010 e!347597)))

(declare-fun noDuplicate!317 (List!11968) Bool)

(assert (=> b!607033 (= res!390010 (not (noDuplicate!317 Nil!11965)))))

(declare-fun b!607034 () Bool)

(assert (=> b!607034 (= e!347601 e!347604)))

(declare-fun res!390024 () Bool)

(assert (=> b!607034 (=> (not res!390024) (not e!347604))))

(declare-datatypes ((SeekEntryResult!6325 0))(
  ( (MissingZero!6325 (index!27575 (_ BitVec 32))) (Found!6325 (index!27576 (_ BitVec 32))) (Intermediate!6325 (undefined!7137 Bool) (index!27577 (_ BitVec 32)) (x!56397 (_ BitVec 32))) (Undefined!6325) (MissingVacant!6325 (index!27578 (_ BitVec 32))) )
))
(declare-fun lt!277015 () SeekEntryResult!6325)

(assert (=> b!607034 (= res!390024 (or (= lt!277015 (MissingZero!6325 i!1108)) (= lt!277015 (MissingVacant!6325 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37275 (_ BitVec 32)) SeekEntryResult!6325)

(assert (=> b!607034 (= lt!277015 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!607035 () Bool)

(declare-fun res!390020 () Bool)

(assert (=> b!607035 (=> (not res!390020) (not e!347601))))

(assert (=> b!607035 (= res!390020 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!607036 () Bool)

(declare-fun res!390021 () Bool)

(assert (=> b!607036 (=> (not res!390021) (not e!347601))))

(assert (=> b!607036 (= res!390021 (validKeyInArray!0 k0!1786))))

(declare-fun e!347603 () Bool)

(declare-fun b!607037 () Bool)

(assert (=> b!607037 (= e!347603 (arrayContainsKey!0 lt!277000 (select (arr!17888 a!2986) j!136) index!984))))

(declare-fun b!607038 () Bool)

(declare-fun e!347598 () Bool)

(declare-fun e!347596 () Bool)

(assert (=> b!607038 (= e!347598 e!347596)))

(declare-fun res!390027 () Bool)

(assert (=> b!607038 (=> res!390027 e!347596)))

(assert (=> b!607038 (= res!390027 (bvsge index!984 j!136))))

(declare-fun lt!277003 () Unit!19332)

(assert (=> b!607038 (= lt!277003 e!347592)))

(declare-fun c!68876 () Bool)

(assert (=> b!607038 (= c!68876 (bvslt j!136 index!984))))

(declare-fun res!390016 () Bool)

(assert (=> start!55530 (=> (not res!390016) (not e!347601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55530 (= res!390016 (validMask!0 mask!3053))))

(assert (=> start!55530 e!347601))

(assert (=> start!55530 true))

(declare-fun array_inv!13771 (array!37275) Bool)

(assert (=> start!55530 (array_inv!13771 a!2986)))

(declare-fun b!607039 () Bool)

(declare-fun e!347602 () Bool)

(assert (=> b!607039 (= e!347600 e!347602)))

(declare-fun res!390017 () Bool)

(assert (=> b!607039 (=> (not res!390017) (not e!347602))))

(declare-fun lt!277006 () SeekEntryResult!6325)

(assert (=> b!607039 (= res!390017 (and (= lt!277006 (Found!6325 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17888 a!2986) index!984) (select (arr!17888 a!2986) j!136))) (not (= (select (arr!17888 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37275 (_ BitVec 32)) SeekEntryResult!6325)

(assert (=> b!607039 (= lt!277006 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17888 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!607040 () Bool)

(declare-fun Unit!19337 () Unit!19332)

(assert (=> b!607040 (= e!347592 Unit!19337)))

(declare-fun b!607041 () Bool)

(declare-fun e!347595 () Bool)

(assert (=> b!607041 (= e!347595 e!347598)))

(declare-fun res!390013 () Bool)

(assert (=> b!607041 (=> res!390013 e!347598)))

(declare-fun lt!277008 () (_ BitVec 64))

(declare-fun lt!277001 () (_ BitVec 64))

(assert (=> b!607041 (= res!390013 (or (not (= (select (arr!17888 a!2986) j!136) lt!277001)) (not (= (select (arr!17888 a!2986) j!136) lt!277008))))))

(declare-fun e!347607 () Bool)

(assert (=> b!607041 e!347607))

(declare-fun res!390028 () Bool)

(assert (=> b!607041 (=> (not res!390028) (not e!347607))))

(assert (=> b!607041 (= res!390028 (= lt!277008 (select (arr!17888 a!2986) j!136)))))

(assert (=> b!607041 (= lt!277008 (select (store (arr!17888 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!607042 () Bool)

(declare-fun res!390029 () Bool)

(assert (=> b!607042 (=> (not res!390029) (not e!347604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37275 (_ BitVec 32)) Bool)

(assert (=> b!607042 (= res!390029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!607043 () Bool)

(declare-fun e!347599 () Bool)

(declare-fun e!347606 () Bool)

(assert (=> b!607043 (= e!347599 e!347606)))

(declare-fun res!390025 () Bool)

(assert (=> b!607043 (=> (not res!390025) (not e!347606))))

(assert (=> b!607043 (= res!390025 (arrayContainsKey!0 lt!277000 (select (arr!17888 a!2986) j!136) j!136))))

(declare-fun b!607044 () Bool)

(declare-fun res!390008 () Bool)

(assert (=> b!607044 (=> res!390008 e!347597)))

(assert (=> b!607044 (= res!390008 (contains!2990 Nil!11965 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607045 () Bool)

(assert (=> b!607045 (= e!347607 e!347599)))

(declare-fun res!390007 () Bool)

(assert (=> b!607045 (=> res!390007 e!347599)))

(assert (=> b!607045 (= res!390007 (or (not (= (select (arr!17888 a!2986) j!136) lt!277001)) (not (= (select (arr!17888 a!2986) j!136) lt!277008)) (bvsge j!136 index!984)))))

(declare-fun b!607046 () Bool)

(assert (=> b!607046 (= e!347596 e!347597)))

(declare-fun res!390009 () Bool)

(assert (=> b!607046 (=> res!390009 e!347597)))

(assert (=> b!607046 (= res!390009 (or (bvsge (size!18253 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18253 a!2986))))))

(assert (=> b!607046 (arrayContainsKey!0 lt!277000 (select (arr!17888 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277014 () Unit!19332)

(assert (=> b!607046 (= lt!277014 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277000 (select (arr!17888 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!607046 e!347603))

(declare-fun res!390018 () Bool)

(assert (=> b!607046 (=> (not res!390018) (not e!347603))))

(assert (=> b!607046 (= res!390018 (arrayContainsKey!0 lt!277000 (select (arr!17888 a!2986) j!136) j!136))))

(declare-fun b!607047 () Bool)

(declare-fun res!390015 () Bool)

(assert (=> b!607047 (=> (not res!390015) (not e!347601))))

(assert (=> b!607047 (= res!390015 (and (= (size!18253 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18253 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18253 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!607048 () Bool)

(declare-fun res!390023 () Bool)

(assert (=> b!607048 (=> res!390023 e!347597)))

(assert (=> b!607048 (= res!390023 (contains!2990 Nil!11965 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607049 () Bool)

(assert (=> b!607049 (= e!347606 (arrayContainsKey!0 lt!277000 (select (arr!17888 a!2986) j!136) index!984))))

(declare-fun b!607050 () Bool)

(declare-fun e!347594 () Bool)

(declare-fun lt!277004 () SeekEntryResult!6325)

(assert (=> b!607050 (= e!347594 (= lt!277006 lt!277004))))

(declare-fun b!607051 () Bool)

(assert (=> b!607051 (= e!347602 (not e!347595))))

(declare-fun res!390012 () Bool)

(assert (=> b!607051 (=> res!390012 e!347595)))

(declare-fun lt!277012 () SeekEntryResult!6325)

(assert (=> b!607051 (= res!390012 (not (= lt!277012 (Found!6325 index!984))))))

(declare-fun lt!277013 () Unit!19332)

(assert (=> b!607051 (= lt!277013 e!347605)))

(declare-fun c!68877 () Bool)

(assert (=> b!607051 (= c!68877 (= lt!277012 Undefined!6325))))

(assert (=> b!607051 (= lt!277012 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277001 lt!277000 mask!3053))))

(assert (=> b!607051 e!347594))

(declare-fun res!390011 () Bool)

(assert (=> b!607051 (=> (not res!390011) (not e!347594))))

(declare-fun lt!277002 () (_ BitVec 32))

(assert (=> b!607051 (= res!390011 (= lt!277004 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277002 vacantSpotIndex!68 lt!277001 lt!277000 mask!3053)))))

(assert (=> b!607051 (= lt!277004 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277002 vacantSpotIndex!68 (select (arr!17888 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!607051 (= lt!277001 (select (store (arr!17888 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!277009 () Unit!19332)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37275 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19332)

(assert (=> b!607051 (= lt!277009 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277002 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!607051 (= lt!277002 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!55530 res!390016) b!607047))

(assert (= (and b!607047 res!390015) b!607031))

(assert (= (and b!607031 res!390022) b!607036))

(assert (= (and b!607036 res!390021) b!607035))

(assert (= (and b!607035 res!390020) b!607034))

(assert (= (and b!607034 res!390024) b!607042))

(assert (= (and b!607042 res!390029) b!607029))

(assert (= (and b!607029 res!390019) b!607032))

(assert (= (and b!607032 res!390014) b!607025))

(assert (= (and b!607025 res!390026) b!607039))

(assert (= (and b!607039 res!390017) b!607051))

(assert (= (and b!607051 res!390011) b!607050))

(assert (= (and b!607051 c!68877) b!607026))

(assert (= (and b!607051 (not c!68877)) b!607027))

(assert (= (and b!607051 (not res!390012)) b!607041))

(assert (= (and b!607041 res!390028) b!607045))

(assert (= (and b!607045 (not res!390007)) b!607043))

(assert (= (and b!607043 res!390025) b!607049))

(assert (= (and b!607041 (not res!390013)) b!607038))

(assert (= (and b!607038 c!68876) b!607028))

(assert (= (and b!607038 (not c!68876)) b!607040))

(assert (= (and b!607038 (not res!390027)) b!607046))

(assert (= (and b!607046 res!390018) b!607037))

(assert (= (and b!607046 (not res!390009)) b!607033))

(assert (= (and b!607033 (not res!390010)) b!607044))

(assert (= (and b!607044 (not res!390008)) b!607048))

(assert (= (and b!607048 (not res!390023)) b!607030))

(declare-fun m!583279 () Bool)

(assert (=> b!607051 m!583279))

(declare-fun m!583281 () Bool)

(assert (=> b!607051 m!583281))

(declare-fun m!583283 () Bool)

(assert (=> b!607051 m!583283))

(declare-fun m!583285 () Bool)

(assert (=> b!607051 m!583285))

(declare-fun m!583287 () Bool)

(assert (=> b!607051 m!583287))

(declare-fun m!583289 () Bool)

(assert (=> b!607051 m!583289))

(assert (=> b!607051 m!583283))

(declare-fun m!583291 () Bool)

(assert (=> b!607051 m!583291))

(declare-fun m!583293 () Bool)

(assert (=> b!607051 m!583293))

(declare-fun m!583295 () Bool)

(assert (=> b!607035 m!583295))

(declare-fun m!583297 () Bool)

(assert (=> b!607028 m!583297))

(assert (=> b!607028 m!583283))

(declare-fun m!583299 () Bool)

(assert (=> b!607028 m!583299))

(assert (=> b!607028 m!583283))

(declare-fun m!583301 () Bool)

(assert (=> b!607028 m!583301))

(assert (=> b!607028 m!583283))

(declare-fun m!583303 () Bool)

(assert (=> b!607028 m!583303))

(declare-fun m!583305 () Bool)

(assert (=> b!607028 m!583305))

(declare-fun m!583307 () Bool)

(assert (=> b!607028 m!583307))

(assert (=> b!607028 m!583283))

(declare-fun m!583309 () Bool)

(assert (=> b!607028 m!583309))

(declare-fun m!583311 () Bool)

(assert (=> b!607029 m!583311))

(assert (=> b!607031 m!583283))

(assert (=> b!607031 m!583283))

(declare-fun m!583313 () Bool)

(assert (=> b!607031 m!583313))

(declare-fun m!583315 () Bool)

(assert (=> start!55530 m!583315))

(declare-fun m!583317 () Bool)

(assert (=> start!55530 m!583317))

(declare-fun m!583319 () Bool)

(assert (=> b!607042 m!583319))

(assert (=> b!607049 m!583283))

(assert (=> b!607049 m!583283))

(declare-fun m!583321 () Bool)

(assert (=> b!607049 m!583321))

(assert (=> b!607046 m!583283))

(assert (=> b!607046 m!583283))

(declare-fun m!583323 () Bool)

(assert (=> b!607046 m!583323))

(assert (=> b!607046 m!583283))

(declare-fun m!583325 () Bool)

(assert (=> b!607046 m!583325))

(assert (=> b!607046 m!583283))

(declare-fun m!583327 () Bool)

(assert (=> b!607046 m!583327))

(declare-fun m!583329 () Bool)

(assert (=> b!607044 m!583329))

(declare-fun m!583331 () Bool)

(assert (=> b!607036 m!583331))

(assert (=> b!607037 m!583283))

(assert (=> b!607037 m!583283))

(assert (=> b!607037 m!583321))

(declare-fun m!583333 () Bool)

(assert (=> b!607033 m!583333))

(declare-fun m!583335 () Bool)

(assert (=> b!607048 m!583335))

(declare-fun m!583337 () Bool)

(assert (=> b!607032 m!583337))

(assert (=> b!607025 m!583285))

(declare-fun m!583339 () Bool)

(assert (=> b!607025 m!583339))

(assert (=> b!607045 m!583283))

(assert (=> b!607043 m!583283))

(assert (=> b!607043 m!583283))

(assert (=> b!607043 m!583327))

(declare-fun m!583341 () Bool)

(assert (=> b!607030 m!583341))

(declare-fun m!583343 () Bool)

(assert (=> b!607034 m!583343))

(declare-fun m!583345 () Bool)

(assert (=> b!607039 m!583345))

(assert (=> b!607039 m!583283))

(assert (=> b!607039 m!583283))

(declare-fun m!583347 () Bool)

(assert (=> b!607039 m!583347))

(assert (=> b!607041 m!583283))

(assert (=> b!607041 m!583285))

(declare-fun m!583349 () Bool)

(assert (=> b!607041 m!583349))

(check-sat (not b!607034) (not b!607049) (not b!607029) (not b!607030) (not b!607051) (not b!607035) (not b!607036) (not b!607046) (not b!607043) (not b!607048) (not b!607031) (not b!607044) (not start!55530) (not b!607037) (not b!607042) (not b!607028) (not b!607039) (not b!607033))
(check-sat)
