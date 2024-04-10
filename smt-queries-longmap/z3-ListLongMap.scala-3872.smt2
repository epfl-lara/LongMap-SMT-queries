; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53244 () Bool)

(assert start!53244)

(declare-fun b!578808 () Bool)

(declare-fun res!366626 () Bool)

(declare-fun e!332788 () Bool)

(assert (=> b!578808 (=> (not res!366626) (not e!332788))))

(declare-datatypes ((array!36145 0))(
  ( (array!36146 (arr!17347 (Array (_ BitVec 32) (_ BitVec 64))) (size!17711 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36145)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578808 (= res!366626 (validKeyInArray!0 (select (arr!17347 a!2986) j!136)))))

(declare-fun b!578809 () Bool)

(declare-fun res!366627 () Bool)

(assert (=> b!578809 (=> (not res!366627) (not e!332788))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578809 (= res!366627 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578810 () Bool)

(declare-fun res!366625 () Bool)

(assert (=> b!578810 (=> (not res!366625) (not e!332788))))

(assert (=> b!578810 (= res!366625 (validKeyInArray!0 k0!1786))))

(declare-fun b!578811 () Bool)

(declare-fun res!366624 () Bool)

(declare-fun e!332790 () Bool)

(assert (=> b!578811 (=> (not res!366624) (not e!332790))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36145 (_ BitVec 32)) Bool)

(assert (=> b!578811 (= res!366624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578812 () Bool)

(declare-fun res!366628 () Bool)

(assert (=> b!578812 (=> (not res!366628) (not e!332790))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!578812 (= res!366628 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17347 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17347 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578813 () Bool)

(assert (=> b!578813 (= e!332788 e!332790)))

(declare-fun res!366632 () Bool)

(assert (=> b!578813 (=> (not res!366632) (not e!332790))))

(declare-datatypes ((SeekEntryResult!5787 0))(
  ( (MissingZero!5787 (index!25375 (_ BitVec 32))) (Found!5787 (index!25376 (_ BitVec 32))) (Intermediate!5787 (undefined!6599 Bool) (index!25377 (_ BitVec 32)) (x!54272 (_ BitVec 32))) (Undefined!5787) (MissingVacant!5787 (index!25378 (_ BitVec 32))) )
))
(declare-fun lt!264343 () SeekEntryResult!5787)

(assert (=> b!578813 (= res!366632 (or (= lt!264343 (MissingZero!5787 i!1108)) (= lt!264343 (MissingVacant!5787 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36145 (_ BitVec 32)) SeekEntryResult!5787)

(assert (=> b!578813 (= lt!264343 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578814 () Bool)

(declare-fun res!366630 () Bool)

(assert (=> b!578814 (=> (not res!366630) (not e!332790))))

(declare-datatypes ((List!11388 0))(
  ( (Nil!11385) (Cons!11384 (h!12429 (_ BitVec 64)) (t!17616 List!11388)) )
))
(declare-fun arrayNoDuplicates!0 (array!36145 (_ BitVec 32) List!11388) Bool)

(assert (=> b!578814 (= res!366630 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11385))))

(declare-fun res!366631 () Bool)

(assert (=> start!53244 (=> (not res!366631) (not e!332788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53244 (= res!366631 (validMask!0 mask!3053))))

(assert (=> start!53244 e!332788))

(assert (=> start!53244 true))

(declare-fun array_inv!13143 (array!36145) Bool)

(assert (=> start!53244 (array_inv!13143 a!2986)))

(declare-fun b!578815 () Bool)

(declare-fun res!366629 () Bool)

(assert (=> b!578815 (=> (not res!366629) (not e!332788))))

(assert (=> b!578815 (= res!366629 (and (= (size!17711 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17711 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17711 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578816 () Bool)

(assert (=> b!578816 (= e!332790 false)))

(declare-fun lt!264342 () SeekEntryResult!5787)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36145 (_ BitVec 32)) SeekEntryResult!5787)

(assert (=> b!578816 (= lt!264342 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17347 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53244 res!366631) b!578815))

(assert (= (and b!578815 res!366629) b!578808))

(assert (= (and b!578808 res!366626) b!578810))

(assert (= (and b!578810 res!366625) b!578809))

(assert (= (and b!578809 res!366627) b!578813))

(assert (= (and b!578813 res!366632) b!578811))

(assert (= (and b!578811 res!366624) b!578814))

(assert (= (and b!578814 res!366630) b!578812))

(assert (= (and b!578812 res!366628) b!578816))

(declare-fun m!557451 () Bool)

(assert (=> b!578810 m!557451))

(declare-fun m!557453 () Bool)

(assert (=> b!578814 m!557453))

(declare-fun m!557455 () Bool)

(assert (=> b!578813 m!557455))

(declare-fun m!557457 () Bool)

(assert (=> b!578808 m!557457))

(assert (=> b!578808 m!557457))

(declare-fun m!557459 () Bool)

(assert (=> b!578808 m!557459))

(assert (=> b!578816 m!557457))

(assert (=> b!578816 m!557457))

(declare-fun m!557461 () Bool)

(assert (=> b!578816 m!557461))

(declare-fun m!557463 () Bool)

(assert (=> b!578809 m!557463))

(declare-fun m!557465 () Bool)

(assert (=> start!53244 m!557465))

(declare-fun m!557467 () Bool)

(assert (=> start!53244 m!557467))

(declare-fun m!557469 () Bool)

(assert (=> b!578811 m!557469))

(declare-fun m!557471 () Bool)

(assert (=> b!578812 m!557471))

(declare-fun m!557473 () Bool)

(assert (=> b!578812 m!557473))

(declare-fun m!557475 () Bool)

(assert (=> b!578812 m!557475))

(check-sat (not b!578814) (not b!578813) (not start!53244) (not b!578811) (not b!578808) (not b!578809) (not b!578816) (not b!578810))
