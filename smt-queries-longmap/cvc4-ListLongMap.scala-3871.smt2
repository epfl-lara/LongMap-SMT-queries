; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53240 () Bool)

(assert start!53240)

(declare-fun b!578753 () Bool)

(declare-fun e!332770 () Bool)

(declare-fun e!332772 () Bool)

(assert (=> b!578753 (= e!332770 e!332772)))

(declare-fun res!366577 () Bool)

(assert (=> b!578753 (=> (not res!366577) (not e!332772))))

(declare-datatypes ((SeekEntryResult!5785 0))(
  ( (MissingZero!5785 (index!25367 (_ BitVec 32))) (Found!5785 (index!25368 (_ BitVec 32))) (Intermediate!5785 (undefined!6597 Bool) (index!25369 (_ BitVec 32)) (x!54262 (_ BitVec 32))) (Undefined!5785) (MissingVacant!5785 (index!25370 (_ BitVec 32))) )
))
(declare-fun lt!264331 () SeekEntryResult!5785)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578753 (= res!366577 (or (= lt!264331 (MissingZero!5785 i!1108)) (= lt!264331 (MissingVacant!5785 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36141 0))(
  ( (array!36142 (arr!17345 (Array (_ BitVec 32) (_ BitVec 64))) (size!17709 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36141)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36141 (_ BitVec 32)) SeekEntryResult!5785)

(assert (=> b!578753 (= lt!264331 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!578754 () Bool)

(declare-fun res!366576 () Bool)

(assert (=> b!578754 (=> (not res!366576) (not e!332772))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36141 (_ BitVec 32)) SeekEntryResult!5785)

(assert (=> b!578754 (= res!366576 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17345 a!2986) j!136) a!2986 mask!3053) (Found!5785 j!136)))))

(declare-fun b!578755 () Bool)

(declare-fun res!366569 () Bool)

(assert (=> b!578755 (=> (not res!366569) (not e!332772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36141 (_ BitVec 32)) Bool)

(assert (=> b!578755 (= res!366569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578756 () Bool)

(declare-fun res!366570 () Bool)

(assert (=> b!578756 (=> (not res!366570) (not e!332770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578756 (= res!366570 (validKeyInArray!0 (select (arr!17345 a!2986) j!136)))))

(declare-fun b!578757 () Bool)

(declare-fun res!366572 () Bool)

(assert (=> b!578757 (=> (not res!366572) (not e!332772))))

(declare-datatypes ((List!11386 0))(
  ( (Nil!11383) (Cons!11382 (h!12427 (_ BitVec 64)) (t!17614 List!11386)) )
))
(declare-fun arrayNoDuplicates!0 (array!36141 (_ BitVec 32) List!11386) Bool)

(assert (=> b!578757 (= res!366572 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11383))))

(declare-fun res!366575 () Bool)

(assert (=> start!53240 (=> (not res!366575) (not e!332770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53240 (= res!366575 (validMask!0 mask!3053))))

(assert (=> start!53240 e!332770))

(assert (=> start!53240 true))

(declare-fun array_inv!13141 (array!36141) Bool)

(assert (=> start!53240 (array_inv!13141 a!2986)))

(declare-fun b!578758 () Bool)

(declare-fun res!366574 () Bool)

(assert (=> b!578758 (=> (not res!366574) (not e!332770))))

(declare-fun arrayContainsKey!0 (array!36141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578758 (= res!366574 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578759 () Bool)

(declare-fun res!366573 () Bool)

(assert (=> b!578759 (=> (not res!366573) (not e!332772))))

(assert (=> b!578759 (= res!366573 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17345 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17345 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578760 () Bool)

(declare-fun res!366578 () Bool)

(assert (=> b!578760 (=> (not res!366578) (not e!332770))))

(assert (=> b!578760 (= res!366578 (validKeyInArray!0 k!1786))))

(declare-fun b!578761 () Bool)

(assert (=> b!578761 (= e!332772 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-fun b!578762 () Bool)

(declare-fun res!366571 () Bool)

(assert (=> b!578762 (=> (not res!366571) (not e!332770))))

(assert (=> b!578762 (= res!366571 (and (= (size!17709 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17709 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17709 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53240 res!366575) b!578762))

(assert (= (and b!578762 res!366571) b!578756))

(assert (= (and b!578756 res!366570) b!578760))

(assert (= (and b!578760 res!366578) b!578758))

(assert (= (and b!578758 res!366574) b!578753))

(assert (= (and b!578753 res!366577) b!578755))

(assert (= (and b!578755 res!366569) b!578757))

(assert (= (and b!578757 res!366572) b!578759))

(assert (= (and b!578759 res!366573) b!578754))

(assert (= (and b!578754 res!366576) b!578761))

(declare-fun m!557399 () Bool)

(assert (=> b!578755 m!557399))

(declare-fun m!557401 () Bool)

(assert (=> b!578756 m!557401))

(assert (=> b!578756 m!557401))

(declare-fun m!557403 () Bool)

(assert (=> b!578756 m!557403))

(declare-fun m!557405 () Bool)

(assert (=> start!53240 m!557405))

(declare-fun m!557407 () Bool)

(assert (=> start!53240 m!557407))

(declare-fun m!557409 () Bool)

(assert (=> b!578758 m!557409))

(declare-fun m!557411 () Bool)

(assert (=> b!578759 m!557411))

(declare-fun m!557413 () Bool)

(assert (=> b!578759 m!557413))

(declare-fun m!557415 () Bool)

(assert (=> b!578759 m!557415))

(declare-fun m!557417 () Bool)

(assert (=> b!578753 m!557417))

(assert (=> b!578754 m!557401))

(assert (=> b!578754 m!557401))

(declare-fun m!557419 () Bool)

(assert (=> b!578754 m!557419))

(declare-fun m!557421 () Bool)

(assert (=> b!578760 m!557421))

(declare-fun m!557423 () Bool)

(assert (=> b!578757 m!557423))

(push 1)

(assert (not b!578758))

(assert (not b!578760))

(assert (not b!578753))

(assert (not b!578757))

(assert (not b!578756))

(assert (not b!578754))

(assert (not start!53240))

(assert (not b!578755))

(check-sat)

