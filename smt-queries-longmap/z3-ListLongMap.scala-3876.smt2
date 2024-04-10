; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53268 () Bool)

(assert start!53268)

(declare-fun b!579132 () Bool)

(declare-fun res!366955 () Bool)

(declare-fun e!332896 () Bool)

(assert (=> b!579132 (=> (not res!366955) (not e!332896))))

(declare-datatypes ((array!36169 0))(
  ( (array!36170 (arr!17359 (Array (_ BitVec 32) (_ BitVec 64))) (size!17723 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36169)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579132 (= res!366955 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579133 () Bool)

(declare-fun res!366951 () Bool)

(declare-fun e!332898 () Bool)

(assert (=> b!579133 (=> (not res!366951) (not e!332898))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36169 (_ BitVec 32)) Bool)

(assert (=> b!579133 (= res!366951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579134 () Bool)

(assert (=> b!579134 (= e!332898 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5799 0))(
  ( (MissingZero!5799 (index!25423 (_ BitVec 32))) (Found!5799 (index!25424 (_ BitVec 32))) (Intermediate!5799 (undefined!6611 Bool) (index!25425 (_ BitVec 32)) (x!54316 (_ BitVec 32))) (Undefined!5799) (MissingVacant!5799 (index!25426 (_ BitVec 32))) )
))
(declare-fun lt!264414 () SeekEntryResult!5799)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36169 (_ BitVec 32)) SeekEntryResult!5799)

(assert (=> b!579134 (= lt!264414 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17359 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579135 () Bool)

(assert (=> b!579135 (= e!332896 e!332898)))

(declare-fun res!366952 () Bool)

(assert (=> b!579135 (=> (not res!366952) (not e!332898))))

(declare-fun lt!264415 () SeekEntryResult!5799)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579135 (= res!366952 (or (= lt!264415 (MissingZero!5799 i!1108)) (= lt!264415 (MissingVacant!5799 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36169 (_ BitVec 32)) SeekEntryResult!5799)

(assert (=> b!579135 (= lt!264415 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579136 () Bool)

(declare-fun res!366949 () Bool)

(assert (=> b!579136 (=> (not res!366949) (not e!332896))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579136 (= res!366949 (validKeyInArray!0 k0!1786))))

(declare-fun res!366956 () Bool)

(assert (=> start!53268 (=> (not res!366956) (not e!332896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53268 (= res!366956 (validMask!0 mask!3053))))

(assert (=> start!53268 e!332896))

(assert (=> start!53268 true))

(declare-fun array_inv!13155 (array!36169) Bool)

(assert (=> start!53268 (array_inv!13155 a!2986)))

(declare-fun b!579137 () Bool)

(declare-fun res!366953 () Bool)

(assert (=> b!579137 (=> (not res!366953) (not e!332898))))

(declare-datatypes ((List!11400 0))(
  ( (Nil!11397) (Cons!11396 (h!12441 (_ BitVec 64)) (t!17628 List!11400)) )
))
(declare-fun arrayNoDuplicates!0 (array!36169 (_ BitVec 32) List!11400) Bool)

(assert (=> b!579137 (= res!366953 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11397))))

(declare-fun b!579138 () Bool)

(declare-fun res!366950 () Bool)

(assert (=> b!579138 (=> (not res!366950) (not e!332898))))

(assert (=> b!579138 (= res!366950 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17359 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17359 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579139 () Bool)

(declare-fun res!366954 () Bool)

(assert (=> b!579139 (=> (not res!366954) (not e!332896))))

(assert (=> b!579139 (= res!366954 (validKeyInArray!0 (select (arr!17359 a!2986) j!136)))))

(declare-fun b!579140 () Bool)

(declare-fun res!366948 () Bool)

(assert (=> b!579140 (=> (not res!366948) (not e!332896))))

(assert (=> b!579140 (= res!366948 (and (= (size!17723 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17723 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17723 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53268 res!366956) b!579140))

(assert (= (and b!579140 res!366948) b!579139))

(assert (= (and b!579139 res!366954) b!579136))

(assert (= (and b!579136 res!366949) b!579132))

(assert (= (and b!579132 res!366955) b!579135))

(assert (= (and b!579135 res!366952) b!579133))

(assert (= (and b!579133 res!366951) b!579137))

(assert (= (and b!579137 res!366953) b!579138))

(assert (= (and b!579138 res!366950) b!579134))

(declare-fun m!557763 () Bool)

(assert (=> start!53268 m!557763))

(declare-fun m!557765 () Bool)

(assert (=> start!53268 m!557765))

(declare-fun m!557767 () Bool)

(assert (=> b!579139 m!557767))

(assert (=> b!579139 m!557767))

(declare-fun m!557769 () Bool)

(assert (=> b!579139 m!557769))

(declare-fun m!557771 () Bool)

(assert (=> b!579132 m!557771))

(declare-fun m!557773 () Bool)

(assert (=> b!579136 m!557773))

(declare-fun m!557775 () Bool)

(assert (=> b!579135 m!557775))

(declare-fun m!557777 () Bool)

(assert (=> b!579137 m!557777))

(declare-fun m!557779 () Bool)

(assert (=> b!579133 m!557779))

(declare-fun m!557781 () Bool)

(assert (=> b!579138 m!557781))

(declare-fun m!557783 () Bool)

(assert (=> b!579138 m!557783))

(declare-fun m!557785 () Bool)

(assert (=> b!579138 m!557785))

(assert (=> b!579134 m!557767))

(assert (=> b!579134 m!557767))

(declare-fun m!557787 () Bool)

(assert (=> b!579134 m!557787))

(check-sat (not b!579139) (not b!579136) (not b!579134) (not b!579135) (not b!579137) (not b!579132) (not b!579133) (not start!53268))
