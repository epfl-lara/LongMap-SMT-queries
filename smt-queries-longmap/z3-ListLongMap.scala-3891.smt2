; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53406 () Bool)

(assert start!53406)

(declare-fun b!580520 () Bool)

(declare-fun res!368233 () Bool)

(declare-fun e!333421 () Bool)

(assert (=> b!580520 (=> (not res!368233) (not e!333421))))

(declare-datatypes ((array!36252 0))(
  ( (array!36253 (arr!17398 (Array (_ BitVec 32) (_ BitVec 64))) (size!17762 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36252)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580520 (= res!368233 (validKeyInArray!0 (select (arr!17398 a!2986) j!136)))))

(declare-fun b!580521 () Bool)

(declare-fun res!368234 () Bool)

(assert (=> b!580521 (=> (not res!368234) (not e!333421))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36252 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580521 (= res!368234 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!368236 () Bool)

(assert (=> start!53406 (=> (not res!368236) (not e!333421))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53406 (= res!368236 (validMask!0 mask!3053))))

(assert (=> start!53406 e!333421))

(assert (=> start!53406 true))

(declare-fun array_inv!13257 (array!36252) Bool)

(assert (=> start!53406 (array_inv!13257 a!2986)))

(declare-fun b!580522 () Bool)

(declare-fun res!368232 () Bool)

(declare-fun e!333423 () Bool)

(assert (=> b!580522 (=> (not res!368232) (not e!333423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36252 (_ BitVec 32)) Bool)

(assert (=> b!580522 (= res!368232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580523 () Bool)

(assert (=> b!580523 (= e!333421 e!333423)))

(declare-fun res!368235 () Bool)

(assert (=> b!580523 (=> (not res!368235) (not e!333423))))

(declare-datatypes ((SeekEntryResult!5794 0))(
  ( (MissingZero!5794 (index!25403 (_ BitVec 32))) (Found!5794 (index!25404 (_ BitVec 32))) (Intermediate!5794 (undefined!6606 Bool) (index!25405 (_ BitVec 32)) (x!54434 (_ BitVec 32))) (Undefined!5794) (MissingVacant!5794 (index!25406 (_ BitVec 32))) )
))
(declare-fun lt!264790 () SeekEntryResult!5794)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580523 (= res!368235 (or (= lt!264790 (MissingZero!5794 i!1108)) (= lt!264790 (MissingVacant!5794 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36252 (_ BitVec 32)) SeekEntryResult!5794)

(assert (=> b!580523 (= lt!264790 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580524 () Bool)

(declare-fun res!368231 () Bool)

(assert (=> b!580524 (=> (not res!368231) (not e!333423))))

(declare-datatypes ((List!11346 0))(
  ( (Nil!11343) (Cons!11342 (h!12390 (_ BitVec 64)) (t!17566 List!11346)) )
))
(declare-fun arrayNoDuplicates!0 (array!36252 (_ BitVec 32) List!11346) Bool)

(assert (=> b!580524 (= res!368231 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11343))))

(declare-fun b!580525 () Bool)

(declare-fun res!368239 () Bool)

(assert (=> b!580525 (=> (not res!368239) (not e!333421))))

(assert (=> b!580525 (= res!368239 (validKeyInArray!0 k0!1786))))

(declare-fun b!580526 () Bool)

(assert (=> b!580526 (= e!333423 false)))

(declare-fun lt!264789 () SeekEntryResult!5794)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36252 (_ BitVec 32)) SeekEntryResult!5794)

(assert (=> b!580526 (= lt!264789 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17398 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580527 () Bool)

(declare-fun res!368237 () Bool)

(assert (=> b!580527 (=> (not res!368237) (not e!333421))))

(assert (=> b!580527 (= res!368237 (and (= (size!17762 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17762 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17762 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580528 () Bool)

(declare-fun res!368238 () Bool)

(assert (=> b!580528 (=> (not res!368238) (not e!333423))))

(assert (=> b!580528 (= res!368238 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17398 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17398 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53406 res!368236) b!580527))

(assert (= (and b!580527 res!368237) b!580520))

(assert (= (and b!580520 res!368233) b!580525))

(assert (= (and b!580525 res!368239) b!580521))

(assert (= (and b!580521 res!368234) b!580523))

(assert (= (and b!580523 res!368235) b!580522))

(assert (= (and b!580522 res!368232) b!580524))

(assert (= (and b!580524 res!368231) b!580528))

(assert (= (and b!580528 res!368238) b!580526))

(declare-fun m!559259 () Bool)

(assert (=> b!580526 m!559259))

(assert (=> b!580526 m!559259))

(declare-fun m!559261 () Bool)

(assert (=> b!580526 m!559261))

(declare-fun m!559263 () Bool)

(assert (=> start!53406 m!559263))

(declare-fun m!559265 () Bool)

(assert (=> start!53406 m!559265))

(declare-fun m!559267 () Bool)

(assert (=> b!580524 m!559267))

(assert (=> b!580520 m!559259))

(assert (=> b!580520 m!559259))

(declare-fun m!559269 () Bool)

(assert (=> b!580520 m!559269))

(declare-fun m!559271 () Bool)

(assert (=> b!580521 m!559271))

(declare-fun m!559273 () Bool)

(assert (=> b!580525 m!559273))

(declare-fun m!559275 () Bool)

(assert (=> b!580523 m!559275))

(declare-fun m!559277 () Bool)

(assert (=> b!580522 m!559277))

(declare-fun m!559279 () Bool)

(assert (=> b!580528 m!559279))

(declare-fun m!559281 () Bool)

(assert (=> b!580528 m!559281))

(declare-fun m!559283 () Bool)

(assert (=> b!580528 m!559283))

(check-sat (not b!580525) (not b!580520) (not start!53406) (not b!580521) (not b!580524) (not b!580526) (not b!580523) (not b!580522))
(check-sat)
