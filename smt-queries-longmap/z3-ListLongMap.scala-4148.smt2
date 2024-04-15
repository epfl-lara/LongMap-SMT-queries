; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56562 () Bool)

(assert start!56562)

(declare-fun b!626435 () Bool)

(declare-fun res!404280 () Bool)

(declare-fun e!358868 () Bool)

(assert (=> b!626435 (=> (not res!404280) (not e!358868))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626435 (= res!404280 (validKeyInArray!0 k0!1786))))

(declare-fun b!626436 () Bool)

(declare-fun res!404278 () Bool)

(assert (=> b!626436 (=> (not res!404278) (not e!358868))))

(declare-datatypes ((array!37866 0))(
  ( (array!37867 (arr!18173 (Array (_ BitVec 32) (_ BitVec 64))) (size!18538 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37866)

(declare-fun arrayContainsKey!0 (array!37866 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626436 (= res!404278 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626438 () Bool)

(declare-fun res!404281 () Bool)

(declare-fun e!358869 () Bool)

(assert (=> b!626438 (=> (not res!404281) (not e!358869))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!626438 (= res!404281 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18173 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18173 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626439 () Bool)

(assert (=> b!626439 (= e!358869 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6610 0))(
  ( (MissingZero!6610 (index!28724 (_ BitVec 32))) (Found!6610 (index!28725 (_ BitVec 32))) (Intermediate!6610 (undefined!7422 Bool) (index!28726 (_ BitVec 32)) (x!57481 (_ BitVec 32))) (Undefined!6610) (MissingVacant!6610 (index!28727 (_ BitVec 32))) )
))
(declare-fun lt!289902 () SeekEntryResult!6610)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37866 (_ BitVec 32)) SeekEntryResult!6610)

(assert (=> b!626439 (= lt!289902 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18173 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626440 () Bool)

(declare-fun res!404282 () Bool)

(assert (=> b!626440 (=> (not res!404282) (not e!358868))))

(assert (=> b!626440 (= res!404282 (and (= (size!18538 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18538 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18538 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626441 () Bool)

(declare-fun res!404285 () Bool)

(assert (=> b!626441 (=> (not res!404285) (not e!358869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37866 (_ BitVec 32)) Bool)

(assert (=> b!626441 (= res!404285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626437 () Bool)

(declare-fun res!404279 () Bool)

(assert (=> b!626437 (=> (not res!404279) (not e!358869))))

(declare-datatypes ((List!12253 0))(
  ( (Nil!12250) (Cons!12249 (h!13294 (_ BitVec 64)) (t!18472 List!12253)) )
))
(declare-fun arrayNoDuplicates!0 (array!37866 (_ BitVec 32) List!12253) Bool)

(assert (=> b!626437 (= res!404279 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12250))))

(declare-fun res!404277 () Bool)

(assert (=> start!56562 (=> (not res!404277) (not e!358868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56562 (= res!404277 (validMask!0 mask!3053))))

(assert (=> start!56562 e!358868))

(assert (=> start!56562 true))

(declare-fun array_inv!14056 (array!37866) Bool)

(assert (=> start!56562 (array_inv!14056 a!2986)))

(declare-fun b!626442 () Bool)

(declare-fun res!404284 () Bool)

(assert (=> b!626442 (=> (not res!404284) (not e!358868))))

(assert (=> b!626442 (= res!404284 (validKeyInArray!0 (select (arr!18173 a!2986) j!136)))))

(declare-fun b!626443 () Bool)

(assert (=> b!626443 (= e!358868 e!358869)))

(declare-fun res!404283 () Bool)

(assert (=> b!626443 (=> (not res!404283) (not e!358869))))

(declare-fun lt!289903 () SeekEntryResult!6610)

(assert (=> b!626443 (= res!404283 (or (= lt!289903 (MissingZero!6610 i!1108)) (= lt!289903 (MissingVacant!6610 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37866 (_ BitVec 32)) SeekEntryResult!6610)

(assert (=> b!626443 (= lt!289903 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!56562 res!404277) b!626440))

(assert (= (and b!626440 res!404282) b!626442))

(assert (= (and b!626442 res!404284) b!626435))

(assert (= (and b!626435 res!404280) b!626436))

(assert (= (and b!626436 res!404278) b!626443))

(assert (= (and b!626443 res!404283) b!626441))

(assert (= (and b!626441 res!404285) b!626437))

(assert (= (and b!626437 res!404279) b!626438))

(assert (= (and b!626438 res!404281) b!626439))

(declare-fun m!601309 () Bool)

(assert (=> b!626443 m!601309))

(declare-fun m!601311 () Bool)

(assert (=> b!626438 m!601311))

(declare-fun m!601313 () Bool)

(assert (=> b!626438 m!601313))

(declare-fun m!601315 () Bool)

(assert (=> b!626438 m!601315))

(declare-fun m!601317 () Bool)

(assert (=> start!56562 m!601317))

(declare-fun m!601319 () Bool)

(assert (=> start!56562 m!601319))

(declare-fun m!601321 () Bool)

(assert (=> b!626435 m!601321))

(declare-fun m!601323 () Bool)

(assert (=> b!626436 m!601323))

(declare-fun m!601325 () Bool)

(assert (=> b!626437 m!601325))

(declare-fun m!601327 () Bool)

(assert (=> b!626439 m!601327))

(assert (=> b!626439 m!601327))

(declare-fun m!601329 () Bool)

(assert (=> b!626439 m!601329))

(assert (=> b!626442 m!601327))

(assert (=> b!626442 m!601327))

(declare-fun m!601331 () Bool)

(assert (=> b!626442 m!601331))

(declare-fun m!601333 () Bool)

(assert (=> b!626441 m!601333))

(check-sat (not start!56562) (not b!626435) (not b!626437) (not b!626442) (not b!626436) (not b!626441) (not b!626443) (not b!626439))
(check-sat)
