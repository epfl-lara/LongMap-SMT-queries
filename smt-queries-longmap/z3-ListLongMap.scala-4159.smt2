; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56628 () Bool)

(assert start!56628)

(declare-fun b!627474 () Bool)

(declare-fun res!405316 () Bool)

(declare-fun e!359166 () Bool)

(assert (=> b!627474 (=> (not res!405316) (not e!359166))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37932 0))(
  ( (array!37933 (arr!18206 (Array (_ BitVec 32) (_ BitVec 64))) (size!18571 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37932)

(assert (=> b!627474 (= res!405316 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18206 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18206 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627475 () Bool)

(declare-fun res!405321 () Bool)

(assert (=> b!627475 (=> (not res!405321) (not e!359166))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!627475 (= res!405321 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18206 a!2986) index!984) (select (arr!18206 a!2986) j!136))) (not (= (select (arr!18206 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627476 () Bool)

(assert (=> b!627476 (= e!359166 false)))

(declare-fun lt!290101 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627476 (= lt!290101 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627477 () Bool)

(declare-fun res!405324 () Bool)

(declare-fun e!359164 () Bool)

(assert (=> b!627477 (=> (not res!405324) (not e!359164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627477 (= res!405324 (validKeyInArray!0 (select (arr!18206 a!2986) j!136)))))

(declare-fun b!627478 () Bool)

(declare-fun res!405325 () Bool)

(assert (=> b!627478 (=> (not res!405325) (not e!359164))))

(assert (=> b!627478 (= res!405325 (and (= (size!18571 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18571 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18571 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627479 () Bool)

(declare-fun res!405318 () Bool)

(assert (=> b!627479 (=> (not res!405318) (not e!359166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37932 (_ BitVec 32)) Bool)

(assert (=> b!627479 (= res!405318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!405322 () Bool)

(assert (=> start!56628 (=> (not res!405322) (not e!359164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56628 (= res!405322 (validMask!0 mask!3053))))

(assert (=> start!56628 e!359164))

(assert (=> start!56628 true))

(declare-fun array_inv!14089 (array!37932) Bool)

(assert (=> start!56628 (array_inv!14089 a!2986)))

(declare-fun b!627480 () Bool)

(declare-fun res!405320 () Bool)

(assert (=> b!627480 (=> (not res!405320) (not e!359166))))

(declare-datatypes ((List!12286 0))(
  ( (Nil!12283) (Cons!12282 (h!13327 (_ BitVec 64)) (t!18505 List!12286)) )
))
(declare-fun arrayNoDuplicates!0 (array!37932 (_ BitVec 32) List!12286) Bool)

(assert (=> b!627480 (= res!405320 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12283))))

(declare-fun b!627481 () Bool)

(declare-fun res!405323 () Bool)

(assert (=> b!627481 (=> (not res!405323) (not e!359164))))

(assert (=> b!627481 (= res!405323 (validKeyInArray!0 k0!1786))))

(declare-fun b!627482 () Bool)

(assert (=> b!627482 (= e!359164 e!359166)))

(declare-fun res!405317 () Bool)

(assert (=> b!627482 (=> (not res!405317) (not e!359166))))

(declare-datatypes ((SeekEntryResult!6643 0))(
  ( (MissingZero!6643 (index!28856 (_ BitVec 32))) (Found!6643 (index!28857 (_ BitVec 32))) (Intermediate!6643 (undefined!7455 Bool) (index!28858 (_ BitVec 32)) (x!57602 (_ BitVec 32))) (Undefined!6643) (MissingVacant!6643 (index!28859 (_ BitVec 32))) )
))
(declare-fun lt!290100 () SeekEntryResult!6643)

(assert (=> b!627482 (= res!405317 (or (= lt!290100 (MissingZero!6643 i!1108)) (= lt!290100 (MissingVacant!6643 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37932 (_ BitVec 32)) SeekEntryResult!6643)

(assert (=> b!627482 (= lt!290100 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627483 () Bool)

(declare-fun res!405319 () Bool)

(assert (=> b!627483 (=> (not res!405319) (not e!359164))))

(declare-fun arrayContainsKey!0 (array!37932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627483 (= res!405319 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627484 () Bool)

(declare-fun res!405326 () Bool)

(assert (=> b!627484 (=> (not res!405326) (not e!359166))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37932 (_ BitVec 32)) SeekEntryResult!6643)

(assert (=> b!627484 (= res!405326 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18206 a!2986) j!136) a!2986 mask!3053) (Found!6643 j!136)))))

(assert (= (and start!56628 res!405322) b!627478))

(assert (= (and b!627478 res!405325) b!627477))

(assert (= (and b!627477 res!405324) b!627481))

(assert (= (and b!627481 res!405323) b!627483))

(assert (= (and b!627483 res!405319) b!627482))

(assert (= (and b!627482 res!405317) b!627479))

(assert (= (and b!627479 res!405318) b!627480))

(assert (= (and b!627480 res!405320) b!627474))

(assert (= (and b!627474 res!405316) b!627484))

(assert (= (and b!627484 res!405326) b!627475))

(assert (= (and b!627475 res!405321) b!627476))

(declare-fun m!602263 () Bool)

(assert (=> b!627482 m!602263))

(declare-fun m!602265 () Bool)

(assert (=> b!627474 m!602265))

(declare-fun m!602267 () Bool)

(assert (=> b!627474 m!602267))

(declare-fun m!602269 () Bool)

(assert (=> b!627474 m!602269))

(declare-fun m!602271 () Bool)

(assert (=> b!627475 m!602271))

(declare-fun m!602273 () Bool)

(assert (=> b!627475 m!602273))

(declare-fun m!602275 () Bool)

(assert (=> start!56628 m!602275))

(declare-fun m!602277 () Bool)

(assert (=> start!56628 m!602277))

(declare-fun m!602279 () Bool)

(assert (=> b!627481 m!602279))

(declare-fun m!602281 () Bool)

(assert (=> b!627480 m!602281))

(declare-fun m!602283 () Bool)

(assert (=> b!627479 m!602283))

(assert (=> b!627484 m!602273))

(assert (=> b!627484 m!602273))

(declare-fun m!602285 () Bool)

(assert (=> b!627484 m!602285))

(declare-fun m!602287 () Bool)

(assert (=> b!627483 m!602287))

(assert (=> b!627477 m!602273))

(assert (=> b!627477 m!602273))

(declare-fun m!602289 () Bool)

(assert (=> b!627477 m!602289))

(declare-fun m!602291 () Bool)

(assert (=> b!627476 m!602291))

(check-sat (not b!627483) (not start!56628) (not b!627476) (not b!627481) (not b!627484) (not b!627477) (not b!627480) (not b!627479) (not b!627482))
(check-sat)
