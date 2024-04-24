; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56466 () Bool)

(assert start!56466)

(declare-fun b!625558 () Bool)

(declare-fun res!403461 () Bool)

(declare-fun e!358585 () Bool)

(assert (=> b!625558 (=> (not res!403461) (not e!358585))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625558 (= res!403461 (validKeyInArray!0 k0!1786))))

(declare-fun b!625559 () Bool)

(declare-fun res!403464 () Bool)

(assert (=> b!625559 (=> (not res!403464) (not e!358585))))

(declare-datatypes ((array!37791 0))(
  ( (array!37792 (arr!18136 (Array (_ BitVec 32) (_ BitVec 64))) (size!18500 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37791)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!625559 (= res!403464 (validKeyInArray!0 (select (arr!18136 a!2986) j!136)))))

(declare-fun e!358587 () Bool)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun b!625560 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!625560 (= e!358587 (and (bvslt x!910 #b01111111111111111111111111111110) (bvsge index!984 (size!18500 a!2986))))))

(declare-fun b!625561 () Bool)

(declare-fun res!403468 () Bool)

(assert (=> b!625561 (=> (not res!403468) (not e!358587))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37791 (_ BitVec 32)) Bool)

(assert (=> b!625561 (= res!403468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625562 () Bool)

(declare-fun res!403466 () Bool)

(assert (=> b!625562 (=> (not res!403466) (not e!358587))))

(declare-datatypes ((List!12084 0))(
  ( (Nil!12081) (Cons!12080 (h!13128 (_ BitVec 64)) (t!18304 List!12084)) )
))
(declare-fun arrayNoDuplicates!0 (array!37791 (_ BitVec 32) List!12084) Bool)

(assert (=> b!625562 (= res!403466 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12081))))

(declare-fun b!625563 () Bool)

(declare-fun res!403459 () Bool)

(assert (=> b!625563 (=> (not res!403459) (not e!358585))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625563 (= res!403459 (and (= (size!18500 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18500 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18500 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625564 () Bool)

(declare-fun res!403465 () Bool)

(assert (=> b!625564 (=> (not res!403465) (not e!358587))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!625564 (= res!403465 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18136 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18136 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625565 () Bool)

(declare-fun res!403463 () Bool)

(assert (=> b!625565 (=> (not res!403463) (not e!358585))))

(declare-fun arrayContainsKey!0 (array!37791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625565 (= res!403463 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625566 () Bool)

(declare-fun res!403460 () Bool)

(assert (=> b!625566 (=> (not res!403460) (not e!358587))))

(declare-datatypes ((SeekEntryResult!6532 0))(
  ( (MissingZero!6532 (index!28412 (_ BitVec 32))) (Found!6532 (index!28413 (_ BitVec 32))) (Intermediate!6532 (undefined!7344 Bool) (index!28414 (_ BitVec 32)) (x!57317 (_ BitVec 32))) (Undefined!6532) (MissingVacant!6532 (index!28415 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37791 (_ BitVec 32)) SeekEntryResult!6532)

(assert (=> b!625566 (= res!403460 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18136 a!2986) j!136) a!2986 mask!3053) (Found!6532 j!136)))))

(declare-fun b!625567 () Bool)

(assert (=> b!625567 (= e!358585 e!358587)))

(declare-fun res!403467 () Bool)

(assert (=> b!625567 (=> (not res!403467) (not e!358587))))

(declare-fun lt!289915 () SeekEntryResult!6532)

(assert (=> b!625567 (= res!403467 (or (= lt!289915 (MissingZero!6532 i!1108)) (= lt!289915 (MissingVacant!6532 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37791 (_ BitVec 32)) SeekEntryResult!6532)

(assert (=> b!625567 (= lt!289915 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!403462 () Bool)

(assert (=> start!56466 (=> (not res!403462) (not e!358585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56466 (= res!403462 (validMask!0 mask!3053))))

(assert (=> start!56466 e!358585))

(assert (=> start!56466 true))

(declare-fun array_inv!13995 (array!37791) Bool)

(assert (=> start!56466 (array_inv!13995 a!2986)))

(assert (= (and start!56466 res!403462) b!625563))

(assert (= (and b!625563 res!403459) b!625559))

(assert (= (and b!625559 res!403464) b!625558))

(assert (= (and b!625558 res!403461) b!625565))

(assert (= (and b!625565 res!403463) b!625567))

(assert (= (and b!625567 res!403467) b!625561))

(assert (= (and b!625561 res!403468) b!625562))

(assert (= (and b!625562 res!403466) b!625564))

(assert (= (and b!625564 res!403465) b!625566))

(assert (= (and b!625566 res!403460) b!625560))

(declare-fun m!601411 () Bool)

(assert (=> b!625565 m!601411))

(declare-fun m!601413 () Bool)

(assert (=> b!625564 m!601413))

(declare-fun m!601415 () Bool)

(assert (=> b!625564 m!601415))

(declare-fun m!601417 () Bool)

(assert (=> b!625564 m!601417))

(declare-fun m!601419 () Bool)

(assert (=> b!625559 m!601419))

(assert (=> b!625559 m!601419))

(declare-fun m!601421 () Bool)

(assert (=> b!625559 m!601421))

(declare-fun m!601423 () Bool)

(assert (=> b!625558 m!601423))

(declare-fun m!601425 () Bool)

(assert (=> start!56466 m!601425))

(declare-fun m!601427 () Bool)

(assert (=> start!56466 m!601427))

(declare-fun m!601429 () Bool)

(assert (=> b!625567 m!601429))

(declare-fun m!601431 () Bool)

(assert (=> b!625561 m!601431))

(declare-fun m!601433 () Bool)

(assert (=> b!625562 m!601433))

(assert (=> b!625566 m!601419))

(assert (=> b!625566 m!601419))

(declare-fun m!601435 () Bool)

(assert (=> b!625566 m!601435))

(check-sat (not b!625558) (not b!625559) (not start!56466) (not b!625562) (not b!625565) (not b!625561) (not b!625566) (not b!625567))
(check-sat)
