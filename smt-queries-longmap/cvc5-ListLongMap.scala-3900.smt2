; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53410 () Bool)

(assert start!53410)

(declare-fun b!581058 () Bool)

(declare-fun e!333535 () Bool)

(declare-fun e!333537 () Bool)

(assert (=> b!581058 (= e!333535 e!333537)))

(declare-fun res!368879 () Bool)

(assert (=> b!581058 (=> (not res!368879) (not e!333537))))

(declare-datatypes ((SeekEntryResult!5870 0))(
  ( (MissingZero!5870 (index!25707 (_ BitVec 32))) (Found!5870 (index!25708 (_ BitVec 32))) (Intermediate!5870 (undefined!6682 Bool) (index!25709 (_ BitVec 32)) (x!54579 (_ BitVec 32))) (Undefined!5870) (MissingVacant!5870 (index!25710 (_ BitVec 32))) )
))
(declare-fun lt!264832 () SeekEntryResult!5870)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581058 (= res!368879 (or (= lt!264832 (MissingZero!5870 i!1108)) (= lt!264832 (MissingVacant!5870 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!36311 0))(
  ( (array!36312 (arr!17430 (Array (_ BitVec 32) (_ BitVec 64))) (size!17794 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36311)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36311 (_ BitVec 32)) SeekEntryResult!5870)

(assert (=> b!581058 (= lt!264832 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!581059 () Bool)

(declare-fun res!368876 () Bool)

(assert (=> b!581059 (=> (not res!368876) (not e!333537))))

(declare-datatypes ((List!11471 0))(
  ( (Nil!11468) (Cons!11467 (h!12512 (_ BitVec 64)) (t!17699 List!11471)) )
))
(declare-fun arrayNoDuplicates!0 (array!36311 (_ BitVec 32) List!11471) Bool)

(assert (=> b!581059 (= res!368876 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11468))))

(declare-fun b!581060 () Bool)

(declare-fun res!368882 () Bool)

(assert (=> b!581060 (=> (not res!368882) (not e!333535))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!581060 (= res!368882 (and (= (size!17794 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17794 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17794 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!368878 () Bool)

(assert (=> start!53410 (=> (not res!368878) (not e!333535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53410 (= res!368878 (validMask!0 mask!3053))))

(assert (=> start!53410 e!333535))

(assert (=> start!53410 true))

(declare-fun array_inv!13226 (array!36311) Bool)

(assert (=> start!53410 (array_inv!13226 a!2986)))

(declare-fun b!581061 () Bool)

(declare-fun res!368881 () Bool)

(assert (=> b!581061 (=> (not res!368881) (not e!333535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581061 (= res!368881 (validKeyInArray!0 k!1786))))

(declare-fun b!581062 () Bool)

(declare-fun res!368880 () Bool)

(assert (=> b!581062 (=> (not res!368880) (not e!333535))))

(assert (=> b!581062 (= res!368880 (validKeyInArray!0 (select (arr!17430 a!2986) j!136)))))

(declare-fun b!581063 () Bool)

(declare-fun res!368874 () Bool)

(assert (=> b!581063 (=> (not res!368874) (not e!333535))))

(declare-fun arrayContainsKey!0 (array!36311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581063 (= res!368874 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581064 () Bool)

(assert (=> b!581064 (= e!333537 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!264831 () SeekEntryResult!5870)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36311 (_ BitVec 32)) SeekEntryResult!5870)

(assert (=> b!581064 (= lt!264831 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17430 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581065 () Bool)

(declare-fun res!368877 () Bool)

(assert (=> b!581065 (=> (not res!368877) (not e!333537))))

(assert (=> b!581065 (= res!368877 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17430 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17430 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581066 () Bool)

(declare-fun res!368875 () Bool)

(assert (=> b!581066 (=> (not res!368875) (not e!333537))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36311 (_ BitVec 32)) Bool)

(assert (=> b!581066 (= res!368875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53410 res!368878) b!581060))

(assert (= (and b!581060 res!368882) b!581062))

(assert (= (and b!581062 res!368880) b!581061))

(assert (= (and b!581061 res!368881) b!581063))

(assert (= (and b!581063 res!368874) b!581058))

(assert (= (and b!581058 res!368879) b!581066))

(assert (= (and b!581066 res!368875) b!581059))

(assert (= (and b!581059 res!368876) b!581065))

(assert (= (and b!581065 res!368877) b!581064))

(declare-fun m!559615 () Bool)

(assert (=> start!53410 m!559615))

(declare-fun m!559617 () Bool)

(assert (=> start!53410 m!559617))

(declare-fun m!559619 () Bool)

(assert (=> b!581065 m!559619))

(declare-fun m!559621 () Bool)

(assert (=> b!581065 m!559621))

(declare-fun m!559623 () Bool)

(assert (=> b!581065 m!559623))

(declare-fun m!559625 () Bool)

(assert (=> b!581058 m!559625))

(declare-fun m!559627 () Bool)

(assert (=> b!581061 m!559627))

(declare-fun m!559629 () Bool)

(assert (=> b!581064 m!559629))

(assert (=> b!581064 m!559629))

(declare-fun m!559631 () Bool)

(assert (=> b!581064 m!559631))

(declare-fun m!559633 () Bool)

(assert (=> b!581059 m!559633))

(declare-fun m!559635 () Bool)

(assert (=> b!581063 m!559635))

(declare-fun m!559637 () Bool)

(assert (=> b!581066 m!559637))

(assert (=> b!581062 m!559629))

(assert (=> b!581062 m!559629))

(declare-fun m!559639 () Bool)

(assert (=> b!581062 m!559639))

(push 1)

(assert (not b!581062))

(assert (not b!581058))

(assert (not b!581063))

(assert (not b!581061))

(assert (not b!581064))

(assert (not b!581066))

(assert (not b!581059))

(assert (not start!53410))

(check-sat)

