; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56412 () Bool)

(assert start!56412)

(declare-fun b!625247 () Bool)

(declare-fun res!403399 () Bool)

(declare-fun e!358336 () Bool)

(assert (=> b!625247 (=> (not res!403399) (not e!358336))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!37806 0))(
  ( (array!37807 (arr!18146 (Array (_ BitVec 32) (_ BitVec 64))) (size!18511 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37806)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625247 (= res!403399 (and (= (size!18511 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18511 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18511 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!403395 () Bool)

(assert (=> start!56412 (=> (not res!403395) (not e!358336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56412 (= res!403395 (validMask!0 mask!3053))))

(assert (=> start!56412 e!358336))

(assert (=> start!56412 true))

(declare-fun array_inv!14029 (array!37806) Bool)

(assert (=> start!56412 (array_inv!14029 a!2986)))

(declare-fun b!625248 () Bool)

(declare-fun res!403397 () Bool)

(declare-fun e!358337 () Bool)

(assert (=> b!625248 (=> (not res!403397) (not e!358337))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!625248 (= res!403397 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18146 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18146 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625249 () Bool)

(declare-fun res!403400 () Bool)

(assert (=> b!625249 (=> (not res!403400) (not e!358336))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625249 (= res!403400 (validKeyInArray!0 k0!1786))))

(declare-fun b!625250 () Bool)

(declare-fun res!403402 () Bool)

(assert (=> b!625250 (=> (not res!403402) (not e!358337))))

(declare-datatypes ((List!12226 0))(
  ( (Nil!12223) (Cons!12222 (h!13267 (_ BitVec 64)) (t!18445 List!12226)) )
))
(declare-fun arrayNoDuplicates!0 (array!37806 (_ BitVec 32) List!12226) Bool)

(assert (=> b!625250 (= res!403402 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12223))))

(declare-fun b!625251 () Bool)

(assert (=> b!625251 (= e!358337 false)))

(declare-datatypes ((SeekEntryResult!6583 0))(
  ( (MissingZero!6583 (index!28616 (_ BitVec 32))) (Found!6583 (index!28617 (_ BitVec 32))) (Intermediate!6583 (undefined!7395 Bool) (index!28618 (_ BitVec 32)) (x!57376 (_ BitVec 32))) (Undefined!6583) (MissingVacant!6583 (index!28619 (_ BitVec 32))) )
))
(declare-fun lt!289609 () SeekEntryResult!6583)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37806 (_ BitVec 32)) SeekEntryResult!6583)

(assert (=> b!625251 (= lt!289609 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18146 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625252 () Bool)

(declare-fun res!403398 () Bool)

(assert (=> b!625252 (=> (not res!403398) (not e!358336))))

(declare-fun arrayContainsKey!0 (array!37806 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625252 (= res!403398 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625253 () Bool)

(declare-fun res!403403 () Bool)

(assert (=> b!625253 (=> (not res!403403) (not e!358337))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37806 (_ BitVec 32)) Bool)

(assert (=> b!625253 (= res!403403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625254 () Bool)

(declare-fun res!403396 () Bool)

(assert (=> b!625254 (=> (not res!403396) (not e!358336))))

(assert (=> b!625254 (= res!403396 (validKeyInArray!0 (select (arr!18146 a!2986) j!136)))))

(declare-fun b!625255 () Bool)

(assert (=> b!625255 (= e!358336 e!358337)))

(declare-fun res!403401 () Bool)

(assert (=> b!625255 (=> (not res!403401) (not e!358337))))

(declare-fun lt!289608 () SeekEntryResult!6583)

(assert (=> b!625255 (= res!403401 (or (= lt!289608 (MissingZero!6583 i!1108)) (= lt!289608 (MissingVacant!6583 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37806 (_ BitVec 32)) SeekEntryResult!6583)

(assert (=> b!625255 (= lt!289608 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!56412 res!403395) b!625247))

(assert (= (and b!625247 res!403399) b!625254))

(assert (= (and b!625254 res!403396) b!625249))

(assert (= (and b!625249 res!403400) b!625252))

(assert (= (and b!625252 res!403398) b!625255))

(assert (= (and b!625255 res!403401) b!625253))

(assert (= (and b!625253 res!403403) b!625250))

(assert (= (and b!625250 res!403402) b!625248))

(assert (= (and b!625248 res!403397) b!625251))

(declare-fun m!600313 () Bool)

(assert (=> b!625250 m!600313))

(declare-fun m!600315 () Bool)

(assert (=> b!625255 m!600315))

(declare-fun m!600317 () Bool)

(assert (=> start!56412 m!600317))

(declare-fun m!600319 () Bool)

(assert (=> start!56412 m!600319))

(declare-fun m!600321 () Bool)

(assert (=> b!625251 m!600321))

(assert (=> b!625251 m!600321))

(declare-fun m!600323 () Bool)

(assert (=> b!625251 m!600323))

(declare-fun m!600325 () Bool)

(assert (=> b!625252 m!600325))

(declare-fun m!600327 () Bool)

(assert (=> b!625249 m!600327))

(declare-fun m!600329 () Bool)

(assert (=> b!625253 m!600329))

(declare-fun m!600331 () Bool)

(assert (=> b!625248 m!600331))

(declare-fun m!600333 () Bool)

(assert (=> b!625248 m!600333))

(declare-fun m!600335 () Bool)

(assert (=> b!625248 m!600335))

(assert (=> b!625254 m!600321))

(assert (=> b!625254 m!600321))

(declare-fun m!600337 () Bool)

(assert (=> b!625254 m!600337))

(check-sat (not b!625254) (not b!625255) (not b!625249) (not b!625251) (not b!625250) (not b!625252) (not start!56412) (not b!625253))
(check-sat)
