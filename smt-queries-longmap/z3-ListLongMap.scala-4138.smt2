; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56424 () Bool)

(assert start!56424)

(declare-fun b!625464 () Bool)

(declare-fun res!403477 () Bool)

(declare-fun e!358492 () Bool)

(assert (=> b!625464 (=> (not res!403477) (not e!358492))))

(declare-datatypes ((array!37804 0))(
  ( (array!37805 (arr!18145 (Array (_ BitVec 32) (_ BitVec 64))) (size!18509 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37804)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37804 (_ BitVec 32)) Bool)

(assert (=> b!625464 (= res!403477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625465 () Bool)

(declare-fun res!403478 () Bool)

(assert (=> b!625465 (=> (not res!403478) (not e!358492))))

(declare-datatypes ((List!12186 0))(
  ( (Nil!12183) (Cons!12182 (h!13227 (_ BitVec 64)) (t!18414 List!12186)) )
))
(declare-fun arrayNoDuplicates!0 (array!37804 (_ BitVec 32) List!12186) Bool)

(assert (=> b!625465 (= res!403478 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12183))))

(declare-fun res!403476 () Bool)

(declare-fun e!358493 () Bool)

(assert (=> start!56424 (=> (not res!403476) (not e!358493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56424 (= res!403476 (validMask!0 mask!3053))))

(assert (=> start!56424 e!358493))

(assert (=> start!56424 true))

(declare-fun array_inv!13941 (array!37804) Bool)

(assert (=> start!56424 (array_inv!13941 a!2986)))

(declare-fun b!625466 () Bool)

(declare-fun res!403472 () Bool)

(assert (=> b!625466 (=> (not res!403472) (not e!358493))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625466 (= res!403472 (validKeyInArray!0 k0!1786))))

(declare-fun b!625467 () Bool)

(declare-fun res!403475 () Bool)

(assert (=> b!625467 (=> (not res!403475) (not e!358492))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!625467 (= res!403475 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18145 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18145 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625468 () Bool)

(assert (=> b!625468 (= e!358492 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6585 0))(
  ( (MissingZero!6585 (index!28624 (_ BitVec 32))) (Found!6585 (index!28625 (_ BitVec 32))) (Intermediate!6585 (undefined!7397 Bool) (index!28626 (_ BitVec 32)) (x!57375 (_ BitVec 32))) (Undefined!6585) (MissingVacant!6585 (index!28627 (_ BitVec 32))) )
))
(declare-fun lt!289830 () SeekEntryResult!6585)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37804 (_ BitVec 32)) SeekEntryResult!6585)

(assert (=> b!625468 (= lt!289830 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18145 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625469 () Bool)

(assert (=> b!625469 (= e!358493 e!358492)))

(declare-fun res!403473 () Bool)

(assert (=> b!625469 (=> (not res!403473) (not e!358492))))

(declare-fun lt!289831 () SeekEntryResult!6585)

(assert (=> b!625469 (= res!403473 (or (= lt!289831 (MissingZero!6585 i!1108)) (= lt!289831 (MissingVacant!6585 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37804 (_ BitVec 32)) SeekEntryResult!6585)

(assert (=> b!625469 (= lt!289831 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625470 () Bool)

(declare-fun res!403471 () Bool)

(assert (=> b!625470 (=> (not res!403471) (not e!358493))))

(declare-fun arrayContainsKey!0 (array!37804 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625470 (= res!403471 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625471 () Bool)

(declare-fun res!403474 () Bool)

(assert (=> b!625471 (=> (not res!403474) (not e!358493))))

(assert (=> b!625471 (= res!403474 (validKeyInArray!0 (select (arr!18145 a!2986) j!136)))))

(declare-fun b!625472 () Bool)

(declare-fun res!403470 () Bool)

(assert (=> b!625472 (=> (not res!403470) (not e!358493))))

(assert (=> b!625472 (= res!403470 (and (= (size!18509 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18509 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18509 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56424 res!403476) b!625472))

(assert (= (and b!625472 res!403470) b!625471))

(assert (= (and b!625471 res!403474) b!625466))

(assert (= (and b!625466 res!403472) b!625470))

(assert (= (and b!625470 res!403471) b!625469))

(assert (= (and b!625469 res!403473) b!625464))

(assert (= (and b!625464 res!403477) b!625465))

(assert (= (and b!625465 res!403478) b!625467))

(assert (= (and b!625467 res!403475) b!625468))

(declare-fun m!601033 () Bool)

(assert (=> b!625465 m!601033))

(declare-fun m!601035 () Bool)

(assert (=> start!56424 m!601035))

(declare-fun m!601037 () Bool)

(assert (=> start!56424 m!601037))

(declare-fun m!601039 () Bool)

(assert (=> b!625467 m!601039))

(declare-fun m!601041 () Bool)

(assert (=> b!625467 m!601041))

(declare-fun m!601043 () Bool)

(assert (=> b!625467 m!601043))

(declare-fun m!601045 () Bool)

(assert (=> b!625464 m!601045))

(declare-fun m!601047 () Bool)

(assert (=> b!625466 m!601047))

(declare-fun m!601049 () Bool)

(assert (=> b!625469 m!601049))

(declare-fun m!601051 () Bool)

(assert (=> b!625468 m!601051))

(assert (=> b!625468 m!601051))

(declare-fun m!601053 () Bool)

(assert (=> b!625468 m!601053))

(assert (=> b!625471 m!601051))

(assert (=> b!625471 m!601051))

(declare-fun m!601055 () Bool)

(assert (=> b!625471 m!601055))

(declare-fun m!601057 () Bool)

(assert (=> b!625470 m!601057))

(check-sat (not b!625470) (not b!625468) (not b!625466) (not b!625469) (not b!625471) (not b!625464) (not b!625465) (not start!56424))
(check-sat)
