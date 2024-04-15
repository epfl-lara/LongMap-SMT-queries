; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56574 () Bool)

(assert start!56574)

(declare-fun b!626597 () Bool)

(declare-fun res!404440 () Bool)

(declare-fun e!358921 () Bool)

(assert (=> b!626597 (=> (not res!404440) (not e!358921))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37878 0))(
  ( (array!37879 (arr!18179 (Array (_ BitVec 32) (_ BitVec 64))) (size!18544 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37878)

(assert (=> b!626597 (= res!404440 (and (= (size!18544 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18544 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18544 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626598 () Bool)

(declare-fun res!404439 () Bool)

(declare-fun e!358922 () Bool)

(assert (=> b!626598 (=> (not res!404439) (not e!358922))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37878 (_ BitVec 32)) Bool)

(assert (=> b!626598 (= res!404439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626599 () Bool)

(assert (=> b!626599 (= e!358922 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6616 0))(
  ( (MissingZero!6616 (index!28748 (_ BitVec 32))) (Found!6616 (index!28749 (_ BitVec 32))) (Intermediate!6616 (undefined!7428 Bool) (index!28750 (_ BitVec 32)) (x!57503 (_ BitVec 32))) (Undefined!6616) (MissingVacant!6616 (index!28751 (_ BitVec 32))) )
))
(declare-fun lt!289938 () SeekEntryResult!6616)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37878 (_ BitVec 32)) SeekEntryResult!6616)

(assert (=> b!626599 (= lt!289938 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18179 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626600 () Bool)

(assert (=> b!626600 (= e!358921 e!358922)))

(declare-fun res!404445 () Bool)

(assert (=> b!626600 (=> (not res!404445) (not e!358922))))

(declare-fun lt!289939 () SeekEntryResult!6616)

(assert (=> b!626600 (= res!404445 (or (= lt!289939 (MissingZero!6616 i!1108)) (= lt!289939 (MissingVacant!6616 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37878 (_ BitVec 32)) SeekEntryResult!6616)

(assert (=> b!626600 (= lt!289939 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!404443 () Bool)

(assert (=> start!56574 (=> (not res!404443) (not e!358921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56574 (= res!404443 (validMask!0 mask!3053))))

(assert (=> start!56574 e!358921))

(assert (=> start!56574 true))

(declare-fun array_inv!14062 (array!37878) Bool)

(assert (=> start!56574 (array_inv!14062 a!2986)))

(declare-fun b!626601 () Bool)

(declare-fun res!404446 () Bool)

(assert (=> b!626601 (=> (not res!404446) (not e!358922))))

(assert (=> b!626601 (= res!404446 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18179 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18179 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626602 () Bool)

(declare-fun res!404447 () Bool)

(assert (=> b!626602 (=> (not res!404447) (not e!358921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626602 (= res!404447 (validKeyInArray!0 k0!1786))))

(declare-fun b!626603 () Bool)

(declare-fun res!404442 () Bool)

(assert (=> b!626603 (=> (not res!404442) (not e!358922))))

(declare-datatypes ((List!12259 0))(
  ( (Nil!12256) (Cons!12255 (h!13300 (_ BitVec 64)) (t!18478 List!12259)) )
))
(declare-fun arrayNoDuplicates!0 (array!37878 (_ BitVec 32) List!12259) Bool)

(assert (=> b!626603 (= res!404442 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12256))))

(declare-fun b!626604 () Bool)

(declare-fun res!404441 () Bool)

(assert (=> b!626604 (=> (not res!404441) (not e!358921))))

(declare-fun arrayContainsKey!0 (array!37878 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626604 (= res!404441 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626605 () Bool)

(declare-fun res!404444 () Bool)

(assert (=> b!626605 (=> (not res!404444) (not e!358921))))

(assert (=> b!626605 (= res!404444 (validKeyInArray!0 (select (arr!18179 a!2986) j!136)))))

(assert (= (and start!56574 res!404443) b!626597))

(assert (= (and b!626597 res!404440) b!626605))

(assert (= (and b!626605 res!404444) b!626602))

(assert (= (and b!626602 res!404447) b!626604))

(assert (= (and b!626604 res!404441) b!626600))

(assert (= (and b!626600 res!404445) b!626598))

(assert (= (and b!626598 res!404439) b!626603))

(assert (= (and b!626603 res!404442) b!626601))

(assert (= (and b!626601 res!404446) b!626599))

(declare-fun m!601465 () Bool)

(assert (=> b!626601 m!601465))

(declare-fun m!601467 () Bool)

(assert (=> b!626601 m!601467))

(declare-fun m!601469 () Bool)

(assert (=> b!626601 m!601469))

(declare-fun m!601471 () Bool)

(assert (=> b!626604 m!601471))

(declare-fun m!601473 () Bool)

(assert (=> b!626603 m!601473))

(declare-fun m!601475 () Bool)

(assert (=> b!626598 m!601475))

(declare-fun m!601477 () Bool)

(assert (=> start!56574 m!601477))

(declare-fun m!601479 () Bool)

(assert (=> start!56574 m!601479))

(declare-fun m!601481 () Bool)

(assert (=> b!626600 m!601481))

(declare-fun m!601483 () Bool)

(assert (=> b!626605 m!601483))

(assert (=> b!626605 m!601483))

(declare-fun m!601485 () Bool)

(assert (=> b!626605 m!601485))

(assert (=> b!626599 m!601483))

(assert (=> b!626599 m!601483))

(declare-fun m!601487 () Bool)

(assert (=> b!626599 m!601487))

(declare-fun m!601489 () Bool)

(assert (=> b!626602 m!601489))

(check-sat (not b!626599) (not b!626604) (not b!626600) (not b!626605) (not b!626603) (not b!626602) (not start!56574) (not b!626598))
(check-sat)
