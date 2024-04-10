; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55250 () Bool)

(assert start!55250)

(declare-fun b!605260 () Bool)

(declare-fun e!346410 () Bool)

(declare-fun e!346403 () Bool)

(assert (=> b!605260 (= e!346410 (not e!346403))))

(declare-fun res!388893 () Bool)

(assert (=> b!605260 (=> res!388893 e!346403)))

(declare-datatypes ((SeekEntryResult!6316 0))(
  ( (MissingZero!6316 (index!27530 (_ BitVec 32))) (Found!6316 (index!27531 (_ BitVec 32))) (Intermediate!6316 (undefined!7128 Bool) (index!27532 (_ BitVec 32)) (x!56326 (_ BitVec 32))) (Undefined!6316) (MissingVacant!6316 (index!27533 (_ BitVec 32))) )
))
(declare-fun lt!276160 () SeekEntryResult!6316)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!605260 (= res!388893 (not (= lt!276160 (Found!6316 index!984))))))

(declare-datatypes ((Unit!19276 0))(
  ( (Unit!19277) )
))
(declare-fun lt!276154 () Unit!19276)

(declare-fun e!346404 () Unit!19276)

(assert (=> b!605260 (= lt!276154 e!346404)))

(declare-fun c!68554 () Bool)

(assert (=> b!605260 (= c!68554 (= lt!276160 Undefined!6316))))

(declare-fun lt!276148 () (_ BitVec 64))

(declare-datatypes ((array!37242 0))(
  ( (array!37243 (arr!17876 (Array (_ BitVec 32) (_ BitVec 64))) (size!18240 (_ BitVec 32))) )
))
(declare-fun lt!276153 () array!37242)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37242 (_ BitVec 32)) SeekEntryResult!6316)

(assert (=> b!605260 (= lt!276160 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276148 lt!276153 mask!3053))))

(declare-fun e!346408 () Bool)

(assert (=> b!605260 e!346408))

(declare-fun res!388903 () Bool)

(assert (=> b!605260 (=> (not res!388903) (not e!346408))))

(declare-fun lt!276159 () (_ BitVec 32))

(declare-fun lt!276145 () SeekEntryResult!6316)

(assert (=> b!605260 (= res!388903 (= lt!276145 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276159 vacantSpotIndex!68 lt!276148 lt!276153 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37242)

(assert (=> b!605260 (= lt!276145 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276159 vacantSpotIndex!68 (select (arr!17876 a!2986) j!136) a!2986 mask!3053))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!605260 (= lt!276148 (select (store (arr!17876 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!276150 () Unit!19276)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37242 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19276)

(assert (=> b!605260 (= lt!276150 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276159 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!605260 (= lt!276159 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!605261 () Bool)

(declare-fun res!388888 () Bool)

(declare-fun e!346409 () Bool)

(assert (=> b!605261 (=> (not res!388888) (not e!346409))))

(assert (=> b!605261 (= res!388888 (and (= (size!18240 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18240 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18240 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!605262 () Bool)

(declare-fun res!388895 () Bool)

(declare-fun e!346402 () Bool)

(assert (=> b!605262 (=> (not res!388895) (not e!346402))))

(assert (=> b!605262 (= res!388895 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17876 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!605263 () Bool)

(declare-fun e!346401 () Bool)

(assert (=> b!605263 (= e!346403 e!346401)))

(declare-fun res!388892 () Bool)

(assert (=> b!605263 (=> res!388892 e!346401)))

(declare-fun lt!276147 () (_ BitVec 64))

(assert (=> b!605263 (= res!388892 (or (not (= (select (arr!17876 a!2986) j!136) lt!276148)) (not (= (select (arr!17876 a!2986) j!136) lt!276147))))))

(declare-fun e!346400 () Bool)

(assert (=> b!605263 e!346400))

(declare-fun res!388887 () Bool)

(assert (=> b!605263 (=> (not res!388887) (not e!346400))))

(assert (=> b!605263 (= res!388887 (= lt!276147 (select (arr!17876 a!2986) j!136)))))

(assert (=> b!605263 (= lt!276147 (select (store (arr!17876 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!605264 () Bool)

(declare-fun res!388896 () Bool)

(assert (=> b!605264 (=> (not res!388896) (not e!346409))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!605264 (= res!388896 (validKeyInArray!0 k!1786))))

(declare-fun b!605265 () Bool)

(declare-fun e!346406 () Bool)

(declare-fun e!346412 () Bool)

(assert (=> b!605265 (= e!346406 e!346412)))

(declare-fun res!388889 () Bool)

(assert (=> b!605265 (=> (not res!388889) (not e!346412))))

(declare-fun arrayContainsKey!0 (array!37242 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!605265 (= res!388889 (arrayContainsKey!0 lt!276153 (select (arr!17876 a!2986) j!136) j!136))))

(declare-fun b!605267 () Bool)

(declare-fun res!388894 () Bool)

(assert (=> b!605267 (=> (not res!388894) (not e!346409))))

(assert (=> b!605267 (= res!388894 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!605268 () Bool)

(declare-fun e!346413 () Bool)

(assert (=> b!605268 (= e!346401 e!346413)))

(declare-fun res!388904 () Bool)

(assert (=> b!605268 (=> res!388904 e!346413)))

(assert (=> b!605268 (= res!388904 (bvsge index!984 j!136))))

(declare-fun lt!276158 () Unit!19276)

(declare-fun e!346407 () Unit!19276)

(assert (=> b!605268 (= lt!276158 e!346407)))

(declare-fun c!68555 () Bool)

(assert (=> b!605268 (= c!68555 (bvslt j!136 index!984))))

(declare-fun e!346405 () Bool)

(declare-fun b!605269 () Bool)

(assert (=> b!605269 (= e!346405 (arrayContainsKey!0 lt!276153 (select (arr!17876 a!2986) j!136) index!984))))

(declare-fun b!605270 () Bool)

(assert (=> b!605270 (= e!346412 (arrayContainsKey!0 lt!276153 (select (arr!17876 a!2986) j!136) index!984))))

(declare-fun b!605271 () Bool)

(declare-fun e!346411 () Bool)

(assert (=> b!605271 (= e!346411 e!346410)))

(declare-fun res!388886 () Bool)

(assert (=> b!605271 (=> (not res!388886) (not e!346410))))

(declare-fun lt!276156 () SeekEntryResult!6316)

(assert (=> b!605271 (= res!388886 (and (= lt!276156 (Found!6316 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17876 a!2986) index!984) (select (arr!17876 a!2986) j!136))) (not (= (select (arr!17876 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!605271 (= lt!276156 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17876 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!605272 () Bool)

(declare-fun Unit!19278 () Unit!19276)

(assert (=> b!605272 (= e!346404 Unit!19278)))

(declare-fun b!605273 () Bool)

(declare-fun Unit!19279 () Unit!19276)

(assert (=> b!605273 (= e!346404 Unit!19279)))

(assert (=> b!605273 false))

(declare-fun b!605274 () Bool)

(declare-fun res!388900 () Bool)

(assert (=> b!605274 (=> (not res!388900) (not e!346409))))

(assert (=> b!605274 (= res!388900 (validKeyInArray!0 (select (arr!17876 a!2986) j!136)))))

(declare-fun b!605275 () Bool)

(declare-fun res!388899 () Bool)

(assert (=> b!605275 (=> (not res!388899) (not e!346402))))

(declare-datatypes ((List!11917 0))(
  ( (Nil!11914) (Cons!11913 (h!12958 (_ BitVec 64)) (t!18145 List!11917)) )
))
(declare-fun arrayNoDuplicates!0 (array!37242 (_ BitVec 32) List!11917) Bool)

(assert (=> b!605275 (= res!388899 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11914))))

(declare-fun b!605276 () Bool)

(assert (=> b!605276 (= e!346408 (= lt!276156 lt!276145))))

(declare-fun b!605277 () Bool)

(assert (=> b!605277 (= e!346413 (bvsle #b00000000000000000000000000000000 (size!18240 a!2986)))))

(assert (=> b!605277 (arrayContainsKey!0 lt!276153 (select (arr!17876 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276155 () Unit!19276)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37242 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19276)

(assert (=> b!605277 (= lt!276155 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276153 (select (arr!17876 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!605277 e!346405))

(declare-fun res!388902 () Bool)

(assert (=> b!605277 (=> (not res!388902) (not e!346405))))

(assert (=> b!605277 (= res!388902 (arrayContainsKey!0 lt!276153 (select (arr!17876 a!2986) j!136) j!136))))

(declare-fun b!605278 () Bool)

(declare-fun res!388891 () Bool)

(assert (=> b!605278 (=> (not res!388891) (not e!346402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37242 (_ BitVec 32)) Bool)

(assert (=> b!605278 (= res!388891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!388897 () Bool)

(assert (=> start!55250 (=> (not res!388897) (not e!346409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55250 (= res!388897 (validMask!0 mask!3053))))

(assert (=> start!55250 e!346409))

(assert (=> start!55250 true))

(declare-fun array_inv!13672 (array!37242) Bool)

(assert (=> start!55250 (array_inv!13672 a!2986)))

(declare-fun b!605266 () Bool)

(assert (=> b!605266 (= e!346402 e!346411)))

(declare-fun res!388898 () Bool)

(assert (=> b!605266 (=> (not res!388898) (not e!346411))))

(assert (=> b!605266 (= res!388898 (= (select (store (arr!17876 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!605266 (= lt!276153 (array!37243 (store (arr!17876 a!2986) i!1108 k!1786) (size!18240 a!2986)))))

(declare-fun b!605279 () Bool)

(assert (=> b!605279 (= e!346400 e!346406)))

(declare-fun res!388890 () Bool)

(assert (=> b!605279 (=> res!388890 e!346406)))

(assert (=> b!605279 (= res!388890 (or (not (= (select (arr!17876 a!2986) j!136) lt!276148)) (not (= (select (arr!17876 a!2986) j!136) lt!276147)) (bvsge j!136 index!984)))))

(declare-fun b!605280 () Bool)

(declare-fun Unit!19280 () Unit!19276)

(assert (=> b!605280 (= e!346407 Unit!19280)))

(declare-fun lt!276151 () Unit!19276)

(assert (=> b!605280 (= lt!276151 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276153 (select (arr!17876 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!605280 (arrayContainsKey!0 lt!276153 (select (arr!17876 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276146 () Unit!19276)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37242 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11917) Unit!19276)

(assert (=> b!605280 (= lt!276146 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11914))))

(assert (=> b!605280 (arrayNoDuplicates!0 lt!276153 #b00000000000000000000000000000000 Nil!11914)))

(declare-fun lt!276157 () Unit!19276)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37242 (_ BitVec 32) (_ BitVec 32)) Unit!19276)

(assert (=> b!605280 (= lt!276157 (lemmaNoDuplicateFromThenFromBigger!0 lt!276153 #b00000000000000000000000000000000 j!136))))

(assert (=> b!605280 (arrayNoDuplicates!0 lt!276153 j!136 Nil!11914)))

(declare-fun lt!276152 () Unit!19276)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37242 (_ BitVec 64) (_ BitVec 32) List!11917) Unit!19276)

(assert (=> b!605280 (= lt!276152 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276153 (select (arr!17876 a!2986) j!136) j!136 Nil!11914))))

(assert (=> b!605280 false))

(declare-fun b!605281 () Bool)

(assert (=> b!605281 (= e!346409 e!346402)))

(declare-fun res!388901 () Bool)

(assert (=> b!605281 (=> (not res!388901) (not e!346402))))

(declare-fun lt!276149 () SeekEntryResult!6316)

(assert (=> b!605281 (= res!388901 (or (= lt!276149 (MissingZero!6316 i!1108)) (= lt!276149 (MissingVacant!6316 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37242 (_ BitVec 32)) SeekEntryResult!6316)

(assert (=> b!605281 (= lt!276149 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!605282 () Bool)

(declare-fun Unit!19281 () Unit!19276)

(assert (=> b!605282 (= e!346407 Unit!19281)))

(assert (= (and start!55250 res!388897) b!605261))

(assert (= (and b!605261 res!388888) b!605274))

(assert (= (and b!605274 res!388900) b!605264))

(assert (= (and b!605264 res!388896) b!605267))

(assert (= (and b!605267 res!388894) b!605281))

(assert (= (and b!605281 res!388901) b!605278))

(assert (= (and b!605278 res!388891) b!605275))

(assert (= (and b!605275 res!388899) b!605262))

(assert (= (and b!605262 res!388895) b!605266))

(assert (= (and b!605266 res!388898) b!605271))

(assert (= (and b!605271 res!388886) b!605260))

(assert (= (and b!605260 res!388903) b!605276))

(assert (= (and b!605260 c!68554) b!605273))

(assert (= (and b!605260 (not c!68554)) b!605272))

(assert (= (and b!605260 (not res!388893)) b!605263))

(assert (= (and b!605263 res!388887) b!605279))

(assert (= (and b!605279 (not res!388890)) b!605265))

(assert (= (and b!605265 res!388889) b!605270))

(assert (= (and b!605263 (not res!388892)) b!605268))

(assert (= (and b!605268 c!68555) b!605280))

(assert (= (and b!605268 (not c!68555)) b!605282))

(assert (= (and b!605268 (not res!388904)) b!605277))

(assert (= (and b!605277 res!388902) b!605269))

(declare-fun m!582127 () Bool)

(assert (=> b!605271 m!582127))

(declare-fun m!582129 () Bool)

(assert (=> b!605271 m!582129))

(assert (=> b!605271 m!582129))

(declare-fun m!582131 () Bool)

(assert (=> b!605271 m!582131))

(assert (=> b!605274 m!582129))

(assert (=> b!605274 m!582129))

(declare-fun m!582133 () Bool)

(assert (=> b!605274 m!582133))

(declare-fun m!582135 () Bool)

(assert (=> b!605267 m!582135))

(declare-fun m!582137 () Bool)

(assert (=> b!605275 m!582137))

(declare-fun m!582139 () Bool)

(assert (=> b!605278 m!582139))

(declare-fun m!582141 () Bool)

(assert (=> b!605262 m!582141))

(assert (=> b!605263 m!582129))

(declare-fun m!582143 () Bool)

(assert (=> b!605263 m!582143))

(declare-fun m!582145 () Bool)

(assert (=> b!605263 m!582145))

(assert (=> b!605270 m!582129))

(assert (=> b!605270 m!582129))

(declare-fun m!582147 () Bool)

(assert (=> b!605270 m!582147))

(assert (=> b!605265 m!582129))

(assert (=> b!605265 m!582129))

(declare-fun m!582149 () Bool)

(assert (=> b!605265 m!582149))

(assert (=> b!605260 m!582129))

(declare-fun m!582151 () Bool)

(assert (=> b!605260 m!582151))

(declare-fun m!582153 () Bool)

(assert (=> b!605260 m!582153))

(declare-fun m!582155 () Bool)

(assert (=> b!605260 m!582155))

(assert (=> b!605260 m!582129))

(assert (=> b!605260 m!582143))

(declare-fun m!582157 () Bool)

(assert (=> b!605260 m!582157))

(declare-fun m!582159 () Bool)

(assert (=> b!605260 m!582159))

(declare-fun m!582161 () Bool)

(assert (=> b!605260 m!582161))

(assert (=> b!605277 m!582129))

(assert (=> b!605277 m!582129))

(declare-fun m!582163 () Bool)

(assert (=> b!605277 m!582163))

(assert (=> b!605277 m!582129))

(declare-fun m!582165 () Bool)

(assert (=> b!605277 m!582165))

(assert (=> b!605277 m!582129))

(assert (=> b!605277 m!582149))

(assert (=> b!605280 m!582129))

(declare-fun m!582167 () Bool)

(assert (=> b!605280 m!582167))

(assert (=> b!605280 m!582129))

(assert (=> b!605280 m!582129))

(declare-fun m!582169 () Bool)

(assert (=> b!605280 m!582169))

(declare-fun m!582171 () Bool)

(assert (=> b!605280 m!582171))

(declare-fun m!582173 () Bool)

(assert (=> b!605280 m!582173))

(declare-fun m!582175 () Bool)

(assert (=> b!605280 m!582175))

(assert (=> b!605280 m!582129))

(declare-fun m!582177 () Bool)

(assert (=> b!605280 m!582177))

(declare-fun m!582179 () Bool)

(assert (=> b!605280 m!582179))

(assert (=> b!605266 m!582143))

(declare-fun m!582181 () Bool)

(assert (=> b!605266 m!582181))

(declare-fun m!582183 () Bool)

(assert (=> b!605281 m!582183))

(declare-fun m!582185 () Bool)

(assert (=> start!55250 m!582185))

(declare-fun m!582187 () Bool)

(assert (=> start!55250 m!582187))

(assert (=> b!605279 m!582129))

(assert (=> b!605269 m!582129))

(assert (=> b!605269 m!582129))

(assert (=> b!605269 m!582147))

(declare-fun m!582189 () Bool)

(assert (=> b!605264 m!582189))

(push 1)

