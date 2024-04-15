; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56736 () Bool)

(assert start!56736)

(declare-fun b!628572 () Bool)

(declare-fun res!406274 () Bool)

(declare-fun e!359542 () Bool)

(assert (=> b!628572 (=> (not res!406274) (not e!359542))))

(declare-datatypes ((array!37989 0))(
  ( (array!37990 (arr!18233 (Array (_ BitVec 32) (_ BitVec 64))) (size!18598 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37989)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628572 (= res!406274 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628573 () Bool)

(declare-fun res!406277 () Bool)

(declare-fun e!359544 () Bool)

(assert (=> b!628573 (=> (not res!406277) (not e!359544))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!628573 (= res!406277 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18233 a!2986) index!984) (select (arr!18233 a!2986) j!136))) (not (= (select (arr!18233 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628574 () Bool)

(declare-fun res!406271 () Bool)

(assert (=> b!628574 (=> (not res!406271) (not e!359542))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!628574 (= res!406271 (and (= (size!18598 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18598 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18598 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628575 () Bool)

(assert (=> b!628575 (= e!359542 e!359544)))

(declare-fun res!406272 () Bool)

(assert (=> b!628575 (=> (not res!406272) (not e!359544))))

(declare-datatypes ((SeekEntryResult!6670 0))(
  ( (MissingZero!6670 (index!28964 (_ BitVec 32))) (Found!6670 (index!28965 (_ BitVec 32))) (Intermediate!6670 (undefined!7482 Bool) (index!28966 (_ BitVec 32)) (x!57707 (_ BitVec 32))) (Undefined!6670) (MissingVacant!6670 (index!28967 (_ BitVec 32))) )
))
(declare-fun lt!290344 () SeekEntryResult!6670)

(assert (=> b!628575 (= res!406272 (or (= lt!290344 (MissingZero!6670 i!1108)) (= lt!290344 (MissingVacant!6670 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37989 (_ BitVec 32)) SeekEntryResult!6670)

(assert (=> b!628575 (= lt!290344 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!628577 () Bool)

(declare-fun res!406273 () Bool)

(assert (=> b!628577 (=> (not res!406273) (not e!359544))))

(declare-datatypes ((List!12313 0))(
  ( (Nil!12310) (Cons!12309 (h!13354 (_ BitVec 64)) (t!18532 List!12313)) )
))
(declare-fun arrayNoDuplicates!0 (array!37989 (_ BitVec 32) List!12313) Bool)

(assert (=> b!628577 (= res!406273 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12310))))

(declare-fun b!628578 () Bool)

(declare-fun res!406275 () Bool)

(assert (=> b!628578 (=> (not res!406275) (not e!359544))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37989 (_ BitVec 32)) SeekEntryResult!6670)

(assert (=> b!628578 (= res!406275 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18233 a!2986) j!136) a!2986 mask!3053) (Found!6670 j!136)))))

(declare-fun b!628579 () Bool)

(assert (=> b!628579 (= e!359544 false)))

(declare-fun lt!290343 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628579 (= lt!290343 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!628580 () Bool)

(declare-fun res!406279 () Bool)

(assert (=> b!628580 (=> (not res!406279) (not e!359542))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628580 (= res!406279 (validKeyInArray!0 (select (arr!18233 a!2986) j!136)))))

(declare-fun b!628576 () Bool)

(declare-fun res!406280 () Bool)

(assert (=> b!628576 (=> (not res!406280) (not e!359544))))

(assert (=> b!628576 (= res!406280 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18233 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18233 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!406270 () Bool)

(assert (=> start!56736 (=> (not res!406270) (not e!359542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56736 (= res!406270 (validMask!0 mask!3053))))

(assert (=> start!56736 e!359542))

(assert (=> start!56736 true))

(declare-fun array_inv!14116 (array!37989) Bool)

(assert (=> start!56736 (array_inv!14116 a!2986)))

(declare-fun b!628581 () Bool)

(declare-fun res!406278 () Bool)

(assert (=> b!628581 (=> (not res!406278) (not e!359542))))

(assert (=> b!628581 (= res!406278 (validKeyInArray!0 k0!1786))))

(declare-fun b!628582 () Bool)

(declare-fun res!406276 () Bool)

(assert (=> b!628582 (=> (not res!406276) (not e!359544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37989 (_ BitVec 32)) Bool)

(assert (=> b!628582 (= res!406276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56736 res!406270) b!628574))

(assert (= (and b!628574 res!406271) b!628580))

(assert (= (and b!628580 res!406279) b!628581))

(assert (= (and b!628581 res!406278) b!628572))

(assert (= (and b!628572 res!406274) b!628575))

(assert (= (and b!628575 res!406272) b!628582))

(assert (= (and b!628582 res!406276) b!628577))

(assert (= (and b!628577 res!406273) b!628576))

(assert (= (and b!628576 res!406280) b!628578))

(assert (= (and b!628578 res!406275) b!628573))

(assert (= (and b!628573 res!406277) b!628579))

(declare-fun m!603193 () Bool)

(assert (=> b!628572 m!603193))

(declare-fun m!603195 () Bool)

(assert (=> b!628576 m!603195))

(declare-fun m!603197 () Bool)

(assert (=> b!628576 m!603197))

(declare-fun m!603199 () Bool)

(assert (=> b!628576 m!603199))

(declare-fun m!603201 () Bool)

(assert (=> start!56736 m!603201))

(declare-fun m!603203 () Bool)

(assert (=> start!56736 m!603203))

(declare-fun m!603205 () Bool)

(assert (=> b!628581 m!603205))

(declare-fun m!603207 () Bool)

(assert (=> b!628573 m!603207))

(declare-fun m!603209 () Bool)

(assert (=> b!628573 m!603209))

(declare-fun m!603211 () Bool)

(assert (=> b!628582 m!603211))

(declare-fun m!603213 () Bool)

(assert (=> b!628575 m!603213))

(assert (=> b!628578 m!603209))

(assert (=> b!628578 m!603209))

(declare-fun m!603215 () Bool)

(assert (=> b!628578 m!603215))

(declare-fun m!603217 () Bool)

(assert (=> b!628577 m!603217))

(assert (=> b!628580 m!603209))

(assert (=> b!628580 m!603209))

(declare-fun m!603219 () Bool)

(assert (=> b!628580 m!603219))

(declare-fun m!603221 () Bool)

(assert (=> b!628579 m!603221))

(check-sat (not b!628575) (not b!628579) (not b!628572) (not start!56736) (not b!628578) (not b!628577) (not b!628582) (not b!628580) (not b!628581))
(check-sat)
