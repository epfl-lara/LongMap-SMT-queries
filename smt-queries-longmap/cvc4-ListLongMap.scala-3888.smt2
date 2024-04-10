; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53342 () Bool)

(assert start!53342)

(declare-fun b!580131 () Bool)

(declare-fun e!333231 () Bool)

(declare-fun e!333230 () Bool)

(assert (=> b!580131 (= e!333231 e!333230)))

(declare-fun res!367947 () Bool)

(assert (=> b!580131 (=> (not res!367947) (not e!333230))))

(declare-datatypes ((SeekEntryResult!5836 0))(
  ( (MissingZero!5836 (index!25571 (_ BitVec 32))) (Found!5836 (index!25572 (_ BitVec 32))) (Intermediate!5836 (undefined!6648 Bool) (index!25573 (_ BitVec 32)) (x!54449 (_ BitVec 32))) (Undefined!5836) (MissingVacant!5836 (index!25574 (_ BitVec 32))) )
))
(declare-fun lt!264636 () SeekEntryResult!5836)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580131 (= res!367947 (or (= lt!264636 (MissingZero!5836 i!1108)) (= lt!264636 (MissingVacant!5836 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36243 0))(
  ( (array!36244 (arr!17396 (Array (_ BitVec 32) (_ BitVec 64))) (size!17760 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36243)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36243 (_ BitVec 32)) SeekEntryResult!5836)

(assert (=> b!580131 (= lt!264636 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!580132 () Bool)

(declare-fun res!367954 () Bool)

(assert (=> b!580132 (=> (not res!367954) (not e!333231))))

(declare-fun arrayContainsKey!0 (array!36243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580132 (= res!367954 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580133 () Bool)

(declare-fun res!367950 () Bool)

(assert (=> b!580133 (=> (not res!367950) (not e!333231))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580133 (= res!367950 (validKeyInArray!0 k!1786))))

(declare-fun b!580134 () Bool)

(declare-fun res!367953 () Bool)

(assert (=> b!580134 (=> (not res!367953) (not e!333231))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!580134 (= res!367953 (and (= (size!17760 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17760 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17760 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!367952 () Bool)

(assert (=> start!53342 (=> (not res!367952) (not e!333231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53342 (= res!367952 (validMask!0 mask!3053))))

(assert (=> start!53342 e!333231))

(assert (=> start!53342 true))

(declare-fun array_inv!13192 (array!36243) Bool)

(assert (=> start!53342 (array_inv!13192 a!2986)))

(declare-fun b!580135 () Bool)

(declare-fun res!367951 () Bool)

(assert (=> b!580135 (=> (not res!367951) (not e!333230))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!580135 (= res!367951 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17396 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17396 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580136 () Bool)

(declare-fun res!367949 () Bool)

(assert (=> b!580136 (=> (not res!367949) (not e!333230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36243 (_ BitVec 32)) Bool)

(assert (=> b!580136 (= res!367949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580137 () Bool)

(declare-fun res!367948 () Bool)

(assert (=> b!580137 (=> (not res!367948) (not e!333230))))

(declare-datatypes ((List!11437 0))(
  ( (Nil!11434) (Cons!11433 (h!12478 (_ BitVec 64)) (t!17665 List!11437)) )
))
(declare-fun arrayNoDuplicates!0 (array!36243 (_ BitVec 32) List!11437) Bool)

(assert (=> b!580137 (= res!367948 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11434))))

(declare-fun b!580138 () Bool)

(declare-fun res!367955 () Bool)

(assert (=> b!580138 (=> (not res!367955) (not e!333231))))

(assert (=> b!580138 (= res!367955 (validKeyInArray!0 (select (arr!17396 a!2986) j!136)))))

(declare-fun b!580139 () Bool)

(assert (=> b!580139 (= e!333230 false)))

(declare-fun lt!264637 () SeekEntryResult!5836)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36243 (_ BitVec 32)) SeekEntryResult!5836)

(assert (=> b!580139 (= lt!264637 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17396 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53342 res!367952) b!580134))

(assert (= (and b!580134 res!367953) b!580138))

(assert (= (and b!580138 res!367955) b!580133))

(assert (= (and b!580133 res!367950) b!580132))

(assert (= (and b!580132 res!367954) b!580131))

(assert (= (and b!580131 res!367947) b!580136))

(assert (= (and b!580136 res!367949) b!580137))

(assert (= (and b!580137 res!367948) b!580135))

(assert (= (and b!580135 res!367951) b!580139))

(declare-fun m!558725 () Bool)

(assert (=> start!53342 m!558725))

(declare-fun m!558727 () Bool)

(assert (=> start!53342 m!558727))

(declare-fun m!558729 () Bool)

(assert (=> b!580136 m!558729))

(declare-fun m!558731 () Bool)

(assert (=> b!580132 m!558731))

(declare-fun m!558733 () Bool)

(assert (=> b!580133 m!558733))

(declare-fun m!558735 () Bool)

(assert (=> b!580137 m!558735))

(declare-fun m!558737 () Bool)

(assert (=> b!580138 m!558737))

(assert (=> b!580138 m!558737))

(declare-fun m!558739 () Bool)

(assert (=> b!580138 m!558739))

(assert (=> b!580139 m!558737))

(assert (=> b!580139 m!558737))

(declare-fun m!558741 () Bool)

(assert (=> b!580139 m!558741))

(declare-fun m!558743 () Bool)

(assert (=> b!580131 m!558743))

(declare-fun m!558745 () Bool)

(assert (=> b!580135 m!558745))

(declare-fun m!558747 () Bool)

(assert (=> b!580135 m!558747))

(declare-fun m!558749 () Bool)

(assert (=> b!580135 m!558749))

(push 1)

(assert (not b!580138))

(assert (not b!580133))

(assert (not start!53342))

(assert (not b!580139))

(assert (not b!580132))

(assert (not b!580137))

(assert (not b!580131))

(assert (not b!580136))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

