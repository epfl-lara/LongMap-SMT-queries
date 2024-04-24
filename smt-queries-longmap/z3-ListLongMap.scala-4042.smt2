; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55176 () Bool)

(assert start!55176)

(declare-fun b!603756 () Bool)

(declare-fun res!387738 () Bool)

(declare-fun e!345414 () Bool)

(assert (=> b!603756 (=> (not res!387738) (not e!345414))))

(declare-datatypes ((array!37194 0))(
  ( (array!37195 (arr!17851 (Array (_ BitVec 32) (_ BitVec 64))) (size!18215 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37194)

(declare-datatypes ((List!11799 0))(
  ( (Nil!11796) (Cons!11795 (h!12843 (_ BitVec 64)) (t!18019 List!11799)) )
))
(declare-fun arrayNoDuplicates!0 (array!37194 (_ BitVec 32) List!11799) Bool)

(assert (=> b!603756 (= res!387738 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11796))))

(declare-fun b!603757 () Bool)

(declare-fun e!345401 () Bool)

(declare-fun e!345400 () Bool)

(assert (=> b!603757 (= e!345401 e!345400)))

(declare-fun res!387732 () Bool)

(assert (=> b!603757 (=> res!387732 e!345400)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!275176 () (_ BitVec 64))

(declare-fun lt!275171 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!603757 (= res!387732 (or (not (= (select (arr!17851 a!2986) j!136) lt!275171)) (not (= (select (arr!17851 a!2986) j!136) lt!275176)) (bvsge j!136 index!984)))))

(declare-fun lt!275166 () array!37194)

(declare-fun e!345411 () Bool)

(declare-fun b!603758 () Bool)

(declare-fun arrayContainsKey!0 (array!37194 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!603758 (= e!345411 (arrayContainsKey!0 lt!275166 (select (arr!17851 a!2986) j!136) index!984))))

(declare-fun b!603759 () Bool)

(declare-fun e!345407 () Bool)

(assert (=> b!603759 (= e!345407 e!345414)))

(declare-fun res!387736 () Bool)

(assert (=> b!603759 (=> (not res!387736) (not e!345414))))

(declare-datatypes ((SeekEntryResult!6247 0))(
  ( (MissingZero!6247 (index!27251 (_ BitVec 32))) (Found!6247 (index!27252 (_ BitVec 32))) (Intermediate!6247 (undefined!7059 Bool) (index!27253 (_ BitVec 32)) (x!56203 (_ BitVec 32))) (Undefined!6247) (MissingVacant!6247 (index!27254 (_ BitVec 32))) )
))
(declare-fun lt!275169 () SeekEntryResult!6247)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!603759 (= res!387736 (or (= lt!275169 (MissingZero!6247 i!1108)) (= lt!275169 (MissingVacant!6247 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37194 (_ BitVec 32)) SeekEntryResult!6247)

(assert (=> b!603759 (= lt!275169 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!603760 () Bool)

(declare-fun e!345412 () Bool)

(declare-fun e!345403 () Bool)

(assert (=> b!603760 (= e!345412 e!345403)))

(declare-fun res!387743 () Bool)

(assert (=> b!603760 (=> (not res!387743) (not e!345403))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!275170 () SeekEntryResult!6247)

(assert (=> b!603760 (= res!387743 (and (= lt!275170 (Found!6247 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17851 a!2986) index!984) (select (arr!17851 a!2986) j!136))) (not (= (select (arr!17851 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37194 (_ BitVec 32)) SeekEntryResult!6247)

(assert (=> b!603760 (= lt!275170 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17851 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!603761 () Bool)

(declare-fun res!387731 () Bool)

(assert (=> b!603761 (=> (not res!387731) (not e!345414))))

(assert (=> b!603761 (= res!387731 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17851 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!387744 () Bool)

(assert (=> start!55176 (=> (not res!387744) (not e!345407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55176 (= res!387744 (validMask!0 mask!3053))))

(assert (=> start!55176 e!345407))

(assert (=> start!55176 true))

(declare-fun array_inv!13710 (array!37194) Bool)

(assert (=> start!55176 (array_inv!13710 a!2986)))

(declare-fun b!603762 () Bool)

(assert (=> b!603762 (= e!345400 e!345411)))

(declare-fun res!387727 () Bool)

(assert (=> b!603762 (=> (not res!387727) (not e!345411))))

(assert (=> b!603762 (= res!387727 (arrayContainsKey!0 lt!275166 (select (arr!17851 a!2986) j!136) j!136))))

(declare-fun b!603763 () Bool)

(declare-fun e!345404 () Bool)

(declare-fun lt!275172 () SeekEntryResult!6247)

(assert (=> b!603763 (= e!345404 (= lt!275170 lt!275172))))

(declare-fun b!603764 () Bool)

(declare-fun res!387730 () Bool)

(assert (=> b!603764 (=> (not res!387730) (not e!345407))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603764 (= res!387730 (validKeyInArray!0 k0!1786))))

(declare-fun b!603765 () Bool)

(declare-fun e!345405 () Bool)

(assert (=> b!603765 (= e!345403 (not e!345405))))

(declare-fun res!387745 () Bool)

(assert (=> b!603765 (=> res!387745 e!345405)))

(declare-fun lt!275179 () SeekEntryResult!6247)

(assert (=> b!603765 (= res!387745 (not (= lt!275179 (Found!6247 index!984))))))

(declare-datatypes ((Unit!19135 0))(
  ( (Unit!19136) )
))
(declare-fun lt!275168 () Unit!19135)

(declare-fun e!345413 () Unit!19135)

(assert (=> b!603765 (= lt!275168 e!345413)))

(declare-fun c!68383 () Bool)

(assert (=> b!603765 (= c!68383 (= lt!275179 Undefined!6247))))

(assert (=> b!603765 (= lt!275179 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275171 lt!275166 mask!3053))))

(assert (=> b!603765 e!345404))

(declare-fun res!387741 () Bool)

(assert (=> b!603765 (=> (not res!387741) (not e!345404))))

(declare-fun lt!275167 () (_ BitVec 32))

(assert (=> b!603765 (= res!387741 (= lt!275172 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275167 vacantSpotIndex!68 lt!275171 lt!275166 mask!3053)))))

(assert (=> b!603765 (= lt!275172 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275167 vacantSpotIndex!68 (select (arr!17851 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!603765 (= lt!275171 (select (store (arr!17851 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!275173 () Unit!19135)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37194 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19135)

(assert (=> b!603765 (= lt!275173 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275167 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603765 (= lt!275167 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!603766 () Bool)

(declare-fun e!345408 () Unit!19135)

(declare-fun Unit!19137 () Unit!19135)

(assert (=> b!603766 (= e!345408 Unit!19137)))

(declare-fun lt!275178 () Unit!19135)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37194 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19135)

(assert (=> b!603766 (= lt!275178 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275166 (select (arr!17851 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!603766 (arrayContainsKey!0 lt!275166 (select (arr!17851 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275174 () Unit!19135)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37194 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11799) Unit!19135)

(assert (=> b!603766 (= lt!275174 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11796))))

(assert (=> b!603766 (arrayNoDuplicates!0 lt!275166 #b00000000000000000000000000000000 Nil!11796)))

(declare-fun lt!275175 () Unit!19135)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37194 (_ BitVec 32) (_ BitVec 32)) Unit!19135)

(assert (=> b!603766 (= lt!275175 (lemmaNoDuplicateFromThenFromBigger!0 lt!275166 #b00000000000000000000000000000000 j!136))))

(assert (=> b!603766 (arrayNoDuplicates!0 lt!275166 j!136 Nil!11796)))

(declare-fun lt!275165 () Unit!19135)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37194 (_ BitVec 64) (_ BitVec 32) List!11799) Unit!19135)

(assert (=> b!603766 (= lt!275165 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275166 (select (arr!17851 a!2986) j!136) j!136 Nil!11796))))

(assert (=> b!603766 false))

(declare-fun b!603767 () Bool)

(declare-fun res!387733 () Bool)

(assert (=> b!603767 (=> (not res!387733) (not e!345407))))

(assert (=> b!603767 (= res!387733 (validKeyInArray!0 (select (arr!17851 a!2986) j!136)))))

(declare-fun b!603768 () Bool)

(declare-fun res!387740 () Bool)

(assert (=> b!603768 (=> (not res!387740) (not e!345414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37194 (_ BitVec 32)) Bool)

(assert (=> b!603768 (= res!387740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!603769 () Bool)

(declare-fun res!387729 () Bool)

(assert (=> b!603769 (=> (not res!387729) (not e!345407))))

(assert (=> b!603769 (= res!387729 (and (= (size!18215 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18215 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18215 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!603770 () Bool)

(declare-fun Unit!19138 () Unit!19135)

(assert (=> b!603770 (= e!345413 Unit!19138)))

(declare-fun b!603771 () Bool)

(declare-fun e!345409 () Bool)

(assert (=> b!603771 (= e!345409 true)))

(declare-fun e!345410 () Bool)

(assert (=> b!603771 e!345410))

(declare-fun res!387737 () Bool)

(assert (=> b!603771 (=> (not res!387737) (not e!345410))))

(assert (=> b!603771 (= res!387737 (arrayContainsKey!0 lt!275166 (select (arr!17851 a!2986) j!136) j!136))))

(declare-fun b!603772 () Bool)

(assert (=> b!603772 (= e!345410 (arrayContainsKey!0 lt!275166 (select (arr!17851 a!2986) j!136) index!984))))

(declare-fun b!603773 () Bool)

(declare-fun e!345406 () Bool)

(assert (=> b!603773 (= e!345406 e!345409)))

(declare-fun res!387739 () Bool)

(assert (=> b!603773 (=> res!387739 e!345409)))

(assert (=> b!603773 (= res!387739 (bvsge index!984 j!136))))

(declare-fun lt!275177 () Unit!19135)

(assert (=> b!603773 (= lt!275177 e!345408)))

(declare-fun c!68384 () Bool)

(assert (=> b!603773 (= c!68384 (bvslt j!136 index!984))))

(declare-fun b!603774 () Bool)

(assert (=> b!603774 (= e!345414 e!345412)))

(declare-fun res!387728 () Bool)

(assert (=> b!603774 (=> (not res!387728) (not e!345412))))

(assert (=> b!603774 (= res!387728 (= (select (store (arr!17851 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!603774 (= lt!275166 (array!37195 (store (arr!17851 a!2986) i!1108 k0!1786) (size!18215 a!2986)))))

(declare-fun b!603775 () Bool)

(assert (=> b!603775 (= e!345405 e!345406)))

(declare-fun res!387734 () Bool)

(assert (=> b!603775 (=> res!387734 e!345406)))

(assert (=> b!603775 (= res!387734 (or (not (= (select (arr!17851 a!2986) j!136) lt!275171)) (not (= (select (arr!17851 a!2986) j!136) lt!275176))))))

(assert (=> b!603775 e!345401))

(declare-fun res!387735 () Bool)

(assert (=> b!603775 (=> (not res!387735) (not e!345401))))

(assert (=> b!603775 (= res!387735 (= lt!275176 (select (arr!17851 a!2986) j!136)))))

(assert (=> b!603775 (= lt!275176 (select (store (arr!17851 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!603776 () Bool)

(declare-fun res!387742 () Bool)

(assert (=> b!603776 (=> (not res!387742) (not e!345407))))

(assert (=> b!603776 (= res!387742 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603777 () Bool)

(declare-fun Unit!19139 () Unit!19135)

(assert (=> b!603777 (= e!345408 Unit!19139)))

(declare-fun b!603778 () Bool)

(declare-fun Unit!19140 () Unit!19135)

(assert (=> b!603778 (= e!345413 Unit!19140)))

(assert (=> b!603778 false))

(assert (= (and start!55176 res!387744) b!603769))

(assert (= (and b!603769 res!387729) b!603767))

(assert (= (and b!603767 res!387733) b!603764))

(assert (= (and b!603764 res!387730) b!603776))

(assert (= (and b!603776 res!387742) b!603759))

(assert (= (and b!603759 res!387736) b!603768))

(assert (= (and b!603768 res!387740) b!603756))

(assert (= (and b!603756 res!387738) b!603761))

(assert (= (and b!603761 res!387731) b!603774))

(assert (= (and b!603774 res!387728) b!603760))

(assert (= (and b!603760 res!387743) b!603765))

(assert (= (and b!603765 res!387741) b!603763))

(assert (= (and b!603765 c!68383) b!603778))

(assert (= (and b!603765 (not c!68383)) b!603770))

(assert (= (and b!603765 (not res!387745)) b!603775))

(assert (= (and b!603775 res!387735) b!603757))

(assert (= (and b!603757 (not res!387732)) b!603762))

(assert (= (and b!603762 res!387727) b!603758))

(assert (= (and b!603775 (not res!387734)) b!603773))

(assert (= (and b!603773 c!68384) b!603766))

(assert (= (and b!603773 (not c!68384)) b!603777))

(assert (= (and b!603773 (not res!387739)) b!603771))

(assert (= (and b!603771 res!387737) b!603772))

(declare-fun m!580997 () Bool)

(assert (=> b!603776 m!580997))

(declare-fun m!580999 () Bool)

(assert (=> b!603760 m!580999))

(declare-fun m!581001 () Bool)

(assert (=> b!603760 m!581001))

(assert (=> b!603760 m!581001))

(declare-fun m!581003 () Bool)

(assert (=> b!603760 m!581003))

(declare-fun m!581005 () Bool)

(assert (=> b!603765 m!581005))

(declare-fun m!581007 () Bool)

(assert (=> b!603765 m!581007))

(declare-fun m!581009 () Bool)

(assert (=> b!603765 m!581009))

(declare-fun m!581011 () Bool)

(assert (=> b!603765 m!581011))

(assert (=> b!603765 m!581001))

(declare-fun m!581013 () Bool)

(assert (=> b!603765 m!581013))

(assert (=> b!603765 m!581001))

(declare-fun m!581015 () Bool)

(assert (=> b!603765 m!581015))

(declare-fun m!581017 () Bool)

(assert (=> b!603765 m!581017))

(assert (=> b!603774 m!581013))

(declare-fun m!581019 () Bool)

(assert (=> b!603774 m!581019))

(declare-fun m!581021 () Bool)

(assert (=> b!603766 m!581021))

(assert (=> b!603766 m!581001))

(assert (=> b!603766 m!581001))

(declare-fun m!581023 () Bool)

(assert (=> b!603766 m!581023))

(declare-fun m!581025 () Bool)

(assert (=> b!603766 m!581025))

(assert (=> b!603766 m!581001))

(declare-fun m!581027 () Bool)

(assert (=> b!603766 m!581027))

(assert (=> b!603766 m!581001))

(declare-fun m!581029 () Bool)

(assert (=> b!603766 m!581029))

(declare-fun m!581031 () Bool)

(assert (=> b!603766 m!581031))

(declare-fun m!581033 () Bool)

(assert (=> b!603766 m!581033))

(assert (=> b!603772 m!581001))

(assert (=> b!603772 m!581001))

(declare-fun m!581035 () Bool)

(assert (=> b!603772 m!581035))

(declare-fun m!581037 () Bool)

(assert (=> start!55176 m!581037))

(declare-fun m!581039 () Bool)

(assert (=> start!55176 m!581039))

(assert (=> b!603762 m!581001))

(assert (=> b!603762 m!581001))

(declare-fun m!581041 () Bool)

(assert (=> b!603762 m!581041))

(assert (=> b!603758 m!581001))

(assert (=> b!603758 m!581001))

(assert (=> b!603758 m!581035))

(assert (=> b!603771 m!581001))

(assert (=> b!603771 m!581001))

(assert (=> b!603771 m!581041))

(declare-fun m!581043 () Bool)

(assert (=> b!603764 m!581043))

(declare-fun m!581045 () Bool)

(assert (=> b!603761 m!581045))

(declare-fun m!581047 () Bool)

(assert (=> b!603768 m!581047))

(declare-fun m!581049 () Bool)

(assert (=> b!603759 m!581049))

(declare-fun m!581051 () Bool)

(assert (=> b!603756 m!581051))

(assert (=> b!603757 m!581001))

(assert (=> b!603767 m!581001))

(assert (=> b!603767 m!581001))

(declare-fun m!581053 () Bool)

(assert (=> b!603767 m!581053))

(assert (=> b!603775 m!581001))

(assert (=> b!603775 m!581013))

(declare-fun m!581055 () Bool)

(assert (=> b!603775 m!581055))

(check-sat (not b!603772) (not start!55176) (not b!603767) (not b!603765) (not b!603758) (not b!603756) (not b!603766) (not b!603759) (not b!603762) (not b!603760) (not b!603776) (not b!603764) (not b!603771) (not b!603768))
(check-sat)
