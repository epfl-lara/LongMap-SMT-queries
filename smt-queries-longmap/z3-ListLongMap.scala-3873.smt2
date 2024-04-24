; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53298 () Bool)

(assert start!53298)

(declare-fun b!579062 () Bool)

(declare-fun res!366776 () Bool)

(declare-fun e!332937 () Bool)

(assert (=> b!579062 (=> (not res!366776) (not e!332937))))

(declare-datatypes ((array!36144 0))(
  ( (array!36145 (arr!17344 (Array (_ BitVec 32) (_ BitVec 64))) (size!17708 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36144)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36144 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579062 (= res!366776 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579063 () Bool)

(declare-fun res!366773 () Bool)

(assert (=> b!579063 (=> (not res!366773) (not e!332937))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579063 (= res!366773 (validKeyInArray!0 (select (arr!17344 a!2986) j!136)))))

(declare-fun b!579064 () Bool)

(declare-fun e!332936 () Bool)

(assert (=> b!579064 (= e!332937 e!332936)))

(declare-fun res!366780 () Bool)

(assert (=> b!579064 (=> (not res!366780) (not e!332936))))

(declare-datatypes ((SeekEntryResult!5740 0))(
  ( (MissingZero!5740 (index!25187 (_ BitVec 32))) (Found!5740 (index!25188 (_ BitVec 32))) (Intermediate!5740 (undefined!6552 Bool) (index!25189 (_ BitVec 32)) (x!54236 (_ BitVec 32))) (Undefined!5740) (MissingVacant!5740 (index!25190 (_ BitVec 32))) )
))
(declare-fun lt!264465 () SeekEntryResult!5740)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579064 (= res!366780 (or (= lt!264465 (MissingZero!5740 i!1108)) (= lt!264465 (MissingVacant!5740 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36144 (_ BitVec 32)) SeekEntryResult!5740)

(assert (=> b!579064 (= lt!264465 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579065 () Bool)

(declare-fun res!366781 () Bool)

(assert (=> b!579065 (=> (not res!366781) (not e!332936))))

(declare-datatypes ((List!11292 0))(
  ( (Nil!11289) (Cons!11288 (h!12336 (_ BitVec 64)) (t!17512 List!11292)) )
))
(declare-fun arrayNoDuplicates!0 (array!36144 (_ BitVec 32) List!11292) Bool)

(assert (=> b!579065 (= res!366781 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11289))))

(declare-fun b!579066 () Bool)

(declare-fun res!366774 () Bool)

(assert (=> b!579066 (=> (not res!366774) (not e!332936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36144 (_ BitVec 32)) Bool)

(assert (=> b!579066 (= res!366774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579068 () Bool)

(declare-fun res!366778 () Bool)

(assert (=> b!579068 (=> (not res!366778) (not e!332937))))

(assert (=> b!579068 (= res!366778 (validKeyInArray!0 k0!1786))))

(declare-fun b!579067 () Bool)

(assert (=> b!579067 (= e!332936 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!264466 () SeekEntryResult!5740)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36144 (_ BitVec 32)) SeekEntryResult!5740)

(assert (=> b!579067 (= lt!264466 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17344 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!366777 () Bool)

(assert (=> start!53298 (=> (not res!366777) (not e!332937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53298 (= res!366777 (validMask!0 mask!3053))))

(assert (=> start!53298 e!332937))

(assert (=> start!53298 true))

(declare-fun array_inv!13203 (array!36144) Bool)

(assert (=> start!53298 (array_inv!13203 a!2986)))

(declare-fun b!579069 () Bool)

(declare-fun res!366779 () Bool)

(assert (=> b!579069 (=> (not res!366779) (not e!332936))))

(assert (=> b!579069 (= res!366779 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17344 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17344 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579070 () Bool)

(declare-fun res!366775 () Bool)

(assert (=> b!579070 (=> (not res!366775) (not e!332937))))

(assert (=> b!579070 (= res!366775 (and (= (size!17708 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17708 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17708 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53298 res!366777) b!579070))

(assert (= (and b!579070 res!366775) b!579063))

(assert (= (and b!579063 res!366773) b!579068))

(assert (= (and b!579068 res!366778) b!579062))

(assert (= (and b!579062 res!366776) b!579064))

(assert (= (and b!579064 res!366780) b!579066))

(assert (= (and b!579066 res!366774) b!579065))

(assert (= (and b!579065 res!366781) b!579069))

(assert (= (and b!579069 res!366779) b!579067))

(declare-fun m!557855 () Bool)

(assert (=> b!579066 m!557855))

(declare-fun m!557857 () Bool)

(assert (=> b!579069 m!557857))

(declare-fun m!557859 () Bool)

(assert (=> b!579069 m!557859))

(declare-fun m!557861 () Bool)

(assert (=> b!579069 m!557861))

(declare-fun m!557863 () Bool)

(assert (=> b!579065 m!557863))

(declare-fun m!557865 () Bool)

(assert (=> b!579067 m!557865))

(assert (=> b!579067 m!557865))

(declare-fun m!557867 () Bool)

(assert (=> b!579067 m!557867))

(declare-fun m!557869 () Bool)

(assert (=> b!579068 m!557869))

(declare-fun m!557871 () Bool)

(assert (=> start!53298 m!557871))

(declare-fun m!557873 () Bool)

(assert (=> start!53298 m!557873))

(declare-fun m!557875 () Bool)

(assert (=> b!579064 m!557875))

(declare-fun m!557877 () Bool)

(assert (=> b!579062 m!557877))

(assert (=> b!579063 m!557865))

(assert (=> b!579063 m!557865))

(declare-fun m!557879 () Bool)

(assert (=> b!579063 m!557879))

(check-sat (not b!579062) (not b!579068) (not b!579064) (not b!579063) (not b!579067) (not b!579065) (not start!53298) (not b!579066))
(check-sat)
