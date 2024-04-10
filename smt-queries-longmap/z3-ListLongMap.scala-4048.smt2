; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55248 () Bool)

(assert start!55248)

(declare-fun b!605191 () Bool)

(declare-datatypes ((Unit!19270 0))(
  ( (Unit!19271) )
))
(declare-fun e!346367 () Unit!19270)

(declare-fun Unit!19272 () Unit!19270)

(assert (=> b!605191 (= e!346367 Unit!19272)))

(assert (=> b!605191 false))

(declare-fun res!388837 () Bool)

(declare-fun e!346364 () Bool)

(assert (=> start!55248 (=> (not res!388837) (not e!346364))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55248 (= res!388837 (validMask!0 mask!3053))))

(assert (=> start!55248 e!346364))

(assert (=> start!55248 true))

(declare-datatypes ((array!37240 0))(
  ( (array!37241 (arr!17875 (Array (_ BitVec 32) (_ BitVec 64))) (size!18239 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37240)

(declare-fun array_inv!13671 (array!37240) Bool)

(assert (=> start!55248 (array_inv!13671 a!2986)))

(declare-fun b!605192 () Bool)

(declare-fun e!346356 () Bool)

(assert (=> b!605192 (= e!346364 e!346356)))

(declare-fun res!388846 () Bool)

(assert (=> b!605192 (=> (not res!388846) (not e!346356))))

(declare-datatypes ((SeekEntryResult!6315 0))(
  ( (MissingZero!6315 (index!27526 (_ BitVec 32))) (Found!6315 (index!27527 (_ BitVec 32))) (Intermediate!6315 (undefined!7127 Bool) (index!27528 (_ BitVec 32)) (x!56325 (_ BitVec 32))) (Undefined!6315) (MissingVacant!6315 (index!27529 (_ BitVec 32))) )
))
(declare-fun lt!276103 () SeekEntryResult!6315)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!605192 (= res!388846 (or (= lt!276103 (MissingZero!6315 i!1108)) (= lt!276103 (MissingVacant!6315 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37240 (_ BitVec 32)) SeekEntryResult!6315)

(assert (=> b!605192 (= lt!276103 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!605193 () Bool)

(declare-fun Unit!19273 () Unit!19270)

(assert (=> b!605193 (= e!346367 Unit!19273)))

(declare-fun b!605194 () Bool)

(declare-fun e!346362 () Bool)

(declare-fun e!346355 () Bool)

(assert (=> b!605194 (= e!346362 e!346355)))

(declare-fun res!388829 () Bool)

(assert (=> b!605194 (=> (not res!388829) (not e!346355))))

(declare-fun lt!276099 () array!37240)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37240 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!605194 (= res!388829 (arrayContainsKey!0 lt!276099 (select (arr!17875 a!2986) j!136) j!136))))

(declare-fun b!605195 () Bool)

(declare-fun res!388844 () Bool)

(assert (=> b!605195 (=> (not res!388844) (not e!346356))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!605195 (= res!388844 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17875 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!605196 () Bool)

(declare-fun e!346365 () Bool)

(declare-fun e!346357 () Bool)

(assert (=> b!605196 (= e!346365 (not e!346357))))

(declare-fun res!388842 () Bool)

(assert (=> b!605196 (=> res!388842 e!346357)))

(declare-fun lt!276098 () SeekEntryResult!6315)

(assert (=> b!605196 (= res!388842 (not (= lt!276098 (Found!6315 index!984))))))

(declare-fun lt!276101 () Unit!19270)

(assert (=> b!605196 (= lt!276101 e!346367)))

(declare-fun c!68548 () Bool)

(assert (=> b!605196 (= c!68548 (= lt!276098 Undefined!6315))))

(declare-fun lt!276100 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37240 (_ BitVec 32)) SeekEntryResult!6315)

(assert (=> b!605196 (= lt!276098 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276100 lt!276099 mask!3053))))

(declare-fun e!346361 () Bool)

(assert (=> b!605196 e!346361))

(declare-fun res!388832 () Bool)

(assert (=> b!605196 (=> (not res!388832) (not e!346361))))

(declare-fun lt!276097 () (_ BitVec 32))

(declare-fun lt!276106 () SeekEntryResult!6315)

(assert (=> b!605196 (= res!388832 (= lt!276106 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276097 vacantSpotIndex!68 lt!276100 lt!276099 mask!3053)))))

(assert (=> b!605196 (= lt!276106 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276097 vacantSpotIndex!68 (select (arr!17875 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!605196 (= lt!276100 (select (store (arr!17875 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!276107 () Unit!19270)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37240 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19270)

(assert (=> b!605196 (= lt!276107 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276097 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!605196 (= lt!276097 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun e!346358 () Bool)

(declare-fun b!605197 () Bool)

(assert (=> b!605197 (= e!346358 (arrayContainsKey!0 lt!276099 (select (arr!17875 a!2986) j!136) index!984))))

(declare-fun b!605198 () Bool)

(declare-fun res!388834 () Bool)

(assert (=> b!605198 (=> (not res!388834) (not e!346364))))

(assert (=> b!605198 (= res!388834 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!605199 () Bool)

(declare-fun e!346360 () Bool)

(assert (=> b!605199 (= e!346357 e!346360)))

(declare-fun res!388833 () Bool)

(assert (=> b!605199 (=> res!388833 e!346360)))

(declare-fun lt!276111 () (_ BitVec 64))

(assert (=> b!605199 (= res!388833 (or (not (= (select (arr!17875 a!2986) j!136) lt!276100)) (not (= (select (arr!17875 a!2986) j!136) lt!276111))))))

(declare-fun e!346368 () Bool)

(assert (=> b!605199 e!346368))

(declare-fun res!388847 () Bool)

(assert (=> b!605199 (=> (not res!388847) (not e!346368))))

(assert (=> b!605199 (= res!388847 (= lt!276111 (select (arr!17875 a!2986) j!136)))))

(assert (=> b!605199 (= lt!276111 (select (store (arr!17875 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!605200 () Bool)

(declare-fun e!346366 () Bool)

(assert (=> b!605200 (= e!346360 e!346366)))

(declare-fun res!388841 () Bool)

(assert (=> b!605200 (=> res!388841 e!346366)))

(assert (=> b!605200 (= res!388841 (bvsge index!984 j!136))))

(declare-fun lt!276110 () Unit!19270)

(declare-fun e!346359 () Unit!19270)

(assert (=> b!605200 (= lt!276110 e!346359)))

(declare-fun c!68549 () Bool)

(assert (=> b!605200 (= c!68549 (bvslt j!136 index!984))))

(declare-fun b!605201 () Bool)

(declare-fun res!388843 () Bool)

(assert (=> b!605201 (=> (not res!388843) (not e!346356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37240 (_ BitVec 32)) Bool)

(assert (=> b!605201 (= res!388843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!605202 () Bool)

(assert (=> b!605202 (= e!346355 (arrayContainsKey!0 lt!276099 (select (arr!17875 a!2986) j!136) index!984))))

(declare-fun b!605203 () Bool)

(declare-fun res!388835 () Bool)

(assert (=> b!605203 (=> (not res!388835) (not e!346364))))

(assert (=> b!605203 (= res!388835 (and (= (size!18239 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18239 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18239 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!605204 () Bool)

(assert (=> b!605204 (= e!346368 e!346362)))

(declare-fun res!388839 () Bool)

(assert (=> b!605204 (=> res!388839 e!346362)))

(assert (=> b!605204 (= res!388839 (or (not (= (select (arr!17875 a!2986) j!136) lt!276100)) (not (= (select (arr!17875 a!2986) j!136) lt!276111)) (bvsge j!136 index!984)))))

(declare-fun b!605205 () Bool)

(assert (=> b!605205 (= e!346366 (bvsle #b00000000000000000000000000000000 (size!18239 a!2986)))))

(assert (=> b!605205 (arrayContainsKey!0 lt!276099 (select (arr!17875 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276105 () Unit!19270)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37240 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19270)

(assert (=> b!605205 (= lt!276105 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276099 (select (arr!17875 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!605205 e!346358))

(declare-fun res!388838 () Bool)

(assert (=> b!605205 (=> (not res!388838) (not e!346358))))

(assert (=> b!605205 (= res!388838 (arrayContainsKey!0 lt!276099 (select (arr!17875 a!2986) j!136) j!136))))

(declare-fun b!605206 () Bool)

(declare-fun lt!276108 () SeekEntryResult!6315)

(assert (=> b!605206 (= e!346361 (= lt!276108 lt!276106))))

(declare-fun b!605207 () Bool)

(declare-fun e!346363 () Bool)

(assert (=> b!605207 (= e!346356 e!346363)))

(declare-fun res!388830 () Bool)

(assert (=> b!605207 (=> (not res!388830) (not e!346363))))

(assert (=> b!605207 (= res!388830 (= (select (store (arr!17875 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!605207 (= lt!276099 (array!37241 (store (arr!17875 a!2986) i!1108 k0!1786) (size!18239 a!2986)))))

(declare-fun b!605208 () Bool)

(assert (=> b!605208 (= e!346363 e!346365)))

(declare-fun res!388845 () Bool)

(assert (=> b!605208 (=> (not res!388845) (not e!346365))))

(assert (=> b!605208 (= res!388845 (and (= lt!276108 (Found!6315 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17875 a!2986) index!984) (select (arr!17875 a!2986) j!136))) (not (= (select (arr!17875 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!605208 (= lt!276108 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17875 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!605209 () Bool)

(declare-fun Unit!19274 () Unit!19270)

(assert (=> b!605209 (= e!346359 Unit!19274)))

(declare-fun lt!276104 () Unit!19270)

(assert (=> b!605209 (= lt!276104 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276099 (select (arr!17875 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!605209 (arrayContainsKey!0 lt!276099 (select (arr!17875 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276109 () Unit!19270)

(declare-datatypes ((List!11916 0))(
  ( (Nil!11913) (Cons!11912 (h!12957 (_ BitVec 64)) (t!18144 List!11916)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37240 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11916) Unit!19270)

(assert (=> b!605209 (= lt!276109 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11913))))

(declare-fun arrayNoDuplicates!0 (array!37240 (_ BitVec 32) List!11916) Bool)

(assert (=> b!605209 (arrayNoDuplicates!0 lt!276099 #b00000000000000000000000000000000 Nil!11913)))

(declare-fun lt!276102 () Unit!19270)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37240 (_ BitVec 32) (_ BitVec 32)) Unit!19270)

(assert (=> b!605209 (= lt!276102 (lemmaNoDuplicateFromThenFromBigger!0 lt!276099 #b00000000000000000000000000000000 j!136))))

(assert (=> b!605209 (arrayNoDuplicates!0 lt!276099 j!136 Nil!11913)))

(declare-fun lt!276112 () Unit!19270)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37240 (_ BitVec 64) (_ BitVec 32) List!11916) Unit!19270)

(assert (=> b!605209 (= lt!276112 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276099 (select (arr!17875 a!2986) j!136) j!136 Nil!11913))))

(assert (=> b!605209 false))

(declare-fun b!605210 () Bool)

(declare-fun res!388831 () Bool)

(assert (=> b!605210 (=> (not res!388831) (not e!346364))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!605210 (= res!388831 (validKeyInArray!0 k0!1786))))

(declare-fun b!605211 () Bool)

(declare-fun res!388840 () Bool)

(assert (=> b!605211 (=> (not res!388840) (not e!346364))))

(assert (=> b!605211 (= res!388840 (validKeyInArray!0 (select (arr!17875 a!2986) j!136)))))

(declare-fun b!605212 () Bool)

(declare-fun res!388836 () Bool)

(assert (=> b!605212 (=> (not res!388836) (not e!346356))))

(assert (=> b!605212 (= res!388836 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11913))))

(declare-fun b!605213 () Bool)

(declare-fun Unit!19275 () Unit!19270)

(assert (=> b!605213 (= e!346359 Unit!19275)))

(assert (= (and start!55248 res!388837) b!605203))

(assert (= (and b!605203 res!388835) b!605211))

(assert (= (and b!605211 res!388840) b!605210))

(assert (= (and b!605210 res!388831) b!605198))

(assert (= (and b!605198 res!388834) b!605192))

(assert (= (and b!605192 res!388846) b!605201))

(assert (= (and b!605201 res!388843) b!605212))

(assert (= (and b!605212 res!388836) b!605195))

(assert (= (and b!605195 res!388844) b!605207))

(assert (= (and b!605207 res!388830) b!605208))

(assert (= (and b!605208 res!388845) b!605196))

(assert (= (and b!605196 res!388832) b!605206))

(assert (= (and b!605196 c!68548) b!605191))

(assert (= (and b!605196 (not c!68548)) b!605193))

(assert (= (and b!605196 (not res!388842)) b!605199))

(assert (= (and b!605199 res!388847) b!605204))

(assert (= (and b!605204 (not res!388839)) b!605194))

(assert (= (and b!605194 res!388829) b!605202))

(assert (= (and b!605199 (not res!388833)) b!605200))

(assert (= (and b!605200 c!68549) b!605209))

(assert (= (and b!605200 (not c!68549)) b!605213))

(assert (= (and b!605200 (not res!388841)) b!605205))

(assert (= (and b!605205 res!388838) b!605197))

(declare-fun m!582063 () Bool)

(assert (=> b!605197 m!582063))

(assert (=> b!605197 m!582063))

(declare-fun m!582065 () Bool)

(assert (=> b!605197 m!582065))

(declare-fun m!582067 () Bool)

(assert (=> b!605196 m!582067))

(declare-fun m!582069 () Bool)

(assert (=> b!605196 m!582069))

(assert (=> b!605196 m!582063))

(declare-fun m!582071 () Bool)

(assert (=> b!605196 m!582071))

(declare-fun m!582073 () Bool)

(assert (=> b!605196 m!582073))

(declare-fun m!582075 () Bool)

(assert (=> b!605196 m!582075))

(assert (=> b!605196 m!582063))

(declare-fun m!582077 () Bool)

(assert (=> b!605196 m!582077))

(declare-fun m!582079 () Bool)

(assert (=> b!605196 m!582079))

(declare-fun m!582081 () Bool)

(assert (=> start!55248 m!582081))

(declare-fun m!582083 () Bool)

(assert (=> start!55248 m!582083))

(declare-fun m!582085 () Bool)

(assert (=> b!605208 m!582085))

(assert (=> b!605208 m!582063))

(assert (=> b!605208 m!582063))

(declare-fun m!582087 () Bool)

(assert (=> b!605208 m!582087))

(assert (=> b!605207 m!582073))

(declare-fun m!582089 () Bool)

(assert (=> b!605207 m!582089))

(assert (=> b!605199 m!582063))

(assert (=> b!605199 m!582073))

(declare-fun m!582091 () Bool)

(assert (=> b!605199 m!582091))

(declare-fun m!582093 () Bool)

(assert (=> b!605192 m!582093))

(assert (=> b!605202 m!582063))

(assert (=> b!605202 m!582063))

(assert (=> b!605202 m!582065))

(assert (=> b!605209 m!582063))

(declare-fun m!582095 () Bool)

(assert (=> b!605209 m!582095))

(assert (=> b!605209 m!582063))

(assert (=> b!605209 m!582063))

(declare-fun m!582097 () Bool)

(assert (=> b!605209 m!582097))

(declare-fun m!582099 () Bool)

(assert (=> b!605209 m!582099))

(declare-fun m!582101 () Bool)

(assert (=> b!605209 m!582101))

(declare-fun m!582103 () Bool)

(assert (=> b!605209 m!582103))

(declare-fun m!582105 () Bool)

(assert (=> b!605209 m!582105))

(assert (=> b!605209 m!582063))

(declare-fun m!582107 () Bool)

(assert (=> b!605209 m!582107))

(declare-fun m!582109 () Bool)

(assert (=> b!605195 m!582109))

(assert (=> b!605194 m!582063))

(assert (=> b!605194 m!582063))

(declare-fun m!582111 () Bool)

(assert (=> b!605194 m!582111))

(declare-fun m!582113 () Bool)

(assert (=> b!605201 m!582113))

(declare-fun m!582115 () Bool)

(assert (=> b!605212 m!582115))

(assert (=> b!605211 m!582063))

(assert (=> b!605211 m!582063))

(declare-fun m!582117 () Bool)

(assert (=> b!605211 m!582117))

(assert (=> b!605204 m!582063))

(declare-fun m!582119 () Bool)

(assert (=> b!605210 m!582119))

(declare-fun m!582121 () Bool)

(assert (=> b!605198 m!582121))

(assert (=> b!605205 m!582063))

(assert (=> b!605205 m!582063))

(declare-fun m!582123 () Bool)

(assert (=> b!605205 m!582123))

(assert (=> b!605205 m!582063))

(declare-fun m!582125 () Bool)

(assert (=> b!605205 m!582125))

(assert (=> b!605205 m!582063))

(assert (=> b!605205 m!582111))

(check-sat (not b!605194) (not b!605201) (not b!605198) (not b!605197) (not b!605202) (not b!605209) (not start!55248) (not b!605208) (not b!605210) (not b!605205) (not b!605196) (not b!605211) (not b!605192) (not b!605212))
(check-sat)
