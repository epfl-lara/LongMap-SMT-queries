; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56158 () Bool)

(assert start!56158)

(declare-fun b!621201 () Bool)

(assert (=> b!621201 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((Unit!20728 0))(
  ( (Unit!20729) )
))
(declare-fun lt!287375 () Unit!20728)

(declare-datatypes ((array!37628 0))(
  ( (array!37629 (arr!18060 (Array (_ BitVec 32) (_ BitVec 64))) (size!18424 (_ BitVec 32))) )
))
(declare-fun lt!287371 () array!37628)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37628)

(declare-datatypes ((List!12101 0))(
  ( (Nil!12098) (Cons!12097 (h!13142 (_ BitVec 64)) (t!18329 List!12101)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37628 (_ BitVec 64) (_ BitVec 32) List!12101) Unit!20728)

(assert (=> b!621201 (= lt!287375 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287371 (select (arr!18060 a!2986) j!136) index!984 Nil!12098))))

(declare-fun arrayNoDuplicates!0 (array!37628 (_ BitVec 32) List!12101) Bool)

(assert (=> b!621201 (arrayNoDuplicates!0 lt!287371 index!984 Nil!12098)))

(declare-fun lt!287361 () Unit!20728)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37628 (_ BitVec 32) (_ BitVec 32)) Unit!20728)

(assert (=> b!621201 (= lt!287361 (lemmaNoDuplicateFromThenFromBigger!0 lt!287371 #b00000000000000000000000000000000 index!984))))

(assert (=> b!621201 (arrayNoDuplicates!0 lt!287371 #b00000000000000000000000000000000 Nil!12098)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!287364 () Unit!20728)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37628 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12101) Unit!20728)

(assert (=> b!621201 (= lt!287364 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12098))))

(declare-fun arrayContainsKey!0 (array!37628 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!621201 (arrayContainsKey!0 lt!287371 (select (arr!18060 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287362 () Unit!20728)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37628 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20728)

(assert (=> b!621201 (= lt!287362 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287371 (select (arr!18060 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!356300 () Bool)

(assert (=> b!621201 e!356300))

(declare-fun res!400319 () Bool)

(assert (=> b!621201 (=> (not res!400319) (not e!356300))))

(assert (=> b!621201 (= res!400319 (arrayContainsKey!0 lt!287371 (select (arr!18060 a!2986) j!136) j!136))))

(declare-fun e!356296 () Unit!20728)

(declare-fun Unit!20730 () Unit!20728)

(assert (=> b!621201 (= e!356296 Unit!20730)))

(declare-fun b!621202 () Bool)

(declare-fun res!400318 () Bool)

(declare-fun e!356297 () Bool)

(assert (=> b!621202 (=> (not res!400318) (not e!356297))))

(assert (=> b!621202 (= res!400318 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12098))))

(declare-fun b!621203 () Bool)

(declare-fun res!400322 () Bool)

(assert (=> b!621203 (= res!400322 (bvsge j!136 index!984))))

(declare-fun e!356302 () Bool)

(assert (=> b!621203 (=> res!400322 e!356302)))

(declare-fun e!356298 () Bool)

(assert (=> b!621203 (= e!356298 e!356302)))

(declare-fun b!621204 () Bool)

(declare-fun e!356303 () Unit!20728)

(declare-fun Unit!20731 () Unit!20728)

(assert (=> b!621204 (= e!356303 Unit!20731)))

(declare-fun b!621205 () Bool)

(declare-fun res!400309 () Bool)

(declare-fun e!356301 () Bool)

(assert (=> b!621205 (=> (not res!400309) (not e!356301))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!621205 (= res!400309 (validKeyInArray!0 (select (arr!18060 a!2986) j!136)))))

(declare-fun b!621206 () Bool)

(declare-fun e!356299 () Unit!20728)

(declare-fun Unit!20732 () Unit!20728)

(assert (=> b!621206 (= e!356299 Unit!20732)))

(declare-fun res!400311 () Bool)

(assert (=> b!621206 (= res!400311 (= (select (store (arr!18060 a!2986) i!1108 k!1786) index!984) (select (arr!18060 a!2986) j!136)))))

(assert (=> b!621206 (=> (not res!400311) (not e!356298))))

(assert (=> b!621206 e!356298))

(declare-fun c!70816 () Bool)

(assert (=> b!621206 (= c!70816 (bvslt j!136 index!984))))

(declare-fun lt!287368 () Unit!20728)

(assert (=> b!621206 (= lt!287368 e!356303)))

(declare-fun c!70815 () Bool)

(assert (=> b!621206 (= c!70815 (bvslt index!984 j!136))))

(declare-fun lt!287367 () Unit!20728)

(assert (=> b!621206 (= lt!287367 e!356296)))

(assert (=> b!621206 false))

(declare-fun b!621207 () Bool)

(assert (=> b!621207 false))

(declare-fun lt!287372 () Unit!20728)

(assert (=> b!621207 (= lt!287372 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287371 (select (arr!18060 a!2986) j!136) j!136 Nil!12098))))

(assert (=> b!621207 (arrayNoDuplicates!0 lt!287371 j!136 Nil!12098)))

(declare-fun lt!287376 () Unit!20728)

(assert (=> b!621207 (= lt!287376 (lemmaNoDuplicateFromThenFromBigger!0 lt!287371 #b00000000000000000000000000000000 j!136))))

(assert (=> b!621207 (arrayNoDuplicates!0 lt!287371 #b00000000000000000000000000000000 Nil!12098)))

(declare-fun lt!287377 () Unit!20728)

(assert (=> b!621207 (= lt!287377 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12098))))

(assert (=> b!621207 (arrayContainsKey!0 lt!287371 (select (arr!18060 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287365 () Unit!20728)

(assert (=> b!621207 (= lt!287365 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287371 (select (arr!18060 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20733 () Unit!20728)

(assert (=> b!621207 (= e!356303 Unit!20733)))

(declare-fun b!621208 () Bool)

(assert (=> b!621208 (= e!356301 e!356297)))

(declare-fun res!400312 () Bool)

(assert (=> b!621208 (=> (not res!400312) (not e!356297))))

(declare-datatypes ((SeekEntryResult!6500 0))(
  ( (MissingZero!6500 (index!28284 (_ BitVec 32))) (Found!6500 (index!28285 (_ BitVec 32))) (Intermediate!6500 (undefined!7312 Bool) (index!28286 (_ BitVec 32)) (x!57060 (_ BitVec 32))) (Undefined!6500) (MissingVacant!6500 (index!28287 (_ BitVec 32))) )
))
(declare-fun lt!287374 () SeekEntryResult!6500)

(assert (=> b!621208 (= res!400312 (or (= lt!287374 (MissingZero!6500 i!1108)) (= lt!287374 (MissingVacant!6500 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37628 (_ BitVec 32)) SeekEntryResult!6500)

(assert (=> b!621208 (= lt!287374 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!621209 () Bool)

(declare-fun e!356291 () Bool)

(assert (=> b!621209 (= e!356291 (not true))))

(declare-fun lt!287363 () Unit!20728)

(assert (=> b!621209 (= lt!287363 e!356299)))

(declare-fun c!70817 () Bool)

(declare-fun lt!287366 () SeekEntryResult!6500)

(assert (=> b!621209 (= c!70817 (= lt!287366 (Found!6500 index!984)))))

(declare-fun lt!287369 () Unit!20728)

(declare-fun e!356292 () Unit!20728)

(assert (=> b!621209 (= lt!287369 e!356292)))

(declare-fun c!70814 () Bool)

(assert (=> b!621209 (= c!70814 (= lt!287366 Undefined!6500))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!287360 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37628 (_ BitVec 32)) SeekEntryResult!6500)

(assert (=> b!621209 (= lt!287366 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287360 lt!287371 mask!3053))))

(declare-fun e!356304 () Bool)

(assert (=> b!621209 e!356304))

(declare-fun res!400321 () Bool)

(assert (=> b!621209 (=> (not res!400321) (not e!356304))))

(declare-fun lt!287373 () SeekEntryResult!6500)

(declare-fun lt!287359 () (_ BitVec 32))

(assert (=> b!621209 (= res!400321 (= lt!287373 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287359 vacantSpotIndex!68 lt!287360 lt!287371 mask!3053)))))

(assert (=> b!621209 (= lt!287373 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287359 vacantSpotIndex!68 (select (arr!18060 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!621209 (= lt!287360 (select (store (arr!18060 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!287358 () Unit!20728)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37628 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20728)

(assert (=> b!621209 (= lt!287358 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287359 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!621209 (= lt!287359 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!621211 () Bool)

(declare-fun Unit!20734 () Unit!20728)

(assert (=> b!621211 (= e!356292 Unit!20734)))

(declare-fun b!621212 () Bool)

(declare-fun lt!287370 () SeekEntryResult!6500)

(assert (=> b!621212 (= e!356304 (= lt!287370 lt!287373))))

(declare-fun b!621213 () Bool)

(declare-fun e!356294 () Bool)

(assert (=> b!621213 (= e!356297 e!356294)))

(declare-fun res!400315 () Bool)

(assert (=> b!621213 (=> (not res!400315) (not e!356294))))

(assert (=> b!621213 (= res!400315 (= (select (store (arr!18060 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!621213 (= lt!287371 (array!37629 (store (arr!18060 a!2986) i!1108 k!1786) (size!18424 a!2986)))))

(declare-fun b!621214 () Bool)

(declare-fun e!356293 () Bool)

(assert (=> b!621214 (= e!356293 (arrayContainsKey!0 lt!287371 (select (arr!18060 a!2986) j!136) index!984))))

(declare-fun b!621215 () Bool)

(declare-fun res!400314 () Bool)

(assert (=> b!621215 (=> (not res!400314) (not e!356301))))

(assert (=> b!621215 (= res!400314 (validKeyInArray!0 k!1786))))

(declare-fun b!621216 () Bool)

(declare-fun res!400307 () Bool)

(assert (=> b!621216 (=> (not res!400307) (not e!356297))))

(assert (=> b!621216 (= res!400307 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18060 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!621217 () Bool)

(declare-fun Unit!20735 () Unit!20728)

(assert (=> b!621217 (= e!356296 Unit!20735)))

(declare-fun b!621218 () Bool)

(declare-fun res!400320 () Bool)

(assert (=> b!621218 (=> (not res!400320) (not e!356297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37628 (_ BitVec 32)) Bool)

(assert (=> b!621218 (= res!400320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!621219 () Bool)

(declare-fun res!400310 () Bool)

(assert (=> b!621219 (=> (not res!400310) (not e!356301))))

(assert (=> b!621219 (= res!400310 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!621220 () Bool)

(assert (=> b!621220 (= e!356300 (arrayContainsKey!0 lt!287371 (select (arr!18060 a!2986) j!136) index!984))))

(declare-fun b!621221 () Bool)

(declare-fun Unit!20736 () Unit!20728)

(assert (=> b!621221 (= e!356292 Unit!20736)))

(assert (=> b!621221 false))

(declare-fun res!400316 () Bool)

(declare-fun b!621210 () Bool)

(assert (=> b!621210 (= res!400316 (arrayContainsKey!0 lt!287371 (select (arr!18060 a!2986) j!136) j!136))))

(assert (=> b!621210 (=> (not res!400316) (not e!356293))))

(assert (=> b!621210 (= e!356302 e!356293)))

(declare-fun res!400313 () Bool)

(assert (=> start!56158 (=> (not res!400313) (not e!356301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56158 (= res!400313 (validMask!0 mask!3053))))

(assert (=> start!56158 e!356301))

(assert (=> start!56158 true))

(declare-fun array_inv!13856 (array!37628) Bool)

(assert (=> start!56158 (array_inv!13856 a!2986)))

(declare-fun b!621222 () Bool)

(declare-fun Unit!20737 () Unit!20728)

(assert (=> b!621222 (= e!356299 Unit!20737)))

(declare-fun b!621223 () Bool)

(assert (=> b!621223 (= e!356294 e!356291)))

(declare-fun res!400308 () Bool)

(assert (=> b!621223 (=> (not res!400308) (not e!356291))))

(assert (=> b!621223 (= res!400308 (and (= lt!287370 (Found!6500 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18060 a!2986) index!984) (select (arr!18060 a!2986) j!136))) (not (= (select (arr!18060 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!621223 (= lt!287370 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18060 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!621224 () Bool)

(declare-fun res!400317 () Bool)

(assert (=> b!621224 (=> (not res!400317) (not e!356301))))

(assert (=> b!621224 (= res!400317 (and (= (size!18424 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18424 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18424 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56158 res!400313) b!621224))

(assert (= (and b!621224 res!400317) b!621205))

(assert (= (and b!621205 res!400309) b!621215))

(assert (= (and b!621215 res!400314) b!621219))

(assert (= (and b!621219 res!400310) b!621208))

(assert (= (and b!621208 res!400312) b!621218))

(assert (= (and b!621218 res!400320) b!621202))

(assert (= (and b!621202 res!400318) b!621216))

(assert (= (and b!621216 res!400307) b!621213))

(assert (= (and b!621213 res!400315) b!621223))

(assert (= (and b!621223 res!400308) b!621209))

(assert (= (and b!621209 res!400321) b!621212))

(assert (= (and b!621209 c!70814) b!621221))

(assert (= (and b!621209 (not c!70814)) b!621211))

(assert (= (and b!621209 c!70817) b!621206))

(assert (= (and b!621209 (not c!70817)) b!621222))

(assert (= (and b!621206 res!400311) b!621203))

(assert (= (and b!621203 (not res!400322)) b!621210))

(assert (= (and b!621210 res!400316) b!621214))

(assert (= (and b!621206 c!70816) b!621207))

(assert (= (and b!621206 (not c!70816)) b!621204))

(assert (= (and b!621206 c!70815) b!621201))

(assert (= (and b!621206 (not c!70815)) b!621217))

(assert (= (and b!621201 res!400319) b!621220))

(declare-fun m!597101 () Bool)

(assert (=> b!621213 m!597101))

(declare-fun m!597103 () Bool)

(assert (=> b!621213 m!597103))

(declare-fun m!597105 () Bool)

(assert (=> b!621209 m!597105))

(declare-fun m!597107 () Bool)

(assert (=> b!621209 m!597107))

(declare-fun m!597109 () Bool)

(assert (=> b!621209 m!597109))

(assert (=> b!621209 m!597101))

(declare-fun m!597111 () Bool)

(assert (=> b!621209 m!597111))

(assert (=> b!621209 m!597109))

(declare-fun m!597113 () Bool)

(assert (=> b!621209 m!597113))

(declare-fun m!597115 () Bool)

(assert (=> b!621209 m!597115))

(declare-fun m!597117 () Bool)

(assert (=> b!621209 m!597117))

(assert (=> b!621201 m!597109))

(declare-fun m!597119 () Bool)

(assert (=> b!621201 m!597119))

(assert (=> b!621201 m!597109))

(declare-fun m!597121 () Bool)

(assert (=> b!621201 m!597121))

(assert (=> b!621201 m!597109))

(declare-fun m!597123 () Bool)

(assert (=> b!621201 m!597123))

(declare-fun m!597125 () Bool)

(assert (=> b!621201 m!597125))

(declare-fun m!597127 () Bool)

(assert (=> b!621201 m!597127))

(declare-fun m!597129 () Bool)

(assert (=> b!621201 m!597129))

(assert (=> b!621201 m!597109))

(declare-fun m!597131 () Bool)

(assert (=> b!621201 m!597131))

(assert (=> b!621201 m!597109))

(declare-fun m!597133 () Bool)

(assert (=> b!621201 m!597133))

(assert (=> b!621206 m!597101))

(declare-fun m!597135 () Bool)

(assert (=> b!621206 m!597135))

(assert (=> b!621206 m!597109))

(assert (=> b!621210 m!597109))

(assert (=> b!621210 m!597109))

(assert (=> b!621210 m!597119))

(declare-fun m!597137 () Bool)

(assert (=> b!621202 m!597137))

(declare-fun m!597139 () Bool)

(assert (=> b!621216 m!597139))

(declare-fun m!597141 () Bool)

(assert (=> start!56158 m!597141))

(declare-fun m!597143 () Bool)

(assert (=> start!56158 m!597143))

(declare-fun m!597145 () Bool)

(assert (=> b!621219 m!597145))

(declare-fun m!597147 () Bool)

(assert (=> b!621207 m!597147))

(assert (=> b!621207 m!597109))

(declare-fun m!597149 () Bool)

(assert (=> b!621207 m!597149))

(assert (=> b!621207 m!597109))

(declare-fun m!597151 () Bool)

(assert (=> b!621207 m!597151))

(declare-fun m!597153 () Bool)

(assert (=> b!621207 m!597153))

(assert (=> b!621207 m!597127))

(assert (=> b!621207 m!597129))

(assert (=> b!621207 m!597109))

(assert (=> b!621207 m!597109))

(declare-fun m!597155 () Bool)

(assert (=> b!621207 m!597155))

(declare-fun m!597157 () Bool)

(assert (=> b!621223 m!597157))

(assert (=> b!621223 m!597109))

(assert (=> b!621223 m!597109))

(declare-fun m!597159 () Bool)

(assert (=> b!621223 m!597159))

(assert (=> b!621205 m!597109))

(assert (=> b!621205 m!597109))

(declare-fun m!597161 () Bool)

(assert (=> b!621205 m!597161))

(declare-fun m!597163 () Bool)

(assert (=> b!621218 m!597163))

(declare-fun m!597165 () Bool)

(assert (=> b!621208 m!597165))

(assert (=> b!621214 m!597109))

(assert (=> b!621214 m!597109))

(declare-fun m!597167 () Bool)

(assert (=> b!621214 m!597167))

(assert (=> b!621220 m!597109))

(assert (=> b!621220 m!597109))

(assert (=> b!621220 m!597167))

(declare-fun m!597169 () Bool)

(assert (=> b!621215 m!597169))

(push 1)

