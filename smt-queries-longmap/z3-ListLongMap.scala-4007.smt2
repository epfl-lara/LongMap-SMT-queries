; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54564 () Bool)

(assert start!54564)

(declare-fun b!595311 () Bool)

(declare-fun e!340144 () Bool)

(declare-fun e!340145 () Bool)

(assert (=> b!595311 (= e!340144 (not e!340145))))

(declare-fun res!381126 () Bool)

(assert (=> b!595311 (=> res!381126 e!340145)))

(declare-datatypes ((SeekEntryResult!6142 0))(
  ( (MissingZero!6142 (index!26816 (_ BitVec 32))) (Found!6142 (index!26817 (_ BitVec 32))) (Intermediate!6142 (undefined!6954 Bool) (index!26818 (_ BitVec 32)) (x!55773 (_ BitVec 32))) (Undefined!6142) (MissingVacant!6142 (index!26819 (_ BitVec 32))) )
))
(declare-fun lt!270305 () SeekEntryResult!6142)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!595311 (= res!381126 (not (= lt!270305 (Found!6142 index!984))))))

(declare-datatypes ((Unit!18661 0))(
  ( (Unit!18662) )
))
(declare-fun lt!270301 () Unit!18661)

(declare-fun e!340147 () Unit!18661)

(assert (=> b!595311 (= lt!270301 e!340147)))

(declare-fun c!67469 () Bool)

(assert (=> b!595311 (= c!67469 (= lt!270305 Undefined!6142))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!270300 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!36969 0))(
  ( (array!36970 (arr!17746 (Array (_ BitVec 32) (_ BitVec 64))) (size!18110 (_ BitVec 32))) )
))
(declare-fun lt!270298 () array!36969)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36969 (_ BitVec 32)) SeekEntryResult!6142)

(assert (=> b!595311 (= lt!270305 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270300 lt!270298 mask!3053))))

(declare-fun e!340142 () Bool)

(assert (=> b!595311 e!340142))

(declare-fun res!381120 () Bool)

(assert (=> b!595311 (=> (not res!381120) (not e!340142))))

(declare-fun lt!270307 () (_ BitVec 32))

(declare-fun lt!270297 () SeekEntryResult!6142)

(assert (=> b!595311 (= res!381120 (= lt!270297 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270307 vacantSpotIndex!68 lt!270300 lt!270298 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!36969)

(assert (=> b!595311 (= lt!270297 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270307 vacantSpotIndex!68 (select (arr!17746 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!595311 (= lt!270300 (select (store (arr!17746 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270302 () Unit!18661)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36969 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18661)

(assert (=> b!595311 (= lt!270302 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270307 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!595311 (= lt!270307 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!595313 () Bool)

(declare-fun lt!270296 () SeekEntryResult!6142)

(assert (=> b!595313 (= e!340142 (= lt!270296 lt!270297))))

(declare-fun b!595314 () Bool)

(declare-fun e!340149 () Bool)

(declare-fun e!340143 () Bool)

(assert (=> b!595314 (= e!340149 e!340143)))

(declare-fun res!381115 () Bool)

(assert (=> b!595314 (=> (not res!381115) (not e!340143))))

(declare-fun lt!270306 () SeekEntryResult!6142)

(assert (=> b!595314 (= res!381115 (or (= lt!270306 (MissingZero!6142 i!1108)) (= lt!270306 (MissingVacant!6142 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36969 (_ BitVec 32)) SeekEntryResult!6142)

(assert (=> b!595314 (= lt!270306 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!595315 () Bool)

(declare-fun res!381116 () Bool)

(declare-fun e!340140 () Bool)

(assert (=> b!595315 (=> res!381116 e!340140)))

(declare-datatypes ((List!11694 0))(
  ( (Nil!11691) (Cons!11690 (h!12738 (_ BitVec 64)) (t!17914 List!11694)) )
))
(declare-fun contains!2903 (List!11694 (_ BitVec 64)) Bool)

(assert (=> b!595315 (= res!381116 (contains!2903 Nil!11691 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595316 () Bool)

(declare-fun res!381128 () Bool)

(assert (=> b!595316 (=> (not res!381128) (not e!340149))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!595316 (= res!381128 (validKeyInArray!0 k0!1786))))

(declare-fun b!595317 () Bool)

(declare-fun e!340150 () Bool)

(assert (=> b!595317 (= e!340150 e!340140)))

(declare-fun res!381119 () Bool)

(assert (=> b!595317 (=> res!381119 e!340140)))

(assert (=> b!595317 (= res!381119 (or (bvsge (size!18110 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18110 a!2986))))))

(declare-fun arrayContainsKey!0 (array!36969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!595317 (arrayContainsKey!0 lt!270298 (select (arr!17746 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270303 () Unit!18661)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36969 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18661)

(assert (=> b!595317 (= lt!270303 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270298 (select (arr!17746 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!595318 () Bool)

(assert (=> b!595318 (= e!340140 true)))

(declare-fun lt!270299 () Bool)

(assert (=> b!595318 (= lt!270299 (contains!2903 Nil!11691 k0!1786))))

(declare-fun b!595319 () Bool)

(declare-fun e!340148 () Bool)

(declare-fun e!340152 () Bool)

(assert (=> b!595319 (= e!340148 e!340152)))

(declare-fun res!381112 () Bool)

(assert (=> b!595319 (=> (not res!381112) (not e!340152))))

(assert (=> b!595319 (= res!381112 (arrayContainsKey!0 lt!270298 (select (arr!17746 a!2986) j!136) j!136))))

(declare-fun b!595320 () Bool)

(declare-fun Unit!18663 () Unit!18661)

(assert (=> b!595320 (= e!340147 Unit!18663)))

(assert (=> b!595320 false))

(declare-fun b!595321 () Bool)

(declare-fun e!340141 () Bool)

(assert (=> b!595321 (= e!340141 e!340148)))

(declare-fun res!381110 () Bool)

(assert (=> b!595321 (=> res!381110 e!340148)))

(declare-fun lt!270304 () (_ BitVec 64))

(assert (=> b!595321 (= res!381110 (or (not (= (select (arr!17746 a!2986) j!136) lt!270300)) (not (= (select (arr!17746 a!2986) j!136) lt!270304)) (bvsge j!136 index!984)))))

(declare-fun b!595322 () Bool)

(declare-fun res!381114 () Bool)

(assert (=> b!595322 (=> (not res!381114) (not e!340143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36969 (_ BitVec 32)) Bool)

(assert (=> b!595322 (= res!381114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!595323 () Bool)

(declare-fun e!340151 () Bool)

(assert (=> b!595323 (= e!340151 e!340144)))

(declare-fun res!381130 () Bool)

(assert (=> b!595323 (=> (not res!381130) (not e!340144))))

(assert (=> b!595323 (= res!381130 (and (= lt!270296 (Found!6142 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17746 a!2986) index!984) (select (arr!17746 a!2986) j!136))) (not (= (select (arr!17746 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!595323 (= lt!270296 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17746 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!595324 () Bool)

(declare-fun res!381124 () Bool)

(assert (=> b!595324 (=> (not res!381124) (not e!340149))))

(assert (=> b!595324 (= res!381124 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!595325 () Bool)

(declare-fun Unit!18664 () Unit!18661)

(assert (=> b!595325 (= e!340147 Unit!18664)))

(declare-fun b!595326 () Bool)

(declare-fun res!381127 () Bool)

(assert (=> b!595326 (=> (not res!381127) (not e!340149))))

(assert (=> b!595326 (= res!381127 (validKeyInArray!0 (select (arr!17746 a!2986) j!136)))))

(declare-fun b!595327 () Bool)

(declare-fun res!381111 () Bool)

(assert (=> b!595327 (=> (not res!381111) (not e!340143))))

(declare-fun arrayNoDuplicates!0 (array!36969 (_ BitVec 32) List!11694) Bool)

(assert (=> b!595327 (= res!381111 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11691))))

(declare-fun b!595312 () Bool)

(assert (=> b!595312 (= e!340143 e!340151)))

(declare-fun res!381122 () Bool)

(assert (=> b!595312 (=> (not res!381122) (not e!340151))))

(assert (=> b!595312 (= res!381122 (= (select (store (arr!17746 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!595312 (= lt!270298 (array!36970 (store (arr!17746 a!2986) i!1108 k0!1786) (size!18110 a!2986)))))

(declare-fun res!381117 () Bool)

(assert (=> start!54564 (=> (not res!381117) (not e!340149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54564 (= res!381117 (validMask!0 mask!3053))))

(assert (=> start!54564 e!340149))

(assert (=> start!54564 true))

(declare-fun array_inv!13605 (array!36969) Bool)

(assert (=> start!54564 (array_inv!13605 a!2986)))

(declare-fun b!595328 () Bool)

(declare-fun res!381113 () Bool)

(assert (=> b!595328 (=> res!381113 e!340140)))

(declare-fun noDuplicate!250 (List!11694) Bool)

(assert (=> b!595328 (= res!381113 (not (noDuplicate!250 Nil!11691)))))

(declare-fun b!595329 () Bool)

(assert (=> b!595329 (= e!340145 e!340150)))

(declare-fun res!381118 () Bool)

(assert (=> b!595329 (=> res!381118 e!340150)))

(assert (=> b!595329 (= res!381118 (or (not (= (select (arr!17746 a!2986) j!136) lt!270300)) (not (= (select (arr!17746 a!2986) j!136) lt!270304)) (bvsge j!136 index!984)))))

(assert (=> b!595329 e!340141))

(declare-fun res!381129 () Bool)

(assert (=> b!595329 (=> (not res!381129) (not e!340141))))

(assert (=> b!595329 (= res!381129 (= lt!270304 (select (arr!17746 a!2986) j!136)))))

(assert (=> b!595329 (= lt!270304 (select (store (arr!17746 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!595330 () Bool)

(declare-fun res!381123 () Bool)

(assert (=> b!595330 (=> (not res!381123) (not e!340143))))

(assert (=> b!595330 (= res!381123 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17746 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!595331 () Bool)

(assert (=> b!595331 (= e!340152 (arrayContainsKey!0 lt!270298 (select (arr!17746 a!2986) j!136) index!984))))

(declare-fun b!595332 () Bool)

(declare-fun res!381121 () Bool)

(assert (=> b!595332 (=> res!381121 e!340140)))

(assert (=> b!595332 (= res!381121 (contains!2903 Nil!11691 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595333 () Bool)

(declare-fun res!381125 () Bool)

(assert (=> b!595333 (=> (not res!381125) (not e!340149))))

(assert (=> b!595333 (= res!381125 (and (= (size!18110 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18110 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18110 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!54564 res!381117) b!595333))

(assert (= (and b!595333 res!381125) b!595326))

(assert (= (and b!595326 res!381127) b!595316))

(assert (= (and b!595316 res!381128) b!595324))

(assert (= (and b!595324 res!381124) b!595314))

(assert (= (and b!595314 res!381115) b!595322))

(assert (= (and b!595322 res!381114) b!595327))

(assert (= (and b!595327 res!381111) b!595330))

(assert (= (and b!595330 res!381123) b!595312))

(assert (= (and b!595312 res!381122) b!595323))

(assert (= (and b!595323 res!381130) b!595311))

(assert (= (and b!595311 res!381120) b!595313))

(assert (= (and b!595311 c!67469) b!595320))

(assert (= (and b!595311 (not c!67469)) b!595325))

(assert (= (and b!595311 (not res!381126)) b!595329))

(assert (= (and b!595329 res!381129) b!595321))

(assert (= (and b!595321 (not res!381110)) b!595319))

(assert (= (and b!595319 res!381112) b!595331))

(assert (= (and b!595329 (not res!381118)) b!595317))

(assert (= (and b!595317 (not res!381119)) b!595328))

(assert (= (and b!595328 (not res!381113)) b!595332))

(assert (= (and b!595332 (not res!381121)) b!595315))

(assert (= (and b!595315 (not res!381116)) b!595318))

(declare-fun m!573221 () Bool)

(assert (=> b!595317 m!573221))

(assert (=> b!595317 m!573221))

(declare-fun m!573223 () Bool)

(assert (=> b!595317 m!573223))

(assert (=> b!595317 m!573221))

(declare-fun m!573225 () Bool)

(assert (=> b!595317 m!573225))

(assert (=> b!595329 m!573221))

(declare-fun m!573227 () Bool)

(assert (=> b!595329 m!573227))

(declare-fun m!573229 () Bool)

(assert (=> b!595329 m!573229))

(declare-fun m!573231 () Bool)

(assert (=> b!595328 m!573231))

(assert (=> b!595326 m!573221))

(assert (=> b!595326 m!573221))

(declare-fun m!573233 () Bool)

(assert (=> b!595326 m!573233))

(declare-fun m!573235 () Bool)

(assert (=> b!595327 m!573235))

(declare-fun m!573237 () Bool)

(assert (=> b!595323 m!573237))

(assert (=> b!595323 m!573221))

(assert (=> b!595323 m!573221))

(declare-fun m!573239 () Bool)

(assert (=> b!595323 m!573239))

(declare-fun m!573241 () Bool)

(assert (=> b!595315 m!573241))

(assert (=> b!595331 m!573221))

(assert (=> b!595331 m!573221))

(declare-fun m!573243 () Bool)

(assert (=> b!595331 m!573243))

(assert (=> b!595319 m!573221))

(assert (=> b!595319 m!573221))

(declare-fun m!573245 () Bool)

(assert (=> b!595319 m!573245))

(declare-fun m!573247 () Bool)

(assert (=> b!595316 m!573247))

(declare-fun m!573249 () Bool)

(assert (=> b!595332 m!573249))

(declare-fun m!573251 () Bool)

(assert (=> b!595324 m!573251))

(declare-fun m!573253 () Bool)

(assert (=> b!595318 m!573253))

(declare-fun m!573255 () Bool)

(assert (=> b!595311 m!573255))

(declare-fun m!573257 () Bool)

(assert (=> b!595311 m!573257))

(assert (=> b!595311 m!573221))

(declare-fun m!573259 () Bool)

(assert (=> b!595311 m!573259))

(assert (=> b!595311 m!573227))

(declare-fun m!573261 () Bool)

(assert (=> b!595311 m!573261))

(assert (=> b!595311 m!573221))

(declare-fun m!573263 () Bool)

(assert (=> b!595311 m!573263))

(declare-fun m!573265 () Bool)

(assert (=> b!595311 m!573265))

(assert (=> b!595321 m!573221))

(declare-fun m!573267 () Bool)

(assert (=> start!54564 m!573267))

(declare-fun m!573269 () Bool)

(assert (=> start!54564 m!573269))

(assert (=> b!595312 m!573227))

(declare-fun m!573271 () Bool)

(assert (=> b!595312 m!573271))

(declare-fun m!573273 () Bool)

(assert (=> b!595314 m!573273))

(declare-fun m!573275 () Bool)

(assert (=> b!595322 m!573275))

(declare-fun m!573277 () Bool)

(assert (=> b!595330 m!573277))

(check-sat (not b!595324) (not b!595314) (not b!595322) (not b!595311) (not start!54564) (not b!595316) (not b!595318) (not b!595328) (not b!595327) (not b!595326) (not b!595319) (not b!595315) (not b!595331) (not b!595332) (not b!595317) (not b!595323))
(check-sat)
