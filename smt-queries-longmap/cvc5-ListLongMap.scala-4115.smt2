; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56188 () Bool)

(assert start!56188)

(declare-fun b!622281 () Bool)

(declare-datatypes ((Unit!20878 0))(
  ( (Unit!20879) )
))
(declare-fun e!356930 () Unit!20878)

(declare-fun Unit!20880 () Unit!20878)

(assert (=> b!622281 (= e!356930 Unit!20880)))

(declare-fun b!622282 () Bool)

(declare-fun res!401036 () Bool)

(declare-fun e!356931 () Bool)

(assert (=> b!622282 (=> (not res!401036) (not e!356931))))

(declare-datatypes ((array!37658 0))(
  ( (array!37659 (arr!18075 (Array (_ BitVec 32) (_ BitVec 64))) (size!18439 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37658)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!622282 (= res!401036 (validKeyInArray!0 (select (arr!18075 a!2986) j!136)))))

(declare-fun b!622283 () Bool)

(declare-fun e!356922 () Unit!20878)

(declare-fun Unit!20881 () Unit!20878)

(assert (=> b!622283 (= e!356922 Unit!20881)))

(declare-fun b!622284 () Bool)

(declare-fun e!356928 () Unit!20878)

(declare-fun Unit!20882 () Unit!20878)

(assert (=> b!622284 (= e!356928 Unit!20882)))

(declare-fun b!622285 () Bool)

(declare-fun res!401031 () Bool)

(assert (=> b!622285 (=> (not res!401031) (not e!356931))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!622285 (= res!401031 (and (= (size!18439 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18439 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18439 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!622286 () Bool)

(assert (=> b!622286 false))

(declare-fun lt!288268 () array!37658)

(declare-fun lt!288261 () Unit!20878)

(declare-datatypes ((List!12116 0))(
  ( (Nil!12113) (Cons!12112 (h!13157 (_ BitVec 64)) (t!18344 List!12116)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37658 (_ BitVec 64) (_ BitVec 32) List!12116) Unit!20878)

(assert (=> b!622286 (= lt!288261 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288268 (select (arr!18075 a!2986) j!136) j!136 Nil!12113))))

(declare-fun arrayNoDuplicates!0 (array!37658 (_ BitVec 32) List!12116) Bool)

(assert (=> b!622286 (arrayNoDuplicates!0 lt!288268 j!136 Nil!12113)))

(declare-fun lt!288267 () Unit!20878)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37658 (_ BitVec 32) (_ BitVec 32)) Unit!20878)

(assert (=> b!622286 (= lt!288267 (lemmaNoDuplicateFromThenFromBigger!0 lt!288268 #b00000000000000000000000000000000 j!136))))

(assert (=> b!622286 (arrayNoDuplicates!0 lt!288268 #b00000000000000000000000000000000 Nil!12113)))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!288274 () Unit!20878)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37658 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12116) Unit!20878)

(assert (=> b!622286 (= lt!288274 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12113))))

(declare-fun arrayContainsKey!0 (array!37658 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!622286 (arrayContainsKey!0 lt!288268 (select (arr!18075 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288264 () Unit!20878)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37658 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20878)

(assert (=> b!622286 (= lt!288264 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288268 (select (arr!18075 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!356926 () Unit!20878)

(declare-fun Unit!20883 () Unit!20878)

(assert (=> b!622286 (= e!356926 Unit!20883)))

(declare-fun b!622287 () Bool)

(declare-fun e!356927 () Bool)

(declare-fun e!356925 () Bool)

(assert (=> b!622287 (= e!356927 e!356925)))

(declare-fun res!401030 () Bool)

(assert (=> b!622287 (=> (not res!401030) (not e!356925))))

(declare-datatypes ((SeekEntryResult!6515 0))(
  ( (MissingZero!6515 (index!28344 (_ BitVec 32))) (Found!6515 (index!28345 (_ BitVec 32))) (Intermediate!6515 (undefined!7327 Bool) (index!28346 (_ BitVec 32)) (x!57115 (_ BitVec 32))) (Undefined!6515) (MissingVacant!6515 (index!28347 (_ BitVec 32))) )
))
(declare-fun lt!288272 () SeekEntryResult!6515)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!622287 (= res!401030 (and (= lt!288272 (Found!6515 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18075 a!2986) index!984) (select (arr!18075 a!2986) j!136))) (not (= (select (arr!18075 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37658 (_ BitVec 32)) SeekEntryResult!6515)

(assert (=> b!622287 (= lt!288272 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18075 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!622288 () Bool)

(declare-fun e!356923 () Bool)

(assert (=> b!622288 (= e!356931 e!356923)))

(declare-fun res!401040 () Bool)

(assert (=> b!622288 (=> (not res!401040) (not e!356923))))

(declare-fun lt!288259 () SeekEntryResult!6515)

(assert (=> b!622288 (= res!401040 (or (= lt!288259 (MissingZero!6515 i!1108)) (= lt!288259 (MissingVacant!6515 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37658 (_ BitVec 32)) SeekEntryResult!6515)

(assert (=> b!622288 (= lt!288259 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!622289 () Bool)

(assert (=> b!622289 false))

(declare-fun lt!288266 () Unit!20878)

(assert (=> b!622289 (= lt!288266 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288268 (select (arr!18075 a!2986) j!136) index!984 Nil!12113))))

(assert (=> b!622289 (arrayNoDuplicates!0 lt!288268 index!984 Nil!12113)))

(declare-fun lt!288262 () Unit!20878)

(assert (=> b!622289 (= lt!288262 (lemmaNoDuplicateFromThenFromBigger!0 lt!288268 #b00000000000000000000000000000000 index!984))))

(assert (=> b!622289 (arrayNoDuplicates!0 lt!288268 #b00000000000000000000000000000000 Nil!12113)))

(declare-fun lt!288269 () Unit!20878)

(assert (=> b!622289 (= lt!288269 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12113))))

(assert (=> b!622289 (arrayContainsKey!0 lt!288268 (select (arr!18075 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288276 () Unit!20878)

(assert (=> b!622289 (= lt!288276 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288268 (select (arr!18075 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!356933 () Bool)

(assert (=> b!622289 e!356933))

(declare-fun res!401037 () Bool)

(assert (=> b!622289 (=> (not res!401037) (not e!356933))))

(assert (=> b!622289 (= res!401037 (arrayContainsKey!0 lt!288268 (select (arr!18075 a!2986) j!136) j!136))))

(declare-fun Unit!20884 () Unit!20878)

(assert (=> b!622289 (= e!356930 Unit!20884)))

(declare-fun b!622290 () Bool)

(declare-fun res!401034 () Bool)

(assert (=> b!622290 (=> (not res!401034) (not e!356923))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37658 (_ BitVec 32)) Bool)

(assert (=> b!622290 (= res!401034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!401032 () Bool)

(assert (=> start!56188 (=> (not res!401032) (not e!356931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56188 (= res!401032 (validMask!0 mask!3053))))

(assert (=> start!56188 e!356931))

(assert (=> start!56188 true))

(declare-fun array_inv!13871 (array!37658) Bool)

(assert (=> start!56188 (array_inv!13871 a!2986)))

(declare-fun b!622291 () Bool)

(declare-fun Unit!20885 () Unit!20878)

(assert (=> b!622291 (= e!356928 Unit!20885)))

(assert (=> b!622291 false))

(declare-fun b!622292 () Bool)

(declare-fun res!401029 () Bool)

(assert (=> b!622292 (=> (not res!401029) (not e!356931))))

(assert (=> b!622292 (= res!401029 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!622293 () Bool)

(assert (=> b!622293 (= e!356925 (not true))))

(declare-fun lt!288277 () Unit!20878)

(assert (=> b!622293 (= lt!288277 e!356922)))

(declare-fun c!70994 () Bool)

(declare-fun lt!288275 () SeekEntryResult!6515)

(assert (=> b!622293 (= c!70994 (= lt!288275 (Found!6515 index!984)))))

(declare-fun lt!288265 () Unit!20878)

(assert (=> b!622293 (= lt!288265 e!356928)))

(declare-fun c!70996 () Bool)

(assert (=> b!622293 (= c!70996 (= lt!288275 Undefined!6515))))

(declare-fun lt!288273 () (_ BitVec 64))

(assert (=> b!622293 (= lt!288275 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288273 lt!288268 mask!3053))))

(declare-fun e!356924 () Bool)

(assert (=> b!622293 e!356924))

(declare-fun res!401035 () Bool)

(assert (=> b!622293 (=> (not res!401035) (not e!356924))))

(declare-fun lt!288260 () SeekEntryResult!6515)

(declare-fun lt!288271 () (_ BitVec 32))

(assert (=> b!622293 (= res!401035 (= lt!288260 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288271 vacantSpotIndex!68 lt!288273 lt!288268 mask!3053)))))

(assert (=> b!622293 (= lt!288260 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288271 vacantSpotIndex!68 (select (arr!18075 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!622293 (= lt!288273 (select (store (arr!18075 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!288270 () Unit!20878)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37658 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20878)

(assert (=> b!622293 (= lt!288270 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288271 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!622293 (= lt!288271 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!622294 () Bool)

(assert (=> b!622294 (= e!356924 (= lt!288272 lt!288260))))

(declare-fun b!622295 () Bool)

(assert (=> b!622295 (= e!356933 (arrayContainsKey!0 lt!288268 (select (arr!18075 a!2986) j!136) index!984))))

(declare-fun b!622296 () Bool)

(declare-fun res!401028 () Bool)

(assert (=> b!622296 (=> (not res!401028) (not e!356923))))

(assert (=> b!622296 (= res!401028 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12113))))

(declare-fun b!622297 () Bool)

(declare-fun res!401038 () Bool)

(assert (=> b!622297 (= res!401038 (bvsge j!136 index!984))))

(declare-fun e!356929 () Bool)

(assert (=> b!622297 (=> res!401038 e!356929)))

(declare-fun e!356921 () Bool)

(assert (=> b!622297 (= e!356921 e!356929)))

(declare-fun b!622298 () Bool)

(declare-fun res!401027 () Bool)

(assert (=> b!622298 (=> (not res!401027) (not e!356931))))

(assert (=> b!622298 (= res!401027 (validKeyInArray!0 k!1786))))

(declare-fun b!622299 () Bool)

(declare-fun res!401042 () Bool)

(assert (=> b!622299 (=> (not res!401042) (not e!356923))))

(assert (=> b!622299 (= res!401042 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18075 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!622300 () Bool)

(declare-fun res!401041 () Bool)

(assert (=> b!622300 (= res!401041 (arrayContainsKey!0 lt!288268 (select (arr!18075 a!2986) j!136) j!136))))

(declare-fun e!356934 () Bool)

(assert (=> b!622300 (=> (not res!401041) (not e!356934))))

(assert (=> b!622300 (= e!356929 e!356934)))

(declare-fun b!622301 () Bool)

(declare-fun Unit!20886 () Unit!20878)

(assert (=> b!622301 (= e!356922 Unit!20886)))

(declare-fun res!401039 () Bool)

(assert (=> b!622301 (= res!401039 (= (select (store (arr!18075 a!2986) i!1108 k!1786) index!984) (select (arr!18075 a!2986) j!136)))))

(assert (=> b!622301 (=> (not res!401039) (not e!356921))))

(assert (=> b!622301 e!356921))

(declare-fun c!70995 () Bool)

(assert (=> b!622301 (= c!70995 (bvslt j!136 index!984))))

(declare-fun lt!288258 () Unit!20878)

(assert (=> b!622301 (= lt!288258 e!356926)))

(declare-fun c!70997 () Bool)

(assert (=> b!622301 (= c!70997 (bvslt index!984 j!136))))

(declare-fun lt!288263 () Unit!20878)

(assert (=> b!622301 (= lt!288263 e!356930)))

(assert (=> b!622301 false))

(declare-fun b!622302 () Bool)

(assert (=> b!622302 (= e!356923 e!356927)))

(declare-fun res!401033 () Bool)

(assert (=> b!622302 (=> (not res!401033) (not e!356927))))

(assert (=> b!622302 (= res!401033 (= (select (store (arr!18075 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!622302 (= lt!288268 (array!37659 (store (arr!18075 a!2986) i!1108 k!1786) (size!18439 a!2986)))))

(declare-fun b!622303 () Bool)

(assert (=> b!622303 (= e!356934 (arrayContainsKey!0 lt!288268 (select (arr!18075 a!2986) j!136) index!984))))

(declare-fun b!622304 () Bool)

(declare-fun Unit!20887 () Unit!20878)

(assert (=> b!622304 (= e!356926 Unit!20887)))

(assert (= (and start!56188 res!401032) b!622285))

(assert (= (and b!622285 res!401031) b!622282))

(assert (= (and b!622282 res!401036) b!622298))

(assert (= (and b!622298 res!401027) b!622292))

(assert (= (and b!622292 res!401029) b!622288))

(assert (= (and b!622288 res!401040) b!622290))

(assert (= (and b!622290 res!401034) b!622296))

(assert (= (and b!622296 res!401028) b!622299))

(assert (= (and b!622299 res!401042) b!622302))

(assert (= (and b!622302 res!401033) b!622287))

(assert (= (and b!622287 res!401030) b!622293))

(assert (= (and b!622293 res!401035) b!622294))

(assert (= (and b!622293 c!70996) b!622291))

(assert (= (and b!622293 (not c!70996)) b!622284))

(assert (= (and b!622293 c!70994) b!622301))

(assert (= (and b!622293 (not c!70994)) b!622283))

(assert (= (and b!622301 res!401039) b!622297))

(assert (= (and b!622297 (not res!401038)) b!622300))

(assert (= (and b!622300 res!401041) b!622303))

(assert (= (and b!622301 c!70995) b!622286))

(assert (= (and b!622301 (not c!70995)) b!622304))

(assert (= (and b!622301 c!70997) b!622289))

(assert (= (and b!622301 (not c!70997)) b!622281))

(assert (= (and b!622289 res!401037) b!622295))

(declare-fun m!598151 () Bool)

(assert (=> b!622282 m!598151))

(assert (=> b!622282 m!598151))

(declare-fun m!598153 () Bool)

(assert (=> b!622282 m!598153))

(declare-fun m!598155 () Bool)

(assert (=> b!622301 m!598155))

(declare-fun m!598157 () Bool)

(assert (=> b!622301 m!598157))

(assert (=> b!622301 m!598151))

(declare-fun m!598159 () Bool)

(assert (=> b!622299 m!598159))

(declare-fun m!598161 () Bool)

(assert (=> start!56188 m!598161))

(declare-fun m!598163 () Bool)

(assert (=> start!56188 m!598163))

(assert (=> b!622300 m!598151))

(assert (=> b!622300 m!598151))

(declare-fun m!598165 () Bool)

(assert (=> b!622300 m!598165))

(declare-fun m!598167 () Bool)

(assert (=> b!622287 m!598167))

(assert (=> b!622287 m!598151))

(assert (=> b!622287 m!598151))

(declare-fun m!598169 () Bool)

(assert (=> b!622287 m!598169))

(declare-fun m!598171 () Bool)

(assert (=> b!622292 m!598171))

(assert (=> b!622295 m!598151))

(assert (=> b!622295 m!598151))

(declare-fun m!598173 () Bool)

(assert (=> b!622295 m!598173))

(assert (=> b!622303 m!598151))

(assert (=> b!622303 m!598151))

(assert (=> b!622303 m!598173))

(declare-fun m!598175 () Bool)

(assert (=> b!622293 m!598175))

(declare-fun m!598177 () Bool)

(assert (=> b!622293 m!598177))

(assert (=> b!622293 m!598151))

(assert (=> b!622293 m!598155))

(declare-fun m!598179 () Bool)

(assert (=> b!622293 m!598179))

(declare-fun m!598181 () Bool)

(assert (=> b!622293 m!598181))

(assert (=> b!622293 m!598151))

(declare-fun m!598183 () Bool)

(assert (=> b!622293 m!598183))

(declare-fun m!598185 () Bool)

(assert (=> b!622293 m!598185))

(assert (=> b!622289 m!598151))

(assert (=> b!622289 m!598151))

(assert (=> b!622289 m!598165))

(assert (=> b!622289 m!598151))

(declare-fun m!598187 () Bool)

(assert (=> b!622289 m!598187))

(declare-fun m!598189 () Bool)

(assert (=> b!622289 m!598189))

(declare-fun m!598191 () Bool)

(assert (=> b!622289 m!598191))

(assert (=> b!622289 m!598151))

(declare-fun m!598193 () Bool)

(assert (=> b!622289 m!598193))

(declare-fun m!598195 () Bool)

(assert (=> b!622289 m!598195))

(assert (=> b!622289 m!598151))

(declare-fun m!598197 () Bool)

(assert (=> b!622289 m!598197))

(declare-fun m!598199 () Bool)

(assert (=> b!622289 m!598199))

(declare-fun m!598201 () Bool)

(assert (=> b!622296 m!598201))

(declare-fun m!598203 () Bool)

(assert (=> b!622288 m!598203))

(declare-fun m!598205 () Bool)

(assert (=> b!622290 m!598205))

(assert (=> b!622286 m!598151))

(declare-fun m!598207 () Bool)

(assert (=> b!622286 m!598207))

(assert (=> b!622286 m!598151))

(declare-fun m!598209 () Bool)

(assert (=> b!622286 m!598209))

(assert (=> b!622286 m!598151))

(declare-fun m!598211 () Bool)

(assert (=> b!622286 m!598211))

(declare-fun m!598213 () Bool)

(assert (=> b!622286 m!598213))

(assert (=> b!622286 m!598195))

(assert (=> b!622286 m!598151))

(declare-fun m!598215 () Bool)

(assert (=> b!622286 m!598215))

(assert (=> b!622286 m!598191))

(declare-fun m!598217 () Bool)

(assert (=> b!622298 m!598217))

(assert (=> b!622302 m!598155))

(declare-fun m!598219 () Bool)

(assert (=> b!622302 m!598219))

(push 1)

