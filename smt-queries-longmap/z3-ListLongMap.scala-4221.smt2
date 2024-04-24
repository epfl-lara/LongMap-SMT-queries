; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57978 () Bool)

(assert start!57978)

(declare-fun b!640825 () Bool)

(declare-fun res!414973 () Bool)

(declare-fun e!366859 () Bool)

(assert (=> b!640825 (=> (not res!414973) (not e!366859))))

(declare-datatypes ((array!38343 0))(
  ( (array!38344 (arr!18388 (Array (_ BitVec 32) (_ BitVec 64))) (size!18752 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38343)

(declare-datatypes ((List!12336 0))(
  ( (Nil!12333) (Cons!12332 (h!13380 (_ BitVec 64)) (t!18556 List!12336)) )
))
(declare-fun arrayNoDuplicates!0 (array!38343 (_ BitVec 32) List!12336) Bool)

(assert (=> b!640825 (= res!414973 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12333))))

(declare-fun b!640826 () Bool)

(declare-fun res!414976 () Bool)

(assert (=> b!640826 (=> (not res!414976) (not e!366859))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!640826 (= res!414976 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18388 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!640827 () Bool)

(declare-fun res!414969 () Bool)

(declare-fun e!366853 () Bool)

(assert (=> b!640827 (=> (not res!414969) (not e!366853))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!640827 (= res!414969 (validKeyInArray!0 (select (arr!18388 a!2986) j!136)))))

(declare-fun b!640828 () Bool)

(declare-fun res!414967 () Bool)

(assert (=> b!640828 (=> (not res!414967) (not e!366859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38343 (_ BitVec 32)) Bool)

(assert (=> b!640828 (= res!414967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!640829 () Bool)

(declare-fun res!414974 () Bool)

(assert (=> b!640829 (=> (not res!414974) (not e!366853))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!640829 (= res!414974 (and (= (size!18752 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18752 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18752 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!640830 () Bool)

(declare-fun e!366857 () Bool)

(declare-fun e!366861 () Bool)

(assert (=> b!640830 (= e!366857 e!366861)))

(declare-fun res!414960 () Bool)

(assert (=> b!640830 (=> (not res!414960) (not e!366861))))

(declare-fun lt!296615 () array!38343)

(declare-fun arrayContainsKey!0 (array!38343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!640830 (= res!414960 (arrayContainsKey!0 lt!296615 (select (arr!18388 a!2986) j!136) j!136))))

(declare-fun res!414963 () Bool)

(assert (=> start!57978 (=> (not res!414963) (not e!366853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57978 (= res!414963 (validMask!0 mask!3053))))

(assert (=> start!57978 e!366853))

(assert (=> start!57978 true))

(declare-fun array_inv!14247 (array!38343) Bool)

(assert (=> start!57978 (array_inv!14247 a!2986)))

(declare-fun b!640831 () Bool)

(declare-fun e!366850 () Bool)

(assert (=> b!640831 (= e!366850 e!366857)))

(declare-fun res!414968 () Bool)

(assert (=> b!640831 (=> res!414968 e!366857)))

(declare-fun lt!296616 () (_ BitVec 64))

(declare-fun lt!296617 () (_ BitVec 64))

(assert (=> b!640831 (= res!414968 (or (not (= (select (arr!18388 a!2986) j!136) lt!296617)) (not (= (select (arr!18388 a!2986) j!136) lt!296616)) (bvsge j!136 index!984)))))

(declare-fun b!640832 () Bool)

(declare-datatypes ((Unit!21645 0))(
  ( (Unit!21646) )
))
(declare-fun e!366858 () Unit!21645)

(declare-fun Unit!21647 () Unit!21645)

(assert (=> b!640832 (= e!366858 Unit!21647)))

(assert (=> b!640832 false))

(declare-fun b!640833 () Bool)

(declare-fun e!366852 () Bool)

(declare-fun e!366851 () Bool)

(assert (=> b!640833 (= e!366852 e!366851)))

(declare-fun res!414962 () Bool)

(assert (=> b!640833 (=> (not res!414962) (not e!366851))))

(declare-datatypes ((SeekEntryResult!6784 0))(
  ( (MissingZero!6784 (index!29456 (_ BitVec 32))) (Found!6784 (index!29457 (_ BitVec 32))) (Intermediate!6784 (undefined!7596 Bool) (index!29458 (_ BitVec 32)) (x!58367 (_ BitVec 32))) (Undefined!6784) (MissingVacant!6784 (index!29459 (_ BitVec 32))) )
))
(declare-fun lt!296608 () SeekEntryResult!6784)

(assert (=> b!640833 (= res!414962 (and (= lt!296608 (Found!6784 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18388 a!2986) index!984) (select (arr!18388 a!2986) j!136))) (not (= (select (arr!18388 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38343 (_ BitVec 32)) SeekEntryResult!6784)

(assert (=> b!640833 (= lt!296608 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18388 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640834 () Bool)

(declare-fun Unit!21648 () Unit!21645)

(assert (=> b!640834 (= e!366858 Unit!21648)))

(declare-fun b!640835 () Bool)

(declare-fun res!414965 () Bool)

(assert (=> b!640835 (=> (not res!414965) (not e!366853))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!640835 (= res!414965 (validKeyInArray!0 k0!1786))))

(declare-fun b!640836 () Bool)

(declare-fun e!366860 () Bool)

(assert (=> b!640836 (= e!366860 (or (bvsge (size!18752 a!2986) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 j!136) (size!18752 a!2986))))))

(assert (=> b!640836 (arrayNoDuplicates!0 lt!296615 j!136 Nil!12333)))

(declare-fun lt!296606 () Unit!21645)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38343 (_ BitVec 32) (_ BitVec 32)) Unit!21645)

(assert (=> b!640836 (= lt!296606 (lemmaNoDuplicateFromThenFromBigger!0 lt!296615 #b00000000000000000000000000000000 j!136))))

(assert (=> b!640836 (arrayNoDuplicates!0 lt!296615 #b00000000000000000000000000000000 Nil!12333)))

(declare-fun lt!296609 () Unit!21645)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38343 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12336) Unit!21645)

(assert (=> b!640836 (= lt!296609 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12333))))

(assert (=> b!640836 (arrayContainsKey!0 lt!296615 (select (arr!18388 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296612 () Unit!21645)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38343 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21645)

(assert (=> b!640836 (= lt!296612 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296615 (select (arr!18388 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!640837 () Bool)

(declare-fun e!366854 () Bool)

(assert (=> b!640837 (= e!366851 (not e!366854))))

(declare-fun res!414964 () Bool)

(assert (=> b!640837 (=> res!414964 e!366854)))

(declare-fun lt!296610 () SeekEntryResult!6784)

(assert (=> b!640837 (= res!414964 (not (= lt!296610 (Found!6784 index!984))))))

(declare-fun lt!296605 () Unit!21645)

(assert (=> b!640837 (= lt!296605 e!366858)))

(declare-fun c!73301 () Bool)

(assert (=> b!640837 (= c!73301 (= lt!296610 Undefined!6784))))

(assert (=> b!640837 (= lt!296610 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296617 lt!296615 mask!3053))))

(declare-fun e!366856 () Bool)

(assert (=> b!640837 e!366856))

(declare-fun res!414970 () Bool)

(assert (=> b!640837 (=> (not res!414970) (not e!366856))))

(declare-fun lt!296611 () (_ BitVec 32))

(declare-fun lt!296607 () SeekEntryResult!6784)

(assert (=> b!640837 (= res!414970 (= lt!296607 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296611 vacantSpotIndex!68 lt!296617 lt!296615 mask!3053)))))

(assert (=> b!640837 (= lt!296607 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296611 vacantSpotIndex!68 (select (arr!18388 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!640837 (= lt!296617 (select (store (arr!18388 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!296614 () Unit!21645)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38343 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21645)

(assert (=> b!640837 (= lt!296614 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296611 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!640837 (= lt!296611 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!640838 () Bool)

(assert (=> b!640838 (= e!366859 e!366852)))

(declare-fun res!414971 () Bool)

(assert (=> b!640838 (=> (not res!414971) (not e!366852))))

(assert (=> b!640838 (= res!414971 (= (select (store (arr!18388 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!640838 (= lt!296615 (array!38344 (store (arr!18388 a!2986) i!1108 k0!1786) (size!18752 a!2986)))))

(declare-fun b!640839 () Bool)

(assert (=> b!640839 (= e!366853 e!366859)))

(declare-fun res!414961 () Bool)

(assert (=> b!640839 (=> (not res!414961) (not e!366859))))

(declare-fun lt!296613 () SeekEntryResult!6784)

(assert (=> b!640839 (= res!414961 (or (= lt!296613 (MissingZero!6784 i!1108)) (= lt!296613 (MissingVacant!6784 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38343 (_ BitVec 32)) SeekEntryResult!6784)

(assert (=> b!640839 (= lt!296613 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!640840 () Bool)

(assert (=> b!640840 (= e!366861 (arrayContainsKey!0 lt!296615 (select (arr!18388 a!2986) j!136) index!984))))

(declare-fun b!640841 () Bool)

(assert (=> b!640841 (= e!366854 e!366860)))

(declare-fun res!414975 () Bool)

(assert (=> b!640841 (=> res!414975 e!366860)))

(assert (=> b!640841 (= res!414975 (or (not (= (select (arr!18388 a!2986) j!136) lt!296617)) (not (= (select (arr!18388 a!2986) j!136) lt!296616)) (bvsge j!136 index!984)))))

(assert (=> b!640841 e!366850))

(declare-fun res!414972 () Bool)

(assert (=> b!640841 (=> (not res!414972) (not e!366850))))

(assert (=> b!640841 (= res!414972 (= lt!296616 (select (arr!18388 a!2986) j!136)))))

(assert (=> b!640841 (= lt!296616 (select (store (arr!18388 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!640842 () Bool)

(declare-fun res!414966 () Bool)

(assert (=> b!640842 (=> (not res!414966) (not e!366853))))

(assert (=> b!640842 (= res!414966 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!640843 () Bool)

(assert (=> b!640843 (= e!366856 (= lt!296608 lt!296607))))

(assert (= (and start!57978 res!414963) b!640829))

(assert (= (and b!640829 res!414974) b!640827))

(assert (= (and b!640827 res!414969) b!640835))

(assert (= (and b!640835 res!414965) b!640842))

(assert (= (and b!640842 res!414966) b!640839))

(assert (= (and b!640839 res!414961) b!640828))

(assert (= (and b!640828 res!414967) b!640825))

(assert (= (and b!640825 res!414973) b!640826))

(assert (= (and b!640826 res!414976) b!640838))

(assert (= (and b!640838 res!414971) b!640833))

(assert (= (and b!640833 res!414962) b!640837))

(assert (= (and b!640837 res!414970) b!640843))

(assert (= (and b!640837 c!73301) b!640832))

(assert (= (and b!640837 (not c!73301)) b!640834))

(assert (= (and b!640837 (not res!414964)) b!640841))

(assert (= (and b!640841 res!414972) b!640831))

(assert (= (and b!640831 (not res!414968)) b!640830))

(assert (= (and b!640830 res!414960) b!640840))

(assert (= (and b!640841 (not res!414975)) b!640836))

(declare-fun m!615037 () Bool)

(assert (=> b!640837 m!615037))

(declare-fun m!615039 () Bool)

(assert (=> b!640837 m!615039))

(declare-fun m!615041 () Bool)

(assert (=> b!640837 m!615041))

(declare-fun m!615043 () Bool)

(assert (=> b!640837 m!615043))

(declare-fun m!615045 () Bool)

(assert (=> b!640837 m!615045))

(assert (=> b!640837 m!615043))

(declare-fun m!615047 () Bool)

(assert (=> b!640837 m!615047))

(declare-fun m!615049 () Bool)

(assert (=> b!640837 m!615049))

(declare-fun m!615051 () Bool)

(assert (=> b!640837 m!615051))

(declare-fun m!615053 () Bool)

(assert (=> b!640826 m!615053))

(assert (=> b!640841 m!615043))

(assert (=> b!640841 m!615045))

(declare-fun m!615055 () Bool)

(assert (=> b!640841 m!615055))

(declare-fun m!615057 () Bool)

(assert (=> start!57978 m!615057))

(declare-fun m!615059 () Bool)

(assert (=> start!57978 m!615059))

(declare-fun m!615061 () Bool)

(assert (=> b!640828 m!615061))

(assert (=> b!640830 m!615043))

(assert (=> b!640830 m!615043))

(declare-fun m!615063 () Bool)

(assert (=> b!640830 m!615063))

(declare-fun m!615065 () Bool)

(assert (=> b!640835 m!615065))

(declare-fun m!615067 () Bool)

(assert (=> b!640833 m!615067))

(assert (=> b!640833 m!615043))

(assert (=> b!640833 m!615043))

(declare-fun m!615069 () Bool)

(assert (=> b!640833 m!615069))

(assert (=> b!640831 m!615043))

(declare-fun m!615071 () Bool)

(assert (=> b!640825 m!615071))

(assert (=> b!640827 m!615043))

(assert (=> b!640827 m!615043))

(declare-fun m!615073 () Bool)

(assert (=> b!640827 m!615073))

(assert (=> b!640840 m!615043))

(assert (=> b!640840 m!615043))

(declare-fun m!615075 () Bool)

(assert (=> b!640840 m!615075))

(assert (=> b!640838 m!615045))

(declare-fun m!615077 () Bool)

(assert (=> b!640838 m!615077))

(declare-fun m!615079 () Bool)

(assert (=> b!640842 m!615079))

(declare-fun m!615081 () Bool)

(assert (=> b!640839 m!615081))

(assert (=> b!640836 m!615043))

(declare-fun m!615083 () Bool)

(assert (=> b!640836 m!615083))

(assert (=> b!640836 m!615043))

(declare-fun m!615085 () Bool)

(assert (=> b!640836 m!615085))

(assert (=> b!640836 m!615043))

(declare-fun m!615087 () Bool)

(assert (=> b!640836 m!615087))

(declare-fun m!615089 () Bool)

(assert (=> b!640836 m!615089))

(declare-fun m!615091 () Bool)

(assert (=> b!640836 m!615091))

(declare-fun m!615093 () Bool)

(assert (=> b!640836 m!615093))

(check-sat (not b!640839) (not b!640827) (not b!640836) (not b!640837) (not start!57978) (not b!640830) (not b!640828) (not b!640840) (not b!640842) (not b!640835) (not b!640833) (not b!640825))
(check-sat)
