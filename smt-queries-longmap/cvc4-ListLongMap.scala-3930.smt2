; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53594 () Bool)

(assert start!53594)

(declare-fun b!583602 () Bool)

(declare-fun res!371423 () Bool)

(declare-fun e!334372 () Bool)

(assert (=> b!583602 (=> (not res!371423) (not e!334372))))

(declare-datatypes ((array!36495 0))(
  ( (array!36496 (arr!17522 (Array (_ BitVec 32) (_ BitVec 64))) (size!17886 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36495)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36495 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583602 (= res!371423 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583603 () Bool)

(declare-fun res!371420 () Bool)

(declare-fun e!334373 () Bool)

(assert (=> b!583603 (=> (not res!371420) (not e!334373))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36495 (_ BitVec 32)) Bool)

(assert (=> b!583603 (= res!371420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583604 () Bool)

(declare-fun e!334374 () Bool)

(assert (=> b!583604 (= e!334374 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!265365 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5962 0))(
  ( (MissingZero!5962 (index!26075 (_ BitVec 32))) (Found!5962 (index!26076 (_ BitVec 32))) (Intermediate!5962 (undefined!6774 Bool) (index!26077 (_ BitVec 32)) (x!54911 (_ BitVec 32))) (Undefined!5962) (MissingVacant!5962 (index!26078 (_ BitVec 32))) )
))
(declare-fun lt!265366 () SeekEntryResult!5962)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36495 (_ BitVec 32)) SeekEntryResult!5962)

(assert (=> b!583604 (= lt!265366 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265365 vacantSpotIndex!68 (select (arr!17522 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!371418 () Bool)

(assert (=> start!53594 (=> (not res!371418) (not e!334372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53594 (= res!371418 (validMask!0 mask!3053))))

(assert (=> start!53594 e!334372))

(assert (=> start!53594 true))

(declare-fun array_inv!13318 (array!36495) Bool)

(assert (=> start!53594 (array_inv!13318 a!2986)))

(declare-fun b!583605 () Bool)

(declare-fun res!371425 () Bool)

(assert (=> b!583605 (=> (not res!371425) (not e!334372))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583605 (= res!371425 (validKeyInArray!0 k!1786))))

(declare-fun b!583606 () Bool)

(declare-fun res!371426 () Bool)

(assert (=> b!583606 (=> (not res!371426) (not e!334373))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!583606 (= res!371426 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17522 a!2986) index!984) (select (arr!17522 a!2986) j!136))) (not (= (select (arr!17522 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!583607 () Bool)

(assert (=> b!583607 (= e!334373 e!334374)))

(declare-fun res!371422 () Bool)

(assert (=> b!583607 (=> (not res!371422) (not e!334374))))

(assert (=> b!583607 (= res!371422 (and (bvsge lt!265365 #b00000000000000000000000000000000) (bvslt lt!265365 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!583607 (= lt!265365 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!583608 () Bool)

(declare-fun res!371424 () Bool)

(assert (=> b!583608 (=> (not res!371424) (not e!334373))))

(declare-datatypes ((List!11563 0))(
  ( (Nil!11560) (Cons!11559 (h!12604 (_ BitVec 64)) (t!17791 List!11563)) )
))
(declare-fun arrayNoDuplicates!0 (array!36495 (_ BitVec 32) List!11563) Bool)

(assert (=> b!583608 (= res!371424 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11560))))

(declare-fun b!583609 () Bool)

(declare-fun res!371427 () Bool)

(assert (=> b!583609 (=> (not res!371427) (not e!334372))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583609 (= res!371427 (and (= (size!17886 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17886 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17886 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583610 () Bool)

(declare-fun res!371428 () Bool)

(assert (=> b!583610 (=> (not res!371428) (not e!334373))))

(assert (=> b!583610 (= res!371428 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17522 a!2986) j!136) a!2986 mask!3053) (Found!5962 j!136)))))

(declare-fun b!583611 () Bool)

(declare-fun res!371421 () Bool)

(assert (=> b!583611 (=> (not res!371421) (not e!334373))))

(assert (=> b!583611 (= res!371421 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17522 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17522 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583612 () Bool)

(declare-fun res!371419 () Bool)

(assert (=> b!583612 (=> (not res!371419) (not e!334372))))

(assert (=> b!583612 (= res!371419 (validKeyInArray!0 (select (arr!17522 a!2986) j!136)))))

(declare-fun b!583613 () Bool)

(assert (=> b!583613 (= e!334372 e!334373)))

(declare-fun res!371429 () Bool)

(assert (=> b!583613 (=> (not res!371429) (not e!334373))))

(declare-fun lt!265364 () SeekEntryResult!5962)

(assert (=> b!583613 (= res!371429 (or (= lt!265364 (MissingZero!5962 i!1108)) (= lt!265364 (MissingVacant!5962 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36495 (_ BitVec 32)) SeekEntryResult!5962)

(assert (=> b!583613 (= lt!265364 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53594 res!371418) b!583609))

(assert (= (and b!583609 res!371427) b!583612))

(assert (= (and b!583612 res!371419) b!583605))

(assert (= (and b!583605 res!371425) b!583602))

(assert (= (and b!583602 res!371423) b!583613))

(assert (= (and b!583613 res!371429) b!583603))

(assert (= (and b!583603 res!371420) b!583608))

(assert (= (and b!583608 res!371424) b!583611))

(assert (= (and b!583611 res!371421) b!583610))

(assert (= (and b!583610 res!371428) b!583606))

(assert (= (and b!583606 res!371426) b!583607))

(assert (= (and b!583607 res!371422) b!583604))

(declare-fun m!562049 () Bool)

(assert (=> b!583610 m!562049))

(assert (=> b!583610 m!562049))

(declare-fun m!562051 () Bool)

(assert (=> b!583610 m!562051))

(declare-fun m!562053 () Bool)

(assert (=> b!583602 m!562053))

(declare-fun m!562055 () Bool)

(assert (=> b!583608 m!562055))

(declare-fun m!562057 () Bool)

(assert (=> b!583603 m!562057))

(declare-fun m!562059 () Bool)

(assert (=> b!583607 m!562059))

(declare-fun m!562061 () Bool)

(assert (=> b!583605 m!562061))

(declare-fun m!562063 () Bool)

(assert (=> b!583613 m!562063))

(declare-fun m!562065 () Bool)

(assert (=> b!583606 m!562065))

(assert (=> b!583606 m!562049))

(declare-fun m!562067 () Bool)

(assert (=> b!583611 m!562067))

(declare-fun m!562069 () Bool)

(assert (=> b!583611 m!562069))

(declare-fun m!562071 () Bool)

(assert (=> b!583611 m!562071))

(assert (=> b!583612 m!562049))

(assert (=> b!583612 m!562049))

(declare-fun m!562073 () Bool)

(assert (=> b!583612 m!562073))

(declare-fun m!562075 () Bool)

(assert (=> start!53594 m!562075))

(declare-fun m!562077 () Bool)

(assert (=> start!53594 m!562077))

(assert (=> b!583604 m!562049))

(assert (=> b!583604 m!562049))

(declare-fun m!562079 () Bool)

(assert (=> b!583604 m!562079))

(push 1)

