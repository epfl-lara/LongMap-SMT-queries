; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53632 () Bool)

(assert start!53632)

(declare-fun b!584286 () Bool)

(declare-fun res!372106 () Bool)

(declare-fun e!334601 () Bool)

(assert (=> b!584286 (=> (not res!372106) (not e!334601))))

(declare-datatypes ((array!36533 0))(
  ( (array!36534 (arr!17541 (Array (_ BitVec 32) (_ BitVec 64))) (size!17905 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36533)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584286 (= res!372106 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584287 () Bool)

(declare-fun e!334600 () Bool)

(assert (=> b!584287 (= e!334601 e!334600)))

(declare-fun res!372102 () Bool)

(assert (=> b!584287 (=> (not res!372102) (not e!334600))))

(declare-datatypes ((SeekEntryResult!5981 0))(
  ( (MissingZero!5981 (index!26151 (_ BitVec 32))) (Found!5981 (index!26152 (_ BitVec 32))) (Intermediate!5981 (undefined!6793 Bool) (index!26153 (_ BitVec 32)) (x!54986 (_ BitVec 32))) (Undefined!5981) (MissingVacant!5981 (index!26154 (_ BitVec 32))) )
))
(declare-fun lt!265537 () SeekEntryResult!5981)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584287 (= res!372102 (or (= lt!265537 (MissingZero!5981 i!1108)) (= lt!265537 (MissingVacant!5981 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36533 (_ BitVec 32)) SeekEntryResult!5981)

(assert (=> b!584287 (= lt!265537 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!584288 () Bool)

(declare-fun res!372107 () Bool)

(assert (=> b!584288 (=> (not res!372107) (not e!334600))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!584288 (= res!372107 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17541 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17541 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!372109 () Bool)

(assert (=> start!53632 (=> (not res!372109) (not e!334601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53632 (= res!372109 (validMask!0 mask!3053))))

(assert (=> start!53632 e!334601))

(assert (=> start!53632 true))

(declare-fun array_inv!13337 (array!36533) Bool)

(assert (=> start!53632 (array_inv!13337 a!2986)))

(declare-fun b!584289 () Bool)

(declare-fun res!372111 () Bool)

(assert (=> b!584289 (=> (not res!372111) (not e!334600))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36533 (_ BitVec 32)) SeekEntryResult!5981)

(assert (=> b!584289 (= res!372111 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17541 a!2986) j!136) a!2986 mask!3053) (Found!5981 j!136)))))

(declare-fun b!584290 () Bool)

(declare-fun res!372103 () Bool)

(assert (=> b!584290 (=> (not res!372103) (not e!334600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36533 (_ BitVec 32)) Bool)

(assert (=> b!584290 (= res!372103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584291 () Bool)

(declare-fun e!334599 () Bool)

(assert (=> b!584291 (= e!334599 false)))

(declare-fun lt!265535 () (_ BitVec 32))

(declare-fun lt!265536 () SeekEntryResult!5981)

(assert (=> b!584291 (= lt!265536 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265535 vacantSpotIndex!68 (select (arr!17541 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584292 () Bool)

(assert (=> b!584292 (= e!334600 e!334599)))

(declare-fun res!372105 () Bool)

(assert (=> b!584292 (=> (not res!372105) (not e!334599))))

(assert (=> b!584292 (= res!372105 (and (bvsge lt!265535 #b00000000000000000000000000000000) (bvslt lt!265535 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584292 (= lt!265535 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584293 () Bool)

(declare-fun res!372110 () Bool)

(assert (=> b!584293 (=> (not res!372110) (not e!334601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584293 (= res!372110 (validKeyInArray!0 (select (arr!17541 a!2986) j!136)))))

(declare-fun b!584294 () Bool)

(declare-fun res!372108 () Bool)

(assert (=> b!584294 (=> (not res!372108) (not e!334600))))

(assert (=> b!584294 (= res!372108 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17541 a!2986) index!984) (select (arr!17541 a!2986) j!136))) (not (= (select (arr!17541 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584295 () Bool)

(declare-fun res!372112 () Bool)

(assert (=> b!584295 (=> (not res!372112) (not e!334600))))

(declare-datatypes ((List!11582 0))(
  ( (Nil!11579) (Cons!11578 (h!12623 (_ BitVec 64)) (t!17810 List!11582)) )
))
(declare-fun arrayNoDuplicates!0 (array!36533 (_ BitVec 32) List!11582) Bool)

(assert (=> b!584295 (= res!372112 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11579))))

(declare-fun b!584296 () Bool)

(declare-fun res!372104 () Bool)

(assert (=> b!584296 (=> (not res!372104) (not e!334601))))

(assert (=> b!584296 (= res!372104 (and (= (size!17905 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17905 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17905 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584297 () Bool)

(declare-fun res!372113 () Bool)

(assert (=> b!584297 (=> (not res!372113) (not e!334601))))

(assert (=> b!584297 (= res!372113 (validKeyInArray!0 k!1786))))

(assert (= (and start!53632 res!372109) b!584296))

(assert (= (and b!584296 res!372104) b!584293))

(assert (= (and b!584293 res!372110) b!584297))

(assert (= (and b!584297 res!372113) b!584286))

(assert (= (and b!584286 res!372106) b!584287))

(assert (= (and b!584287 res!372102) b!584290))

(assert (= (and b!584290 res!372103) b!584295))

(assert (= (and b!584295 res!372112) b!584288))

(assert (= (and b!584288 res!372107) b!584289))

(assert (= (and b!584289 res!372111) b!584294))

(assert (= (and b!584294 res!372108) b!584292))

(assert (= (and b!584292 res!372105) b!584291))

(declare-fun m!562657 () Bool)

(assert (=> b!584292 m!562657))

(declare-fun m!562659 () Bool)

(assert (=> b!584288 m!562659))

(declare-fun m!562661 () Bool)

(assert (=> b!584288 m!562661))

(declare-fun m!562663 () Bool)

(assert (=> b!584288 m!562663))

(declare-fun m!562665 () Bool)

(assert (=> b!584287 m!562665))

(declare-fun m!562667 () Bool)

(assert (=> b!584286 m!562667))

(declare-fun m!562669 () Bool)

(assert (=> b!584295 m!562669))

(declare-fun m!562671 () Bool)

(assert (=> start!53632 m!562671))

(declare-fun m!562673 () Bool)

(assert (=> start!53632 m!562673))

(declare-fun m!562675 () Bool)

(assert (=> b!584291 m!562675))

(assert (=> b!584291 m!562675))

(declare-fun m!562677 () Bool)

(assert (=> b!584291 m!562677))

(declare-fun m!562679 () Bool)

(assert (=> b!584297 m!562679))

(assert (=> b!584293 m!562675))

(assert (=> b!584293 m!562675))

(declare-fun m!562681 () Bool)

(assert (=> b!584293 m!562681))

(assert (=> b!584289 m!562675))

(assert (=> b!584289 m!562675))

(declare-fun m!562683 () Bool)

(assert (=> b!584289 m!562683))

(declare-fun m!562685 () Bool)

(assert (=> b!584290 m!562685))

(declare-fun m!562687 () Bool)

(assert (=> b!584294 m!562687))

(assert (=> b!584294 m!562675))

(push 1)

