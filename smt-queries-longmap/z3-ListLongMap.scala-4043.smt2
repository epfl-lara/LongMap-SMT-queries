; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55134 () Bool)

(assert start!55134)

(declare-fun b!603823 () Bool)

(declare-fun e!345459 () Bool)

(declare-fun e!345452 () Bool)

(assert (=> b!603823 (= e!345459 e!345452)))

(declare-fun res!387862 () Bool)

(assert (=> b!603823 (=> (not res!387862) (not e!345452))))

(declare-datatypes ((SeekEntryResult!6300 0))(
  ( (MissingZero!6300 (index!27463 (_ BitVec 32))) (Found!6300 (index!27464 (_ BitVec 32))) (Intermediate!6300 (undefined!7112 Bool) (index!27465 (_ BitVec 32)) (x!56261 (_ BitVec 32))) (Undefined!6300) (MissingVacant!6300 (index!27466 (_ BitVec 32))) )
))
(declare-fun lt!275252 () SeekEntryResult!6300)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!603823 (= res!387862 (or (= lt!275252 (MissingZero!6300 i!1108)) (= lt!275252 (MissingVacant!6300 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37207 0))(
  ( (array!37208 (arr!17860 (Array (_ BitVec 32) (_ BitVec 64))) (size!18224 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37207)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37207 (_ BitVec 32)) SeekEntryResult!6300)

(assert (=> b!603823 (= lt!275252 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!603824 () Bool)

(declare-fun e!345451 () Bool)

(assert (=> b!603824 (= e!345451 true)))

(declare-fun e!345455 () Bool)

(assert (=> b!603824 e!345455))

(declare-fun res!387852 () Bool)

(assert (=> b!603824 (=> (not res!387852) (not e!345455))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!275249 () array!37207)

(declare-fun arrayContainsKey!0 (array!37207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!603824 (= res!387852 (arrayContainsKey!0 lt!275249 (select (arr!17860 a!2986) j!136) j!136))))

(declare-fun b!603825 () Bool)

(declare-datatypes ((Unit!19180 0))(
  ( (Unit!19181) )
))
(declare-fun e!345461 () Unit!19180)

(declare-fun Unit!19182 () Unit!19180)

(assert (=> b!603825 (= e!345461 Unit!19182)))

(declare-fun b!603826 () Bool)

(declare-fun e!345457 () Unit!19180)

(declare-fun Unit!19183 () Unit!19180)

(assert (=> b!603826 (= e!345457 Unit!19183)))

(assert (=> b!603826 false))

(declare-fun res!387860 () Bool)

(assert (=> start!55134 (=> (not res!387860) (not e!345459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55134 (= res!387860 (validMask!0 mask!3053))))

(assert (=> start!55134 e!345459))

(assert (=> start!55134 true))

(declare-fun array_inv!13656 (array!37207) Bool)

(assert (=> start!55134 (array_inv!13656 a!2986)))

(declare-fun b!603827 () Bool)

(declare-fun e!345456 () Bool)

(declare-fun e!345454 () Bool)

(assert (=> b!603827 (= e!345456 e!345454)))

(declare-fun res!387868 () Bool)

(assert (=> b!603827 (=> (not res!387868) (not e!345454))))

(assert (=> b!603827 (= res!387868 (arrayContainsKey!0 lt!275249 (select (arr!17860 a!2986) j!136) j!136))))

(declare-fun b!603828 () Bool)

(declare-fun res!387867 () Bool)

(assert (=> b!603828 (=> (not res!387867) (not e!345459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603828 (= res!387867 (validKeyInArray!0 k0!1786))))

(declare-fun b!603829 () Bool)

(declare-fun e!345465 () Bool)

(assert (=> b!603829 (= e!345465 e!345451)))

(declare-fun res!387861 () Bool)

(assert (=> b!603829 (=> res!387861 e!345451)))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!603829 (= res!387861 (bvsge index!984 j!136))))

(declare-fun lt!275250 () Unit!19180)

(assert (=> b!603829 (= lt!275250 e!345461)))

(declare-fun c!68353 () Bool)

(assert (=> b!603829 (= c!68353 (bvslt j!136 index!984))))

(declare-fun b!603830 () Bool)

(declare-fun e!345464 () Bool)

(declare-fun lt!275245 () SeekEntryResult!6300)

(declare-fun lt!275257 () SeekEntryResult!6300)

(assert (=> b!603830 (= e!345464 (= lt!275245 lt!275257))))

(declare-fun b!603831 () Bool)

(declare-fun res!387859 () Bool)

(assert (=> b!603831 (=> (not res!387859) (not e!345459))))

(assert (=> b!603831 (= res!387859 (validKeyInArray!0 (select (arr!17860 a!2986) j!136)))))

(declare-fun b!603832 () Bool)

(declare-fun res!387869 () Bool)

(assert (=> b!603832 (=> (not res!387869) (not e!345452))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!603832 (= res!387869 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17860 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!603833 () Bool)

(assert (=> b!603833 (= e!345454 (arrayContainsKey!0 lt!275249 (select (arr!17860 a!2986) j!136) index!984))))

(declare-fun b!603834 () Bool)

(declare-fun res!387855 () Bool)

(assert (=> b!603834 (=> (not res!387855) (not e!345452))))

(declare-datatypes ((List!11901 0))(
  ( (Nil!11898) (Cons!11897 (h!12942 (_ BitVec 64)) (t!18129 List!11901)) )
))
(declare-fun arrayNoDuplicates!0 (array!37207 (_ BitVec 32) List!11901) Bool)

(assert (=> b!603834 (= res!387855 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11898))))

(declare-fun b!603835 () Bool)

(declare-fun res!387854 () Bool)

(assert (=> b!603835 (=> (not res!387854) (not e!345459))))

(assert (=> b!603835 (= res!387854 (and (= (size!18224 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18224 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18224 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!603836 () Bool)

(declare-fun Unit!19184 () Unit!19180)

(assert (=> b!603836 (= e!345457 Unit!19184)))

(declare-fun b!603837 () Bool)

(declare-fun e!345453 () Bool)

(assert (=> b!603837 (= e!345452 e!345453)))

(declare-fun res!387857 () Bool)

(assert (=> b!603837 (=> (not res!387857) (not e!345453))))

(assert (=> b!603837 (= res!387857 (= (select (store (arr!17860 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!603837 (= lt!275249 (array!37208 (store (arr!17860 a!2986) i!1108 k0!1786) (size!18224 a!2986)))))

(declare-fun b!603838 () Bool)

(declare-fun e!345460 () Bool)

(declare-fun e!345458 () Bool)

(assert (=> b!603838 (= e!345460 (not e!345458))))

(declare-fun res!387864 () Bool)

(assert (=> b!603838 (=> res!387864 e!345458)))

(declare-fun lt!275251 () SeekEntryResult!6300)

(assert (=> b!603838 (= res!387864 (not (= lt!275251 (Found!6300 index!984))))))

(declare-fun lt!275247 () Unit!19180)

(assert (=> b!603838 (= lt!275247 e!345457)))

(declare-fun c!68354 () Bool)

(assert (=> b!603838 (= c!68354 (= lt!275251 Undefined!6300))))

(declare-fun lt!275246 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37207 (_ BitVec 32)) SeekEntryResult!6300)

(assert (=> b!603838 (= lt!275251 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275246 lt!275249 mask!3053))))

(assert (=> b!603838 e!345464))

(declare-fun res!387858 () Bool)

(assert (=> b!603838 (=> (not res!387858) (not e!345464))))

(declare-fun lt!275248 () (_ BitVec 32))

(assert (=> b!603838 (= res!387858 (= lt!275257 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275248 vacantSpotIndex!68 lt!275246 lt!275249 mask!3053)))))

(assert (=> b!603838 (= lt!275257 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275248 vacantSpotIndex!68 (select (arr!17860 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!603838 (= lt!275246 (select (store (arr!17860 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!275244 () Unit!19180)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37207 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19180)

(assert (=> b!603838 (= lt!275244 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275248 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603838 (= lt!275248 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!603839 () Bool)

(assert (=> b!603839 (= e!345458 e!345465)))

(declare-fun res!387865 () Bool)

(assert (=> b!603839 (=> res!387865 e!345465)))

(declare-fun lt!275256 () (_ BitVec 64))

(assert (=> b!603839 (= res!387865 (or (not (= (select (arr!17860 a!2986) j!136) lt!275246)) (not (= (select (arr!17860 a!2986) j!136) lt!275256))))))

(declare-fun e!345462 () Bool)

(assert (=> b!603839 e!345462))

(declare-fun res!387866 () Bool)

(assert (=> b!603839 (=> (not res!387866) (not e!345462))))

(assert (=> b!603839 (= res!387866 (= lt!275256 (select (arr!17860 a!2986) j!136)))))

(assert (=> b!603839 (= lt!275256 (select (store (arr!17860 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!603840 () Bool)

(assert (=> b!603840 (= e!345455 (arrayContainsKey!0 lt!275249 (select (arr!17860 a!2986) j!136) index!984))))

(declare-fun b!603841 () Bool)

(declare-fun res!387851 () Bool)

(assert (=> b!603841 (=> (not res!387851) (not e!345452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37207 (_ BitVec 32)) Bool)

(assert (=> b!603841 (= res!387851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!603842 () Bool)

(assert (=> b!603842 (= e!345453 e!345460)))

(declare-fun res!387853 () Bool)

(assert (=> b!603842 (=> (not res!387853) (not e!345460))))

(assert (=> b!603842 (= res!387853 (and (= lt!275245 (Found!6300 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17860 a!2986) index!984) (select (arr!17860 a!2986) j!136))) (not (= (select (arr!17860 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!603842 (= lt!275245 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17860 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!603843 () Bool)

(declare-fun Unit!19185 () Unit!19180)

(assert (=> b!603843 (= e!345461 Unit!19185)))

(declare-fun lt!275253 () Unit!19180)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37207 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19180)

(assert (=> b!603843 (= lt!275253 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275249 (select (arr!17860 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!603843 (arrayContainsKey!0 lt!275249 (select (arr!17860 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275243 () Unit!19180)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37207 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11901) Unit!19180)

(assert (=> b!603843 (= lt!275243 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11898))))

(assert (=> b!603843 (arrayNoDuplicates!0 lt!275249 #b00000000000000000000000000000000 Nil!11898)))

(declare-fun lt!275255 () Unit!19180)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37207 (_ BitVec 32) (_ BitVec 32)) Unit!19180)

(assert (=> b!603843 (= lt!275255 (lemmaNoDuplicateFromThenFromBigger!0 lt!275249 #b00000000000000000000000000000000 j!136))))

(assert (=> b!603843 (arrayNoDuplicates!0 lt!275249 j!136 Nil!11898)))

(declare-fun lt!275254 () Unit!19180)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37207 (_ BitVec 64) (_ BitVec 32) List!11901) Unit!19180)

(assert (=> b!603843 (= lt!275254 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275249 (select (arr!17860 a!2986) j!136) j!136 Nil!11898))))

(assert (=> b!603843 false))

(declare-fun b!603844 () Bool)

(declare-fun res!387863 () Bool)

(assert (=> b!603844 (=> (not res!387863) (not e!345459))))

(assert (=> b!603844 (= res!387863 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603845 () Bool)

(assert (=> b!603845 (= e!345462 e!345456)))

(declare-fun res!387856 () Bool)

(assert (=> b!603845 (=> res!387856 e!345456)))

(assert (=> b!603845 (= res!387856 (or (not (= (select (arr!17860 a!2986) j!136) lt!275246)) (not (= (select (arr!17860 a!2986) j!136) lt!275256)) (bvsge j!136 index!984)))))

(assert (= (and start!55134 res!387860) b!603835))

(assert (= (and b!603835 res!387854) b!603831))

(assert (= (and b!603831 res!387859) b!603828))

(assert (= (and b!603828 res!387867) b!603844))

(assert (= (and b!603844 res!387863) b!603823))

(assert (= (and b!603823 res!387862) b!603841))

(assert (= (and b!603841 res!387851) b!603834))

(assert (= (and b!603834 res!387855) b!603832))

(assert (= (and b!603832 res!387869) b!603837))

(assert (= (and b!603837 res!387857) b!603842))

(assert (= (and b!603842 res!387853) b!603838))

(assert (= (and b!603838 res!387858) b!603830))

(assert (= (and b!603838 c!68354) b!603826))

(assert (= (and b!603838 (not c!68354)) b!603836))

(assert (= (and b!603838 (not res!387864)) b!603839))

(assert (= (and b!603839 res!387866) b!603845))

(assert (= (and b!603845 (not res!387856)) b!603827))

(assert (= (and b!603827 res!387868) b!603833))

(assert (= (and b!603839 (not res!387865)) b!603829))

(assert (= (and b!603829 c!68353) b!603843))

(assert (= (and b!603829 (not c!68353)) b!603825))

(assert (= (and b!603829 (not res!387861)) b!603824))

(assert (= (and b!603824 res!387852) b!603840))

(declare-fun m!580793 () Bool)

(assert (=> b!603845 m!580793))

(assert (=> b!603840 m!580793))

(assert (=> b!603840 m!580793))

(declare-fun m!580795 () Bool)

(assert (=> b!603840 m!580795))

(declare-fun m!580797 () Bool)

(assert (=> b!603834 m!580797))

(declare-fun m!580799 () Bool)

(assert (=> b!603828 m!580799))

(assert (=> b!603831 m!580793))

(assert (=> b!603831 m!580793))

(declare-fun m!580801 () Bool)

(assert (=> b!603831 m!580801))

(declare-fun m!580803 () Bool)

(assert (=> b!603844 m!580803))

(assert (=> b!603833 m!580793))

(assert (=> b!603833 m!580793))

(assert (=> b!603833 m!580795))

(declare-fun m!580805 () Bool)

(assert (=> b!603823 m!580805))

(declare-fun m!580807 () Bool)

(assert (=> b!603838 m!580807))

(declare-fun m!580809 () Bool)

(assert (=> b!603838 m!580809))

(assert (=> b!603838 m!580793))

(declare-fun m!580811 () Bool)

(assert (=> b!603838 m!580811))

(declare-fun m!580813 () Bool)

(assert (=> b!603838 m!580813))

(assert (=> b!603838 m!580793))

(declare-fun m!580815 () Bool)

(assert (=> b!603838 m!580815))

(declare-fun m!580817 () Bool)

(assert (=> b!603838 m!580817))

(declare-fun m!580819 () Bool)

(assert (=> b!603838 m!580819))

(assert (=> b!603824 m!580793))

(assert (=> b!603824 m!580793))

(declare-fun m!580821 () Bool)

(assert (=> b!603824 m!580821))

(declare-fun m!580823 () Bool)

(assert (=> start!55134 m!580823))

(declare-fun m!580825 () Bool)

(assert (=> start!55134 m!580825))

(assert (=> b!603843 m!580793))

(declare-fun m!580827 () Bool)

(assert (=> b!603843 m!580827))

(assert (=> b!603843 m!580793))

(assert (=> b!603843 m!580793))

(declare-fun m!580829 () Bool)

(assert (=> b!603843 m!580829))

(declare-fun m!580831 () Bool)

(assert (=> b!603843 m!580831))

(declare-fun m!580833 () Bool)

(assert (=> b!603843 m!580833))

(declare-fun m!580835 () Bool)

(assert (=> b!603843 m!580835))

(declare-fun m!580837 () Bool)

(assert (=> b!603843 m!580837))

(assert (=> b!603843 m!580793))

(declare-fun m!580839 () Bool)

(assert (=> b!603843 m!580839))

(assert (=> b!603839 m!580793))

(assert (=> b!603839 m!580811))

(declare-fun m!580841 () Bool)

(assert (=> b!603839 m!580841))

(declare-fun m!580843 () Bool)

(assert (=> b!603842 m!580843))

(assert (=> b!603842 m!580793))

(assert (=> b!603842 m!580793))

(declare-fun m!580845 () Bool)

(assert (=> b!603842 m!580845))

(declare-fun m!580847 () Bool)

(assert (=> b!603841 m!580847))

(declare-fun m!580849 () Bool)

(assert (=> b!603832 m!580849))

(assert (=> b!603837 m!580811))

(declare-fun m!580851 () Bool)

(assert (=> b!603837 m!580851))

(assert (=> b!603827 m!580793))

(assert (=> b!603827 m!580793))

(assert (=> b!603827 m!580821))

(check-sat (not b!603844) (not b!603841) (not b!603840) (not b!603833) (not b!603834) (not b!603838) (not b!603827) (not b!603823) (not b!603831) (not b!603843) (not b!603828) (not b!603824) (not start!55134) (not b!603842))
(check-sat)
