; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53352 () Bool)

(assert start!53352)

(declare-fun b!580266 () Bool)

(declare-fun res!368083 () Bool)

(declare-fun e!333276 () Bool)

(assert (=> b!580266 (=> (not res!368083) (not e!333276))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36253 0))(
  ( (array!36254 (arr!17401 (Array (_ BitVec 32) (_ BitVec 64))) (size!17765 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36253)

(assert (=> b!580266 (= res!368083 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17401 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17401 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580267 () Bool)

(declare-fun res!368086 () Bool)

(declare-fun e!333275 () Bool)

(assert (=> b!580267 (=> (not res!368086) (not e!333275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580267 (= res!368086 (validKeyInArray!0 k0!1786))))

(declare-fun b!580268 () Bool)

(declare-fun res!368085 () Bool)

(assert (=> b!580268 (=> (not res!368085) (not e!333275))))

(declare-fun arrayContainsKey!0 (array!36253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580268 (= res!368085 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580269 () Bool)

(assert (=> b!580269 (= e!333276 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5841 0))(
  ( (MissingZero!5841 (index!25591 (_ BitVec 32))) (Found!5841 (index!25592 (_ BitVec 32))) (Intermediate!5841 (undefined!6653 Bool) (index!25593 (_ BitVec 32)) (x!54470 (_ BitVec 32))) (Undefined!5841) (MissingVacant!5841 (index!25594 (_ BitVec 32))) )
))
(declare-fun lt!264666 () SeekEntryResult!5841)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36253 (_ BitVec 32)) SeekEntryResult!5841)

(assert (=> b!580269 (= lt!264666 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17401 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580270 () Bool)

(declare-fun res!368084 () Bool)

(assert (=> b!580270 (=> (not res!368084) (not e!333275))))

(assert (=> b!580270 (= res!368084 (validKeyInArray!0 (select (arr!17401 a!2986) j!136)))))

(declare-fun b!580271 () Bool)

(declare-fun res!368090 () Bool)

(assert (=> b!580271 (=> (not res!368090) (not e!333276))))

(declare-datatypes ((List!11442 0))(
  ( (Nil!11439) (Cons!11438 (h!12483 (_ BitVec 64)) (t!17670 List!11442)) )
))
(declare-fun arrayNoDuplicates!0 (array!36253 (_ BitVec 32) List!11442) Bool)

(assert (=> b!580271 (= res!368090 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11439))))

(declare-fun b!580272 () Bool)

(assert (=> b!580272 (= e!333275 e!333276)))

(declare-fun res!368089 () Bool)

(assert (=> b!580272 (=> (not res!368089) (not e!333276))))

(declare-fun lt!264667 () SeekEntryResult!5841)

(assert (=> b!580272 (= res!368089 (or (= lt!264667 (MissingZero!5841 i!1108)) (= lt!264667 (MissingVacant!5841 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36253 (_ BitVec 32)) SeekEntryResult!5841)

(assert (=> b!580272 (= lt!264667 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!368087 () Bool)

(assert (=> start!53352 (=> (not res!368087) (not e!333275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53352 (= res!368087 (validMask!0 mask!3053))))

(assert (=> start!53352 e!333275))

(assert (=> start!53352 true))

(declare-fun array_inv!13197 (array!36253) Bool)

(assert (=> start!53352 (array_inv!13197 a!2986)))

(declare-fun b!580273 () Bool)

(declare-fun res!368088 () Bool)

(assert (=> b!580273 (=> (not res!368088) (not e!333275))))

(assert (=> b!580273 (= res!368088 (and (= (size!17765 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17765 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17765 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580274 () Bool)

(declare-fun res!368082 () Bool)

(assert (=> b!580274 (=> (not res!368082) (not e!333276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36253 (_ BitVec 32)) Bool)

(assert (=> b!580274 (= res!368082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53352 res!368087) b!580273))

(assert (= (and b!580273 res!368088) b!580270))

(assert (= (and b!580270 res!368084) b!580267))

(assert (= (and b!580267 res!368086) b!580268))

(assert (= (and b!580268 res!368085) b!580272))

(assert (= (and b!580272 res!368089) b!580274))

(assert (= (and b!580274 res!368082) b!580271))

(assert (= (and b!580271 res!368090) b!580266))

(assert (= (and b!580266 res!368083) b!580269))

(declare-fun m!558855 () Bool)

(assert (=> b!580272 m!558855))

(declare-fun m!558857 () Bool)

(assert (=> b!580274 m!558857))

(declare-fun m!558859 () Bool)

(assert (=> b!580267 m!558859))

(declare-fun m!558861 () Bool)

(assert (=> b!580268 m!558861))

(declare-fun m!558863 () Bool)

(assert (=> start!53352 m!558863))

(declare-fun m!558865 () Bool)

(assert (=> start!53352 m!558865))

(declare-fun m!558867 () Bool)

(assert (=> b!580266 m!558867))

(declare-fun m!558869 () Bool)

(assert (=> b!580266 m!558869))

(declare-fun m!558871 () Bool)

(assert (=> b!580266 m!558871))

(declare-fun m!558873 () Bool)

(assert (=> b!580269 m!558873))

(assert (=> b!580269 m!558873))

(declare-fun m!558875 () Bool)

(assert (=> b!580269 m!558875))

(assert (=> b!580270 m!558873))

(assert (=> b!580270 m!558873))

(declare-fun m!558877 () Bool)

(assert (=> b!580270 m!558877))

(declare-fun m!558879 () Bool)

(assert (=> b!580271 m!558879))

(check-sat (not b!580272) (not b!580270) (not b!580274) (not b!580271) (not b!580268) (not start!53352) (not b!580269) (not b!580267))
(check-sat)
