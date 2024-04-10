; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53350 () Bool)

(assert start!53350)

(declare-fun b!580239 () Bool)

(declare-fun res!368061 () Bool)

(declare-fun e!333267 () Bool)

(assert (=> b!580239 (=> (not res!368061) (not e!333267))))

(declare-datatypes ((array!36251 0))(
  ( (array!36252 (arr!17400 (Array (_ BitVec 32) (_ BitVec 64))) (size!17764 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36251)

(declare-datatypes ((List!11441 0))(
  ( (Nil!11438) (Cons!11437 (h!12482 (_ BitVec 64)) (t!17669 List!11441)) )
))
(declare-fun arrayNoDuplicates!0 (array!36251 (_ BitVec 32) List!11441) Bool)

(assert (=> b!580239 (= res!368061 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11438))))

(declare-fun b!580240 () Bool)

(declare-fun res!368060 () Bool)

(declare-fun e!333266 () Bool)

(assert (=> b!580240 (=> (not res!368060) (not e!333266))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580240 (= res!368060 (validKeyInArray!0 k!1786))))

(declare-fun b!580241 () Bool)

(declare-fun res!368057 () Bool)

(assert (=> b!580241 (=> (not res!368057) (not e!333267))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!580241 (= res!368057 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17400 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17400 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!368063 () Bool)

(assert (=> start!53350 (=> (not res!368063) (not e!333266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53350 (= res!368063 (validMask!0 mask!3053))))

(assert (=> start!53350 e!333266))

(assert (=> start!53350 true))

(declare-fun array_inv!13196 (array!36251) Bool)

(assert (=> start!53350 (array_inv!13196 a!2986)))

(declare-fun b!580242 () Bool)

(assert (=> b!580242 (= e!333267 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5840 0))(
  ( (MissingZero!5840 (index!25587 (_ BitVec 32))) (Found!5840 (index!25588 (_ BitVec 32))) (Intermediate!5840 (undefined!6652 Bool) (index!25589 (_ BitVec 32)) (x!54469 (_ BitVec 32))) (Undefined!5840) (MissingVacant!5840 (index!25590 (_ BitVec 32))) )
))
(declare-fun lt!264661 () SeekEntryResult!5840)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36251 (_ BitVec 32)) SeekEntryResult!5840)

(assert (=> b!580242 (= lt!264661 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17400 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580243 () Bool)

(assert (=> b!580243 (= e!333266 e!333267)))

(declare-fun res!368062 () Bool)

(assert (=> b!580243 (=> (not res!368062) (not e!333267))))

(declare-fun lt!264660 () SeekEntryResult!5840)

(assert (=> b!580243 (= res!368062 (or (= lt!264660 (MissingZero!5840 i!1108)) (= lt!264660 (MissingVacant!5840 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36251 (_ BitVec 32)) SeekEntryResult!5840)

(assert (=> b!580243 (= lt!264660 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!580244 () Bool)

(declare-fun res!368055 () Bool)

(assert (=> b!580244 (=> (not res!368055) (not e!333266))))

(declare-fun arrayContainsKey!0 (array!36251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580244 (= res!368055 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580245 () Bool)

(declare-fun res!368059 () Bool)

(assert (=> b!580245 (=> (not res!368059) (not e!333266))))

(assert (=> b!580245 (= res!368059 (and (= (size!17764 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17764 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17764 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580246 () Bool)

(declare-fun res!368056 () Bool)

(assert (=> b!580246 (=> (not res!368056) (not e!333267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36251 (_ BitVec 32)) Bool)

(assert (=> b!580246 (= res!368056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580247 () Bool)

(declare-fun res!368058 () Bool)

(assert (=> b!580247 (=> (not res!368058) (not e!333266))))

(assert (=> b!580247 (= res!368058 (validKeyInArray!0 (select (arr!17400 a!2986) j!136)))))

(assert (= (and start!53350 res!368063) b!580245))

(assert (= (and b!580245 res!368059) b!580247))

(assert (= (and b!580247 res!368058) b!580240))

(assert (= (and b!580240 res!368060) b!580244))

(assert (= (and b!580244 res!368055) b!580243))

(assert (= (and b!580243 res!368062) b!580246))

(assert (= (and b!580246 res!368056) b!580239))

(assert (= (and b!580239 res!368061) b!580241))

(assert (= (and b!580241 res!368057) b!580242))

(declare-fun m!558829 () Bool)

(assert (=> start!53350 m!558829))

(declare-fun m!558831 () Bool)

(assert (=> start!53350 m!558831))

(declare-fun m!558833 () Bool)

(assert (=> b!580243 m!558833))

(declare-fun m!558835 () Bool)

(assert (=> b!580244 m!558835))

(declare-fun m!558837 () Bool)

(assert (=> b!580239 m!558837))

(declare-fun m!558839 () Bool)

(assert (=> b!580247 m!558839))

(assert (=> b!580247 m!558839))

(declare-fun m!558841 () Bool)

(assert (=> b!580247 m!558841))

(declare-fun m!558843 () Bool)

(assert (=> b!580240 m!558843))

(declare-fun m!558845 () Bool)

(assert (=> b!580246 m!558845))

(assert (=> b!580242 m!558839))

(assert (=> b!580242 m!558839))

(declare-fun m!558847 () Bool)

(assert (=> b!580242 m!558847))

(declare-fun m!558849 () Bool)

(assert (=> b!580241 m!558849))

(declare-fun m!558851 () Bool)

(assert (=> b!580241 m!558851))

(declare-fun m!558853 () Bool)

(assert (=> b!580241 m!558853))

(push 1)

