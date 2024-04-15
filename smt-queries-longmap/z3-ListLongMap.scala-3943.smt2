; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53652 () Bool)

(assert start!53652)

(declare-fun b!584663 () Bool)

(declare-fun res!372632 () Bool)

(declare-fun e!334644 () Bool)

(assert (=> b!584663 (=> (not res!372632) (not e!334644))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36567 0))(
  ( (array!36568 (arr!17558 (Array (_ BitVec 32) (_ BitVec 64))) (size!17923 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36567)

(assert (=> b!584663 (= res!372632 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17558 a!2986) index!984) (select (arr!17558 a!2986) j!136))) (not (= (select (arr!17558 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584664 () Bool)

(declare-fun e!334642 () Bool)

(assert (=> b!584664 (= e!334644 e!334642)))

(declare-fun res!372631 () Bool)

(assert (=> b!584664 (=> (not res!372631) (not e!334642))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!265464 () (_ BitVec 32))

(assert (=> b!584664 (= res!372631 (and (bvsge lt!265464 #b00000000000000000000000000000000) (bvslt lt!265464 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584664 (= lt!265464 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584665 () Bool)

(declare-fun res!372627 () Bool)

(assert (=> b!584665 (=> (not res!372627) (not e!334644))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!584665 (= res!372627 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17558 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17558 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584666 () Bool)

(assert (=> b!584666 (= e!334642 false)))

(declare-datatypes ((SeekEntryResult!5995 0))(
  ( (MissingZero!5995 (index!26207 (_ BitVec 32))) (Found!5995 (index!26208 (_ BitVec 32))) (Intermediate!5995 (undefined!6807 Bool) (index!26209 (_ BitVec 32)) (x!55043 (_ BitVec 32))) (Undefined!5995) (MissingVacant!5995 (index!26210 (_ BitVec 32))) )
))
(declare-fun lt!265463 () SeekEntryResult!5995)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36567 (_ BitVec 32)) SeekEntryResult!5995)

(assert (=> b!584666 (= lt!265463 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265464 vacantSpotIndex!68 (select (arr!17558 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584667 () Bool)

(declare-fun res!372624 () Bool)

(assert (=> b!584667 (=> (not res!372624) (not e!334644))))

(assert (=> b!584667 (= res!372624 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17558 a!2986) j!136) a!2986 mask!3053) (Found!5995 j!136)))))

(declare-fun b!584668 () Bool)

(declare-fun e!334641 () Bool)

(assert (=> b!584668 (= e!334641 e!334644)))

(declare-fun res!372622 () Bool)

(assert (=> b!584668 (=> (not res!372622) (not e!334644))))

(declare-fun lt!265465 () SeekEntryResult!5995)

(assert (=> b!584668 (= res!372622 (or (= lt!265465 (MissingZero!5995 i!1108)) (= lt!265465 (MissingVacant!5995 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36567 (_ BitVec 32)) SeekEntryResult!5995)

(assert (=> b!584668 (= lt!265465 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!584669 () Bool)

(declare-fun res!372630 () Bool)

(assert (=> b!584669 (=> (not res!372630) (not e!334644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36567 (_ BitVec 32)) Bool)

(assert (=> b!584669 (= res!372630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584671 () Bool)

(declare-fun res!372621 () Bool)

(assert (=> b!584671 (=> (not res!372621) (not e!334641))))

(assert (=> b!584671 (= res!372621 (and (= (size!17923 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17923 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17923 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584672 () Bool)

(declare-fun res!372623 () Bool)

(assert (=> b!584672 (=> (not res!372623) (not e!334641))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584672 (= res!372623 (validKeyInArray!0 k0!1786))))

(declare-fun b!584673 () Bool)

(declare-fun res!372626 () Bool)

(assert (=> b!584673 (=> (not res!372626) (not e!334644))))

(declare-datatypes ((List!11638 0))(
  ( (Nil!11635) (Cons!11634 (h!12679 (_ BitVec 64)) (t!17857 List!11638)) )
))
(declare-fun arrayNoDuplicates!0 (array!36567 (_ BitVec 32) List!11638) Bool)

(assert (=> b!584673 (= res!372626 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11635))))

(declare-fun b!584674 () Bool)

(declare-fun res!372625 () Bool)

(assert (=> b!584674 (=> (not res!372625) (not e!334641))))

(assert (=> b!584674 (= res!372625 (validKeyInArray!0 (select (arr!17558 a!2986) j!136)))))

(declare-fun b!584670 () Bool)

(declare-fun res!372629 () Bool)

(assert (=> b!584670 (=> (not res!372629) (not e!334641))))

(declare-fun arrayContainsKey!0 (array!36567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584670 (= res!372629 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!372628 () Bool)

(assert (=> start!53652 (=> (not res!372628) (not e!334641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53652 (= res!372628 (validMask!0 mask!3053))))

(assert (=> start!53652 e!334641))

(assert (=> start!53652 true))

(declare-fun array_inv!13441 (array!36567) Bool)

(assert (=> start!53652 (array_inv!13441 a!2986)))

(assert (= (and start!53652 res!372628) b!584671))

(assert (= (and b!584671 res!372621) b!584674))

(assert (= (and b!584674 res!372625) b!584672))

(assert (= (and b!584672 res!372623) b!584670))

(assert (= (and b!584670 res!372629) b!584668))

(assert (= (and b!584668 res!372622) b!584669))

(assert (= (and b!584669 res!372630) b!584673))

(assert (= (and b!584673 res!372626) b!584665))

(assert (= (and b!584665 res!372627) b!584667))

(assert (= (and b!584667 res!372624) b!584663))

(assert (= (and b!584663 res!372632) b!584664))

(assert (= (and b!584664 res!372631) b!584666))

(declare-fun m!562447 () Bool)

(assert (=> b!584667 m!562447))

(assert (=> b!584667 m!562447))

(declare-fun m!562449 () Bool)

(assert (=> b!584667 m!562449))

(declare-fun m!562451 () Bool)

(assert (=> b!584670 m!562451))

(declare-fun m!562453 () Bool)

(assert (=> b!584673 m!562453))

(assert (=> b!584666 m!562447))

(assert (=> b!584666 m!562447))

(declare-fun m!562455 () Bool)

(assert (=> b!584666 m!562455))

(declare-fun m!562457 () Bool)

(assert (=> b!584669 m!562457))

(declare-fun m!562459 () Bool)

(assert (=> b!584664 m!562459))

(assert (=> b!584674 m!562447))

(assert (=> b!584674 m!562447))

(declare-fun m!562461 () Bool)

(assert (=> b!584674 m!562461))

(declare-fun m!562463 () Bool)

(assert (=> b!584672 m!562463))

(declare-fun m!562465 () Bool)

(assert (=> b!584665 m!562465))

(declare-fun m!562467 () Bool)

(assert (=> b!584665 m!562467))

(declare-fun m!562469 () Bool)

(assert (=> b!584665 m!562469))

(declare-fun m!562471 () Bool)

(assert (=> b!584668 m!562471))

(declare-fun m!562473 () Bool)

(assert (=> b!584663 m!562473))

(assert (=> b!584663 m!562447))

(declare-fun m!562475 () Bool)

(assert (=> start!53652 m!562475))

(declare-fun m!562477 () Bool)

(assert (=> start!53652 m!562477))

(check-sat (not b!584670) (not b!584672) (not b!584669) (not b!584673) (not b!584667) (not b!584668) (not b!584664) (not b!584666) (not start!53652) (not b!584674))
(check-sat)
