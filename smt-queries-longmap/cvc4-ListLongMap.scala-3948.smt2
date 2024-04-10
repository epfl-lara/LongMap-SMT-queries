; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53702 () Bool)

(assert start!53702)

(declare-fun b!585546 () Bool)

(declare-fun res!373367 () Bool)

(declare-fun e!335022 () Bool)

(assert (=> b!585546 (=> (not res!373367) (not e!335022))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36603 0))(
  ( (array!36604 (arr!17576 (Array (_ BitVec 32) (_ BitVec 64))) (size!17940 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36603)

(assert (=> b!585546 (= res!373367 (and (= (size!17940 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17940 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17940 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585547 () Bool)

(declare-fun res!373371 () Bool)

(declare-fun e!335019 () Bool)

(assert (=> b!585547 (=> (not res!373371) (not e!335019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36603 (_ BitVec 32)) Bool)

(assert (=> b!585547 (= res!373371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585548 () Bool)

(declare-fun e!335021 () Bool)

(assert (=> b!585548 (= e!335019 e!335021)))

(declare-fun res!373369 () Bool)

(assert (=> b!585548 (=> (not res!373369) (not e!335021))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265852 () (_ BitVec 32))

(assert (=> b!585548 (= res!373369 (and (bvsge lt!265852 #b00000000000000000000000000000000) (bvslt lt!265852 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585548 (= lt!265852 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585549 () Bool)

(declare-fun res!373362 () Bool)

(assert (=> b!585549 (=> (not res!373362) (not e!335022))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585549 (= res!373362 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585550 () Bool)

(declare-fun res!373372 () Bool)

(assert (=> b!585550 (=> (not res!373372) (not e!335022))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585550 (= res!373372 (validKeyInArray!0 (select (arr!17576 a!2986) j!136)))))

(declare-fun b!585551 () Bool)

(declare-fun res!373365 () Bool)

(assert (=> b!585551 (=> (not res!373365) (not e!335019))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6016 0))(
  ( (MissingZero!6016 (index!26291 (_ BitVec 32))) (Found!6016 (index!26292 (_ BitVec 32))) (Intermediate!6016 (undefined!6828 Bool) (index!26293 (_ BitVec 32)) (x!55109 (_ BitVec 32))) (Undefined!6016) (MissingVacant!6016 (index!26294 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36603 (_ BitVec 32)) SeekEntryResult!6016)

(assert (=> b!585551 (= res!373365 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17576 a!2986) j!136) a!2986 mask!3053) (Found!6016 j!136)))))

(declare-fun b!585552 () Bool)

(declare-fun res!373373 () Bool)

(assert (=> b!585552 (=> (not res!373373) (not e!335022))))

(assert (=> b!585552 (= res!373373 (validKeyInArray!0 k!1786))))

(declare-fun b!585553 () Bool)

(assert (=> b!585553 (= e!335021 false)))

(declare-fun lt!265850 () SeekEntryResult!6016)

(assert (=> b!585553 (= lt!265850 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265852 vacantSpotIndex!68 (select (arr!17576 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!585554 () Bool)

(assert (=> b!585554 (= e!335022 e!335019)))

(declare-fun res!373370 () Bool)

(assert (=> b!585554 (=> (not res!373370) (not e!335019))))

(declare-fun lt!265851 () SeekEntryResult!6016)

(assert (=> b!585554 (= res!373370 (or (= lt!265851 (MissingZero!6016 i!1108)) (= lt!265851 (MissingVacant!6016 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36603 (_ BitVec 32)) SeekEntryResult!6016)

(assert (=> b!585554 (= lt!265851 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!585555 () Bool)

(declare-fun res!373364 () Bool)

(assert (=> b!585555 (=> (not res!373364) (not e!335019))))

(assert (=> b!585555 (= res!373364 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17576 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17576 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585556 () Bool)

(declare-fun res!373366 () Bool)

(assert (=> b!585556 (=> (not res!373366) (not e!335019))))

(declare-datatypes ((List!11617 0))(
  ( (Nil!11614) (Cons!11613 (h!12658 (_ BitVec 64)) (t!17845 List!11617)) )
))
(declare-fun arrayNoDuplicates!0 (array!36603 (_ BitVec 32) List!11617) Bool)

(assert (=> b!585556 (= res!373366 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11614))))

(declare-fun res!373368 () Bool)

(assert (=> start!53702 (=> (not res!373368) (not e!335022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53702 (= res!373368 (validMask!0 mask!3053))))

(assert (=> start!53702 e!335022))

(assert (=> start!53702 true))

(declare-fun array_inv!13372 (array!36603) Bool)

(assert (=> start!53702 (array_inv!13372 a!2986)))

(declare-fun b!585557 () Bool)

(declare-fun res!373363 () Bool)

(assert (=> b!585557 (=> (not res!373363) (not e!335019))))

(assert (=> b!585557 (= res!373363 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17576 a!2986) index!984) (select (arr!17576 a!2986) j!136))) (not (= (select (arr!17576 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!53702 res!373368) b!585546))

(assert (= (and b!585546 res!373367) b!585550))

(assert (= (and b!585550 res!373372) b!585552))

(assert (= (and b!585552 res!373373) b!585549))

(assert (= (and b!585549 res!373362) b!585554))

(assert (= (and b!585554 res!373370) b!585547))

(assert (= (and b!585547 res!373371) b!585556))

(assert (= (and b!585556 res!373366) b!585555))

(assert (= (and b!585555 res!373364) b!585551))

(assert (= (and b!585551 res!373365) b!585557))

(assert (= (and b!585557 res!373363) b!585548))

(assert (= (and b!585548 res!373369) b!585553))

(declare-fun m!563777 () Bool)

(assert (=> b!585556 m!563777))

(declare-fun m!563779 () Bool)

(assert (=> b!585557 m!563779))

(declare-fun m!563781 () Bool)

(assert (=> b!585557 m!563781))

(declare-fun m!563783 () Bool)

(assert (=> b!585547 m!563783))

(declare-fun m!563785 () Bool)

(assert (=> start!53702 m!563785))

(declare-fun m!563787 () Bool)

(assert (=> start!53702 m!563787))

(assert (=> b!585551 m!563781))

(assert (=> b!585551 m!563781))

(declare-fun m!563789 () Bool)

(assert (=> b!585551 m!563789))

(declare-fun m!563791 () Bool)

(assert (=> b!585548 m!563791))

(assert (=> b!585550 m!563781))

(assert (=> b!585550 m!563781))

(declare-fun m!563793 () Bool)

(assert (=> b!585550 m!563793))

(declare-fun m!563795 () Bool)

(assert (=> b!585554 m!563795))

(assert (=> b!585553 m!563781))

(assert (=> b!585553 m!563781))

(declare-fun m!563797 () Bool)

(assert (=> b!585553 m!563797))

(declare-fun m!563799 () Bool)

(assert (=> b!585552 m!563799))

(declare-fun m!563801 () Bool)

(assert (=> b!585549 m!563801))

(declare-fun m!563803 () Bool)

(assert (=> b!585555 m!563803))

(declare-fun m!563805 () Bool)

(assert (=> b!585555 m!563805))

(declare-fun m!563807 () Bool)

(assert (=> b!585555 m!563807))

(push 1)

(assert (not b!585556))

(assert (not b!585550))

(assert (not b!585553))

