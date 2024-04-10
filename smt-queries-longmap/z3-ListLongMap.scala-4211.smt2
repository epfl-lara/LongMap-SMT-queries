; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57712 () Bool)

(assert start!57712)

(declare-fun b!638293 () Bool)

(declare-datatypes ((Unit!21550 0))(
  ( (Unit!21551) )
))
(declare-fun e!365237 () Unit!21550)

(declare-fun Unit!21552 () Unit!21550)

(assert (=> b!638293 (= e!365237 Unit!21552)))

(declare-fun b!638294 () Bool)

(declare-fun e!365241 () Bool)

(declare-fun e!365239 () Bool)

(assert (=> b!638294 (= e!365241 e!365239)))

(declare-fun res!413131 () Bool)

(assert (=> b!638294 (=> res!413131 e!365239)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!295176 () (_ BitVec 64))

(declare-fun lt!295171 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38283 0))(
  ( (array!38284 (arr!18364 (Array (_ BitVec 32) (_ BitVec 64))) (size!18728 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38283)

(assert (=> b!638294 (= res!413131 (or (not (= (select (arr!18364 a!2986) j!136) lt!295171)) (not (= (select (arr!18364 a!2986) j!136) lt!295176)) (bvsge j!136 index!984)))))

(declare-fun b!638295 () Bool)

(declare-fun e!365229 () Bool)

(declare-fun e!365234 () Bool)

(assert (=> b!638295 (= e!365229 e!365234)))

(declare-fun res!413138 () Bool)

(assert (=> b!638295 (=> (not res!413138) (not e!365234))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!638295 (= res!413138 (= (select (store (arr!18364 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!295170 () array!38283)

(assert (=> b!638295 (= lt!295170 (array!38284 (store (arr!18364 a!2986) i!1108 k0!1786) (size!18728 a!2986)))))

(declare-fun b!638296 () Bool)

(declare-fun res!413136 () Bool)

(assert (=> b!638296 (=> (not res!413136) (not e!365229))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38283 (_ BitVec 32)) Bool)

(assert (=> b!638296 (= res!413136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!638297 () Bool)

(declare-fun res!413137 () Bool)

(declare-fun e!365235 () Bool)

(assert (=> b!638297 (=> (not res!413137) (not e!365235))))

(declare-fun arrayContainsKey!0 (array!38283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!638297 (= res!413137 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!638298 () Bool)

(declare-fun res!413130 () Bool)

(assert (=> b!638298 (=> (not res!413130) (not e!365235))))

(assert (=> b!638298 (= res!413130 (and (= (size!18728 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18728 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18728 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!638300 () Bool)

(declare-fun res!413146 () Bool)

(assert (=> b!638300 (=> (not res!413146) (not e!365229))))

(declare-datatypes ((List!12405 0))(
  ( (Nil!12402) (Cons!12401 (h!13446 (_ BitVec 64)) (t!18633 List!12405)) )
))
(declare-fun arrayNoDuplicates!0 (array!38283 (_ BitVec 32) List!12405) Bool)

(assert (=> b!638300 (= res!413146 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12402))))

(declare-fun b!638301 () Bool)

(declare-fun e!365230 () Bool)

(declare-datatypes ((SeekEntryResult!6804 0))(
  ( (MissingZero!6804 (index!29530 (_ BitVec 32))) (Found!6804 (index!29531 (_ BitVec 32))) (Intermediate!6804 (undefined!7616 Bool) (index!29532 (_ BitVec 32)) (x!58286 (_ BitVec 32))) (Undefined!6804) (MissingVacant!6804 (index!29533 (_ BitVec 32))) )
))
(declare-fun lt!295174 () SeekEntryResult!6804)

(declare-fun lt!295172 () SeekEntryResult!6804)

(assert (=> b!638301 (= e!365230 (= lt!295174 lt!295172))))

(declare-fun b!638302 () Bool)

(declare-fun e!365238 () Bool)

(assert (=> b!638302 (= e!365234 e!365238)))

(declare-fun res!413142 () Bool)

(assert (=> b!638302 (=> (not res!413142) (not e!365238))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!638302 (= res!413142 (and (= lt!295174 (Found!6804 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18364 a!2986) index!984) (select (arr!18364 a!2986) j!136))) (not (= (select (arr!18364 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38283 (_ BitVec 32)) SeekEntryResult!6804)

(assert (=> b!638302 (= lt!295174 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18364 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!638303 () Bool)

(declare-fun res!413144 () Bool)

(assert (=> b!638303 (=> (not res!413144) (not e!365235))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!638303 (= res!413144 (validKeyInArray!0 (select (arr!18364 a!2986) j!136)))))

(declare-fun b!638304 () Bool)

(declare-fun res!413139 () Bool)

(declare-fun e!365232 () Bool)

(assert (=> b!638304 (=> res!413139 e!365232)))

(declare-fun contains!3119 (List!12405 (_ BitVec 64)) Bool)

(assert (=> b!638304 (= res!413139 (contains!3119 Nil!12402 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!638305 () Bool)

(declare-fun res!413128 () Bool)

(assert (=> b!638305 (=> (not res!413128) (not e!365229))))

(assert (=> b!638305 (= res!413128 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18364 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!638306 () Bool)

(declare-fun res!413147 () Bool)

(assert (=> b!638306 (=> res!413147 e!365232)))

(assert (=> b!638306 (= res!413147 (contains!3119 Nil!12402 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!638307 () Bool)

(declare-fun e!365236 () Bool)

(assert (=> b!638307 (= e!365238 (not e!365236))))

(declare-fun res!413132 () Bool)

(assert (=> b!638307 (=> res!413132 e!365236)))

(declare-fun lt!295175 () SeekEntryResult!6804)

(assert (=> b!638307 (= res!413132 (not (= lt!295175 (Found!6804 index!984))))))

(declare-fun lt!295177 () Unit!21550)

(assert (=> b!638307 (= lt!295177 e!365237)))

(declare-fun c!72950 () Bool)

(assert (=> b!638307 (= c!72950 (= lt!295175 Undefined!6804))))

(assert (=> b!638307 (= lt!295175 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295171 lt!295170 mask!3053))))

(assert (=> b!638307 e!365230))

(declare-fun res!413145 () Bool)

(assert (=> b!638307 (=> (not res!413145) (not e!365230))))

(declare-fun lt!295179 () (_ BitVec 32))

(assert (=> b!638307 (= res!413145 (= lt!295172 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295179 vacantSpotIndex!68 lt!295171 lt!295170 mask!3053)))))

(assert (=> b!638307 (= lt!295172 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295179 vacantSpotIndex!68 (select (arr!18364 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!638307 (= lt!295171 (select (store (arr!18364 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!295180 () Unit!21550)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38283 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21550)

(assert (=> b!638307 (= lt!295180 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295179 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!638307 (= lt!295179 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!638308 () Bool)

(declare-fun e!365231 () Bool)

(assert (=> b!638308 (= e!365239 e!365231)))

(declare-fun res!413129 () Bool)

(assert (=> b!638308 (=> (not res!413129) (not e!365231))))

(assert (=> b!638308 (= res!413129 (arrayContainsKey!0 lt!295170 (select (arr!18364 a!2986) j!136) j!136))))

(declare-fun b!638309 () Bool)

(declare-fun res!413134 () Bool)

(assert (=> b!638309 (=> (not res!413134) (not e!365235))))

(assert (=> b!638309 (= res!413134 (validKeyInArray!0 k0!1786))))

(declare-fun res!413140 () Bool)

(assert (=> start!57712 (=> (not res!413140) (not e!365235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57712 (= res!413140 (validMask!0 mask!3053))))

(assert (=> start!57712 e!365235))

(assert (=> start!57712 true))

(declare-fun array_inv!14160 (array!38283) Bool)

(assert (=> start!57712 (array_inv!14160 a!2986)))

(declare-fun b!638299 () Bool)

(declare-fun Unit!21553 () Unit!21550)

(assert (=> b!638299 (= e!365237 Unit!21553)))

(assert (=> b!638299 false))

(declare-fun b!638310 () Bool)

(assert (=> b!638310 (= e!365232 true)))

(declare-fun lt!295169 () Bool)

(assert (=> b!638310 (= lt!295169 (contains!3119 Nil!12402 k0!1786))))

(declare-fun b!638311 () Bool)

(assert (=> b!638311 (= e!365235 e!365229)))

(declare-fun res!413141 () Bool)

(assert (=> b!638311 (=> (not res!413141) (not e!365229))))

(declare-fun lt!295178 () SeekEntryResult!6804)

(assert (=> b!638311 (= res!413141 (or (= lt!295178 (MissingZero!6804 i!1108)) (= lt!295178 (MissingVacant!6804 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38283 (_ BitVec 32)) SeekEntryResult!6804)

(assert (=> b!638311 (= lt!295178 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!638312 () Bool)

(declare-fun e!365240 () Bool)

(assert (=> b!638312 (= e!365240 e!365232)))

(declare-fun res!413135 () Bool)

(assert (=> b!638312 (=> res!413135 e!365232)))

(assert (=> b!638312 (= res!413135 (or (bvsge (size!18728 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18728 a!2986))))))

(assert (=> b!638312 (arrayContainsKey!0 lt!295170 (select (arr!18364 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295173 () Unit!21550)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38283 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21550)

(assert (=> b!638312 (= lt!295173 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295170 (select (arr!18364 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!638313 () Bool)

(assert (=> b!638313 (= e!365231 (arrayContainsKey!0 lt!295170 (select (arr!18364 a!2986) j!136) index!984))))

(declare-fun b!638314 () Bool)

(assert (=> b!638314 (= e!365236 e!365240)))

(declare-fun res!413133 () Bool)

(assert (=> b!638314 (=> res!413133 e!365240)))

(assert (=> b!638314 (= res!413133 (or (not (= (select (arr!18364 a!2986) j!136) lt!295171)) (not (= (select (arr!18364 a!2986) j!136) lt!295176)) (bvsge j!136 index!984)))))

(assert (=> b!638314 e!365241))

(declare-fun res!413127 () Bool)

(assert (=> b!638314 (=> (not res!413127) (not e!365241))))

(assert (=> b!638314 (= res!413127 (= lt!295176 (select (arr!18364 a!2986) j!136)))))

(assert (=> b!638314 (= lt!295176 (select (store (arr!18364 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!638315 () Bool)

(declare-fun res!413143 () Bool)

(assert (=> b!638315 (=> res!413143 e!365232)))

(declare-fun noDuplicate!397 (List!12405) Bool)

(assert (=> b!638315 (= res!413143 (not (noDuplicate!397 Nil!12402)))))

(assert (= (and start!57712 res!413140) b!638298))

(assert (= (and b!638298 res!413130) b!638303))

(assert (= (and b!638303 res!413144) b!638309))

(assert (= (and b!638309 res!413134) b!638297))

(assert (= (and b!638297 res!413137) b!638311))

(assert (= (and b!638311 res!413141) b!638296))

(assert (= (and b!638296 res!413136) b!638300))

(assert (= (and b!638300 res!413146) b!638305))

(assert (= (and b!638305 res!413128) b!638295))

(assert (= (and b!638295 res!413138) b!638302))

(assert (= (and b!638302 res!413142) b!638307))

(assert (= (and b!638307 res!413145) b!638301))

(assert (= (and b!638307 c!72950) b!638299))

(assert (= (and b!638307 (not c!72950)) b!638293))

(assert (= (and b!638307 (not res!413132)) b!638314))

(assert (= (and b!638314 res!413127) b!638294))

(assert (= (and b!638294 (not res!413131)) b!638308))

(assert (= (and b!638308 res!413129) b!638313))

(assert (= (and b!638314 (not res!413133)) b!638312))

(assert (= (and b!638312 (not res!413135)) b!638315))

(assert (= (and b!638315 (not res!413143)) b!638304))

(assert (= (and b!638304 (not res!413139)) b!638306))

(assert (= (and b!638306 (not res!413147)) b!638310))

(declare-fun m!612237 () Bool)

(assert (=> b!638297 m!612237))

(declare-fun m!612239 () Bool)

(assert (=> b!638311 m!612239))

(declare-fun m!612241 () Bool)

(assert (=> b!638294 m!612241))

(declare-fun m!612243 () Bool)

(assert (=> b!638300 m!612243))

(declare-fun m!612245 () Bool)

(assert (=> b!638296 m!612245))

(declare-fun m!612247 () Bool)

(assert (=> start!57712 m!612247))

(declare-fun m!612249 () Bool)

(assert (=> start!57712 m!612249))

(declare-fun m!612251 () Bool)

(assert (=> b!638295 m!612251))

(declare-fun m!612253 () Bool)

(assert (=> b!638295 m!612253))

(declare-fun m!612255 () Bool)

(assert (=> b!638306 m!612255))

(declare-fun m!612257 () Bool)

(assert (=> b!638310 m!612257))

(assert (=> b!638312 m!612241))

(assert (=> b!638312 m!612241))

(declare-fun m!612259 () Bool)

(assert (=> b!638312 m!612259))

(assert (=> b!638312 m!612241))

(declare-fun m!612261 () Bool)

(assert (=> b!638312 m!612261))

(assert (=> b!638303 m!612241))

(assert (=> b!638303 m!612241))

(declare-fun m!612263 () Bool)

(assert (=> b!638303 m!612263))

(declare-fun m!612265 () Bool)

(assert (=> b!638305 m!612265))

(assert (=> b!638314 m!612241))

(assert (=> b!638314 m!612251))

(declare-fun m!612267 () Bool)

(assert (=> b!638314 m!612267))

(declare-fun m!612269 () Bool)

(assert (=> b!638304 m!612269))

(declare-fun m!612271 () Bool)

(assert (=> b!638302 m!612271))

(assert (=> b!638302 m!612241))

(assert (=> b!638302 m!612241))

(declare-fun m!612273 () Bool)

(assert (=> b!638302 m!612273))

(declare-fun m!612275 () Bool)

(assert (=> b!638315 m!612275))

(declare-fun m!612277 () Bool)

(assert (=> b!638307 m!612277))

(declare-fun m!612279 () Bool)

(assert (=> b!638307 m!612279))

(declare-fun m!612281 () Bool)

(assert (=> b!638307 m!612281))

(declare-fun m!612283 () Bool)

(assert (=> b!638307 m!612283))

(assert (=> b!638307 m!612241))

(assert (=> b!638307 m!612251))

(declare-fun m!612285 () Bool)

(assert (=> b!638307 m!612285))

(assert (=> b!638307 m!612241))

(declare-fun m!612287 () Bool)

(assert (=> b!638307 m!612287))

(assert (=> b!638313 m!612241))

(assert (=> b!638313 m!612241))

(declare-fun m!612289 () Bool)

(assert (=> b!638313 m!612289))

(declare-fun m!612291 () Bool)

(assert (=> b!638309 m!612291))

(assert (=> b!638308 m!612241))

(assert (=> b!638308 m!612241))

(declare-fun m!612293 () Bool)

(assert (=> b!638308 m!612293))

(check-sat (not b!638302) (not b!638312) (not b!638313) (not b!638297) (not b!638300) (not b!638310) (not b!638296) (not b!638306) (not b!638303) (not start!57712) (not b!638307) (not b!638311) (not b!638308) (not b!638315) (not b!638304) (not b!638309))
(check-sat)
