; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59350 () Bool)

(assert start!59350)

(declare-fun b!655173 () Bool)

(declare-datatypes ((Unit!22504 0))(
  ( (Unit!22505) )
))
(declare-fun e!376266 () Unit!22504)

(declare-fun Unit!22506 () Unit!22504)

(assert (=> b!655173 (= e!376266 Unit!22506)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun res!425003 () Bool)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38670 0))(
  ( (array!38671 (arr!18535 (Array (_ BitVec 32) (_ BitVec 64))) (size!18899 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38670)

(assert (=> b!655173 (= res!425003 (= (select (store (arr!18535 a!2986) i!1108 k0!1786) index!984) (select (arr!18535 a!2986) j!136)))))

(declare-fun e!376262 () Bool)

(assert (=> b!655173 (=> (not res!425003) (not e!376262))))

(assert (=> b!655173 e!376262))

(declare-fun c!75458 () Bool)

(assert (=> b!655173 (= c!75458 (bvslt j!136 index!984))))

(declare-fun lt!305468 () Unit!22504)

(declare-fun e!376264 () Unit!22504)

(assert (=> b!655173 (= lt!305468 e!376264)))

(declare-fun c!75456 () Bool)

(assert (=> b!655173 (= c!75456 (bvslt index!984 j!136))))

(declare-fun lt!305481 () Unit!22504)

(declare-fun e!376257 () Unit!22504)

(assert (=> b!655173 (= lt!305481 e!376257)))

(assert (=> b!655173 false))

(declare-fun b!655174 () Bool)

(declare-fun res!425011 () Bool)

(declare-fun e!376263 () Bool)

(assert (=> b!655174 (=> (not res!425011) (not e!376263))))

(declare-fun arrayContainsKey!0 (array!38670 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!655174 (= res!425011 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!425005 () Bool)

(assert (=> start!59350 (=> (not res!425005) (not e!376263))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59350 (= res!425005 (validMask!0 mask!3053))))

(assert (=> start!59350 e!376263))

(assert (=> start!59350 true))

(declare-fun array_inv!14331 (array!38670) Bool)

(assert (=> start!59350 (array_inv!14331 a!2986)))

(declare-fun b!655175 () Bool)

(declare-fun res!424997 () Bool)

(declare-fun e!376259 () Bool)

(assert (=> b!655175 (=> (not res!424997) (not e!376259))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!655175 (= res!424997 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18535 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!305480 () array!38670)

(declare-fun e!376253 () Bool)

(declare-fun b!655176 () Bool)

(assert (=> b!655176 (= e!376253 (arrayContainsKey!0 lt!305480 (select (arr!18535 a!2986) j!136) index!984))))

(declare-fun b!655177 () Bool)

(assert (=> b!655177 false))

(declare-fun lt!305469 () Unit!22504)

(declare-datatypes ((List!12576 0))(
  ( (Nil!12573) (Cons!12572 (h!13617 (_ BitVec 64)) (t!18804 List!12576)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38670 (_ BitVec 64) (_ BitVec 32) List!12576) Unit!22504)

(assert (=> b!655177 (= lt!305469 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305480 (select (arr!18535 a!2986) j!136) index!984 Nil!12573))))

(declare-fun arrayNoDuplicates!0 (array!38670 (_ BitVec 32) List!12576) Bool)

(assert (=> b!655177 (arrayNoDuplicates!0 lt!305480 index!984 Nil!12573)))

(declare-fun lt!305473 () Unit!22504)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38670 (_ BitVec 32) (_ BitVec 32)) Unit!22504)

(assert (=> b!655177 (= lt!305473 (lemmaNoDuplicateFromThenFromBigger!0 lt!305480 #b00000000000000000000000000000000 index!984))))

(assert (=> b!655177 (arrayNoDuplicates!0 lt!305480 #b00000000000000000000000000000000 Nil!12573)))

(declare-fun lt!305477 () Unit!22504)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38670 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12576) Unit!22504)

(assert (=> b!655177 (= lt!305477 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12573))))

(assert (=> b!655177 (arrayContainsKey!0 lt!305480 (select (arr!18535 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305474 () Unit!22504)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38670 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22504)

(assert (=> b!655177 (= lt!305474 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305480 (select (arr!18535 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!655177 e!376253))

(declare-fun res!425012 () Bool)

(assert (=> b!655177 (=> (not res!425012) (not e!376253))))

(assert (=> b!655177 (= res!425012 (arrayContainsKey!0 lt!305480 (select (arr!18535 a!2986) j!136) j!136))))

(declare-fun Unit!22507 () Unit!22504)

(assert (=> b!655177 (= e!376257 Unit!22507)))

(declare-fun b!655178 () Bool)

(declare-fun res!425008 () Bool)

(assert (=> b!655178 (= res!425008 (bvsge j!136 index!984))))

(declare-fun e!376256 () Bool)

(assert (=> b!655178 (=> res!425008 e!376256)))

(assert (=> b!655178 (= e!376262 e!376256)))

(declare-fun b!655179 () Bool)

(declare-fun e!376258 () Bool)

(declare-datatypes ((SeekEntryResult!6975 0))(
  ( (MissingZero!6975 (index!30259 (_ BitVec 32))) (Found!6975 (index!30260 (_ BitVec 32))) (Intermediate!6975 (undefined!7787 Bool) (index!30261 (_ BitVec 32)) (x!59048 (_ BitVec 32))) (Undefined!6975) (MissingVacant!6975 (index!30262 (_ BitVec 32))) )
))
(declare-fun lt!305464 () SeekEntryResult!6975)

(declare-fun lt!305466 () SeekEntryResult!6975)

(assert (=> b!655179 (= e!376258 (= lt!305464 lt!305466))))

(declare-fun b!655180 () Bool)

(declare-fun e!376254 () Bool)

(assert (=> b!655180 (= e!376254 (arrayContainsKey!0 lt!305480 (select (arr!18535 a!2986) j!136) index!984))))

(declare-fun b!655181 () Bool)

(declare-fun Unit!22508 () Unit!22504)

(assert (=> b!655181 (= e!376257 Unit!22508)))

(declare-fun b!655182 () Bool)

(declare-fun Unit!22509 () Unit!22504)

(assert (=> b!655182 (= e!376266 Unit!22509)))

(declare-fun b!655183 () Bool)

(declare-fun e!376261 () Bool)

(declare-fun e!376255 () Bool)

(assert (=> b!655183 (= e!376261 e!376255)))

(declare-fun res!425004 () Bool)

(assert (=> b!655183 (=> (not res!425004) (not e!376255))))

(assert (=> b!655183 (= res!425004 (and (= lt!305464 (Found!6975 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18535 a!2986) index!984) (select (arr!18535 a!2986) j!136))) (not (= (select (arr!18535 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38670 (_ BitVec 32)) SeekEntryResult!6975)

(assert (=> b!655183 (= lt!305464 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18535 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!655184 () Bool)

(declare-fun e!376265 () Unit!22504)

(declare-fun Unit!22510 () Unit!22504)

(assert (=> b!655184 (= e!376265 Unit!22510)))

(assert (=> b!655184 false))

(declare-fun b!655185 () Bool)

(declare-fun Unit!22511 () Unit!22504)

(assert (=> b!655185 (= e!376265 Unit!22511)))

(declare-fun b!655186 () Bool)

(assert (=> b!655186 (= e!376259 e!376261)))

(declare-fun res!425006 () Bool)

(assert (=> b!655186 (=> (not res!425006) (not e!376261))))

(assert (=> b!655186 (= res!425006 (= (select (store (arr!18535 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!655186 (= lt!305480 (array!38671 (store (arr!18535 a!2986) i!1108 k0!1786) (size!18899 a!2986)))))

(declare-fun b!655187 () Bool)

(assert (=> b!655187 false))

(declare-fun lt!305471 () Unit!22504)

(assert (=> b!655187 (= lt!305471 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305480 (select (arr!18535 a!2986) j!136) j!136 Nil!12573))))

(assert (=> b!655187 (arrayNoDuplicates!0 lt!305480 j!136 Nil!12573)))

(declare-fun lt!305465 () Unit!22504)

(assert (=> b!655187 (= lt!305465 (lemmaNoDuplicateFromThenFromBigger!0 lt!305480 #b00000000000000000000000000000000 j!136))))

(assert (=> b!655187 (arrayNoDuplicates!0 lt!305480 #b00000000000000000000000000000000 Nil!12573)))

(declare-fun lt!305479 () Unit!22504)

(assert (=> b!655187 (= lt!305479 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12573))))

(assert (=> b!655187 (arrayContainsKey!0 lt!305480 (select (arr!18535 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305472 () Unit!22504)

(assert (=> b!655187 (= lt!305472 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305480 (select (arr!18535 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22512 () Unit!22504)

(assert (=> b!655187 (= e!376264 Unit!22512)))

(declare-fun b!655188 () Bool)

(declare-fun res!425010 () Bool)

(assert (=> b!655188 (=> (not res!425010) (not e!376259))))

(assert (=> b!655188 (= res!425010 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12573))))

(declare-fun b!655189 () Bool)

(declare-fun res!424998 () Bool)

(assert (=> b!655189 (=> (not res!424998) (not e!376263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!655189 (= res!424998 (validKeyInArray!0 k0!1786))))

(declare-fun b!655190 () Bool)

(declare-fun res!425009 () Bool)

(assert (=> b!655190 (=> (not res!425009) (not e!376263))))

(assert (=> b!655190 (= res!425009 (and (= (size!18899 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18899 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18899 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!655191 () Bool)

(assert (=> b!655191 (= e!376263 e!376259)))

(declare-fun res!425007 () Bool)

(assert (=> b!655191 (=> (not res!425007) (not e!376259))))

(declare-fun lt!305463 () SeekEntryResult!6975)

(assert (=> b!655191 (= res!425007 (or (= lt!305463 (MissingZero!6975 i!1108)) (= lt!305463 (MissingVacant!6975 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38670 (_ BitVec 32)) SeekEntryResult!6975)

(assert (=> b!655191 (= lt!305463 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!655192 () Bool)

(declare-fun res!424999 () Bool)

(assert (=> b!655192 (=> (not res!424999) (not e!376259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38670 (_ BitVec 32)) Bool)

(assert (=> b!655192 (= res!424999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!655193 () Bool)

(assert (=> b!655193 (= e!376255 (not true))))

(declare-fun lt!305476 () Unit!22504)

(assert (=> b!655193 (= lt!305476 e!376266)))

(declare-fun c!75457 () Bool)

(declare-fun lt!305478 () SeekEntryResult!6975)

(assert (=> b!655193 (= c!75457 (= lt!305478 (Found!6975 index!984)))))

(declare-fun lt!305475 () Unit!22504)

(assert (=> b!655193 (= lt!305475 e!376265)))

(declare-fun c!75455 () Bool)

(assert (=> b!655193 (= c!75455 (= lt!305478 Undefined!6975))))

(declare-fun lt!305470 () (_ BitVec 64))

(assert (=> b!655193 (= lt!305478 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305470 lt!305480 mask!3053))))

(assert (=> b!655193 e!376258))

(declare-fun res!425001 () Bool)

(assert (=> b!655193 (=> (not res!425001) (not e!376258))))

(declare-fun lt!305482 () (_ BitVec 32))

(assert (=> b!655193 (= res!425001 (= lt!305466 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305482 vacantSpotIndex!68 lt!305470 lt!305480 mask!3053)))))

(assert (=> b!655193 (= lt!305466 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305482 vacantSpotIndex!68 (select (arr!18535 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!655193 (= lt!305470 (select (store (arr!18535 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!305467 () Unit!22504)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38670 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22504)

(assert (=> b!655193 (= lt!305467 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305482 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!655193 (= lt!305482 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!655194 () Bool)

(declare-fun Unit!22513 () Unit!22504)

(assert (=> b!655194 (= e!376264 Unit!22513)))

(declare-fun b!655195 () Bool)

(declare-fun res!425000 () Bool)

(assert (=> b!655195 (= res!425000 (arrayContainsKey!0 lt!305480 (select (arr!18535 a!2986) j!136) j!136))))

(assert (=> b!655195 (=> (not res!425000) (not e!376254))))

(assert (=> b!655195 (= e!376256 e!376254)))

(declare-fun b!655196 () Bool)

(declare-fun res!425002 () Bool)

(assert (=> b!655196 (=> (not res!425002) (not e!376263))))

(assert (=> b!655196 (= res!425002 (validKeyInArray!0 (select (arr!18535 a!2986) j!136)))))

(assert (= (and start!59350 res!425005) b!655190))

(assert (= (and b!655190 res!425009) b!655196))

(assert (= (and b!655196 res!425002) b!655189))

(assert (= (and b!655189 res!424998) b!655174))

(assert (= (and b!655174 res!425011) b!655191))

(assert (= (and b!655191 res!425007) b!655192))

(assert (= (and b!655192 res!424999) b!655188))

(assert (= (and b!655188 res!425010) b!655175))

(assert (= (and b!655175 res!424997) b!655186))

(assert (= (and b!655186 res!425006) b!655183))

(assert (= (and b!655183 res!425004) b!655193))

(assert (= (and b!655193 res!425001) b!655179))

(assert (= (and b!655193 c!75455) b!655184))

(assert (= (and b!655193 (not c!75455)) b!655185))

(assert (= (and b!655193 c!75457) b!655173))

(assert (= (and b!655193 (not c!75457)) b!655182))

(assert (= (and b!655173 res!425003) b!655178))

(assert (= (and b!655178 (not res!425008)) b!655195))

(assert (= (and b!655195 res!425000) b!655180))

(assert (= (and b!655173 c!75458) b!655187))

(assert (= (and b!655173 (not c!75458)) b!655194))

(assert (= (and b!655173 c!75456) b!655177))

(assert (= (and b!655173 (not c!75456)) b!655181))

(assert (= (and b!655177 res!425012) b!655176))

(declare-fun m!628257 () Bool)

(assert (=> b!655183 m!628257))

(declare-fun m!628259 () Bool)

(assert (=> b!655183 m!628259))

(assert (=> b!655183 m!628259))

(declare-fun m!628261 () Bool)

(assert (=> b!655183 m!628261))

(declare-fun m!628263 () Bool)

(assert (=> b!655191 m!628263))

(declare-fun m!628265 () Bool)

(assert (=> b!655175 m!628265))

(declare-fun m!628267 () Bool)

(assert (=> b!655189 m!628267))

(declare-fun m!628269 () Bool)

(assert (=> b!655188 m!628269))

(assert (=> b!655195 m!628259))

(assert (=> b!655195 m!628259))

(declare-fun m!628271 () Bool)

(assert (=> b!655195 m!628271))

(assert (=> b!655187 m!628259))

(declare-fun m!628273 () Bool)

(assert (=> b!655187 m!628273))

(assert (=> b!655187 m!628259))

(declare-fun m!628275 () Bool)

(assert (=> b!655187 m!628275))

(assert (=> b!655187 m!628259))

(assert (=> b!655187 m!628259))

(declare-fun m!628277 () Bool)

(assert (=> b!655187 m!628277))

(declare-fun m!628279 () Bool)

(assert (=> b!655187 m!628279))

(declare-fun m!628281 () Bool)

(assert (=> b!655187 m!628281))

(declare-fun m!628283 () Bool)

(assert (=> b!655187 m!628283))

(declare-fun m!628285 () Bool)

(assert (=> b!655187 m!628285))

(assert (=> b!655176 m!628259))

(assert (=> b!655176 m!628259))

(declare-fun m!628287 () Bool)

(assert (=> b!655176 m!628287))

(assert (=> b!655180 m!628259))

(assert (=> b!655180 m!628259))

(assert (=> b!655180 m!628287))

(declare-fun m!628289 () Bool)

(assert (=> b!655193 m!628289))

(declare-fun m!628291 () Bool)

(assert (=> b!655193 m!628291))

(assert (=> b!655193 m!628259))

(declare-fun m!628293 () Bool)

(assert (=> b!655193 m!628293))

(declare-fun m!628295 () Bool)

(assert (=> b!655193 m!628295))

(declare-fun m!628297 () Bool)

(assert (=> b!655193 m!628297))

(declare-fun m!628299 () Bool)

(assert (=> b!655193 m!628299))

(assert (=> b!655193 m!628259))

(declare-fun m!628301 () Bool)

(assert (=> b!655193 m!628301))

(declare-fun m!628303 () Bool)

(assert (=> start!59350 m!628303))

(declare-fun m!628305 () Bool)

(assert (=> start!59350 m!628305))

(declare-fun m!628307 () Bool)

(assert (=> b!655192 m!628307))

(declare-fun m!628309 () Bool)

(assert (=> b!655174 m!628309))

(declare-fun m!628311 () Bool)

(assert (=> b!655177 m!628311))

(assert (=> b!655177 m!628259))

(declare-fun m!628313 () Bool)

(assert (=> b!655177 m!628313))

(assert (=> b!655177 m!628279))

(assert (=> b!655177 m!628259))

(declare-fun m!628315 () Bool)

(assert (=> b!655177 m!628315))

(assert (=> b!655177 m!628259))

(assert (=> b!655177 m!628271))

(declare-fun m!628317 () Bool)

(assert (=> b!655177 m!628317))

(assert (=> b!655177 m!628285))

(assert (=> b!655177 m!628259))

(declare-fun m!628319 () Bool)

(assert (=> b!655177 m!628319))

(assert (=> b!655177 m!628259))

(assert (=> b!655173 m!628293))

(declare-fun m!628321 () Bool)

(assert (=> b!655173 m!628321))

(assert (=> b!655173 m!628259))

(assert (=> b!655196 m!628259))

(assert (=> b!655196 m!628259))

(declare-fun m!628323 () Bool)

(assert (=> b!655196 m!628323))

(assert (=> b!655186 m!628293))

(declare-fun m!628325 () Bool)

(assert (=> b!655186 m!628325))

(check-sat (not b!655177) (not b!655183) (not b!655193) (not start!59350) (not b!655188) (not b!655196) (not b!655195) (not b!655180) (not b!655191) (not b!655189) (not b!655174) (not b!655187) (not b!655176) (not b!655192))
(check-sat)
