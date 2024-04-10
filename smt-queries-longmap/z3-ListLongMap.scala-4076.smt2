; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55956 () Bool)

(assert start!55956)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!613696 () Bool)

(declare-fun e!351817 () Bool)

(declare-datatypes ((array!37426 0))(
  ( (array!37427 (arr!17959 (Array (_ BitVec 32) (_ BitVec 64))) (size!18323 (_ BitVec 32))) )
))
(declare-fun lt!281345 () array!37426)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37426)

(declare-fun arrayContainsKey!0 (array!37426 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!613696 (= e!351817 (arrayContainsKey!0 lt!281345 (select (arr!17959 a!2986) j!136) index!984))))

(declare-fun b!613697 () Bool)

(declare-fun res!395075 () Bool)

(declare-fun e!351828 () Bool)

(assert (=> b!613697 (=> (not res!395075) (not e!351828))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!613697 (= res!395075 (validKeyInArray!0 (select (arr!17959 a!2986) j!136)))))

(declare-fun b!613698 () Bool)

(declare-fun e!351826 () Bool)

(declare-datatypes ((SeekEntryResult!6399 0))(
  ( (MissingZero!6399 (index!27880 (_ BitVec 32))) (Found!6399 (index!27881 (_ BitVec 32))) (Intermediate!6399 (undefined!7211 Bool) (index!27882 (_ BitVec 32)) (x!56687 (_ BitVec 32))) (Undefined!6399) (MissingVacant!6399 (index!27883 (_ BitVec 32))) )
))
(declare-fun lt!281348 () SeekEntryResult!6399)

(declare-fun lt!281346 () SeekEntryResult!6399)

(assert (=> b!613698 (= e!351826 (= lt!281348 lt!281346))))

(declare-fun b!613699 () Bool)

(declare-fun res!395073 () Bool)

(declare-fun e!351831 () Bool)

(assert (=> b!613699 (=> res!395073 e!351831)))

(declare-datatypes ((List!12000 0))(
  ( (Nil!11997) (Cons!11996 (h!13041 (_ BitVec 64)) (t!18228 List!12000)) )
))
(declare-fun contains!3058 (List!12000 (_ BitVec 64)) Bool)

(assert (=> b!613699 (= res!395073 (contains!3058 Nil!11997 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!613700 () Bool)

(declare-fun res!395076 () Bool)

(assert (=> b!613700 (=> (not res!395076) (not e!351828))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!613700 (= res!395076 (validKeyInArray!0 k0!1786))))

(declare-fun b!613701 () Bool)

(declare-datatypes ((Unit!19774 0))(
  ( (Unit!19775) )
))
(declare-fun e!351816 () Unit!19774)

(declare-fun Unit!19776 () Unit!19774)

(assert (=> b!613701 (= e!351816 Unit!19776)))

(declare-fun b!613702 () Bool)

(declare-fun res!395082 () Bool)

(assert (=> b!613702 (=> (not res!395082) (not e!351828))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!613702 (= res!395082 (and (= (size!18323 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18323 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18323 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!613704 () Bool)

(declare-fun e!351824 () Bool)

(declare-fun e!351827 () Bool)

(assert (=> b!613704 (= e!351824 e!351827)))

(declare-fun res!395066 () Bool)

(assert (=> b!613704 (=> res!395066 e!351827)))

(declare-fun lt!281351 () (_ BitVec 64))

(declare-fun lt!281344 () (_ BitVec 64))

(assert (=> b!613704 (= res!395066 (or (not (= (select (arr!17959 a!2986) j!136) lt!281351)) (not (= (select (arr!17959 a!2986) j!136) lt!281344)) (bvsge j!136 index!984)))))

(declare-fun b!613705 () Bool)

(declare-fun res!395078 () Bool)

(assert (=> b!613705 (=> res!395078 e!351831)))

(declare-fun noDuplicate!361 (List!12000) Bool)

(assert (=> b!613705 (= res!395078 (not (noDuplicate!361 Nil!11997)))))

(declare-fun b!613706 () Bool)

(declare-fun e!351823 () Bool)

(declare-fun e!351822 () Bool)

(assert (=> b!613706 (= e!351823 e!351822)))

(declare-fun res!395074 () Bool)

(assert (=> b!613706 (=> res!395074 e!351822)))

(assert (=> b!613706 (= res!395074 (bvsge index!984 j!136))))

(declare-fun lt!281343 () Unit!19774)

(declare-fun e!351829 () Unit!19774)

(assert (=> b!613706 (= lt!281343 e!351829)))

(declare-fun c!69682 () Bool)

(assert (=> b!613706 (= c!69682 (bvslt j!136 index!984))))

(declare-fun b!613707 () Bool)

(declare-fun res!395080 () Bool)

(declare-fun e!351830 () Bool)

(assert (=> b!613707 (=> (not res!395080) (not e!351830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37426 (_ BitVec 32)) Bool)

(assert (=> b!613707 (= res!395080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!613708 () Bool)

(declare-fun e!351825 () Bool)

(assert (=> b!613708 (= e!351825 e!351823)))

(declare-fun res!395077 () Bool)

(assert (=> b!613708 (=> res!395077 e!351823)))

(assert (=> b!613708 (= res!395077 (or (not (= (select (arr!17959 a!2986) j!136) lt!281351)) (not (= (select (arr!17959 a!2986) j!136) lt!281344))))))

(assert (=> b!613708 e!351824))

(declare-fun res!395081 () Bool)

(assert (=> b!613708 (=> (not res!395081) (not e!351824))))

(assert (=> b!613708 (= res!395081 (= lt!281344 (select (arr!17959 a!2986) j!136)))))

(assert (=> b!613708 (= lt!281344 (select (store (arr!17959 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!613709 () Bool)

(declare-fun e!351821 () Bool)

(assert (=> b!613709 (= e!351830 e!351821)))

(declare-fun res!395085 () Bool)

(assert (=> b!613709 (=> (not res!395085) (not e!351821))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!613709 (= res!395085 (= (select (store (arr!17959 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!613709 (= lt!281345 (array!37427 (store (arr!17959 a!2986) i!1108 k0!1786) (size!18323 a!2986)))))

(declare-fun b!613710 () Bool)

(declare-fun e!351819 () Bool)

(assert (=> b!613710 (= e!351827 e!351819)))

(declare-fun res!395071 () Bool)

(assert (=> b!613710 (=> (not res!395071) (not e!351819))))

(assert (=> b!613710 (= res!395071 (arrayContainsKey!0 lt!281345 (select (arr!17959 a!2986) j!136) j!136))))

(declare-fun b!613711 () Bool)

(assert (=> b!613711 (= e!351819 (arrayContainsKey!0 lt!281345 (select (arr!17959 a!2986) j!136) index!984))))

(declare-fun b!613712 () Bool)

(assert (=> b!613712 (= e!351822 e!351831)))

(declare-fun res!395084 () Bool)

(assert (=> b!613712 (=> res!395084 e!351831)))

(assert (=> b!613712 (= res!395084 (or (bvsge (size!18323 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18323 a!2986)) (bvsge index!984 (size!18323 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!37426 (_ BitVec 32) List!12000) Bool)

(assert (=> b!613712 (arrayNoDuplicates!0 lt!281345 index!984 Nil!11997)))

(declare-fun lt!281349 () Unit!19774)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37426 (_ BitVec 32) (_ BitVec 32)) Unit!19774)

(assert (=> b!613712 (= lt!281349 (lemmaNoDuplicateFromThenFromBigger!0 lt!281345 #b00000000000000000000000000000000 index!984))))

(assert (=> b!613712 (arrayNoDuplicates!0 lt!281345 #b00000000000000000000000000000000 Nil!11997)))

(declare-fun lt!281341 () Unit!19774)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37426 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12000) Unit!19774)

(assert (=> b!613712 (= lt!281341 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11997))))

(assert (=> b!613712 (arrayContainsKey!0 lt!281345 (select (arr!17959 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!281338 () Unit!19774)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37426 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19774)

(assert (=> b!613712 (= lt!281338 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!281345 (select (arr!17959 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!613712 e!351817))

(declare-fun res!395067 () Bool)

(assert (=> b!613712 (=> (not res!395067) (not e!351817))))

(assert (=> b!613712 (= res!395067 (arrayContainsKey!0 lt!281345 (select (arr!17959 a!2986) j!136) j!136))))

(declare-fun b!613713 () Bool)

(declare-fun Unit!19777 () Unit!19774)

(assert (=> b!613713 (= e!351829 Unit!19777)))

(declare-fun res!395087 () Bool)

(assert (=> start!55956 (=> (not res!395087) (not e!351828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55956 (= res!395087 (validMask!0 mask!3053))))

(assert (=> start!55956 e!351828))

(assert (=> start!55956 true))

(declare-fun array_inv!13755 (array!37426) Bool)

(assert (=> start!55956 (array_inv!13755 a!2986)))

(declare-fun b!613703 () Bool)

(declare-fun e!351820 () Bool)

(assert (=> b!613703 (= e!351821 e!351820)))

(declare-fun res!395079 () Bool)

(assert (=> b!613703 (=> (not res!395079) (not e!351820))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!613703 (= res!395079 (and (= lt!281348 (Found!6399 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17959 a!2986) index!984) (select (arr!17959 a!2986) j!136))) (not (= (select (arr!17959 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37426 (_ BitVec 32)) SeekEntryResult!6399)

(assert (=> b!613703 (= lt!281348 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17959 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!613714 () Bool)

(declare-fun res!395072 () Bool)

(assert (=> b!613714 (=> (not res!395072) (not e!351830))))

(assert (=> b!613714 (= res!395072 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17959 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!613715 () Bool)

(declare-fun Unit!19778 () Unit!19774)

(assert (=> b!613715 (= e!351816 Unit!19778)))

(assert (=> b!613715 false))

(declare-fun b!613716 () Bool)

(declare-fun res!395070 () Bool)

(assert (=> b!613716 (=> (not res!395070) (not e!351830))))

(assert (=> b!613716 (= res!395070 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11997))))

(declare-fun b!613717 () Bool)

(assert (=> b!613717 (= e!351820 (not e!351825))))

(declare-fun res!395069 () Bool)

(assert (=> b!613717 (=> res!395069 e!351825)))

(declare-fun lt!281347 () SeekEntryResult!6399)

(assert (=> b!613717 (= res!395069 (not (= lt!281347 (Found!6399 index!984))))))

(declare-fun lt!281353 () Unit!19774)

(assert (=> b!613717 (= lt!281353 e!351816)))

(declare-fun c!69683 () Bool)

(assert (=> b!613717 (= c!69683 (= lt!281347 Undefined!6399))))

(assert (=> b!613717 (= lt!281347 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!281351 lt!281345 mask!3053))))

(assert (=> b!613717 e!351826))

(declare-fun res!395068 () Bool)

(assert (=> b!613717 (=> (not res!395068) (not e!351826))))

(declare-fun lt!281354 () (_ BitVec 32))

(assert (=> b!613717 (= res!395068 (= lt!281346 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!281354 vacantSpotIndex!68 lt!281351 lt!281345 mask!3053)))))

(assert (=> b!613717 (= lt!281346 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!281354 vacantSpotIndex!68 (select (arr!17959 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!613717 (= lt!281351 (select (store (arr!17959 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!281342 () Unit!19774)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37426 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19774)

(assert (=> b!613717 (= lt!281342 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!281354 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!613717 (= lt!281354 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!613718 () Bool)

(assert (=> b!613718 (= e!351831 true)))

(declare-fun lt!281340 () Bool)

(assert (=> b!613718 (= lt!281340 (contains!3058 Nil!11997 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!613719 () Bool)

(declare-fun res!395083 () Bool)

(assert (=> b!613719 (=> (not res!395083) (not e!351828))))

(assert (=> b!613719 (= res!395083 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!613720 () Bool)

(assert (=> b!613720 (= e!351828 e!351830)))

(declare-fun res!395086 () Bool)

(assert (=> b!613720 (=> (not res!395086) (not e!351830))))

(declare-fun lt!281355 () SeekEntryResult!6399)

(assert (=> b!613720 (= res!395086 (or (= lt!281355 (MissingZero!6399 i!1108)) (= lt!281355 (MissingVacant!6399 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37426 (_ BitVec 32)) SeekEntryResult!6399)

(assert (=> b!613720 (= lt!281355 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!613721 () Bool)

(declare-fun Unit!19779 () Unit!19774)

(assert (=> b!613721 (= e!351829 Unit!19779)))

(declare-fun lt!281339 () Unit!19774)

(assert (=> b!613721 (= lt!281339 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!281345 (select (arr!17959 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!613721 (arrayContainsKey!0 lt!281345 (select (arr!17959 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!281352 () Unit!19774)

(assert (=> b!613721 (= lt!281352 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11997))))

(assert (=> b!613721 (arrayNoDuplicates!0 lt!281345 #b00000000000000000000000000000000 Nil!11997)))

(declare-fun lt!281356 () Unit!19774)

(assert (=> b!613721 (= lt!281356 (lemmaNoDuplicateFromThenFromBigger!0 lt!281345 #b00000000000000000000000000000000 j!136))))

(assert (=> b!613721 (arrayNoDuplicates!0 lt!281345 j!136 Nil!11997)))

(declare-fun lt!281350 () Unit!19774)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37426 (_ BitVec 64) (_ BitVec 32) List!12000) Unit!19774)

(assert (=> b!613721 (= lt!281350 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!281345 (select (arr!17959 a!2986) j!136) j!136 Nil!11997))))

(assert (=> b!613721 false))

(assert (= (and start!55956 res!395087) b!613702))

(assert (= (and b!613702 res!395082) b!613697))

(assert (= (and b!613697 res!395075) b!613700))

(assert (= (and b!613700 res!395076) b!613719))

(assert (= (and b!613719 res!395083) b!613720))

(assert (= (and b!613720 res!395086) b!613707))

(assert (= (and b!613707 res!395080) b!613716))

(assert (= (and b!613716 res!395070) b!613714))

(assert (= (and b!613714 res!395072) b!613709))

(assert (= (and b!613709 res!395085) b!613703))

(assert (= (and b!613703 res!395079) b!613717))

(assert (= (and b!613717 res!395068) b!613698))

(assert (= (and b!613717 c!69683) b!613715))

(assert (= (and b!613717 (not c!69683)) b!613701))

(assert (= (and b!613717 (not res!395069)) b!613708))

(assert (= (and b!613708 res!395081) b!613704))

(assert (= (and b!613704 (not res!395066)) b!613710))

(assert (= (and b!613710 res!395071) b!613711))

(assert (= (and b!613708 (not res!395077)) b!613706))

(assert (= (and b!613706 c!69682) b!613721))

(assert (= (and b!613706 (not c!69682)) b!613713))

(assert (= (and b!613706 (not res!395074)) b!613712))

(assert (= (and b!613712 res!395067) b!613696))

(assert (= (and b!613712 (not res!395084)) b!613705))

(assert (= (and b!613705 (not res!395078)) b!613699))

(assert (= (and b!613699 (not res!395073)) b!613718))

(declare-fun m!589969 () Bool)

(assert (=> b!613714 m!589969))

(declare-fun m!589971 () Bool)

(assert (=> b!613719 m!589971))

(declare-fun m!589973 () Bool)

(assert (=> b!613699 m!589973))

(declare-fun m!589975 () Bool)

(assert (=> b!613716 m!589975))

(declare-fun m!589977 () Bool)

(assert (=> b!613712 m!589977))

(declare-fun m!589979 () Bool)

(assert (=> b!613712 m!589979))

(assert (=> b!613712 m!589977))

(assert (=> b!613712 m!589977))

(declare-fun m!589981 () Bool)

(assert (=> b!613712 m!589981))

(declare-fun m!589983 () Bool)

(assert (=> b!613712 m!589983))

(assert (=> b!613712 m!589977))

(declare-fun m!589985 () Bool)

(assert (=> b!613712 m!589985))

(declare-fun m!589987 () Bool)

(assert (=> b!613712 m!589987))

(declare-fun m!589989 () Bool)

(assert (=> b!613712 m!589989))

(declare-fun m!589991 () Bool)

(assert (=> b!613712 m!589991))

(assert (=> b!613696 m!589977))

(assert (=> b!613696 m!589977))

(declare-fun m!589993 () Bool)

(assert (=> b!613696 m!589993))

(declare-fun m!589995 () Bool)

(assert (=> start!55956 m!589995))

(declare-fun m!589997 () Bool)

(assert (=> start!55956 m!589997))

(declare-fun m!589999 () Bool)

(assert (=> b!613718 m!589999))

(declare-fun m!590001 () Bool)

(assert (=> b!613720 m!590001))

(assert (=> b!613711 m!589977))

(assert (=> b!613711 m!589977))

(assert (=> b!613711 m!589993))

(declare-fun m!590003 () Bool)

(assert (=> b!613717 m!590003))

(declare-fun m!590005 () Bool)

(assert (=> b!613717 m!590005))

(declare-fun m!590007 () Bool)

(assert (=> b!613717 m!590007))

(assert (=> b!613717 m!589977))

(declare-fun m!590009 () Bool)

(assert (=> b!613717 m!590009))

(declare-fun m!590011 () Bool)

(assert (=> b!613717 m!590011))

(assert (=> b!613717 m!589977))

(declare-fun m!590013 () Bool)

(assert (=> b!613717 m!590013))

(declare-fun m!590015 () Bool)

(assert (=> b!613717 m!590015))

(declare-fun m!590017 () Bool)

(assert (=> b!613707 m!590017))

(declare-fun m!590019 () Bool)

(assert (=> b!613703 m!590019))

(assert (=> b!613703 m!589977))

(assert (=> b!613703 m!589977))

(declare-fun m!590021 () Bool)

(assert (=> b!613703 m!590021))

(declare-fun m!590023 () Bool)

(assert (=> b!613705 m!590023))

(declare-fun m!590025 () Bool)

(assert (=> b!613700 m!590025))

(assert (=> b!613710 m!589977))

(assert (=> b!613710 m!589977))

(assert (=> b!613710 m!589979))

(assert (=> b!613704 m!589977))

(assert (=> b!613721 m!589977))

(declare-fun m!590027 () Bool)

(assert (=> b!613721 m!590027))

(assert (=> b!613721 m!589977))

(declare-fun m!590029 () Bool)

(assert (=> b!613721 m!590029))

(assert (=> b!613721 m!589977))

(declare-fun m!590031 () Bool)

(assert (=> b!613721 m!590031))

(declare-fun m!590033 () Bool)

(assert (=> b!613721 m!590033))

(assert (=> b!613721 m!589983))

(assert (=> b!613721 m!589977))

(declare-fun m!590035 () Bool)

(assert (=> b!613721 m!590035))

(assert (=> b!613721 m!589991))

(assert (=> b!613709 m!590009))

(declare-fun m!590037 () Bool)

(assert (=> b!613709 m!590037))

(assert (=> b!613708 m!589977))

(assert (=> b!613708 m!590009))

(declare-fun m!590039 () Bool)

(assert (=> b!613708 m!590039))

(assert (=> b!613697 m!589977))

(assert (=> b!613697 m!589977))

(declare-fun m!590041 () Bool)

(assert (=> b!613697 m!590041))

(check-sat (not b!613696) (not b!613705) (not b!613718) (not b!613719) (not start!55956) (not b!613699) (not b!613716) (not b!613697) (not b!613710) (not b!613707) (not b!613700) (not b!613720) (not b!613712) (not b!613717) (not b!613711) (not b!613703) (not b!613721))
(check-sat)
