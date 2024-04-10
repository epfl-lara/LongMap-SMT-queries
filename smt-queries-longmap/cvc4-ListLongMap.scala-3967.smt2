; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53876 () Bool)

(assert start!53876)

(declare-fun res!375322 () Bool)

(declare-fun e!335695 () Bool)

(assert (=> start!53876 (=> (not res!375322) (not e!335695))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53876 (= res!375322 (validMask!0 mask!3053))))

(assert (=> start!53876 e!335695))

(assert (=> start!53876 true))

(declare-datatypes ((array!36720 0))(
  ( (array!36721 (arr!17633 (Array (_ BitVec 32) (_ BitVec 64))) (size!17997 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36720)

(declare-fun array_inv!13429 (array!36720) Bool)

(assert (=> start!53876 (array_inv!13429 a!2986)))

(declare-fun b!587680 () Bool)

(declare-fun res!375316 () Bool)

(assert (=> b!587680 (=> (not res!375316) (not e!335695))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587680 (= res!375316 (validKeyInArray!0 (select (arr!17633 a!2986) j!136)))))

(declare-fun b!587681 () Bool)

(declare-fun res!375319 () Bool)

(declare-fun e!335697 () Bool)

(assert (=> b!587681 (=> (not res!375319) (not e!335697))))

(declare-datatypes ((List!11674 0))(
  ( (Nil!11671) (Cons!11670 (h!12715 (_ BitVec 64)) (t!17902 List!11674)) )
))
(declare-fun arrayNoDuplicates!0 (array!36720 (_ BitVec 32) List!11674) Bool)

(assert (=> b!587681 (= res!375319 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11671))))

(declare-fun b!587682 () Bool)

(declare-fun res!375324 () Bool)

(assert (=> b!587682 (=> (not res!375324) (not e!335697))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!587682 (= res!375324 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17633 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17633 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587683 () Bool)

(declare-fun res!375317 () Bool)

(assert (=> b!587683 (=> (not res!375317) (not e!335697))))

(declare-datatypes ((SeekEntryResult!6073 0))(
  ( (MissingZero!6073 (index!26522 (_ BitVec 32))) (Found!6073 (index!26523 (_ BitVec 32))) (Intermediate!6073 (undefined!6885 Bool) (index!26524 (_ BitVec 32)) (x!55327 (_ BitVec 32))) (Undefined!6073) (MissingVacant!6073 (index!26525 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36720 (_ BitVec 32)) SeekEntryResult!6073)

(assert (=> b!587683 (= res!375317 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17633 a!2986) j!136) a!2986 mask!3053) (Found!6073 j!136)))))

(declare-fun b!587684 () Bool)

(declare-fun res!375323 () Bool)

(assert (=> b!587684 (=> (not res!375323) (not e!335697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36720 (_ BitVec 32)) Bool)

(assert (=> b!587684 (= res!375323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587685 () Bool)

(assert (=> b!587685 (= e!335697 (not true))))

(declare-fun lt!266466 () (_ BitVec 32))

(assert (=> b!587685 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266466 vacantSpotIndex!68 (select (arr!17633 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266466 vacantSpotIndex!68 (select (store (arr!17633 a!2986) i!1108 k!1786) j!136) (array!36721 (store (arr!17633 a!2986) i!1108 k!1786) (size!17997 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18266 0))(
  ( (Unit!18267) )
))
(declare-fun lt!266465 () Unit!18266)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36720 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18266)

(assert (=> b!587685 (= lt!266465 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266466 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587685 (= lt!266466 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587686 () Bool)

(declare-fun res!375321 () Bool)

(assert (=> b!587686 (=> (not res!375321) (not e!335695))))

(assert (=> b!587686 (= res!375321 (and (= (size!17997 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17997 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17997 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587687 () Bool)

(declare-fun res!375326 () Bool)

(assert (=> b!587687 (=> (not res!375326) (not e!335695))))

(assert (=> b!587687 (= res!375326 (validKeyInArray!0 k!1786))))

(declare-fun b!587688 () Bool)

(assert (=> b!587688 (= e!335695 e!335697)))

(declare-fun res!375318 () Bool)

(assert (=> b!587688 (=> (not res!375318) (not e!335697))))

(declare-fun lt!266467 () SeekEntryResult!6073)

(assert (=> b!587688 (= res!375318 (or (= lt!266467 (MissingZero!6073 i!1108)) (= lt!266467 (MissingVacant!6073 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36720 (_ BitVec 32)) SeekEntryResult!6073)

(assert (=> b!587688 (= lt!266467 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!587689 () Bool)

(declare-fun res!375320 () Bool)

(assert (=> b!587689 (=> (not res!375320) (not e!335695))))

(declare-fun arrayContainsKey!0 (array!36720 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587689 (= res!375320 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587690 () Bool)

(declare-fun res!375325 () Bool)

(assert (=> b!587690 (=> (not res!375325) (not e!335697))))

(assert (=> b!587690 (= res!375325 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17633 a!2986) index!984) (select (arr!17633 a!2986) j!136))) (not (= (select (arr!17633 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!53876 res!375322) b!587686))

(assert (= (and b!587686 res!375321) b!587680))

(assert (= (and b!587680 res!375316) b!587687))

(assert (= (and b!587687 res!375326) b!587689))

(assert (= (and b!587689 res!375320) b!587688))

(assert (= (and b!587688 res!375318) b!587684))

(assert (= (and b!587684 res!375323) b!587681))

(assert (= (and b!587681 res!375319) b!587682))

(assert (= (and b!587682 res!375324) b!587683))

(assert (= (and b!587683 res!375317) b!587690))

(assert (= (and b!587690 res!375325) b!587685))

(declare-fun m!566117 () Bool)

(assert (=> b!587689 m!566117))

(declare-fun m!566119 () Bool)

(assert (=> b!587684 m!566119))

(declare-fun m!566121 () Bool)

(assert (=> b!587681 m!566121))

(declare-fun m!566123 () Bool)

(assert (=> b!587685 m!566123))

(declare-fun m!566125 () Bool)

(assert (=> b!587685 m!566125))

(declare-fun m!566127 () Bool)

(assert (=> b!587685 m!566127))

(declare-fun m!566129 () Bool)

(assert (=> b!587685 m!566129))

(assert (=> b!587685 m!566125))

(declare-fun m!566131 () Bool)

(assert (=> b!587685 m!566131))

(declare-fun m!566133 () Bool)

(assert (=> b!587685 m!566133))

(assert (=> b!587685 m!566127))

(declare-fun m!566135 () Bool)

(assert (=> b!587685 m!566135))

(declare-fun m!566137 () Bool)

(assert (=> b!587682 m!566137))

(assert (=> b!587682 m!566129))

(declare-fun m!566139 () Bool)

(assert (=> b!587682 m!566139))

(assert (=> b!587683 m!566127))

(assert (=> b!587683 m!566127))

(declare-fun m!566141 () Bool)

(assert (=> b!587683 m!566141))

(declare-fun m!566143 () Bool)

(assert (=> b!587687 m!566143))

(declare-fun m!566145 () Bool)

(assert (=> b!587690 m!566145))

(assert (=> b!587690 m!566127))

(declare-fun m!566147 () Bool)

(assert (=> b!587688 m!566147))

(declare-fun m!566149 () Bool)

(assert (=> start!53876 m!566149))

(declare-fun m!566151 () Bool)

(assert (=> start!53876 m!566151))

(assert (=> b!587680 m!566127))

(assert (=> b!587680 m!566127))

(declare-fun m!566153 () Bool)

(assert (=> b!587680 m!566153))

(push 1)

(assert (not start!53876))

(assert (not b!587688))

(assert (not b!587685))

(assert (not b!587684))

(assert (not b!587687))

(assert (not b!587680))

(assert (not b!587681))

(assert (not b!587689))

