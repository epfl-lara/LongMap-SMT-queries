; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56424 () Bool)

(assert start!56424)

(declare-fun b!625409 () Bool)

(declare-fun res!403561 () Bool)

(declare-fun e!358391 () Bool)

(assert (=> b!625409 (=> (not res!403561) (not e!358391))))

(declare-datatypes ((array!37818 0))(
  ( (array!37819 (arr!18152 (Array (_ BitVec 32) (_ BitVec 64))) (size!18517 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37818)

(declare-datatypes ((List!12232 0))(
  ( (Nil!12229) (Cons!12228 (h!13273 (_ BitVec 64)) (t!18451 List!12232)) )
))
(declare-fun arrayNoDuplicates!0 (array!37818 (_ BitVec 32) List!12232) Bool)

(assert (=> b!625409 (= res!403561 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12229))))

(declare-fun b!625410 () Bool)

(declare-fun res!403563 () Bool)

(declare-fun e!358392 () Bool)

(assert (=> b!625410 (=> (not res!403563) (not e!358392))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625410 (= res!403563 (and (= (size!18517 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18517 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18517 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625411 () Bool)

(declare-fun res!403562 () Bool)

(assert (=> b!625411 (=> (not res!403562) (not e!358391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37818 (_ BitVec 32)) Bool)

(assert (=> b!625411 (= res!403562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625412 () Bool)

(declare-fun res!403558 () Bool)

(assert (=> b!625412 (=> (not res!403558) (not e!358392))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625412 (= res!403558 (validKeyInArray!0 (select (arr!18152 a!2986) j!136)))))

(declare-fun b!625413 () Bool)

(declare-fun res!403560 () Bool)

(assert (=> b!625413 (=> (not res!403560) (not e!358392))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625413 (= res!403560 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!403559 () Bool)

(assert (=> start!56424 (=> (not res!403559) (not e!358392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56424 (= res!403559 (validMask!0 mask!3053))))

(assert (=> start!56424 e!358392))

(assert (=> start!56424 true))

(declare-fun array_inv!14035 (array!37818) Bool)

(assert (=> start!56424 (array_inv!14035 a!2986)))

(declare-fun b!625414 () Bool)

(assert (=> b!625414 (= e!358392 e!358391)))

(declare-fun res!403565 () Bool)

(assert (=> b!625414 (=> (not res!403565) (not e!358391))))

(declare-datatypes ((SeekEntryResult!6589 0))(
  ( (MissingZero!6589 (index!28640 (_ BitVec 32))) (Found!6589 (index!28641 (_ BitVec 32))) (Intermediate!6589 (undefined!7401 Bool) (index!28642 (_ BitVec 32)) (x!57398 (_ BitVec 32))) (Undefined!6589) (MissingVacant!6589 (index!28643 (_ BitVec 32))) )
))
(declare-fun lt!289644 () SeekEntryResult!6589)

(assert (=> b!625414 (= res!403565 (or (= lt!289644 (MissingZero!6589 i!1108)) (= lt!289644 (MissingVacant!6589 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37818 (_ BitVec 32)) SeekEntryResult!6589)

(assert (=> b!625414 (= lt!289644 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625415 () Bool)

(assert (=> b!625415 (= e!358391 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!289645 () SeekEntryResult!6589)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37818 (_ BitVec 32)) SeekEntryResult!6589)

(assert (=> b!625415 (= lt!289645 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18152 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625416 () Bool)

(declare-fun res!403557 () Bool)

(assert (=> b!625416 (=> (not res!403557) (not e!358392))))

(assert (=> b!625416 (= res!403557 (validKeyInArray!0 k0!1786))))

(declare-fun b!625417 () Bool)

(declare-fun res!403564 () Bool)

(assert (=> b!625417 (=> (not res!403564) (not e!358391))))

(assert (=> b!625417 (= res!403564 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18152 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18152 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56424 res!403559) b!625410))

(assert (= (and b!625410 res!403563) b!625412))

(assert (= (and b!625412 res!403558) b!625416))

(assert (= (and b!625416 res!403557) b!625413))

(assert (= (and b!625413 res!403560) b!625414))

(assert (= (and b!625414 res!403565) b!625411))

(assert (= (and b!625411 res!403562) b!625409))

(assert (= (and b!625409 res!403561) b!625417))

(assert (= (and b!625417 res!403564) b!625415))

(declare-fun m!600469 () Bool)

(assert (=> b!625411 m!600469))

(declare-fun m!600471 () Bool)

(assert (=> b!625417 m!600471))

(declare-fun m!600473 () Bool)

(assert (=> b!625417 m!600473))

(declare-fun m!600475 () Bool)

(assert (=> b!625417 m!600475))

(declare-fun m!600477 () Bool)

(assert (=> b!625416 m!600477))

(declare-fun m!600479 () Bool)

(assert (=> b!625412 m!600479))

(assert (=> b!625412 m!600479))

(declare-fun m!600481 () Bool)

(assert (=> b!625412 m!600481))

(declare-fun m!600483 () Bool)

(assert (=> start!56424 m!600483))

(declare-fun m!600485 () Bool)

(assert (=> start!56424 m!600485))

(declare-fun m!600487 () Bool)

(assert (=> b!625414 m!600487))

(declare-fun m!600489 () Bool)

(assert (=> b!625409 m!600489))

(assert (=> b!625415 m!600479))

(assert (=> b!625415 m!600479))

(declare-fun m!600491 () Bool)

(assert (=> b!625415 m!600491))

(declare-fun m!600493 () Bool)

(assert (=> b!625413 m!600493))

(check-sat (not b!625411) (not b!625412) (not b!625416) (not b!625415) (not b!625413) (not b!625409) (not b!625414) (not start!56424))
(check-sat)
