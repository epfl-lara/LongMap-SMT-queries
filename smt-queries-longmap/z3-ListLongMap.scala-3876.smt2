; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53250 () Bool)

(assert start!53250)

(declare-fun b!578834 () Bool)

(declare-fun e!332715 () Bool)

(assert (=> b!578834 (= e!332715 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5794 0))(
  ( (MissingZero!5794 (index!25403 (_ BitVec 32))) (Found!5794 (index!25404 (_ BitVec 32))) (Intermediate!5794 (undefined!6606 Bool) (index!25405 (_ BitVec 32)) (x!54306 (_ BitVec 32))) (Undefined!5794) (MissingVacant!5794 (index!25406 (_ BitVec 32))) )
))
(declare-fun lt!264174 () SeekEntryResult!5794)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36165 0))(
  ( (array!36166 (arr!17357 (Array (_ BitVec 32) (_ BitVec 64))) (size!17722 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36165)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36165 (_ BitVec 32)) SeekEntryResult!5794)

(assert (=> b!578834 (= lt!264174 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17357 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!578835 () Bool)

(declare-fun res!366792 () Bool)

(declare-fun e!332713 () Bool)

(assert (=> b!578835 (=> (not res!366792) (not e!332713))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578835 (= res!366792 (validKeyInArray!0 (select (arr!17357 a!2986) j!136)))))

(declare-fun b!578837 () Bool)

(declare-fun res!366798 () Bool)

(assert (=> b!578837 (=> (not res!366798) (not e!332713))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!578837 (= res!366798 (validKeyInArray!0 k0!1786))))

(declare-fun b!578838 () Bool)

(declare-fun res!366793 () Bool)

(assert (=> b!578838 (=> (not res!366793) (not e!332715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36165 (_ BitVec 32)) Bool)

(assert (=> b!578838 (= res!366793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578839 () Bool)

(declare-fun res!366797 () Bool)

(assert (=> b!578839 (=> (not res!366797) (not e!332715))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578839 (= res!366797 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17357 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17357 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578840 () Bool)

(assert (=> b!578840 (= e!332713 e!332715)))

(declare-fun res!366795 () Bool)

(assert (=> b!578840 (=> (not res!366795) (not e!332715))))

(declare-fun lt!264175 () SeekEntryResult!5794)

(assert (=> b!578840 (= res!366795 (or (= lt!264175 (MissingZero!5794 i!1108)) (= lt!264175 (MissingVacant!5794 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36165 (_ BitVec 32)) SeekEntryResult!5794)

(assert (=> b!578840 (= lt!264175 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578841 () Bool)

(declare-fun res!366800 () Bool)

(assert (=> b!578841 (=> (not res!366800) (not e!332713))))

(declare-fun arrayContainsKey!0 (array!36165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578841 (= res!366800 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578842 () Bool)

(declare-fun res!366799 () Bool)

(assert (=> b!578842 (=> (not res!366799) (not e!332715))))

(declare-datatypes ((List!11437 0))(
  ( (Nil!11434) (Cons!11433 (h!12478 (_ BitVec 64)) (t!17656 List!11437)) )
))
(declare-fun arrayNoDuplicates!0 (array!36165 (_ BitVec 32) List!11437) Bool)

(assert (=> b!578842 (= res!366799 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11434))))

(declare-fun res!366796 () Bool)

(assert (=> start!53250 (=> (not res!366796) (not e!332713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53250 (= res!366796 (validMask!0 mask!3053))))

(assert (=> start!53250 e!332713))

(assert (=> start!53250 true))

(declare-fun array_inv!13240 (array!36165) Bool)

(assert (=> start!53250 (array_inv!13240 a!2986)))

(declare-fun b!578836 () Bool)

(declare-fun res!366794 () Bool)

(assert (=> b!578836 (=> (not res!366794) (not e!332713))))

(assert (=> b!578836 (= res!366794 (and (= (size!17722 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17722 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17722 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53250 res!366796) b!578836))

(assert (= (and b!578836 res!366794) b!578835))

(assert (= (and b!578835 res!366792) b!578837))

(assert (= (and b!578837 res!366798) b!578841))

(assert (= (and b!578841 res!366800) b!578840))

(assert (= (and b!578840 res!366795) b!578838))

(assert (= (and b!578838 res!366793) b!578842))

(assert (= (and b!578842 res!366799) b!578839))

(assert (= (and b!578839 res!366797) b!578834))

(declare-fun m!556951 () Bool)

(assert (=> b!578840 m!556951))

(declare-fun m!556953 () Bool)

(assert (=> b!578837 m!556953))

(declare-fun m!556955 () Bool)

(assert (=> b!578834 m!556955))

(assert (=> b!578834 m!556955))

(declare-fun m!556957 () Bool)

(assert (=> b!578834 m!556957))

(assert (=> b!578835 m!556955))

(assert (=> b!578835 m!556955))

(declare-fun m!556959 () Bool)

(assert (=> b!578835 m!556959))

(declare-fun m!556961 () Bool)

(assert (=> start!53250 m!556961))

(declare-fun m!556963 () Bool)

(assert (=> start!53250 m!556963))

(declare-fun m!556965 () Bool)

(assert (=> b!578841 m!556965))

(declare-fun m!556967 () Bool)

(assert (=> b!578838 m!556967))

(declare-fun m!556969 () Bool)

(assert (=> b!578842 m!556969))

(declare-fun m!556971 () Bool)

(assert (=> b!578839 m!556971))

(declare-fun m!556973 () Bool)

(assert (=> b!578839 m!556973))

(declare-fun m!556975 () Bool)

(assert (=> b!578839 m!556975))

(check-sat (not b!578835) (not b!578841) (not b!578840) (not b!578837) (not start!53250) (not b!578838) (not b!578834) (not b!578842))
(check-sat)
