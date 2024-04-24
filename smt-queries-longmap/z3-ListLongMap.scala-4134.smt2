; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56448 () Bool)

(assert start!56448)

(declare-fun b!625313 () Bool)

(declare-fun res!403218 () Bool)

(declare-fun e!358506 () Bool)

(assert (=> b!625313 (=> (not res!403218) (not e!358506))))

(declare-datatypes ((array!37773 0))(
  ( (array!37774 (arr!18127 (Array (_ BitVec 32) (_ BitVec 64))) (size!18491 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37773)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625313 (= res!403218 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625314 () Bool)

(declare-fun res!403220 () Bool)

(declare-fun e!358504 () Bool)

(assert (=> b!625314 (=> (not res!403220) (not e!358504))))

(declare-datatypes ((List!12075 0))(
  ( (Nil!12072) (Cons!12071 (h!13119 (_ BitVec 64)) (t!18295 List!12075)) )
))
(declare-fun arrayNoDuplicates!0 (array!37773 (_ BitVec 32) List!12075) Bool)

(assert (=> b!625314 (= res!403220 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12072))))

(declare-fun b!625315 () Bool)

(declare-fun res!403216 () Bool)

(assert (=> b!625315 (=> (not res!403216) (not e!358506))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625315 (= res!403216 (validKeyInArray!0 k0!1786))))

(declare-fun b!625316 () Bool)

(assert (=> b!625316 (= e!358506 e!358504)))

(declare-fun res!403221 () Bool)

(assert (=> b!625316 (=> (not res!403221) (not e!358504))))

(declare-datatypes ((SeekEntryResult!6523 0))(
  ( (MissingZero!6523 (index!28376 (_ BitVec 32))) (Found!6523 (index!28377 (_ BitVec 32))) (Intermediate!6523 (undefined!7335 Bool) (index!28378 (_ BitVec 32)) (x!57284 (_ BitVec 32))) (Undefined!6523) (MissingVacant!6523 (index!28379 (_ BitVec 32))) )
))
(declare-fun lt!289864 () SeekEntryResult!6523)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625316 (= res!403221 (or (= lt!289864 (MissingZero!6523 i!1108)) (= lt!289864 (MissingVacant!6523 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37773 (_ BitVec 32)) SeekEntryResult!6523)

(assert (=> b!625316 (= lt!289864 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625317 () Bool)

(declare-fun res!403222 () Bool)

(assert (=> b!625317 (=> (not res!403222) (not e!358506))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!625317 (= res!403222 (validKeyInArray!0 (select (arr!18127 a!2986) j!136)))))

(declare-fun res!403219 () Bool)

(assert (=> start!56448 (=> (not res!403219) (not e!358506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56448 (= res!403219 (validMask!0 mask!3053))))

(assert (=> start!56448 e!358506))

(assert (=> start!56448 true))

(declare-fun array_inv!13986 (array!37773) Bool)

(assert (=> start!56448 (array_inv!13986 a!2986)))

(declare-fun b!625318 () Bool)

(declare-fun res!403214 () Bool)

(assert (=> b!625318 (=> (not res!403214) (not e!358504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37773 (_ BitVec 32)) Bool)

(assert (=> b!625318 (= res!403214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625319 () Bool)

(assert (=> b!625319 (= e!358504 false)))

(declare-fun lt!289863 () SeekEntryResult!6523)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37773 (_ BitVec 32)) SeekEntryResult!6523)

(assert (=> b!625319 (= lt!289863 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18127 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625320 () Bool)

(declare-fun res!403215 () Bool)

(assert (=> b!625320 (=> (not res!403215) (not e!358506))))

(assert (=> b!625320 (= res!403215 (and (= (size!18491 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18491 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18491 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625321 () Bool)

(declare-fun res!403217 () Bool)

(assert (=> b!625321 (=> (not res!403217) (not e!358504))))

(assert (=> b!625321 (= res!403217 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18127 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18127 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56448 res!403219) b!625320))

(assert (= (and b!625320 res!403215) b!625317))

(assert (= (and b!625317 res!403222) b!625315))

(assert (= (and b!625315 res!403216) b!625313))

(assert (= (and b!625313 res!403218) b!625316))

(assert (= (and b!625316 res!403221) b!625318))

(assert (= (and b!625318 res!403214) b!625314))

(assert (= (and b!625314 res!403220) b!625321))

(assert (= (and b!625321 res!403217) b!625319))

(declare-fun m!601177 () Bool)

(assert (=> b!625316 m!601177))

(declare-fun m!601179 () Bool)

(assert (=> b!625319 m!601179))

(assert (=> b!625319 m!601179))

(declare-fun m!601181 () Bool)

(assert (=> b!625319 m!601181))

(declare-fun m!601183 () Bool)

(assert (=> b!625318 m!601183))

(declare-fun m!601185 () Bool)

(assert (=> start!56448 m!601185))

(declare-fun m!601187 () Bool)

(assert (=> start!56448 m!601187))

(declare-fun m!601189 () Bool)

(assert (=> b!625321 m!601189))

(declare-fun m!601191 () Bool)

(assert (=> b!625321 m!601191))

(declare-fun m!601193 () Bool)

(assert (=> b!625321 m!601193))

(declare-fun m!601195 () Bool)

(assert (=> b!625315 m!601195))

(declare-fun m!601197 () Bool)

(assert (=> b!625314 m!601197))

(assert (=> b!625317 m!601179))

(assert (=> b!625317 m!601179))

(declare-fun m!601199 () Bool)

(assert (=> b!625317 m!601199))

(declare-fun m!601201 () Bool)

(assert (=> b!625313 m!601201))

(check-sat (not b!625317) (not b!625314) (not b!625316) (not b!625319) (not b!625318) (not start!56448) (not b!625315) (not b!625313))
(check-sat)
