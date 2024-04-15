; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55098 () Bool)

(assert start!55098)

(declare-fun b!602862 () Bool)

(declare-fun res!387168 () Bool)

(declare-fun e!344832 () Bool)

(assert (=> b!602862 (=> (not res!387168) (not e!344832))))

(declare-datatypes ((array!37185 0))(
  ( (array!37186 (arr!17849 (Array (_ BitVec 32) (_ BitVec 64))) (size!18214 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37185)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37185 (_ BitVec 32)) Bool)

(assert (=> b!602862 (= res!387168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!602863 () Bool)

(declare-fun res!387164 () Bool)

(declare-fun e!344830 () Bool)

(assert (=> b!602863 (=> (not res!387164) (not e!344830))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!602863 (= res!387164 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!602865 () Bool)

(declare-fun res!387157 () Bool)

(assert (=> b!602865 (=> (not res!387157) (not e!344830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!602865 (= res!387157 (validKeyInArray!0 k0!1786))))

(declare-fun b!602866 () Bool)

(assert (=> b!602866 (= e!344830 e!344832)))

(declare-fun res!387153 () Bool)

(assert (=> b!602866 (=> (not res!387153) (not e!344832))))

(declare-datatypes ((SeekEntryResult!6286 0))(
  ( (MissingZero!6286 (index!27407 (_ BitVec 32))) (Found!6286 (index!27408 (_ BitVec 32))) (Intermediate!6286 (undefined!7098 Bool) (index!27409 (_ BitVec 32)) (x!56218 (_ BitVec 32))) (Undefined!6286) (MissingVacant!6286 (index!27410 (_ BitVec 32))) )
))
(declare-fun lt!274565 () SeekEntryResult!6286)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!602866 (= res!387153 (or (= lt!274565 (MissingZero!6286 i!1108)) (= lt!274565 (MissingVacant!6286 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37185 (_ BitVec 32)) SeekEntryResult!6286)

(assert (=> b!602866 (= lt!274565 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!602867 () Bool)

(declare-datatypes ((Unit!19098 0))(
  ( (Unit!19099) )
))
(declare-fun e!344837 () Unit!19098)

(declare-fun Unit!19100 () Unit!19098)

(assert (=> b!602867 (= e!344837 Unit!19100)))

(declare-fun b!602868 () Bool)

(declare-fun e!344834 () Unit!19098)

(declare-fun Unit!19101 () Unit!19098)

(assert (=> b!602868 (= e!344834 Unit!19101)))

(declare-fun b!602869 () Bool)

(declare-fun e!344836 () Bool)

(assert (=> b!602869 (= e!344832 e!344836)))

(declare-fun res!387154 () Bool)

(assert (=> b!602869 (=> (not res!387154) (not e!344836))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!602869 (= res!387154 (= (select (store (arr!17849 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!274568 () array!37185)

(assert (=> b!602869 (= lt!274568 (array!37186 (store (arr!17849 a!2986) i!1108 k0!1786) (size!18214 a!2986)))))

(declare-fun b!602870 () Bool)

(declare-fun res!387167 () Bool)

(assert (=> b!602870 (=> (not res!387167) (not e!344830))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!602870 (= res!387167 (validKeyInArray!0 (select (arr!17849 a!2986) j!136)))))

(declare-fun b!602871 () Bool)

(declare-fun e!344831 () Bool)

(declare-fun e!344828 () Bool)

(assert (=> b!602871 (= e!344831 e!344828)))

(declare-fun res!387155 () Bool)

(assert (=> b!602871 (=> res!387155 e!344828)))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!602871 (= res!387155 (bvsge index!984 j!136))))

(declare-fun lt!274570 () Unit!19098)

(assert (=> b!602871 (= lt!274570 e!344834)))

(declare-fun c!68222 () Bool)

(assert (=> b!602871 (= c!68222 (bvslt j!136 index!984))))

(declare-fun b!602872 () Bool)

(declare-fun e!344839 () Bool)

(assert (=> b!602872 (= e!344839 e!344831)))

(declare-fun res!387165 () Bool)

(assert (=> b!602872 (=> res!387165 e!344831)))

(declare-fun lt!274561 () (_ BitVec 64))

(declare-fun lt!274566 () (_ BitVec 64))

(assert (=> b!602872 (= res!387165 (or (not (= (select (arr!17849 a!2986) j!136) lt!274566)) (not (= (select (arr!17849 a!2986) j!136) lt!274561))))))

(declare-fun e!344829 () Bool)

(assert (=> b!602872 e!344829))

(declare-fun res!387162 () Bool)

(assert (=> b!602872 (=> (not res!387162) (not e!344829))))

(assert (=> b!602872 (= res!387162 (= lt!274561 (select (arr!17849 a!2986) j!136)))))

(assert (=> b!602872 (= lt!274561 (select (store (arr!17849 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!602873 () Bool)

(declare-fun e!344841 () Bool)

(assert (=> b!602873 (= e!344841 (arrayContainsKey!0 lt!274568 (select (arr!17849 a!2986) j!136) index!984))))

(declare-fun b!602864 () Bool)

(declare-fun e!344833 () Bool)

(assert (=> b!602864 (= e!344836 e!344833)))

(declare-fun res!387152 () Bool)

(assert (=> b!602864 (=> (not res!387152) (not e!344833))))

(declare-fun lt!274569 () SeekEntryResult!6286)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!602864 (= res!387152 (and (= lt!274569 (Found!6286 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17849 a!2986) index!984) (select (arr!17849 a!2986) j!136))) (not (= (select (arr!17849 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37185 (_ BitVec 32)) SeekEntryResult!6286)

(assert (=> b!602864 (= lt!274569 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17849 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!387160 () Bool)

(assert (=> start!55098 (=> (not res!387160) (not e!344830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55098 (= res!387160 (validMask!0 mask!3053))))

(assert (=> start!55098 e!344830))

(assert (=> start!55098 true))

(declare-fun array_inv!13732 (array!37185) Bool)

(assert (=> start!55098 (array_inv!13732 a!2986)))

(declare-fun b!602874 () Bool)

(assert (=> b!602874 (= e!344828 true)))

(declare-fun e!344840 () Bool)

(assert (=> b!602874 e!344840))

(declare-fun res!387163 () Bool)

(assert (=> b!602874 (=> (not res!387163) (not e!344840))))

(assert (=> b!602874 (= res!387163 (arrayContainsKey!0 lt!274568 (select (arr!17849 a!2986) j!136) j!136))))

(declare-fun b!602875 () Bool)

(declare-fun res!387170 () Bool)

(assert (=> b!602875 (=> (not res!387170) (not e!344832))))

(assert (=> b!602875 (= res!387170 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17849 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!602876 () Bool)

(declare-fun Unit!19102 () Unit!19098)

(assert (=> b!602876 (= e!344837 Unit!19102)))

(assert (=> b!602876 false))

(declare-fun b!602877 () Bool)

(declare-fun res!387169 () Bool)

(assert (=> b!602877 (=> (not res!387169) (not e!344830))))

(assert (=> b!602877 (= res!387169 (and (= (size!18214 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18214 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18214 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!602878 () Bool)

(declare-fun Unit!19103 () Unit!19098)

(assert (=> b!602878 (= e!344834 Unit!19103)))

(declare-fun lt!274572 () Unit!19098)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37185 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19098)

(assert (=> b!602878 (= lt!274572 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274568 (select (arr!17849 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!602878 (arrayContainsKey!0 lt!274568 (select (arr!17849 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274559 () Unit!19098)

(declare-datatypes ((List!11929 0))(
  ( (Nil!11926) (Cons!11925 (h!12970 (_ BitVec 64)) (t!18148 List!11929)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37185 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11929) Unit!19098)

(assert (=> b!602878 (= lt!274559 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11926))))

(declare-fun arrayNoDuplicates!0 (array!37185 (_ BitVec 32) List!11929) Bool)

(assert (=> b!602878 (arrayNoDuplicates!0 lt!274568 #b00000000000000000000000000000000 Nil!11926)))

(declare-fun lt!274563 () Unit!19098)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37185 (_ BitVec 32) (_ BitVec 32)) Unit!19098)

(assert (=> b!602878 (= lt!274563 (lemmaNoDuplicateFromThenFromBigger!0 lt!274568 #b00000000000000000000000000000000 j!136))))

(assert (=> b!602878 (arrayNoDuplicates!0 lt!274568 j!136 Nil!11926)))

(declare-fun lt!274560 () Unit!19098)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37185 (_ BitVec 64) (_ BitVec 32) List!11929) Unit!19098)

(assert (=> b!602878 (= lt!274560 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274568 (select (arr!17849 a!2986) j!136) j!136 Nil!11926))))

(assert (=> b!602878 false))

(declare-fun b!602879 () Bool)

(declare-fun e!344835 () Bool)

(assert (=> b!602879 (= e!344835 e!344841)))

(declare-fun res!387156 () Bool)

(assert (=> b!602879 (=> (not res!387156) (not e!344841))))

(assert (=> b!602879 (= res!387156 (arrayContainsKey!0 lt!274568 (select (arr!17849 a!2986) j!136) j!136))))

(declare-fun b!602880 () Bool)

(declare-fun e!344838 () Bool)

(declare-fun lt!274562 () SeekEntryResult!6286)

(assert (=> b!602880 (= e!344838 (= lt!274569 lt!274562))))

(declare-fun b!602881 () Bool)

(assert (=> b!602881 (= e!344840 (arrayContainsKey!0 lt!274568 (select (arr!17849 a!2986) j!136) index!984))))

(declare-fun b!602882 () Bool)

(assert (=> b!602882 (= e!344829 e!344835)))

(declare-fun res!387166 () Bool)

(assert (=> b!602882 (=> res!387166 e!344835)))

(assert (=> b!602882 (= res!387166 (or (not (= (select (arr!17849 a!2986) j!136) lt!274566)) (not (= (select (arr!17849 a!2986) j!136) lt!274561)) (bvsge j!136 index!984)))))

(declare-fun b!602883 () Bool)

(assert (=> b!602883 (= e!344833 (not e!344839))))

(declare-fun res!387158 () Bool)

(assert (=> b!602883 (=> res!387158 e!344839)))

(declare-fun lt!274564 () SeekEntryResult!6286)

(assert (=> b!602883 (= res!387158 (not (= lt!274564 (Found!6286 index!984))))))

(declare-fun lt!274567 () Unit!19098)

(assert (=> b!602883 (= lt!274567 e!344837)))

(declare-fun c!68223 () Bool)

(assert (=> b!602883 (= c!68223 (= lt!274564 Undefined!6286))))

(assert (=> b!602883 (= lt!274564 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274566 lt!274568 mask!3053))))

(assert (=> b!602883 e!344838))

(declare-fun res!387161 () Bool)

(assert (=> b!602883 (=> (not res!387161) (not e!344838))))

(declare-fun lt!274573 () (_ BitVec 32))

(assert (=> b!602883 (= res!387161 (= lt!274562 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274573 vacantSpotIndex!68 lt!274566 lt!274568 mask!3053)))))

(assert (=> b!602883 (= lt!274562 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274573 vacantSpotIndex!68 (select (arr!17849 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!602883 (= lt!274566 (select (store (arr!17849 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!274571 () Unit!19098)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37185 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19098)

(assert (=> b!602883 (= lt!274571 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274573 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!602883 (= lt!274573 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!602884 () Bool)

(declare-fun res!387159 () Bool)

(assert (=> b!602884 (=> (not res!387159) (not e!344832))))

(assert (=> b!602884 (= res!387159 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11926))))

(assert (= (and start!55098 res!387160) b!602877))

(assert (= (and b!602877 res!387169) b!602870))

(assert (= (and b!602870 res!387167) b!602865))

(assert (= (and b!602865 res!387157) b!602863))

(assert (= (and b!602863 res!387164) b!602866))

(assert (= (and b!602866 res!387153) b!602862))

(assert (= (and b!602862 res!387168) b!602884))

(assert (= (and b!602884 res!387159) b!602875))

(assert (= (and b!602875 res!387170) b!602869))

(assert (= (and b!602869 res!387154) b!602864))

(assert (= (and b!602864 res!387152) b!602883))

(assert (= (and b!602883 res!387161) b!602880))

(assert (= (and b!602883 c!68223) b!602876))

(assert (= (and b!602883 (not c!68223)) b!602867))

(assert (= (and b!602883 (not res!387158)) b!602872))

(assert (= (and b!602872 res!387162) b!602882))

(assert (= (and b!602882 (not res!387166)) b!602879))

(assert (= (and b!602879 res!387156) b!602873))

(assert (= (and b!602872 (not res!387165)) b!602871))

(assert (= (and b!602871 c!68222) b!602878))

(assert (= (and b!602871 (not c!68222)) b!602868))

(assert (= (and b!602871 (not res!387155)) b!602874))

(assert (= (and b!602874 res!387163) b!602881))

(declare-fun m!579421 () Bool)

(assert (=> b!602873 m!579421))

(assert (=> b!602873 m!579421))

(declare-fun m!579423 () Bool)

(assert (=> b!602873 m!579423))

(declare-fun m!579425 () Bool)

(assert (=> b!602869 m!579425))

(declare-fun m!579427 () Bool)

(assert (=> b!602869 m!579427))

(assert (=> b!602872 m!579421))

(assert (=> b!602872 m!579425))

(declare-fun m!579429 () Bool)

(assert (=> b!602872 m!579429))

(declare-fun m!579431 () Bool)

(assert (=> b!602875 m!579431))

(declare-fun m!579433 () Bool)

(assert (=> b!602866 m!579433))

(declare-fun m!579435 () Bool)

(assert (=> b!602862 m!579435))

(assert (=> b!602878 m!579421))

(declare-fun m!579437 () Bool)

(assert (=> b!602878 m!579437))

(declare-fun m!579439 () Bool)

(assert (=> b!602878 m!579439))

(assert (=> b!602878 m!579421))

(declare-fun m!579441 () Bool)

(assert (=> b!602878 m!579441))

(assert (=> b!602878 m!579421))

(declare-fun m!579443 () Bool)

(assert (=> b!602878 m!579443))

(assert (=> b!602878 m!579421))

(declare-fun m!579445 () Bool)

(assert (=> b!602878 m!579445))

(declare-fun m!579447 () Bool)

(assert (=> b!602878 m!579447))

(declare-fun m!579449 () Bool)

(assert (=> b!602878 m!579449))

(declare-fun m!579451 () Bool)

(assert (=> b!602863 m!579451))

(declare-fun m!579453 () Bool)

(assert (=> b!602883 m!579453))

(declare-fun m!579455 () Bool)

(assert (=> b!602883 m!579455))

(assert (=> b!602883 m!579425))

(declare-fun m!579457 () Bool)

(assert (=> b!602883 m!579457))

(declare-fun m!579459 () Bool)

(assert (=> b!602883 m!579459))

(assert (=> b!602883 m!579421))

(declare-fun m!579461 () Bool)

(assert (=> b!602883 m!579461))

(declare-fun m!579463 () Bool)

(assert (=> b!602883 m!579463))

(assert (=> b!602883 m!579421))

(assert (=> b!602870 m!579421))

(assert (=> b!602870 m!579421))

(declare-fun m!579465 () Bool)

(assert (=> b!602870 m!579465))

(assert (=> b!602882 m!579421))

(declare-fun m!579467 () Bool)

(assert (=> b!602865 m!579467))

(assert (=> b!602879 m!579421))

(assert (=> b!602879 m!579421))

(declare-fun m!579469 () Bool)

(assert (=> b!602879 m!579469))

(declare-fun m!579471 () Bool)

(assert (=> b!602884 m!579471))

(assert (=> b!602874 m!579421))

(assert (=> b!602874 m!579421))

(assert (=> b!602874 m!579469))

(declare-fun m!579473 () Bool)

(assert (=> b!602864 m!579473))

(assert (=> b!602864 m!579421))

(assert (=> b!602864 m!579421))

(declare-fun m!579475 () Bool)

(assert (=> b!602864 m!579475))

(assert (=> b!602881 m!579421))

(assert (=> b!602881 m!579421))

(assert (=> b!602881 m!579423))

(declare-fun m!579477 () Bool)

(assert (=> start!55098 m!579477))

(declare-fun m!579479 () Bool)

(assert (=> start!55098 m!579479))

(check-sat (not b!602881) (not b!602884) (not b!602870) (not b!602878) (not b!602862) (not b!602879) (not b!602865) (not b!602873) (not b!602874) (not b!602864) (not b!602866) (not b!602863) (not b!602883) (not start!55098))
(check-sat)
