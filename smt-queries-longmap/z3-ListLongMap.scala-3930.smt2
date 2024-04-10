; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53592 () Bool)

(assert start!53592)

(declare-fun b!583566 () Bool)

(declare-fun res!371386 () Bool)

(declare-fun e!334361 () Bool)

(assert (=> b!583566 (=> (not res!371386) (not e!334361))))

(declare-datatypes ((array!36493 0))(
  ( (array!36494 (arr!17521 (Array (_ BitVec 32) (_ BitVec 64))) (size!17885 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36493)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583566 (= res!371386 (validKeyInArray!0 (select (arr!17521 a!2986) j!136)))))

(declare-fun b!583567 () Bool)

(declare-fun res!371388 () Bool)

(assert (=> b!583567 (=> (not res!371388) (not e!334361))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!583567 (= res!371388 (validKeyInArray!0 k0!1786))))

(declare-fun b!583568 () Bool)

(declare-fun e!334359 () Bool)

(assert (=> b!583568 (= e!334361 e!334359)))

(declare-fun res!371383 () Bool)

(assert (=> b!583568 (=> (not res!371383) (not e!334359))))

(declare-datatypes ((SeekEntryResult!5961 0))(
  ( (MissingZero!5961 (index!26071 (_ BitVec 32))) (Found!5961 (index!26072 (_ BitVec 32))) (Intermediate!5961 (undefined!6773 Bool) (index!26073 (_ BitVec 32)) (x!54910 (_ BitVec 32))) (Undefined!5961) (MissingVacant!5961 (index!26074 (_ BitVec 32))) )
))
(declare-fun lt!265355 () SeekEntryResult!5961)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583568 (= res!371383 (or (= lt!265355 (MissingZero!5961 i!1108)) (= lt!265355 (MissingVacant!5961 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36493 (_ BitVec 32)) SeekEntryResult!5961)

(assert (=> b!583568 (= lt!265355 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!583569 () Bool)

(declare-fun e!334362 () Bool)

(assert (=> b!583569 (= e!334362 false)))

(declare-fun lt!265357 () SeekEntryResult!5961)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265356 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36493 (_ BitVec 32)) SeekEntryResult!5961)

(assert (=> b!583569 (= lt!265357 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265356 vacantSpotIndex!68 (select (arr!17521 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583570 () Bool)

(declare-fun res!371393 () Bool)

(assert (=> b!583570 (=> (not res!371393) (not e!334359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36493 (_ BitVec 32)) Bool)

(assert (=> b!583570 (= res!371393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583572 () Bool)

(assert (=> b!583572 (= e!334359 e!334362)))

(declare-fun res!371382 () Bool)

(assert (=> b!583572 (=> (not res!371382) (not e!334362))))

(assert (=> b!583572 (= res!371382 (and (bvsge lt!265356 #b00000000000000000000000000000000) (bvslt lt!265356 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!583572 (= lt!265356 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!583573 () Bool)

(declare-fun res!371390 () Bool)

(assert (=> b!583573 (=> (not res!371390) (not e!334359))))

(declare-datatypes ((List!11562 0))(
  ( (Nil!11559) (Cons!11558 (h!12603 (_ BitVec 64)) (t!17790 List!11562)) )
))
(declare-fun arrayNoDuplicates!0 (array!36493 (_ BitVec 32) List!11562) Bool)

(assert (=> b!583573 (= res!371390 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11559))))

(declare-fun b!583574 () Bool)

(declare-fun res!371391 () Bool)

(assert (=> b!583574 (=> (not res!371391) (not e!334359))))

(assert (=> b!583574 (= res!371391 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17521 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17521 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583575 () Bool)

(declare-fun res!371389 () Bool)

(assert (=> b!583575 (=> (not res!371389) (not e!334361))))

(assert (=> b!583575 (= res!371389 (and (= (size!17885 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17885 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17885 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583571 () Bool)

(declare-fun res!371384 () Bool)

(assert (=> b!583571 (=> (not res!371384) (not e!334359))))

(assert (=> b!583571 (= res!371384 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17521 a!2986) j!136) a!2986 mask!3053) (Found!5961 j!136)))))

(declare-fun res!371392 () Bool)

(assert (=> start!53592 (=> (not res!371392) (not e!334361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53592 (= res!371392 (validMask!0 mask!3053))))

(assert (=> start!53592 e!334361))

(assert (=> start!53592 true))

(declare-fun array_inv!13317 (array!36493) Bool)

(assert (=> start!53592 (array_inv!13317 a!2986)))

(declare-fun b!583576 () Bool)

(declare-fun res!371387 () Bool)

(assert (=> b!583576 (=> (not res!371387) (not e!334359))))

(assert (=> b!583576 (= res!371387 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17521 a!2986) index!984) (select (arr!17521 a!2986) j!136))) (not (= (select (arr!17521 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!583577 () Bool)

(declare-fun res!371385 () Bool)

(assert (=> b!583577 (=> (not res!371385) (not e!334361))))

(declare-fun arrayContainsKey!0 (array!36493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583577 (= res!371385 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53592 res!371392) b!583575))

(assert (= (and b!583575 res!371389) b!583566))

(assert (= (and b!583566 res!371386) b!583567))

(assert (= (and b!583567 res!371388) b!583577))

(assert (= (and b!583577 res!371385) b!583568))

(assert (= (and b!583568 res!371383) b!583570))

(assert (= (and b!583570 res!371393) b!583573))

(assert (= (and b!583573 res!371390) b!583574))

(assert (= (and b!583574 res!371391) b!583571))

(assert (= (and b!583571 res!371384) b!583576))

(assert (= (and b!583576 res!371387) b!583572))

(assert (= (and b!583572 res!371382) b!583569))

(declare-fun m!562017 () Bool)

(assert (=> b!583568 m!562017))

(declare-fun m!562019 () Bool)

(assert (=> b!583576 m!562019))

(declare-fun m!562021 () Bool)

(assert (=> b!583576 m!562021))

(assert (=> b!583569 m!562021))

(assert (=> b!583569 m!562021))

(declare-fun m!562023 () Bool)

(assert (=> b!583569 m!562023))

(declare-fun m!562025 () Bool)

(assert (=> b!583570 m!562025))

(declare-fun m!562027 () Bool)

(assert (=> b!583577 m!562027))

(declare-fun m!562029 () Bool)

(assert (=> b!583567 m!562029))

(declare-fun m!562031 () Bool)

(assert (=> b!583574 m!562031))

(declare-fun m!562033 () Bool)

(assert (=> b!583574 m!562033))

(declare-fun m!562035 () Bool)

(assert (=> b!583574 m!562035))

(assert (=> b!583566 m!562021))

(assert (=> b!583566 m!562021))

(declare-fun m!562037 () Bool)

(assert (=> b!583566 m!562037))

(declare-fun m!562039 () Bool)

(assert (=> b!583573 m!562039))

(declare-fun m!562041 () Bool)

(assert (=> start!53592 m!562041))

(declare-fun m!562043 () Bool)

(assert (=> start!53592 m!562043))

(assert (=> b!583571 m!562021))

(assert (=> b!583571 m!562021))

(declare-fun m!562045 () Bool)

(assert (=> b!583571 m!562045))

(declare-fun m!562047 () Bool)

(assert (=> b!583572 m!562047))

(check-sat (not b!583570) (not b!583567) (not b!583568) (not b!583566) (not b!583572) (not b!583569) (not start!53592) (not b!583571) (not b!583573) (not b!583577))
(check-sat)
