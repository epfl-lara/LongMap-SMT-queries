; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53420 () Bool)

(assert start!53420)

(declare-fun b!581193 () Bool)

(declare-fun res!369009 () Bool)

(declare-fun e!333581 () Bool)

(assert (=> b!581193 (=> (not res!369009) (not e!333581))))

(declare-datatypes ((array!36321 0))(
  ( (array!36322 (arr!17435 (Array (_ BitVec 32) (_ BitVec 64))) (size!17799 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36321)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581193 (= res!369009 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581194 () Bool)

(declare-fun res!369013 () Bool)

(declare-fun e!333582 () Bool)

(assert (=> b!581194 (=> (not res!369013) (not e!333582))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36321 (_ BitVec 32)) Bool)

(assert (=> b!581194 (= res!369013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581195 () Bool)

(declare-fun res!369012 () Bool)

(assert (=> b!581195 (=> (not res!369012) (not e!333581))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581195 (= res!369012 (and (= (size!17799 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17799 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17799 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581196 () Bool)

(declare-fun res!369017 () Bool)

(assert (=> b!581196 (=> (not res!369017) (not e!333582))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581196 (= res!369017 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17435 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17435 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!369011 () Bool)

(assert (=> start!53420 (=> (not res!369011) (not e!333581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53420 (= res!369011 (validMask!0 mask!3053))))

(assert (=> start!53420 e!333581))

(assert (=> start!53420 true))

(declare-fun array_inv!13231 (array!36321) Bool)

(assert (=> start!53420 (array_inv!13231 a!2986)))

(declare-fun b!581197 () Bool)

(declare-fun res!369015 () Bool)

(assert (=> b!581197 (=> (not res!369015) (not e!333581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581197 (= res!369015 (validKeyInArray!0 k!1786))))

(declare-fun b!581198 () Bool)

(declare-fun res!369016 () Bool)

(assert (=> b!581198 (=> (not res!369016) (not e!333581))))

(assert (=> b!581198 (= res!369016 (validKeyInArray!0 (select (arr!17435 a!2986) j!136)))))

(declare-fun b!581199 () Bool)

(assert (=> b!581199 (= e!333582 false)))

(declare-datatypes ((SeekEntryResult!5875 0))(
  ( (MissingZero!5875 (index!25727 (_ BitVec 32))) (Found!5875 (index!25728 (_ BitVec 32))) (Intermediate!5875 (undefined!6687 Bool) (index!25729 (_ BitVec 32)) (x!54592 (_ BitVec 32))) (Undefined!5875) (MissingVacant!5875 (index!25730 (_ BitVec 32))) )
))
(declare-fun lt!264861 () SeekEntryResult!5875)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36321 (_ BitVec 32)) SeekEntryResult!5875)

(assert (=> b!581199 (= lt!264861 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17435 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581200 () Bool)

(declare-fun res!369010 () Bool)

(assert (=> b!581200 (=> (not res!369010) (not e!333582))))

(declare-datatypes ((List!11476 0))(
  ( (Nil!11473) (Cons!11472 (h!12517 (_ BitVec 64)) (t!17704 List!11476)) )
))
(declare-fun arrayNoDuplicates!0 (array!36321 (_ BitVec 32) List!11476) Bool)

(assert (=> b!581200 (= res!369010 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11473))))

(declare-fun b!581201 () Bool)

(assert (=> b!581201 (= e!333581 e!333582)))

(declare-fun res!369014 () Bool)

(assert (=> b!581201 (=> (not res!369014) (not e!333582))))

(declare-fun lt!264862 () SeekEntryResult!5875)

(assert (=> b!581201 (= res!369014 (or (= lt!264862 (MissingZero!5875 i!1108)) (= lt!264862 (MissingVacant!5875 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36321 (_ BitVec 32)) SeekEntryResult!5875)

(assert (=> b!581201 (= lt!264862 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53420 res!369011) b!581195))

(assert (= (and b!581195 res!369012) b!581198))

(assert (= (and b!581198 res!369016) b!581197))

(assert (= (and b!581197 res!369015) b!581193))

(assert (= (and b!581193 res!369009) b!581201))

(assert (= (and b!581201 res!369014) b!581194))

(assert (= (and b!581194 res!369013) b!581200))

(assert (= (and b!581200 res!369010) b!581196))

(assert (= (and b!581196 res!369017) b!581199))

(declare-fun m!559745 () Bool)

(assert (=> b!581194 m!559745))

(declare-fun m!559747 () Bool)

(assert (=> b!581193 m!559747))

(declare-fun m!559749 () Bool)

(assert (=> b!581197 m!559749))

(declare-fun m!559751 () Bool)

(assert (=> b!581198 m!559751))

(assert (=> b!581198 m!559751))

(declare-fun m!559753 () Bool)

(assert (=> b!581198 m!559753))

(declare-fun m!559755 () Bool)

(assert (=> start!53420 m!559755))

(declare-fun m!559757 () Bool)

(assert (=> start!53420 m!559757))

(declare-fun m!559759 () Bool)

(assert (=> b!581196 m!559759))

(declare-fun m!559761 () Bool)

(assert (=> b!581196 m!559761))

(declare-fun m!559763 () Bool)

(assert (=> b!581196 m!559763))

(assert (=> b!581199 m!559751))

(assert (=> b!581199 m!559751))

(declare-fun m!559765 () Bool)

(assert (=> b!581199 m!559765))

(declare-fun m!559767 () Bool)

(assert (=> b!581200 m!559767))

(declare-fun m!559769 () Bool)

(assert (=> b!581201 m!559769))

(push 1)

(assert (not b!581198))

(assert (not b!581193))

(assert (not b!581194))

(assert (not b!581201))

(assert (not b!581200))

(assert (not start!53420))

(assert (not b!581199))

