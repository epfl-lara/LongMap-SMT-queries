; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55546 () Bool)

(assert start!55546)

(declare-fun b!607296 () Bool)

(declare-fun res!390140 () Bool)

(declare-fun e!347771 () Bool)

(assert (=> b!607296 (=> res!390140 e!347771)))

(declare-datatypes ((List!11930 0))(
  ( (Nil!11927) (Cons!11926 (h!12971 (_ BitVec 64)) (t!18158 List!11930)) )
))
(declare-fun noDuplicate!312 (List!11930) Bool)

(assert (=> b!607296 (= res!390140 (not (noDuplicate!312 Nil!11927)))))

(declare-fun b!607297 () Bool)

(declare-fun res!390137 () Bool)

(declare-fun e!347775 () Bool)

(assert (=> b!607297 (=> (not res!390137) (not e!347775))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!607297 (= res!390137 (validKeyInArray!0 k!1786))))

(declare-fun b!607298 () Bool)

(declare-fun e!347776 () Bool)

(declare-datatypes ((SeekEntryResult!6329 0))(
  ( (MissingZero!6329 (index!27591 (_ BitVec 32))) (Found!6329 (index!27592 (_ BitVec 32))) (Intermediate!6329 (undefined!7141 Bool) (index!27593 (_ BitVec 32)) (x!56406 (_ BitVec 32))) (Undefined!6329) (MissingVacant!6329 (index!27594 (_ BitVec 32))) )
))
(declare-fun lt!277247 () SeekEntryResult!6329)

(declare-fun lt!277249 () SeekEntryResult!6329)

(assert (=> b!607298 (= e!347776 (= lt!277247 lt!277249))))

(declare-fun b!607299 () Bool)

(declare-fun e!347772 () Bool)

(assert (=> b!607299 (= e!347775 e!347772)))

(declare-fun res!390146 () Bool)

(assert (=> b!607299 (=> (not res!390146) (not e!347772))))

(declare-fun lt!277237 () SeekEntryResult!6329)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!607299 (= res!390146 (or (= lt!277237 (MissingZero!6329 i!1108)) (= lt!277237 (MissingVacant!6329 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!37277 0))(
  ( (array!37278 (arr!17889 (Array (_ BitVec 32) (_ BitVec 64))) (size!18253 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37277)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37277 (_ BitVec 32)) SeekEntryResult!6329)

(assert (=> b!607299 (= lt!277237 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!607300 () Bool)

(declare-fun e!347781 () Bool)

(declare-fun e!347769 () Bool)

(assert (=> b!607300 (= e!347781 e!347769)))

(declare-fun res!390147 () Bool)

(assert (=> b!607300 (=> res!390147 e!347769)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!277240 () (_ BitVec 64))

(declare-fun lt!277235 () (_ BitVec 64))

(assert (=> b!607300 (= res!390147 (or (not (= (select (arr!17889 a!2986) j!136) lt!277240)) (not (= (select (arr!17889 a!2986) j!136) lt!277235))))))

(declare-fun e!347777 () Bool)

(assert (=> b!607300 e!347777))

(declare-fun res!390144 () Bool)

(assert (=> b!607300 (=> (not res!390144) (not e!347777))))

(assert (=> b!607300 (= res!390144 (= lt!277235 (select (arr!17889 a!2986) j!136)))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!607300 (= lt!277235 (select (store (arr!17889 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!607301 () Bool)

(declare-fun e!347773 () Bool)

(assert (=> b!607301 (= e!347769 e!347773)))

(declare-fun res!390138 () Bool)

(assert (=> b!607301 (=> res!390138 e!347773)))

(assert (=> b!607301 (= res!390138 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!19354 0))(
  ( (Unit!19355) )
))
(declare-fun lt!277242 () Unit!19354)

(declare-fun e!347767 () Unit!19354)

(assert (=> b!607301 (= lt!277242 e!347767)))

(declare-fun c!68947 () Bool)

(assert (=> b!607301 (= c!68947 (bvslt j!136 index!984))))

(declare-fun e!347774 () Bool)

(declare-fun lt!277246 () array!37277)

(declare-fun b!607302 () Bool)

(declare-fun arrayContainsKey!0 (array!37277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!607302 (= e!347774 (arrayContainsKey!0 lt!277246 (select (arr!17889 a!2986) j!136) index!984))))

(declare-fun b!607304 () Bool)

(declare-fun e!347779 () Bool)

(assert (=> b!607304 (= e!347779 e!347774)))

(declare-fun res!390156 () Bool)

(assert (=> b!607304 (=> (not res!390156) (not e!347774))))

(assert (=> b!607304 (= res!390156 (arrayContainsKey!0 lt!277246 (select (arr!17889 a!2986) j!136) j!136))))

(declare-fun b!607305 () Bool)

(declare-fun res!390149 () Bool)

(assert (=> b!607305 (=> (not res!390149) (not e!347775))))

(assert (=> b!607305 (= res!390149 (validKeyInArray!0 (select (arr!17889 a!2986) j!136)))))

(declare-fun b!607306 () Bool)

(declare-fun e!347770 () Bool)

(assert (=> b!607306 (= e!347772 e!347770)))

(declare-fun res!390158 () Bool)

(assert (=> b!607306 (=> (not res!390158) (not e!347770))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!607306 (= res!390158 (= (select (store (arr!17889 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!607306 (= lt!277246 (array!37278 (store (arr!17889 a!2986) i!1108 k!1786) (size!18253 a!2986)))))

(declare-fun b!607307 () Bool)

(declare-fun res!390142 () Bool)

(assert (=> b!607307 (=> (not res!390142) (not e!347772))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!607307 (= res!390142 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17889 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!607308 () Bool)

(declare-fun Unit!19356 () Unit!19354)

(assert (=> b!607308 (= e!347767 Unit!19356)))

(declare-fun b!607309 () Bool)

(assert (=> b!607309 (= e!347773 e!347771)))

(declare-fun res!390150 () Bool)

(assert (=> b!607309 (=> res!390150 e!347771)))

(assert (=> b!607309 (= res!390150 (or (bvsge (size!18253 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18253 a!2986))))))

(assert (=> b!607309 (arrayContainsKey!0 lt!277246 (select (arr!17889 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277243 () Unit!19354)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37277 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19354)

(assert (=> b!607309 (= lt!277243 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277246 (select (arr!17889 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!347780 () Bool)

(assert (=> b!607309 e!347780))

(declare-fun res!390157 () Bool)

(assert (=> b!607309 (=> (not res!390157) (not e!347780))))

(assert (=> b!607309 (= res!390157 (arrayContainsKey!0 lt!277246 (select (arr!17889 a!2986) j!136) j!136))))

(declare-fun b!607310 () Bool)

(declare-fun e!347778 () Bool)

(assert (=> b!607310 (= e!347778 (not e!347781))))

(declare-fun res!390152 () Bool)

(assert (=> b!607310 (=> res!390152 e!347781)))

(declare-fun lt!277245 () SeekEntryResult!6329)

(assert (=> b!607310 (= res!390152 (not (= lt!277245 (Found!6329 index!984))))))

(declare-fun lt!277248 () Unit!19354)

(declare-fun e!347768 () Unit!19354)

(assert (=> b!607310 (= lt!277248 e!347768)))

(declare-fun c!68948 () Bool)

(assert (=> b!607310 (= c!68948 (= lt!277245 Undefined!6329))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37277 (_ BitVec 32)) SeekEntryResult!6329)

(assert (=> b!607310 (= lt!277245 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277240 lt!277246 mask!3053))))

(assert (=> b!607310 e!347776))

(declare-fun res!390145 () Bool)

(assert (=> b!607310 (=> (not res!390145) (not e!347776))))

(declare-fun lt!277239 () (_ BitVec 32))

(assert (=> b!607310 (= res!390145 (= lt!277249 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277239 vacantSpotIndex!68 lt!277240 lt!277246 mask!3053)))))

(assert (=> b!607310 (= lt!277249 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277239 vacantSpotIndex!68 (select (arr!17889 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!607310 (= lt!277240 (select (store (arr!17889 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!277236 () Unit!19354)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37277 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19354)

(assert (=> b!607310 (= lt!277236 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277239 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!607310 (= lt!277239 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!607311 () Bool)

(declare-fun res!390153 () Bool)

(assert (=> b!607311 (=> (not res!390153) (not e!347775))))

(assert (=> b!607311 (= res!390153 (and (= (size!18253 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18253 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18253 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!607312 () Bool)

(declare-fun res!390155 () Bool)

(assert (=> b!607312 (=> res!390155 e!347771)))

(declare-fun contains!3006 (List!11930 (_ BitVec 64)) Bool)

(assert (=> b!607312 (= res!390155 (contains!3006 Nil!11927 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607313 () Bool)

(assert (=> b!607313 (= e!347780 (arrayContainsKey!0 lt!277246 (select (arr!17889 a!2986) j!136) index!984))))

(declare-fun b!607314 () Bool)

(declare-fun res!390136 () Bool)

(assert (=> b!607314 (=> (not res!390136) (not e!347775))))

(assert (=> b!607314 (= res!390136 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!607315 () Bool)

(declare-fun Unit!19357 () Unit!19354)

(assert (=> b!607315 (= e!347767 Unit!19357)))

(declare-fun lt!277238 () Unit!19354)

(assert (=> b!607315 (= lt!277238 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277246 (select (arr!17889 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!607315 (arrayContainsKey!0 lt!277246 (select (arr!17889 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277234 () Unit!19354)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37277 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11930) Unit!19354)

(assert (=> b!607315 (= lt!277234 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11927))))

(declare-fun arrayNoDuplicates!0 (array!37277 (_ BitVec 32) List!11930) Bool)

(assert (=> b!607315 (arrayNoDuplicates!0 lt!277246 #b00000000000000000000000000000000 Nil!11927)))

(declare-fun lt!277241 () Unit!19354)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37277 (_ BitVec 32) (_ BitVec 32)) Unit!19354)

(assert (=> b!607315 (= lt!277241 (lemmaNoDuplicateFromThenFromBigger!0 lt!277246 #b00000000000000000000000000000000 j!136))))

(assert (=> b!607315 (arrayNoDuplicates!0 lt!277246 j!136 Nil!11927)))

(declare-fun lt!277233 () Unit!19354)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37277 (_ BitVec 64) (_ BitVec 32) List!11930) Unit!19354)

(assert (=> b!607315 (= lt!277233 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277246 (select (arr!17889 a!2986) j!136) j!136 Nil!11927))))

(assert (=> b!607315 false))

(declare-fun b!607316 () Bool)

(declare-fun res!390141 () Bool)

(assert (=> b!607316 (=> res!390141 e!347771)))

(assert (=> b!607316 (= res!390141 (contains!3006 Nil!11927 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607317 () Bool)

(assert (=> b!607317 (= e!347770 e!347778)))

(declare-fun res!390151 () Bool)

(assert (=> b!607317 (=> (not res!390151) (not e!347778))))

(assert (=> b!607317 (= res!390151 (and (= lt!277247 (Found!6329 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17889 a!2986) index!984) (select (arr!17889 a!2986) j!136))) (not (= (select (arr!17889 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!607317 (= lt!277247 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17889 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!607318 () Bool)

(declare-fun Unit!19358 () Unit!19354)

(assert (=> b!607318 (= e!347768 Unit!19358)))

(assert (=> b!607318 false))

(declare-fun b!607319 () Bool)

(declare-fun res!390148 () Bool)

(assert (=> b!607319 (=> (not res!390148) (not e!347772))))

(assert (=> b!607319 (= res!390148 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11927))))

(declare-fun b!607320 () Bool)

(assert (=> b!607320 (= e!347777 e!347779)))

(declare-fun res!390154 () Bool)

(assert (=> b!607320 (=> res!390154 e!347779)))

(assert (=> b!607320 (= res!390154 (or (not (= (select (arr!17889 a!2986) j!136) lt!277240)) (not (= (select (arr!17889 a!2986) j!136) lt!277235)) (bvsge j!136 index!984)))))

(declare-fun b!607303 () Bool)

(assert (=> b!607303 (= e!347771 true)))

(declare-fun lt!277244 () Bool)

(assert (=> b!607303 (= lt!277244 (contains!3006 Nil!11927 k!1786))))

(declare-fun res!390139 () Bool)

(assert (=> start!55546 (=> (not res!390139) (not e!347775))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55546 (= res!390139 (validMask!0 mask!3053))))

(assert (=> start!55546 e!347775))

(assert (=> start!55546 true))

(declare-fun array_inv!13685 (array!37277) Bool)

(assert (=> start!55546 (array_inv!13685 a!2986)))

(declare-fun b!607321 () Bool)

(declare-fun res!390143 () Bool)

(assert (=> b!607321 (=> (not res!390143) (not e!347772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37277 (_ BitVec 32)) Bool)

(assert (=> b!607321 (= res!390143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!607322 () Bool)

(declare-fun Unit!19359 () Unit!19354)

(assert (=> b!607322 (= e!347768 Unit!19359)))

(assert (= (and start!55546 res!390139) b!607311))

(assert (= (and b!607311 res!390153) b!607305))

(assert (= (and b!607305 res!390149) b!607297))

(assert (= (and b!607297 res!390137) b!607314))

(assert (= (and b!607314 res!390136) b!607299))

(assert (= (and b!607299 res!390146) b!607321))

(assert (= (and b!607321 res!390143) b!607319))

(assert (= (and b!607319 res!390148) b!607307))

(assert (= (and b!607307 res!390142) b!607306))

(assert (= (and b!607306 res!390158) b!607317))

(assert (= (and b!607317 res!390151) b!607310))

(assert (= (and b!607310 res!390145) b!607298))

(assert (= (and b!607310 c!68948) b!607318))

(assert (= (and b!607310 (not c!68948)) b!607322))

(assert (= (and b!607310 (not res!390152)) b!607300))

(assert (= (and b!607300 res!390144) b!607320))

(assert (= (and b!607320 (not res!390154)) b!607304))

(assert (= (and b!607304 res!390156) b!607302))

(assert (= (and b!607300 (not res!390147)) b!607301))

(assert (= (and b!607301 c!68947) b!607315))

(assert (= (and b!607301 (not c!68947)) b!607308))

(assert (= (and b!607301 (not res!390138)) b!607309))

(assert (= (and b!607309 res!390157) b!607313))

(assert (= (and b!607309 (not res!390150)) b!607296))

(assert (= (and b!607296 (not res!390140)) b!607316))

(assert (= (and b!607316 (not res!390141)) b!607312))

(assert (= (and b!607312 (not res!390155)) b!607303))

(declare-fun m!584051 () Bool)

(assert (=> b!607296 m!584051))

(declare-fun m!584053 () Bool)

(assert (=> b!607319 m!584053))

(declare-fun m!584055 () Bool)

(assert (=> b!607309 m!584055))

(assert (=> b!607309 m!584055))

(declare-fun m!584057 () Bool)

(assert (=> b!607309 m!584057))

(assert (=> b!607309 m!584055))

(declare-fun m!584059 () Bool)

(assert (=> b!607309 m!584059))

(assert (=> b!607309 m!584055))

(declare-fun m!584061 () Bool)

(assert (=> b!607309 m!584061))

(declare-fun m!584063 () Bool)

(assert (=> b!607303 m!584063))

(declare-fun m!584065 () Bool)

(assert (=> b!607317 m!584065))

(assert (=> b!607317 m!584055))

(assert (=> b!607317 m!584055))

(declare-fun m!584067 () Bool)

(assert (=> b!607317 m!584067))

(declare-fun m!584069 () Bool)

(assert (=> b!607297 m!584069))

(declare-fun m!584071 () Bool)

(assert (=> b!607312 m!584071))

(assert (=> b!607302 m!584055))

(assert (=> b!607302 m!584055))

(declare-fun m!584073 () Bool)

(assert (=> b!607302 m!584073))

(declare-fun m!584075 () Bool)

(assert (=> b!607307 m!584075))

(declare-fun m!584077 () Bool)

(assert (=> b!607316 m!584077))

(assert (=> b!607315 m!584055))

(assert (=> b!607315 m!584055))

(declare-fun m!584079 () Bool)

(assert (=> b!607315 m!584079))

(assert (=> b!607315 m!584055))

(declare-fun m!584081 () Bool)

(assert (=> b!607315 m!584081))

(declare-fun m!584083 () Bool)

(assert (=> b!607315 m!584083))

(declare-fun m!584085 () Bool)

(assert (=> b!607315 m!584085))

(assert (=> b!607315 m!584055))

(declare-fun m!584087 () Bool)

(assert (=> b!607315 m!584087))

(declare-fun m!584089 () Bool)

(assert (=> b!607315 m!584089))

(declare-fun m!584091 () Bool)

(assert (=> b!607315 m!584091))

(declare-fun m!584093 () Bool)

(assert (=> b!607314 m!584093))

(declare-fun m!584095 () Bool)

(assert (=> b!607321 m!584095))

(assert (=> b!607320 m!584055))

(declare-fun m!584097 () Bool)

(assert (=> b!607299 m!584097))

(declare-fun m!584099 () Bool)

(assert (=> b!607310 m!584099))

(declare-fun m!584101 () Bool)

(assert (=> b!607310 m!584101))

(assert (=> b!607310 m!584055))

(declare-fun m!584103 () Bool)

(assert (=> b!607310 m!584103))

(declare-fun m!584105 () Bool)

(assert (=> b!607310 m!584105))

(declare-fun m!584107 () Bool)

(assert (=> b!607310 m!584107))

(assert (=> b!607310 m!584055))

(declare-fun m!584109 () Bool)

(assert (=> b!607310 m!584109))

(declare-fun m!584111 () Bool)

(assert (=> b!607310 m!584111))

(assert (=> b!607306 m!584103))

(declare-fun m!584113 () Bool)

(assert (=> b!607306 m!584113))

(assert (=> b!607304 m!584055))

(assert (=> b!607304 m!584055))

(assert (=> b!607304 m!584061))

(assert (=> b!607300 m!584055))

(assert (=> b!607300 m!584103))

(declare-fun m!584115 () Bool)

(assert (=> b!607300 m!584115))

(assert (=> b!607313 m!584055))

(assert (=> b!607313 m!584055))

(assert (=> b!607313 m!584073))

(declare-fun m!584117 () Bool)

(assert (=> start!55546 m!584117))

(declare-fun m!584119 () Bool)

(assert (=> start!55546 m!584119))

(assert (=> b!607305 m!584055))

(assert (=> b!607305 m!584055))

(declare-fun m!584121 () Bool)

(assert (=> b!607305 m!584121))

(push 1)

