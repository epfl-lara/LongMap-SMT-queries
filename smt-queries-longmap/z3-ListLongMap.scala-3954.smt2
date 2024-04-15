; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53718 () Bool)

(assert start!53718)

(declare-fun b!585804 () Bool)

(declare-fun res!373771 () Bool)

(declare-fun e!334990 () Bool)

(assert (=> b!585804 (=> (not res!373771) (not e!334990))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36633 0))(
  ( (array!36634 (arr!17591 (Array (_ BitVec 32) (_ BitVec 64))) (size!17956 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36633)

(assert (=> b!585804 (= res!373771 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17591 a!2986) index!984) (select (arr!17591 a!2986) j!136))) (not (= (select (arr!17591 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585805 () Bool)

(declare-fun e!334992 () Bool)

(assert (=> b!585805 (= e!334992 e!334990)))

(declare-fun res!373763 () Bool)

(assert (=> b!585805 (=> (not res!373763) (not e!334990))))

(declare-datatypes ((SeekEntryResult!6028 0))(
  ( (MissingZero!6028 (index!26339 (_ BitVec 32))) (Found!6028 (index!26340 (_ BitVec 32))) (Intermediate!6028 (undefined!6840 Bool) (index!26341 (_ BitVec 32)) (x!55164 (_ BitVec 32))) (Undefined!6028) (MissingVacant!6028 (index!26342 (_ BitVec 32))) )
))
(declare-fun lt!265761 () SeekEntryResult!6028)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585805 (= res!373763 (or (= lt!265761 (MissingZero!6028 i!1108)) (= lt!265761 (MissingVacant!6028 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36633 (_ BitVec 32)) SeekEntryResult!6028)

(assert (=> b!585805 (= lt!265761 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!585807 () Bool)

(declare-fun res!373772 () Bool)

(assert (=> b!585807 (=> (not res!373772) (not e!334990))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36633 (_ BitVec 32)) SeekEntryResult!6028)

(assert (=> b!585807 (= res!373772 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17591 a!2986) j!136) a!2986 mask!3053) (Found!6028 j!136)))))

(declare-fun b!585808 () Bool)

(declare-fun res!373765 () Bool)

(assert (=> b!585808 (=> (not res!373765) (not e!334992))))

(declare-fun arrayContainsKey!0 (array!36633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585808 (= res!373765 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585809 () Bool)

(declare-fun res!373762 () Bool)

(assert (=> b!585809 (=> (not res!373762) (not e!334992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585809 (= res!373762 (validKeyInArray!0 (select (arr!17591 a!2986) j!136)))))

(declare-fun b!585810 () Bool)

(assert (=> b!585810 (= e!334990 (not true))))

(declare-fun lt!265760 () (_ BitVec 32))

(assert (=> b!585810 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265760 vacantSpotIndex!68 (select (arr!17591 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265760 vacantSpotIndex!68 (select (store (arr!17591 a!2986) i!1108 k0!1786) j!136) (array!36634 (store (arr!17591 a!2986) i!1108 k0!1786) (size!17956 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18162 0))(
  ( (Unit!18163) )
))
(declare-fun lt!265762 () Unit!18162)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36633 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18162)

(assert (=> b!585810 (= lt!265762 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265760 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585810 (= lt!265760 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585811 () Bool)

(declare-fun res!373768 () Bool)

(assert (=> b!585811 (=> (not res!373768) (not e!334990))))

(declare-datatypes ((List!11671 0))(
  ( (Nil!11668) (Cons!11667 (h!12712 (_ BitVec 64)) (t!17890 List!11671)) )
))
(declare-fun arrayNoDuplicates!0 (array!36633 (_ BitVec 32) List!11671) Bool)

(assert (=> b!585811 (= res!373768 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11668))))

(declare-fun b!585812 () Bool)

(declare-fun res!373766 () Bool)

(assert (=> b!585812 (=> (not res!373766) (not e!334992))))

(assert (=> b!585812 (= res!373766 (validKeyInArray!0 k0!1786))))

(declare-fun res!373769 () Bool)

(assert (=> start!53718 (=> (not res!373769) (not e!334992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53718 (= res!373769 (validMask!0 mask!3053))))

(assert (=> start!53718 e!334992))

(assert (=> start!53718 true))

(declare-fun array_inv!13474 (array!36633) Bool)

(assert (=> start!53718 (array_inv!13474 a!2986)))

(declare-fun b!585806 () Bool)

(declare-fun res!373770 () Bool)

(assert (=> b!585806 (=> (not res!373770) (not e!334990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36633 (_ BitVec 32)) Bool)

(assert (=> b!585806 (= res!373770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585813 () Bool)

(declare-fun res!373764 () Bool)

(assert (=> b!585813 (=> (not res!373764) (not e!334992))))

(assert (=> b!585813 (= res!373764 (and (= (size!17956 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17956 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17956 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585814 () Bool)

(declare-fun res!373767 () Bool)

(assert (=> b!585814 (=> (not res!373767) (not e!334990))))

(assert (=> b!585814 (= res!373767 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17591 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17591 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53718 res!373769) b!585813))

(assert (= (and b!585813 res!373764) b!585809))

(assert (= (and b!585809 res!373762) b!585812))

(assert (= (and b!585812 res!373766) b!585808))

(assert (= (and b!585808 res!373765) b!585805))

(assert (= (and b!585805 res!373763) b!585806))

(assert (= (and b!585806 res!373770) b!585811))

(assert (= (and b!585811 res!373768) b!585814))

(assert (= (and b!585814 res!373767) b!585807))

(assert (= (and b!585807 res!373772) b!585804))

(assert (= (and b!585804 res!373771) b!585810))

(declare-fun m!563593 () Bool)

(assert (=> b!585807 m!563593))

(assert (=> b!585807 m!563593))

(declare-fun m!563595 () Bool)

(assert (=> b!585807 m!563595))

(assert (=> b!585809 m!563593))

(assert (=> b!585809 m!563593))

(declare-fun m!563597 () Bool)

(assert (=> b!585809 m!563597))

(declare-fun m!563599 () Bool)

(assert (=> b!585812 m!563599))

(declare-fun m!563601 () Bool)

(assert (=> b!585811 m!563601))

(declare-fun m!563603 () Bool)

(assert (=> b!585810 m!563603))

(declare-fun m!563605 () Bool)

(assert (=> b!585810 m!563605))

(assert (=> b!585810 m!563593))

(declare-fun m!563607 () Bool)

(assert (=> b!585810 m!563607))

(declare-fun m!563609 () Bool)

(assert (=> b!585810 m!563609))

(declare-fun m!563611 () Bool)

(assert (=> b!585810 m!563611))

(assert (=> b!585810 m!563603))

(declare-fun m!563613 () Bool)

(assert (=> b!585810 m!563613))

(assert (=> b!585810 m!563593))

(declare-fun m!563615 () Bool)

(assert (=> b!585806 m!563615))

(declare-fun m!563617 () Bool)

(assert (=> b!585805 m!563617))

(declare-fun m!563619 () Bool)

(assert (=> b!585804 m!563619))

(assert (=> b!585804 m!563593))

(declare-fun m!563621 () Bool)

(assert (=> b!585808 m!563621))

(declare-fun m!563623 () Bool)

(assert (=> start!53718 m!563623))

(declare-fun m!563625 () Bool)

(assert (=> start!53718 m!563625))

(declare-fun m!563627 () Bool)

(assert (=> b!585814 m!563627))

(assert (=> b!585814 m!563605))

(declare-fun m!563629 () Bool)

(assert (=> b!585814 m!563629))

(check-sat (not b!585808) (not b!585811) (not b!585812) (not b!585806) (not b!585809) (not b!585805) (not b!585810) (not b!585807) (not start!53718))
(check-sat)
