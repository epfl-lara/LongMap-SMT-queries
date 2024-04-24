; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53616 () Bool)

(assert start!53616)

(declare-fun b!583391 () Bool)

(declare-fun res!371103 () Bool)

(declare-fun e!334366 () Bool)

(assert (=> b!583391 (=> (not res!371103) (not e!334366))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36462 0))(
  ( (array!36463 (arr!17503 (Array (_ BitVec 32) (_ BitVec 64))) (size!17867 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36462)

(assert (=> b!583391 (= res!371103 (and (= (size!17867 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17867 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17867 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583393 () Bool)

(declare-fun res!371106 () Bool)

(declare-fun e!334368 () Bool)

(assert (=> b!583393 (=> (not res!371106) (not e!334368))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!583393 (= res!371106 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17503 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17503 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583394 () Bool)

(declare-fun res!371110 () Bool)

(assert (=> b!583394 (=> (not res!371110) (not e!334368))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36462 (_ BitVec 32)) Bool)

(assert (=> b!583394 (= res!371110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583395 () Bool)

(declare-fun res!371108 () Bool)

(assert (=> b!583395 (=> (not res!371108) (not e!334366))))

(declare-fun arrayContainsKey!0 (array!36462 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583395 (= res!371108 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583392 () Bool)

(assert (=> b!583392 (= e!334366 e!334368)))

(declare-fun res!371102 () Bool)

(assert (=> b!583392 (=> (not res!371102) (not e!334368))))

(declare-datatypes ((SeekEntryResult!5899 0))(
  ( (MissingZero!5899 (index!25823 (_ BitVec 32))) (Found!5899 (index!25824 (_ BitVec 32))) (Intermediate!5899 (undefined!6711 Bool) (index!25825 (_ BitVec 32)) (x!54819 (_ BitVec 32))) (Undefined!5899) (MissingVacant!5899 (index!25826 (_ BitVec 32))) )
))
(declare-fun lt!265393 () SeekEntryResult!5899)

(assert (=> b!583392 (= res!371102 (or (= lt!265393 (MissingZero!5899 i!1108)) (= lt!265393 (MissingVacant!5899 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36462 (_ BitVec 32)) SeekEntryResult!5899)

(assert (=> b!583392 (= lt!265393 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!371104 () Bool)

(assert (=> start!53616 (=> (not res!371104) (not e!334366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53616 (= res!371104 (validMask!0 mask!3053))))

(assert (=> start!53616 e!334366))

(assert (=> start!53616 true))

(declare-fun array_inv!13362 (array!36462) Bool)

(assert (=> start!53616 (array_inv!13362 a!2986)))

(declare-fun b!583396 () Bool)

(declare-fun res!371107 () Bool)

(assert (=> b!583396 (=> (not res!371107) (not e!334366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583396 (= res!371107 (validKeyInArray!0 (select (arr!17503 a!2986) j!136)))))

(declare-fun b!583397 () Bool)

(declare-fun res!371105 () Bool)

(assert (=> b!583397 (=> (not res!371105) (not e!334368))))

(declare-datatypes ((List!11451 0))(
  ( (Nil!11448) (Cons!11447 (h!12495 (_ BitVec 64)) (t!17671 List!11451)) )
))
(declare-fun arrayNoDuplicates!0 (array!36462 (_ BitVec 32) List!11451) Bool)

(assert (=> b!583397 (= res!371105 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11448))))

(declare-fun b!583398 () Bool)

(declare-fun res!371109 () Bool)

(assert (=> b!583398 (=> (not res!371109) (not e!334366))))

(assert (=> b!583398 (= res!371109 (validKeyInArray!0 k0!1786))))

(declare-fun b!583399 () Bool)

(assert (=> b!583399 (= e!334368 false)))

(declare-fun lt!265392 () SeekEntryResult!5899)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36462 (_ BitVec 32)) SeekEntryResult!5899)

(assert (=> b!583399 (= lt!265392 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17503 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53616 res!371104) b!583391))

(assert (= (and b!583391 res!371103) b!583396))

(assert (= (and b!583396 res!371107) b!583398))

(assert (= (and b!583398 res!371109) b!583395))

(assert (= (and b!583395 res!371108) b!583392))

(assert (= (and b!583392 res!371102) b!583394))

(assert (= (and b!583394 res!371110) b!583397))

(assert (= (and b!583397 res!371105) b!583393))

(assert (= (and b!583393 res!371106) b!583399))

(declare-fun m!562019 () Bool)

(assert (=> b!583398 m!562019))

(declare-fun m!562021 () Bool)

(assert (=> b!583395 m!562021))

(declare-fun m!562023 () Bool)

(assert (=> start!53616 m!562023))

(declare-fun m!562025 () Bool)

(assert (=> start!53616 m!562025))

(declare-fun m!562027 () Bool)

(assert (=> b!583394 m!562027))

(declare-fun m!562029 () Bool)

(assert (=> b!583396 m!562029))

(assert (=> b!583396 m!562029))

(declare-fun m!562031 () Bool)

(assert (=> b!583396 m!562031))

(assert (=> b!583399 m!562029))

(assert (=> b!583399 m!562029))

(declare-fun m!562033 () Bool)

(assert (=> b!583399 m!562033))

(declare-fun m!562035 () Bool)

(assert (=> b!583397 m!562035))

(declare-fun m!562037 () Bool)

(assert (=> b!583393 m!562037))

(declare-fun m!562039 () Bool)

(assert (=> b!583393 m!562039))

(declare-fun m!562041 () Bool)

(assert (=> b!583393 m!562041))

(declare-fun m!562043 () Bool)

(assert (=> b!583392 m!562043))

(check-sat (not b!583396) (not b!583395) (not start!53616) (not b!583398) (not b!583397) (not b!583394) (not b!583399) (not b!583392))
(check-sat)
